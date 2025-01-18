::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This Windows batch file compiles all packages available in OPM and adds    ::
:: the OPM entry names package names to a log file (log.txt).                 :: 
::                                                                            ::
:: * Create a local repository first, i.e. use the OPM function to create a   ::
::   private repository, and copy all zip files from packages.lazarus-ide.org ::
::   in this directory. In this batch, this directory is specified in the     ::
::   variable ZipDir.                                                         ::
:: * Create a directory, at the same level as the local repository, for the   ::
::   the output (unzipped packages)                                           ::
:: * Copy this batch file into this directory.                                ::
:: * Adjust the path of the Lazarus installation to be used for compilation   ::
::   of the packages.                                                         ::
::                                                                            ::
:: Running the test                                                           ::
:: * cd into the directory with the batch file and the unzipped packages      ::
:: * "run_test" to test all packages                                          ::
:: * "run_test opm_name" to test package listed under this name in OPM        :: 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: === Preparations ===
@SET PathToLaz=C:\Lazarus\lazarus-4.0_FPC-3.2.2_64bit
@SET ZipDir=..\opm_local_repository
@SET Log=log.txt
@SET Package=%1
@SET path=%PathToLaz%;%path%

ECHO Started at %TIME% > %Log%

@IF "%Package%" NEQ "" goto :%Package%


:: === Packages needed by other packages ===

:BGRABitmap
tar -xf %ZipDir%\BGRABitmap.zip BGRABitmap

%PathToLaz%\lazbuild -B BGRABitmap\bgrabitmap\bgrabitmappack.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO BGRABitmap (bgrabitmappack.lpk) >> %Log%

%PathToLaz%\lazbuild -B BGRABitmap\bgrabitmap\bgrabitmappack4nogui.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO BGRABitmap (bgrabitmappack4nogui.lpk) >> %Log%

%PathToLaz%\lazbuild -B BGRABitmap\bgrabitmap\bgrabitmappack4nolcl.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO BGRABitmap (bgrabitmappack4nolcl.lpk) >> %Log%

%PathToLaz%\lazbuild -B BGRABitmap\bgrabitmap\bgrabitmappack4nolcl_freetype.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO BGRABitmap (bgrabitmappack4nolcl_freetype.lpk) >> %Log%

%PathToLaz%\lazbuild -B BGRABitmap\bglcontrols\bglcontrols.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO BGRABitmap (bglcontrols.lpk) >> %Log%

@IF /I "%Package%"=="BGRABitmap" GOTO :done

:DCPCrypt
tar -xf %ZipDir%\DCPCrypt.zip DCPcrypt
%PathToLaz%\lazbuild -B DCPcrypt\dcpcrypt.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO DCPcrypt (dcpcrypt.lpk) >> %Log%
%PathToLaz%\lazbuild -B DCPcrypt\dcpcrypt_laz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO DCPcrypt (dcpcrypt_laz.lpk) >> %Log%
@IF /I "%Package%"=="DCPCrypt" GOTO :done

:EControl
tar -xf %ZipDir%\EControl.zip EControl
%PathToLaz%\lazbuild -B EControl\econtrol\econtrol_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO EControl (econtrol_package.lpk) >> %Log%
@IF /I "%Package%"=="EControl" GOTO :done

:EncConv
tar -xf %ZipDir%\EncConv.zip EncConv
%PathToLaz%\lazbuild -B EncConv\encconv\encconv_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO EncConv (encconv_package.lpk) >> %Log%
@IF /I "%Package%"=="EncConv" GOTO :done

:FBIntf
tar -xf %ZipDir%\FBIntf.zip FBIntf
%PathToLaz%\lazbuild -B FBIntf\fbintf.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FBIntf (fbintf.lpk) >> %Log%
%PathToLaz%\lazbuild -B FBIntf\fbudr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FBIntf (fbudr.lpk) >> %Log%
%PathToLaz%\lazbuild -B FBIntf\fbudrTestbed.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FBIntf (fbudrTestbed.lpk) >> %Log%
@IF /I "%Package%"=="FBIntf" GOTO :done

:FPSpreadsheet
tar -xf %ZipDir%\FPSpreadsheet.zip fpspreadsheet
%PathToLaz%\lazbuild -B fpspreadsheet\laz_fpspreadsheet.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FPSpreadsheet (laz_fpspreadsheet.lpk) >> %Log%

%PathToLaz%\lazbuild -B fpspreadsheet\laz_fpspreadsheet_crypto.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FPSpreadsheet (laz_fpspreadsheet_crypto.lpk) >> %Log%

%PathToLaz%\lazbuild -B fpspreadsheet\laz_fpspreadsheet_dataset.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FPSpreadsheet (laz_fpspreadsheet_dataset.lpk) >> %Log%

%PathToLaz%\lazbuild -B fpspreadsheet\laz_fpspreadsheet_visual.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FPSpreadsheet (laz_fpspreadsheet_visual.lpk) >> %Log%

%PathToLaz%\lazbuild -B fpspreadsheet\laz_fpspreadsheet_visual_dsgn.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FPSpreadsheet (laz_fpspreadsheet_visual_dsgn.lpk) >> %Log%

%PathToLaz%\lazbuild -B fpspreadsheet\laz_fpspreadsheetexport_visual.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FPSpreadsheet (laz_fpspreadsheetexport_visual.lpk) >> %Log%

@IF /I "%Package%"=="FPSpreadsheet" GOTO :done

:Jvcllaz
tar -xf %ZipDir%\Jvcllaz.zip jvcllaz

%PathToLaz%\lazbuild -B jvcllaz\packages\jvcorelazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvcorelazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvcorelazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvcorelazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvappfrmlazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvappfrmlazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvappfrmlazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvappfrmlazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvstdctrlslazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvstdctrlslazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvstdctrlslazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvstdctrlslazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvcmpr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvcmpr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvcmpd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvcmpd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvctrlslazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvctrlslazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvctrlslazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvctrlslazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvcustomlazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvcustomlazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvcustomlazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvcustomdlaz.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvdblazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvdblazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvdblazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvdblazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvhmilazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvhmilazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvhmilazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvhmilazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvjanslazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvjanslazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvjanslazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvjanslazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvmmlazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvmmlazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvmmlazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvmmlazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvnetlazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvnetlazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvnetlazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvnetlazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvpascalinterpreterr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvpascalinterpreterr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvpascalinterpreterd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvpascalinterpreterd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvruntimedesignlazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvruntimedesignlazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvruntimedesignlazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvruntimedesignlazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvtimeframeworklazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvtimeframeworklazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvtimeframeworklazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvtimeframeworklazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvvalidatorslazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvvalidatorslazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvvalidatorslazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvvalidatorslazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvwizardlazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvwizardlazr.lpk) >> %Log%
%PathToLaz%\lazbuild -B jvcllaz\packages\jvwizardlazd.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvwizardlazd.lpk) >> %Log%

%PathToLaz%\lazbuild -B jvcllaz\packages\jvxpctrlslazr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Jvcllaz (jvxpctrlslazr.lpk) >> %Log%

@IF /I "%Package%"=="Jvcllaz" GOTO :done

:VirtualTreeViewV5
tar -xf %ZipDir%\VirtualTreeViewV5.zip VirtualTreeViewV5
%PathToLaz%\lazbuild -B VirtualTreeViewV5\Source\virtualtreeview_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO VirtualTreeViewV5 (virtualtreeview_package.lpk) >> %Log%
@IF /I "%Package%"=="VirtualTreeViewV5" GOTO :done

:Zeos
:ZeosDBO
tar -xf %ZipDir%\ZeosDBO.zip zeosdbo
%PathToLaz%\lazbuild -B zeosdbo\packages\lazarus\zcore.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZeosDBO (zcore.lpk) >> %Log%

%PathToLaz%\lazbuild -B zeosdbo\packages\lazarus\zplain.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZeosDBO (zplain.lpk) >> %Log%

%PathToLaz%\lazbuild -B zeosdbo\packages\lazarus\zparsesql.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZeosDBO (zparsesql.lpk) >> %Log%

%PathToLaz%\lazbuild -B zeosdbo\packages\lazarus\zdbc.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZeosDBO (zdbc.lpk) >> %Log%

%PathToLaz%\lazbuild -B zeosdbo\packages\lazarus\zcomponent.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZeosDBO (zcomponent.lpk) >> %Log%

%PathToLaz%\lazbuild -B zeosdbo\packages\lazarus\zcomponentdesign.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZeosDBO (zcomponentdesign.lpk) >> %Log%

@IF /I "%Package%"=="ZeosDBO" GOTO :done
@IF /I "%Package%"=="Zeos" GOTO :done

