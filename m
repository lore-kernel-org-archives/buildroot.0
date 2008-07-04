From: Mark Jackson <mpfj@mimc.co.uk>
Date: Fri, 04 Jul 2008 17:00:43 +0100
Subject: [Buildroot] xlib_libX11 build error
Message-ID: <486E492B.6010905@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a problem compiling X11 ...

(1) Checked out the lastest buildroot SVN
(2) make atngw100-base_defconfig
(3) Selected CUPS and LibX11
(4) Make

I get the errors as shown below.

The "libtool: link: warning: library ".../libxcb-xlib.la" was moved" 
error is wrong ... that file *does* exist.

And you can see that the grep and sed errors appear to try accessing the 
path "/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/" 
repeated multiple times over !!

Any ideas as to what might be wrong ?

Thanks
Mark

vvvv Error Log vvvv

# make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                Ok
CC clean:                    Ok
CXX clean:                    Ok
CPP clean:                    Ok
CFLAGS clean:                    Ok
INCLUDES clean:                    Ok
CXXFLAGS clean:                    Ok
which installed:                Ok
sed works:                    Ok (/bin/sed)
GNU make version '3.81':            Ok
C compiler '/usr/bin/gcc'
C compiler version '4.2.3':            Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.2.3':            Ok
awk installed:                    Ok
bison installed:                Ok
flex installed:                    Ok
gettext installed:                Ok
makeinfo installed:                Ok
Build system dependencies:            Ok

rm -rf 
/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/buildroot-config
mkdir -p 
/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base
cp -dpRf package/config/buildroot-config 
/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/buildroot-config

 >>> xlib_libX11 1.1.3 Building

