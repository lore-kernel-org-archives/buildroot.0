From: bastisoft at arcor.de <bastisoft@arcor.de>
Date: Sat, 9 Feb 2008 19:32:25 +0100 (CET)
Subject: [Buildroot] Error while building x11r7
Message-ID: <19548710.1202581945072.JavaMail.ngmail@webmail18>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to build x11r7 for i486, but it fails and I have no idea why:

...
/bin/sh ../libtool --tag=CC   --mode=link /usr/local/uclibc/usr/bin/i486-linux-uclibc-gcc -Os -pipe  -I/usr/local/uclibc/usr/include -I/usr/local/uclibc/include --sysroot=/usr/local/uclibc/ -isysroot /usr/local/uclibc -mtune=i486 -march=i486 -I../include -I../include/X11 -I../include -I../include/X11 -I../src/xcms -I../src/xkb -I../src/xlibi18n -Wall -Wpointer-arith -Wstrict-prototypes 	-Wmissing-prototypes -Wmissing-declarations 	-Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT -I/usr/local/uclibc/usr/include    -I/usr/local/uclibc/usr/include   -I/usr/local/uclibc/usr/include   -I/usr/local/uclibc/usr/include    -D_BSD_SOURCE -DX11_t -DTRANS_CLIENT  -g -O2 -version-number 6:2:0 -no-undefined  -o libX11.la -rpath /usr/lib AllCells.lo AllowEv.lo AllPlanes.lo AutoRep.lo Backgnd.lo BdrWidth.lo Bell.lo Border.lo ChAccCon.lo ChActPGb.lo ChClMode.lo ChCmap.lo ChGC.lo ChKeyCon.lo ChkIfEv.lo ChkMaskEv.lo ChkTypEv.lo ChkTypWEv.lo ChkWinEv.lo ChPntCon.lo ChProp.lo ChSaveSet.lo ChWAttrs.lo ChWindow.lo CirWin.lo CirWinDn.lo CirWinUp.lo ClDisplay.lo ClearArea.lo Clear.lo ConfWind.lo Context.lo ConvSel.lo CopyArea.lo CopyCmap.lo CopyGC.lo CopyPlane.lo CrBFData.lo CrCmap.lo CrCursor.lo CrGC.lo CrGlCur.lo CrPFBData.lo CrPixmap.lo CrWindow.lo Cursor.lo DefCursor.lo DelProp.lo Depths.lo DestSubs.lo DestWind.lo DisName.lo DrArc.lo DrArcs.lo DrLine.lo DrLines.lo DrPoint.lo DrPoints.lo DrRect.lo DrRects.lo DrSegs.lo ErrDes.lo ErrHndlr.lo evtomask.lo EvToWire.lo FetchName.lo FillArc.lo FillArcs.lo FillPoly.lo FillRct.lo FillRcts.lo FilterEv.lo Flush.lo Font.lo FontInfo.lo FontNames.lo FreeCmap.lo FreeCols.lo FreeCurs.lo FreeEData.lo FreeGC.lo FreePix.lo FSSaver.lo FSWrap.lo GCMisc.lo Geom.lo GetAtomNm.lo GetColor.lo GetDflt.lo GetFPath.lo GetFProp.lo GetGCVals.lo GetGeom.lo GetHColor.lo GetHints.lo GetIFocus.lo GetImage.lo GetKCnt.lo GetMoEv.lo GetNrmHint.lo GetPCnt.lo GetPntMap.lo GetProp.lo GetRGBCMap.lo GetSOwner.lo GetSSaver.lo GetStCmap.lo GetTxtProp.lo GetWAttrs.lo GetWMCMapW.lo GetWMProto.lo globals.lo GrButton.lo GrKeybd.lo GrKey.lo GrPointer.lo GrServer.lo Host.lo Iconify.lo IfEvent.lo imConv.lo ImText16.lo ImText.lo ImUtil.lo InitExt.lo InsCmap.lo IntAtom.lo KeyBind.lo KeysymStr.lo KillCl.lo LiHosts.lo LiICmaps.lo LiProps.lo ListExt.lo LoadFont.lo LockDis.lo locking.lo LookupCol.lo LowerWin.lo Macros.lo MapRaised.lo MapSubs.lo MapWindow.lo MaskEvent.lo Misc.lo ModMap.lo MoveWin.lo NextEvent.lo OCWrap.lo OMWrap.lo OpenDis.lo ParseCmd.lo ParseCol.lo ParseGeom.lo PeekEvent.lo PeekIfEv.lo Pending.lo PixFormats.lo PmapBgnd.lo PmapBord.lo PolyReg.lo PolyTxt16.lo PolyTxt.lo PropAlloc.lo PutBEvent.lo PutImage.lo Quarks.lo QuBest.lo QuColor.lo QuColors.lo QuCurShp.lo QuExt.lo QuKeybd.lo QuPntr.lo QuStipShp.lo QuTextE16.lo QuTextExt.lo QuTileShp.lo QuTree.lo RaiseWin.lo RdBitF.lo RecolorC.lo ReconfWin.lo ReconfWM.lo Region.lo RegstFlt.lo RepWindow.lo RestackWs.lo RotProp.lo ScrResStr.lo SelInput.lo SendEvent.lo SetBack.lo SetClMask.lo SetClOrig.lo SetCRects.lo SetDashes.lo SetFont.lo SetFore.lo SetFPath.lo SetFunc.lo SetHints.lo SetIFocus.lo SetLocale.lo SetLStyle.lo SetNrmHint.lo SetPMask.lo SetPntMap.lo SetRGBCMap.lo SetSOwner.lo SetSSaver.lo SetState.lo SetStCmap.lo SetStip.lo SetTile.lo SetTSOrig.lo SetTxtProp.lo SetWMCMapW.lo SetWMProto.lo StBytes.lo StColor.lo StColors.lo StName.lo StNColor.lo StrKeysym.lo StrToText.lo Sync.lo Synchro.lo Text16.lo Text.lo TextExt16.lo TextExt.lo TextToStr.lo TrCoords.lo UndefCurs.lo UngrabBut.lo UngrabKbd.lo UngrabKey.lo UngrabPtr.lo UngrabSvr.lo UninsCmap.lo UnldFont.lo UnmapSubs.lo UnmapWin.lo VisUtil.lo WarpPtr.lo Window.lo WinEvent.lo Withdraw.lo WMGeom.lo WMProps.lo WrBitF.lo XlibAsync.lo XlibInt.lo Xrm.lo    xcb_lock.lo xcb_disp.lo xcb_io.lo  xlibi18n/libi18n.la xcms/libxcms.la xkb/libxkb.la -L/usr/local/uclibc/usr/lib -lxcb-xlib -lxcb      -ldl 
libtool: link: warning: library `/usr/local/uclibc/usr/lib/libxcb-xlib.la' was moved.
grep: /usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/lib/libxcb.la: No such file or directory
/home/basti/linux/buildroot/toolchain_build_i486/bin/sed: can't read /usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/lib/libxcb.la: No such file or directory
libtool: link: `/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/local/uclibc/usr/lib/libxcb.la' is not a valid libtool archive
make[4]: *** [libX11.la] Error 1
make[4]: Leaving directory `/home/basti/linux/buildroot/build_i486/xlib_libX11-1.1.1/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/home/basti/linux/buildroot/build_i486/xlib_libX11-1.1.1/src'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/basti/linux/buildroot/build_i486/xlib_libX11-1.1.1/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/basti/linux/buildroot/build_i486/xlib_libX11-1.1.1'
make: *** [/home/basti/linux/buildroot/build_i486/xlib_libX11-1.1.1/.stamp_built] Error 2
basti at notizbuch:~/linux/buildroot$ 
...

When I link /usr/local/uclibc/usr/ to /usr, I get further. But then I get another error later saying that I have too many symlink redirections. Why does this happen?

The toolchain is installed into /usr/local/uclibc/ (user "basti" is owner of this directory and may write into it). The toolchain itself is working well; the buildroot I am using is recent fetched from SVN. The build system is debian testing on x86_64.

I hope someone can help me, as I have no idea anymore. Thank you for your efforts.

Best regards,
Sebastian


Viel oder wenig? Schnell oder langsam? Unbegrenzt surfen + telefonieren
ohne Zeit- und Volumenbegrenzung? DAS TOP ANGEBOT F?R ALLE NEUEINSTEIGER
Jetzt bei Arcor: g?nstig und schnell mit DSL - das All-Inclusive-Paket
f?r clevere Doppel-Sparer, nur  29,95 Euro  inkl. DSL- und ISDN-Grundgeb?hr!
http://www.arcor.de/rd/emf-dsl-2