:RX
tar -xf %ZipDir%\RX.zip Rx
%PathToLaz%\lazbuild -B Rx\rxtools.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rxtools.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rxnew.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rxnew.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\dcl_rx_ctrl.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (dcl_rx_ctrl.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rx.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rx.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\dcl_rxtools.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (dcl_rxtools.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rxdbgrid_export_spreadsheet.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rxdbgrid_exportspreadsheet.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rxdbgrid_print.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rxdbgrid_print.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rx_sort_fbdataset.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rx_sort_fbdataset.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rx_sort_ibx.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rx_sort_ibx.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rx_sort_sqldb.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rx_sort_sqldb.lpk) >> %Log%

%PathToLaz%\lazbuild -B Rx\rx_sort_zeos.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RX (rx_sort_zeos.lpk) >> %Log%

@IF /I "%Package%"=="RX" GOTO :done

:HashLib
tar -xf %ZipDir%\HashLib.zip HashLib
%PathToLaz%\lazbuild -B HashLib\src\Packages\FPC\HashLib4PascalPackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO HashLib (HashLib4PascalPackage.lpk) >> %Log%
@IF /I "%Package%"=="HashLib" GOTO :done

:pl_Win_DirectX
tar -xf %ZipDir%\pl_Win_DirectX.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_directx\pl_win_directx.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Win_DirectX (pl_win_directx.lpk) >> %Log%
@IF /I "%Package%"=="pl_Win_DirectX" GOTO :done

:pl_Win_DirectX11
tar -xf %ZipDir%\pl_win_DirectX11.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_directx11\pl_win_directx11.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Win_DirectX11 (pl_win_directx11.lpk) >> %Log%
@IF /I "%Package%"=="pl_Win_DirectX11" GOTO :done

:pl_Win_DirectX12
tar -xf %ZipDir%\pl_win_DirectX12.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_directx12\pl_win_directx12.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Win_DirectX12 (pl_win_directx12.lpk) >> %Log%
@IF /I "%Package%"=="pl_Win_DirectX12" GOTO :done

:pl_Win_DirectXUt
tar -xf %ZipDir%\pl_win_DirectXUt.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_directxut\pl_win_directxut.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Win_DirectXUt (pl_win_directxut.lpk) >> %Log%
@IF /I "%Package%"=="pl_Win_DirectXUt" GOTO :done

:SimpleBaseLib
tar -xf %ZipDir%\SimpleBaseLib.zip SimpleBaseLib
%PathToLaz%\lazbuild -B SimpleBaseLib\src\Packages\FPC\SimpleBaseLib4PascalPackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO SimpleBaseLib (SimpleBaseLib4PascalPackage.lpk) >> %Log%
@IF /I "%Package%"=="SimpleBaseLib" GOTO :done

:Sdpo
tar -xf %ZipDir%\Sdpo.zip Sdpo
%PathToLaz%\lazbuild -B Sdpo\SdpoDSM\sdpodsmlaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Sdpo (sdpodsmlaz.lpk)>> %Log%
%PathToLaz%\lazbuild -B Sdpo\SdpoDynmatrix\sdpodynmatrix.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Sdpo (sdpodynmatrix.lpk)>> %Log%
%PathToLaz%\lazbuild -B Sdpo\SdpoFastForm\sdpofastformlaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Sdpo (sdpofastformlaz.lpk)>> %Log%
%PathToLaz%\lazbuild -B Sdpo\SdpoJoystick\sdpojoysticklaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Sdpo (sdpojoysticklaz.lpk)>> %Log%
%PathToLaz%\lazbuild -B Sdpo\SdpoSerial\sdposeriallaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Sdpo (sdposeriallaz.lpk)>> %Log%
@IF /I "%Package%"=="Sdpo" GOTO :done

:Synapse40.1
tar -xf %ZipDir%\Synapse40.1.zip synapse40.1
%PathToLaz%\lazbuild -B synapse40.1\laz_synapse.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Synapse40.1 (laz_synapse.lpk) >> %Log%
@IF /I "%Package%"=="Synapse40.1" GOTO :done

:VampyreImaging
tar -xf %ZipDir%\VampyreImaging.zip VampyreImaging
%PathToLaz%\lazbuild -B VampyreImaging\Packages\VampyreImagingPackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO VampyreImaging (VampyreImagingPackage.lpk) >> %Log%
%PathToLaz%\lazbuild -B VampyreImaging\Packages\VampyreImagingPackageExt.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO VampyreImaging (VampyreImagingPackageExt.lpk) >> %Log%
@IF /I "%Package%"=="VampyreImaging" GOTO :done


:: ===================== Stand-alone packages ===================================

:: ------------------------------ A --------------------------------------------

:Abbrevia
%PathToLaz%\lazbuild -B Abbrevia\packages\Lazarus\abbrevia.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Abbrevia (abbrevia.lpk) >> %Log%
@IF /I "%Package%"=="Abbrevia" GOTO :done

:ABProjectFiles
%PathToLaz%\lazbuild -B ABProjectFiles\abprojectfiles.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ABProjectFiles (abprojectfiles.lpk) >> %Log%
@IF /I "%Package%"=="ABProjectFiles" GOTO :done

:ACS
%PathToLaz%\lazbuild -B acs\packages\laz_acs.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ACS (laz_acs.lpk) >> %Log%
%PathToLaz%\lazbuild -B acs\packages\laz_acs_lib.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ACS (laz_acs_lib.lpk) >> %Log%
%PathToLaz%\lazbuild -B acs\packages\laz_acs_directx.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ACS (laz_acs_directx.lpk) >> %Log%
@IF /I "%Package%"=="ACS" GOTO :done

:ATBinHex
%PathToLaz%\lazbuild -B ATBinHex\atbinhex\atbinhex_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATBinHex (atbinhex_package.lpk) >> %Log%
@IF /I "%Package%"=="ATBinHex" GOTO :done

:ATExtendedDialogs
%PathToLaz%\lazbuild -B ATExtendedDialogs-master\atextendeddialogs\atextendeddialogs_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATExtendedDialogs (atextendeddialogs_package.lpk) >> %Log%
@IF /I "%Package%"=="ATExtendedDialogs" GOTO :done

:ATFileNotif-Lazarus
:ATFileNotif
%PathToLaz%\lazbuild -B ATFileNotif-Lazarus\src\atfilenotif_pkg.lpk
) >> %Log%
@IF /I "%Package%"=="ATFileNotif" GOTO :done
@IF /I "%Package%"=="ATFileNotif-Lazarus" GOTO :done

:ATFlatControls
%PathToLaz%\lazbuild -B ATFlatcontrols\atflatcontrols\atflatcontrols_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATFlatControls (atflatcontrols_package.lpk) >> %Log%
@IF /I "%Package%"=="ATFlatControls" GOTO :done

:ATImageBox
%PathToLaz%\lazbuild -B ATImageBox\atimagebox\atimagebox_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATImageBox (atimagebox_package.lpk) >> %Log%
@IF /I "%Package%"=="ATImageBox" GOTO :done

:ATShapeLine
%PathToLaz%\lazbuild -B ATShapeLine\atshapeline\atshapeline_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATShapeLine (atshapeline_package.lpk) >> %Log%
@IF /I "%Package%"=="ATShapeLine" GOTO :done

:ATSynEdit
%PathToLaz%\lazbuild -B ATSynEdit\atsynedit\atsynedit_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATSynEdit (atsynedit_package.lpk) >> %Log%
@IF /I "%Package%"=="ATSynEdit" GOTO :done

:ATSynEdit_Cmp
%PathToLaz%\lazbuild -B ATSynEdit_Cmp\atsynedit_cmp\atsynedit_cmp_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATSynEdit_Cmp (atsynedit_cmp_package.lpk) >> %Log%
@IF /I "%Package%"=="ASynEdit_Cmp" GOTO :done

:ATSynEdit_Ex
%PathToLaz%\lazbuild -B ATSynEdit_Ex\atsynedit_ex\atsynedit_ex_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ATSynEdit_Ex (atsynedit_ex_package.lpk) >> %Log%
@IF /I "%Package%"=="ATSynEdit_Ex" GOTO :done

:AutoSave
%PathToLaz%\lazbuild -B AutoSave\autosave.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO AutoSave (autosave.lpk) >> %Log%
@IF /I "%Package%"=="AutoSave" GOTO :done


:: ------------------------------- B -------------------------------------------

:Bare.Game
%PathToLaz%\lazbuild -B Bare.Game-master\source\barerun.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Bare.Game >> %Log%
@IF /I "%Package%"=="Bare.Game" GOTO :done

:BGRAControls
%PathToLaz%\lazbuild -B BGRAControls\bgracontrols.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO BGRAControls (bgracontrols.lpk) >> %Log%
%PathToLaz%\lazbuild -B BGRAControls\bgrapascalscriptcomponent.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO BGRAControls (bgrapascalscriptcomponent) >> %Log%
@IF /I "%Package%"=="BGRAControls" GOTO :done

:bgragames-master
:bgragames
%PathToLaz%\lazbuild -B bgragames-master\bgragames.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO bgragames-master (bgragames.lpk) >> %Log%
@IF /I "%Package%"=="bgragames" GOTO :done
@IF /I "%Package%"=="bgragames-master" GOTO :done

:BitHelpers
%PathToLaz%\lazbuild -B Bithelpers\bithelpers_pkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Bithelpers (bithelpers_pkg.lpk) >> %Log%
@IF /I "%Package%"=="BitHelpers" GOTO :done

:Box2D
%PathToLaz%\lazbuild -B Box2D\Box2d.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Box2D (Box2d.lpk) >> %Log%
@IF /I "%Package%"=="Box2D" GOTO :done

:brookframework
%PathToLaz%\lazbuild -B brookframework\Package\BrookTardigrade.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO brookframework (rookTardigrade.lpk) >> %Log%
@IF /I "%Package%"=="brookframework" GOTO :done

:brookfreepascal
%PathToLaz%\lazbuild -B brookfreepascal\packages\brookrt.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO brookframework (brookrt.lpk) >> %Log%
%PathToLaz%\lazbuild -B brookfreepascal\packages\brookdt.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO brookframework (brookdt.lpk) >> %Log%
%PathToLaz%\lazbuild -B brookfreepascal\packages\brookex.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO brookframework (brookex.lpk) >> %Log%
@IF /I "%Package%"=="brookfreepascal" GOTO :done


:: --------------------------------- C -----------------------------------------

:CADSys
%PathToLaz%\lazbuild -B CADSys\Packages\Lazarus\cadsys.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CADSys (cadsys.lpk) >> %Log%
@IF /I "%Package%"=="CADSys" GOTO :done

:callite
%PathToLaz%\lazbuild -B callite\callight_pkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO callite (callight_pkg.lpk) >> %Log%
@IF /I "%Package%"=="callite" GOTO :done