/usr/bin/make MAKE='/usr/bin/make -j1 '  -C 
/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/
make[1]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3'
Making all in include
make[2]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/include'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/include'
Making all in modules
make[2]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules'
Making all in im
make[3]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/im'
Making all in ximcp
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/im/ximcp'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/im/ximcp'
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/im'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/im'
make[3]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/im'
Making all in lc
make[3]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc'
Making all in Utf8
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/Utf8'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/Utf8'
Making all in def
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/def'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/def'
Making all in gen
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/gen'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/gen'
Making all in xlocale
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/xlocale'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc/xlocale'
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc'
make[3]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/lc'
Making all in om
make[3]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/om'
Making all in generic
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/om/generic'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/om/generic'
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/om'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/om'
make[3]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules/om'
make[3]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules'
make[3]: Nothing to be done for `all-am'.
make[3]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules'
make[2]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/modules'
Making all in src
make[2]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src'
cd util && /usr/bin/make -j1
make[3]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/util'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/util'
/usr/bin/make -j1   all-recursive
make[3]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src'
Making all in util
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/util'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/util'
Making all in xcms
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/xcms'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/xcms'
Making all in xlibi18n
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/xlibi18n'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/xlibi18n'
Making all in xkb
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/xkb'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/xkb'
make[4]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src'
cd util && /usr/bin/make -j1
make[5]: Entering directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/util'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src/util'
/bin/bash ../libtool --tag=CC   --mode=link 
/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc 
-Os  
-I/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/include 
-I/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/include 
--sysroot=/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/ 
-isysroot /usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir 
-msoft-float -I../include -I../include/X11 -I../include -I../include/X11 
-I../src/xcms -I../src/xkb -I../src/xlibi18n -Wall -Wpointer-arith 
-Wstrict-prototypes     -Wmissing-prototypes -Wmissing-declarations     
-Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN 
-DHAS_STICKY_DIR_BIT          -D_BSD_SOURCE -DX11_t -DTRANS_CLIENT  -g 
-O2 -version-number 6:2:0 -no-undefined  -o libX11.la -rpath /usr/lib 
AllCells.lo AllowEv.lo AllPlanes.lo AutoRep.lo Backgnd.lo BdrWidth.lo 
Bell.lo Border.lo ChAccCon.lo ChActPGb.lo ChClMode.lo ChCmap.lo ChGC.lo 
ChKeyCon.lo ChkIfEv.lo ChkMaskEv.lo ChkTypEv.lo ChkTypWEv.lo ChkWinEv.lo 
ChPntCon.lo ChProp.lo ChSaveSet.lo ChWAttrs.lo ChWindow.lo CirWin.lo 
CirWinDn.lo CirWinUp.lo ClDisplay.lo ClearArea.lo Clear.lo ConfWind.lo 
Context.lo ConvSel.lo CopyArea.lo CopyCmap.lo CopyGC.lo CopyPlane.lo 
CrBFData.lo CrCmap.lo CrCursor.lo CrGC.lo CrGlCur.lo CrPFBData.lo 
CrPixmap.lo CrWindow.lo Cursor.lo DefCursor.lo DelProp.lo Depths.lo 
DestSubs.lo DestWind.lo DisName.lo DrArc.lo DrArcs.lo DrLine.lo 
DrLines.lo DrPoint.lo DrPoints.lo DrRect.lo DrRects.lo DrSegs.lo 
ErrDes.lo ErrHndlr.lo evtomask.lo EvToWire.lo FetchName.lo FillArc.lo 
FillArcs.lo FillPoly.lo FillRct.lo FillRcts.lo FilterEv.lo Flush.lo 
Font.lo FontInfo.lo FontNames.lo FreeCmap.lo FreeCols.lo FreeCurs.lo 
FreeEData.lo FreeGC.lo FreePix.lo FSSaver.lo FSWrap.lo GCMisc.lo Geom.lo 
GetAtomNm.lo GetColor.lo GetDflt.lo GetFPath.lo GetFProp.lo GetGCVals.lo 
GetGeom.lo GetHColor.lo GetHints.lo GetIFocus.lo GetImage.lo GetKCnt.lo 
GetMoEv.lo GetNrmHint.lo GetPCnt.lo GetPntMap.lo GetProp.lo 
GetRGBCMap.lo GetSOwner.lo GetSSaver.lo GetStCmap.lo GetTxtProp.lo 
GetWAttrs.lo GetWMCMapW.lo GetWMProto.lo globals.lo GrButton.lo 
GrKeybd.lo GrKey.lo GrPointer.lo GrServer.lo Host.lo Iconify.lo 
IfEvent.lo imConv.lo ImText16.lo ImText.lo ImUtil.lo InitExt.lo 
InsCmap.lo IntAtom.lo KeyBind.lo KeysymStr.lo KillCl.lo LiHosts.lo 
LiICmaps.lo LiProps.lo ListExt.lo LoadFont.lo LockDis.lo locking.lo 
LookupCol.lo LowerWin.lo Macros.lo MapRaised.lo MapSubs.lo MapWindow.lo 
MaskEvent.lo Misc.lo ModMap.lo MoveWin.lo NextEvent.lo OCWrap.lo 
OMWrap.lo OpenDis.lo ParseCmd.lo ParseCol.lo ParseGeom.lo PeekEvent.lo 
PeekIfEv.lo Pending.lo PixFormats.lo PmapBgnd.lo PmapBord.lo PolyReg.lo 
PolyTxt16.lo PolyTxt.lo PropAlloc.lo PutBEvent.lo PutImage.lo Quarks.lo 
QuBest.lo QuColor.lo QuColors.lo QuCurShp.lo QuExt.lo QuKeybd.lo 
QuPntr.lo QuStipShp.lo QuTextE16.lo QuTextExt.lo QuTileShp.lo QuTree.lo 
RaiseWin.lo RdBitF.lo RecolorC.lo ReconfWin.lo ReconfWM.lo Region.lo 
RegstFlt.lo RepWindow.lo RestackWs.lo RotProp.lo ScrResStr.lo 
SelInput.lo SendEvent.lo SetBack.lo SetClMask.lo SetClOrig.lo 
SetCRects.lo SetDashes.lo SetFont.lo SetFore.lo SetFPath.lo SetFunc.lo 
SetHints.lo SetIFocus.lo SetLocale.lo SetLStyle.lo SetNrmHint.lo 
SetPMask.lo SetPntMap.lo SetRGBCMap.lo SetSOwner.lo SetSSaver.lo 
SetState.lo SetStCmap.lo SetStip.lo SetTile.lo SetTSOrig.lo 
SetTxtProp.lo SetWMCMapW.lo SetWMProto.lo StBytes.lo StColor.lo 
StColors.lo StName.lo StNColor.lo StrKeysym.lo StrToText.lo Sync.lo 
Synchro.lo Text16.lo Text.lo TextExt16.lo TextExt.lo TextToStr.lo 
TrCoords.lo UndefCurs.lo UngrabBut.lo UngrabKbd.lo UngrabKey.lo 
UngrabPtr.lo UngrabSvr.lo UninsCmap.lo UnldFont.lo UnmapSubs.lo 
UnmapWin.lo VisUtil.lo WarpPtr.lo Window.lo WinEvent.lo Withdraw.lo 
WMGeom.lo WMProps.lo WrBitF.lo XlibAsync.lo XlibInt.lo Xrm.lo    
xcb_lock.lo xcb_disp.lo xcb_io.lo  xlibi18n/libi18n.la xcms/libxcms.la 
xkb/libxkb.la -lxcb-xlib -lxcb      -ldl
libtool: link: warning: library 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/avr32-linux-uclibc/lib/libxcb-xlib.la' 
was moved.
grep: 
/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/libxcb-1.1/src/libxcb.la: 
No such file or directory
/usr/local/dev/avr32/buildroot-cvs/toolchain_build_avr32/bin/sed: can't 
read 
/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/libxcb-1.1/src/libxcb.la: 
No such file or directory
libtool: link: 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/staging_dir/usr/local/dev/avr32/buildroot-cvs/build_avr32/libxcb-1.1/src/libxcb.la' 
is not a valid libtool archive
make[4]: *** [libX11.la] Error 1
make[4]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src'
make[2]: *** [all] Error 2
make[2]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory 
`/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3'
make: *** 
[/usr/local/dev/avr32/buildroot-cvs/build_avr32/xlib_libX11-1.1.3/.stamp_built] 
Error 2
mpfj at mpfj-ubuntu:/usr/local/dev/avr32/buildroot$