:Captcha
%PathToLaz%\lazbuild -B Captcha\captcha_pkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Captcha (captcha_pkg.lpk= >> %Log%
@IF /I "%Package%"=="captcha" GOTO :done

:CastleGameEngine
%PathToLaz%\lazbuild -B castle-engine-master\packages\castle_base.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CastleGameEngine (castle_base.lpk) >> %Log%
%PathToLaz%\lazbuild -B castle-engine-master\packages\castle_components.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CastleGameEngine (castle_components.lpk) >> %Log%
%PathToLaz%\lazbuild -B castle-engine-master\packages\castle_window.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CastleGameEngine (castle_window.lpk) >> %Log%
%PathToLaz%\lazbuild -B castle-engine-master\packages\alternative_castle_window_based_on_lcl.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CastleGameEngine (alternative_castle_window_based_on_lcl.lpk) >> %Log%
@IF /I "%Package%"=="CasteGameEngine" GOTO :done

:CEF4Delphi
%PathToLaz%\lazbuild -B CEF4Delphi\packages\cef4delphi_lazarus.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CEF4Delphi (cef4delphi_lazarus.lpk) >> %Log%
@IF /I "%Package%"=="CEF4Delphi" GOTO :done

:CEOSMW
%PathToLaz%\lazbuild -B ceosmw\ceosmw.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CEOSMW (ceosmw.lpk) >> %Log%
@IF /I "%Package%"=="CEPSMW" GOTO :done

:CGI
%PathToLaz%\lazbuild -B CGI\cgi.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CGI (cgi.lpk) >> %Log%
%PathToLaz%\lazbuild -B CGI\cgiide.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CGI (cgiide.lpk) >> %Log%
@IF /I "%Package%"=="CGI" GOTO :done

:ChemText
%PathToLaz%\lazbuild -B chemtext\laz_chemtext.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ChemText (laz_chemtext.lpk) >> %Log%
@IF /I "%Package%"=="ChemText" GOTO :done

:chsdet
%PathToLaz%\lazbuild -B chsdet\chsdet.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO chsdet (chsdet.lpk) >> %Log%
@IF /I "%Package%"=="chsdet" GOTO :done

:cmdline
%PathToLaz%\lazbuild -B cmdline\cmdbox.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO cmdline (cmdbox.lpk) >> %Log%
@IF /I "%Package%"=="cmdbox" GOTO :done

:CodeLibrarian
%PathToLaz%\lazbuild -B CodeLibrarian\codelibrarian.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Codelibrarian (codelibrarian.lpk) >> %Log%
@IF /I "%Package%"=="CodeLibrarian" GOTO :done

:CodesigningHelper
%PathToLaz%\lazbuild -B lazcodesigninghelper-master\source\CodeSigningPackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CodeSigningHelper (CodeSigningPackage.lpj) >> %Log%
@IF /I "%Package%"=="CodesigningHelper" GOTO :done

:CodeStats
%PathToLaz%\lazbuild -B CodeStats\CodeStats.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CodeStats (CodeStats.lpk)>> %Log%
@IF /I "%Package%"=="CodeStats" GOTO :done

:colorpalette
%PathToLaz%\lazbuild -B colorpalette\lazcolorpalette.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO colorpalette (lazcolorpalette.lpk) >> %Log%
@IF /I "%Package%"=="lazcolorpalette" GOTO :done

:cryptini
%PathToLaz%\lazbuild -B cryptini\cryptini.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO cryptini (cryptini.bak) >> %Log%
@IF /I "%Package%"=="cryptini" GOTO :done

:CryptoLib4Pascal
%PathToLaz%\lazbuild -B CryptoLib4Pascal\CryptoLib\src\Packages\FPC\CryptoLib4PascalPackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO CryptoLib4Pascal (CryptoLib4PascalPackage.lpk) >> %Log%
@IF /I "%Package%"=="CryptoLib4Pascal" GOTO :done


:: -------------------------------------- D ------------------------------------

:DataPort
tar -xf %ZipDir%\DataPort.zip DataPort
%PathToLaz%\lazbuild -B dataport\dataportlasarus.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO DataPort (dataportlasarus.lpk) >> %Log%
@IF /I "%Package%"=="DataPort" GOTO :done

:DBGridController
tar -xf %ZipDir%\DBGridController.zip DBGridController
%PathToLaz%\lazbuild -B DBGridController\DBGridController.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO DBGridController (DBGridController.lpk) >> %Log%
@IF /I "%Package%"=="DBGridController" GOTO :done

:DelphiMoon
tar -xf %ZipDir%\DelphiMoon.zip delphimoon
%PathToLaz%\lazbuild -B delphimoon\packages\Lazarus\tmoon_laz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO DelphiMoon (tmoon_laz.lpk) >> %Log%
@IF /I "%Package%"=="DelphiMoon" GOTO :done

:DExif
tar -xf %ZipDir%\DExif.zip dexif
%PathToLaz%\lazbuild -B dexif\dexif_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO DExif (dexif_package.lpk) >> %Log%
@IF /I "%Package%"=="DExif" GOTO :done

:DMath
tar -xf %ZipDir%\DMath.zip DMath
%PathToLaz%\lazbuild -B DMath\DMath.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO DMath (DMath.lpk) >> %Log%
@IF /I "%Package%"=="DMath" GOTO :done

:dOPF
tar -xf %ZipDir%\dOPF.zip dOPF
%PathToLaz%\lazbuild -B dOPF\packages\dopfrt.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO dOPF (dopfrt.lpk) >> %Log%
@IF /I "%Package%"=="dOPF" GOTO :done

:DragDrop
tar -xf %ZipDir%\DragDrop.zip DragDrop
%PathToLaz%\lazbuild -B DragDrop\Source\DragDropLazarus.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Dragdrop (DragDropLazarus.lpk) >> %Log%
@IF /I "%Package%"=="DragDrop" GOTO :done


:: -------------------------------------- E ------------------------------------

:: EControls  ---> already loaded

:Emmet-Pascal
tar -xf %ZipDir%\Emmet-Pascal.zip Emmet-Pascal
%PathToLaz%\lazbuild -B Emmet-Pascal\emmet\emmet_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Emmet-Pascal (emmet_package.lpk) >> %Log%
@IF /I "%Package%"=="Emmet-Pascal" GOTO :done

:: EncConv ---> already loaded

:epiktimer
tar -xf %ZipDir%\epiktimer.zip epiktimer
%PathToLaz%\lazbuild -B epiktimer\etpackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO epiktimer (etpackage.lpk) >> %Log%
%PathToLaz%\lazbuild -B epiktimer\etpackage_dsgn.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO epiktimer (etpackage_dsgn.lpk) >> %Log%
@IF /I "%Package%"=="epiktimer" GOTO :done

:EvsSimpleGraph
tar -xf %ZipDir%\EvsSimpleGraph.zip EvsSimpleGraph
%PathToLaz%\lazbuild -B EvsSimpleGraph\package\ugraphrtm.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO EvsSimpleGraph (ugraphrtm.lpk) >> %Log%
%PathToLaz%\lazbuild -B EvsSimpleGraph\package\ugraphdsgn.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO EvsSimpleGraph (ugraphdsgn.lpk) >> %Log%
@IF /I "%Package%"=="EvsSimpleGraph" GOTO :done

:ExamplePackage
tar -xf %ZipDir%\ExamplePackage.zip ExamplePackage
%PathToLaz%\lazbuild -B ExamplePackage\subcomponent.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExamplePackage (subcomponent.lpk) >> %Log%
%PathToLaz%\lazbuild -B ExamplePackage\myexamplepackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO EvsSimpleGraph (myexamplepackage.lpk) >> %Log%
@IF /I "%Package%"=="ExamplePackage" GOTO :done

:ExceptionLogger
tar -xf %ZipDir%\ExceptionLogger.zip ExceptionLogger
%PathToLaz%\lazbuild -B ExceptionLogger\ExceptionLogger.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExceptionLogger (ExceptionLogger.lpk) >> %Log%
@IF /I "%Package%"=="ExceptionLogger" GOTO :done

:ExtendedPackages
tar -xf %ZipDir%\ExtendedPackages.zip Extended

%PathToLaz%\lazbuild -B Extended\lazextcore.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextcore.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextbase.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextbase.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextbuttons.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextbuttons.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextcomponents.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextcomponents.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextcomponentsimg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextcomponentsimg.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextcopy.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextcopy.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextpascal.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextpascal.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextinit.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextinit.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextnet.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextnet.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextnumeric.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextnumeric.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextreports.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextreports.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextweb.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextweb.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazextwebbase.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazextwebbase.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazregisterdbnet.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazregisterdbnet.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazregisterdbnetserver.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazregisterdbnetserver.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazregisterextcomp.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazregisterextcomp.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazregisteribx.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazregisteribx.lpk) >> %Log%

%PathToLaz%\lazbuild -B Extended\lazregisterzeos.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtendedPackages (lazregisterzeos.lpk) >> %Log%

@IF /I "%Package%"=="ExtendedPackages" GOTO :done

:ExtraSyn
tar -xf %ZipDir%\ExtraSyn.zip extrasyn
%PathToLaz%\lazbuild -B extrasyn\extrahighlighters.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtraSyn (extrahighlighers.lpk) >> %Log%
%PathToLaz%\lazbuild -B extrasyn\extrahighlighters_dsgn.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ExtraSyn (extrahighlighers_dsgn.lpk) >> %Log%
@IF /I "%Package%"=="ExtraSyn" GOTO :done

:EyeCandyControls
tar -xf %ZipDir%\EyeCandyControls.zip EC_Controls
%PathToLaz%\lazbuild -B EC_Controls\EC_Controls\eccontrols.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO EyeCandyControls (eccontrols.lpk) >> %Log%
@IF /I "%Package%"=="EyeCandyControls" GOTO :done


:: -------------------------------------- F ------------------------------------

:: FBIntf (already handled)

:FileAssociation-mater
:FileAssociation
tar -xf %ZipDir%\FileAssociation-master.zip FileAssociation-master
%PathToLaz%\lazbuild -B FileAssociation-master\fileassociation.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FileAssociation-master (fileassociation.lpk) >> %Log%
@IF /I "%Package%"=="FileAssociation" GOTO :done
@IF /I "%Package%"=="FileAssociation-master" GOTO :done

:FileMenuHandler
tar -xf %ZipDir%\FileMenuHandler.zip FileMenuHandler
%PathToLaz%\lazbuild -B FileMenuHandler\FileMenuHandler.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FileMenuHandler (FileMenuHandler.lpk) >> %Log%
@IF /I "%Package%"=="FileMenuHandler" GOTO :done

:FitGrids
tar -xf %ZipDir%\FitGrids.zip fitgrids-master
%PathToLaz%\lazbuild -B fitgrids-master\FitGrids.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FitGrids (FitGrids.lpk)>> %Log%
@IF /I "%Package%"=="FitGrids" GOTO :done

:FlagPackage
tar -xf %ZipDir%\FlagPackage.zip flagcomponent
%PathToLaz%\lazbuild -B flagcomponent\flagpackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FlagPackage (flagpackage.lpk) >> %Log%
@IF /I "%Package%"=="FlagPackage" GOTO :done

:Fortes4Lazarus
tar -xf %ZipDir%\Fortes4Lazarus.zip "fortes4lazarus 3.24"
%PathToLaz%\lazbuild -B "fortes4lazarus 3.24\fortes324forlaz.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO Fortes4Lazarus (fortes324forlaz.lpk) >> %Log%
@IF /I "%Package%"=="Fortes4Lazarus" GOTO :done

:FortesReport-CE
tar -xf %ZipDir%\FortesReport-CE.zip fortesreport-ce4
%PathToLaz%\lazbuild -B fortesreport-ce4\Packages\frce.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FortesReport-CE (frce.lpk) >> %Log%
@IF /I "%Package%"=="FortesReport-CE" GOTO :done

:FpStax
:: needed by FpOdf
tar -xf %ZipDir%\FpStax.zip fpStax
%PathToLaz%\lazbuild -B fpStax\Stax-package\Stax.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FpStax (stax.lpk) >> %Log%
@IF /I "%Package%"=="FpStax" GOTO :done

:FpOdf
tar -xf %ZipDir%\FpOdf.zip fpOdf
%PathToLaz%\lazbuild -B fpOdf\package\fpodf.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FpOdf (fpodf.lpj) >> %Log%
@IF /I "%Package%"=="FpOdf" GOTO :done

:FpTelegram
tar -xf %ZipDir%\FpTelegram.zip FpTelegram
%PathToLaz%\lazbuild -B FpTelegram\fptelegram.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FpTelegram (fptelegram.lpk) >> %Log%
%PathToLaz%\lazbuild -B FpTelegram\fptelegram_dt.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO FpTelegram (fptelegram_dt.lpk) >> %Log%
@IF /I "%Package%"=="FpTelegram" GOTO :done


:: -------------------------------------- G ------------------------------------

:GDIPlus
tar -xf %ZipDir%\GDIPlus.zip GDIPlus
%PathToLaz%\lazbuild -B GDIPlus\packages\lazarus\lazgdiplus.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GDIPlus (lazgdiplus.lpk) >> %Log%
@IF /I "%Package%"=="GDIPlus" GOTO :done

:GifAnim
tar -xf %ZipDir%\GifAnim.zip gifanim
%PathToLaz%\lazbuild -B gifanim\pkg_gifanim.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GifAnim (pkg_gifanim.lpk) >> %Log%
%PathToLaz%\lazbuild -B gifanim\pkg_gifanim_dsgn.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GifAnim (pkg_gifanim_dsgn.lpk) >> %Log%
@IF /I "%Package%"=="GifAnim" GOTO :done

:GIFViewer
tar -xf %ZipDir%\GIFViewer.zip TGIFViewer
%PathToLaz%\lazbuild -B TGIFViewer\package\gifviewer_pkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GIFViewer (gifviewer_pkg.lpk) >> %Log%
@IF /I "%Package%"=="GIFViewer" GOTO :done

:GLScene
tar -xf %ZipDir%\GLScene.zip GLSceneLCL
%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_RunTime.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_RunTime.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_DesignTime.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_DesignTime.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_BASS.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_BASS.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_CgShader.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_CgShader.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_FMOD.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_FMOD.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_NGD.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_NGD.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_ODE.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_ODE.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_OpenAL.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_OpenAL.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_Physic_native.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_Physic_native.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_Physic_newton.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_Physic_newton.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_SDL.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_SCL.lpk) >> %Log%

%PathToLaz%\lazbuild -B GLSceneLCL\Packages\GLScene_WinOnly.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GLScene (GLScene_WinOnly.lpk) >> %Log%

@IF /I "%Package%"=="SLScene" GOTO :done

:GoldParser
tar -xf %ZipDir%\GoldParser.zip GOLDParser
%PathToLaz%\lazbuild -B GOLDParser\src\gold_parser_5.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GoldParser (gold_parser_5.lpk) >> %Log%
@IF /I "%Package%"=="GoldParser" GOTO :done

:GridPrinter
tar -xf %ZipDir%\GridPrinter.zip GridPrinter
%PathToLaz%\lazbuild -B GridPrinter\gridprinterpkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO GridPrinter (gridprinterpkg.lpk) >> %Log%
@IF /I "%Package%"=="GridPrinter" GOTO :done


:: -------------------------------------- H ------------------------------------

:Hidapi
tar -xf %ZipDir%\Hidapi.zip HIDAPI
%PathToLaz%\lazbuild -B HIDAPI\src\hidapi_pkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Hidapi (hidapi_pkg.lpk) >> %Log%
@IF /I "%Package%"=="Hidapi" GOTO :done

:HistoryFiles
tar -xf %ZipDir%\HistoryFiles.zip HistoryFiles
%PathToLaz%\lazbuild -B HistoryFiles\HistoryLazarus.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO HistoryFiles (HistoryLazarus.lpk) >> %Log%
@IF /I "%Package%"=="HistoryFiles" GOTO :done

:HtmlViewer
tar -xf %ZipDir%\HtmlViewer.zip HtmlViewer
%PathToLaz%\lazbuild -B HtmlViewer\package\FrameViewer09.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO HtmlViewer (FrameViewer09.lpk) >> %Log%
@IF /I "%Package%"=="HtmlViewer" GOTO :done


:: -------------------------------------- I ------------------------------------

:IBControls
tar -xf %ZipDir%\IBControls.zip IBControls
%PathToLaz%\lazbuild -B IBControls\ibcontrols.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBCOntrols (ibcontrols.lpk) >> %Log%
@IF /I "%Package%"=="IBControls" GOTO :done

:IBX4Lazarus
tar -xf %ZipDir%\IBX4Lazarus.zip IBX4Lazarus
%PathToLaz%\lazbuild -B IBX4Lazarus\ibexpress.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBX4Lazarus (ibexrpess.lpk) >> %Log%
%PathToLaz%\lazbuild -B IBX4Lazarus\ibexpressconsolemode.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBX4Lazarus (ibexrpessconsolemode.lpk) >> %Log%
%PathToLaz%\lazbuild -B IBX4Lazarus\iblocaldb.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBX4Lazarus (iblocaldb.lpk) >> %Log%
%PathToLaz%\lazbuild -B IBX4Lazarus\iblocalnongui.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBX4Lazarus (iblocalnongui.lpk) >> %Log%
%PathToLaz%\lazbuild -B IBX4Lazarus\ibnongui.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBX4Lazarus (ibnongui.lpk) >> %Log%
%PathToLaz%\lazbuild -B IBX4Lazarus\ibLegacyServices.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBX4Lazarus (ibLegacyServices.lpk) >> %Log%
%PathToLaz%\lazbuild -B IBX4Lazarus\dclibx.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO IBX4Lazarus (dclibx.lpk) >> %Log%
@IF /I "%Package%"=="IB4Lazarus" GOTO :done

:IndustrialStuff
tar -xf %ZipDir%\industrialstuff.zip industrialstuff
%PathToLaz%\lazbuild -B industrialstuff\industrial.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Industrialstuff (industrial.lpk) >> %Log%
@IF /I "%Package%"=="IndustrialStuff" GOTO :done

:Indy10
:Indy
tar -xf %ZipDir%\Indy10.zip Indy10
%PathToLaz%\lazbuild -B Indy10\indylaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Indy (indylaz.lpk) >> %Log%
@IF /I "%Package%"=="Indy10" GOTO :done
@IF /I "%Package%"=="Indy" GOTO :done


:: -------------------------------- J ------------------------------------------

:JPLib
tar -xf %ZipDir%\JPLib.zip JPLib
%PathToLaz%\lazbuild -B JPLib\packages\lazarus\jplib.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO JPLib (jplib.lpk) >> %Log%
@IF /I "%Package%"=="JPLib" GOTO :done

:JPPack
tar -xf %ZipDir%\JPPack.zip JPPack
%PathToLaz%\lazbuild -B JPPack\packages\lazarus\jppacklcl.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO JPPack (jppacklcl.lpk) >> %Log%
@IF /I "%Package%"=="JPPack" GOTO :done

:JujiboUtils
tar -xf %ZipDir%\jujiboutils.zip jujiboutils
%PathToLaz%\lazbuild -B jujiboutils\jujiboutils.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO JujiboUtils (jujiboutils.lpk) >> %Log%
@IF /I "%Package%"=="JujiboUtils" GOTO :done

:: Jvcllaz --- already handled


::-------------------------------------- K -------------------------------------

:KASToolBar
tar -xf %ZipDir%\KASToolBar.zip KASToolBar
%PathToLaz%\lazbuild -B KASToolBar\kascomp.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO KASToolbar (kascomp.lpk) >> %Log%
@IF /I "%Package%"=="KASToolbar" GOTO :done

:KControls
tar -xf %ZipDir%\kcontrols.zip kcontrols
%PathToLaz%\lazbuild -B kcontrols\packages\kcontrols\kcontrolsbase.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO KControls (kcontrolsbase.lpk) >> %Log%
%PathToLaz%\lazbuild -B kcontrols\packages\kcontrols\kcontrolslaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO KControls (kcontrolslaz.lpk) >> %Log%
@IF /I "%Package%"=="KControls" GOTO :done

:KyoukaiFramework
tar -xf %ZipDir%\KyoukaiFramework.zip kyoukai_framework
%PathToLaz%\lazbuild -B kyoukai_framework\src\packages\kyoukai_standard.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO KyoukaiFramework (kyoukai_standard.lpk) >> %Log%
@IF /I "%Package%"=="KyoukyaiFramework" GOTO :done


::-------------------------------------- L -------------------------------------

:lainzcodestudio-master
:lainzcodestudio
tar -xf %ZipDir%\lainzcodestudio-master.zip lainzcodestudio-master
%PathToLaz%\lazbuild -B lainzcodestudio-master\lcs_package\lcs_package.lpk
IF %ERRORLEVEL% NEQ 0 ECHO lainzcodestudio-master (lcs_package.lpk) >> %Log%
@IF /I "%Package%"=="lainzcodestudio" GOTO :done
@IF /I "%Package%"=="lainzcodestudio-master" GOTO :done

:LAMW
tar -xf %ZipDir%\LAMW.zip LAMW
%PathToLaz%\lazbuild -B LAMW\android_bridges\tfpandroidbridge_pack.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LAMW (tfpandroidbridge_pack.lpk) >> %Log%

%PathToLaz%\lazbuild -B LAMW\android_wizard\lazandroidwizardpack.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LAMW (lazandroidwizardpack.lpk) >> %Log%

%PathToLaz%\lazbuild -B LAMW\fcl_bridges\fcl_bridges_pack.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LAMW (fcl_bridges_pack.lpk) >> %Log%

@IF /I "%Package%"=="LAMW" GOTO :done

:Lape
tar -xf %ZipDir%\Lape.zip Lape
%PathToLaz%\lazbuild -B Lape\package\lape.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Lape (lape.lpk) >> %Log%
@IF /I "%Package%"=="Lape" GOTO :done

:LazarusAppExplore
tar -xf %ZipDir%\LazarusAppExplore.zip "Lazarus AppExplore"
%PathToLaz%\lazbuild -B "Lazarus AppExplore\appexplore.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazarusAppExplore (appexplore.lpk) >> %Log%
@IF /I "%Package%"=="LazarusAppExplore" GOTO :done

:LazAutoUpdate
tar -xf %ZipDir%\LazAutoUpdate.zip lazautoupdate
%PathToLaz%\lazbuild -B lazautoupdate\lazupdate.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazAutoUpdate (lazupdate.lpk) >> %Log%
@IF /I "%Package%"=="LazAutoUpdate" GOTO :done

:LazBarcodes
tar -xf %ZipDir%\LazBarcodes.zip lazbarcodes
%PathToLaz%\lazbuild -B lazbarcodes\packages\lazbarcodes_runtimeonly.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazBarcodes (lazbarcodes_runtimeonly.lpk) >> %Log%
%PathToLaz%\lazbuild -B lazbarcodes\packages\lazbarcodes.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazBarcodes (lazbarcodes.lpk) >> %Log%
@IF /I "%Package%"=="LazBarcodes" GOTO :done

:LazIdeSearchPanel
tar -xf %ZipDir%\LazIdeSearchPanel.zip LazIdeSearchPanel
%PathToLaz%\lazbuild -B LazIdeSearchPanel\idesearchpanelp.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazIdeSearchPanel (idesearchPanel.lpk) >> %Log%
@IF /I "%Package%"=="LazIdeSearchPanel" GOTO :done

:LazLightFileStream
tar -xf %ZipDir%\LazLightFileStream.zip LazLightFileStream
%PathToLaz%\lazbuild -B LazLightFileStream\LazLightFileStream.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazLightFileStream (LazLightFileStream.lpk) >> %Log%
@IF /I "%Package%"=="LazLightFileStream" GOTO :done

:LazRGBGraphics 
:: needed by LazMapViewer
tar -xf %ZipDir%\LazRGBGraphics.zip LazRGBGraphics
%PathToLaz%\lazbuild -B LazRGBGraphics\lazrgbgraphics.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazRGBGraphics (lazrgbgraphics.lpk) >> %Log%
@IF /I "%Package%"=="LazRGBGraphics" GOTO :done

:LazMapViewer
tar -xf %ZipDir%\LazMapViewer.zip LazMapViewer
%PathToLaz%\lazbuild -B LazMapViewer\LazMapViewer\lazmapviewerpkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazMapViewer (lazmapviewerpkg.lpk) >> %Log%

%PathToLaz%\lazbuild -B LazMapViewer\LazMapViewer\lazmapviewer_synapse.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazMapViewer (lazmapviewer_synapse.lpk) >> %Log%

%PathToLaz%\lazbuild -B LazMapViewer\LazMapViewer\lazmapviewer_bgra.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazMapViewer (lazmapviewer_bgra.lpk) >> %Log%

%PathToLaz%\lazbuild -B LazMapViewer\LazMapViewer\lazmapviewer_rgbgraphics.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazMapViewer (lazmapviewer_rgbgraphics.lpk) >> %Log%

@IF /I "%Package%"=="LazMapViewer" GOTO :done

:LazProfiler
tar -xf %ZipDir%\LazProfiler.zip lazprofiler
%PathToLaz%\lazbuild -B lazprofiler\LazProfiler.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazProfiler (LazProfiler.lpk)  >> %Log%
@IF /I "%Package%"=="LazProfiler" GOTO :done

:LazQuadTree
tar -xf %ZipDir%\LazQuadTree.zip LazQuadTree
%PathToLaz%\lazbuild -B LazQuadTree\lazquadtree.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazQuadTree (lazquadtree.lpk) >> %Log%
@IF /I "%Package%"=="LazQuadTree" GOTO :done

:LazRichView
tar -xf %ZipDir%\LazRichView.zip lazrichview
%PathToLaz%\lazbuild -B lazrichview\lazrichview.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazRichView (lazrichview.lpk) >> %Log%
@IF /I "%Package%"=="LazRichView" GOTO :done

:LazSerial
tar -xf %ZipDir%\LazSerial.zip LazSerial
%PathToLaz%\lazbuild -B LazSerial\lazserialport.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LazSerial (lazserialport.lpk) >> %Log%
@IF /I "%Package%"=="LazSerial" GOTO :done

:LCLExtensions
tar -xf %ZipDir%\LCLExtensions.zip lclextensions
%PathToLaz%\lazbuild -B lclextensions\lclextensions_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LCLExtensions (lclextensions_package.lpk) >> %Log%
@IF /I "%Package%"=="LCLExtensions" GOTO :done

:LGenerics
tar -xf %ZipDir%\LGenerics.zip LGenerics
%PathToLaz%\lazbuild -B LGenerics\lgenerics\lgenerics.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LGenerics (lgenerics.lpk) >> %Log%
@IF /I "%Package%"=="LGenerics" GOTO :done

:Lists
tar -xf %ZipDir%\Lists.zip Lists
%PathToLaz%\lazbuild -B Lists\lists.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Lists (lists.lpk) >> %Log%
@IF /I "%Package%"=="Lists" GOTO :done

:LNet
tar -xf %ZipDir%\LNet.zip lnet
%PathToLaz%\lazbuild -B lnet\lazaruspackage\lnetbase.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LNet (lnetbase.lpk) >> %Log%
%PathToLaz%\lazbuild -B lnet\lazaruspackage\lnetvisual.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LNet (lnetvisual.lpk) >> %Log%
@IF /I "%Package%"=="LNet" GOTO :done

:LongTimer
tar -xf %ZipDir%\LongTimer.zip longtimer
%PathToLaz%\lazbuild -B longtimer\longtimerpackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LongTimer (longtimerpackage.lpk) >> %Log%
@IF /I "%Package%"=="LongTimer" GOTO :done

:LuiPack
tar -xf %ZipDir%\LuiPack.zip luipack

%PathToLaz%\lazbuild -B luipack\vtvextras\virtualdbgrid\virtualdbgrid_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (vtvextras virtualdbgrid_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\luicontrols\luicontrols.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicontrols/luicontrols.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicontrols\jsonzvdatetimemediator_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicontrols/jsonzvdatetimemediator_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\luicomponents\luicomponents.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicomponents/luicomponents.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicomponents\luilclcomponents.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicomponents/luilclcomponents.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicomponents\luizeoscomponents.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicomponents/luizeoscomponents.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicomponents\luisqlitecomponents.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicomponents/luisqlitecomponents.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicomponents\luilazreportcomponents.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicomponents/luilazreportcomponents.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicomponents\luifptest.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicomponents/luifptest.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\cairo\cairobase_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (cairo/cairobase_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\cairo\rsvg_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (cairo/rsvg_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\cairo\cairolcl_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (cairo/cairolcl_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\cairo\cairoimaging_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (cairo/cairoimaging_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\cairo\cairofpgui_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (cairo/cairofpgui_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\luicairo\luicairo_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicairo/luicairo_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicairo\luicairo_extras.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicairo/luicairo_extras.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicairo\luiimage_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicairo/luiimage_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luicairo\luiimage_package_fpgui.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luicairo/luiimage_package_fpgui.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\chronolog\chronolog_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (chronolog_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\datahub\datahub_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (datahub_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\lclextensions\lclextensions_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (lclextensions_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\librereport\librereport_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (librereport_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\luiapp\luiapp_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luiapp_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\luidialogs\luidialogs_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luidialogs_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luidialogs\luidbdialogs_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luidbdialogs_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\luimediators\luimediators_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luimediators_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\luirest\luirest_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (luirest_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\miscutils\miscutils_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (miscutils_package.lpk) >> %Log%
%PathToLaz%\lazbuild -B luipack\miscutils\strbuf_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (strbuf_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\sqlite\extensions\sqliteextensions_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (sqliteextensions_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\uniqueinstance\uniqueinstance_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (uniqueinstance_package.lpk) >> %Log%

%PathToLaz%\lazbuild -B luipack\vtvextras\luiconfigtree\luiconfigtree_pkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (vtvextras luiconfigtree_pkg.lpk) >> %Log%
:: vtvextras\virtualdbgrid -- alread handled
%PathToLaz%\lazbuild -B luipack\vtvextras\vtvutils\vtvutils_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO LuiPack (vtvextras vtvutils_package.lpk) >> %Log%

@IF /I "%Package%"=="LuiPack" GOTO :done


::-------------------------------------- M -------------------------------------

:MBColorLib
tar -xf %ZipDir%\MBColorLib.zip mbColorLib
%PathToLaz%\lazbuild -B mbColorLib\mbcolorliblaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO MBColorLib (mbcolorliblaz.lpk) >> %Log%
@IF /I "%Package%"=="MBColorLib" GOTO :done

:Metadarkstyle
tar -xf %ZipDir%\Metadarkstyle.zip Metadarkstyle
%PathToLaz%\lazbuild -B Metadarkstyle\metadarkstyle.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Metadarkstyle (metadarkstyle.lpk) >> %Log%
%PathToLaz%\lazbuild -B Metadarkstyle\metadarkstyledsgn.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Metadarkstyle (metadarkstyledsgn.lpk) >> %Log%
@IF /I "%Package%"=="Metadarkstyle" GOTO :done

:MORMot
tar -xf %ZipDir%\MORMot.zip mORMot
%PathToLaz%\lazbuild -B mORMot\packages\mormot_base.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO MORMot (mormot_base.lpk) >> %Log%
%PathToLaz%\lazbuild -B mORMot\packages\mormot_cross.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO MORMot (mormot_cross.lpk) >> %Log%
@IF /I "%Package%"=="MORMot" GOTO :done

:MORMot2
tar -xf %ZipDir%\MORMot2.zip mORMot2
%PathToLaz%\lazbuild -B mORMot2\packages\lazarus\mormot2.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO MORMot2 (mormot2.lpk) >> %Log%
%PathToLaz%\lazbuild -B mORMot2\packages\lazarus\mormot2ui.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO MORMot2 (mormot2ui.lpk) >> %Log%
@IF /I "%Package%"=="MORMot2" GOTO :done

:mplayer0.1.2
:mplayer
tar -xf %ZipDir%\mplayer0.1.2.zip mplayer0.1.2
%PathToLaz%\lazbuild -B mplayer0.1.2\mplayercontrollaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO mplayer0.1.2 mplayercontrollaz.lpk) >> %Log%
@IF /I "%Package%"=="mplayer" GOTO :done
@IF /I "%Package%"=="mplayer0.1.2" GOTO :done

:MultiLog
tar -xf %ZipDir%\MultiLog.zip MultiLog
%PathToLaz%\lazbuild -B MultiLog\multiloglaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO MultiLog (multiloglaz.lpk) >> %Log%
@IF /I "%Package%"=="MultiLog" GOTO :done

:MultithreadProcs
tar -xf %ZipDir%\MultithreadProcs.zip multithreadprocs
%PathToLaz%\lazbuild -B multithreadprocs\multithreadprocslaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO multithreadprocs /multithreadprocslaz.lpk) >> %Log%
@IF /I "%Package%"=="MultithreadProcs" GOTO :done


::-------------------------------------- N -------------------------------------

:NiceChart
tar -xf %ZipDir%\NiceChart.zip NiceChart
%PathToLaz%\lazbuild -B NiceChart\packages\Lazarus\nicechartlaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO NiceChart (nicechartlaz.lpk)>> %Log%
@IF /I "%Package%"=="NiceChart" GOTO :done

:NiceGrid
tar -xf %ZipDir%\NiceGrid.zip NiceGrid
%PathToLaz%\lazbuild -B NiceGrid\packages\Lazarus\NiceGridLaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO NiceGrid (NiceGridLaz.lpk) >> %Log%
@IF /I "%Package%"=="NiceGrid" GOTO :done

:nicesidebar
tar -xf %ZipDir%\nicesidebar.zip nicesidebar
%PathToLaz%\lazbuild -B nicesidebar\packages\Lazarus\nicesidebarlaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO nicesidebar (nicesidebarlaz.lpk) >> %Log%
@IF /I "%Package%"=="nicesidebar" GOTO :done

:NotepadppPlugin
tar -xf %ZipDir%\NotepadppPlugin.zip NotepadppPlugin
%PathToLaz%\lazbuild -B NotepadppPlugin\notepadppplugin.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO NotepadppPlugin (notepadppplugin.lpk) >> %Log%
@IF /I "%Package%"=="NotepadppPlugin" GOTO :done

:NumCPULib
tar -xf %ZipDir%\NumCPULib.zip NumCPULib
%PathToLaz%\lazbuild -B NumCPULib\src\Packages\FPC\NumCPULib4PascalPackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO NumCPULib (NumCPULib4PascalPackage.lpk) >> %Log%
@IF /I "%Package%"=="NumCPULib" GOTO :done


::-------------------------------------- O -------------------------------------

:OnGuard
tar -xf %ZipDir%\OnGuard.zip OnGuard
%PathToLaz%\lazbuild -B onGuard\packages\tponguard.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO OnGuard (tponguard.lpk)>> %Log%
%PathToLaz%\lazbuild -B onGuard\packages\tponguard_fpgui.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO OnGuard (tponguard_fpgui.lpk)>> %Log%
%PathToLaz%\lazbuild -B onGuard\packages\tponguard_design.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO OnGuard (tponguard.design)>> %Log%
@IF /I "%Package%"=="OnGuard" GOTO :done

:OpenGPSX
tar -xf %ZipDir%\OpenGPSX.zip opengpsx
%PathToLaz%\lazbuild -B opengpsx\opengpsx.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO OpenGPSX (opengpsx.lpk)>> %Log%
@IF /I "%Package%"=="OpenGPSX" GOTO :done

:openssl-1.0.2j-i386-win32
tar -xf %ZipDir%\openssl-1.0.2j-i386-win32.zip 
@IF /I "%Package%"=="openssl-1.0.2j-i386-win32" GOTO :done

:openssl-1.0.2j-x64_86-win64
tar -xf %ZipDir%\openssl-1.0.2j-x64_86-win64.zip
@IF /I "%Package%"=="openssl-1.0.2j-x64_86-win64" GOTO :done

:openssl-1.1.1o-i386-win32
tar -xf %ZipDir%\openssl-1.1.1o-i386-win32.zip
@IF /I "%Package%"=="openssl-1.1.1o-i386-win32" GOTO :done

:openssl-1.1.1o-x64_86-win64
tar -xf %ZipDir%\openssl-1.1.1o-x64_86-win64.zip
@IF /I "%Package%"=="openssl-1.1.1o-x64_86-win64" GOTO :done

:openssl-3.0.12-i386-win32
tar -xf %ZipDir%\openssl-3.0.12-i386-win32.zip
@IF /I "%Package%"=="openssl-3.0.12-i386-win32" GOTO :done

:openssl-3.0.12-x64_86-win64
tar -xf %ZipDir%\openssl-3.0.12-x64_86-win64.zip
@IF /I "%Package%"=="openssl-3.0.12-x64_86-win64" GOTO :done

:OpenWeatherMap
tar -xf %ZipDir%\OpenWeatherMap.zip OpenWeatherMap
%PathToLaz%\lazbuild -B OpenWeatherMap\fpowm.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO OpenWeatherMap (fpowm.lpk)>> %Log%
@IF /I "%Package%"=="OpenWeatherMap" GOTO :done

:Orpheus
tar -xf %ZipDir%\Orpheus.zip orpheus
%PathToLaz%\lazbuild -B orpheus\orpheus.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Orpheus (orpheus.lpk)>> %Log%
@IF /I "%Package%"=="Orpheus" GOTO :done


::-------------------------------------- P -------------------------------------

:PascalContainer
tar -xf %ZipDir%\PascalContainer.zip PascalContainer
%PathToLaz%\lazbuild -B PascalContainer\packages\pascalcontainer.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalContainer (pascalcontainer.lpk)>> %Log%
@IF /I "%Package%"=="PascalContainer" GOTO :done

:PascalSCADA
tar -xf %ZipDir%\PascalSCADA.zip PascalSCADA
%PathToLaz%\lazbuild -B PascalSCADA\pascalscada_common.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalSCADA (pascalscada_common.lpk)>> %Log%

%PathToLaz%\lazbuild -B PascalSCADA\pascalscada.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalSCADA (pascalscada.lpk)>> %Log%

%PathToLaz%\lazbuild -B PascalSCADA\pascalscada_dsng.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalSCADA (pascalscada_dsng.lpk)>> %Log%

%PathToLaz%\lazbuild -B PascalSCADA\pascalscada_hmi.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalSCADA (pascalscada_hmi.lpk)>> %Log%

%PathToLaz%\lazbuild -B PascalSCADA\pascalscada_db.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalSCADA (pascalscada_db.lpk)>> %Log%

%PathToLaz%\lazbuild -B PascalSCADA\pascalscada_full.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalSCADA (pascalscada_full.lpk)>> %Log%

@IF /I "%Package%"=="PascalSCADA" GOTO :done

:PascalTZ
tar -xf %ZipDir%\PascalTZ.zip PascalTZ
%PathToLaz%\lazbuild -B PascalTZ\package\pascaltz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PascalTZ (pascaltz.lpk)>> %Log%
@IF /I "%Package%"=="PascalTZ" GOTO :done

:PasMP
tar -xf %ZipDir%\PasMP.zip pasmp
%PathToLaz%\lazbuild -B pasmp\lazpasmp.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PasMP (lazpasmp.lpk)>> %Log%
@IF /I "%Package%"=="PasMP" GOTO :done

:pl_0_libs
tar -xf %ZipDir%\pl_0_libs.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_0_libs\pl_0_libs.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_0_libs (pl_0_libs.lpk)>> %Log%
@IF /I "%Package%"=="pl_0_libs" GOTO :done

:pl_APE
tar -xf %ZipDir%\pl_APE.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_apelib\pl_apelib.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_APE (pl_APE_libs.lpk)>> %Log%
@IF /I "%Package%"=="pl_APE" GOTO :done

:pl_AsioVST
tar -xf %ZipDir%\pl_AsioVST.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_asiovst\pl_asiovst.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_AsioVST (pl_asiobst.lpk)>> %Log%
@IF /I "%Package%"=="pl_AsioVST" GOTO :done

:pl_Cindy
tar -xf %ZipDir%\pl_Cindy.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_cindy\pl_cindy.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Cindy (pl_cindy.lpk)>> %Log%
@IF /I "%Package%"=="pl_Cindy" GOTO :done

:pl_ExCompress
tar -xf %ZipDir%\pl_ExCompress.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_excompress\pl_excompress.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_ExCompress (pl_excompress.lpk)>> %Log%
@IF /I "%Package%"=="pl_Excompress" GOTO :done

:pl_ExControls
tar -xf %ZipDir%\pl_ExControls.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_excontrols\pl_excontrols.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_ExConctrols (pl_excontrols.lpk)>> %Log%
@IF /I "%Package%"=="pl_ExControls" GOTO :done

:pl_ExDatabase
tar -xf %ZipDir%\pl_ExDatabase.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_exdatabase\pl_exdatabase.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_ExDatabase (pl_exdatabase.lpk)>> %Log%
@IF /I "%Package%"=="pl_ExDatabase" GOTO :done

:pl_Graphics32
tar -xf %ZipDir%\pl_Graphics32.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_graphics32\pl_graphics32.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Graphics32 (pl_graphics32.lpk)>> %Log%
@IF /I "%Package%"=="pl_Graphics32" GOTO :done

:pl_Graphics32EXT
tar -xf %ZipDir%\pl_Graphics32EXT.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_graphics32ext\pl_graphics32ext.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Graphics32Ext (pl_graphics32ext.lpk)>> %Log%
@IF /I "%Package%"=="pl_Graphics32EXT" GOTO :done

:pl_Graphics32VPR
:: needed by pl_Graphics32Magic
tar -xf %ZipDir%\pl_Graphics32VPR.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_graphics32vpr\pl_graphics32vpr.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Graphics32VPR (pl_graphics32vpr.lpk)>> %Log%
@IF /I "%Package%"=="pl_Graphics32VPR" GOTO :done

:pl_Graphics32Magic
tar -xf %ZipDir%\pl_Graphics32Magic.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_graphics32magic\pl_graphics32magic.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Graphics32Magic (pl_graphics32magic.lpk)>> %Log%
@IF /I "%Package%"=="pl_Graphics32Magic" GOTO :done

:pl_Graphics32Mg
tar -xf %ZipDir%\pl_Graphics32Mg.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_graphics32mg\pl_graphics32mg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Graphics32Mg (pl_graphics32mg.lpk)>> %Log%
@IF /I "%Package%"=="pl_Graphics32Mg" GOTO :done

:pl_HTML5Canvas
tar -xf %ZipDir%\pl_HTML5Canvas.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_html5canvas\pl_html5canvas.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_HTML5Canvas (pl_html5canvas.lpk)>> %Log%
@IF /I "%Package%"=="pl_Graphics32Mg" GOTO :done

:pl_LockBox
tar -xf %ZipDir%\pl_LockBox.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_lockbox\pl_lockbox.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_LockBox (pl_lockbox.lpk)>> %Log%
@IF /I "%Package%"=="pl_LockBox" GOTO :done

:pl_OpenGL
tar -xf %ZipDir%\pl_OpenGL.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_opengl\pl_opengl.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_OpenGL (pl_opengl.lpk)>> %Log%
@IF /I "%Package%"=="pl_OpenGL" GOTO :done

:pl_OpenGLES
tar -xf %ZipDir%\pl_OpenGLES.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_opengles\pl_opengles.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_OpenGLES (pl_opengles.lpk)>> %Log%
@IF /I "%Package%"=="pl_OpenGLES" GOTO :done

:pl_PAPPE
tar -xf %ZipDir%\pl_PAPPE.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_pappe\pl_pappe.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_PAPPE (pl_pappe.lpk)>> %Log%
@IF /I "%Package%"=="pl_PAPPE" GOTO :done

:pl_SDL2
tar -xf %ZipDir%\pl_SDL2.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_sdl2\pl_sdl2.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_SDL2 (pl_sdl2.lpk)>> %Log%
@IF /I "%Package%"=="pl_SDL2" GOTO :done

:pl_SynapseVS
tar -xf %ZipDir%\pl_SynapseVS.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_synapsevs\pl_synapsevs.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_SynapseVS (pl_synapsevs.lpk)>> %Log%
@IF /I "%Package%"=="pl_SynapseVS" GOTO :done

:pl_USB
tar -xf %ZipDir%\pl_USB.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_usb\pl_usb.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_USB (pl_usb.lpk)>> %Log%
@IF /I "%Package%"=="pl_USB" GOTO :done

:pl_Vulkan
tar -xf %ZipDir%\pl_Vulkan.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_vulkan\pl_vulkan.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_Vulkan (pl_vulkan.lpk)>> %Log%
@IF /I "%Package%"=="pl_Vulkan" GOTO :done

:pl_win_api
tar -xf %ZipDir%\pl_win_api.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_api\pl_win_api.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_win_api (pl_win_api.lpk)>> %Log%
@IF /I "%Package%"=="pl_win_api" GOTO :done

:pl_Win_Dspack
tar -xf %ZipDir%\pl_Win_Dspack.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_dspack\pl_win_dspack.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_win_dspack (pl_win_dspack.lpk)>> %Log%
@IF /I "%Package%"=="pl_win_dspack" GOTO :done

:pl_Win_GDI
tar -xf %ZipDir%\pl_Win_GDI.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_gdi\pl_win_gdi.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_win_gdi (pl_win_gdi.lpk)>> %Log%
@IF /I "%Package%"=="pl_win_gdi" GOTO :done

:pl_Win_Media
tar -xf %ZipDir%\pl_Win_Media.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_media\pl_win_media.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_win_media (pl_win_media.lpk)>> %Log%
@IF /I "%Package%"=="pl_win_media" GOTO :done

:pl_Win_MIDI
tar -xf %ZipDir%\pl_Win_MIDI.zip ct4laz
%PathToLaz%\lazbuild -B ct4laz\pl_components\pl_win_midi\pl_win_midi.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO pl_win_midi (pl_win_midi.lpk)>> %Log%
@IF /I "%Package%"=="pl_win_midi" GOTO :done

:PlaysoundPackage
tar -xf %ZipDir%\PlaysoundPackage.zip playsoundpackage
%PathToLaz%\lazbuild -B playsoundpackage\playwavepackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PlaysoundPackage (playwavepackage.lpk)>> %Log%
@IF /I "%Package%"=="PlaysoundPackage" GOTO :done

:plotpanel-lazarus-0.97.1
tar -xf %ZipDir%\plotpanel-lazarus-0.97.1.zip plotpanel-lazarus-0.97.1
%PathToLaz%\lazbuild -B plotpanel-lazarus-0.97.1\plot.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO plotpanel-lazarus-0.97.1 (plot.lpk)>> %Log%
@IF /I "%Package%"=="plotpanel-lazarus-0.97.1" GOTO :done

:PoweredBy
tar -xf %ZipDir%\PoweredBy.zip poweredby
%PathToLaz%\lazbuild -B poweredby\poweredby.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PoweredBy (poweredby.lpk)>> %Log%
@IF /I "%Package%"=="PoweredBy" GOTO :done

:PowerPDF
tar -xf %ZipDir%\PowerPDF.zip PowerPDF
%PathToLaz%\lazbuild -B PowerPDF\pack_powerpdf.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PowerPDF (pack_powerpdf.lpk)>> %Log%
@IF /I "%Package%"=="PowerPDF" GOTO :done

:PythonForLazarus
tar -xf %ZipDir%\PythonForLazarus.zip PythonForLazarus
%PathToLaz%\lazbuild -B PythonForLazarus\python4lazarus\python4lazarus_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO PythonForLazarus (python4lazarus_package.lpk)>> %Log%
@IF /I "%Package%"=="PythonForLazarus" GOTO :done


::-------------------------------------- Q -------------------------------------

:QRCodeGenLib
tar -xf %ZipDir%\QRCodeGenLib.zip QRCodeGenLib
%PathToLaz%\lazbuild -B QRCodeGenLib\src\Packages\FPC\QRCodeGenLib4PascalPackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO QRGenLib (QRCodeGenLib4PascalPackage.lpk) >> %Log%
@IF /I "%Package%"=="QRCodeGenLib" GOTO :done


::-------------------------------------- R -------------------------------------

:Ray4Laz
tar -xf %ZipDir%\Ray4Laz.zip Ray4Laz
%PathToLaz%\lazbuild -B Ray4Laz\package\ray4laz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Ray4Laz (ray4laz.lpk) >> %Log%
%PathToLaz%\lazbuild -B Ray4Laz\package\ray4laz_designtime.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Ray4Laz (ray4laz_designtime.lpk) >> %Log%
@IF /I "%Package%"=="Ray4Laz" GOTO :done
goto :done

:RESTDataware
tar -xf %ZipDir%\RESTDataware.zip RESTDataware
%PathToLaz%\lazbuild -B RESTDataware\CORE\Packages\Lazarus\restdatawarecomponents.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RESTDataware (restdatawarecomponents.lpk) >> %Log%
@IF /I "%Package%"=="RESTDataware" GOTO :done
goto :done

:Rhl
tar -xf %ZipDir%\Rhl.zip Rhl
%PathToLaz%\lazbuild -B Rhl\rhl_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO Rhl (rhl_package.lpk) >> %Log%
@IF /I "%Package%"=="Rhl" GOTO :done
goto :done

:RhsPack
tar -xf %ZipDir%\RhsPack.zip RhsPack
%PathToLaz%\lazbuild -B RhsPack\rhspack.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RhsPack (rhspack.lpk) >> %Log%
@IF /I "%Package%"=="RhsPack" GOTO :done
goto :done

:RichMemo
tar -xf %ZipDir%\RichMemo.zip richmemo
%PathToLaz%\lazbuild -B richmemo\richmemopackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO RichMemo (richmemopackage.lpk) >> %Log%
@IF /I "%Package%"=="RichMemo" GOTO :done
goto :done

:ringwatch
tar -xf %ZipDir%\ringwatch.zip ringwatch
%PathToLaz%\lazbuild -B ringwatch\ringwatch.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ringwatch (ringwatch.lpk) >> %Log%
@IF /I "%Package%"=="ringwatch" GOTO :done
goto :done

:: RX -- already handled


::-------------------------------------- S -------------------------------------

:SAK
tar -xf %ZipDir%\SAK.zip sak
%PathToLaz%\lazbuild -B sak\sak\sak_lcl\src\sak.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO SAK (sak.lpk) >> %Log%
@IF /I "%Package%"=="SAK" GOTO :done

:ScrollText
tar -xf %ZipDir%\ScrollText.zip scrolltext
%PathToLaz%\lazbuild -B scrolltext\scrolltext.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ScrollText (scrolltext.lpk) >> %Log%
@IF /I "%Package%"=="ScrollText" GOTO :done

:: Sdpo -- already handled

:SemaphorGrid
tar -xf %ZipDir%\SemaphorGrid.zip grid_semaphor
%PathToLaz%\lazbuild -B grid_semaphor\semaphorgridlpk.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO SemaphorGrid (semaphorgridlpk.lpk) >> %Log%
@IF /I "%Package%"=="SemaphorGrid" GOTO :done

:: SimpleBaseLib -- already handled

:SlimRWLock
tar -xf %ZipDir%\SlimRWLock.zip SlimRWLock
%PathToLaz%\lazbuild -B SLIMRWLock\slimrwlock.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO SlimRWLock (slimrwlock.lpk) >> %Log%
@IF /I "%Package%"=="SlimRWLock" GOTO :done

:SMNetGradient
:SMNetGradien2.0.6
tar -xf %ZipDir%\SMNetGradient2.0.6.zip SMNetGradient2.0.6
%PathToLaz%\lazbuild -B SMNetGradient2.0.6\smnetgradientlaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO  SMNetGradient2.0.6 (smnetgradientlaz.lpk) >> %Log%
@IF /I "%Package%"=="SMNetGradient2.0.6" GOTO :done
@IF /I "%Package%"=="SMNetGradient" GOTO :done

:SortGrid
tar -xf %ZipDir%\SortGrid.zip sortgrid
%PathToLaz%\lazbuild -B sortgrid\laz_sortgrid.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO  SortGrid (laz_sortgrid.lpk) >> %Log%
@IF /I "%Package%"=="SortGrid" GOTO :done

:SpkToolbar
tar -xf %ZipDir%\SpkToolbar.zip spktoolbar
%PathToLaz%\lazbuild -B spktoolbar\spktoolbarpackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO  SpkToolbar (spktoolbarpackage.lpk) >> %Log%
@IF /I "%Package%"=="SpkToolbar" GOTO :done

:splashabout
tar -xf %ZipDir%\splashabout.zip splashabout
%PathToLaz%\lazbuild -B splashabout\splashabout.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO  splashabout (splashabout.lpk) >> %Log%
@IF /I "%Package%"=="splashabout" GOTO :done

:: Synapse40.1 -- already handled

:SynFacilSyn
tar -xf %ZipDir%\SynFacilSyn.zip "SynFacilSyn 1.21"
%PathToLaz%\lazbuild -B "SynFacilSyn 1.21\synfacilsyn.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO  SynFacilSyn (synfacilsyn.lpk) >> %Log%
@IF /I "%Package%"=="SynFacilSyn" GOTO :done

:SysTools
tar -xf %ZipDir%\SysTools.zip systools
%PathToLaz%\lazbuild -B systools\laz_systools.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO  SysTools (laz_systools.lpk) >> %Log%
%PathToLaz%\lazbuild -B systools\laz_systools_design.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO  SysTools (laz_systools_design.lpk) >> %Log%
%PathToLaz%\lazbuild -B systools\laz_systoolsdb.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO  SysTools (laz_systoolsdb.lpk) >> %Log%
%PathToLaz%\lazbuild -B systools\laz_systoolsdb_design.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO  SysTools (laz_systoolsdb_design.lpk) >> %Log%
%PathToLaz%\lazbuild -B systools\laz_systoolswin.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO  SysTools (laz_systoolswin.lpk) >> %Log%
%PathToLaz%\lazbuild -B systools\laz_systoolswin_design.lpk"
@IF %ERRORLEVEL% NEQ 0 ECHO  SysTools (laz_systoolswin_design.lpk) >> %Log%

@IF /I "%Package%"=="SysTools" GOTO :done


::-------------------------------------- T -------------------------------------

:TDINoteBook
tar -xf %ZipDir%\TDINoteBook.zip TDINoteBook
%PathToLaz%\lazbuild -B TDINoteBook\tdi.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TDINoteBook (tdi.lpk) >> %Log%
@IF /I "%Package%"=="TDINoteBook" GOTO :done

:TextViewer
tar -xf %ZipDir%\TextViewer.zip viewer
%PathToLaz%\lazbuild -B viewer\viewerpackage.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TextViewer (viewerpackage.lpk) >> %Log%
@IF /I "%Package%"=="TextViewer" GOTO :done

:TIPEdit
tar -xf %ZipDir%\TIPEdit.zip TIPEdit
%PathToLaz%\lazbuild -B TIPEdit\ipedit_pkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TIPEdit (ipedit_pkg.lpk) >> %Log%
@IF /I "%Package%"=="TIPEdit" GOTO :done

:TParadoxDataset
tar -xf %ZipDir%\TParadoxDataset.zip tparadoxdataset
%PathToLaz%\lazbuild -B tparadoxdataset\lazparadoxpkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TParadoxDataset (lazparadoxpkg.lpk) >> %Log%
@IF /I "%Package%"=="TParadoxDataset" GOTO :done

:TSalesSwitch
tar -xf %ZipDir%\TSalesSwitch.zip TSalesSwitch
%PathToLaz%\lazbuild -B TSalesSwitch\pksalesswitch.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TSalesSwitch (pksalesswitch.lpk) >> %Log%
@IF /I "%Package%"=="TSalesSwitch" GOTO :done

:TVPlanit
tar -xf %ZipDir%\TVPlanit.zip tvplanit
%PathToLaz%\lazbuild -B tvplanit\laz_visualplanit.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TVPlanit (laz_visualplanit.lpk) >> %Log%
%PathToLaz%\lazbuild -B tvplanit\laz_visualplanit_design.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TVPlanit (laz_visualplanit_design.lpk) >> %Log%
%PathToLaz%\lazbuild -B tvplanit\laz_visualplanit_zeos.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TVPlanit (laz_visualplanit_zeos.lpk) >> %Log%
%PathToLaz%\lazbuild -B tvplanit\laz_visualplanit_zeos_design.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TVPlanit (laz_visualplanit_zeos_design.lpk) >> %Log%
@IF /I "%Package%"=="TVPlanit" GOTO :done

:TwilioSMS
tar -xf %ZipDir%\TwilioSMS.zip TwilioLib
%PathToLaz%\lazbuild -B TwilioLib\twilio.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO TwilioSMS (twilio.lpk) >> %Log%
@IF /I "%Package%"=="TwilioSMS" GOTO :done


::-------------------------------------- U -------------------------------------

:UEControls
tar -xf %ZipDir%\UEControls.zip uecontrols-master
%PathToLaz%\lazbuild -B uecontrols-master\uecontrols.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO UEControls (uecontrols.lpk) >> %Log%
@IF /I "%Package%"=="UEControls" GOTO :done

:UniqueInstance
tar -xf %ZipDir%\UniqueInstance.zip uniqueinstance
%PathToLaz%\lazbuild -B uniqueinstance\uniqueinstance_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO UniqueInstance (uniqueinstance_package.lpk) >> %Log%
@IF /I "%Package%"=="UniqueInstance" GOTO :done

:UOS
tar -xf %ZipDir%\UOS.zip UOS
%PathToLaz%\lazbuild -B UOS\src\laz_uos.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO UOS (laz_uos.lpk) >> %Log%
@IF /I "%Package%"=="UOS" GOTO :done

:UserControl
tar -xf %ZipDir%\UserControl.zip UserControl
%PathToLaz%\lazbuild -B UserControl\package\lazarus\pckUserControlRuntime.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO UserControl (pckUserControlRuntime.lpk) >> %Log%
%PathToLaz%\lazbuild -B UserControl\package\lazarus\pckUserControlDesign.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO UserControl (pckUserControlDesign.lpk) >> %Log%
%PathToLaz%\lazbuild -B UserControl\package\lazarus\pckUCDataConnector.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO UserControl (pckUCDataConnector.lpk) >> %Log%
@IF /I "%Package%"=="UserControl" GOTO :done

:UTF8Tools
tar -xf %ZipDir%\UTF8Tools.zip UTF8Tools
%PathToLaz%\lazbuild -B UTF8Tools\utf8tools.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO UTF8Tools (utf8tools.lpk) >> %Log%
@IF /I "%Package%"=="UTF8Tools" GOTO :done


::-------------------------------------- V -------------------------------------

:: VampyreImaging -- already handled

:VirtualDBGrid
tar -xf %ZipDir%\VirtualDBGrid.zip virtualdbgrid
%PathToLaz%\lazbuild -B virtualdbgrid\virtualdbgrid_package.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO VirtualDBGrid (virtualdbgrid_package.lpk) >> %Log%
@IF /I "%Package%"=="VirtualDBGrid" GOTO :done

:VirtualDBTreeEx
tar -xf %ZipDir%\VirtualDBTreeEx.zip virtualdbtreeex
%PathToLaz%\lazbuild -B virtualdbtreeex\lazarus\virtualdbtreeexlaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO VirtualDBTreeEx (virtualdbtreeexlaz.lpk) >> %Log%
@IF /I "%Package%"=="VirtualDBGrid" GOTO :done

:: VirtualTreeVie2V5 --- already handled


::-------------------------------------- W -------------------------------------

:WebView4Delphi
tar -xf %ZipDir%\WebView4Delphi.zip WebView4Delphi
%PathToLaz%\lazbuild -B WebView4Delphi\packages\\webview4delphi.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO WebView4Delphi (webview4delphi.lpk) >> %Log%
@IF /I "%Package%"=="WebView4Delphi" GOTO :done

:Wst
tar -xf %ZipDir%\Wst.zip wst
%PathToLaz%\lazbuild -B wst\ide\lazarus\wst_core.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO West (wst_core.lpk) >> %Log%
%PathToLaz%\lazbuild -B wst\ide\lazarus\wst_design.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO West (wst_design.lpk) >> %Log%
%PathToLaz%\lazbuild -B wst\ide\lazarus\wst_synapse.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO West (wst_synapse.lpk) >> %Log%
%PathToLaz%\lazbuild -B wst\ide\lazarus\wst_indy.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO West (wst_indy.lpk) >> %Log%
%PathToLaz%\lazbuild -B wst\ide\lazarus\wst_fcltransport.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO West (wst_fcltransport.lpk) >> %Log%

@IF /I "%Package%"=="Wst" GOTO :done

:WThread
tar -xf %ZipDir%\WThread.zip wthread
%PathToLaz%\lazbuild -B wthread\threading.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO WThread (threading.lpk) >> %Log%
@IF /I "%Package%"=="WThread" GOTO :done

::-------------------------------------- X -------------------------------------

:XMailer
tar -xf %ZipDir%\XMailer.zip xmailer-master
%PathToLaz%\lazbuild -B xmailer-master\pkg\xmailerpkg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO XMailer (xmailerpkg.lpk) >> %Log%
@IF /I "%Package%"=="XMailer" GOTO :done

:XMLStreaming
tar -xf %ZipDir%\XMLStreaming.zip XMLStreaming
%PathToLaz%\lazbuild -B XMLStreaming\xmlstreaming.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO XMLStreaming (xmlstreaming.lpk) >> %Log%
@IF /I "%Package%"=="xmlstreaming" GOTO :done


::-------------------------------------- Z -------------------------------------

:: ZeosDBO -- already handled

:ZFMSDK
tar -xf %ZipDir%\ZFMSDK.zip zfmsdk
%PathToLaz%\lazbuild -B zfmsdk\zfmsdk.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZFMSDK (zfmsdk.lpk) >> %Log%
@IF /I "%Package%"=="ZFMSDK" GOTO :done

:ZMSQL
tar -xf %ZipDir%\ZMSQL.zip zmsql
%PathToLaz%\lazbuild -B zmsql\zmsql.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZMSQL (zmsql.lpk) >> %Log%
@IF /I "%Package%"=="ZMSQL" GOTO :done

:ZReport
tar -xf %ZipDir%\ZReport.zip ZReport
%PathToLaz%\lazbuild -B ZReport\source\zrptlaz.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZReport (zrptlaz.lpk) >> %Log%
%PathToLaz%\lazbuild -B ZReport\source\zrptlaz_dsg.lpk
@IF %ERRORLEVEL% NEQ 0 ECHO ZReport (zrptlaz_dsg.lpk) >> %Log%
@IF /I "%Package%"=="ZReport" GOTO :done

:done
ECHO Completed at %TIME% >> %Log%
