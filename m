From: Julian Lunz <git@jlunz.de>
Date: Tue, 08 Nov 2011 19:13:33 -0000
Subject: [Buildroot] [PATCH] x11r7: Reorganize x11r7-dir to reflect
	menuconfig
Message-ID: <1320779069-6385-1-git-send-email-git@jlunz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The X Window System has a nice organization in menuconfig,
this patch reflects the structure in the package directory.

Signed-off-by: Julian Lunz <git@jlunz.de>
---
 package/x11r7/Config.in                            |  512 ++++++++++----------
 package/x11r7/applications/xapp_appres/Config.in   |    6 +
 .../x11r7/applications/xapp_appres/xapp_appres.mk  |   12 +
 package/x11r7/applications/xapp_bdftopcf/Config.in |    5 +
 .../applications/xapp_bdftopcf/xapp_bdftopcf.mk    |   14 +
 .../x11r7/applications/xapp_beforelight/Config.in  |    8 +
 .../xapp_beforelight/xapp_beforelight.mk           |   12 +
 package/x11r7/applications/xapp_bitmap/Config.in   |    8 +
 .../x11r7/applications/xapp_bitmap/xapp_bitmap.mk  |   12 +
 package/x11r7/applications/xapp_editres/Config.in  |    8 +
 .../applications/xapp_editres/xapp_editres.mk      |   12 +
 .../x11r7/applications/xapp_fonttosfnt/Config.in   |    7 +
 .../xapp_fonttosfnt/xapp_fonttosfnt.mk             |   12 +
 .../x11r7/applications/xapp_fslsfonts/Config.in    |    6 +
 .../applications/xapp_fslsfonts/xapp_fslsfonts.mk  |   12 +
 package/x11r7/applications/xapp_fstobdf/Config.in  |    6 +
 .../applications/xapp_fstobdf/xapp_fstobdf.mk      |   12 +
 package/x11r7/applications/xapp_iceauth/Config.in  |    6 +
 .../applications/xapp_iceauth/xapp_iceauth.mk      |   12 +
 package/x11r7/applications/xapp_ico/Config.in      |    5 +
 package/x11r7/applications/xapp_ico/xapp_ico.mk    |   12 +
 package/x11r7/applications/xapp_listres/Config.in  |    8 +
 .../applications/xapp_listres/xapp_listres.mk      |   12 +
 package/x11r7/applications/xapp_luit/Config.in     |    6 +
 package/x11r7/applications/xapp_luit/xapp_luit.mk  |   12 +
 .../x11r7/applications/xapp_mkfontdir/Config.in    |    5 +
 .../applications/xapp_mkfontdir/xapp_mkfontdir.mk  |   14 +
 .../x11r7/applications/xapp_mkfontscale/Config.in  |    7 +
 .../xapp_mkfontscale/xapp_mkfontscale.mk           |   14 +
 package/x11r7/applications/xapp_oclock/Config.in   |    7 +
 .../x11r7/applications/xapp_oclock/xapp_oclock.mk  |   12 +
 package/x11r7/applications/xapp_rgb/Config.in      |    5 +
 package/x11r7/applications/xapp_rgb/xapp_rgb.mk    |   12 +
 package/x11r7/applications/xapp_rstart/Config.in   |    5 +
 .../x11r7/applications/xapp_rstart/xapp_rstart.mk  |   12 +
 package/x11r7/applications/xapp_scripts/Config.in  |    5 +
 .../applications/xapp_scripts/xapp_scripts.mk      |   12 +
 package/x11r7/applications/xapp_sessreg/Config.in  |    6 +
 .../applications/xapp_sessreg/xapp_sessreg.mk      |   12 +
 .../x11r7/applications/xapp_setxkbmap/Config.in    |    6 +
 .../applications/xapp_setxkbmap/xapp_setxkbmap.mk  |   12 +
 package/x11r7/applications/xapp_showfont/Config.in |    5 +
 .../applications/xapp_showfont/xapp_showfont.mk    |   12 +
 package/x11r7/applications/xapp_smproxy/Config.in  |    6 +
 .../applications/xapp_smproxy/xapp_smproxy.mk      |   12 +
 package/x11r7/applications/xapp_twm/Config.in      |    8 +
 package/x11r7/applications/xapp_twm/xapp_twm.mk    |   12 +
 package/x11r7/applications/xapp_viewres/Config.in  |    5 +
 .../applications/xapp_viewres/xapp_viewres.mk      |   12 +
 package/x11r7/applications/xapp_x11perf/Config.in  |    7 +
 .../applications/xapp_x11perf/xapp_x11perf.mk      |   12 +
 package/x11r7/applications/xapp_xauth/Config.in    |    8 +
 .../xapp_xauth/xapp_xauth-1.0.3-xcb.patch          |   11 +
 .../x11r7/applications/xapp_xauth/xapp_xauth.mk    |   12 +
 .../x11r7/applications/xapp_xbacklight/Config.in   |    7 +
 .../xapp_xbacklight/xapp_xbacklight.mk             |   12 +
 package/x11r7/applications/xapp_xbiff/Config.in    |    6 +
 .../x11r7/applications/xapp_xbiff/xapp_xbiff.mk    |   12 +
 package/x11r7/applications/xapp_xcalc/Config.in    |    5 +
 .../x11r7/applications/xapp_xcalc/xapp_xcalc.mk    |   13 +
 .../x11r7/applications/xapp_xclipboard/Config.in   |    5 +
 .../xapp_xclipboard/xapp_xclipboard.mk             |   12 +
 package/x11r7/applications/xapp_xclock/Config.in   |    9 +
 .../x11r7/applications/xapp_xclock/xapp_xclock.mk  |   12 +
 package/x11r7/applications/xapp_xcmsdb/Config.in   |    5 +
 .../x11r7/applications/xapp_xcmsdb/xapp_xcmsdb.mk  |   12 +
 .../x11r7/applications/xapp_xcursorgen/Config.in   |    7 +
 .../xapp_xcursorgen/xapp_xcursorgen.mk             |   15 +
 .../x11r7/applications/xapp_xdbedizzy/Config.in    |    7 +
 .../applications/xapp_xdbedizzy/xapp_xdbedizzy.mk  |   12 +
 package/x11r7/applications/xapp_xditview/Config.in |    5 +
 .../applications/xapp_xditview/xapp_xditview.mk    |   12 +
 package/x11r7/applications/xapp_xdm/Config.in      |   14 +
 package/x11r7/applications/xapp_xdm/xapp_xdm.mk    |   13 +
 package/x11r7/applications/xapp_xdpyinfo/Config.in |   18 +
 .../applications/xapp_xdpyinfo/xapp_xdpyinfo.mk    |   12 +
 package/x11r7/applications/xapp_xdriinfo/Config.in |    7 +
 .../applications/xapp_xdriinfo/xapp_xdriinfo.mk    |   12 +
 package/x11r7/applications/xapp_xedit/Config.in    |    6 +
 .../x11r7/applications/xapp_xedit/xapp_xedit.mk    |   12 +
 package/x11r7/applications/xapp_xev/Config.in      |    5 +
 package/x11r7/applications/xapp_xev/xapp_xev.mk    |   12 +
 package/x11r7/applications/xapp_xeyes/Config.in    |    8 +
 .../x11r7/applications/xapp_xeyes/xapp_xeyes.mk    |   12 +
 package/x11r7/applications/xapp_xf86dga/Config.in  |    6 +
 .../applications/xapp_xf86dga/xapp_xf86dga.mk      |   12 +
 package/x11r7/applications/xapp_xfd/Config.in      |    8 +
 package/x11r7/applications/xapp_xfd/xapp_xfd.mk    |   12 +
 package/x11r7/applications/xapp_xfontsel/Config.in |    5 +
 .../applications/xapp_xfontsel/xapp_xfontsel.mk    |   12 +
 package/x11r7/applications/xapp_xfs/Config.in      |    7 +
 package/x11r7/applications/xapp_xfs/xapp_xfs.mk    |   12 +
 package/x11r7/applications/xapp_xfsinfo/Config.in  |    6 +
 .../applications/xapp_xfsinfo/xapp_xfsinfo.mk      |   12 +
 package/x11r7/applications/xapp_xgamma/Config.in   |    5 +
 .../x11r7/applications/xapp_xgamma/xapp_xgamma.mk  |   12 +
 package/x11r7/applications/xapp_xgc/Config.in      |    5 +
 package/x11r7/applications/xapp_xgc/xapp_xgc.mk    |   12 +
 package/x11r7/applications/xapp_xhost/Config.in    |    6 +
 .../x11r7/applications/xapp_xhost/xapp_xhost.mk    |   12 +
 package/x11r7/applications/xapp_xinit/Config.in    |    6 +
 .../x11r7/applications/xapp_xinit/xapp_xinit.mk    |   12 +
 package/x11r7/applications/xapp_xinput/Config.in   |    6 +
 .../x11r7/applications/xapp_xinput/xapp_xinput.mk  |   12 +
 package/x11r7/applications/xapp_xkbcomp/Config.in  |    6 +
 .../applications/xapp_xkbcomp/xapp_xkbcomp.mk      |   14 +
 package/x11r7/applications/xapp_xkbevd/Config.in   |    5 +
 .../x11r7/applications/xapp_xkbevd/xapp_xkbevd.mk  |   12 +
 package/x11r7/applications/xapp_xkbprint/Config.in |    5 +
 .../applications/xapp_xkbprint/xapp_xkbprint.mk    |   12 +
 package/x11r7/applications/xapp_xkbutils/Config.in |    6 +
 .../applications/xapp_xkbutils/xapp_xkbutils.mk    |   12 +
 package/x11r7/applications/xapp_xkill/Config.in    |    6 +
 .../x11r7/applications/xapp_xkill/xapp_xkill.mk    |   12 +
 package/x11r7/applications/xapp_xload/Config.in    |    5 +
 .../x11r7/applications/xapp_xload/xapp_xload.mk    |   12 +
 package/x11r7/applications/xapp_xlogo/Config.in    |    8 +
 .../x11r7/applications/xapp_xlogo/xapp_xlogo.mk    |   13 +
 package/x11r7/applications/xapp_xlsatoms/Config.in |    6 +
 .../applications/xapp_xlsatoms/xapp_xlsatoms.mk    |   12 +
 .../x11r7/applications/xapp_xlsclients/Config.in   |    6 +
 .../xapp_xlsclients/xapp_xlsclients.mk             |   12 +
 package/x11r7/applications/xapp_xlsfonts/Config.in |    5 +
 .../applications/xapp_xlsfonts/xapp_xlsfonts.mk    |   12 +
 package/x11r7/applications/xapp_xmag/Config.in     |    5 +
 package/x11r7/applications/xapp_xmag/xapp_xmag.mk  |   12 +
 package/x11r7/applications/xapp_xman/Config.in     |    4 +
 package/x11r7/applications/xapp_xman/xapp_xman.mk  |   17 +
 package/x11r7/applications/xapp_xmessage/Config.in |    5 +
 .../applications/xapp_xmessage/xapp_xmessage.mk    |   12 +
 package/x11r7/applications/xapp_xmh/Config.in      |    5 +
 package/x11r7/applications/xapp_xmh/xapp_xmh.mk    |   12 +
 package/x11r7/applications/xapp_xmodmap/Config.in  |    5 +
 .../applications/xapp_xmodmap/xapp_xmodmap.mk      |   12 +
 package/x11r7/applications/xapp_xmore/Config.in    |    6 +
 .../x11r7/applications/xapp_xmore/xapp_xmore.mk    |   12 +
 .../x11r7/applications/xapp_xplsprinters/Config.in |    7 +
 .../xapp_xplsprinters/xapp_xplsprinters.mk         |   12 +
 package/x11r7/applications/xapp_xpr/Config.in      |    6 +
 package/x11r7/applications/xapp_xpr/xapp_xpr.mk    |   12 +
 .../xapp_xprehashprinterlist/Config.in             |    6 +
 .../xapp_xprehashprinterlist.mk                    |   12 +
 package/x11r7/applications/xapp_xprop/Config.in    |    6 +
 .../x11r7/applications/xapp_xprop/xapp_xprop.mk    |   12 +
 package/x11r7/applications/xapp_xrandr/Config.in   |    6 +
 .../xapp_xrandr-1.2.3-clone-redef.patch            |   29 ++
 .../x11r7/applications/xapp_xrandr/xapp_xrandr.mk  |   13 +
 package/x11r7/applications/xapp_xrdb/Config.in     |    6 +
 package/x11r7/applications/xapp_xrdb/xapp_xrdb.mk  |   12 +
 package/x11r7/applications/xapp_xrefresh/Config.in |    5 +
 .../applications/xapp_xrefresh/xapp_xrefresh.mk    |   12 +
 package/x11r7/applications/xapp_xset/Config.in     |    6 +
 package/x11r7/applications/xapp_xset/xapp_xset.mk  |   12 +
 package/x11r7/applications/xapp_xsetmode/Config.in |    6 +
 .../applications/xapp_xsetmode/xapp_xsetmode.mk    |   12 +
 .../x11r7/applications/xapp_xsetpointer/Config.in  |    7 +
 .../xapp_xsetpointer/xapp_xsetpointer.mk           |   12 +
 package/x11r7/applications/xapp_xsetroot/Config.in |    7 +
 .../applications/xapp_xsetroot/xapp_xsetroot.mk    |   12 +
 package/x11r7/applications/xapp_xsm/Config.in      |    5 +
 package/x11r7/applications/xapp_xsm/xapp_xsm.mk    |   12 +
 package/x11r7/applications/xapp_xstdcmap/Config.in |    6 +
 .../applications/xapp_xstdcmap/xapp_xstdcmap.mk    |   12 +
 package/x11r7/applications/xapp_xvidtune/Config.in |    6 +
 .../applications/xapp_xvidtune/xapp_xvidtune.mk    |   12 +
 package/x11r7/applications/xapp_xvinfo/Config.in   |    6 +
 .../x11r7/applications/xapp_xvinfo/xapp_xvinfo.mk  |   12 +
 package/x11r7/applications/xapp_xwd/Config.in      |    6 +
 package/x11r7/applications/xapp_xwd/xapp_xwd.mk    |   12 +
 package/x11r7/applications/xapp_xwininfo/Config.in |    6 +
 .../applications/xapp_xwininfo/xapp_xwininfo.mk    |   12 +
 package/x11r7/applications/xapp_xwud/Config.in     |    5 +
 package/x11r7/applications/xapp_xwud/xapp_xwud.mk  |   12 +
 .../drivers/xdriver_xf86-input-acecad/Config.in    |    8 +
 .../xdriver_xf86-input-acecad.mk                   |   12 +
 .../drivers/xdriver_xf86-input-aiptek/Config.in    |    8 +
 .../xdriver_xf86-input-aiptek.mk                   |   12 +
 .../drivers/xdriver_xf86-input-evdev/Config.in     |    8 +
 .../xdriver_xf86-input-evdev.mk                    |   12 +
 .../drivers/xdriver_xf86-input-joystick/Config.in  |    8 +
 .../xdriver_xf86-input-joystick.mk                 |   12 +
 .../drivers/xdriver_xf86-input-keyboard/Config.in  |    9 +
 .../xdriver_xf86-input-keyboard.mk                 |   12 +
 .../drivers/xdriver_xf86-input-mouse/Config.in     |    8 +
 .../xdriver_xf86-input-mouse.mk                    |   12 +
 .../drivers/xdriver_xf86-input-synaptics/Config.in |    8 +
 .../xdriver_xf86-input-synaptics.mk                |   12 +
 .../drivers/xdriver_xf86-input-vmmouse/Config.in   |    8 +
 .../xdriver_xf86-input-vmmouse.mk                  |   12 +
 .../drivers/xdriver_xf86-input-void/Config.in      |    8 +
 .../xdriver_xf86-input-void.mk                     |   12 +
 .../x11r7/drivers/xdriver_xf86-video-apm/Config.in |   12 +
 .../xdriver_xf86-video-apm.mk                      |   12 +
 .../x11r7/drivers/xdriver_xf86-video-ark/Config.in |   10 +
 .../xdriver_xf86-video-ark.mk                      |   12 +
 .../x11r7/drivers/xdriver_xf86-video-ast/Config.in |    4 +
 .../xdriver_xf86-video-ast.mk                      |   11 +
 .../x11r7/drivers/xdriver_xf86-video-ati/Config.in |   15 +
 .../xdriver_xf86-video-ati-cross-compile.patch     |   27 +
 .../xdriver_xf86-video-ati.mk                      |   13 +
 .../drivers/xdriver_xf86-video-chips/Config.in     |   10 +
 .../xdriver_xf86-video-chips.mk                    |   12 +
 .../drivers/xdriver_xf86-video-cirrus/Config.in    |   11 +
 .../xdriver_xf86-video-cirrus.mk                   |   12 +
 .../drivers/xdriver_xf86-video-dummy/Config.in     |   11 +
 .../xdriver_xf86-video-dummy.mk                    |   12 +
 .../drivers/xdriver_xf86-video-fbdev/Config.in     |   10 +
 .../xdriver_xf86-video-fbdev.mk                    |   12 +
 .../drivers/xdriver_xf86-video-geode/Config.in     |   10 +
 .../xdriver_xf86-video-geode.mk                    |   12 +
 .../drivers/xdriver_xf86-video-glide/Config.in     |   11 +
 .../xdriver_xf86-video-glide.mk                    |   12 +
 .../drivers/xdriver_xf86-video-glint/Config.in     |   16 +
 ...iver_xf86-video-glint-1.2.1-cross-compile.patch |   29 ++
 .../xdriver_xf86-video-glint.mk                    |   13 +
 .../drivers/xdriver_xf86-video-i128/Config.in      |   11 +
 .../xdriver_xf86-video-i128.mk                     |   12 +
 .../drivers/xdriver_xf86-video-i740/Config.in      |   11 +
 .../xdriver_xf86-video-i740.mk                     |   12 +
 .../drivers/xdriver_xf86-video-intel/Config.in     |   12 +
 ...ver_xf86-video-intel-2.10.0-cross-compile.patch |   11 +
 ...iver_xf86-video-intel-2.9.1-cross-compile.patch |   25 +
 .../xdriver_xf86-video-intel.mk                    |   14 +
 .../drivers/xdriver_xf86-video-mach64/Config.in    |   11 +
 .../xdriver_xf86-video-mach64-cross-compile.patch  |   27 +
 .../xdriver_xf86-video-mach64.mk                   |   13 +
 .../x11r7/drivers/xdriver_xf86-video-mga/Config.in |   15 +
 .../xdriver_xf86-video-mga-1.4.9.patch             |   21 +
 .../xdriver_xf86-video-mga.mk                      |   13 +
 .../drivers/xdriver_xf86-video-neomagic/Config.in  |   12 +
 .../xdriver_xf86-video-neomagic.mk                 |   12 +
 .../drivers/xdriver_xf86-video-newport/Config.in   |   10 +
 .../xdriver_xf86-video-newport.mk                  |   12 +
 .../x11r7/drivers/xdriver_xf86-video-nv/Config.in  |   11 +
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |   12 +
 .../xdriver_xf86-video-openchrome/Config.in        |   17 +
 ...86-video-openchrome-0.2.904-cross-compile.patch |   21 +
 .../xdriver_xf86-video-openchrome.mk               |   27 +
 .../drivers/xdriver_xf86-video-r128/Config.in      |   11 +
 .../xdriver_xf86-video-r128-cross-compile.patch    |   27 +
 .../xdriver_xf86-video-r128.mk                     |   13 +
 .../drivers/xdriver_xf86-video-rendition/Config.in |   10 +
 .../xdriver_xf86-video-rendition.mk                |   12 +
 .../x11r7/drivers/xdriver_xf86-video-s3/Config.in  |   11 +
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |   12 +
 .../drivers/xdriver_xf86-video-s3virge/Config.in   |   11 +
 .../xdriver_xf86-video-s3virge.mk                  |   12 +
 .../drivers/xdriver_xf86-video-savage/Config.in    |   14 +
 ...ver_xf86-video-savage-2.2.1-cross-compile.patch |   27 +
 .../xdriver_xf86-video-savage.mk                   |   13 +
 .../xdriver_xf86-video-siliconmotion/Config.in     |   11 +
 .../xdriver_xf86-video-siliconmotion.mk            |   12 +
 .../x11r7/drivers/xdriver_xf86-video-sis/Config.in |   16 +
 .../xdriver_xf86-video-sis-0.10.0.patch            |   21 +
 .../xdriver_xf86-video-sis.mk                      |   13 +
 .../drivers/xdriver_xf86-video-sisusb/Config.in    |   12 +
 .../xdriver_xf86-video-sisusb.mk                   |   12 +
 .../drivers/xdriver_xf86-video-suncg14/Config.in   |    9 +
 .../xdriver_xf86-video-suncg14.mk                  |   12 +
 .../drivers/xdriver_xf86-video-suncg3/Config.in    |    9 +
 .../xdriver_xf86-video-suncg3.mk                   |   12 +
 .../drivers/xdriver_xf86-video-suncg6/Config.in    |    9 +
 .../xdriver_xf86-video-suncg6.mk                   |   12 +
 .../drivers/xdriver_xf86-video-sunffb/Config.in    |   12 +
 .../xdriver_xf86-video-sunffb.mk                   |   12 +
 .../drivers/xdriver_xf86-video-sunleo/Config.in    |    9 +
 .../xdriver_xf86-video-sunleo.mk                   |   12 +
 .../drivers/xdriver_xf86-video-suntcx/Config.in    |    9 +
 .../xdriver_xf86-video-suntcx.mk                   |   12 +
 .../drivers/xdriver_xf86-video-tdfx/Config.in      |   14 +
 .../xdriver_xf86-video-tdfx-1.4.0.patch            |   24 +
 .../xdriver_xf86-video-tdfx.mk                     |   13 +
 .../x11r7/drivers/xdriver_xf86-video-tga/Config.in |   12 +
 .../xdriver_xf86-video-tga.mk                      |   12 +
 .../drivers/xdriver_xf86-video-trident/Config.in   |   12 +
 .../xdriver_xf86-video-trident.mk                  |   12 +
 .../drivers/xdriver_xf86-video-tseng/Config.in     |   11 +
 .../xdriver_xf86-video-tseng.mk                    |   12 +
 .../x11r7/drivers/xdriver_xf86-video-v4l/Config.in |    8 +
 .../xdriver_xf86-video-v4l.mk                      |   12 +
 .../drivers/xdriver_xf86-video-vesa/Config.in      |   10 +
 .../xdriver_xf86-video-vesa-2.0.0.patch            |   13 +
 .../xdriver_xf86-video-vesa.mk                     |   13 +
 .../drivers/xdriver_xf86-video-vmware/Config.in    |   11 +
 .../xdriver_xf86-video-vmware.mk                   |   12 +
 .../drivers/xdriver_xf86-video-voodoo/Config.in    |   11 +
 .../xdriver_xf86-video-voodoo.mk                   |   12 +
 .../drivers/xdriver_xf86-video-wsfb/Config.in      |   11 +
 .../xdriver_xf86-video-wsfb.mk                     |   12 +
 .../x11r7/drivers/xdriver_xf86-video-xgi/Config.in |   11 +
 .../xdriver_xf86-video-xgi-cross-compile.patch     |   24 +
 .../xdriver_xf86-video-xgi.mk                      |   13 +
 .../drivers/xdriver_xf86-video-xgixp/Config.in     |   11 +
 .../xdriver_xf86-video-xgixp-cross-compile.patch   |   24 +
 .../xdriver_xf86-video-xgixp.mk                    |   13 +
 package/x11r7/fonts/xfont_encodings/Config.in      |    4 +
 .../x11r7/fonts/xfont_encodings/xfont_encodings.mk |   15 +
 .../x11r7/fonts/xfont_font-adobe-100dpi/Config.in  |    4 +
 .../xfont_font-adobe-100dpi.mk                     |   15 +
 .../x11r7/fonts/xfont_font-adobe-75dpi/Config.in   |    4 +
 .../xfont_font-adobe-75dpi.mk                      |   15 +
 .../fonts/xfont_font-adobe-utopia-100dpi/Config.in |    4 +
 .../xfont_font-adobe-utopia-100dpi.mk              |   15 +
 .../fonts/xfont_font-adobe-utopia-75dpi/Config.in  |    4 +
 .../xfont_font-adobe-utopia-75dpi.mk               |   15 +
 .../fonts/xfont_font-adobe-utopia-type1/Config.in  |    4 +
 .../xfont_font-adobe-utopia-type1.mk               |   15 +
 package/x11r7/fonts/xfont_font-alias/Config.in     |    4 +
 .../fonts/xfont_font-alias/xfont_font-alias.mk     |   15 +
 .../x11r7/fonts/xfont_font-arabic-misc/Config.in   |    4 +
 .../xfont_font-arabic-misc.mk                      |   15 +
 package/x11r7/fonts/xfont_font-bh-100dpi/Config.in |    4 +
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |   15 +
 package/x11r7/fonts/xfont_font-bh-75dpi/Config.in  |    4 +
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |   15 +
 .../Config.in                                      |    4 +
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |   15 +
 .../xfont_font-bh-lucidatypewriter-75dpi/Config.in |    4 +
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |   15 +
 package/x11r7/fonts/xfont_font-bh-ttf/Config.in    |    4 +
 .../fonts/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |   15 +
 package/x11r7/fonts/xfont_font-bh-type1/Config.in  |    4 +
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |   15 +
 .../fonts/xfont_font-bitstream-100dpi/Config.in    |    4 +
 .../xfont_font-bitstream-100dpi.mk                 |   15 +
 .../fonts/xfont_font-bitstream-75dpi/Config.in     |    4 +
 .../xfont_font-bitstream-75dpi.mk                  |   15 +
 .../fonts/xfont_font-bitstream-speedo/Config.in    |    4 +
 .../xfont_font-bitstream-speedo.mk                 |   15 +
 .../fonts/xfont_font-bitstream-type1/Config.in     |    4 +
 .../xfont_font-bitstream-type1.mk                  |   15 +
 .../fonts/xfont_font-cronyx-cyrillic/Config.in     |    4 +
 .../xfont_font-cronyx-cyrillic.mk                  |   15 +
 .../x11r7/fonts/xfont_font-cursor-misc/Config.in   |    4 +
 .../xfont_font-cursor-misc.mk                      |   15 +
 .../x11r7/fonts/xfont_font-daewoo-misc/Config.in   |    4 +
 .../xfont_font-daewoo-misc.mk                      |   15 +
 package/x11r7/fonts/xfont_font-dec-misc/Config.in  |    4 +
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |   15 +
 package/x11r7/fonts/xfont_font-ibm-type1/Config.in |    4 +
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |   15 +
 package/x11r7/fonts/xfont_font-isas-misc/Config.in |    4 +
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |   15 +
 package/x11r7/fonts/xfont_font-jis-misc/Config.in  |    4 +
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |   15 +
 .../x11r7/fonts/xfont_font-micro-misc/Config.in    |    4 +
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |   15 +
 .../x11r7/fonts/xfont_font-misc-cyrillic/Config.in |    4 +
 .../xfont_font-misc-cyrillic.mk                    |   15 +
 .../x11r7/fonts/xfont_font-misc-ethiopic/Config.in |    4 +
 .../xfont_font-misc-ethiopic.mk                    |   15 +
 .../x11r7/fonts/xfont_font-misc-meltho/Config.in   |    4 +
 .../xfont_font-misc-meltho.mk                      |   15 +
 package/x11r7/fonts/xfont_font-misc-misc/Config.in |    4 +
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |   14 +
 package/x11r7/fonts/xfont_font-mutt-misc/Config.in |    4 +
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |   15 +
 .../fonts/xfont_font-schumacher-misc/Config.in     |    4 +
 .../xfont_font-schumacher-misc.mk                  |   15 +
 .../fonts/xfont_font-screen-cyrillic/Config.in     |    4 +
 .../xfont_font-screen-cyrillic.mk                  |   15 +
 package/x11r7/fonts/xfont_font-sony-misc/Config.in |    4 +
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |   15 +
 package/x11r7/fonts/xfont_font-sun-misc/Config.in  |    4 +
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |   15 +
 package/x11r7/fonts/xfont_font-util/Config.in      |    4 +
 .../x11r7/fonts/xfont_font-util/xfont_font-util.mk |   17 +
 .../fonts/xfont_font-winitzki-cyrillic/Config.in   |    4 +
 .../xfont_font-winitzki-cyrillic.mk                |   15 +
 .../x11r7/fonts/xfont_font-xfree86-type1/Config.in |    4 +
 .../xfont_font-xfree86-type1.mk                    |   15 +
 package/x11r7/libraries/libxcb/Config.in           |   14 +
 package/x11r7/libraries/libxcb/libxcb.mk           |   25 +
 package/x11r7/libraries/mesa3d/Config.in           |   15 +
 package/x11r7/libraries/mesa3d/mesa3d.mk           |   15 +
 package/x11r7/libraries/pthread-stubs/Config.in    |    8 +
 .../x11r7/libraries/pthread-stubs/pthread-stubs.mk |   14 +
 package/x11r7/libraries/xcb-util/Config.in         |    7 +
 package/x11r7/libraries/xcb-util/xcb-util.mk       |   12 +
 package/x11r7/libraries/xlib_libFS/Config.in       |    7 +
 package/x11r7/libraries/xlib_libFS/xlib_libFS.mk   |   14 +
 package/x11r7/libraries/xlib_libICE/Config.in      |    6 +
 package/x11r7/libraries/xlib_libICE/xlib_libICE.mk |   13 +
 package/x11r7/libraries/xlib_libSM/Config.in       |    7 +
 package/x11r7/libraries/xlib_libSM/xlib_libSM.mk   |   14 +
 package/x11r7/libraries/xlib_libX11/Config.in      |   16 +
 .../xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch  |   35 ++
 package/x11r7/libraries/xlib_libX11/xlib_libX11.mk |   43 ++
 .../x11r7/libraries/xlib_libXScrnSaver/Config.in   |    7 +
 .../xlib_libXScrnSaver/xlib_libXScrnSaver.mk       |   14 +
 package/x11r7/libraries/xlib_libXau/Config.in      |    6 +
 package/x11r7/libraries/xlib_libXau/xlib_libXau.mk |   16 +
 package/x11r7/libraries/xlib_libXaw/Config.in      |   10 +
 package/x11r7/libraries/xlib_libXaw/xlib_libXaw.mk |   14 +
 .../x11r7/libraries/xlib_libXcomposite/Config.in   |    9 +
 .../xlib_libXcomposite/xlib_libXcomposite.mk       |   13 +
 package/x11r7/libraries/xlib_libXcursor/Config.in  |    8 +
 .../libraries/xlib_libXcursor/xlib_libXcursor.mk   |   16 +
 package/x11r7/libraries/xlib_libXdamage/Config.in  |    8 +
 .../libraries/xlib_libXdamage/xlib_libXdamage.mk   |   13 +
 package/x11r7/libraries/xlib_libXdmcp/Config.in    |    6 +
 .../x11r7/libraries/xlib_libXdmcp/xlib_libXdmcp.mk |   16 +
 package/x11r7/libraries/xlib_libXext/Config.in     |    7 +
 .../x11r7/libraries/xlib_libXext/xlib_libXext.mk   |   14 +
 package/x11r7/libraries/xlib_libXfixes/Config.in   |    8 +
 .../libraries/xlib_libXfixes/xlib_libXfixes.mk     |   16 +
 package/x11r7/libraries/xlib_libXfont/Config.in    |   11 +
 .../x11r7/libraries/xlib_libXfont/xlib_libXfont.mk |   19 +
 .../x11r7/libraries/xlib_libXfontcache/Config.in   |    7 +
 .../xlib_libXfontcache/xlib_libXfontcache.mk       |   14 +
 package/x11r7/libraries/xlib_libXft/Config.in      |   10 +
 package/x11r7/libraries/xlib_libXft/xlib_libXft.mk |   14 +
 package/x11r7/libraries/xlib_libXi/Config.in       |    8 +
 package/x11r7/libraries/xlib_libXi/xlib_libXi.mk   |   14 +
 package/x11r7/libraries/xlib_libXinerama/Config.in |    7 +
 .../libraries/xlib_libXinerama/xlib_libXinerama.mk |   14 +
 package/x11r7/libraries/xlib_libXmu/Config.in      |    8 +
 package/x11r7/libraries/xlib_libXmu/xlib_libXmu.mk |   13 +
 package/x11r7/libraries/xlib_libXp/Config.in       |    8 +
 package/x11r7/libraries/xlib_libXp/xlib_libXp.mk   |   14 +
 package/x11r7/libraries/xlib_libXpm/Config.in      |    8 +
 package/x11r7/libraries/xlib_libXpm/xlib_libXpm.mk |   13 +
 .../libraries/xlib_libXprintAppUtil/Config.in      |    7 +
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |   13 +
 .../x11r7/libraries/xlib_libXprintUtil/Config.in   |    8 +
 .../xlib_libXprintUtil/xlib_libXprintUtil.mk       |   13 +
 package/x11r7/libraries/xlib_libXrandr/Config.in   |   10 +
 .../libraries/xlib_libXrandr/xlib_libXrandr.mk     |   14 +
 package/x11r7/libraries/xlib_libXrender/Config.in  |    7 +
 .../libraries/xlib_libXrender/xlib_libXrender.mk   |   17 +
 package/x11r7/libraries/xlib_libXres/Config.in     |    8 +
 .../x11r7/libraries/xlib_libXres/xlib_libXres.mk   |   14 +
 package/x11r7/libraries/xlib_libXt/Config.in       |   10 +
 .../xlib_libXt-1.0.7-fix-cross-compile.patch       |   96 ++++
 package/x11r7/libraries/xlib_libXt/xlib_libXt.mk   |   15 +
 package/x11r7/libraries/xlib_libXtst/Config.in     |    8 +
 .../x11r7/libraries/xlib_libXtst/xlib_libXtst.mk   |   18 +
 package/x11r7/libraries/xlib_libXv/Config.in       |    8 +
 package/x11r7/libraries/xlib_libXv/xlib_libXv.mk   |   14 +
 package/x11r7/libraries/xlib_libXvMC/Config.in     |    9 +
 .../x11r7/libraries/xlib_libXvMC/xlib_libXvMC.mk   |   14 +
 package/x11r7/libraries/xlib_libXxf86dga/Config.in |    8 +
 .../libraries/xlib_libXxf86dga/xlib_libXxf86dga.mk |   14 +
 package/x11r7/libraries/xlib_libXxf86vm/Config.in  |    8 +
 .../libraries/xlib_libXxf86vm/xlib_libXxf86vm.mk   |   14 +
 package/x11r7/libraries/xlib_libdmx/Config.in      |    7 +
 package/x11r7/libraries/xlib_libdmx/xlib_libdmx.mk |   14 +
 package/x11r7/libraries/xlib_libfontenc/Config.in  |    5 +
 .../libraries/xlib_libfontenc/xlib_libfontenc.mk   |   16 +
 package/x11r7/libraries/xlib_liboldX/Config.in     |    5 +
 .../x11r7/libraries/xlib_liboldX/xlib_liboldX.mk   |   14 +
 .../x11r7/libraries/xlib_libpciaccess/Config.in    |    8 +
 .../xlib_libpciaccess/xlib_libpciaccess.mk         |   12 +
 package/x11r7/libraries/xlib_libxkbfile/Config.in  |    6 +
 .../libraries/xlib_libxkbfile/xlib_libxkbfile.mk   |   16 +
 package/x11r7/libraries/xlib_libxkbui/Config.in    |    7 +
 .../x11r7/libraries/xlib_libxkbui/xlib_libxkbui.mk |   13 +
 package/x11r7/libraries/xlib_xtrans/Config.in      |    4 +
 package/x11r7/libraries/xlib_xtrans/xlib_xtrans.mk |   13 +
 package/x11r7/libxcb/Config.in                     |   14 -
 package/x11r7/libxcb/libxcb.mk                     |   25 -
 package/x11r7/mcookie/Config.in                    |    6 -
 package/x11r7/mcookie/mcookie.c                    |  425 ----------------
 package/x11r7/mcookie/mcookie.mk                   |   22 -
 package/x11r7/mesa3d/Config.in                     |   15 -
 package/x11r7/mesa3d/mesa3d.mk                     |   15 -
 package/x11r7/other/xdata_xbitmaps/Config.in       |    4 +
 .../x11r7/other/xdata_xbitmaps/xdata_xbitmaps.mk   |   13 +
 package/x11r7/other/xdata_xcursor-themes/Config.in |    5 +
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |   13 +
 package/x11r7/other/xkeyboard-config/Config.in     |    7 +
 .../other/xkeyboard-config/xkeyboard-config.mk     |   16 +
 package/x11r7/protocols/xcb-proto/Config.in        |    7 +
 package/x11r7/protocols/xcb-proto/xcb-proto.mk     |   16 +
 .../x11r7/protocols/xproto_applewmproto/Config.in  |    4 +
 .../xproto_applewmproto/xproto_applewmproto.mk     |   13 +
 .../x11r7/protocols/xproto_bigreqsproto/Config.in  |    4 +
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |   13 +
 .../protocols/xproto_compositeproto/Config.in      |    4 +
 .../xproto_compositeproto/xproto_compositeproto.mk |   13 +
 .../x11r7/protocols/xproto_damageproto/Config.in   |    4 +
 .../xproto_damageproto/xproto_damageproto.mk       |   13 +
 package/x11r7/protocols/xproto_dmxproto/Config.in  |    4 +
 .../protocols/xproto_dmxproto/xproto_dmxproto.mk   |   13 +
 package/x11r7/protocols/xproto_dri2proto/Config.in |    4 +
 .../protocols/xproto_dri2proto/xproto_dri2proto.mk |   13 +
 .../x11r7/protocols/xproto_fixesproto/Config.in    |    4 +
 .../xproto_fixesproto/xproto_fixesproto.mk         |   14 +
 .../protocols/xproto_fontcacheproto/Config.in      |    4 +
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |   14 +
 .../x11r7/protocols/xproto_fontsproto/Config.in    |    4 +
 .../xproto_fontsproto/xproto_fontsproto.mk         |   14 +
 package/x11r7/protocols/xproto_glproto/Config.in   |    4 +
 .../protocols/xproto_glproto/xproto_glproto.mk     |   13 +
 .../x11r7/protocols/xproto_inputproto/Config.in    |    4 +
 .../xproto_inputproto/xproto_inputproto.mk         |   14 +
 package/x11r7/protocols/xproto_kbproto/Config.in   |    4 +
 .../protocols/xproto_kbproto/xproto_kbproto.mk     |   14 +
 .../x11r7/protocols/xproto_printproto/Config.in    |    4 +
 .../xproto_printproto/xproto_printproto.mk         |   13 +
 .../x11r7/protocols/xproto_randrproto/Config.in    |    4 +
 .../xproto_randrproto/xproto_randrproto.mk         |   13 +
 .../x11r7/protocols/xproto_recordproto/Config.in   |    4 +
 .../xproto_recordproto/xproto_recordproto.mk       |   13 +
 .../x11r7/protocols/xproto_renderproto/Config.in   |    4 +
 .../xproto_renderproto/xproto_renderproto.mk       |   14 +
 .../x11r7/protocols/xproto_resourceproto/Config.in |    4 +
 .../xproto_resourceproto/xproto_resourceproto.mk   |   13 +
 .../protocols/xproto_scrnsaverproto/Config.in      |    4 +
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |   13 +
 .../x11r7/protocols/xproto_videoproto/Config.in    |    4 +
 .../xproto_videoproto/xproto_videoproto.mk         |   13 +
 .../protocols/xproto_windowswmproto/Config.in      |    4 +
 .../xproto_windowswmproto/xproto_windowswmproto.mk |   13 +
 .../x11r7/protocols/xproto_xcmiscproto/Config.in   |    4 +
 .../xproto_xcmiscproto/xproto_xcmiscproto.mk       |   14 +
 package/x11r7/protocols/xproto_xextproto/Config.in |    4 +
 .../protocols/xproto_xextproto/xproto_xextproto.mk |   14 +
 .../protocols/xproto_xf86bigfontproto/Config.in    |    4 +
 .../xproto_xf86bigfontproto.mk                     |   14 +
 .../x11r7/protocols/xproto_xf86dgaproto/Config.in  |    4 +
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |   13 +
 .../x11r7/protocols/xproto_xf86driproto/Config.in  |    4 +
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |   13 +
 .../x11r7/protocols/xproto_xf86rushproto/Config.in |    4 +
 .../xproto_xf86rushproto/xproto_xf86rushproto.mk   |   13 +
 .../protocols/xproto_xf86vidmodeproto/Config.in    |    4 +
 .../xproto_xf86vidmodeproto.mk                     |   13 +
 .../x11r7/protocols/xproto_xineramaproto/Config.in |    4 +
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |   13 +
 package/x11r7/protocols/xproto_xproto/Config.in    |    4 +
 .../x11r7/protocols/xproto_xproto/xproto_xproto.mk |   14 +
 package/x11r7/pthread-stubs/Config.in              |    8 -
 package/x11r7/pthread-stubs/pthread-stubs.mk       |   14 -
 package/x11r7/utils/mcookie/Config.in              |    6 +
 package/x11r7/utils/mcookie/mcookie.c              |  425 ++++++++++++++++
 package/x11r7/utils/mcookie/mcookie.mk             |   22 +
 package/x11r7/utils/xutil_makedepend/Config.in     |    4 +
 .../utils/xutil_makedepend/xutil_makedepend.mk     |   16 +
 package/x11r7/utils/xutil_util-macros/Config.in    |    4 +
 .../xutil_util-macros-1.3.0.patch                  |    9 +
 .../utils/xutil_util-macros/xutil_util-macros.mk   |   14 +
 package/x11r7/x11r7.mk                             |    3 +-
 package/x11r7/xapp_appres/Config.in                |    6 -
 package/x11r7/xapp_appres/xapp_appres.mk           |   12 -
 package/x11r7/xapp_bdftopcf/Config.in              |    5 -
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |   14 -
 package/x11r7/xapp_beforelight/Config.in           |    8 -
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |   12 -
 package/x11r7/xapp_bitmap/Config.in                |    8 -
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |   12 -
 package/x11r7/xapp_editres/Config.in               |    8 -
 package/x11r7/xapp_editres/xapp_editres.mk         |   12 -
 package/x11r7/xapp_fonttosfnt/Config.in            |    7 -
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |   12 -
 package/x11r7/xapp_fslsfonts/Config.in             |    6 -
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |   12 -
 package/x11r7/xapp_fstobdf/Config.in               |    6 -
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |   12 -
 package/x11r7/xapp_iceauth/Config.in               |    6 -
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |   12 -
 package/x11r7/xapp_ico/Config.in                   |    5 -
 package/x11r7/xapp_ico/xapp_ico.mk                 |   12 -
 package/x11r7/xapp_listres/Config.in               |    8 -
 package/x11r7/xapp_listres/xapp_listres.mk         |   12 -
 package/x11r7/xapp_luit/Config.in                  |    6 -
 package/x11r7/xapp_luit/xapp_luit.mk               |   12 -
 package/x11r7/xapp_mkfontdir/Config.in             |    5 -
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |   14 -
 package/x11r7/xapp_mkfontscale/Config.in           |    7 -
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |   14 -
 package/x11r7/xapp_oclock/Config.in                |    7 -
 package/x11r7/xapp_oclock/xapp_oclock.mk           |   12 -
 package/x11r7/xapp_rgb/Config.in                   |    5 -
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |   12 -
 package/x11r7/xapp_rstart/Config.in                |    5 -
 package/x11r7/xapp_rstart/xapp_rstart.mk           |   12 -
 package/x11r7/xapp_scripts/Config.in               |    5 -
 package/x11r7/xapp_scripts/xapp_scripts.mk         |   12 -
 package/x11r7/xapp_sessreg/Config.in               |    6 -
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |   12 -
 package/x11r7/xapp_setxkbmap/Config.in             |    6 -
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |   12 -
 package/x11r7/xapp_showfont/Config.in              |    5 -
 package/x11r7/xapp_showfont/xapp_showfont.mk       |   12 -
 package/x11r7/xapp_smproxy/Config.in               |    6 -
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |   12 -
 package/x11r7/xapp_twm/Config.in                   |    8 -
 package/x11r7/xapp_twm/xapp_twm.mk                 |   12 -
 package/x11r7/xapp_viewres/Config.in               |    5 -
 package/x11r7/xapp_viewres/xapp_viewres.mk         |   12 -
 package/x11r7/xapp_x11perf/Config.in               |    7 -
 package/x11r7/xapp_x11perf/xapp_x11perf.mk         |   12 -
 package/x11r7/xapp_xauth/Config.in                 |    8 -
 .../x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch    |   11 -
 package/x11r7/xapp_xauth/xapp_xauth.mk             |   12 -
 package/x11r7/xapp_xbacklight/Config.in            |    7 -
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |   12 -
 package/x11r7/xapp_xbiff/Config.in                 |    6 -
 package/x11r7/xapp_xbiff/xapp_xbiff.mk             |   12 -
 package/x11r7/xapp_xcalc/Config.in                 |    5 -
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |   13 -
 package/x11r7/xapp_xclipboard/Config.in            |    5 -
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |   12 -
 package/x11r7/xapp_xclock/Config.in                |    9 -
 package/x11r7/xapp_xclock/xapp_xclock.mk           |   12 -
 package/x11r7/xapp_xcmsdb/Config.in                |    5 -
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |   12 -
 package/x11r7/xapp_xcursorgen/Config.in            |    7 -
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |   15 -
 package/x11r7/xapp_xdbedizzy/Config.in             |    7 -
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |   12 -
 package/x11r7/xapp_xditview/Config.in              |    5 -
 package/x11r7/xapp_xditview/xapp_xditview.mk       |   12 -
 package/x11r7/xapp_xdm/Config.in                   |   14 -
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |   13 -
 package/x11r7/xapp_xdpyinfo/Config.in              |   18 -
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |   12 -
 package/x11r7/xapp_xdriinfo/Config.in              |    7 -
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |   12 -
 package/x11r7/xapp_xedit/Config.in                 |    6 -
 package/x11r7/xapp_xedit/xapp_xedit.mk             |   12 -
 package/x11r7/xapp_xev/Config.in                   |    5 -
 package/x11r7/xapp_xev/xapp_xev.mk                 |   12 -
 package/x11r7/xapp_xeyes/Config.in                 |    8 -
 package/x11r7/xapp_xeyes/xapp_xeyes.mk             |   12 -
 package/x11r7/xapp_xf86dga/Config.in               |    6 -
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |   12 -
 package/x11r7/xapp_xfd/Config.in                   |    8 -
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |   12 -
 package/x11r7/xapp_xfontsel/Config.in              |    5 -
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |   12 -
 package/x11r7/xapp_xfs/Config.in                   |    7 -
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |   12 -
 package/x11r7/xapp_xfsinfo/Config.in               |    6 -
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |   12 -
 package/x11r7/xapp_xgamma/Config.in                |    5 -
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |   12 -
 package/x11r7/xapp_xgc/Config.in                   |    5 -
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |   12 -
 package/x11r7/xapp_xhost/Config.in                 |    6 -
 package/x11r7/xapp_xhost/xapp_xhost.mk             |   12 -
 package/x11r7/xapp_xinit/Config.in                 |    6 -
 package/x11r7/xapp_xinit/xapp_xinit.mk             |   12 -
 package/x11r7/xapp_xinput/Config.in                |    6 -
 package/x11r7/xapp_xinput/xapp_xinput.mk           |   12 -
 package/x11r7/xapp_xkbcomp/Config.in               |    6 -
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |   14 -
 package/x11r7/xapp_xkbevd/Config.in                |    5 -
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |   12 -
 package/x11r7/xapp_xkbprint/Config.in              |    5 -
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk       |   12 -
 package/x11r7/xapp_xkbutils/Config.in              |    6 -
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |   12 -
 package/x11r7/xapp_xkill/Config.in                 |    6 -
 package/x11r7/xapp_xkill/xapp_xkill.mk             |   12 -
 package/x11r7/xapp_xload/Config.in                 |    5 -
 package/x11r7/xapp_xload/xapp_xload.mk             |   12 -
 package/x11r7/xapp_xlogo/Config.in                 |    8 -
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |   13 -
 package/x11r7/xapp_xlsatoms/Config.in              |    6 -
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |   12 -
 package/x11r7/xapp_xlsclients/Config.in            |    6 -
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |   12 -
 package/x11r7/xapp_xlsfonts/Config.in              |    5 -
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |   12 -
 package/x11r7/xapp_xmag/Config.in                  |    5 -
 package/x11r7/xapp_xmag/xapp_xmag.mk               |   12 -
 package/x11r7/xapp_xman/Config.in                  |    4 -
 package/x11r7/xapp_xman/xapp_xman.mk               |   17 -
 package/x11r7/xapp_xmessage/Config.in              |    5 -
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |   12 -
 package/x11r7/xapp_xmh/Config.in                   |    5 -
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |   12 -
 package/x11r7/xapp_xmodmap/Config.in               |    5 -
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |   12 -
 package/x11r7/xapp_xmore/Config.in                 |    6 -
 package/x11r7/xapp_xmore/xapp_xmore.mk             |   12 -
 package/x11r7/xapp_xplsprinters/Config.in          |    7 -
 .../x11r7/xapp_xplsprinters/xapp_xplsprinters.mk   |   12 -
 package/x11r7/xapp_xpr/Config.in                   |    6 -
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |   12 -
 package/x11r7/xapp_xprehashprinterlist/Config.in   |    6 -
 .../xapp_xprehashprinterlist.mk                    |   12 -
 package/x11r7/xapp_xprop/Config.in                 |    6 -
 package/x11r7/xapp_xprop/xapp_xprop.mk             |   12 -
 package/x11r7/xapp_xrandr/Config.in                |    6 -
 .../xapp_xrandr-1.2.3-clone-redef.patch            |   29 --
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |   13 -
 package/x11r7/xapp_xrdb/Config.in                  |    6 -
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |   12 -
 package/x11r7/xapp_xrefresh/Config.in              |    5 -
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |   12 -
 package/x11r7/xapp_xset/Config.in                  |    6 -
 package/x11r7/xapp_xset/xapp_xset.mk               |   12 -
 package/x11r7/xapp_xsetmode/Config.in              |    6 -
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk       |   12 -
 package/x11r7/xapp_xsetpointer/Config.in           |    7 -
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |   12 -
 package/x11r7/xapp_xsetroot/Config.in              |    7 -
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |   12 -
 package/x11r7/xapp_xsm/Config.in                   |    5 -
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |   12 -
 package/x11r7/xapp_xstdcmap/Config.in              |    6 -
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |   12 -
 package/x11r7/xapp_xvidtune/Config.in              |    6 -
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |   12 -
 package/x11r7/xapp_xvinfo/Config.in                |    6 -
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |   12 -
 package/x11r7/xapp_xwd/Config.in                   |    6 -
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |   12 -
 package/x11r7/xapp_xwininfo/Config.in              |    6 -
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |   12 -
 package/x11r7/xapp_xwud/Config.in                  |    5 -
 package/x11r7/xapp_xwud/xapp_xwud.mk               |   12 -
 package/x11r7/xcb-proto/Config.in                  |    7 -
 package/x11r7/xcb-proto/xcb-proto.mk               |   16 -
 package/x11r7/xcb-util/Config.in                   |    7 -
 package/x11r7/xcb-util/xcb-util.mk                 |   12 -
 package/x11r7/xdata_xbitmaps/Config.in             |    4 -
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |   13 -
 package/x11r7/xdata_xcursor-themes/Config.in       |    5 -
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |   13 -
 package/x11r7/xdriver_xf86-input-acecad/Config.in  |    8 -
 .../xdriver_xf86-input-acecad.mk                   |   12 -
 package/x11r7/xdriver_xf86-input-aiptek/Config.in  |    8 -
 .../xdriver_xf86-input-aiptek.mk                   |   12 -
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    8 -
 .../xdriver_xf86-input-evdev.mk                    |   12 -
 .../x11r7/xdriver_xf86-input-joystick/Config.in    |    8 -
 .../xdriver_xf86-input-joystick.mk                 |   12 -
 .../x11r7/xdriver_xf86-input-keyboard/Config.in    |    9 -
 .../xdriver_xf86-input-keyboard.mk                 |   12 -
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |    8 -
 .../xdriver_xf86-input-mouse.mk                    |   12 -
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    8 -
 .../xdriver_xf86-input-synaptics.mk                |   12 -
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in |    8 -
 .../xdriver_xf86-input-vmmouse.mk                  |   12 -
 package/x11r7/xdriver_xf86-input-void/Config.in    |    8 -
 .../xdriver_xf86-input-void.mk                     |   12 -
 package/x11r7/xdriver_xf86-video-apm/Config.in     |   12 -
 .../xdriver_xf86-video-apm.mk                      |   12 -
 package/x11r7/xdriver_xf86-video-ark/Config.in     |   10 -
 .../xdriver_xf86-video-ark.mk                      |   12 -
 package/x11r7/xdriver_xf86-video-ast/Config.in     |    4 -
 .../xdriver_xf86-video-ast.mk                      |   11 -
 package/x11r7/xdriver_xf86-video-ati/Config.in     |   15 -
 .../xdriver_xf86-video-ati-cross-compile.patch     |   27 -
 .../xdriver_xf86-video-ati.mk                      |   13 -
 package/x11r7/xdriver_xf86-video-chips/Config.in   |   10 -
 .../xdriver_xf86-video-chips.mk                    |   12 -
 package/x11r7/xdriver_xf86-video-cirrus/Config.in  |   11 -
 .../xdriver_xf86-video-cirrus.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-dummy/Config.in   |   11 -
 .../xdriver_xf86-video-dummy.mk                    |   12 -
 package/x11r7/xdriver_xf86-video-fbdev/Config.in   |   10 -
 .../xdriver_xf86-video-fbdev.mk                    |   12 -
 package/x11r7/xdriver_xf86-video-geode/Config.in   |   10 -
 .../xdriver_xf86-video-geode.mk                    |   12 -
 package/x11r7/xdriver_xf86-video-glide/Config.in   |   11 -
 .../xdriver_xf86-video-glide.mk                    |   12 -
 package/x11r7/xdriver_xf86-video-glint/Config.in   |   16 -
 ...iver_xf86-video-glint-1.2.1-cross-compile.patch |   29 --
 .../xdriver_xf86-video-glint.mk                    |   13 -
 package/x11r7/xdriver_xf86-video-i128/Config.in    |   11 -
 .../xdriver_xf86-video-i128.mk                     |   12 -
 package/x11r7/xdriver_xf86-video-i740/Config.in    |   11 -
 .../xdriver_xf86-video-i740.mk                     |   12 -
 package/x11r7/xdriver_xf86-video-intel/Config.in   |   12 -
 ...ver_xf86-video-intel-2.10.0-cross-compile.patch |   11 -
 ...iver_xf86-video-intel-2.9.1-cross-compile.patch |   25 -
 .../xdriver_xf86-video-intel.mk                    |   14 -
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |   11 -
 .../xdriver_xf86-video-mach64-cross-compile.patch  |   27 -
 .../xdriver_xf86-video-mach64.mk                   |   13 -
 package/x11r7/xdriver_xf86-video-mga/Config.in     |   15 -
 .../xdriver_xf86-video-mga-1.4.9.patch             |   21 -
 .../xdriver_xf86-video-mga.mk                      |   13 -
 .../x11r7/xdriver_xf86-video-neomagic/Config.in    |   12 -
 .../xdriver_xf86-video-neomagic.mk                 |   12 -
 package/x11r7/xdriver_xf86-video-newport/Config.in |   10 -
 .../xdriver_xf86-video-newport.mk                  |   12 -
 package/x11r7/xdriver_xf86-video-nv/Config.in      |   11 -
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |   12 -
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |   17 -
 ...86-video-openchrome-0.2.904-cross-compile.patch |   21 -
 .../xdriver_xf86-video-openchrome.mk               |   27 -
 package/x11r7/xdriver_xf86-video-r128/Config.in    |   11 -
 .../xdriver_xf86-video-r128-cross-compile.patch    |   27 -
 .../xdriver_xf86-video-r128.mk                     |   13 -
 .../x11r7/xdriver_xf86-video-rendition/Config.in   |   10 -
 .../xdriver_xf86-video-rendition.mk                |   12 -
 package/x11r7/xdriver_xf86-video-s3/Config.in      |   11 -
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |   12 -
 package/x11r7/xdriver_xf86-video-s3virge/Config.in |   11 -
 .../xdriver_xf86-video-s3virge.mk                  |   12 -
 package/x11r7/xdriver_xf86-video-savage/Config.in  |   14 -
 ...ver_xf86-video-savage-2.2.1-cross-compile.patch |   27 -
 .../xdriver_xf86-video-savage.mk                   |   13 -
 .../xdriver_xf86-video-siliconmotion/Config.in     |   11 -
 .../xdriver_xf86-video-siliconmotion.mk            |   12 -
 package/x11r7/xdriver_xf86-video-sis/Config.in     |   16 -
 .../xdriver_xf86-video-sis-0.10.0.patch            |   21 -
 .../xdriver_xf86-video-sis.mk                      |   13 -
 package/x11r7/xdriver_xf86-video-sisusb/Config.in  |   12 -
 .../xdriver_xf86-video-sisusb.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-suncg14/Config.in |    9 -
 .../xdriver_xf86-video-suncg14.mk                  |   12 -
 package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    9 -
 .../xdriver_xf86-video-suncg3.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-suncg6/Config.in  |    9 -
 .../xdriver_xf86-video-suncg6.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-sunffb/Config.in  |   12 -
 .../xdriver_xf86-video-sunffb.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-sunleo/Config.in  |    9 -
 .../xdriver_xf86-video-sunleo.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    9 -
 .../xdriver_xf86-video-suntcx.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |   14 -
 .../xdriver_xf86-video-tdfx-1.4.0.patch            |   24 -
 .../xdriver_xf86-video-tdfx.mk                     |   13 -
 package/x11r7/xdriver_xf86-video-tga/Config.in     |   12 -
 .../xdriver_xf86-video-tga.mk                      |   12 -
 package/x11r7/xdriver_xf86-video-trident/Config.in |   12 -
 .../xdriver_xf86-video-trident.mk                  |   12 -
 package/x11r7/xdriver_xf86-video-tseng/Config.in   |   11 -
 .../xdriver_xf86-video-tseng.mk                    |   12 -
 package/x11r7/xdriver_xf86-video-v4l/Config.in     |    8 -
 .../xdriver_xf86-video-v4l.mk                      |   12 -
 package/x11r7/xdriver_xf86-video-vesa/Config.in    |   10 -
 .../xdriver_xf86-video-vesa-2.0.0.patch            |   13 -
 .../xdriver_xf86-video-vesa.mk                     |   13 -
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |   11 -
 .../xdriver_xf86-video-vmware.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-voodoo/Config.in  |   11 -
 .../xdriver_xf86-video-voodoo.mk                   |   12 -
 package/x11r7/xdriver_xf86-video-wsfb/Config.in    |   11 -
 .../xdriver_xf86-video-wsfb.mk                     |   12 -
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |   11 -
 .../xdriver_xf86-video-xgi-cross-compile.patch     |   24 -
 .../xdriver_xf86-video-xgi.mk                      |   13 -
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |   11 -
 .../xdriver_xf86-video-xgixp-cross-compile.patch   |   24 -
 .../xdriver_xf86-video-xgixp.mk                    |   13 -
 package/x11r7/xfont_encodings/Config.in            |    4 -
 package/x11r7/xfont_encodings/xfont_encodings.mk   |   15 -
 package/x11r7/xfont_font-adobe-100dpi/Config.in    |    4 -
 .../xfont_font-adobe-100dpi.mk                     |   15 -
 package/x11r7/xfont_font-adobe-75dpi/Config.in     |    4 -
 .../xfont_font-adobe-75dpi.mk                      |   15 -
 .../x11r7/xfont_font-adobe-utopia-100dpi/Config.in |    4 -
 .../xfont_font-adobe-utopia-100dpi.mk              |   15 -
 .../x11r7/xfont_font-adobe-utopia-75dpi/Config.in  |    4 -
 .../xfont_font-adobe-utopia-75dpi.mk               |   15 -
 .../x11r7/xfont_font-adobe-utopia-type1/Config.in  |    4 -
 .../xfont_font-adobe-utopia-type1.mk               |   15 -
 package/x11r7/xfont_font-alias/Config.in           |    4 -
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |   15 -
 package/x11r7/xfont_font-arabic-misc/Config.in     |    4 -
 .../xfont_font-arabic-misc.mk                      |   15 -
 package/x11r7/xfont_font-bh-100dpi/Config.in       |    4 -
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |   15 -
 package/x11r7/xfont_font-bh-75dpi/Config.in        |    4 -
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |   15 -
 .../Config.in                                      |    4 -
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |   15 -
 .../xfont_font-bh-lucidatypewriter-75dpi/Config.in |    4 -
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |   15 -
 package/x11r7/xfont_font-bh-ttf/Config.in          |    4 -
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |   15 -
 package/x11r7/xfont_font-bh-type1/Config.in        |    4 -
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |   15 -
 .../x11r7/xfont_font-bitstream-100dpi/Config.in    |    4 -
 .../xfont_font-bitstream-100dpi.mk                 |   15 -
 package/x11r7/xfont_font-bitstream-75dpi/Config.in |    4 -
 .../xfont_font-bitstream-75dpi.mk                  |   15 -
 .../x11r7/xfont_font-bitstream-speedo/Config.in    |    4 -
 .../xfont_font-bitstream-speedo.mk                 |   15 -
 package/x11r7/xfont_font-bitstream-type1/Config.in |    4 -
 .../xfont_font-bitstream-type1.mk                  |   15 -
 package/x11r7/xfont_font-cronyx-cyrillic/Config.in |    4 -
 .../xfont_font-cronyx-cyrillic.mk                  |   15 -
 package/x11r7/xfont_font-cursor-misc/Config.in     |    4 -
 .../xfont_font-cursor-misc.mk                      |   15 -
 package/x11r7/xfont_font-daewoo-misc/Config.in     |    4 -
 .../xfont_font-daewoo-misc.mk                      |   15 -
 package/x11r7/xfont_font-dec-misc/Config.in        |    4 -
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |   15 -
 package/x11r7/xfont_font-ibm-type1/Config.in       |    4 -
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |   15 -
 package/x11r7/xfont_font-isas-misc/Config.in       |    4 -
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |   15 -
 package/x11r7/xfont_font-jis-misc/Config.in        |    4 -
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |   15 -
 package/x11r7/xfont_font-micro-misc/Config.in      |    4 -
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |   15 -
 package/x11r7/xfont_font-misc-cyrillic/Config.in   |    4 -
 .../xfont_font-misc-cyrillic.mk                    |   15 -
 package/x11r7/xfont_font-misc-ethiopic/Config.in   |    4 -
 .../xfont_font-misc-ethiopic.mk                    |   15 -
 package/x11r7/xfont_font-misc-meltho/Config.in     |    4 -
 .../xfont_font-misc-meltho.mk                      |   15 -
 package/x11r7/xfont_font-misc-misc/Config.in       |    4 -
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |   14 -
 package/x11r7/xfont_font-mutt-misc/Config.in       |    4 -
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |   15 -
 package/x11r7/xfont_font-schumacher-misc/Config.in |    4 -
 .../xfont_font-schumacher-misc.mk                  |   15 -
 package/x11r7/xfont_font-screen-cyrillic/Config.in |    4 -
 .../xfont_font-screen-cyrillic.mk                  |   15 -
 package/x11r7/xfont_font-sony-misc/Config.in       |    4 -
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |   15 -
 package/x11r7/xfont_font-sun-misc/Config.in        |    4 -
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |   15 -
 package/x11r7/xfont_font-util/Config.in            |    4 -
 package/x11r7/xfont_font-util/xfont_font-util.mk   |   17 -
 .../x11r7/xfont_font-winitzki-cyrillic/Config.in   |    4 -
 .../xfont_font-winitzki-cyrillic.mk                |   15 -
 package/x11r7/xfont_font-xfree86-type1/Config.in   |    4 -
 .../xfont_font-xfree86-type1.mk                    |   15 -
 package/x11r7/xkeyboard-config/Config.in           |    7 -
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |   16 -
 package/x11r7/xlib_libFS/Config.in                 |    7 -
 package/x11r7/xlib_libFS/xlib_libFS.mk             |   14 -
 package/x11r7/xlib_libICE/Config.in                |    6 -
 package/x11r7/xlib_libICE/xlib_libICE.mk           |   13 -
 package/x11r7/xlib_libSM/Config.in                 |    7 -
 package/x11r7/xlib_libSM/xlib_libSM.mk             |   14 -
 package/x11r7/xlib_libX11/Config.in                |   16 -
 .../xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch  |   35 --
 package/x11r7/xlib_libX11/xlib_libX11.mk           |   43 --
 package/x11r7/xlib_libXScrnSaver/Config.in         |    7 -
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |   14 -
 package/x11r7/xlib_libXau/Config.in                |    6 -
 package/x11r7/xlib_libXau/xlib_libXau.mk           |   16 -
 package/x11r7/xlib_libXaw/Config.in                |   10 -
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |   14 -
 package/x11r7/xlib_libXcomposite/Config.in         |    9 -
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |   13 -
 package/x11r7/xlib_libXcursor/Config.in            |    8 -
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |   16 -
 package/x11r7/xlib_libXdamage/Config.in            |    8 -
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |   13 -
 package/x11r7/xlib_libXdmcp/Config.in              |    6 -
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |   16 -
 package/x11r7/xlib_libXext/Config.in               |    7 -
 package/x11r7/xlib_libXext/xlib_libXext.mk         |   14 -
 package/x11r7/xlib_libXfixes/Config.in             |    8 -
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |   16 -
 package/x11r7/xlib_libXfont/Config.in              |   11 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |   19 -
 package/x11r7/xlib_libXfontcache/Config.in         |    7 -
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |   14 -
 package/x11r7/xlib_libXft/Config.in                |   10 -
 package/x11r7/xlib_libXft/xlib_libXft.mk           |   14 -
 package/x11r7/xlib_libXi/Config.in                 |    8 -
 package/x11r7/xlib_libXi/xlib_libXi.mk             |   14 -
 package/x11r7/xlib_libXinerama/Config.in           |    7 -
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |   14 -
 package/x11r7/xlib_libXmu/Config.in                |    8 -
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |   13 -
 package/x11r7/xlib_libXp/Config.in                 |    8 -
 package/x11r7/xlib_libXp/xlib_libXp.mk             |   14 -
 package/x11r7/xlib_libXpm/Config.in                |    8 -
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |   13 -
 package/x11r7/xlib_libXprintAppUtil/Config.in      |    7 -
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |   13 -
 package/x11r7/xlib_libXprintUtil/Config.in         |    8 -
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |   13 -
 package/x11r7/xlib_libXrandr/Config.in             |   10 -
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |   14 -
 package/x11r7/xlib_libXrender/Config.in            |    7 -
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |   17 -
 package/x11r7/xlib_libXres/Config.in               |    8 -
 package/x11r7/xlib_libXres/xlib_libXres.mk         |   14 -
 package/x11r7/xlib_libXt/Config.in                 |   10 -
 .../xlib_libXt-1.0.7-fix-cross-compile.patch       |   96 ----
 package/x11r7/xlib_libXt/xlib_libXt.mk             |   15 -
 package/x11r7/xlib_libXtst/Config.in               |    8 -
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |   18 -
 package/x11r7/xlib_libXv/Config.in                 |    8 -
 package/x11r7/xlib_libXv/xlib_libXv.mk             |   14 -
 package/x11r7/xlib_libXvMC/Config.in               |    9 -
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |   14 -
 package/x11r7/xlib_libXxf86dga/Config.in           |    8 -
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |   14 -
 package/x11r7/xlib_libXxf86vm/Config.in            |    8 -
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |   14 -
 package/x11r7/xlib_libdmx/Config.in                |    7 -
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |   14 -
 package/x11r7/xlib_libfontenc/Config.in            |    5 -
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |   16 -
 package/x11r7/xlib_liboldX/Config.in               |    5 -
 package/x11r7/xlib_liboldX/xlib_liboldX.mk         |   14 -
 package/x11r7/xlib_libpciaccess/Config.in          |    8 -
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |   12 -
 package/x11r7/xlib_libxkbfile/Config.in            |    6 -
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |   16 -
 package/x11r7/xlib_libxkbui/Config.in              |    7 -
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk       |   13 -
 package/x11r7/xlib_xtrans/Config.in                |    4 -
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |   13 -
 package/x11r7/xproto_applewmproto/Config.in        |    4 -
 .../xproto_applewmproto/xproto_applewmproto.mk     |   13 -
 package/x11r7/xproto_bigreqsproto/Config.in        |    4 -
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |   13 -
 package/x11r7/xproto_compositeproto/Config.in      |    4 -
 .../xproto_compositeproto/xproto_compositeproto.mk |   13 -
 package/x11r7/xproto_damageproto/Config.in         |    4 -
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |   13 -
 package/x11r7/xproto_dmxproto/Config.in            |    4 -
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk   |   13 -
 package/x11r7/xproto_dri2proto/Config.in           |    4 -
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |   13 -
 package/x11r7/xproto_fixesproto/Config.in          |    4 -
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |   14 -
 package/x11r7/xproto_fontcacheproto/Config.in      |    4 -
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |   14 -
 package/x11r7/xproto_fontsproto/Config.in          |    4 -
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |   14 -
 package/x11r7/xproto_glproto/Config.in             |    4 -
 package/x11r7/xproto_glproto/xproto_glproto.mk     |   13 -
 package/x11r7/xproto_inputproto/Config.in          |    4 -
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |   14 -
 package/x11r7/xproto_kbproto/Config.in             |    4 -
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |   14 -
 package/x11r7/xproto_printproto/Config.in          |    4 -
 .../x11r7/xproto_printproto/xproto_printproto.mk   |   13 -
 package/x11r7/xproto_randrproto/Config.in          |    4 -
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |   13 -
 package/x11r7/xproto_recordproto/Config.in         |    4 -
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |   13 -
 package/x11r7/xproto_renderproto/Config.in         |    4 -
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |   14 -
 package/x11r7/xproto_resourceproto/Config.in       |    4 -
 .../xproto_resourceproto/xproto_resourceproto.mk   |   13 -
 package/x11r7/xproto_scrnsaverproto/Config.in      |    4 -
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |   13 -
 package/x11r7/xproto_videoproto/Config.in          |    4 -
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |   13 -
 package/x11r7/xproto_windowswmproto/Config.in      |    4 -
 .../xproto_windowswmproto/xproto_windowswmproto.mk |   13 -
 package/x11r7/xproto_xcmiscproto/Config.in         |    4 -
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |   14 -
 package/x11r7/xproto_xextproto/Config.in           |    4 -
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |   14 -
 package/x11r7/xproto_xf86bigfontproto/Config.in    |    4 -
 .../xproto_xf86bigfontproto.mk                     |   14 -
 package/x11r7/xproto_xf86dgaproto/Config.in        |    4 -
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |   13 -
 package/x11r7/xproto_xf86driproto/Config.in        |    4 -
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |   13 -
 package/x11r7/xproto_xf86rushproto/Config.in       |    4 -
 .../xproto_xf86rushproto/xproto_xf86rushproto.mk   |   13 -
 package/x11r7/xproto_xf86vidmodeproto/Config.in    |    4 -
 .../xproto_xf86vidmodeproto.mk                     |   13 -
 package/x11r7/xproto_xineramaproto/Config.in       |    4 -
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |   13 -
 package/x11r7/xproto_xproto/Config.in              |    4 -
 package/x11r7/xproto_xproto/xproto_xproto.mk       |   14 -
 package/x11r7/xutil_makedepend/Config.in           |    4 -
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |   16 -
 package/x11r7/xutil_util-macros/Config.in          |    4 -
 .../xutil_util-macros-1.3.0.patch                  |    9 -
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |   14 -
 1066 files changed, 6388 insertions(+), 6387 deletions(-)
 create mode 100644 package/x11r7/applications/xapp_appres/Config.in
 create mode 100644 package/x11r7/applications/xapp_appres/xapp_appres.mk
 create mode 100644 package/x11r7/applications/xapp_bdftopcf/Config.in
 create mode 100644 package/x11r7/applications/xapp_bdftopcf/xapp_bdftopcf.mk
 create mode 100644 package/x11r7/applications/xapp_beforelight/Config.in
 create mode 100644 package/x11r7/applications/xapp_beforelight/xapp_beforelight.mk
 create mode 100644 package/x11r7/applications/xapp_bitmap/Config.in
 create mode 100644 package/x11r7/applications/xapp_bitmap/xapp_bitmap.mk
 create mode 100644 package/x11r7/applications/xapp_editres/Config.in
 create mode 100644 package/x11r7/applications/xapp_editres/xapp_editres.mk
 create mode 100644 package/x11r7/applications/xapp_fonttosfnt/Config.in
 create mode 100644 package/x11r7/applications/xapp_fonttosfnt/xapp_fonttosfnt.mk
 create mode 100644 package/x11r7/applications/xapp_fslsfonts/Config.in
 create mode 100644 package/x11r7/applications/xapp_fslsfonts/xapp_fslsfonts.mk
 create mode 100644 package/x11r7/applications/xapp_fstobdf/Config.in
 create mode 100644 package/x11r7/applications/xapp_fstobdf/xapp_fstobdf.mk
 create mode 100644 package/x11r7/applications/xapp_iceauth/Config.in
 create mode 100644 package/x11r7/applications/xapp_iceauth/xapp_iceauth.mk
 create mode 100644 package/x11r7/applications/xapp_ico/Config.in
 create mode 100644 package/x11r7/applications/xapp_ico/xapp_ico.mk
 create mode 100644 package/x11r7/applications/xapp_listres/Config.in
 create mode 100644 package/x11r7/applications/xapp_listres/xapp_listres.mk
 create mode 100644 package/x11r7/applications/xapp_luit/Config.in
 create mode 100644 package/x11r7/applications/xapp_luit/xapp_luit.mk
 create mode 100644 package/x11r7/applications/xapp_mkfontdir/Config.in
 create mode 100644 package/x11r7/applications/xapp_mkfontdir/xapp_mkfontdir.mk
 create mode 100644 package/x11r7/applications/xapp_mkfontscale/Config.in
 create mode 100644 package/x11r7/applications/xapp_mkfontscale/xapp_mkfontscale.mk
 create mode 100644 package/x11r7/applications/xapp_oclock/Config.in
 create mode 100644 package/x11r7/applications/xapp_oclock/xapp_oclock.mk
 create mode 100644 package/x11r7/applications/xapp_rgb/Config.in
 create mode 100644 package/x11r7/applications/xapp_rgb/xapp_rgb.mk
 create mode 100644 package/x11r7/applications/xapp_rstart/Config.in
 create mode 100644 package/x11r7/applications/xapp_rstart/xapp_rstart.mk
 create mode 100644 package/x11r7/applications/xapp_scripts/Config.in
 create mode 100644 package/x11r7/applications/xapp_scripts/xapp_scripts.mk
 create mode 100644 package/x11r7/applications/xapp_sessreg/Config.in
 create mode 100644 package/x11r7/applications/xapp_sessreg/xapp_sessreg.mk
 create mode 100644 package/x11r7/applications/xapp_setxkbmap/Config.in
 create mode 100644 package/x11r7/applications/xapp_setxkbmap/xapp_setxkbmap.mk
 create mode 100644 package/x11r7/applications/xapp_showfont/Config.in
 create mode 100644 package/x11r7/applications/xapp_showfont/xapp_showfont.mk
 create mode 100644 package/x11r7/applications/xapp_smproxy/Config.in
 create mode 100644 package/x11r7/applications/xapp_smproxy/xapp_smproxy.mk
 create mode 100644 package/x11r7/applications/xapp_twm/Config.in
 create mode 100644 package/x11r7/applications/xapp_twm/xapp_twm.mk
 create mode 100644 package/x11r7/applications/xapp_viewres/Config.in
 create mode 100644 package/x11r7/applications/xapp_viewres/xapp_viewres.mk
 create mode 100644 package/x11r7/applications/xapp_x11perf/Config.in
 create mode 100644 package/x11r7/applications/xapp_x11perf/xapp_x11perf.mk
 create mode 100644 package/x11r7/applications/xapp_xauth/Config.in
 create mode 100644 package/x11r7/applications/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
 create mode 100644 package/x11r7/applications/xapp_xauth/xapp_xauth.mk
 create mode 100644 package/x11r7/applications/xapp_xbacklight/Config.in
 create mode 100644 package/x11r7/applications/xapp_xbacklight/xapp_xbacklight.mk
 create mode 100644 package/x11r7/applications/xapp_xbiff/Config.in
 create mode 100644 package/x11r7/applications/xapp_xbiff/xapp_xbiff.mk
 create mode 100644 package/x11r7/applications/xapp_xcalc/Config.in
 create mode 100644 package/x11r7/applications/xapp_xcalc/xapp_xcalc.mk
 create mode 100644 package/x11r7/applications/xapp_xclipboard/Config.in
 create mode 100644 package/x11r7/applications/xapp_xclipboard/xapp_xclipboard.mk
 create mode 100644 package/x11r7/applications/xapp_xclock/Config.in
 create mode 100644 package/x11r7/applications/xapp_xclock/xapp_xclock.mk
 create mode 100644 package/x11r7/applications/xapp_xcmsdb/Config.in
 create mode 100644 package/x11r7/applications/xapp_xcmsdb/xapp_xcmsdb.mk
 create mode 100644 package/x11r7/applications/xapp_xcursorgen/Config.in
 create mode 100644 package/x11r7/applications/xapp_xcursorgen/xapp_xcursorgen.mk
 create mode 100644 package/x11r7/applications/xapp_xdbedizzy/Config.in
 create mode 100644 package/x11r7/applications/xapp_xdbedizzy/xapp_xdbedizzy.mk
 create mode 100644 package/x11r7/applications/xapp_xditview/Config.in
 create mode 100644 package/x11r7/applications/xapp_xditview/xapp_xditview.mk
 create mode 100644 package/x11r7/applications/xapp_xdm/Config.in
 create mode 100644 package/x11r7/applications/xapp_xdm/xapp_xdm.mk
 create mode 100644 package/x11r7/applications/xapp_xdpyinfo/Config.in
 create mode 100644 package/x11r7/applications/xapp_xdpyinfo/xapp_xdpyinfo.mk
 create mode 100644 package/x11r7/applications/xapp_xdriinfo/Config.in
 create mode 100644 package/x11r7/applications/xapp_xdriinfo/xapp_xdriinfo.mk
 create mode 100644 package/x11r7/applications/xapp_xedit/Config.in
 create mode 100644 package/x11r7/applications/xapp_xedit/xapp_xedit.mk
 create mode 100644 package/x11r7/applications/xapp_xev/Config.in
 create mode 100644 package/x11r7/applications/xapp_xev/xapp_xev.mk
 create mode 100644 package/x11r7/applications/xapp_xeyes/Config.in
 create mode 100644 package/x11r7/applications/xapp_xeyes/xapp_xeyes.mk
 create mode 100644 package/x11r7/applications/xapp_xf86dga/Config.in
 create mode 100644 package/x11r7/applications/xapp_xf86dga/xapp_xf86dga.mk
 create mode 100644 package/x11r7/applications/xapp_xfd/Config.in
 create mode 100644 package/x11r7/applications/xapp_xfd/xapp_xfd.mk
 create mode 100644 package/x11r7/applications/xapp_xfontsel/Config.in
 create mode 100644 package/x11r7/applications/xapp_xfontsel/xapp_xfontsel.mk
 create mode 100644 package/x11r7/applications/xapp_xfs/Config.in
 create mode 100644 package/x11r7/applications/xapp_xfs/xapp_xfs.mk
 create mode 100644 package/x11r7/applications/xapp_xfsinfo/Config.in
 create mode 100644 package/x11r7/applications/xapp_xfsinfo/xapp_xfsinfo.mk
 create mode 100644 package/x11r7/applications/xapp_xgamma/Config.in
 create mode 100644 package/x11r7/applications/xapp_xgamma/xapp_xgamma.mk
 create mode 100644 package/x11r7/applications/xapp_xgc/Config.in
 create mode 100644 package/x11r7/applications/xapp_xgc/xapp_xgc.mk
 create mode 100644 package/x11r7/applications/xapp_xhost/Config.in
 create mode 100644 package/x11r7/applications/xapp_xhost/xapp_xhost.mk
 create mode 100644 package/x11r7/applications/xapp_xinit/Config.in
 create mode 100644 package/x11r7/applications/xapp_xinit/xapp_xinit.mk
 create mode 100644 package/x11r7/applications/xapp_xinput/Config.in
 create mode 100644 package/x11r7/applications/xapp_xinput/xapp_xinput.mk
 create mode 100644 package/x11r7/applications/xapp_xkbcomp/Config.in
 create mode 100644 package/x11r7/applications/xapp_xkbcomp/xapp_xkbcomp.mk
 create mode 100644 package/x11r7/applications/xapp_xkbevd/Config.in
 create mode 100644 package/x11r7/applications/xapp_xkbevd/xapp_xkbevd.mk
 create mode 100644 package/x11r7/applications/xapp_xkbprint/Config.in
 create mode 100644 package/x11r7/applications/xapp_xkbprint/xapp_xkbprint.mk
 create mode 100644 package/x11r7/applications/xapp_xkbutils/Config.in
 create mode 100644 package/x11r7/applications/xapp_xkbutils/xapp_xkbutils.mk
 create mode 100644 package/x11r7/applications/xapp_xkill/Config.in
 create mode 100644 package/x11r7/applications/xapp_xkill/xapp_xkill.mk
 create mode 100644 package/x11r7/applications/xapp_xload/Config.in
 create mode 100644 package/x11r7/applications/xapp_xload/xapp_xload.mk
 create mode 100644 package/x11r7/applications/xapp_xlogo/Config.in
 create mode 100644 package/x11r7/applications/xapp_xlogo/xapp_xlogo.mk
 create mode 100644 package/x11r7/applications/xapp_xlsatoms/Config.in
 create mode 100644 package/x11r7/applications/xapp_xlsatoms/xapp_xlsatoms.mk
 create mode 100644 package/x11r7/applications/xapp_xlsclients/Config.in
 create mode 100644 package/x11r7/applications/xapp_xlsclients/xapp_xlsclients.mk
 create mode 100644 package/x11r7/applications/xapp_xlsfonts/Config.in
 create mode 100644 package/x11r7/applications/xapp_xlsfonts/xapp_xlsfonts.mk
 create mode 100644 package/x11r7/applications/xapp_xmag/Config.in
 create mode 100644 package/x11r7/applications/xapp_xmag/xapp_xmag.mk
 create mode 100644 package/x11r7/applications/xapp_xman/Config.in
 create mode 100644 package/x11r7/applications/xapp_xman/xapp_xman.mk
 create mode 100644 package/x11r7/applications/xapp_xmessage/Config.in
 create mode 100644 package/x11r7/applications/xapp_xmessage/xapp_xmessage.mk
 create mode 100644 package/x11r7/applications/xapp_xmh/Config.in
 create mode 100644 package/x11r7/applications/xapp_xmh/xapp_xmh.mk
 create mode 100644 package/x11r7/applications/xapp_xmodmap/Config.in
 create mode 100644 package/x11r7/applications/xapp_xmodmap/xapp_xmodmap.mk
 create mode 100644 package/x11r7/applications/xapp_xmore/Config.in
 create mode 100644 package/x11r7/applications/xapp_xmore/xapp_xmore.mk
 create mode 100644 package/x11r7/applications/xapp_xplsprinters/Config.in
 create mode 100644 package/x11r7/applications/xapp_xplsprinters/xapp_xplsprinters.mk
 create mode 100644 package/x11r7/applications/xapp_xpr/Config.in
 create mode 100644 package/x11r7/applications/xapp_xpr/xapp_xpr.mk
 create mode 100644 package/x11r7/applications/xapp_xprehashprinterlist/Config.in
 create mode 100644 package/x11r7/applications/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
 create mode 100644 package/x11r7/applications/xapp_xprop/Config.in
 create mode 100644 package/x11r7/applications/xapp_xprop/xapp_xprop.mk
 create mode 100644 package/x11r7/applications/xapp_xrandr/Config.in
 create mode 100644 package/x11r7/applications/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
 create mode 100644 package/x11r7/applications/xapp_xrandr/xapp_xrandr.mk
 create mode 100644 package/x11r7/applications/xapp_xrdb/Config.in
 create mode 100644 package/x11r7/applications/xapp_xrdb/xapp_xrdb.mk
 create mode 100644 package/x11r7/applications/xapp_xrefresh/Config.in
 create mode 100644 package/x11r7/applications/xapp_xrefresh/xapp_xrefresh.mk
 create mode 100644 package/x11r7/applications/xapp_xset/Config.in
 create mode 100644 package/x11r7/applications/xapp_xset/xapp_xset.mk
 create mode 100644 package/x11r7/applications/xapp_xsetmode/Config.in
 create mode 100644 package/x11r7/applications/xapp_xsetmode/xapp_xsetmode.mk
 create mode 100644 package/x11r7/applications/xapp_xsetpointer/Config.in
 create mode 100644 package/x11r7/applications/xapp_xsetpointer/xapp_xsetpointer.mk
 create mode 100644 package/x11r7/applications/xapp_xsetroot/Config.in
 create mode 100644 package/x11r7/applications/xapp_xsetroot/xapp_xsetroot.mk
 create mode 100644 package/x11r7/applications/xapp_xsm/Config.in
 create mode 100644 package/x11r7/applications/xapp_xsm/xapp_xsm.mk
 create mode 100644 package/x11r7/applications/xapp_xstdcmap/Config.in
 create mode 100644 package/x11r7/applications/xapp_xstdcmap/xapp_xstdcmap.mk
 create mode 100644 package/x11r7/applications/xapp_xvidtune/Config.in
 create mode 100644 package/x11r7/applications/xapp_xvidtune/xapp_xvidtune.mk
 create mode 100644 package/x11r7/applications/xapp_xvinfo/Config.in
 create mode 100644 package/x11r7/applications/xapp_xvinfo/xapp_xvinfo.mk
 create mode 100644 package/x11r7/applications/xapp_xwd/Config.in
 create mode 100644 package/x11r7/applications/xapp_xwd/xapp_xwd.mk
 create mode 100644 package/x11r7/applications/xapp_xwininfo/Config.in
 create mode 100644 package/x11r7/applications/xapp_xwininfo/xapp_xwininfo.mk
 create mode 100644 package/x11r7/applications/xapp_xwud/Config.in
 create mode 100644 package/x11r7/applications/xapp_xwud/xapp_xwud.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-acecad/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-aiptek/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-evdev/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-joystick/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-keyboard/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-mouse/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-synaptics/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-vmmouse/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-void/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-apm/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-ark/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-ast/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-ati/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-chips/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-cirrus/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-dummy/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-fbdev/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-geode/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-glide/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-glint/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-i128/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-i740/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-intel/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-mach64/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-mga/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-neomagic/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-newport/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-nv/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-openchrome/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-r128/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-rendition/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-s3/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-s3virge/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-savage/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-siliconmotion/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sis/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sisusb/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suncg14/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suncg3/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suncg6/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sunffb/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sunleo/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suntcx/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-tdfx/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-tga/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-trident/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-tseng/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-v4l/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-vesa/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-vmware/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-voodoo/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-wsfb/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-xgi/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-xgixp/Config.in
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
 create mode 100644 package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
 create mode 100644 package/x11r7/fonts/xfont_encodings/Config.in
 create mode 100644 package/x11r7/fonts/xfont_encodings/xfont_encodings.mk
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-100dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-75dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-utopia-type1/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
 create mode 100644 package/x11r7/fonts/xfont_font-alias/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-alias/xfont_font-alias.mk
 create mode 100644 package/x11r7/fonts/xfont_font-arabic-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bh-100dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bh-75dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bh-ttf/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bh-type1/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bh-type1/xfont_font-bh-type1.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-100dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-75dpi/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-speedo/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-type1/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
 create mode 100644 package/x11r7/fonts/xfont_font-cronyx-cyrillic/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
 create mode 100644 package/x11r7/fonts/xfont_font-cursor-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-daewoo-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-dec-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-dec-misc/xfont_font-dec-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-ibm-type1/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
 create mode 100644 package/x11r7/fonts/xfont_font-isas-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-isas-misc/xfont_font-isas-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-jis-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-jis-misc/xfont_font-jis-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-micro-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-micro-misc/xfont_font-micro-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-misc-cyrillic/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
 create mode 100644 package/x11r7/fonts/xfont_font-misc-ethiopic/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
 create mode 100644 package/x11r7/fonts/xfont_font-misc-meltho/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
 create mode 100644 package/x11r7/fonts/xfont_font-misc-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-misc-misc/xfont_font-misc-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-mutt-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-schumacher-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-screen-cyrillic/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
 create mode 100644 package/x11r7/fonts/xfont_font-sony-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-sony-misc/xfont_font-sony-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-sun-misc/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-sun-misc/xfont_font-sun-misc.mk
 create mode 100644 package/x11r7/fonts/xfont_font-util/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-util/xfont_font-util.mk
 create mode 100644 package/x11r7/fonts/xfont_font-winitzki-cyrillic/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
 create mode 100644 package/x11r7/fonts/xfont_font-xfree86-type1/Config.in
 create mode 100644 package/x11r7/fonts/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
 create mode 100644 package/x11r7/libraries/libxcb/Config.in
 create mode 100644 package/x11r7/libraries/libxcb/libxcb.mk
 create mode 100644 package/x11r7/libraries/mesa3d/Config.in
 create mode 100644 package/x11r7/libraries/mesa3d/mesa3d.mk
 create mode 100644 package/x11r7/libraries/pthread-stubs/Config.in
 create mode 100644 package/x11r7/libraries/pthread-stubs/pthread-stubs.mk
 create mode 100644 package/x11r7/libraries/xcb-util/Config.in
 create mode 100644 package/x11r7/libraries/xcb-util/xcb-util.mk
 create mode 100644 package/x11r7/libraries/xlib_libFS/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libFS/xlib_libFS.mk
 create mode 100644 package/x11r7/libraries/xlib_libICE/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libICE/xlib_libICE.mk
 create mode 100644 package/x11r7/libraries/xlib_libSM/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libSM/xlib_libSM.mk
 create mode 100644 package/x11r7/libraries/xlib_libX11/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
 create mode 100644 package/x11r7/libraries/xlib_libX11/xlib_libX11.mk
 create mode 100644 package/x11r7/libraries/xlib_libXScrnSaver/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
 create mode 100644 package/x11r7/libraries/xlib_libXau/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXau/xlib_libXau.mk
 create mode 100644 package/x11r7/libraries/xlib_libXaw/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXaw/xlib_libXaw.mk
 create mode 100644 package/x11r7/libraries/xlib_libXcomposite/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXcomposite/xlib_libXcomposite.mk
 create mode 100644 package/x11r7/libraries/xlib_libXcursor/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXcursor/xlib_libXcursor.mk
 create mode 100644 package/x11r7/libraries/xlib_libXdamage/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXdamage/xlib_libXdamage.mk
 create mode 100644 package/x11r7/libraries/xlib_libXdmcp/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXdmcp/xlib_libXdmcp.mk
 create mode 100644 package/x11r7/libraries/xlib_libXext/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXext/xlib_libXext.mk
 create mode 100644 package/x11r7/libraries/xlib_libXfixes/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXfixes/xlib_libXfixes.mk
 create mode 100644 package/x11r7/libraries/xlib_libXfont/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXfont/xlib_libXfont.mk
 create mode 100644 package/x11r7/libraries/xlib_libXfontcache/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXfontcache/xlib_libXfontcache.mk
 create mode 100644 package/x11r7/libraries/xlib_libXft/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXft/xlib_libXft.mk
 create mode 100644 package/x11r7/libraries/xlib_libXi/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXi/xlib_libXi.mk
 create mode 100644 package/x11r7/libraries/xlib_libXinerama/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXinerama/xlib_libXinerama.mk
 create mode 100644 package/x11r7/libraries/xlib_libXmu/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXmu/xlib_libXmu.mk
 create mode 100644 package/x11r7/libraries/xlib_libXp/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXp/xlib_libXp.mk
 create mode 100644 package/x11r7/libraries/xlib_libXpm/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXpm/xlib_libXpm.mk
 create mode 100644 package/x11r7/libraries/xlib_libXprintAppUtil/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
 create mode 100644 package/x11r7/libraries/xlib_libXprintUtil/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXprintUtil/xlib_libXprintUtil.mk
 create mode 100644 package/x11r7/libraries/xlib_libXrandr/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXrandr/xlib_libXrandr.mk
 create mode 100644 package/x11r7/libraries/xlib_libXrender/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXrender/xlib_libXrender.mk
 create mode 100644 package/x11r7/libraries/xlib_libXres/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXres/xlib_libXres.mk
 create mode 100644 package/x11r7/libraries/xlib_libXt/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
 create mode 100644 package/x11r7/libraries/xlib_libXt/xlib_libXt.mk
 create mode 100644 package/x11r7/libraries/xlib_libXtst/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXtst/xlib_libXtst.mk
 create mode 100644 package/x11r7/libraries/xlib_libXv/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXv/xlib_libXv.mk
 create mode 100644 package/x11r7/libraries/xlib_libXvMC/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXvMC/xlib_libXvMC.mk
 create mode 100644 package/x11r7/libraries/xlib_libXxf86dga/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXxf86dga/xlib_libXxf86dga.mk
 create mode 100644 package/x11r7/libraries/xlib_libXxf86vm/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libXxf86vm/xlib_libXxf86vm.mk
 create mode 100644 package/x11r7/libraries/xlib_libdmx/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libdmx/xlib_libdmx.mk
 create mode 100644 package/x11r7/libraries/xlib_libfontenc/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libfontenc/xlib_libfontenc.mk
 create mode 100644 package/x11r7/libraries/xlib_liboldX/Config.in
 create mode 100644 package/x11r7/libraries/xlib_liboldX/xlib_liboldX.mk
 create mode 100644 package/x11r7/libraries/xlib_libpciaccess/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libpciaccess/xlib_libpciaccess.mk
 create mode 100644 package/x11r7/libraries/xlib_libxkbfile/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libxkbfile/xlib_libxkbfile.mk
 create mode 100644 package/x11r7/libraries/xlib_libxkbui/Config.in
 create mode 100644 package/x11r7/libraries/xlib_libxkbui/xlib_libxkbui.mk
 create mode 100644 package/x11r7/libraries/xlib_xtrans/Config.in
 create mode 100644 package/x11r7/libraries/xlib_xtrans/xlib_xtrans.mk
 delete mode 100644 package/x11r7/libxcb/Config.in
 delete mode 100644 package/x11r7/libxcb/libxcb.mk
 delete mode 100644 package/x11r7/mcookie/Config.in
 delete mode 100644 package/x11r7/mcookie/mcookie.c
 delete mode 100644 package/x11r7/mcookie/mcookie.mk
 delete mode 100644 package/x11r7/mesa3d/Config.in
 delete mode 100644 package/x11r7/mesa3d/mesa3d.mk
 create mode 100644 package/x11r7/other/xdata_xbitmaps/Config.in
 create mode 100644 package/x11r7/other/xdata_xbitmaps/xdata_xbitmaps.mk
 create mode 100644 package/x11r7/other/xdata_xcursor-themes/Config.in
 create mode 100644 package/x11r7/other/xdata_xcursor-themes/xdata_xcursor-themes.mk
 create mode 100644 package/x11r7/other/xkeyboard-config/Config.in
 create mode 100644 package/x11r7/other/xkeyboard-config/xkeyboard-config.mk
 create mode 100644 package/x11r7/protocols/xcb-proto/Config.in
 create mode 100644 package/x11r7/protocols/xcb-proto/xcb-proto.mk
 create mode 100644 package/x11r7/protocols/xproto_applewmproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_applewmproto/xproto_applewmproto.mk
 create mode 100644 package/x11r7/protocols/xproto_bigreqsproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_bigreqsproto/xproto_bigreqsproto.mk
 create mode 100644 package/x11r7/protocols/xproto_compositeproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_compositeproto/xproto_compositeproto.mk
 create mode 100644 package/x11r7/protocols/xproto_damageproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_damageproto/xproto_damageproto.mk
 create mode 100644 package/x11r7/protocols/xproto_dmxproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_dmxproto/xproto_dmxproto.mk
 create mode 100644 package/x11r7/protocols/xproto_dri2proto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_dri2proto/xproto_dri2proto.mk
 create mode 100644 package/x11r7/protocols/xproto_fixesproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_fixesproto/xproto_fixesproto.mk
 create mode 100644 package/x11r7/protocols/xproto_fontcacheproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_fontcacheproto/xproto_fontcacheproto.mk
 create mode 100644 package/x11r7/protocols/xproto_fontsproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_fontsproto/xproto_fontsproto.mk
 create mode 100644 package/x11r7/protocols/xproto_glproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_glproto/xproto_glproto.mk
 create mode 100644 package/x11r7/protocols/xproto_inputproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_inputproto/xproto_inputproto.mk
 create mode 100644 package/x11r7/protocols/xproto_kbproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_kbproto/xproto_kbproto.mk
 create mode 100644 package/x11r7/protocols/xproto_printproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_printproto/xproto_printproto.mk
 create mode 100644 package/x11r7/protocols/xproto_randrproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_randrproto/xproto_randrproto.mk
 create mode 100644 package/x11r7/protocols/xproto_recordproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_recordproto/xproto_recordproto.mk
 create mode 100644 package/x11r7/protocols/xproto_renderproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_renderproto/xproto_renderproto.mk
 create mode 100644 package/x11r7/protocols/xproto_resourceproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_resourceproto/xproto_resourceproto.mk
 create mode 100644 package/x11r7/protocols/xproto_scrnsaverproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
 create mode 100644 package/x11r7/protocols/xproto_videoproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_videoproto/xproto_videoproto.mk
 create mode 100644 package/x11r7/protocols/xproto_windowswmproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_windowswmproto/xproto_windowswmproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xcmiscproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xcmiscproto/xproto_xcmiscproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xextproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xextproto/xproto_xextproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xf86bigfontproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xf86dgaproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xf86driproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xf86driproto/xproto_xf86driproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xf86rushproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xf86rushproto/xproto_xf86rushproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xf86vidmodeproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xineramaproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xineramaproto/xproto_xineramaproto.mk
 create mode 100644 package/x11r7/protocols/xproto_xproto/Config.in
 create mode 100644 package/x11r7/protocols/xproto_xproto/xproto_xproto.mk
 delete mode 100644 package/x11r7/pthread-stubs/Config.in
 delete mode 100644 package/x11r7/pthread-stubs/pthread-stubs.mk
 create mode 100644 package/x11r7/utils/mcookie/Config.in
 create mode 100644 package/x11r7/utils/mcookie/mcookie.c
 create mode 100644 package/x11r7/utils/mcookie/mcookie.mk
 create mode 100644 package/x11r7/utils/xutil_makedepend/Config.in
 create mode 100644 package/x11r7/utils/xutil_makedepend/xutil_makedepend.mk
 create mode 100644 package/x11r7/utils/xutil_util-macros/Config.in
 create mode 100644 package/x11r7/utils/xutil_util-macros/xutil_util-macros-1.3.0.patch
 create mode 100644 package/x11r7/utils/xutil_util-macros/xutil_util-macros.mk
 delete mode 100644 package/x11r7/xapp_appres/Config.in
 delete mode 100644 package/x11r7/xapp_appres/xapp_appres.mk
 delete mode 100644 package/x11r7/xapp_bdftopcf/Config.in
 delete mode 100644 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
 delete mode 100644 package/x11r7/xapp_beforelight/Config.in
 delete mode 100644 package/x11r7/xapp_beforelight/xapp_beforelight.mk
 delete mode 100644 package/x11r7/xapp_bitmap/Config.in
 delete mode 100644 package/x11r7/xapp_bitmap/xapp_bitmap.mk
 delete mode 100644 package/x11r7/xapp_editres/Config.in
 delete mode 100644 package/x11r7/xapp_editres/xapp_editres.mk
 delete mode 100644 package/x11r7/xapp_fonttosfnt/Config.in
 delete mode 100644 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
 delete mode 100644 package/x11r7/xapp_fslsfonts/Config.in
 delete mode 100644 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
 delete mode 100644 package/x11r7/xapp_fstobdf/Config.in
 delete mode 100644 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
 delete mode 100644 package/x11r7/xapp_iceauth/Config.in
 delete mode 100644 package/x11r7/xapp_iceauth/xapp_iceauth.mk
 delete mode 100644 package/x11r7/xapp_ico/Config.in
 delete mode 100644 package/x11r7/xapp_ico/xapp_ico.mk
 delete mode 100644 package/x11r7/xapp_listres/Config.in
 delete mode 100644 package/x11r7/xapp_listres/xapp_listres.mk
 delete mode 100644 package/x11r7/xapp_luit/Config.in
 delete mode 100644 package/x11r7/xapp_luit/xapp_luit.mk
 delete mode 100644 package/x11r7/xapp_mkfontdir/Config.in
 delete mode 100644 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
 delete mode 100644 package/x11r7/xapp_mkfontscale/Config.in
 delete mode 100644 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
 delete mode 100644 package/x11r7/xapp_oclock/Config.in
 delete mode 100644 package/x11r7/xapp_oclock/xapp_oclock.mk
 delete mode 100644 package/x11r7/xapp_rgb/Config.in
 delete mode 100644 package/x11r7/xapp_rgb/xapp_rgb.mk
 delete mode 100644 package/x11r7/xapp_rstart/Config.in
 delete mode 100644 package/x11r7/xapp_rstart/xapp_rstart.mk
 delete mode 100644 package/x11r7/xapp_scripts/Config.in
 delete mode 100644 package/x11r7/xapp_scripts/xapp_scripts.mk
 delete mode 100644 package/x11r7/xapp_sessreg/Config.in
 delete mode 100644 package/x11r7/xapp_sessreg/xapp_sessreg.mk
 delete mode 100644 package/x11r7/xapp_setxkbmap/Config.in
 delete mode 100644 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
 delete mode 100644 package/x11r7/xapp_showfont/Config.in
 delete mode 100644 package/x11r7/xapp_showfont/xapp_showfont.mk
 delete mode 100644 package/x11r7/xapp_smproxy/Config.in
 delete mode 100644 package/x11r7/xapp_smproxy/xapp_smproxy.mk
 delete mode 100644 package/x11r7/xapp_twm/Config.in
 delete mode 100644 package/x11r7/xapp_twm/xapp_twm.mk
 delete mode 100644 package/x11r7/xapp_viewres/Config.in
 delete mode 100644 package/x11r7/xapp_viewres/xapp_viewres.mk
 delete mode 100644 package/x11r7/xapp_x11perf/Config.in
 delete mode 100644 package/x11r7/xapp_x11perf/xapp_x11perf.mk
 delete mode 100644 package/x11r7/xapp_xauth/Config.in
 delete mode 100644 package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
 delete mode 100644 package/x11r7/xapp_xauth/xapp_xauth.mk
 delete mode 100644 package/x11r7/xapp_xbacklight/Config.in
 delete mode 100644 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
 delete mode 100644 package/x11r7/xapp_xbiff/Config.in
 delete mode 100644 package/x11r7/xapp_xbiff/xapp_xbiff.mk
 delete mode 100644 package/x11r7/xapp_xcalc/Config.in
 delete mode 100644 package/x11r7/xapp_xcalc/xapp_xcalc.mk
 delete mode 100644 package/x11r7/xapp_xclipboard/Config.in
 delete mode 100644 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
 delete mode 100644 package/x11r7/xapp_xclock/Config.in
 delete mode 100644 package/x11r7/xapp_xclock/xapp_xclock.mk
 delete mode 100644 package/x11r7/xapp_xcmsdb/Config.in
 delete mode 100644 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
 delete mode 100644 package/x11r7/xapp_xcursorgen/Config.in
 delete mode 100644 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
 delete mode 100644 package/x11r7/xapp_xdbedizzy/Config.in
 delete mode 100644 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
 delete mode 100644 package/x11r7/xapp_xditview/Config.in
 delete mode 100644 package/x11r7/xapp_xditview/xapp_xditview.mk
 delete mode 100644 package/x11r7/xapp_xdm/Config.in
 delete mode 100644 package/x11r7/xapp_xdm/xapp_xdm.mk
 delete mode 100644 package/x11r7/xapp_xdpyinfo/Config.in
 delete mode 100644 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
 delete mode 100644 package/x11r7/xapp_xdriinfo/Config.in
 delete mode 100644 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
 delete mode 100644 package/x11r7/xapp_xedit/Config.in
 delete mode 100644 package/x11r7/xapp_xedit/xapp_xedit.mk
 delete mode 100644 package/x11r7/xapp_xev/Config.in
 delete mode 100644 package/x11r7/xapp_xev/xapp_xev.mk
 delete mode 100644 package/x11r7/xapp_xeyes/Config.in
 delete mode 100644 package/x11r7/xapp_xeyes/xapp_xeyes.mk
 delete mode 100644 package/x11r7/xapp_xf86dga/Config.in
 delete mode 100644 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
 delete mode 100644 package/x11r7/xapp_xfd/Config.in
 delete mode 100644 package/x11r7/xapp_xfd/xapp_xfd.mk
 delete mode 100644 package/x11r7/xapp_xfontsel/Config.in
 delete mode 100644 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
 delete mode 100644 package/x11r7/xapp_xfs/Config.in
 delete mode 100644 package/x11r7/xapp_xfs/xapp_xfs.mk
 delete mode 100644 package/x11r7/xapp_xfsinfo/Config.in
 delete mode 100644 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
 delete mode 100644 package/x11r7/xapp_xgamma/Config.in
 delete mode 100644 package/x11r7/xapp_xgamma/xapp_xgamma.mk
 delete mode 100644 package/x11r7/xapp_xgc/Config.in
 delete mode 100644 package/x11r7/xapp_xgc/xapp_xgc.mk
 delete mode 100644 package/x11r7/xapp_xhost/Config.in
 delete mode 100644 package/x11r7/xapp_xhost/xapp_xhost.mk
 delete mode 100644 package/x11r7/xapp_xinit/Config.in
 delete mode 100644 package/x11r7/xapp_xinit/xapp_xinit.mk
 delete mode 100644 package/x11r7/xapp_xinput/Config.in
 delete mode 100644 package/x11r7/xapp_xinput/xapp_xinput.mk
 delete mode 100644 package/x11r7/xapp_xkbcomp/Config.in
 delete mode 100644 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
 delete mode 100644 package/x11r7/xapp_xkbevd/Config.in
 delete mode 100644 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
 delete mode 100644 package/x11r7/xapp_xkbprint/Config.in
 delete mode 100644 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
 delete mode 100644 package/x11r7/xapp_xkbutils/Config.in
 delete mode 100644 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
 delete mode 100644 package/x11r7/xapp_xkill/Config.in
 delete mode 100644 package/x11r7/xapp_xkill/xapp_xkill.mk
 delete mode 100644 package/x11r7/xapp_xload/Config.in
 delete mode 100644 package/x11r7/xapp_xload/xapp_xload.mk
 delete mode 100644 package/x11r7/xapp_xlogo/Config.in
 delete mode 100644 package/x11r7/xapp_xlogo/xapp_xlogo.mk
 delete mode 100644 package/x11r7/xapp_xlsatoms/Config.in
 delete mode 100644 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
 delete mode 100644 package/x11r7/xapp_xlsclients/Config.in
 delete mode 100644 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
 delete mode 100644 package/x11r7/xapp_xlsfonts/Config.in
 delete mode 100644 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
 delete mode 100644 package/x11r7/xapp_xmag/Config.in
 delete mode 100644 package/x11r7/xapp_xmag/xapp_xmag.mk
 delete mode 100644 package/x11r7/xapp_xman/Config.in
 delete mode 100644 package/x11r7/xapp_xman/xapp_xman.mk
 delete mode 100644 package/x11r7/xapp_xmessage/Config.in
 delete mode 100644 package/x11r7/xapp_xmessage/xapp_xmessage.mk
 delete mode 100644 package/x11r7/xapp_xmh/Config.in
 delete mode 100644 package/x11r7/xapp_xmh/xapp_xmh.mk
 delete mode 100644 package/x11r7/xapp_xmodmap/Config.in
 delete mode 100644 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
 delete mode 100644 package/x11r7/xapp_xmore/Config.in
 delete mode 100644 package/x11r7/xapp_xmore/xapp_xmore.mk
 delete mode 100644 package/x11r7/xapp_xplsprinters/Config.in
 delete mode 100644 package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
 delete mode 100644 package/x11r7/xapp_xpr/Config.in
 delete mode 100644 package/x11r7/xapp_xpr/xapp_xpr.mk
 delete mode 100644 package/x11r7/xapp_xprehashprinterlist/Config.in
 delete mode 100644 package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
 delete mode 100644 package/x11r7/xapp_xprop/Config.in
 delete mode 100644 package/x11r7/xapp_xprop/xapp_xprop.mk
 delete mode 100644 package/x11r7/xapp_xrandr/Config.in
 delete mode 100644 package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
 delete mode 100644 package/x11r7/xapp_xrandr/xapp_xrandr.mk
 delete mode 100644 package/x11r7/xapp_xrdb/Config.in
 delete mode 100644 package/x11r7/xapp_xrdb/xapp_xrdb.mk
 delete mode 100644 package/x11r7/xapp_xrefresh/Config.in
 delete mode 100644 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
 delete mode 100644 package/x11r7/xapp_xset/Config.in
 delete mode 100644 package/x11r7/xapp_xset/xapp_xset.mk
 delete mode 100644 package/x11r7/xapp_xsetmode/Config.in
 delete mode 100644 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
 delete mode 100644 package/x11r7/xapp_xsetpointer/Config.in
 delete mode 100644 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
 delete mode 100644 package/x11r7/xapp_xsetroot/Config.in
 delete mode 100644 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
 delete mode 100644 package/x11r7/xapp_xsm/Config.in
 delete mode 100644 package/x11r7/xapp_xsm/xapp_xsm.mk
 delete mode 100644 package/x11r7/xapp_xstdcmap/Config.in
 delete mode 100644 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
 delete mode 100644 package/x11r7/xapp_xvidtune/Config.in
 delete mode 100644 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
 delete mode 100644 package/x11r7/xapp_xvinfo/Config.in
 delete mode 100644 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
 delete mode 100644 package/x11r7/xapp_xwd/Config.in
 delete mode 100644 package/x11r7/xapp_xwd/xapp_xwd.mk
 delete mode 100644 package/x11r7/xapp_xwininfo/Config.in
 delete mode 100644 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
 delete mode 100644 package/x11r7/xapp_xwud/Config.in
 delete mode 100644 package/x11r7/xapp_xwud/xapp_xwud.mk
 delete mode 100644 package/x11r7/xcb-proto/Config.in
 delete mode 100644 package/x11r7/xcb-proto/xcb-proto.mk
 delete mode 100644 package/x11r7/xcb-util/Config.in
 delete mode 100644 package/x11r7/xcb-util/xcb-util.mk
 delete mode 100644 package/x11r7/xdata_xbitmaps/Config.in
 delete mode 100644 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
 delete mode 100644 package/x11r7/xdata_xcursor-themes/Config.in
 delete mode 100644 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-acecad/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-aiptek/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-evdev/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-joystick/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-mouse/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-synaptics/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-vmmouse/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-void/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-apm/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-ark/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-ast/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-ati/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-chips/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-cirrus/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-dummy/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-fbdev/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-geode/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-glide/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-i128/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-i740/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-mach64/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-mga/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-neomagic/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-newport/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-nv/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-openchrome/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-r128/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-rendition/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3virge/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-savage/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-sis/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-sisusb/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg14/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg3/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg6/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunffb/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunleo/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-suntcx/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-tdfx/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-trident/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-tseng/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-v4l/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-vesa/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-vmware/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-voodoo/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-wsfb/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgi/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
 delete mode 100644 package/x11r7/xfont_encodings/Config.in
 delete mode 100644 package/x11r7/xfont_encodings/xfont_encodings.mk
 delete mode 100644 package/x11r7/xfont_font-adobe-100dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
 delete mode 100644 package/x11r7/xfont_font-adobe-75dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
 delete mode 100644 package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
 delete mode 100644 package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
 delete mode 100644 package/x11r7/xfont_font-adobe-utopia-type1/Config.in
 delete mode 100644 package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
 delete mode 100644 package/x11r7/xfont_font-alias/Config.in
 delete mode 100644 package/x11r7/xfont_font-alias/xfont_font-alias.mk
 delete mode 100644 package/x11r7/xfont_font-arabic-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
 delete mode 100644 package/x11r7/xfont_font-bh-100dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
 delete mode 100644 package/x11r7/xfont_font-bh-75dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
 delete mode 100644 package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
 delete mode 100644 package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
 delete mode 100644 package/x11r7/xfont_font-bh-ttf/Config.in
 delete mode 100644 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
 delete mode 100644 package/x11r7/xfont_font-bh-type1/Config.in
 delete mode 100644 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
 delete mode 100644 package/x11r7/xfont_font-bitstream-100dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
 delete mode 100644 package/x11r7/xfont_font-bitstream-75dpi/Config.in
 delete mode 100644 package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
 delete mode 100644 package/x11r7/xfont_font-bitstream-speedo/Config.in
 delete mode 100644 package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
 delete mode 100644 package/x11r7/xfont_font-bitstream-type1/Config.in
 delete mode 100644 package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
 delete mode 100644 package/x11r7/xfont_font-cronyx-cyrillic/Config.in
 delete mode 100644 package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
 delete mode 100644 package/x11r7/xfont_font-cursor-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
 delete mode 100644 package/x11r7/xfont_font-daewoo-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
 delete mode 100644 package/x11r7/xfont_font-dec-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
 delete mode 100644 package/x11r7/xfont_font-ibm-type1/Config.in
 delete mode 100644 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
 delete mode 100644 package/x11r7/xfont_font-isas-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
 delete mode 100644 package/x11r7/xfont_font-jis-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
 delete mode 100644 package/x11r7/xfont_font-micro-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
 delete mode 100644 package/x11r7/xfont_font-misc-cyrillic/Config.in
 delete mode 100644 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
 delete mode 100644 package/x11r7/xfont_font-misc-ethiopic/Config.in
 delete mode 100644 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
 delete mode 100644 package/x11r7/xfont_font-misc-meltho/Config.in
 delete mode 100644 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
 delete mode 100644 package/x11r7/xfont_font-misc-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
 delete mode 100644 package/x11r7/xfont_font-mutt-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
 delete mode 100644 package/x11r7/xfont_font-schumacher-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
 delete mode 100644 package/x11r7/xfont_font-screen-cyrillic/Config.in
 delete mode 100644 package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
 delete mode 100644 package/x11r7/xfont_font-sony-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
 delete mode 100644 package/x11r7/xfont_font-sun-misc/Config.in
 delete mode 100644 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
 delete mode 100644 package/x11r7/xfont_font-util/Config.in
 delete mode 100644 package/x11r7/xfont_font-util/xfont_font-util.mk
 delete mode 100644 package/x11r7/xfont_font-winitzki-cyrillic/Config.in
 delete mode 100644 package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
 delete mode 100644 package/x11r7/xfont_font-xfree86-type1/Config.in
 delete mode 100644 package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
 delete mode 100644 package/x11r7/xkeyboard-config/Config.in
 delete mode 100644 package/x11r7/xkeyboard-config/xkeyboard-config.mk
 delete mode 100644 package/x11r7/xlib_libFS/Config.in
 delete mode 100644 package/x11r7/xlib_libFS/xlib_libFS.mk
 delete mode 100644 package/x11r7/xlib_libICE/Config.in
 delete mode 100644 package/x11r7/xlib_libICE/xlib_libICE.mk
 delete mode 100644 package/x11r7/xlib_libSM/Config.in
 delete mode 100644 package/x11r7/xlib_libSM/xlib_libSM.mk
 delete mode 100644 package/x11r7/xlib_libX11/Config.in
 delete mode 100644 package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
 delete mode 100644 package/x11r7/xlib_libX11/xlib_libX11.mk
 delete mode 100644 package/x11r7/xlib_libXScrnSaver/Config.in
 delete mode 100644 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
 delete mode 100644 package/x11r7/xlib_libXau/Config.in
 delete mode 100644 package/x11r7/xlib_libXau/xlib_libXau.mk
 delete mode 100644 package/x11r7/xlib_libXaw/Config.in
 delete mode 100644 package/x11r7/xlib_libXaw/xlib_libXaw.mk
 delete mode 100644 package/x11r7/xlib_libXcomposite/Config.in
 delete mode 100644 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
 delete mode 100644 package/x11r7/xlib_libXcursor/Config.in
 delete mode 100644 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
 delete mode 100644 package/x11r7/xlib_libXdamage/Config.in
 delete mode 100644 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
 delete mode 100644 package/x11r7/xlib_libXdmcp/Config.in
 delete mode 100644 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
 delete mode 100644 package/x11r7/xlib_libXext/Config.in
 delete mode 100644 package/x11r7/xlib_libXext/xlib_libXext.mk
 delete mode 100644 package/x11r7/xlib_libXfixes/Config.in
 delete mode 100644 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
 delete mode 100644 package/x11r7/xlib_libXfont/Config.in
 delete mode 100644 package/x11r7/xlib_libXfont/xlib_libXfont.mk
 delete mode 100644 package/x11r7/xlib_libXfontcache/Config.in
 delete mode 100644 package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
 delete mode 100644 package/x11r7/xlib_libXft/Config.in
 delete mode 100644 package/x11r7/xlib_libXft/xlib_libXft.mk
 delete mode 100644 package/x11r7/xlib_libXi/Config.in
 delete mode 100644 package/x11r7/xlib_libXi/xlib_libXi.mk
 delete mode 100644 package/x11r7/xlib_libXinerama/Config.in
 delete mode 100644 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
 delete mode 100644 package/x11r7/xlib_libXmu/Config.in
 delete mode 100644 package/x11r7/xlib_libXmu/xlib_libXmu.mk
 delete mode 100644 package/x11r7/xlib_libXp/Config.in
 delete mode 100644 package/x11r7/xlib_libXp/xlib_libXp.mk
 delete mode 100644 package/x11r7/xlib_libXpm/Config.in
 delete mode 100644 package/x11r7/xlib_libXpm/xlib_libXpm.mk
 delete mode 100644 package/x11r7/xlib_libXprintAppUtil/Config.in
 delete mode 100644 package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
 delete mode 100644 package/x11r7/xlib_libXprintUtil/Config.in
 delete mode 100644 package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
 delete mode 100644 package/x11r7/xlib_libXrandr/Config.in
 delete mode 100644 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
 delete mode 100644 package/x11r7/xlib_libXrender/Config.in
 delete mode 100644 package/x11r7/xlib_libXrender/xlib_libXrender.mk
 delete mode 100644 package/x11r7/xlib_libXres/Config.in
 delete mode 100644 package/x11r7/xlib_libXres/xlib_libXres.mk
 delete mode 100644 package/x11r7/xlib_libXt/Config.in
 delete mode 100644 package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
 delete mode 100644 package/x11r7/xlib_libXt/xlib_libXt.mk
 delete mode 100644 package/x11r7/xlib_libXtst/Config.in
 delete mode 100644 package/x11r7/xlib_libXtst/xlib_libXtst.mk
 delete mode 100644 package/x11r7/xlib_libXv/Config.in
 delete mode 100644 package/x11r7/xlib_libXv/xlib_libXv.mk
 delete mode 100644 package/x11r7/xlib_libXvMC/Config.in
 delete mode 100644 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
 delete mode 100644 package/x11r7/xlib_libXxf86dga/Config.in
 delete mode 100644 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
 delete mode 100644 package/x11r7/xlib_libXxf86vm/Config.in
 delete mode 100644 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
 delete mode 100644 package/x11r7/xlib_libdmx/Config.in
 delete mode 100644 package/x11r7/xlib_libdmx/xlib_libdmx.mk
 delete mode 100644 package/x11r7/xlib_libfontenc/Config.in
 delete mode 100644 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
 delete mode 100644 package/x11r7/xlib_liboldX/Config.in
 delete mode 100644 package/x11r7/xlib_liboldX/xlib_liboldX.mk
 delete mode 100644 package/x11r7/xlib_libpciaccess/Config.in
 delete mode 100644 package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
 delete mode 100644 package/x11r7/xlib_libxkbfile/Config.in
 delete mode 100644 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
 delete mode 100644 package/x11r7/xlib_libxkbui/Config.in
 delete mode 100644 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
 delete mode 100644 package/x11r7/xlib_xtrans/Config.in
 delete mode 100644 package/x11r7/xlib_xtrans/xlib_xtrans.mk
 delete mode 100644 package/x11r7/xproto_applewmproto/Config.in
 delete mode 100644 package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
 delete mode 100644 package/x11r7/xproto_bigreqsproto/Config.in
 delete mode 100644 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
 delete mode 100644 package/x11r7/xproto_compositeproto/Config.in
 delete mode 100644 package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
 delete mode 100644 package/x11r7/xproto_damageproto/Config.in
 delete mode 100644 package/x11r7/xproto_damageproto/xproto_damageproto.mk
 delete mode 100644 package/x11r7/xproto_dmxproto/Config.in
 delete mode 100644 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
 delete mode 100644 package/x11r7/xproto_dri2proto/Config.in
 delete mode 100644 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
 delete mode 100644 package/x11r7/xproto_fixesproto/Config.in
 delete mode 100644 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
 delete mode 100644 package/x11r7/xproto_fontcacheproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
 delete mode 100644 package/x11r7/xproto_fontsproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
 delete mode 100644 package/x11r7/xproto_glproto/Config.in
 delete mode 100644 package/x11r7/xproto_glproto/xproto_glproto.mk
 delete mode 100644 package/x11r7/xproto_inputproto/Config.in
 delete mode 100644 package/x11r7/xproto_inputproto/xproto_inputproto.mk
 delete mode 100644 package/x11r7/xproto_kbproto/Config.in
 delete mode 100644 package/x11r7/xproto_kbproto/xproto_kbproto.mk
 delete mode 100644 package/x11r7/xproto_printproto/Config.in
 delete mode 100644 package/x11r7/xproto_printproto/xproto_printproto.mk
 delete mode 100644 package/x11r7/xproto_randrproto/Config.in
 delete mode 100644 package/x11r7/xproto_randrproto/xproto_randrproto.mk
 delete mode 100644 package/x11r7/xproto_recordproto/Config.in
 delete mode 100644 package/x11r7/xproto_recordproto/xproto_recordproto.mk
 delete mode 100644 package/x11r7/xproto_renderproto/Config.in
 delete mode 100644 package/x11r7/xproto_renderproto/xproto_renderproto.mk
 delete mode 100644 package/x11r7/xproto_resourceproto/Config.in
 delete mode 100644 package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/Config.in
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
 delete mode 100644 package/x11r7/xproto_videoproto/Config.in
 delete mode 100644 package/x11r7/xproto_videoproto/xproto_videoproto.mk
 delete mode 100644 package/x11r7/xproto_windowswmproto/Config.in
 delete mode 100644 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
 delete mode 100644 package/x11r7/xproto_xcmiscproto/Config.in
 delete mode 100644 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
 delete mode 100644 package/x11r7/xproto_xextproto/Config.in
 delete mode 100644 package/x11r7/xproto_xextproto/xproto_xextproto.mk
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
 delete mode 100644 package/x11r7/xproto_xf86driproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
 delete mode 100644 package/x11r7/xproto_xf86rushproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
 delete mode 100644 package/x11r7/xproto_xineramaproto/Config.in
 delete mode 100644 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
 delete mode 100644 package/x11r7/xproto_xproto/Config.in
 delete mode 100644 package/x11r7/xproto_xproto/xproto_xproto.mk
 delete mode 100644 package/x11r7/xutil_makedepend/Config.in
 delete mode 100644 package/x11r7/xutil_makedepend/xutil_makedepend.mk
 delete mode 100644 package/x11r7/xutil_util-macros/Config.in
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index c0c0043..1a37b0f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -33,276 +33,276 @@ menu "X11R7 Servers"
 	source package/x11r7/xserver_xorg-server/Config.in
 endmenu
 	menu "X11R7 Libraries"
-		source package/x11r7/libxcb/Config.in
-		source package/x11r7/mesa3d/Config.in
-		source package/x11r7/pthread-stubs/Config.in
-		source package/x11r7/xcb-util/Config.in
-		source package/x11r7/xlib_libFS/Config.in
-		source package/x11r7/xlib_libICE/Config.in
-		source package/x11r7/xlib_libSM/Config.in
-		source package/x11r7/xlib_libX11/Config.in
-		source package/x11r7/xlib_libXScrnSaver/Config.in
-		source package/x11r7/xlib_libXau/Config.in
-		source package/x11r7/xlib_libXaw/Config.in
-		source package/x11r7/xlib_libXcomposite/Config.in
-		source package/x11r7/xlib_libXcursor/Config.in
-		source package/x11r7/xlib_libXdamage/Config.in
-		source package/x11r7/xlib_libXdmcp/Config.in
-		source package/x11r7/xlib_libXext/Config.in
-		source package/x11r7/xlib_libXfixes/Config.in
-		source package/x11r7/xlib_libXfont/Config.in
-		source package/x11r7/xlib_libXfontcache/Config.in
-		source package/x11r7/xlib_libXft/Config.in
-		source package/x11r7/xlib_libXi/Config.in
-		source package/x11r7/xlib_libXinerama/Config.in
-		source package/x11r7/xlib_libXmu/Config.in
-		source package/x11r7/xlib_libXp/Config.in
-		source package/x11r7/xlib_libXpm/Config.in
-		source package/x11r7/xlib_libXprintAppUtil/Config.in
-		source package/x11r7/xlib_libXprintUtil/Config.in
-		source package/x11r7/xlib_libXrandr/Config.in
-		source package/x11r7/xlib_libXrender/Config.in
-		source package/x11r7/xlib_libXres/Config.in
-		source package/x11r7/xlib_libXt/Config.in
-		source package/x11r7/xlib_libXtst/Config.in
-		source package/x11r7/xlib_libXv/Config.in
-		source package/x11r7/xlib_libXvMC/Config.in
-		source package/x11r7/xlib_libXxf86dga/Config.in
-		source package/x11r7/xlib_libXxf86vm/Config.in
-		source package/x11r7/xlib_libdmx/Config.in
-		source package/x11r7/xlib_libfontenc/Config.in
-		source package/x11r7/xlib_liboldX/Config.in
-		source package/x11r7/xlib_libxkbfile/Config.in
-		source package/x11r7/xlib_libxkbui/Config.in
-		source package/x11r7/xlib_xtrans/Config.in
-		source package/x11r7/xlib_libpciaccess/Config.in
+		source package/x11r7/libraries/libxcb/Config.in
+		source package/x11r7/libraries/mesa3d/Config.in
+		source package/x11r7/libraries/pthread-stubs/Config.in
+		source package/x11r7/libraries/xcb-util/Config.in
+		source package/x11r7/libraries/xlib_libFS/Config.in
+		source package/x11r7/libraries/xlib_libICE/Config.in
+		source package/x11r7/libraries/xlib_libSM/Config.in
+		source package/x11r7/libraries/xlib_libX11/Config.in
+		source package/x11r7/libraries/xlib_libXScrnSaver/Config.in
+		source package/x11r7/libraries/xlib_libXau/Config.in
+		source package/x11r7/libraries/xlib_libXaw/Config.in
+		source package/x11r7/libraries/xlib_libXcomposite/Config.in
+		source package/x11r7/libraries/xlib_libXcursor/Config.in
+		source package/x11r7/libraries/xlib_libXdamage/Config.in
+		source package/x11r7/libraries/xlib_libXdmcp/Config.in
+		source package/x11r7/libraries/xlib_libXext/Config.in
+		source package/x11r7/libraries/xlib_libXfixes/Config.in
+		source package/x11r7/libraries/xlib_libXfont/Config.in
+		source package/x11r7/libraries/xlib_libXfontcache/Config.in
+		source package/x11r7/libraries/xlib_libXft/Config.in
+		source package/x11r7/libraries/xlib_libXi/Config.in
+		source package/x11r7/libraries/xlib_libXinerama/Config.in
+		source package/x11r7/libraries/xlib_libXmu/Config.in
+		source package/x11r7/libraries/xlib_libXp/Config.in
+		source package/x11r7/libraries/xlib_libXpm/Config.in
+		source package/x11r7/libraries/xlib_libXprintAppUtil/Config.in
+		source package/x11r7/libraries/xlib_libXprintUtil/Config.in
+		source package/x11r7/libraries/xlib_libXrandr/Config.in
+		source package/x11r7/libraries/xlib_libXrender/Config.in
+		source package/x11r7/libraries/xlib_libXres/Config.in
+		source package/x11r7/libraries/xlib_libXt/Config.in
+		source package/x11r7/libraries/xlib_libXtst/Config.in
+		source package/x11r7/libraries/xlib_libXv/Config.in
+		source package/x11r7/libraries/xlib_libXvMC/Config.in
+		source package/x11r7/libraries/xlib_libXxf86dga/Config.in
+		source package/x11r7/libraries/xlib_libXxf86vm/Config.in
+		source package/x11r7/libraries/xlib_libdmx/Config.in
+		source package/x11r7/libraries/xlib_libfontenc/Config.in
+		source package/x11r7/libraries/xlib_liboldX/Config.in
+		source package/x11r7/libraries/xlib_libxkbfile/Config.in
+		source package/x11r7/libraries/xlib_libxkbui/Config.in
+		source package/x11r7/libraries/xlib_xtrans/Config.in
+		source package/x11r7/libraries/xlib_libpciaccess/Config.in
 	endmenu
 	menu "X11R7 Applications"
-		source package/x11r7/xapp_appres/Config.in
-		source package/x11r7/xapp_bdftopcf/Config.in
-		source package/x11r7/xapp_beforelight/Config.in
-		source package/x11r7/xapp_bitmap/Config.in
-		source package/x11r7/xapp_editres/Config.in
-		source package/x11r7/xapp_fonttosfnt/Config.in
-		source package/x11r7/xapp_fslsfonts/Config.in
-		source package/x11r7/xapp_fstobdf/Config.in
-		source package/x11r7/xapp_iceauth/Config.in
-		source package/x11r7/xapp_ico/Config.in
-		source package/x11r7/xapp_listres/Config.in
-		source package/x11r7/xapp_luit/Config.in
-		source package/x11r7/xapp_mkfontdir/Config.in
-		source package/x11r7/xapp_mkfontscale/Config.in
-		source package/x11r7/xapp_oclock/Config.in
-		source package/x11r7/xapp_rgb/Config.in
-		source package/x11r7/xapp_rstart/Config.in
-		source package/x11r7/xapp_scripts/Config.in
-		source package/x11r7/xapp_sessreg/Config.in
-		source package/x11r7/xapp_setxkbmap/Config.in
-		source package/x11r7/xapp_showfont/Config.in
-		source package/x11r7/xapp_smproxy/Config.in
-		source package/x11r7/xapp_twm/Config.in
-		source package/x11r7/xapp_viewres/Config.in
-		source package/x11r7/xapp_x11perf/Config.in
-		source package/x11r7/xapp_xauth/Config.in
-		source package/x11r7/xapp_xbacklight/Config.in
-		source package/x11r7/xapp_xbiff/Config.in
-		source package/x11r7/xapp_xcalc/Config.in
-		source package/x11r7/xapp_xclipboard/Config.in
-		source package/x11r7/xapp_xclock/Config.in
-		source package/x11r7/xapp_xcmsdb/Config.in
-		source package/x11r7/xapp_xcursorgen/Config.in
-		source package/x11r7/xapp_xdbedizzy/Config.in
-		source package/x11r7/xapp_xditview/Config.in
-		source package/x11r7/xapp_xdm/Config.in
-		source package/x11r7/xapp_xdpyinfo/Config.in
-		source package/x11r7/xapp_xdriinfo/Config.in
-		source package/x11r7/xapp_xedit/Config.in
-		source package/x11r7/xapp_xev/Config.in
-		source package/x11r7/xapp_xeyes/Config.in
-		source package/x11r7/xapp_xf86dga/Config.in
-		source package/x11r7/xapp_xfd/Config.in
-		source package/x11r7/xapp_xfontsel/Config.in
-		source package/x11r7/xapp_xfs/Config.in
-		source package/x11r7/xapp_xfsinfo/Config.in
-		source package/x11r7/xapp_xgamma/Config.in
-		source package/x11r7/xapp_xgc/Config.in
-		source package/x11r7/xapp_xhost/Config.in
-		source package/x11r7/xapp_xinit/Config.in
-		source package/x11r7/xapp_xinput/Config.in
-		source package/x11r7/xapp_xkbcomp/Config.in
-		source package/x11r7/xapp_xkbevd/Config.in
-		source package/x11r7/xapp_xkbprint/Config.in
-		source package/x11r7/xapp_xkbutils/Config.in
-		source package/x11r7/xapp_xkill/Config.in
-		source package/x11r7/xapp_xload/Config.in
-		source package/x11r7/xapp_xlogo/Config.in
-		source package/x11r7/xapp_xlsatoms/Config.in
-		source package/x11r7/xapp_xlsclients/Config.in
-		source package/x11r7/xapp_xlsfonts/Config.in
-		source package/x11r7/xapp_xmag/Config.in
-		source package/x11r7/xapp_xman/Config.in
-		source package/x11r7/xapp_xmessage/Config.in
-		source package/x11r7/xapp_xmh/Config.in
-		source package/x11r7/xapp_xmodmap/Config.in
-		source package/x11r7/xapp_xmore/Config.in
-		source package/x11r7/xapp_xplsprinters/Config.in
-		source package/x11r7/xapp_xpr/Config.in
-		source package/x11r7/xapp_xprehashprinterlist/Config.in
-		source package/x11r7/xapp_xprop/Config.in
-		source package/x11r7/xapp_xrandr/Config.in
-		source package/x11r7/xapp_xrdb/Config.in
-		source package/x11r7/xapp_xrefresh/Config.in
-		source package/x11r7/xapp_xset/Config.in
-		source package/x11r7/xapp_xsetmode/Config.in
-		source package/x11r7/xapp_xsetpointer/Config.in
-		source package/x11r7/xapp_xsetroot/Config.in
-		source package/x11r7/xapp_xsm/Config.in
-		source package/x11r7/xapp_xstdcmap/Config.in
-		source package/x11r7/xapp_xvidtune/Config.in
-		source package/x11r7/xapp_xvinfo/Config.in
-		source package/x11r7/xapp_xwd/Config.in
-		source package/x11r7/xapp_xwininfo/Config.in
-		source package/x11r7/xapp_xwud/Config.in
+		source package/x11r7/applications/xapp_appres/Config.in
+		source package/x11r7/applications/xapp_bdftopcf/Config.in
+		source package/x11r7/applications/xapp_beforelight/Config.in
+		source package/x11r7/applications/xapp_bitmap/Config.in
+		source package/x11r7/applications/xapp_editres/Config.in
+		source package/x11r7/applications/xapp_fonttosfnt/Config.in
+		source package/x11r7/applications/xapp_fslsfonts/Config.in
+		source package/x11r7/applications/xapp_fstobdf/Config.in
+		source package/x11r7/applications/xapp_iceauth/Config.in
+		source package/x11r7/applications/xapp_ico/Config.in
+		source package/x11r7/applications/xapp_listres/Config.in
+		source package/x11r7/applications/xapp_luit/Config.in
+		source package/x11r7/applications/xapp_mkfontdir/Config.in
+		source package/x11r7/applications/xapp_mkfontscale/Config.in
+		source package/x11r7/applications/xapp_oclock/Config.in
+		source package/x11r7/applications/xapp_rgb/Config.in
+		source package/x11r7/applications/xapp_rstart/Config.in
+		source package/x11r7/applications/xapp_scripts/Config.in
+		source package/x11r7/applications/xapp_sessreg/Config.in
+		source package/x11r7/applications/xapp_setxkbmap/Config.in
+		source package/x11r7/applications/xapp_showfont/Config.in
+		source package/x11r7/applications/xapp_smproxy/Config.in
+		source package/x11r7/applications/xapp_twm/Config.in
+		source package/x11r7/applications/xapp_viewres/Config.in
+		source package/x11r7/applications/xapp_x11perf/Config.in
+		source package/x11r7/applications/xapp_xauth/Config.in
+		source package/x11r7/applications/xapp_xbacklight/Config.in
+		source package/x11r7/applications/xapp_xbiff/Config.in
+		source package/x11r7/applications/xapp_xcalc/Config.in
+		source package/x11r7/applications/xapp_xclipboard/Config.in
+		source package/x11r7/applications/xapp_xclock/Config.in
+		source package/x11r7/applications/xapp_xcmsdb/Config.in
+		source package/x11r7/applications/xapp_xcursorgen/Config.in
+		source package/x11r7/applications/xapp_xdbedizzy/Config.in
+		source package/x11r7/applications/xapp_xditview/Config.in
+		source package/x11r7/applications/xapp_xdm/Config.in
+		source package/x11r7/applications/xapp_xdpyinfo/Config.in
+		source package/x11r7/applications/xapp_xdriinfo/Config.in
+		source package/x11r7/applications/xapp_xedit/Config.in
+		source package/x11r7/applications/xapp_xev/Config.in
+		source package/x11r7/applications/xapp_xeyes/Config.in
+		source package/x11r7/applications/xapp_xf86dga/Config.in
+		source package/x11r7/applications/xapp_xfd/Config.in
+		source package/x11r7/applications/xapp_xfontsel/Config.in
+		source package/x11r7/applications/xapp_xfs/Config.in
+		source package/x11r7/applications/xapp_xfsinfo/Config.in
+		source package/x11r7/applications/xapp_xgamma/Config.in
+		source package/x11r7/applications/xapp_xgc/Config.in
+		source package/x11r7/applications/xapp_xhost/Config.in
+		source package/x11r7/applications/xapp_xinit/Config.in
+		source package/x11r7/applications/xapp_xinput/Config.in
+		source package/x11r7/applications/xapp_xkbcomp/Config.in
+		source package/x11r7/applications/xapp_xkbevd/Config.in
+		source package/x11r7/applications/xapp_xkbprint/Config.in
+		source package/x11r7/applications/xapp_xkbutils/Config.in
+		source package/x11r7/applications/xapp_xkill/Config.in
+		source package/x11r7/applications/xapp_xload/Config.in
+		source package/x11r7/applications/xapp_xlogo/Config.in
+		source package/x11r7/applications/xapp_xlsatoms/Config.in
+		source package/x11r7/applications/xapp_xlsclients/Config.in
+		source package/x11r7/applications/xapp_xlsfonts/Config.in
+		source package/x11r7/applications/xapp_xmag/Config.in
+		source package/x11r7/applications/xapp_xman/Config.in
+		source package/x11r7/applications/xapp_xmessage/Config.in
+		source package/x11r7/applications/xapp_xmh/Config.in
+		source package/x11r7/applications/xapp_xmodmap/Config.in
+		source package/x11r7/applications/xapp_xmore/Config.in
+		source package/x11r7/applications/xapp_xplsprinters/Config.in
+		source package/x11r7/applications/xapp_xpr/Config.in
+		source package/x11r7/applications/xapp_xprehashprinterlist/Config.in
+		source package/x11r7/applications/xapp_xprop/Config.in
+		source package/x11r7/applications/xapp_xrandr/Config.in
+		source package/x11r7/applications/xapp_xrdb/Config.in
+		source package/x11r7/applications/xapp_xrefresh/Config.in
+		source package/x11r7/applications/xapp_xset/Config.in
+		source package/x11r7/applications/xapp_xsetmode/Config.in
+		source package/x11r7/applications/xapp_xsetpointer/Config.in
+		source package/x11r7/applications/xapp_xsetroot/Config.in
+		source package/x11r7/applications/xapp_xsm/Config.in
+		source package/x11r7/applications/xapp_xstdcmap/Config.in
+		source package/x11r7/applications/xapp_xvidtune/Config.in
+		source package/x11r7/applications/xapp_xvinfo/Config.in
+		source package/x11r7/applications/xapp_xwd/Config.in
+		source package/x11r7/applications/xapp_xwininfo/Config.in
+		source package/x11r7/applications/xapp_xwud/Config.in
 	endmenu
 	if BR2_PACKAGE_XSERVER_xorg
 	menu "X11R7 Drivers"
-		source package/x11r7/xdriver_xf86-input-acecad/Config.in
-		source package/x11r7/xdriver_xf86-input-aiptek/Config.in
-		source package/x11r7/xdriver_xf86-input-evdev/Config.in
-		source package/x11r7/xdriver_xf86-input-joystick/Config.in
-		source package/x11r7/xdriver_xf86-input-keyboard/Config.in
-		source package/x11r7/xdriver_xf86-input-mouse/Config.in
-		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
-		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
-		source package/x11r7/xdriver_xf86-input-void/Config.in
-		source package/x11r7/xdriver_xf86-video-apm/Config.in
-		source package/x11r7/xdriver_xf86-video-ark/Config.in
-		source package/x11r7/xdriver_xf86-video-ast/Config.in
-		source package/x11r7/xdriver_xf86-video-ati/Config.in
-		source package/x11r7/xdriver_xf86-video-chips/Config.in
-		source package/x11r7/xdriver_xf86-video-cirrus/Config.in
-		source package/x11r7/xdriver_xf86-video-dummy/Config.in
-		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
-		source package/x11r7/xdriver_xf86-video-geode/Config.in
-		source package/x11r7/xdriver_xf86-video-glide/Config.in
-		source package/x11r7/xdriver_xf86-video-glint/Config.in
-		source package/x11r7/xdriver_xf86-video-i128/Config.in
-		source package/x11r7/xdriver_xf86-video-i740/Config.in
-		source package/x11r7/xdriver_xf86-video-intel/Config.in
-		source package/x11r7/xdriver_xf86-video-mach64/Config.in
-		source package/x11r7/xdriver_xf86-video-mga/Config.in
-		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
-		source package/x11r7/xdriver_xf86-video-newport/Config.in
-		source package/x11r7/xdriver_xf86-video-nv/Config.in
-		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
-		source package/x11r7/xdriver_xf86-video-r128/Config.in
-		source package/x11r7/xdriver_xf86-video-rendition/Config.in
-		source package/x11r7/xdriver_xf86-video-s3/Config.in
-		source package/x11r7/xdriver_xf86-video-s3virge/Config.in
-		source package/x11r7/xdriver_xf86-video-savage/Config.in
-		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
-		source package/x11r7/xdriver_xf86-video-sis/Config.in
-		source package/x11r7/xdriver_xf86-video-sisusb/Config.in
-		source package/x11r7/xdriver_xf86-video-suncg14/Config.in
-		source package/x11r7/xdriver_xf86-video-suncg3/Config.in
-		source package/x11r7/xdriver_xf86-video-suncg6/Config.in
-		source package/x11r7/xdriver_xf86-video-sunffb/Config.in
-		source package/x11r7/xdriver_xf86-video-sunleo/Config.in
-		source package/x11r7/xdriver_xf86-video-suntcx/Config.in
-		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
-		source package/x11r7/xdriver_xf86-video-tga/Config.in
-		source package/x11r7/xdriver_xf86-video-trident/Config.in
-		source package/x11r7/xdriver_xf86-video-tseng/Config.in
-		source package/x11r7/xdriver_xf86-video-v4l/Config.in
-		source package/x11r7/xdriver_xf86-video-vesa/Config.in
-		source package/x11r7/xdriver_xf86-video-vmware/Config.in
-		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
-		source package/x11r7/xdriver_xf86-video-wsfb/Config.in
-		source package/x11r7/xdriver_xf86-video-xgi/Config.in
-		source package/x11r7/xdriver_xf86-video-xgixp/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-acecad/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-aiptek/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-evdev/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-joystick/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-keyboard/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-mouse/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-synaptics/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-vmmouse/Config.in
+		source package/x11r7/drivers/xdriver_xf86-input-void/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-apm/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-ark/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-ast/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-ati/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-chips/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-cirrus/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-dummy/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-fbdev/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-geode/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-glide/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-glint/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-i128/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-i740/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-intel/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-mach64/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-mga/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-neomagic/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-newport/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-nv/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-openchrome/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-r128/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-rendition/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-s3/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-s3virge/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-savage/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-siliconmotion/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-sis/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-sisusb/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-suncg14/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-suncg3/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-suncg6/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-sunffb/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-sunleo/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-suntcx/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-tdfx/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-tga/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-trident/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-tseng/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-v4l/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-vesa/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-vmware/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-voodoo/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-wsfb/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-xgi/Config.in
+		source package/x11r7/drivers/xdriver_xf86-video-xgixp/Config.in
 	endmenu
 	endif
 	menu "X11R7 Fonts"
-		source package/x11r7/xfont_font-util/Config.in
-		source package/x11r7/xfont_encodings/Config.in
-		source package/x11r7/xfont_font-adobe-100dpi/Config.in
-		source package/x11r7/xfont_font-adobe-75dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-type1/Config.in
-		source package/x11r7/xfont_font-alias/Config.in
-		source package/x11r7/xfont_font-arabic-misc/Config.in
-		source package/x11r7/xfont_font-bh-100dpi/Config.in
-		source package/x11r7/xfont_font-bh-75dpi/Config.in
-		source package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
-		source package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
-		source package/x11r7/xfont_font-bh-ttf/Config.in
-		source package/x11r7/xfont_font-bh-type1/Config.in
-		source package/x11r7/xfont_font-bitstream-100dpi/Config.in
-		source package/x11r7/xfont_font-bitstream-75dpi/Config.in
-		source package/x11r7/xfont_font-bitstream-speedo/Config.in
-		source package/x11r7/xfont_font-bitstream-type1/Config.in
-		source package/x11r7/xfont_font-cronyx-cyrillic/Config.in
-		source package/x11r7/xfont_font-cursor-misc/Config.in
-		source package/x11r7/xfont_font-daewoo-misc/Config.in
-		source package/x11r7/xfont_font-dec-misc/Config.in
-		source package/x11r7/xfont_font-ibm-type1/Config.in
-		source package/x11r7/xfont_font-isas-misc/Config.in
-		source package/x11r7/xfont_font-jis-misc/Config.in
-		source package/x11r7/xfont_font-micro-misc/Config.in
-		source package/x11r7/xfont_font-misc-cyrillic/Config.in
-		source package/x11r7/xfont_font-misc-ethiopic/Config.in
-		source package/x11r7/xfont_font-misc-meltho/Config.in
-		source package/x11r7/xfont_font-misc-misc/Config.in
-		source package/x11r7/xfont_font-mutt-misc/Config.in
-		source package/x11r7/xfont_font-schumacher-misc/Config.in
-		source package/x11r7/xfont_font-screen-cyrillic/Config.in
-		source package/x11r7/xfont_font-sony-misc/Config.in
-		source package/x11r7/xfont_font-sun-misc/Config.in
-		source package/x11r7/xfont_font-winitzki-cyrillic/Config.in
-		source package/x11r7/xfont_font-xfree86-type1/Config.in
+		source package/x11r7/fonts/xfont_font-util/Config.in
+		source package/x11r7/fonts/xfont_encodings/Config.in
+		source package/x11r7/fonts/xfont_font-adobe-100dpi/Config.in
+		source package/x11r7/fonts/xfont_font-adobe-75dpi/Config.in
+		source package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/Config.in
+		source package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/Config.in
+		source package/x11r7/fonts/xfont_font-adobe-utopia-type1/Config.in
+		source package/x11r7/fonts/xfont_font-alias/Config.in
+		source package/x11r7/fonts/xfont_font-arabic-misc/Config.in
+		source package/x11r7/fonts/xfont_font-bh-100dpi/Config.in
+		source package/x11r7/fonts/xfont_font-bh-75dpi/Config.in
+		source package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/Config.in
+		source package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/Config.in
+		source package/x11r7/fonts/xfont_font-bh-ttf/Config.in
+		source package/x11r7/fonts/xfont_font-bh-type1/Config.in
+		source package/x11r7/fonts/xfont_font-bitstream-100dpi/Config.in
+		source package/x11r7/fonts/xfont_font-bitstream-75dpi/Config.in
+		source package/x11r7/fonts/xfont_font-bitstream-speedo/Config.in
+		source package/x11r7/fonts/xfont_font-bitstream-type1/Config.in
+		source package/x11r7/fonts/xfont_font-cronyx-cyrillic/Config.in
+		source package/x11r7/fonts/xfont_font-cursor-misc/Config.in
+		source package/x11r7/fonts/xfont_font-daewoo-misc/Config.in
+		source package/x11r7/fonts/xfont_font-dec-misc/Config.in
+		source package/x11r7/fonts/xfont_font-ibm-type1/Config.in
+		source package/x11r7/fonts/xfont_font-isas-misc/Config.in
+		source package/x11r7/fonts/xfont_font-jis-misc/Config.in
+		source package/x11r7/fonts/xfont_font-micro-misc/Config.in
+		source package/x11r7/fonts/xfont_font-misc-cyrillic/Config.in
+		source package/x11r7/fonts/xfont_font-misc-ethiopic/Config.in
+		source package/x11r7/fonts/xfont_font-misc-meltho/Config.in
+		source package/x11r7/fonts/xfont_font-misc-misc/Config.in
+		source package/x11r7/fonts/xfont_font-mutt-misc/Config.in
+		source package/x11r7/fonts/xfont_font-schumacher-misc/Config.in
+		source package/x11r7/fonts/xfont_font-screen-cyrillic/Config.in
+		source package/x11r7/fonts/xfont_font-sony-misc/Config.in
+		source package/x11r7/fonts/xfont_font-sun-misc/Config.in
+		source package/x11r7/fonts/xfont_font-winitzki-cyrillic/Config.in
+		source package/x11r7/fonts/xfont_font-xfree86-type1/Config.in
 	endmenu
 	menu "X11R7 X protocols"
-		source package/x11r7/xcb-proto/Config.in
-		source package/x11r7/xproto_applewmproto/Config.in
-		source package/x11r7/xproto_bigreqsproto/Config.in
-		source package/x11r7/xproto_compositeproto/Config.in
-		source package/x11r7/xproto_damageproto/Config.in
-		source package/x11r7/xproto_dmxproto/Config.in
-		source package/x11r7/xproto_dri2proto/Config.in
-		source package/x11r7/xproto_fixesproto/Config.in
-		source package/x11r7/xproto_fontcacheproto/Config.in
-		source package/x11r7/xproto_fontsproto/Config.in
-		source package/x11r7/xproto_glproto/Config.in
-		source package/x11r7/xproto_inputproto/Config.in
-		source package/x11r7/xproto_kbproto/Config.in
-		source package/x11r7/xproto_printproto/Config.in
-		source package/x11r7/xproto_randrproto/Config.in
-		source package/x11r7/xproto_recordproto/Config.in
-		source package/x11r7/xproto_renderproto/Config.in
-		source package/x11r7/xproto_resourceproto/Config.in
-		source package/x11r7/xproto_scrnsaverproto/Config.in
-		source package/x11r7/xproto_videoproto/Config.in
-		source package/x11r7/xproto_windowswmproto/Config.in
-		source package/x11r7/xproto_xcmiscproto/Config.in
-		source package/x11r7/xproto_xextproto/Config.in
-		source package/x11r7/xproto_xf86bigfontproto/Config.in
-		source package/x11r7/xproto_xf86dgaproto/Config.in
-		source package/x11r7/xproto_xf86driproto/Config.in
-		source package/x11r7/xproto_xf86rushproto/Config.in
-		source package/x11r7/xproto_xf86vidmodeproto/Config.in
-		source package/x11r7/xproto_xineramaproto/Config.in
-		source package/x11r7/xproto_xproto/Config.in
+		source package/x11r7/protocols/xcb-proto/Config.in
+		source package/x11r7/protocols/xproto_applewmproto/Config.in
+		source package/x11r7/protocols/xproto_bigreqsproto/Config.in
+		source package/x11r7/protocols/xproto_compositeproto/Config.in
+		source package/x11r7/protocols/xproto_damageproto/Config.in
+		source package/x11r7/protocols/xproto_dmxproto/Config.in
+		source package/x11r7/protocols/xproto_dri2proto/Config.in
+		source package/x11r7/protocols/xproto_fixesproto/Config.in
+		source package/x11r7/protocols/xproto_fontcacheproto/Config.in
+		source package/x11r7/protocols/xproto_fontsproto/Config.in
+		source package/x11r7/protocols/xproto_glproto/Config.in
+		source package/x11r7/protocols/xproto_inputproto/Config.in
+		source package/x11r7/protocols/xproto_kbproto/Config.in
+		source package/x11r7/protocols/xproto_printproto/Config.in
+		source package/x11r7/protocols/xproto_randrproto/Config.in
+		source package/x11r7/protocols/xproto_recordproto/Config.in
+		source package/x11r7/protocols/xproto_renderproto/Config.in
+		source package/x11r7/protocols/xproto_resourceproto/Config.in
+		source package/x11r7/protocols/xproto_scrnsaverproto/Config.in
+		source package/x11r7/protocols/xproto_videoproto/Config.in
+		source package/x11r7/protocols/xproto_windowswmproto/Config.in
+		source package/x11r7/protocols/xproto_xcmiscproto/Config.in
+		source package/x11r7/protocols/xproto_xextproto/Config.in
+		source package/x11r7/protocols/xproto_xf86bigfontproto/Config.in
+		source package/x11r7/protocols/xproto_xf86dgaproto/Config.in
+		source package/x11r7/protocols/xproto_xf86driproto/Config.in
+		source package/x11r7/protocols/xproto_xf86rushproto/Config.in
+		source package/x11r7/protocols/xproto_xf86vidmodeproto/Config.in
+		source package/x11r7/protocols/xproto_xineramaproto/Config.in
+		source package/x11r7/protocols/xproto_xproto/Config.in
 	endmenu
 	menu "X11R7 Utilities"
-		source package/x11r7/xutil_makedepend/Config.in
-		source package/x11r7/xutil_util-macros/Config.in
-		source package/x11r7/mcookie/Config.in
+		source package/x11r7/utils/xutil_makedepend/Config.in
+		source package/x11r7/utils/xutil_util-macros/Config.in
+		source package/x11r7/utils/mcookie/Config.in
 	endmenu
 	menu "X11R7 Other data"
-		source package/x11r7/xdata_xbitmaps/Config.in
-		source package/x11r7/xdata_xcursor-themes/Config.in
-		source package/x11r7/xkeyboard-config/Config.in
+		source package/x11r7/other/xdata_xbitmaps/Config.in
+		source package/x11r7/other/xdata_xcursor-themes/Config.in
+		source package/x11r7/other/xkeyboard-config/Config.in
 	endmenu
 endif
 
diff --git a/package/x11r7/applications/xapp_appres/Config.in b/package/x11r7/applications/xapp_appres/Config.in
new file mode 100644
index 0000000..7574659
--- /dev/null
+++ b/package/x11r7/applications/xapp_appres/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_APPRES
+	bool "appres"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  list X application resource database
diff --git a/package/x11r7/applications/xapp_appres/xapp_appres.mk b/package/x11r7/applications/xapp_appres/xapp_appres.mk
new file mode 100644
index 0000000..a91a416
--- /dev/null
+++ b/package/x11r7/applications/xapp_appres/xapp_appres.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_appres -- list X application resource database
+#
+################################################################################
+
+XAPP_APPRES_VERSION = 1.0.1
+XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
+XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_bdftopcf/Config.in b/package/x11r7/applications/xapp_bdftopcf/Config.in
new file mode 100644
index 0000000..a9caffa
--- /dev/null
+++ b/package/x11r7/applications/xapp_bdftopcf/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_BDFTOPCF
+	bool "bdftopcf"
+	select BR2_PACKAGE_XLIB_LIBXFONT
+	help
+	  X.Org bdftopcf application
diff --git a/package/x11r7/applications/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/applications/xapp_bdftopcf/xapp_bdftopcf.mk
new file mode 100644
index 0000000..c2d6335
--- /dev/null
+++ b/package/x11r7/applications/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xapp_bdftopcf -- X.Org bdftopcf application
+#
+################################################################################
+
+XAPP_BDFTOPCF_VERSION = 1.0.2
+XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
+XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
+HOST_XAPP_BDFTOPCF_DEPENDENCIES = host-xlib_libXfont
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/applications/xapp_beforelight/Config.in b/package/x11r7/applications/xapp_beforelight/Config.in
new file mode 100644
index 0000000..3a11189
--- /dev/null
+++ b/package/x11r7/applications/xapp_beforelight/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_BEFORELIGHT
+	bool "beforelight"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  screen saver
diff --git a/package/x11r7/applications/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/applications/xapp_beforelight/xapp_beforelight.mk
new file mode 100644
index 0000000..d806231
--- /dev/null
+++ b/package/x11r7/applications/xapp_beforelight/xapp_beforelight.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_beforelight -- screen saver
+#
+################################################################################
+
+XAPP_BEFORELIGHT_VERSION = 1.0.2
+XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
+XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_bitmap/Config.in b/package/x11r7/applications/xapp_bitmap/Config.in
new file mode 100644
index 0000000..e5bb5e8
--- /dev/null
+++ b/package/x11r7/applications/xapp_bitmap/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_BITMAP
+	bool "bitmap"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XDATA_XBITMAPS
+	help
+	  X.Org bitmap application
diff --git a/package/x11r7/applications/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/applications/xapp_bitmap/xapp_bitmap.mk
new file mode 100644
index 0000000..5fdc260
--- /dev/null
+++ b/package/x11r7/applications/xapp_bitmap/xapp_bitmap.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_bitmap -- X.Org bitmap application
+#
+################################################################################
+
+XAPP_BITMAP_VERSION = 1.0.3
+XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
+XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_editres/Config.in b/package/x11r7/applications/xapp_editres/Config.in
new file mode 100644
index 0000000..390ec48
--- /dev/null
+++ b/package/x11r7/applications/xapp_editres/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_EDITRES
+	bool "editres"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  a dynamic resource editor for X Toolkit applications
diff --git a/package/x11r7/applications/xapp_editres/xapp_editres.mk b/package/x11r7/applications/xapp_editres/xapp_editres.mk
new file mode 100644
index 0000000..794985f
--- /dev/null
+++ b/package/x11r7/applications/xapp_editres/xapp_editres.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_editres -- a dynamic resource editor for X Toolkit applications
+#
+################################################################################
+
+XAPP_EDITRES_VERSION = 1.0.2
+XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
+XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_fonttosfnt/Config.in b/package/x11r7/applications/xapp_fonttosfnt/Config.in
new file mode 100644
index 0000000..eb35710
--- /dev/null
+++ b/package/x11r7/applications/xapp_fonttosfnt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_FONTTOSFNT
+	bool "fonttosfnt"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBFONTENC
+	help
+	  X.Org fonttosfnt application
diff --git a/package/x11r7/applications/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/applications/xapp_fonttosfnt/xapp_fonttosfnt.mk
new file mode 100644
index 0000000..b71819a
--- /dev/null
+++ b/package/x11r7/applications/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_fonttosfnt -- X.Org fonttosfnt application
+#
+################################################################################
+
+XAPP_FONTTOSFNT_VERSION = 1.0.3
+XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
+XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_fslsfonts/Config.in b/package/x11r7/applications/xapp_fslsfonts/Config.in
new file mode 100644
index 0000000..1917d61
--- /dev/null
+++ b/package/x11r7/applications/xapp_fslsfonts/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_FSLSFONTS
+	bool "fslsfonts"
+	select BR2_PACKAGE_XLIB_LIBFS
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  list fonts served by X font server
diff --git a/package/x11r7/applications/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/applications/xapp_fslsfonts/xapp_fslsfonts.mk
new file mode 100644
index 0000000..f18424e
--- /dev/null
+++ b/package/x11r7/applications/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_fslsfonts -- list fonts served by X font server
+#
+################################################################################
+
+XAPP_FSLSFONTS_VERSION = 1.0.1
+XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
+XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_fstobdf/Config.in b/package/x11r7/applications/xapp_fstobdf/Config.in
new file mode 100644
index 0000000..0a1f62b
--- /dev/null
+++ b/package/x11r7/applications/xapp_fstobdf/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_FSTOBDF
+	bool "fstobdf"
+	select BR2_PACKAGE_XLIB_LIBFS
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  generate BDF font from X font server
diff --git a/package/x11r7/applications/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/applications/xapp_fstobdf/xapp_fstobdf.mk
new file mode 100644
index 0000000..190bab8
--- /dev/null
+++ b/package/x11r7/applications/xapp_fstobdf/xapp_fstobdf.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_fstobdf -- generate BDF font from X font server
+#
+################################################################################
+
+XAPP_FSTOBDF_VERSION = 1.0.2
+XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
+XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_iceauth/Config.in b/package/x11r7/applications/xapp_iceauth/Config.in
new file mode 100644
index 0000000..ce2db98
--- /dev/null
+++ b/package/x11r7/applications/xapp_iceauth/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_ICEAUTH
+	bool "iceauth"
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  ICE authority file utility
diff --git a/package/x11r7/applications/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/applications/xapp_iceauth/xapp_iceauth.mk
new file mode 100644
index 0000000..93d55dc
--- /dev/null
+++ b/package/x11r7/applications/xapp_iceauth/xapp_iceauth.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_iceauth -- ICE authority file utility
+#
+################################################################################
+
+XAPP_ICEAUTH_VERSION = 1.0.3
+XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
+XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_ico/Config.in b/package/x11r7/applications/xapp_ico/Config.in
new file mode 100644
index 0000000..892f2be
--- /dev/null
+++ b/package/x11r7/applications/xapp_ico/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_ICO
+	bool "ico"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  animate an icosahedron or other polyhedron
diff --git a/package/x11r7/applications/xapp_ico/xapp_ico.mk b/package/x11r7/applications/xapp_ico/xapp_ico.mk
new file mode 100644
index 0000000..1dd4604
--- /dev/null
+++ b/package/x11r7/applications/xapp_ico/xapp_ico.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_ico -- animate an icosahedron or other polyhedron
+#
+################################################################################
+
+XAPP_ICO_VERSION = 1.0.2
+XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
+XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_ICO_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_listres/Config.in b/package/x11r7/applications/xapp_listres/Config.in
new file mode 100644
index 0000000..a3be6b3
--- /dev/null
+++ b/package/x11r7/applications/xapp_listres/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_LISTRES
+	bool "listres"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  list resources in widgets
diff --git a/package/x11r7/applications/xapp_listres/xapp_listres.mk b/package/x11r7/applications/xapp_listres/xapp_listres.mk
new file mode 100644
index 0000000..49224bb
--- /dev/null
+++ b/package/x11r7/applications/xapp_listres/xapp_listres.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_listres -- list resources in widgets
+#
+################################################################################
+
+XAPP_LISTRES_VERSION = 1.0.1
+XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
+XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_luit/Config.in b/package/x11r7/applications/xapp_luit/Config.in
new file mode 100644
index 0000000..aec83a0
--- /dev/null
+++ b/package/x11r7/applications/xapp_luit/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_LUIT
+	bool "luit"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBFONTENC
+	help
+	  Locale and ISO 2022 support for Unicode terminals
diff --git a/package/x11r7/applications/xapp_luit/xapp_luit.mk b/package/x11r7/applications/xapp_luit/xapp_luit.mk
new file mode 100644
index 0000000..bab8045
--- /dev/null
+++ b/package/x11r7/applications/xapp_luit/xapp_luit.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_luit -- Locale and ISO 2022 support for Unicode terminals
+#
+################################################################################
+
+XAPP_LUIT_VERSION = 1.0.4
+XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
+XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_mkfontdir/Config.in b/package/x11r7/applications/xapp_mkfontdir/Config.in
new file mode 100644
index 0000000..155772d
--- /dev/null
+++ b/package/x11r7/applications/xapp_mkfontdir/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_MKFONTDIR
+	bool "mkfontdir"
+	select BR2_PACKAGE_XAPP_MKFONTSCALE
+	help
+	  create an index of X font files in a directory
diff --git a/package/x11r7/applications/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/applications/xapp_mkfontdir/xapp_mkfontdir.mk
new file mode 100644
index 0000000..3957ba6
--- /dev/null
+++ b/package/x11r7/applications/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xapp_mkfontdir -- create an index of X font files in a directory
+#
+################################################################################
+
+XAPP_MKFONTDIR_VERSION = 1.0.5
+XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
+XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
+HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/applications/xapp_mkfontscale/Config.in b/package/x11r7/applications/xapp_mkfontscale/Config.in
new file mode 100644
index 0000000..540dd45
--- /dev/null
+++ b/package/x11r7/applications/xapp_mkfontscale/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_MKFONTSCALE
+	bool "mkfontscale"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBFONTENC
+	help
+	  create an index of scalable font files for X
diff --git a/package/x11r7/applications/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/applications/xapp_mkfontscale/xapp_mkfontscale.mk
new file mode 100644
index 0000000..a4218b0
--- /dev/null
+++ b/package/x11r7/applications/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xapp_mkfontscale -- create an index of scalable font files for X
+#
+################################################################################
+
+XAPP_MKFONTSCALE_VERSION = 1.0.7
+XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
+XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
+HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/applications/xapp_oclock/Config.in b/package/x11r7/applications/xapp_oclock/Config.in
new file mode 100644
index 0000000..00cd413
--- /dev/null
+++ b/package/x11r7/applications/xapp_oclock/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_OCLOCK
+	bool "oclock"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  round X clock
diff --git a/package/x11r7/applications/xapp_oclock/xapp_oclock.mk b/package/x11r7/applications/xapp_oclock/xapp_oclock.mk
new file mode 100644
index 0000000..1300e63
--- /dev/null
+++ b/package/x11r7/applications/xapp_oclock/xapp_oclock.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_oclock -- round X clock
+#
+################################################################################
+
+XAPP_OCLOCK_VERSION = 1.0.1
+XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
+XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_rgb/Config.in b/package/x11r7/applications/xapp_rgb/Config.in
new file mode 100644
index 0000000..038b849
--- /dev/null
+++ b/package/x11r7/applications/xapp_rgb/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_RGB
+	bool "rgb"
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  uncompile an rgb color-name database
diff --git a/package/x11r7/applications/xapp_rgb/xapp_rgb.mk b/package/x11r7/applications/xapp_rgb/xapp_rgb.mk
new file mode 100644
index 0000000..0b0d541
--- /dev/null
+++ b/package/x11r7/applications/xapp_rgb/xapp_rgb.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_rgb -- uncompile an rgb color-name database
+#
+################################################################################
+
+XAPP_RGB_VERSION = 1.0.1
+XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
+XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_RGB_DEPENDENCIES = xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_rstart/Config.in b/package/x11r7/applications/xapp_rstart/Config.in
new file mode 100644
index 0000000..1bf61b3
--- /dev/null
+++ b/package/x11r7/applications/xapp_rstart/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_RSTART
+	bool "rstart"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  X.Org rstart application
diff --git a/package/x11r7/applications/xapp_rstart/xapp_rstart.mk b/package/x11r7/applications/xapp_rstart/xapp_rstart.mk
new file mode 100644
index 0000000..cd71890
--- /dev/null
+++ b/package/x11r7/applications/xapp_rstart/xapp_rstart.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_rstart -- X.Org rstart application
+#
+################################################################################
+
+XAPP_RSTART_VERSION = 1.0.2
+XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
+XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_RSTART_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_scripts/Config.in b/package/x11r7/applications/xapp_scripts/Config.in
new file mode 100644
index 0000000..691f0e2
--- /dev/null
+++ b/package/x11r7/applications/xapp_scripts/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_SCRIPTS
+	bool "scripts"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  start an X program on a remote machine
diff --git a/package/x11r7/applications/xapp_scripts/xapp_scripts.mk b/package/x11r7/applications/xapp_scripts/xapp_scripts.mk
new file mode 100644
index 0000000..3e844b4
--- /dev/null
+++ b/package/x11r7/applications/xapp_scripts/xapp_scripts.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_scripts -- start an X program on a remote machine
+#
+################################################################################
+
+XAPP_SCRIPTS_VERSION = 1.0.1
+XAPP_SCRIPTS_SOURCE = scripts-$(XAPP_SCRIPTS_VERSION).tar.bz2
+XAPP_SCRIPTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_sessreg/Config.in b/package/x11r7/applications/xapp_sessreg/Config.in
new file mode 100644
index 0000000..0796bc1
--- /dev/null
+++ b/package/x11r7/applications/xapp_sessreg/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_SESSREG
+	bool "sessreg"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  manage utmp/wtmp entries for non-init clients
diff --git a/package/x11r7/applications/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/applications/xapp_sessreg/xapp_sessreg.mk
new file mode 100644
index 0000000..a1f3f4b
--- /dev/null
+++ b/package/x11r7/applications/xapp_sessreg/xapp_sessreg.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_sessreg -- manage utmp/wtmp entries for non-init clients
+#
+################################################################################
+
+XAPP_SESSREG_VERSION = 1.0.5
+XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
+XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_setxkbmap/Config.in b/package/x11r7/applications/xapp_setxkbmap/Config.in
new file mode 100644
index 0000000..2b1389c
--- /dev/null
+++ b/package/x11r7/applications/xapp_setxkbmap/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_SETXKBMAP
+	bool "setxkbmap"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	help
+	  Controls the keyboard layout of a running X server.
diff --git a/package/x11r7/applications/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/applications/xapp_setxkbmap/xapp_setxkbmap.mk
new file mode 100644
index 0000000..f503a47
--- /dev/null
+++ b/package/x11r7/applications/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_setxkbmap -- Controls the keyboard layout of a running X server.
+#
+################################################################################
+
+XAPP_SETXKBMAP_VERSION = 1.1.0
+XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
+XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_showfont/Config.in b/package/x11r7/applications/xapp_showfont/Config.in
new file mode 100644
index 0000000..edfab3f
--- /dev/null
+++ b/package/x11r7/applications/xapp_showfont/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_SHOWFONT
+	bool "showfont"
+	select BR2_PACKAGE_XLIB_LIBFS
+	help
+	  font dumper for X font server
diff --git a/package/x11r7/applications/xapp_showfont/xapp_showfont.mk b/package/x11r7/applications/xapp_showfont/xapp_showfont.mk
new file mode 100644
index 0000000..4c8b689
--- /dev/null
+++ b/package/x11r7/applications/xapp_showfont/xapp_showfont.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_showfont -- font dumper for X font server
+#
+################################################################################
+
+XAPP_SHOWFONT_VERSION = 1.0.1
+XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
+XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_smproxy/Config.in b/package/x11r7/applications/xapp_smproxy/Config.in
new file mode 100644
index 0000000..80ab984
--- /dev/null
+++ b/package/x11r7/applications/xapp_smproxy/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_SMPROXY
+	bool "smproxy"
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  Session Manager Proxy
diff --git a/package/x11r7/applications/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/applications/xapp_smproxy/xapp_smproxy.mk
new file mode 100644
index 0000000..3082cb1
--- /dev/null
+++ b/package/x11r7/applications/xapp_smproxy/xapp_smproxy.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_smproxy -- Session Manager Proxy
+#
+################################################################################
+
+XAPP_SMPROXY_VERSION = 1.0.3
+XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
+XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_twm/Config.in b/package/x11r7/applications/xapp_twm/Config.in
new file mode 100644
index 0000000..25bf800
--- /dev/null
+++ b/package/x11r7/applications/xapp_twm/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_TWM
+	bool "twm"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  No description available
diff --git a/package/x11r7/applications/xapp_twm/xapp_twm.mk b/package/x11r7/applications/xapp_twm/xapp_twm.mk
new file mode 100644
index 0000000..18de28f
--- /dev/null
+++ b/package/x11r7/applications/xapp_twm/xapp_twm.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_twm -- No description available
+#
+################################################################################
+
+XAPP_TWM_VERSION = 1.0.3
+XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
+XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_viewres/Config.in b/package/x11r7/applications/xapp_viewres/Config.in
new file mode 100644
index 0000000..32827c8
--- /dev/null
+++ b/package/x11r7/applications/xapp_viewres/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_VIEWRES
+	bool "viewres"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  graphical class browser for Xt
diff --git a/package/x11r7/applications/xapp_viewres/xapp_viewres.mk b/package/x11r7/applications/xapp_viewres/xapp_viewres.mk
new file mode 100644
index 0000000..69d8598
--- /dev/null
+++ b/package/x11r7/applications/xapp_viewres/xapp_viewres.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_viewres -- graphical class browser for Xt
+#
+################################################################################
+
+XAPP_VIEWRES_VERSION = 1.0.1
+XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
+XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_x11perf/Config.in b/package/x11r7/applications/xapp_x11perf/Config.in
new file mode 100644
index 0000000..0f1eca8
--- /dev/null
+++ b/package/x11r7/applications/xapp_x11perf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_X11PERF
+	bool "x11perf"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXFT
+	help
+	  summarize x11perf results
diff --git a/package/x11r7/applications/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/applications/xapp_x11perf/xapp_x11perf.mk
new file mode 100644
index 0000000..6112769
--- /dev/null
+++ b/package/x11r7/applications/xapp_x11perf/xapp_x11perf.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_x11perf -- summarize x11perf results
+#
+################################################################################
+
+XAPP_X11PERF_VERSION = 1.5.1
+XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
+XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xauth/Config.in b/package/x11r7/applications/xapp_xauth/Config.in
new file mode 100644
index 0000000..919fd50
--- /dev/null
+++ b/package/x11r7/applications/xapp_xauth/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_XAUTH
+	bool "xauth"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  X authority file utility
diff --git a/package/x11r7/applications/xapp_xauth/xapp_xauth-1.0.3-xcb.patch b/package/x11r7/applications/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
new file mode 100644
index 0000000..61c6b14
--- /dev/null
+++ b/package/x11r7/applications/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
@@ -0,0 +1,11 @@
+--- xauth-1.0.3/configure.ac.orig	2007-06-06 22:33:44.000000000 +0200
++++ xauth-1.0.3/configure.ac	2007-06-06 22:33:57.000000000 +0200
+@@ -40,7 +40,7 @@
+ AC_CHECK_HEADERS([net/errno.h])
+ 
+ # Checks for pkg-config packages
+-PKG_CHECK_MODULES(XAUTH, x11 xau xext xmuu)
++PKG_CHECK_MODULES(XAUTH, x11 xau xext xmuu xcb)
+ AC_SUBST(XAUTH_CFLAGS)
+ AC_SUBST(XAUTH_LIBS)
+ 
diff --git a/package/x11r7/applications/xapp_xauth/xapp_xauth.mk b/package/x11r7/applications/xapp_xauth/xapp_xauth.mk
new file mode 100644
index 0000000..93977f9
--- /dev/null
+++ b/package/x11r7/applications/xapp_xauth/xapp_xauth.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xauth -- X authority file utility
+#
+################################################################################
+
+XAPP_XAUTH_VERSION = 1.0.4
+XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
+XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xbacklight/Config.in b/package/x11r7/applications/xapp_xbacklight/Config.in
new file mode 100644
index 0000000..9756235
--- /dev/null
+++ b/package/x11r7/applications/xapp_xbacklight/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XBACKLIGHT
+	bool "xbacklight"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	help
+	  xbacklight
diff --git a/package/x11r7/applications/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/applications/xapp_xbacklight/xapp_xbacklight.mk
new file mode 100644
index 0000000..8be5d37
--- /dev/null
+++ b/package/x11r7/applications/xapp_xbacklight/xapp_xbacklight.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_backlight -- xbacklight
+#
+################################################################################
+
+XAPP_XBACKLIGHT_VERSION = 1.1.1
+XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
+XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xbiff/Config.in b/package/x11r7/applications/xapp_xbiff/Config.in
new file mode 100644
index 0000000..ea4b58a
--- /dev/null
+++ b/package/x11r7/applications/xapp_xbiff/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XBIFF
+	bool "xbiff"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XDATA_XBITMAPS
+	help
+	  mailbox flag for X
diff --git a/package/x11r7/applications/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/applications/xapp_xbiff/xapp_xbiff.mk
new file mode 100644
index 0000000..78adad9
--- /dev/null
+++ b/package/x11r7/applications/xapp_xbiff/xapp_xbiff.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xbiff -- mailbox flag for X
+#
+################################################################################
+
+XAPP_XBIFF_VERSION = 1.0.1
+XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
+XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xcalc/Config.in b/package/x11r7/applications/xapp_xcalc/Config.in
new file mode 100644
index 0000000..2552be0
--- /dev/null
+++ b/package/x11r7/applications/xapp_xcalc/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XCALC
+	bool "xcalc"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  scientific calculator for X
diff --git a/package/x11r7/applications/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/applications/xapp_xcalc/xapp_xcalc.mk
new file mode 100644
index 0000000..beb1313
--- /dev/null
+++ b/package/x11r7/applications/xapp_xcalc/xapp_xcalc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xapp_xcalc -- scientific calculator for X
+#
+################################################################################
+
+XAPP_XCALC_VERSION = 1.0.2
+XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
+XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
+XAPP_XCALC_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xclipboard/Config.in b/package/x11r7/applications/xapp_xclipboard/Config.in
new file mode 100644
index 0000000..941c219
--- /dev/null
+++ b/package/x11r7/applications/xapp_xclipboard/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XCLIPBOARD
+	bool "xclipboard"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  interchange between cut buffer and selection
diff --git a/package/x11r7/applications/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/applications/xapp_xclipboard/xapp_xclipboard.mk
new file mode 100644
index 0000000..28a93b9
--- /dev/null
+++ b/package/x11r7/applications/xapp_xclipboard/xapp_xclipboard.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xclipboard -- interchange between cut buffer and selection
+#
+################################################################################
+
+XAPP_XCLIPBOARD_VERSION = 1.0.1
+XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
+XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xclock/Config.in b/package/x11r7/applications/xapp_xclock/Config.in
new file mode 100644
index 0000000..083a6d1
--- /dev/null
+++ b/package/x11r7/applications/xapp_xclock/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XAPP_XCLOCK
+	bool "xclock"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	help
+	  analog / digital clock for X
diff --git a/package/x11r7/applications/xapp_xclock/xapp_xclock.mk b/package/x11r7/applications/xapp_xclock/xapp_xclock.mk
new file mode 100644
index 0000000..271b1b0
--- /dev/null
+++ b/package/x11r7/applications/xapp_xclock/xapp_xclock.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xclock -- analog / digital clock for X
+#
+################################################################################
+
+XAPP_XCLOCK_VERSION = 1.0.3
+XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
+XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xcmsdb/Config.in b/package/x11r7/applications/xapp_xcmsdb/Config.in
new file mode 100644
index 0000000..99c9cbb
--- /dev/null
+++ b/package/x11r7/applications/xapp_xcmsdb/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XCMSDB
+	bool "xcmsdb"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Device Color Characterization utility for X Color Management System
diff --git a/package/x11r7/applications/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/applications/xapp_xcmsdb/xapp_xcmsdb.mk
new file mode 100644
index 0000000..deab354
--- /dev/null
+++ b/package/x11r7/applications/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xcmsdb -- Device Color Characterization utility for X Color Management System
+#
+################################################################################
+
+XAPP_XCMSDB_VERSION = 1.0.2
+XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
+XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xcursorgen/Config.in b/package/x11r7/applications/xapp_xcursorgen/Config.in
new file mode 100644
index 0000000..c47ec28
--- /dev/null
+++ b/package/x11r7/applications/xapp_xcursorgen/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XCURSORGEN
+	bool "xcursorgen"
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	help
+	  create an X cursor file from a collection of PNG images
diff --git a/package/x11r7/applications/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/applications/xapp_xcursorgen/xapp_xcursorgen.mk
new file mode 100644
index 0000000..2634fd5
--- /dev/null
+++ b/package/x11r7/applications/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xapp_xcursorgen -- create an X cursor file from a collection of PNG images
+#
+################################################################################
+
+XAPP_XCURSORGEN_VERSION = 1.0.4
+XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
+XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
+
+HOST_XAPP_XCURSORGEN_DEPENDENCIES = host-libpng host-xlib_libX11 host-xlib_libXcursor
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/applications/xapp_xdbedizzy/Config.in b/package/x11r7/applications/xapp_xdbedizzy/Config.in
new file mode 100644
index 0000000..5cba398
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdbedizzy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XDBEDIZZY
+	bool "xdbedizzy"
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXP
+	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	help
+	  X.Org xdbedizzy application
diff --git a/package/x11r7/applications/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/applications/xapp_xdbedizzy/xapp_xdbedizzy.mk
new file mode 100644
index 0000000..8559a16
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xdbedizzy -- X.Org xdbedizzy application
+#
+################################################################################
+
+XAPP_XDBEDIZZY_VERSION = 1.0.2
+XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
+XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp xlib_libXprintUtil
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xditview/Config.in b/package/x11r7/applications/xapp_xditview/Config.in
new file mode 100644
index 0000000..22944f7
--- /dev/null
+++ b/package/x11r7/applications/xapp_xditview/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XDITVIEW
+	bool "xditview"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  display ditroff output
diff --git a/package/x11r7/applications/xapp_xditview/xapp_xditview.mk b/package/x11r7/applications/xapp_xditview/xapp_xditview.mk
new file mode 100644
index 0000000..3b1152d
--- /dev/null
+++ b/package/x11r7/applications/xapp_xditview/xapp_xditview.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xditview -- display ditroff output
+#
+################################################################################
+
+XAPP_XDITVIEW_VERSION = 1.0.1
+XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
+XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xdm/Config.in b/package/x11r7/applications/xapp_xdm/Config.in
new file mode 100644
index 0000000..b1c50d5
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdm/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XAPP_XDM
+	bool "xdm"
+	select BR2_PACKAGE_XAPP_XINIT
+	select BR2_PACKAGE_XAPP_SESSREG
+	select BR2_PACKAGE_XAPP_XRDB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXDMCP
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org xdm application
diff --git a/package/x11r7/applications/xapp_xdm/xapp_xdm.mk b/package/x11r7/applications/xapp_xdm/xapp_xdm.mk
new file mode 100644
index 0000000..4dc0d02
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdm/xapp_xdm.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xapp_xdm -- X.Org xdm application
+#
+################################################################################
+
+XAPP_XDM_VERSION = 1.1.6
+XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
+XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
+XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xdpyinfo/Config.in b/package/x11r7/applications/xapp_xdpyinfo/Config.in
new file mode 100644
index 0000000..e6ff686
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdpyinfo/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_XAPP_XDPYINFO
+	bool "xdpyinfo"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXP
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXXF86DGA
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_KBPROTO
+	select BR2_PACKAGE_XPROTO_PRINTPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	help
+	  display information utility for X
diff --git a/package/x11r7/applications/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/applications/xapp_xdpyinfo/xapp_xdpyinfo.mk
new file mode 100644
index 0000000..9cd6c97
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xdpyinfo -- display information utility for X
+#
+################################################################################
+
+XAPP_XDPYINFO_VERSION = 1.1.0
+XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
+XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xdriinfo/Config.in b/package/x11r7/applications/xapp_xdriinfo/Config.in
new file mode 100644
index 0000000..970bff5
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdriinfo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XDRIINFO
+	bool "xdriinfo"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	depends on BR2_PACKAGE_MESA3D
+	help
+	  query configuration information of DRI drivers
diff --git a/package/x11r7/applications/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/applications/xapp_xdriinfo/xapp_xdriinfo.mk
new file mode 100644
index 0000000..3e7284b
--- /dev/null
+++ b/package/x11r7/applications/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xdriinfo -- query configuration information of DRI drivers
+#
+################################################################################
+
+XAPP_XDRIINFO_VERSION = 1.0.3
+XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
+XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xedit/Config.in b/package/x11r7/applications/xapp_xedit/Config.in
new file mode 100644
index 0000000..98e230d
--- /dev/null
+++ b/package/x11r7/applications/xapp_xedit/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XEDIT
+	bool "xedit"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	help
+	  simple text editor for X
diff --git a/package/x11r7/applications/xapp_xedit/xapp_xedit.mk b/package/x11r7/applications/xapp_xedit/xapp_xedit.mk
new file mode 100644
index 0000000..fd4158e
--- /dev/null
+++ b/package/x11r7/applications/xapp_xedit/xapp_xedit.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xedit -- simple text editor for X
+#
+################################################################################
+
+XAPP_XEDIT_VERSION = 1.0.2
+XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
+XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xev/Config.in b/package/x11r7/applications/xapp_xev/Config.in
new file mode 100644
index 0000000..e2e05b3
--- /dev/null
+++ b/package/x11r7/applications/xapp_xev/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XEV
+	bool "xev"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  print contents of X events
diff --git a/package/x11r7/applications/xapp_xev/xapp_xev.mk b/package/x11r7/applications/xapp_xev/xapp_xev.mk
new file mode 100644
index 0000000..4fa50fe
--- /dev/null
+++ b/package/x11r7/applications/xapp_xev/xapp_xev.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xev -- print contents of X events
+#
+################################################################################
+
+XAPP_XEV_VERSION = 1.0.4
+XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
+XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEV_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xeyes/Config.in b/package/x11r7/applications/xapp_xeyes/Config.in
new file mode 100644
index 0000000..a7b7737
--- /dev/null
+++ b/package/x11r7/applications/xapp_xeyes/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_XEYES
+	bool "xeyes"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  X.Org xeyes application
diff --git a/package/x11r7/applications/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/applications/xapp_xeyes/xapp_xeyes.mk
new file mode 100644
index 0000000..8019aa9
--- /dev/null
+++ b/package/x11r7/applications/xapp_xeyes/xapp_xeyes.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xeyes -- X.Org xeyes application
+#
+################################################################################
+
+XAPP_XEYES_VERSION = 1.0.1
+XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
+XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xf86dga/Config.in b/package/x11r7/applications/xapp_xf86dga/Config.in
new file mode 100644
index 0000000..769ebf6
--- /dev/null
+++ b/package/x11r7/applications/xapp_xf86dga/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XF86DGA
+	bool "xf86dga"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXXF86DGA
+	help
+	  test program for the XFree86-DGA extension
diff --git a/package/x11r7/applications/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/applications/xapp_xf86dga/xapp_xf86dga.mk
new file mode 100644
index 0000000..9975916
--- /dev/null
+++ b/package/x11r7/applications/xapp_xf86dga/xapp_xf86dga.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xf86dga -- test program for the XFree86-DGA extension
+#
+################################################################################
+
+XAPP_XF86DGA_VERSION = 1.0.2
+XAPP_XF86DGA_SOURCE = xf86dga-$(XAPP_XF86DGA_VERSION).tar.bz2
+XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXxf86dga
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xfd/Config.in b/package/x11r7/applications/xapp_xfd/Config.in
new file mode 100644
index 0000000..f006b1e
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_XFD
+	bool "xfd"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXFT
+	help
+	  X.Org xfd application
diff --git a/package/x11r7/applications/xapp_xfd/xapp_xfd.mk b/package/x11r7/applications/xapp_xfd/xapp_xfd.mk
new file mode 100644
index 0000000..5717875
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfd/xapp_xfd.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xfd -- X.Org xfd application
+#
+################################################################################
+
+XAPP_XFD_VERSION = 1.0.1
+XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
+XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xfontsel/Config.in b/package/x11r7/applications/xapp_xfontsel/Config.in
new file mode 100644
index 0000000..0c6aa37
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfontsel/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XFONTSEL
+	bool "xfontsel"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  point and click selection of X11 font names
diff --git a/package/x11r7/applications/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/applications/xapp_xfontsel/xapp_xfontsel.mk
new file mode 100644
index 0000000..9556fca
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfontsel/xapp_xfontsel.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xfontsel -- point and click selection of X11 font names
+#
+################################################################################
+
+XAPP_XFONTSEL_VERSION = 1.0.1
+XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
+XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xfs/Config.in b/package/x11r7/applications/xapp_xfs/Config.in
new file mode 100644
index 0000000..e71d89f
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XFS
+	bool "xfs"
+	select BR2_PACKAGE_XLIB_LIBFS
+	select BR2_PACKAGE_XLIB_LIBXFONT
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	help
+	  X font server
diff --git a/package/x11r7/applications/xapp_xfs/xapp_xfs.mk b/package/x11r7/applications/xapp_xfs/xapp_xfs.mk
new file mode 100644
index 0000000..611b642
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfs/xapp_xfs.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xfs -- X font server
+#
+################################################################################
+
+XAPP_XFS_VERSION = 1.0.5
+XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
+XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xfsinfo/Config.in b/package/x11r7/applications/xapp_xfsinfo/Config.in
new file mode 100644
index 0000000..84c8ac1
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfsinfo/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XFSINFO
+	bool "xfsinfo"
+	select BR2_PACKAGE_XLIB_LIBFS
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  X font server information utility
diff --git a/package/x11r7/applications/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/applications/xapp_xfsinfo/xapp_xfsinfo.mk
new file mode 100644
index 0000000..bef0aed
--- /dev/null
+++ b/package/x11r7/applications/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xfsinfo -- X font server information utility
+#
+################################################################################
+
+XAPP_XFSINFO_VERSION = 1.0.1
+XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
+XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xgamma/Config.in b/package/x11r7/applications/xapp_xgamma/Config.in
new file mode 100644
index 0000000..b20a784
--- /dev/null
+++ b/package/x11r7/applications/xapp_xgamma/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XGAMMA
+	bool "xgamma"
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	help
+	  Alter a monitor's gamma correction through the X server
diff --git a/package/x11r7/applications/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/applications/xapp_xgamma/xapp_xgamma.mk
new file mode 100644
index 0000000..0993482
--- /dev/null
+++ b/package/x11r7/applications/xapp_xgamma/xapp_xgamma.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xgamma -- Alter a monitor's gamma correction through the X server
+#
+################################################################################
+
+XAPP_XGAMMA_VERSION = 1.0.3
+XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
+XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xgc/Config.in b/package/x11r7/applications/xapp_xgc/Config.in
new file mode 100644
index 0000000..98faba8
--- /dev/null
+++ b/package/x11r7/applications/xapp_xgc/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XGC
+	bool "xgc"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  X graphics demo
diff --git a/package/x11r7/applications/xapp_xgc/xapp_xgc.mk b/package/x11r7/applications/xapp_xgc/xapp_xgc.mk
new file mode 100644
index 0000000..e39d268
--- /dev/null
+++ b/package/x11r7/applications/xapp_xgc/xapp_xgc.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xgc -- X graphics demo
+#
+################################################################################
+
+XAPP_XGC_VERSION = 1.0.1
+XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
+XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XGC_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xhost/Config.in b/package/x11r7/applications/xapp_xhost/Config.in
new file mode 100644
index 0000000..659b34d
--- /dev/null
+++ b/package/x11r7/applications/xapp_xhost/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XHOST
+	bool "xhost"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  Controls host and/or user access to a running X server.
diff --git a/package/x11r7/applications/xapp_xhost/xapp_xhost.mk b/package/x11r7/applications/xapp_xhost/xapp_xhost.mk
new file mode 100644
index 0000000..7859f23
--- /dev/null
+++ b/package/x11r7/applications/xapp_xhost/xapp_xhost.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xhost -- Controls host and/or user access to a running X server.
+#
+################################################################################
+
+XAPP_XHOST_VERSION = 1.0.3
+XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
+XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xinit/Config.in b/package/x11r7/applications/xapp_xinit/Config.in
new file mode 100644
index 0000000..9ac2817
--- /dev/null
+++ b/package/x11r7/applications/xapp_xinit/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XINIT
+	bool "xinit"
+	select BR2_PACKAGE_XAPP_XAUTH
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  X Window System initializer
diff --git a/package/x11r7/applications/xapp_xinit/xapp_xinit.mk b/package/x11r7/applications/xapp_xinit/xapp_xinit.mk
new file mode 100644
index 0000000..48637f2
--- /dev/null
+++ b/package/x11r7/applications/xapp_xinit/xapp_xinit.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xinit -- X Window System initializer
+#
+################################################################################
+
+XAPP_XINIT_VERSION = 1.2.1
+XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
+XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xinput/Config.in b/package/x11r7/applications/xapp_xinput/Config.in
new file mode 100644
index 0000000..2505dd3
--- /dev/null
+++ b/package/x11r7/applications/xapp_xinput/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XINPUT
+	bool "xinput"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
+	help
+	  xinput
diff --git a/package/x11r7/applications/xapp_xinput/xapp_xinput.mk b/package/x11r7/applications/xapp_xinput/xapp_xinput.mk
new file mode 100644
index 0000000..4e6884d
--- /dev/null
+++ b/package/x11r7/applications/xapp_xinput/xapp_xinput.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xinput -- xinput
+#
+################################################################################
+
+XAPP_XINPUT_VERSION = 1.5.0
+XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
+XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xkbcomp/Config.in b/package/x11r7/applications/xapp_xkbcomp/Config.in
new file mode 100644
index 0000000..2b575b2
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbcomp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XKBCOMP
+	bool "xkbcomp"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	help
+	  compile XKB keyboard description
diff --git a/package/x11r7/applications/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/applications/xapp_xkbcomp/xapp_xkbcomp.mk
new file mode 100644
index 0000000..f37d106
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xapp_xkbcomp -- compile XKB keyboard description
+#
+################################################################################
+
+XAPP_XKBCOMP_VERSION = 1.1.1
+XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
+XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
+HOST_XAPP_XKBCOMP_DEPENDENCIES = host-xlib_libX11 host-xlib_libxkbfile
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/applications/xapp_xkbevd/Config.in b/package/x11r7/applications/xapp_xkbevd/Config.in
new file mode 100644
index 0000000..cf31565
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbevd/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XKBEVD
+	bool "xkbevd"
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	help
+	  XKB event daemon
diff --git a/package/x11r7/applications/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/applications/xapp_xkbevd/xapp_xkbevd.mk
new file mode 100644
index 0000000..e8f7a36
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbevd/xapp_xkbevd.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xkbevd -- XKB event daemon
+#
+################################################################################
+
+XAPP_XKBEVD_VERSION = 1.1.0
+XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
+XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xkbprint/Config.in b/package/x11r7/applications/xapp_xkbprint/Config.in
new file mode 100644
index 0000000..e7a4242
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbprint/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XKBPRINT
+	bool "xkbprint"
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	help
+	  print an XKB keyboard description
diff --git a/package/x11r7/applications/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/applications/xapp_xkbprint/xapp_xkbprint.mk
new file mode 100644
index 0000000..98c7560
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbprint/xapp_xkbprint.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xkbprint -- print an XKB keyboard description
+#
+################################################################################
+
+XAPP_XKBPRINT_VERSION = 1.0.1
+XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
+XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xkbutils/Config.in b/package/x11r7/applications/xapp_xkbutils/Config.in
new file mode 100644
index 0000000..22a819b
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbutils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XKBUTILS
+	bool "xkbutils"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	help
+	  X.Org xkbutils application
diff --git a/package/x11r7/applications/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/applications/xapp_xkbutils/xapp_xkbutils.mk
new file mode 100644
index 0000000..1ccbdb9
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkbutils/xapp_xkbutils.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xkbutils -- X.Org xkbutils application
+#
+################################################################################
+
+XAPP_XKBUTILS_VERSION = 1.0.2
+XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
+XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xkill/Config.in b/package/x11r7/applications/xapp_xkill/Config.in
new file mode 100644
index 0000000..fcab92a
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkill/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XKILL
+	bool "xkill"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  kill a client by its X resource
diff --git a/package/x11r7/applications/xapp_xkill/xapp_xkill.mk b/package/x11r7/applications/xapp_xkill/xapp_xkill.mk
new file mode 100644
index 0000000..16c3760
--- /dev/null
+++ b/package/x11r7/applications/xapp_xkill/xapp_xkill.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xkill -- kill a client by its X resource
+#
+################################################################################
+
+XAPP_XKILL_VERSION = 1.0.2
+XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
+XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xload/Config.in b/package/x11r7/applications/xapp_xload/Config.in
new file mode 100644
index 0000000..25c79d2
--- /dev/null
+++ b/package/x11r7/applications/xapp_xload/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XLOAD
+	bool "xload"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  system load average display for X
diff --git a/package/x11r7/applications/xapp_xload/xapp_xload.mk b/package/x11r7/applications/xapp_xload/xapp_xload.mk
new file mode 100644
index 0000000..f84c158
--- /dev/null
+++ b/package/x11r7/applications/xapp_xload/xapp_xload.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xload -- system load average display for X
+#
+################################################################################
+
+XAPP_XLOAD_VERSION = 1.0.2
+XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
+XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xlogo/Config.in b/package/x11r7/applications/xapp_xlogo/Config.in
new file mode 100644
index 0000000..04f779d
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlogo/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XAPP_XLOGO
+	bool "xlogo"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXFT
+	help
+	  X Window System logo
diff --git a/package/x11r7/applications/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/applications/xapp_xlogo/xapp_xlogo.mk
new file mode 100644
index 0000000..f79eafa
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlogo/xapp_xlogo.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xapp_xlogo -- X Window System logo
+#
+################################################################################
+
+XAPP_XLOGO_VERSION = 1.0.1
+XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
+XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
+			  xlib_libXft host-pkg-config
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xlsatoms/Config.in b/package/x11r7/applications/xapp_xlsatoms/Config.in
new file mode 100644
index 0000000..2ad8484
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlsatoms/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XLSATOMS
+	bool "xlsatoms"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  list interned atoms defined on server
diff --git a/package/x11r7/applications/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/applications/xapp_xlsatoms/xapp_xlsatoms.mk
new file mode 100644
index 0000000..887f815
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xlsatoms -- list interned atoms defined on server
+#
+################################################################################
+
+XAPP_XLSATOMS_VERSION = 1.0.2
+XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
+XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xlsclients/Config.in b/package/x11r7/applications/xapp_xlsclients/Config.in
new file mode 100644
index 0000000..f8f6132
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlsclients/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XLSCLIENTS
+	bool "xlsclients"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  X.Org xlsclients application
diff --git a/package/x11r7/applications/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/applications/xapp_xlsclients/xapp_xlsclients.mk
new file mode 100644
index 0000000..5a8563a
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlsclients/xapp_xlsclients.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xlsclients -- X.Org xlsclients application
+#
+################################################################################
+
+XAPP_XLSCLIENTS_VERSION = 1.0.2
+XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
+XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xlsfonts/Config.in b/package/x11r7/applications/xapp_xlsfonts/Config.in
new file mode 100644
index 0000000..dab61eb
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlsfonts/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XLSFONTS
+	bool "xlsfonts"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  X.Org xlsfonts application
diff --git a/package/x11r7/applications/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/applications/xapp_xlsfonts/xapp_xlsfonts.mk
new file mode 100644
index 0000000..6f997d8
--- /dev/null
+++ b/package/x11r7/applications/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xlsfonts -- X.Org xlsfonts application
+#
+################################################################################
+
+XAPP_XLSFONTS_VERSION = 1.0.1
+XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
+XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xmag/Config.in b/package/x11r7/applications/xapp_xmag/Config.in
new file mode 100644
index 0000000..44d2c8e
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmag/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XMAG
+	bool "xmag"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  X.Org xmag application
diff --git a/package/x11r7/applications/xapp_xmag/xapp_xmag.mk b/package/x11r7/applications/xapp_xmag/xapp_xmag.mk
new file mode 100644
index 0000000..caf7bf6
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmag/xapp_xmag.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xmag -- X.Org xmag application
+#
+################################################################################
+
+XAPP_XMAG_VERSION = 1.0.2
+XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
+XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAG_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xman/Config.in b/package/x11r7/applications/xapp_xman/Config.in
new file mode 100644
index 0000000..af9525b
--- /dev/null
+++ b/package/x11r7/applications/xapp_xman/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XAPP_XMAN
+	bool "xman"
+	help
+	  Manual page display program for the X Window System
diff --git a/package/x11r7/applications/xapp_xman/xapp_xman.mk b/package/x11r7/applications/xapp_xman/xapp_xman.mk
new file mode 100644
index 0000000..e3f623e
--- /dev/null
+++ b/package/x11r7/applications/xapp_xman/xapp_xman.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# xapp_xman - Manual page display program for the X Window System
+#
+#############################################################
+XAPP_XMAN_VERSION:=1.0.3
+XAPP_XMAN_SOURCE:=xman-$(XAPP_XMAN_VERSION).tar.bz2
+XAPP_XMAN_SITE:=http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAN_INSTALL_TARGET = YES
+
+XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
+		ac_cv_file__etc_man_config=no \
+		ac_cv_file__etc_manpath_config=no
+
+XAPP_XMAN_CONF_OPT = --disable-IPv6
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xmessage/Config.in b/package/x11r7/applications/xapp_xmessage/Config.in
new file mode 100644
index 0000000..e80562f
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmessage/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XMESSAGE
+	bool "xmessage"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  display a message or query in a window (X-based /bin/echo)
diff --git a/package/x11r7/applications/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/applications/xapp_xmessage/xapp_xmessage.mk
new file mode 100644
index 0000000..3f47b26
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmessage/xapp_xmessage.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xmessage -- display a message or query in a window (X-based /bin/echo)
+#
+################################################################################
+
+XAPP_XMESSAGE_VERSION = 1.0.2
+XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
+XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xmh/Config.in b/package/x11r7/applications/xapp_xmh/Config.in
new file mode 100644
index 0000000..3da965a
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmh/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XMH
+	bool "xmh"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  send and read mail with an X interface to MH
diff --git a/package/x11r7/applications/xapp_xmh/xapp_xmh.mk b/package/x11r7/applications/xapp_xmh/xapp_xmh.mk
new file mode 100644
index 0000000..280b7e7
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmh/xapp_xmh.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xmh -- send and read mail with an X interface to MH
+#
+################################################################################
+
+XAPP_XMH_VERSION = 1.0.1
+XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
+XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMH_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xmodmap/Config.in b/package/x11r7/applications/xapp_xmodmap/Config.in
new file mode 100644
index 0000000..9be79ab
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmodmap/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XMODMAP
+	bool "xmodmap"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  utility for modifying keymaps and pointer button mappings in X
diff --git a/package/x11r7/applications/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/applications/xapp_xmodmap/xapp_xmodmap.mk
new file mode 100644
index 0000000..1a6c44a
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmodmap/xapp_xmodmap.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xmodmap -- utility for modifying keymaps and pointer button mappings in X
+#
+################################################################################
+
+XAPP_XMODMAP_VERSION = 1.0.4
+XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
+XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xmore/Config.in b/package/x11r7/applications/xapp_xmore/Config.in
new file mode 100644
index 0000000..23fd147
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmore/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XMORE
+	bool "xmore"
+	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  plain text display program for the X Window System
diff --git a/package/x11r7/applications/xapp_xmore/xapp_xmore.mk b/package/x11r7/applications/xapp_xmore/xapp_xmore.mk
new file mode 100644
index 0000000..bd371ea
--- /dev/null
+++ b/package/x11r7/applications/xapp_xmore/xapp_xmore.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xmore -- plain text display program for the X Window System
+#
+################################################################################
+
+XAPP_XMORE_VERSION = 1.0.1
+XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
+XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xplsprinters/Config.in b/package/x11r7/applications/xapp_xplsprinters/Config.in
new file mode 100644
index 0000000..16a139b
--- /dev/null
+++ b/package/x11r7/applications/xapp_xplsprinters/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XPLSPRINTERS
+	bool "xplsprinters"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXP
+	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	help
+	  shows a list of Xprint printers and it's attributes
diff --git a/package/x11r7/applications/xapp_xplsprinters/xapp_xplsprinters.mk b/package/x11r7/applications/xapp_xplsprinters/xapp_xplsprinters.mk
new file mode 100644
index 0000000..08a1b4a
--- /dev/null
+++ b/package/x11r7/applications/xapp_xplsprinters/xapp_xplsprinters.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xplsprinters -- shows a list of Xprint printers and it's attributes
+#
+################################################################################
+
+XAPP_XPLSPRINTERS_VERSION = 1.0.1
+XAPP_XPLSPRINTERS_SOURCE = xplsprinters-$(XAPP_XPLSPRINTERS_VERSION).tar.bz2
+XAPP_XPLSPRINTERS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPLSPRINTERS_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xpr/Config.in b/package/x11r7/applications/xapp_xpr/Config.in
new file mode 100644
index 0000000..0710d62
--- /dev/null
+++ b/package/x11r7/applications/xapp_xpr/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XPR
+	bool "xpr"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  X.Org xpr application
diff --git a/package/x11r7/applications/xapp_xpr/xapp_xpr.mk b/package/x11r7/applications/xapp_xpr/xapp_xpr.mk
new file mode 100644
index 0000000..4ac3da4
--- /dev/null
+++ b/package/x11r7/applications/xapp_xpr/xapp_xpr.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xpr -- X.Org xpr application
+#
+################################################################################
+
+XAPP_XPR_VERSION = 1.0.3
+XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
+XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xprehashprinterlist/Config.in b/package/x11r7/applications/xapp_xprehashprinterlist/Config.in
new file mode 100644
index 0000000..056fdb6
--- /dev/null
+++ b/package/x11r7/applications/xapp_xprehashprinterlist/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST
+	bool "xprehashprinterlist"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXP
+	help
+	  Recomputes the list of available printers.
diff --git a/package/x11r7/applications/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk b/package/x11r7/applications/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
new file mode 100644
index 0000000..1bb7365
--- /dev/null
+++ b/package/x11r7/applications/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xprehashprinterlist -- Recomputes the list of available printers.
+#
+################################################################################
+
+XAPP_XPREHASHPRINTERLIST_VERSION = 1.0.1
+XAPP_XPREHASHPRINTERLIST_SOURCE = xprehashprinterlist-$(XAPP_XPREHASHPRINTERLIST_VERSION).tar.bz2
+XAPP_XPREHASHPRINTERLIST_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPREHASHPRINTERLIST_DEPENDENCIES = xlib_libX11 xlib_libXp
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xprop/Config.in b/package/x11r7/applications/xapp_xprop/Config.in
new file mode 100644
index 0000000..314e79f
--- /dev/null
+++ b/package/x11r7/applications/xapp_xprop/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XPROP
+	bool "xprop"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  property displayer for X
diff --git a/package/x11r7/applications/xapp_xprop/xapp_xprop.mk b/package/x11r7/applications/xapp_xprop/xapp_xprop.mk
new file mode 100644
index 0000000..1615ac2
--- /dev/null
+++ b/package/x11r7/applications/xapp_xprop/xapp_xprop.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xprop -- property displayer for X
+#
+################################################################################
+
+XAPP_XPROP_VERSION = 1.1.0
+XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
+XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xrandr/Config.in b/package/x11r7/applications/xapp_xrandr/Config.in
new file mode 100644
index 0000000..fe9bd4e
--- /dev/null
+++ b/package/x11r7/applications/xapp_xrandr/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XRANDR
+	bool "xrandr"
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  primitive command line interface to RandR extension
diff --git a/package/x11r7/applications/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch b/package/x11r7/applications/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
new file mode 100644
index 0000000..6dc3534
--- /dev/null
+++ b/package/x11r7/applications/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
@@ -0,0 +1,29 @@
+--- a/xrandr.c.orig	2008-02-02 17:09:45.000000000 -0500
++++ b/xrandr.c	2008-02-02 17:04:51.000000000 -0500
+@@ -189,7 +189,7 @@ reflection_name (Rotation rotation)
+ 
+ #if HAS_RANDR_1_2
+ typedef enum _policy {
+-    clone, extend
++    clone1, extend
+ } policy_t;
+ 
+ typedef enum _relation {
+@@ -1602,7 +1602,7 @@ main (int argc, char **argv)
+     int		ret = 0;
+ #if HAS_RANDR_1_2
+     output_t	*output = NULL;
+-    policy_t	policy = clone;
++    policy_t	policy = clone1;
+     Bool    	setit_1_2 = False;
+     Bool    	query_1_2 = False;
+     Bool	modeit = False;
+@@ -1863,7 +1863,7 @@ main (int argc, char **argv)
+ 	    continue;
+ 	}
+ 	if (!strcmp ("--clone", argv[i])) {
+-	    policy = clone;
++	    policy = clone1;
+ 	    setit_1_2 = True;
+ 	    continue;
+ 	}
diff --git a/package/x11r7/applications/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/applications/xapp_xrandr/xapp_xrandr.mk
new file mode 100644
index 0000000..74bf97b
--- /dev/null
+++ b/package/x11r7/applications/xapp_xrandr/xapp_xrandr.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xapp_xrandr -- primitive command line interface to RandR extension
+#
+################################################################################
+
+XAPP_XRANDR_VERSION = 1.3.2
+XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
+XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
+XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xrdb/Config.in b/package/x11r7/applications/xapp_xrdb/Config.in
new file mode 100644
index 0000000..8c07857
--- /dev/null
+++ b/package/x11r7/applications/xapp_xrdb/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XRDB
+	bool "xrdb"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  X server resource database utility
diff --git a/package/x11r7/applications/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/applications/xapp_xrdb/xapp_xrdb.mk
new file mode 100644
index 0000000..3a0cfdc
--- /dev/null
+++ b/package/x11r7/applications/xapp_xrdb/xapp_xrdb.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xrdb -- X server resource database utility
+#
+################################################################################
+
+XAPP_XRDB_VERSION = 1.0.6
+XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
+XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xrefresh/Config.in b/package/x11r7/applications/xapp_xrefresh/Config.in
new file mode 100644
index 0000000..16b1e50
--- /dev/null
+++ b/package/x11r7/applications/xapp_xrefresh/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XREFRESH
+	bool "xrefresh"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  refresh all or part of an X screen
diff --git a/package/x11r7/applications/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/applications/xapp_xrefresh/xapp_xrefresh.mk
new file mode 100644
index 0000000..ac7ed7c
--- /dev/null
+++ b/package/x11r7/applications/xapp_xrefresh/xapp_xrefresh.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xrefresh -- refresh all or part of an X screen
+#
+################################################################################
+
+XAPP_XREFRESH_VERSION = 1.0.3
+XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
+XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xset/Config.in b/package/x11r7/applications/xapp_xset/Config.in
new file mode 100644
index 0000000..ff697e5
--- /dev/null
+++ b/package/x11r7/applications/xapp_xset/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XSET
+	bool "xset"
+	select BR2_PACKAGE_XLIB_LIBXFONTCACHE
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  X.Org xset application
diff --git a/package/x11r7/applications/xapp_xset/xapp_xset.mk b/package/x11r7/applications/xapp_xset/xapp_xset.mk
new file mode 100644
index 0000000..32d6722
--- /dev/null
+++ b/package/x11r7/applications/xapp_xset/xapp_xset.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xset -- X.Org xset application
+#
+################################################################################
+
+XAPP_XSET_VERSION = 1.1.0
+XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
+XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xsetmode/Config.in b/package/x11r7/applications/xapp_xsetmode/Config.in
new file mode 100644
index 0000000..a08e02d
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsetmode/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XSETMODE
+	bool "xsetmode"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
+	help
+	  set the mode for an X Input device
diff --git a/package/x11r7/applications/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/applications/xapp_xsetmode/xapp_xsetmode.mk
new file mode 100644
index 0000000..158318d
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsetmode/xapp_xsetmode.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xsetmode -- set the mode for an X Input device
+#
+################################################################################
+
+XAPP_XSETMODE_VERSION = 1.0.0
+XAPP_XSETMODE_SOURCE = xsetmode-$(XAPP_XSETMODE_VERSION).tar.bz2
+XAPP_XSETMODE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xsetpointer/Config.in b/package/x11r7/applications/xapp_xsetpointer/Config.in
new file mode 100644
index 0000000..2b0b462
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsetpointer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XSETPOINTER
+	bool "xsetpointer"
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
+	help
+	  set an X Input device as the main pointer
diff --git a/package/x11r7/applications/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/applications/xapp_xsetpointer/xapp_xsetpointer.mk
new file mode 100644
index 0000000..1a02542
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xsetpointer -- set an X Input device as the main pointer
+#
+################################################################################
+
+XAPP_XSETPOINTER_VERSION = 1.0.0
+XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
+XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xsetroot/Config.in b/package/x11r7/applications/xapp_xsetroot/Config.in
new file mode 100644
index 0000000..82c0dba
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsetroot/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XAPP_XSETROOT
+	bool "xsetroot"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XDATA_XBITMAPS
+	help
+	  X.Org xsetroot application
diff --git a/package/x11r7/applications/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/applications/xapp_xsetroot/xapp_xsetroot.mk
new file mode 100644
index 0000000..937f3e5
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsetroot/xapp_xsetroot.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xsetroot -- X.Org xsetroot application
+#
+################################################################################
+
+XAPP_XSETROOT_VERSION = 1.0.3
+XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
+XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xsm/Config.in b/package/x11r7/applications/xapp_xsm/Config.in
new file mode 100644
index 0000000..d06dc6c
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsm/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XSM
+	bool "xsm"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	help
+	  X Session Manager
diff --git a/package/x11r7/applications/xapp_xsm/xapp_xsm.mk b/package/x11r7/applications/xapp_xsm/xapp_xsm.mk
new file mode 100644
index 0000000..c7e261f
--- /dev/null
+++ b/package/x11r7/applications/xapp_xsm/xapp_xsm.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xsm -- X Session Manager
+#
+################################################################################
+
+XAPP_XSM_VERSION = 1.0.1
+XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
+XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSM_DEPENDENCIES = xlib_libXaw
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xstdcmap/Config.in b/package/x11r7/applications/xapp_xstdcmap/Config.in
new file mode 100644
index 0000000..f15c36b
--- /dev/null
+++ b/package/x11r7/applications/xapp_xstdcmap/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XSTDCMAP
+	bool "xstdcmap"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  X standard colormap utility
diff --git a/package/x11r7/applications/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/applications/xapp_xstdcmap/xapp_xstdcmap.mk
new file mode 100644
index 0000000..e33a51e
--- /dev/null
+++ b/package/x11r7/applications/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xstdcmap -- X standard colormap utility
+#
+################################################################################
+
+XAPP_XSTDCMAP_VERSION = 1.0.1
+XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
+XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xvidtune/Config.in b/package/x11r7/applications/xapp_xvidtune/Config.in
new file mode 100644
index 0000000..b1902cd
--- /dev/null
+++ b/package/x11r7/applications/xapp_xvidtune/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XVIDTUNE
+	bool "xvidtune"
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	help
+	  video mode tuner for Xorg
diff --git a/package/x11r7/applications/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/applications/xapp_xvidtune/xapp_xvidtune.mk
new file mode 100644
index 0000000..0fd91db
--- /dev/null
+++ b/package/x11r7/applications/xapp_xvidtune/xapp_xvidtune.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xvidtune -- video mode tuner for Xorg
+#
+################################################################################
+
+XAPP_XVIDTUNE_VERSION = 1.0.1
+XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
+XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xvinfo/Config.in b/package/x11r7/applications/xapp_xvinfo/Config.in
new file mode 100644
index 0000000..2612c04
--- /dev/null
+++ b/package/x11r7/applications/xapp_xvinfo/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XVINFO
+	bool "xvinfo"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXV
+	help
+	  Print out X-Video extension adaptor information
diff --git a/package/x11r7/applications/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/applications/xapp_xvinfo/xapp_xvinfo.mk
new file mode 100644
index 0000000..fe10628
--- /dev/null
+++ b/package/x11r7/applications/xapp_xvinfo/xapp_xvinfo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xvinfo -- Print out X-Video extension adaptor information
+#
+################################################################################
+
+XAPP_XVINFO_VERSION = 1.1.0
+XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
+XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xwd/Config.in b/package/x11r7/applications/xapp_xwd/Config.in
new file mode 100644
index 0000000..b7b3172
--- /dev/null
+++ b/package/x11r7/applications/xapp_xwd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XWD
+	bool "xwd"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  dump an image of an X window
diff --git a/package/x11r7/applications/xapp_xwd/xapp_xwd.mk b/package/x11r7/applications/xapp_xwd/xapp_xwd.mk
new file mode 100644
index 0000000..95d6098
--- /dev/null
+++ b/package/x11r7/applications/xapp_xwd/xapp_xwd.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xwd -- dump an image of an X window
+#
+################################################################################
+
+XAPP_XWD_VERSION = 1.0.3
+XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
+XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xwininfo/Config.in b/package/x11r7/applications/xapp_xwininfo/Config.in
new file mode 100644
index 0000000..4e09570
--- /dev/null
+++ b/package/x11r7/applications/xapp_xwininfo/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XAPP_XWININFO
+	bool "xwininfo"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  window information utility for X
diff --git a/package/x11r7/applications/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/applications/xapp_xwininfo/xapp_xwininfo.mk
new file mode 100644
index 0000000..541efde
--- /dev/null
+++ b/package/x11r7/applications/xapp_xwininfo/xapp_xwininfo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xwininfo -- window information utility for X
+#
+################################################################################
+
+XAPP_XWININFO_VERSION = 1.0.5
+XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
+XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/applications/xapp_xwud/Config.in b/package/x11r7/applications/xapp_xwud/Config.in
new file mode 100644
index 0000000..cb8337e
--- /dev/null
+++ b/package/x11r7/applications/xapp_xwud/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XAPP_XWUD
+	bool "xwud"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  image displayer for X
diff --git a/package/x11r7/applications/xapp_xwud/xapp_xwud.mk b/package/x11r7/applications/xapp_xwud/xapp_xwud.mk
new file mode 100644
index 0000000..69bb228
--- /dev/null
+++ b/package/x11r7/applications/xapp_xwud/xapp_xwud.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xwud -- image displayer for X
+#
+################################################################################
+
+XAPP_XWUD_VERSION = 1.0.2
+XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
+XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWUD_DEPENDENCIES = xlib_libX11
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-acecad/Config.in b/package/x11r7/drivers/xdriver_xf86-input-acecad/Config.in
new file mode 100644
index 0000000..7e1838e
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-acecad/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD
+	bool "xf86-input-acecad"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Acecad Flair input driver
diff --git a/package/x11r7/drivers/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/drivers/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
new file mode 100644
index 0000000..e55f979
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-acecad -- Acecad Flair input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.4.0
+XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-aiptek/Config.in b/package/x11r7/drivers/xdriver_xf86-input-aiptek/Config.in
new file mode 100644
index 0000000..87fe5b3
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-aiptek/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK
+	bool "xf86-input-aiptek"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Aiptek USB Digital Tablet Input Driver for Linux
diff --git a/package/x11r7/drivers/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/drivers/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
new file mode 100644
index 0000000..c3299ac
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-aiptek -- Aiptek USB Digital Tablet Input Driver for Linux
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-evdev/Config.in b/package/x11r7/drivers/xdriver_xf86-input-evdev/Config.in
new file mode 100644
index 0000000..248be7e
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-evdev/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
+	bool "xf86-input-evdev"
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Generic Linux input driver
diff --git a/package/x11r7/drivers/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/drivers/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
new file mode 100644
index 0000000..d1964b2
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-evdev -- Generic Linux input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.3.0
+XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-joystick/Config.in b/package/x11r7/drivers/xdriver_xf86-input-joystick/Config.in
new file mode 100644
index 0000000..4a7439a
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-joystick/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
+	bool "xf86-input-joystick"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for joystick input devices
diff --git a/package/x11r7/drivers/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/drivers/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
new file mode 100644
index 0000000..afbf286
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-joystick -- X.Org driver for joystick input devices
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.4.99.2
+XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/drivers/xdriver_xf86-input-keyboard/Config.in
new file mode 100644
index 0000000..481c763
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-keyboard/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
+	bool "xf86-input-keyboard"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_KBPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Keyboard input driver
diff --git a/package/x11r7/drivers/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/drivers/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
new file mode 100644
index 0000000..e0b57de
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-keyboard -- Keyboard input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.4.0
+XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-mouse/Config.in b/package/x11r7/drivers/xdriver_xf86-input-mouse/Config.in
new file mode 100644
index 0000000..c8e39b0
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-mouse/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
+	bool "xf86-input-mouse"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for mouse input devices
diff --git a/package/x11r7/drivers/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/drivers/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
new file mode 100644
index 0000000..55c6370
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-mouse -- X.Org driver for mouse input devices
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.5.0
+XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/drivers/xdriver_xf86-input-synaptics/Config.in
new file mode 100644
index 0000000..258dee2
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-synaptics/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
+	bool "xf86-input-synaptics"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for synaptics input devices
diff --git a/package/x11r7/drivers/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/drivers/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
new file mode 100644
index 0000000..6f9d66d
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-synaptics -- X.Org driver for synaptics input devices
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.2.0
+XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/drivers/xdriver_xf86-input-vmmouse/Config.in
new file mode 100644
index 0000000..377e7e4
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-vmmouse/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
+	bool "xf86-input-vmmouse"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  VMWare mouse input driver
diff --git a/package/x11r7/drivers/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/drivers/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
new file mode 100644
index 0000000..386c4d1
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-vmmouse -- VMWare mouse input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 12.6.5
+XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-input-void/Config.in b/package/x11r7/drivers/xdriver_xf86-input-void/Config.in
new file mode 100644
index 0000000..ab4230b
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-void/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
+	bool "xf86-input-void"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  null input driver
diff --git a/package/x11r7/drivers/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/drivers/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
new file mode 100644
index 0000000..1beed2e
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-void -- null input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_VOID_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-apm/Config.in b/package/x11r7/drivers/xdriver_xf86-video-apm/Config.in
new file mode 100644
index 0000000..dea5258
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-apm/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
+	bool "xf86-video-apm"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Alliance ProMotion video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/drivers/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
new file mode 100644
index 0000000..ab6e8fb
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-apm -- Alliance ProMotion video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_APM_VERSION = 1.2.2
+XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-ark/Config.in b/package/x11r7/drivers/xdriver_xf86-video-ark/Config.in
new file mode 100644
index 0000000..d9703de
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-ark/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
+	bool "xf86-video-ark"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for ark cards
diff --git a/package/x11r7/drivers/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/drivers/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
new file mode 100644
index 0000000..6cb689e
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-ark -- X.Org driver for ark cards
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.2
+XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-ast/Config.in b/package/x11r7/drivers/xdriver_xf86-video-ast/Config.in
new file mode 100644
index 0000000..b2a0bc8
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-ast/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
+	bool "xf86-video-ast"
+	help
+	  No description available
diff --git a/package/x11r7/drivers/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/drivers/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
new file mode 100644
index 0000000..f71b707
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# xdriver_xf86-video-ast -- No description available
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_AST_VERSION = 0.89.9
+XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-ati/Config.in b/package/x11r7/drivers/xdriver_xf86-video-ati/Config.in
new file mode 100644
index 0000000..107a57b
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-ati/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
+	bool "xf86-video-ati"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  ATI video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
new file mode 100644
index 0000000..d276176
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
@@ -0,0 +1,27 @@
+--- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
++++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
+@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ AC_HEADER_STDC
+ 
+ if test "$DRI" != no; then
+-	AC_CHECK_FILE([${sdkdir}/dri.h],
++ 	if test "$cross_compiling" = "no" ; then
++		AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/sarea.h],
++		AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/dristruct.h],
++		AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/damage.h],
++		AC_CHECK_FILE([${sdkdir}/damage.h],
+                       [have_damage_h="yes"], [have_damage_h="no"])
++ 	else
++ 		have_dri_h="yes"
++ 		have_sarea_h="yes"
++ 		have_dristruct_h="yes"
++ 	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
new file mode 100644
index 0000000..a357cf2
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-ati -- ATI video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_ATI_VERSION = 6.12.4
+XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-chips/Config.in b/package/x11r7/drivers/xdriver_xf86-video-chips/Config.in
new file mode 100644
index 0000000..29a99ec
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-chips/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
+	bool "xf86-video-chips"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Chips and Technologies video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/drivers/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
new file mode 100644
index 0000000..5e9d9ab
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-chips -- Chips and Technologies video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.2
+XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-cirrus/Config.in b/package/x11r7/drivers/xdriver_xf86-video-cirrus/Config.in
new file mode 100644
index 0000000..31ed634
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-cirrus/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
+	bool "xf86-video-cirrus"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Cirrus Logic video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/drivers/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
new file mode 100644
index 0000000..774688d
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-cirrus -- Cirrus Logic video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_CIRRUS_VERSION = 1.3.2
+XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-dummy/Config.in b/package/x11r7/drivers/xdriver_xf86-video-dummy/Config.in
new file mode 100644
index 0000000..2a172cc
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-dummy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
+	bool "xf86-video-dummy"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for dummy cards
diff --git a/package/x11r7/drivers/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/drivers/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
new file mode 100644
index 0000000..91182fe
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-dummy -- X.Org driver for dummy cards
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.2
+XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-fbdev/Config.in b/package/x11r7/drivers/xdriver_xf86-video-fbdev/Config.in
new file mode 100644
index 0000000..8907fe1
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-fbdev/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
+	bool "xf86-video-fbdev"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  video driver for framebuffer device
diff --git a/package/x11r7/drivers/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/drivers/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
new file mode 100644
index 0000000..600335e
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-fbdev -- video driver for framebuffer device
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.4.1
+XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-geode/Config.in b/package/x11r7/drivers/xdriver_xf86-video-geode/Config.in
new file mode 100644
index 0000000..c60b62c
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-geode/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
+	bool "xf86-video-geode"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  video driver for geode device
diff --git a/package/x11r7/drivers/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/drivers/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
new file mode 100644
index 0000000..faee8ca
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-geode -- video driver for geode device
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.6
+XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-glide/Config.in b/package/x11r7/drivers/xdriver_xf86-video-glide/Config.in
new file mode 100644
index 0000000..ea9abd7
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-glide/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
+	bool "xf86-video-glide"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
+	help
+	  video driver for glide device
diff --git a/package/x11r7/drivers/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/drivers/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
new file mode 100644
index 0000000..cd611b6
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-glide -- video driver for glide device
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.0.3
+XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-glint/Config.in b/package/x11r7/drivers/xdriver_xf86-video-glint/Config.in
new file mode 100644
index 0000000..782b6da
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-glint/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
+	bool "xf86-video-glint"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  GLINT/Permedia video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
new file mode 100644
index 0000000..8c420d3
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
@@ -0,0 +1,29 @@
+--- a/configure.ac	2008-06-23 11:17:07.000000000 -0400
++++ b/configure.ac	2008-06-23 11:16:31.000000000 -0400
+@@ -75,12 +75,20 @@ CPPFLAGS="$SAVE_CPPFLAGS"
+ AC_HEADER_STDC
+ 
+ if test "$DRI" != no; then
+-        AC_CHECK_FILE([${sdkdir}/dri.h],
+-                      [have_dri_h="yes"], [have_dri_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/sarea.h],
+-                      [have_sarea_h="yes"], [have_sarea_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
+-                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
++  	if test "$cross_compiling" = "no" ; then
++ 		AC_CHECK_FILE([${sdkdir}/dri.h],
++                        [have_dri_h="yes"], [have_dri_h="no"])
++ 		AC_CHECK_FILE([${sdkdir}/sarea.h],
++                        [have_sarea_h="yes"], [have_sarea_h="no"])
++ 		AC_CHECK_FILE([${sdkdir}/dristruct.h],
++                        [have_dristruct_h="yes"], [have_dristruct_h="no"])
++ 		AC_CHECK_FILE([${sdkdir}/damage.h],
++                        [have_damage_h="yes"], [have_damage_h="no"])
++  	else
++  		have_dri_h="yes"
++  		have_sarea_h="yes"
++  		have_dristruct_h="yes"
++  	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
new file mode 100644
index 0000000..2ff7669
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-glint -- GLINT/Permedia video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.4
+XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-i128/Config.in b/package/x11r7/drivers/xdriver_xf86-video-i128/Config.in
new file mode 100644
index 0000000..a66fda6
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-i128/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
+	bool "xf86-video-i128"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Number 9 I128 video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/drivers/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
new file mode 100644
index 0000000..4188dc5
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-i128 -- Number 9 I128 video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_I128_VERSION = 1.3.3
+XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-i740/Config.in b/package/x11r7/drivers/xdriver_xf86-video-i740/Config.in
new file mode 100644
index 0000000..9d1a040
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-i740/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
+	bool "xf86-video-i740"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Intel i740 video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/drivers/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
new file mode 100644
index 0000000..47ba28d
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-i740 -- Intel i740 video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_I740_VERSION = 1.3.2
+XDRIVER_XF86_VIDEO_I740_SOURCE = xf86-video-i740-$(XDRIVER_XF86_VIDEO_I740_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-intel/Config.in b/package/x11r7/drivers/xdriver_xf86-video-intel/Config.in
new file mode 100644
index 0000000..9a1d6cf
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-intel/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
+	bool "xf86-video-intel"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	help
+	  Intel video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
new file mode 100644
index 0000000..0b020ac
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
@@ -0,0 +1,11 @@
+--- a/configure.ac.orig	2010-01-04 22:20:07.000000000 +0000
++++ b/configure.ac	2010-02-19 12:12:50.000000000 +0000
+@@ -103,7 +103,7 @@
+ CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
+ CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
+ AC_MSG_CHECKING([whether to include DRI support])
+-if test x$DRI != xno; then
++if test "$cross_compiling" = "no" -a test x$DRI != xno; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+         AC_CHECK_FILE([${sdkdir}/sarea.h],
diff --git a/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
new file mode 100644
index 0000000..76a33eb
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
@@ -0,0 +1,25 @@
+--- xdriver_xf86-video-intel-2.9.1/configure.ac.orig	2010-01-28 11:18:27.526329157 +0200
++++ xdriver_xf86-video-intel-2.9.1/configure.ac	2010-01-28 11:21:38.065198735 +0200
+@@ -114,6 +114,7 @@ save_CFLAGS="$CFLAGS"
+ CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
+ CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
+ AC_MSG_CHECKING([whether to include DRI support])
++if test "$cross_compiling" = "no" ; then
+ if test x$DRI != xno; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+@@ -132,6 +133,14 @@ if test x$DRI = xauto; then
+                 DRI="no"
+         fi
+ fi
++else
++if test x$DRI != xno; then
++	have_dri_h="yes"
++	have_sarea_h="yes"
++	have_dristruct_h="yes"
++	DRI="yes"
++fi
++fi
+ AC_MSG_RESULT([$DRI])
+ CFLAGS="$save_CFLAGS $DEBUGFLAGS"
+ 
diff --git a/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
new file mode 100644
index 0000000..a24a241
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xdriver_xf86-video-intel -- Intel video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.10.0
+XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
+XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-mach64/Config.in b/package/x11r7/drivers/xdriver_xf86-video-mach64/Config.in
new file mode 100644
index 0000000..f2464e7
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-mach64/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
+	bool "xf86-video-mach64"
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  mach64 video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
new file mode 100644
index 0000000..d276176
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
@@ -0,0 +1,27 @@
+--- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
++++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
+@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ AC_HEADER_STDC
+ 
+ if test "$DRI" != no; then
+-	AC_CHECK_FILE([${sdkdir}/dri.h],
++ 	if test "$cross_compiling" = "no" ; then
++		AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/sarea.h],
++		AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/dristruct.h],
++		AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/damage.h],
++		AC_CHECK_FILE([${sdkdir}/damage.h],
+                       [have_damage_h="yes"], [have_damage_h="no"])
++ 	else
++ 		have_dri_h="yes"
++ 		have_sarea_h="yes"
++ 		have_dristruct_h="yes"
++ 	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
new file mode 100644
index 0000000..0636085
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-mach64 -- mach64 video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.8.2
+XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-mga/Config.in b/package/x11r7/drivers/xdriver_xf86-video-mga/Config.in
new file mode 100644
index 0000000..40c6f3a
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-mga/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
+	bool "xf86-video-mga"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Matrox video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch b/package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
new file mode 100644
index 0000000..5707bd1
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
@@ -0,0 +1,21 @@
+--- xf86-video-mga-1.4.9/configure.ac.orig	2007-06-10 11:55:24.000000000 +0200
++++ xf86-video-mga-1.4.9/configure.ac	2007-06-10 12:00:37.000000000 +0200
+@@ -77,12 +77,18 @@
+ AC_HEADER_STDC
+ 
+ if test "x$DRI" != xno; then
++	if test "$cross_compiling" = no; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+         AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+         AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
++	else
++		have_dri_h="yes"
++		have_sarea_h="yes"
++		have_dristruct_h="yes"
++	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
new file mode 100644
index 0000000..64bae46
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-mga -- Matrox video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_MGA_VERSION = 1.4.11
+XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/drivers/xdriver_xf86-video-neomagic/Config.in
new file mode 100644
index 0000000..2e028a7
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-neomagic/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
+	bool "xf86-video-neomagic"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Neomagic video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/drivers/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
new file mode 100644
index 0000000..27e028b
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-neomagic -- Neomagic video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.2.4
+XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-newport/Config.in b/package/x11r7/drivers/xdriver_xf86-video-newport/Config.in
new file mode 100644
index 0000000..e2effe8
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-newport/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
+	bool "xf86-video-newport"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Newport video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/drivers/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
new file mode 100644
index 0000000..1138744
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-newport -- Newport video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_NEWPORT_VERSION = 0.2.3
+XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWPORT_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-nv/Config.in b/package/x11r7/drivers/xdriver_xf86-video-nv/Config.in
new file mode 100644
index 0000000..943bc14
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-nv/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
+	bool "xf86-video-nv"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  NVIDIA video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/drivers/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
new file mode 100644
index 0000000..4886fe8
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-nv -- NVIDIA video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.15
+XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/drivers/xdriver_xf86-video-openchrome/Config.in
new file mode 100644
index 0000000..4a69246
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-openchrome/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
+	bool "xf86-video-openchrome"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXVMC
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Openchrome, A free and Open Source video driver for the VIA/S3G
+	  UniChrome and UniChrome Pro graphics chipsets.
diff --git a/package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
new file mode 100644
index 0000000..e259398
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
@@ -0,0 +1,21 @@
+--- a/configure.ac	2008-04-09 15:42:55.000000000 -0400
++++ b/configure.ac	2008-06-23 09:39:06.000000000 -0400
+@@ -87,12 +87,18 @@ if test x$XSERVER_LIBPCIACCESS = xyes; t
+ fi
+ 
+ if test "$DRI" != no; then
++	if test "$cross_compiling" = "no" ; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+         AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+         AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
++	else
++		have_dri_h="yes"
++		have_sarea_h="yes"
++		have_dristruct_h="yes"
++	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
new file mode 100644
index 0000000..c166559
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# openchrome
+#
+#############################################################
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.904
+XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://www.openchrome.org/releases
+
+XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
+	xserver_xorg-server \
+	libdrm \
+	xlib_libX11 \
+	xlib_libXcomposite \
+	xlib_libXvMC \
+	xproto_fontsproto \
+	xproto_glproto \
+	xproto_randrproto \
+	xproto_renderproto \
+	xproto_xextproto \
+	xproto_xf86driproto \
+	xproto_xproto
+
+
+XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-r128/Config.in b/package/x11r7/drivers/xdriver_xf86-video-r128/Config.in
new file mode 100644
index 0000000..96bd8d7
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-r128/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
+	bool "xf86-video-r128"
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  R128 video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch
new file mode 100644
index 0000000..d276176
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch
@@ -0,0 +1,27 @@
+--- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
++++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
+@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ AC_HEADER_STDC
+ 
+ if test "$DRI" != no; then
+-	AC_CHECK_FILE([${sdkdir}/dri.h],
++ 	if test "$cross_compiling" = "no" ; then
++		AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/sarea.h],
++		AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/dristruct.h],
++		AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
+-	AC_CHECK_FILE([${sdkdir}/damage.h],
++		AC_CHECK_FILE([${sdkdir}/damage.h],
+                       [have_damage_h="yes"], [have_damage_h="no"])
++ 	else
++ 		have_dri_h="yes"
++ 		have_sarea_h="yes"
++ 		have_dristruct_h="yes"
++ 	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
new file mode 100644
index 0000000..8430d73
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-r128 -- R128 video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.8.1
+XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-rendition/Config.in b/package/x11r7/drivers/xdriver_xf86-video-rendition/Config.in
new file mode 100644
index 0000000..9238aec
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-rendition/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
+	bool "xf86-video-rendition"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Rendition video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/drivers/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
new file mode 100644
index 0000000..51efbd4
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-rendition -- Rendition video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.3
+XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_RENDITION_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-s3/Config.in b/package/x11r7/drivers/xdriver_xf86-video-s3/Config.in
new file mode 100644
index 0000000..1091028
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-s3/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
+	bool "xf86-video-s3"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for s3 cards
diff --git a/package/x11r7/drivers/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/drivers/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
new file mode 100644
index 0000000..6c619c9
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-s3 -- X.Org driver for s3 cards
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_S3_VERSION = 0.6.3
+XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/drivers/xdriver_xf86-video-s3virge/Config.in
new file mode 100644
index 0000000..6f31864
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-s3virge/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
+	bool "xf86-video-s3virge"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  S3 ViRGE video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/drivers/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
new file mode 100644
index 0000000..68b0acc
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-s3virge -- S3 ViRGE video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_S3VIRGE_VERSION = 1.10.4
+XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VIRGE_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-savage/Config.in b/package/x11r7/drivers/xdriver_xf86-video-savage/Config.in
new file mode 100644
index 0000000..a9c8f6c
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-savage/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
+	bool "xf86-video-savage"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  S3 Savage video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
new file mode 100644
index 0000000..b9c296b
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
@@ -0,0 +1,27 @@
+--- a/configure.ac	2008-05-21 16:04:23.000000000 -0400
++++ b/configure.ac	2008-06-23 11:41:50.000000000 -0400
+@@ -68,12 +68,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ AC_HEADER_STDC
+ 
+ if test "$DRI" != no; then
+-        AC_CHECK_FILE([${sdkdir}/dri.h],
+-                      [have_dri_h="yes"], [have_dri_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/sarea.h],
+-                      [have_sarea_h="yes"], [have_sarea_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
+-                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
++  	if test "$cross_compiling" = "no" ; then
++ 		AC_CHECK_FILE([${sdkdir}/dri.h],
++                        [have_dri_h="yes"], [have_dri_h="no"])
++ 		AC_CHECK_FILE([${sdkdir}/sarea.h],
++                        [have_sarea_h="yes"], [have_sarea_h="no"])
++ 		AC_CHECK_FILE([${sdkdir}/dristruct.h],
++                        [have_dristruct_h="yes"], [have_dristruct_h="no"])
++  	else
++  		have_dri_h="yes"
++  		have_sarea_h="yes"
++  		have_dristruct_h="yes"
++  	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
new file mode 100644
index 0000000..32ef7f5
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-savage -- S3 Savage video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.1
+XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/drivers/xdriver_xf86-video-siliconmotion/Config.in
new file mode 100644
index 0000000..db15116
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-siliconmotion/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
+	bool "xf86-video-siliconmotion"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Silicon Motion video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/drivers/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
new file mode 100644
index 0000000..9f5d7fd
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-siliconmotion -- Silicon Motion video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.3
+XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sis/Config.in b/package/x11r7/drivers/xdriver_xf86-video-sis/Config.in
new file mode 100644
index 0000000..ac2b632
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sis/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
+	bool "xf86-video-sis"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  SiS and XGI video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch b/package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
new file mode 100644
index 0000000..9e06480
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
@@ -0,0 +1,21 @@
+--- xf86-video-sis-0.9.3/configure.ac.orig	2007-06-10 21:00:29.000000000 +0200
++++ xf86-video-sis-0.9.3/configure.ac	2007-06-10 21:00:45.000000000 +0200
+@@ -71,12 +71,18 @@
+ AC_HEADER_STDC
+ 
+ if test "$DRI" != no; then
++	if test "$cross_compiling" = "no" ; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+         AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+         AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
++	else
++		have_dri_h="yes"
++		have_sarea_h="yes"
++		have_dristruct_h="yes"
++	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
new file mode 100644
index 0000000..8343761
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-sis -- SiS and XGI video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.2
+XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/drivers/xdriver_xf86-video-sisusb/Config.in
new file mode 100644
index 0000000..b00a8a7
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sisusb/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
+	bool "xf86-video-sisusb"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  SiS USB video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/drivers/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
new file mode 100644
index 0000000..e9e529d
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-sisusb -- SiS USB video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.3
+XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suncg14/Config.in b/package/x11r7/drivers/xdriver_xf86-video-suncg14/Config.in
new file mode 100644
index 0000000..661c179
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suncg14/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
+	bool "xf86-video-suncg14"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  CG14 video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/drivers/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
new file mode 100644
index 0000000..f7c4f64
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-suncg14 -- CG14 video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SUNCG14_VERSION = 1.1.1
+XDRIVER_XF86_VIDEO_SUNCG14_SOURCE = xf86-video-suncg14-$(XDRIVER_XF86_VIDEO_SUNCG14_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SUNCG14_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/drivers/xdriver_xf86-video-suncg3/Config.in
new file mode 100644
index 0000000..539a95a
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suncg3/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
+	bool "xf86-video-suncg3"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  CG3 video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/drivers/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
new file mode 100644
index 0000000..adef006
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-suncg3 -- CG3 video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SUNCG3_VERSION = 1.1.1
+XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/drivers/xdriver_xf86-video-suncg6/Config.in
new file mode 100644
index 0000000..9496f8d
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suncg6/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
+	bool "xf86-video-suncg6"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  GX/Turbo GX video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/drivers/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
new file mode 100644
index 0000000..0d1f11e
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-suncg6 -- GX/Turbo GX video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SUNCG6_VERSION = 1.1.1
+XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/drivers/xdriver_xf86-video-sunffb/Config.in
new file mode 100644
index 0000000..76f5b9a
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sunffb/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
+	bool "xf86-video-sunffb"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  SUNFFB video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/drivers/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
new file mode 100644
index 0000000..be667a2
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-sunffb -- SUNFFB video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SUNFFB_VERSION = 1.2.1
+XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sunleo/Config.in b/package/x11r7/drivers/xdriver_xf86-video-sunleo/Config.in
new file mode 100644
index 0000000..29d24a2
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sunleo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO
+	bool "xf86-video-sunleo"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Leo video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk b/package/x11r7/drivers/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
new file mode 100644
index 0000000..b0cc953
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-sunleo -- Leo video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SUNLEO_VERSION = 1.2.0
+XDRIVER_XF86_VIDEO_SUNLEO_SOURCE = xf86-video-sunleo-$(XDRIVER_XF86_VIDEO_SUNLEO_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SUNLEO_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SUNLEO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/drivers/xdriver_xf86-video-suntcx/Config.in
new file mode 100644
index 0000000..3c82739
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suntcx/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
+	bool "xf86-video-suntcx"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  TCX video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/drivers/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
new file mode 100644
index 0000000..135ddd7
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-suntcx -- TCX video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_SUNTCX_VERSION = 1.1.1
+XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/drivers/xdriver_xf86-video-tdfx/Config.in
new file mode 100644
index 0000000..57bb411
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-tdfx/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
+	bool "xf86-video-tdfx"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  3Dfx video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch b/package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
new file mode 100644
index 0000000..e53591b
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
@@ -0,0 +1,24 @@
+--- xf86-video-tdfx-1.3.0/configure.ac.orig	2007-06-10 21:01:54.000000000 +0200
++++ xf86-video-tdfx-1.3.0/configure.ac	2007-06-10 21:02:06.000000000 +0200
+@@ -67,13 +67,20 @@
+ # Checks for header files.
+ AC_HEADER_STDC
+ 
+-if test "$DRI" != no; then
++if test "x$DRI" != xno; then
++	if test "$cross_compiling" = "no" ; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+         AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+         AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
++		AC_CHECK_HEADER
++	else
++		have_dri_h="yes"
++		have_sarea_h="yes"
++		have_dristruct_h="yes"
++	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
new file mode 100644
index 0000000..dd2643a
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-tdfx -- 3Dfx video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.3
+XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-tga/Config.in b/package/x11r7/drivers/xdriver_xf86-video-tga/Config.in
new file mode 100644
index 0000000..800a8f6
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-tga/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
+	bool "xf86-video-tga"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for tga cards
diff --git a/package/x11r7/drivers/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/drivers/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
new file mode 100644
index 0000000..fb69d51
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-tga -- X.Org driver for tga cards
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.1
+XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-trident/Config.in b/package/x11r7/drivers/xdriver_xf86-video-trident/Config.in
new file mode 100644
index 0000000..4a7a477
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-trident/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
+	bool "xf86-video-trident"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Trident video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/drivers/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
new file mode 100644
index 0000000..af44f69
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-trident -- Trident video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.3
+XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-tseng/Config.in b/package/x11r7/drivers/xdriver_xf86-video-tseng/Config.in
new file mode 100644
index 0000000..f72b87b
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-tseng/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
+	bool "xf86-video-tseng"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Tseng Labs video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/drivers/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
new file mode 100644
index 0000000..dc3d8fa
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-tseng -- Tseng Labs video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.3
+XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-v4l/Config.in b/package/x11r7/drivers/xdriver_xf86-video-v4l/Config.in
new file mode 100644
index 0000000..3bb41fc
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-v4l/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
+	bool "xf86-video-v4l"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  video4linux driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/drivers/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
new file mode 100644
index 0000000..214fc67
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-v4l -- video4linux driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_V4L_VERSION = 0.2.0
+XDRIVER_XF86_VIDEO_V4L_SOURCE = xf86-video-v4l-$(XDRIVER_XF86_VIDEO_V4L_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-vesa/Config.in b/package/x11r7/drivers/xdriver_xf86-video-vesa/Config.in
new file mode 100644
index 0000000..865f52c
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-vesa/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
+	bool "xf86-video-vesa"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Generic VESA video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch b/package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
new file mode 100644
index 0000000..bf9ffe7
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
@@ -0,0 +1,13 @@
+--- xf86-video-vesa-2.0.0/configure.ac.orig	2007-06-11 13:10:35.000000000 +0200
++++ xf86-video-vesa-2.0.0/configure.ac	2007-06-11 14:16:45.000000000 +0200
+@@ -56,8 +56,8 @@
+ PKG_CHECK_MODULES(XORG, xorg-server >= 1.0.99.901 xproto fontsproto $REQUIRED_MODULES)
+ sdkdir=$(pkg-config --variable=sdkdir xorg-server)
+ 
+-CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
+-INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
++CFLAGS="$CFLAGS $XORG_CFLAGS "'-I$(top_srcdir)/src'
++INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
+ AC_SUBST([CFLAGS])
+ AC_SUBST([INCLUDES])
+ 
diff --git a/package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
new file mode 100644
index 0000000..bc4c38e
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-vesa -- Generic VESA video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_VESA_VERSION = 2.2.1
+XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-vmware/Config.in b/package/x11r7/drivers/xdriver_xf86-video-vmware/Config.in
new file mode 100644
index 0000000..9093b38
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-vmware/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
+	bool "xf86-video-vmware"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  VMware SVGA video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/drivers/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
new file mode 100644
index 0000000..4425112
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-vmware -- VMware SVGA video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_VMWARE_VERSION = 10.16.8
+XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/drivers/xdriver_xf86-video-voodoo/Config.in
new file mode 100644
index 0000000..9b770be
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-voodoo/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
+	bool "xf86-video-voodoo"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Voodoo video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/drivers/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
new file mode 100644
index 0000000..86caaae
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-voodoo -- Voodoo video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_VOODOO_VERSION = 1.2.3
+XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/drivers/xdriver_xf86-video-wsfb/Config.in
new file mode 100644
index 0000000..3b3d406
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-wsfb/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
+	bool "xf86-video-wsfb"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
+	help
+	  WSFB based chips video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/drivers/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
new file mode 100644
index 0000000..7dfbd8d
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-video-wsfb -- WSFB video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.3.0
+XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-xgi/Config.in b/package/x11r7/drivers/xdriver_xf86-video-xgi/Config.in
new file mode 100644
index 0000000..d0fe665
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-xgi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
+	bool "xf86-video-xgi"
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  XGI based chips video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
new file mode 100644
index 0000000..fc7903c
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
@@ -0,0 +1,24 @@
+--- xdriver_xf86-video-xgi-1.5.1/configure.ac.orig	2009-09-07 08:03:18.000000000 +0300
++++ xdriver_xf86-video-xgi-1.5.1/configure.ac	2010-02-03 23:58:40.507035914 +0200
+@@ -78,12 +78,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ AC_HEADER_STDC
+ 
+ if test "x$DRI" = xauto; then
+-        AC_CHECK_FILE([${sdkdir}/dri.h],
++        if test "$cross_compiling" = "no" ; then
++                AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/sarea.h],
++                AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
++                AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
++        else
++                have_dri_h="yes"
++                have_sarea_h="yes"
++                have_dristruct_h="yes"
++        fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
new file mode 100644
index 0000000..837c9dd
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-xgi -- XGI video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_XGI_VERSION = 1.5.1
+XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_XGI_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/drivers/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/drivers/xdriver_xf86-video-xgixp/Config.in
new file mode 100644
index 0000000..8d466f4
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-xgixp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
+	bool "xf86-video-xgixp"
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  XGIXP based chips video driver
diff --git a/package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch b/package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
new file mode 100644
index 0000000..9736252
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
@@ -0,0 +1,24 @@
+--- xdriver_xf86-video-xgixp-1.7.99.4/configure.ac.orig	2009-09-07 08:09:14.000000000 +0300
++++ xdriver_xf86-video-xgixp-1.7.99.4/configure.ac	2010-02-04 00:12:22.159108635 +0200
+@@ -63,12 +63,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
+ # Checks for header files.
+ AC_HEADER_STDC
+ 
+-AC_CHECK_FILE([${sdkdir}/dri.h],
++if test "$cross_compiling" = "no" ; then
++        AC_CHECK_FILE([${sdkdir}/dri.h],
+               [have_dri_h="yes"], [have_dri_h="no"])
+-AC_CHECK_FILE([${sdkdir}/sarea.h],
++        AC_CHECK_FILE([${sdkdir}/sarea.h],
+               [have_sarea_h="yes"], [have_sarea_h="no"])
+-AC_CHECK_FILE([${sdkdir}/dristruct.h],
++        AC_CHECK_FILE([${sdkdir}/dristruct.h],
+               [have_dristruct_h="yes"], [have_dristruct_h="no"])
++else
++        have_dri_h="yes"
++        have_sarea_h="yes"
++        have_dristruct_h="yes"
++fi
+ 
+ AC_DEFINE(XF86DRI_DEVEL,1,[Enable developmental DRI driver support])
+ 
diff --git a/package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
new file mode 100644
index 0000000..a3edd20
--- /dev/null
+++ b/package/x11r7/drivers/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdriver_xf86-video-xgixp -- XGIXP video driver
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_XGIXP_VERSION = 1.7.99.4
+XDRIVER_XF86_VIDEO_XGIXP_SOURCE = xf86-video-xgixp-$(XDRIVER_XF86_VIDEO_XGIXP_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/fonts/xfont_encodings/Config.in b/package/x11r7/fonts/xfont_encodings/Config.in
new file mode 100644
index 0000000..af40da1
--- /dev/null
+++ b/package/x11r7/fonts/xfont_encodings/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_ENCODINGS
+	bool "encodings"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_encodings/xfont_encodings.mk b/package/x11r7/fonts/xfont_encodings/xfont_encodings.mk
new file mode 100644
index 0000000..8c4aac4
--- /dev/null
+++ b/package/x11r7/fonts/xfont_encodings/xfont_encodings.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xfont_encodings -- No description available
+#
+################################################################################
+
+XFONT_ENCODINGS_VERSION = 1.0.3
+XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
+XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_ENCODINGS_MAKE_OPT =
+XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
+HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/fonts/xfont_font-adobe-100dpi/Config.in b/package/x11r7/fonts/xfont_font-adobe-100dpi/Config.in
new file mode 100644
index 0000000..aaac639
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-100dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI
+	bool "font-adobe-100dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/fonts/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
new file mode 100644
index 0000000..45029e1
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-adobe-100dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_ADOBE_100DPI_VERSION = 1.0.1
+XFONT_FONT_ADOBE_100DPI_SOURCE = font-adobe-100dpi-$(XFONT_FONT_ADOBE_100DPI_VERSION).tar.bz2
+XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-adobe-75dpi/Config.in b/package/x11r7/fonts/xfont_font-adobe-75dpi/Config.in
new file mode 100644
index 0000000..f1c0a41
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-75dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI
+	bool "font-adobe-75dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/fonts/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
new file mode 100644
index 0000000..e172323
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-adobe-75dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.1
+XFONT_FONT_ADOBE_75DPI_SOURCE = font-adobe-75dpi-$(XFONT_FONT_ADOBE_75DPI_VERSION).tar.bz2
+XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/Config.in b/package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/Config.in
new file mode 100644
index 0000000..02f2aeb
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI
+	bool "font-adobe-utopia-100dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
new file mode 100644
index 0000000..cbb78ad
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-adobe-utopia-100dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.2
+XFONT_FONT_ADOBE_UTOPIA_100DPI_SOURCE = font-adobe-utopia-100dpi-$(XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION).tar.bz2
+XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/Config.in b/package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/Config.in
new file mode 100644
index 0000000..4a6e29c
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI
+	bool "font-adobe-utopia-75dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
new file mode 100644
index 0000000..f4e9c8b
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-adobe-utopia-75dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.2
+XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.bz2
+XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-adobe-utopia-type1/Config.in b/package/x11r7/fonts/xfont_font-adobe-utopia-type1/Config.in
new file mode 100644
index 0000000..d1efb70
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-utopia-type1/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1
+	bool "font-adobe-utopia-type1"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/fonts/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
new file mode 100644
index 0000000..5056e63
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-adobe-utopia-type1 -- No description available
+#
+################################################################################
+
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.2
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_SOURCE = font-adobe-utopia-type1-$(XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION).tar.bz2
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-alias/Config.in b/package/x11r7/fonts/xfont_font-alias/Config.in
new file mode 100644
index 0000000..b655160
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-alias/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ALIAS
+	bool "font-alias"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/fonts/xfont_font-alias/xfont_font-alias.mk
new file mode 100644
index 0000000..34b52e2
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-alias/xfont_font-alias.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-alias -- No description available
+#
+################################################################################
+
+XFONT_FONT_ALIAS_VERSION = 1.0.2
+XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
+XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-arabic-misc/Config.in b/package/x11r7/fonts/xfont_font-arabic-misc/Config.in
new file mode 100644
index 0000000..acbdf7c
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-arabic-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ARABIC_MISC
+	bool "font-arabic-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/fonts/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
new file mode 100644
index 0000000..e26f998
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-arabic-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_ARABIC_MISC_VERSION = 1.0.1
+XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.bz2
+XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bh-100dpi/Config.in b/package/x11r7/fonts/xfont_font-bh-100dpi/Config.in
new file mode 100644
index 0000000..dc405a2
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-100dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BH_100DPI
+	bool "font-bh-100dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/fonts/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
new file mode 100644
index 0000000..52e30b5
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bh-100dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_BH_100DPI_VERSION = 1.0.1
+XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.bz2
+XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bh-75dpi/Config.in b/package/x11r7/fonts/xfont_font-bh-75dpi/Config.in
new file mode 100644
index 0000000..6cd334e
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-75dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BH_75DPI
+	bool "font-bh-75dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/fonts/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
new file mode 100644
index 0000000..58ebb96
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bh-75dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_BH_75DPI_VERSION = 1.0.1
+XFONT_FONT_BH_75DPI_SOURCE = font-bh-75dpi-$(XFONT_FONT_BH_75DPI_VERSION).tar.bz2
+XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/Config.in b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/Config.in
new file mode 100644
index 0000000..0e082d5
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI
+	bool "font-bh-lucidatypewriter-100dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
new file mode 100644
index 0000000..7f3e82a
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bh-lucidatypewriter-100dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION = 1.0.1
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SOURCE = font-bh-lucidatypewriter-100dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION).tar.bz2
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/Config.in b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/Config.in
new file mode 100644
index 0000000..126fb85
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI
+	bool "font-bh-lucidatypewriter-75dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
new file mode 100644
index 0000000..35b1ecc
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bh-lucidatypewriter-75dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION = 1.0.1
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SOURCE = font-bh-lucidatypewriter-75dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION).tar.bz2
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bh-ttf/Config.in b/package/x11r7/fonts/xfont_font-bh-ttf/Config.in
new file mode 100644
index 0000000..2590798
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-ttf/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BH_TTF
+	bool "font-bh-ttf"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/fonts/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
new file mode 100644
index 0000000..2ded871
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bh-ttf -- No description available
+#
+################################################################################
+
+XFONT_FONT_BH_TTF_VERSION = 1.0.1
+XFONT_FONT_BH_TTF_SOURCE = font-bh-ttf-$(XFONT_FONT_BH_TTF_VERSION).tar.bz2
+XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bh-type1/Config.in b/package/x11r7/fonts/xfont_font-bh-type1/Config.in
new file mode 100644
index 0000000..047268c
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-type1/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BH_TYPE1
+	bool "font-bh-type1"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/fonts/xfont_font-bh-type1/xfont_font-bh-type1.mk
new file mode 100644
index 0000000..524bbc6
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bh-type1 -- No description available
+#
+################################################################################
+
+XFONT_FONT_BH_TYPE1_VERSION = 1.0.1
+XFONT_FONT_BH_TYPE1_SOURCE = font-bh-type1-$(XFONT_FONT_BH_TYPE1_VERSION).tar.bz2
+XFONT_FONT_BH_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bitstream-100dpi/Config.in b/package/x11r7/fonts/xfont_font-bitstream-100dpi/Config.in
new file mode 100644
index 0000000..81393c5
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-100dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI
+	bool "font-bitstream-100dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/fonts/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
new file mode 100644
index 0000000..46fe2f7
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bitstream-100dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_BITSTREAM_100DPI_VERSION = 1.0.1
+XFONT_FONT_BITSTREAM_100DPI_SOURCE = font-bitstream-100dpi-$(XFONT_FONT_BITSTREAM_100DPI_VERSION).tar.bz2
+XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bitstream-75dpi/Config.in b/package/x11r7/fonts/xfont_font-bitstream-75dpi/Config.in
new file mode 100644
index 0000000..bada475
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-75dpi/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI
+	bool "font-bitstream-75dpi"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/fonts/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
new file mode 100644
index 0000000..f489def
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bitstream-75dpi -- No description available
+#
+################################################################################
+
+XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.1
+XFONT_FONT_BITSTREAM_75DPI_SOURCE = font-bitstream-75dpi-$(XFONT_FONT_BITSTREAM_75DPI_VERSION).tar.bz2
+XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bitstream-speedo/Config.in b/package/x11r7/fonts/xfont_font-bitstream-speedo/Config.in
new file mode 100644
index 0000000..70750f6
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-speedo/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO
+	bool "font-bitstream-speedo"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/fonts/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
new file mode 100644
index 0000000..72dd7cc
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bitstream-speedo -- No description available
+#
+################################################################################
+
+XFONT_FONT_BITSTREAM_SPEEDO_VERSION = 1.0.1
+XFONT_FONT_BITSTREAM_SPEEDO_SOURCE = font-bitstream-speedo-$(XFONT_FONT_BITSTREAM_SPEEDO_VERSION).tar.bz2
+XFONT_FONT_BITSTREAM_SPEEDO_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-bitstream-type1/Config.in b/package/x11r7/fonts/xfont_font-bitstream-type1/Config.in
new file mode 100644
index 0000000..d482a6d
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-type1/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1
+	bool "font-bitstream-type1"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/fonts/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
new file mode 100644
index 0000000..5ee876e
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-bitstream-type1 -- No description available
+#
+################################################################################
+
+XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.1
+XFONT_FONT_BITSTREAM_TYPE1_SOURCE = font-bitstream-type1-$(XFONT_FONT_BITSTREAM_TYPE1_VERSION).tar.bz2
+XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-cronyx-cyrillic/Config.in b/package/x11r7/fonts/xfont_font-cronyx-cyrillic/Config.in
new file mode 100644
index 0000000..a0085f5
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-cronyx-cyrillic/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC
+	bool "font-cronyx-cyrillic"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/fonts/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
new file mode 100644
index 0000000..7b8c25a
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-cronyx-cyrillic -- No description available
+#
+################################################################################
+
+XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.1
+XFONT_FONT_CRONYX_CYRILLIC_SOURCE = font-cronyx-cyrillic-$(XFONT_FONT_CRONYX_CYRILLIC_VERSION).tar.bz2
+XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-cursor-misc/Config.in b/package/x11r7/fonts/xfont_font-cursor-misc/Config.in
new file mode 100644
index 0000000..03ed530
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-cursor-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
+	bool "font-cursor-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/fonts/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
new file mode 100644
index 0000000..47c5433
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-cursor-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_CURSOR_MISC_VERSION = 1.0.1
+XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.bz2
+XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-daewoo-misc/Config.in b/package/x11r7/fonts/xfont_font-daewoo-misc/Config.in
new file mode 100644
index 0000000..9e45341
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-daewoo-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC
+	bool "font-daewoo-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/fonts/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
new file mode 100644
index 0000000..7b2d16d
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-daewoo-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.1
+XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSION).tar.bz2
+XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-dec-misc/Config.in b/package/x11r7/fonts/xfont_font-dec-misc/Config.in
new file mode 100644
index 0000000..326ea9b
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-dec-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_DEC_MISC
+	bool "font-dec-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/fonts/xfont_font-dec-misc/xfont_font-dec-misc.mk
new file mode 100644
index 0000000..d90733d
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-dec-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_DEC_MISC_VERSION = 1.0.1
+XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.bz2
+XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-ibm-type1/Config.in b/package/x11r7/fonts/xfont_font-ibm-type1/Config.in
new file mode 100644
index 0000000..92783af
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-ibm-type1/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_IBM_TYPE1
+	bool "font-ibm-type1"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/fonts/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
new file mode 100644
index 0000000..561179d
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-ibm-type1 -- No description available
+#
+################################################################################
+
+XFONT_FONT_IBM_TYPE1_VERSION = 1.0.1
+XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.bz2
+XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-isas-misc/Config.in b/package/x11r7/fonts/xfont_font-isas-misc/Config.in
new file mode 100644
index 0000000..2e77f66
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-isas-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_ISAS_MISC
+	bool "font-isas-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/fonts/xfont_font-isas-misc/xfont_font-isas-misc.mk
new file mode 100644
index 0000000..837ed13
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-isas-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_ISAS_MISC_VERSION = 1.0.1
+XFONT_FONT_ISAS_MISC_SOURCE = font-isas-misc-$(XFONT_FONT_ISAS_MISC_VERSION).tar.bz2
+XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-jis-misc/Config.in b/package/x11r7/fonts/xfont_font-jis-misc/Config.in
new file mode 100644
index 0000000..6a59cce
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-jis-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_JIS_MISC
+	bool "font-jis-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/fonts/xfont_font-jis-misc/xfont_font-jis-misc.mk
new file mode 100644
index 0000000..742a995
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-jis-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_JIS_MISC_VERSION = 1.0.1
+XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz2
+XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-micro-misc/Config.in b/package/x11r7/fonts/xfont_font-micro-misc/Config.in
new file mode 100644
index 0000000..1420cbd
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-micro-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_MICRO_MISC
+	bool "font-micro-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/fonts/xfont_font-micro-misc/xfont_font-micro-misc.mk
new file mode 100644
index 0000000..6f0bd58
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-micro-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_MICRO_MISC_VERSION = 1.0.1
+XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.bz2
+XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-misc-cyrillic/Config.in b/package/x11r7/fonts/xfont_font-misc-cyrillic/Config.in
new file mode 100644
index 0000000..e793d70
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-cyrillic/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC
+	bool "font-misc-cyrillic"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/fonts/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
new file mode 100644
index 0000000..716e04a
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-misc-cyrillic -- No description available
+#
+################################################################################
+
+XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.1
+XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.bz2
+XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-misc-ethiopic/Config.in b/package/x11r7/fonts/xfont_font-misc-ethiopic/Config.in
new file mode 100644
index 0000000..aa3b834
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-ethiopic/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC
+	bool "font-misc-ethiopic"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/fonts/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
new file mode 100644
index 0000000..2af5345
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-misc-ethiopic -- No description available
+#
+################################################################################
+
+XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.1
+XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.bz2
+XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-misc-meltho/Config.in b/package/x11r7/fonts/xfont_font-misc-meltho/Config.in
new file mode 100644
index 0000000..dcc6c84
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-meltho/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_MELTHO
+	bool "font-misc-meltho"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/fonts/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
new file mode 100644
index 0000000..3707c1f
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-misc-meltho -- No description available
+#
+################################################################################
+
+XFONT_FONT_MISC_MELTHO_VERSION = 1.0.1
+XFONT_FONT_MISC_MELTHO_SOURCE = font-misc-meltho-$(XFONT_FONT_MISC_MELTHO_VERSION).tar.bz2
+XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-misc-misc/Config.in b/package/x11r7/fonts/xfont_font-misc-misc/Config.in
new file mode 100644
index 0000000..b3e4fc1
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_MISC_MISC
+	bool "font-misc-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/fonts/xfont_font-misc-misc/xfont_font-misc-misc.mk
new file mode 100644
index 0000000..af4cc31
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# font-misc-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_MISC_MISC_VERSION = 1.1.0
+XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.bz2
+XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/fonts/xfont_font-mutt-misc/Config.in b/package/x11r7/fonts/xfont_font-mutt-misc/Config.in
new file mode 100644
index 0000000..e27ea74
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-mutt-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_MUTT_MISC
+	bool "font-mutt-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/fonts/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
new file mode 100644
index 0000000..7c24ed9
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-mutt-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_MUTT_MISC_VERSION = 1.0.1
+XFONT_FONT_MUTT_MISC_SOURCE = font-mutt-misc-$(XFONT_FONT_MUTT_MISC_VERSION).tar.bz2
+XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-schumacher-misc/Config.in b/package/x11r7/fonts/xfont_font-schumacher-misc/Config.in
new file mode 100644
index 0000000..d37babc
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-schumacher-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC
+	bool "font-schumacher-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/fonts/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
new file mode 100644
index 0000000..2cf822e
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-schumacher-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.1.0
+XFONT_FONT_SCHUMACHER_MISC_SOURCE = font-schumacher-misc-$(XFONT_FONT_SCHUMACHER_MISC_VERSION).tar.bz2
+XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-screen-cyrillic/Config.in b/package/x11r7/fonts/xfont_font-screen-cyrillic/Config.in
new file mode 100644
index 0000000..a1f02d0
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-screen-cyrillic/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC
+	bool "font-screen-cyrillic"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/fonts/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
new file mode 100644
index 0000000..7db1b53
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-screen-cyrillic -- No description available
+#
+################################################################################
+
+XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.2
+XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.bz2
+XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-sony-misc/Config.in b/package/x11r7/fonts/xfont_font-sony-misc/Config.in
new file mode 100644
index 0000000..a4ce4ab
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-sony-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_SONY_MISC
+	bool "font-sony-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/fonts/xfont_font-sony-misc/xfont_font-sony-misc.mk
new file mode 100644
index 0000000..53036af
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-sony-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_SONY_MISC_VERSION = 1.0.1
+XFONT_FONT_SONY_MISC_SOURCE = font-sony-misc-$(XFONT_FONT_SONY_MISC_VERSION).tar.bz2
+XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-sun-misc/Config.in b/package/x11r7/fonts/xfont_font-sun-misc/Config.in
new file mode 100644
index 0000000..07603a1
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-sun-misc/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_SUN_MISC
+	bool "font-sun-misc"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/fonts/xfont_font-sun-misc/xfont_font-sun-misc.mk
new file mode 100644
index 0000000..7001e5d
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-sun-misc -- No description available
+#
+################################################################################
+
+XFONT_FONT_SUN_MISC_VERSION = 1.0.1
+XFONT_FONT_SUN_MISC_SOURCE = font-sun-misc-$(XFONT_FONT_SUN_MISC_VERSION).tar.bz2
+XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-util/Config.in b/package/x11r7/fonts/xfont_font-util/Config.in
new file mode 100644
index 0000000..4edeffd
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-util/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_UTIL
+	bool "font-util"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-util/xfont_font-util.mk b/package/x11r7/fonts/xfont_font-util/xfont_font-util.mk
new file mode 100644
index 0000000..680fdc7
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-util/xfont_font-util.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# font-util -- No description available
+#
+################################################################################
+
+XFONT_FONT_UTIL_VERSION = 1.1.1
+XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
+XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
+XFONT_FONT_UTIL_INSTALL_STAGING = YES
+XFONT_FONT_UTIL_INSTALL_TARGET = NO
+
+HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/fonts/xfont_font-winitzki-cyrillic/Config.in b/package/x11r7/fonts/xfont_font-winitzki-cyrillic/Config.in
new file mode 100644
index 0000000..c804441
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-winitzki-cyrillic/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC
+	bool "font-winitzki-cyrillic"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/fonts/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
new file mode 100644
index 0000000..8a55a50
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-winitzki-cyrillic -- No description available
+#
+################################################################################
+
+XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.1
+XFONT_FONT_WINITZKI_CYRILLIC_SOURCE = font-winitzki-cyrillic-$(XFONT_FONT_WINITZKI_CYRILLIC_VERSION).tar.bz2
+XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/fonts/xfont_font-xfree86-type1/Config.in b/package/x11r7/fonts/xfont_font-xfree86-type1/Config.in
new file mode 100644
index 0000000..b7d0587
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-xfree86-type1/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1
+	bool "font-xfree86-type1"
+	help
+	  No description available
diff --git a/package/x11r7/fonts/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/fonts/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
new file mode 100644
index 0000000..999b789
--- /dev/null
+++ b/package/x11r7/fonts/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# font-xfree86-type1 -- No description available
+#
+################################################################################
+
+XFONT_FONT_XFREE86_TYPE1_VERSION = 1.0.2
+XFONT_FONT_XFREE86_TYPE1_SOURCE = font-xfree86-type1-$(XFONT_FONT_XFREE86_TYPE1_VERSION).tar.bz2
+XFONT_FONT_XFREE86_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/libraries/libxcb/Config.in b/package/x11r7/libraries/libxcb/Config.in
new file mode 100644
index 0000000..fb48a02
--- /dev/null
+++ b/package/x11r7/libraries/libxcb/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBXCB
+	bool "libxcb"
+	select BR2_PACKAGE_PTHREAD_STUBS
+	select BR2_PACKAGE_XCB_PROTO
+	select BR2_PACKAGE_XLIB_LIBXDMCP
+	select BR2_PACKAGE_XLIB_LIBXAU
+	help
+		The X protocol C-language Binding (XCB) is a replacement for
+		Xlib featuring a small footprint, latency hiding, direct access
+		to the protocol, improved threading support, and extensibility.
+
+		http://xcb.freedesktop.org/
+
+
diff --git a/package/x11r7/libraries/libxcb/libxcb.mk b/package/x11r7/libraries/libxcb/libxcb.mk
new file mode 100644
index 0000000..8fb3dd3
--- /dev/null
+++ b/package/x11r7/libraries/libxcb/libxcb.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# libxcb
+#
+#############################################################
+LIBXCB_VERSION = 1.5
+LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
+LIBXCB_SITE = http://xcb.freedesktop.org/dist/
+
+LIBXCB_INSTALL_STAGING = YES
+
+LIBXCB_DEPENDENCIES = \
+	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
+	host-xcb-proto host-python host-pkg-config
+LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
+LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
+	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+HOST_LIBXCB_DEPENDENCIES = \
+	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
+	host-xlib_libXau host-python
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
+
diff --git a/package/x11r7/libraries/mesa3d/Config.in b/package/x11r7/libraries/mesa3d/Config.in
new file mode 100644
index 0000000..596eea3
--- /dev/null
+++ b/package/x11r7/libraries/mesa3d/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MESA3D
+	bool "Mesa 3D Graphics Library"
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_EXPAT
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	depends on BR2_PACKAGE_XSERVER_xorg
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Mesa 3D, an open-source implementation of the OpenGL specification.
+
diff --git a/package/x11r7/libraries/mesa3d/mesa3d.mk b/package/x11r7/libraries/mesa3d/mesa3d.mk
new file mode 100644
index 0000000..095d66d
--- /dev/null
+++ b/package/x11r7/libraries/mesa3d/mesa3d.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# mesa3d
+#
+#############################################################
+MESA3D_VERSION:=7.6.1
+MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
+MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
+
+MESA3D_CONF_OPT = --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
+MESA3D_INSTALL_STAGING = YES
+
+MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/pthread-stubs/Config.in b/package/x11r7/libraries/pthread-stubs/Config.in
new file mode 100644
index 0000000..de13e87
--- /dev/null
+++ b/package/x11r7/libraries/pthread-stubs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PTHREAD_STUBS
+	bool "pthread-stubs"
+	help
+		This library provides weak aliases for pthread functions not
+		provided in libc or otherwise available by default.
+
+		http://xcb.freedesktop.org/
+
diff --git a/package/x11r7/libraries/pthread-stubs/pthread-stubs.mk b/package/x11r7/libraries/pthread-stubs/pthread-stubs.mk
new file mode 100644
index 0000000..25b4433
--- /dev/null
+++ b/package/x11r7/libraries/pthread-stubs/pthread-stubs.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# pthread-stubs
+#
+#############################################################
+PTHREAD_STUBS_VERSION = 0.3
+PTHREAD_STUBS_SOURCE = libpthread-stubs-$(PTHREAD_STUBS_VERSION).tar.bz2
+PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
+
+PTHREAD_STUBS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
+
diff --git a/package/x11r7/libraries/xcb-util/Config.in b/package/x11r7/libraries/xcb-util/Config.in
new file mode 100644
index 0000000..cf79327
--- /dev/null
+++ b/package/x11r7/libraries/xcb-util/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XCB_UTIL
+	bool "xcb-util"
+	help
+	  Libraries which sit on top of libxcb, the core X protocol library,
+	  and some of the extension libraries.
+
+	  http://xcb.freedesktop.org/
diff --git a/package/x11r7/libraries/xcb-util/xcb-util.mk b/package/x11r7/libraries/xcb-util/xcb-util.mk
new file mode 100644
index 0000000..0158c9f
--- /dev/null
+++ b/package/x11r7/libraries/xcb-util/xcb-util.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# xcb-util
+#
+#############################################################
+XCB_UTIL_VERSION = 0.3.6
+XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
+XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_DEPENDENCIES = host-gperf
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/libraries/xlib_libFS/Config.in b/package/x11r7/libraries/xlib_libFS/Config.in
new file mode 100644
index 0000000..0c8a729
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libFS/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBFS
+	bool "libFS"
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	help
+	  X.Org FS library
diff --git a/package/x11r7/libraries/xlib_libFS/xlib_libFS.mk b/package/x11r7/libraries/xlib_libFS/xlib_libFS.mk
new file mode 100644
index 0000000..d6334aa
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libFS/xlib_libFS.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libFS -- X.Org FS library
+#
+################################################################################
+
+XLIB_LIBFS_VERSION = 1.0.2
+XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
+XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBFS_INSTALL_STAGING = YES
+XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
+XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libICE/Config.in b/package/x11r7/libraries/xlib_libICE/Config.in
new file mode 100644
index 0000000..d63f935
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libICE/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBICE
+	bool "libICE"
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org ICE library
diff --git a/package/x11r7/libraries/xlib_libICE/xlib_libICE.mk b/package/x11r7/libraries/xlib_libICE/xlib_libICE.mk
new file mode 100644
index 0000000..566e1de
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libICE/xlib_libICE.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libICE -- X.Org ICE library
+#
+################################################################################
+
+XLIB_LIBICE_VERSION = 1.0.6
+XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
+XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBICE_INSTALL_STAGING = YES
+XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libSM/Config.in b/package/x11r7/libraries/xlib_libSM/Config.in
new file mode 100644
index 0000000..ef83b53
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libSM/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBSM
+	bool "libSM"
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org SM library
diff --git a/package/x11r7/libraries/xlib_libSM/xlib_libSM.mk b/package/x11r7/libraries/xlib_libSM/xlib_libSM.mk
new file mode 100644
index 0000000..7ff5830
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libSM/xlib_libSM.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libSM -- X.Org SM library
+#
+################################################################################
+
+XLIB_LIBSM_VERSION = 1.1.1
+XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
+XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBSM_INSTALL_STAGING = YES
+XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
+XLIB_LIBSM_CONF_OPT = --without-libuuid
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libX11/Config.in b/package/x11r7/libraries/xlib_libX11/Config.in
new file mode 100644
index 0000000..e1189ff
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libX11/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XLIB_LIBX11
+	bool "libX11"
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XLIB_LIBXDMCP
+	select BR2_PACKAGE_XPROTO_KBPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
+	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
+	select BR2_PACKAGE_XPROTO_XCMISCPROTO
+	help
+	  X.Org X11 library
diff --git a/package/x11r7/libraries/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch b/package/x11r7/libraries/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
new file mode 100644
index 0000000..9c4eae2
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
@@ -0,0 +1,35 @@
+[patch]: configure: add --with-keysymdef argument for cross compilation
+
+Based on a similar patch from Openembedded.
+
+The libX11 configure script hardcodes the location to keysymdef.h as
+<prefix>/include/X11/keysymdef.h, which is fine for native compilation,
+but breaks with cross compilation as that directory is a location on
+the target, not the build host.
+
+Fix it by providing an explicit --with-keysymdef=<full-path-to-file>.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>Index: libX11-1.1.5/configure.ac
+===================================================================
+Index: xlib_libX11-1.3.2/configure.ac
+===================================================================
+--- xlib_libX11-1.3.2.orig/configure.ac	2009-10-23 22:55:03.000000000 +0200
++++ xlib_libX11-1.3.2/configure.ac	2010-05-04 16:26:39.000000000 +0200
+@@ -280,8 +280,15 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysymdef.h])
+-dir=`pkg-config --variable=includedir xproto`
+-KEYSYMDEF="$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++      AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
++      KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++      dir=`pkg-config --variable=includedir xproto`
++      KEYSYMDEF="$dir/X11/keysymdef.h"
++fi
++
+ if test -f "$KEYSYMDEF"; then
+         AC_MSG_RESULT([$KEYSYMDEF])
+ else
diff --git a/package/x11r7/libraries/xlib_libX11/xlib_libX11.mk b/package/x11r7/libraries/xlib_libX11/xlib_libX11.mk
new file mode 100644
index 0000000..e017fea
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libX11/xlib_libX11.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# xlib_libX11 -- X.Org X11 library
+#
+################################################################################
+
+XLIB_LIBX11_VERSION = 1.3.2
+XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
+XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBX11_AUTORECONF = YES
+XLIB_LIBX11_INSTALL_STAGING = YES
+XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto host-xproto_xproto
+XLIB_LIBX11_CONF_OPT = \
+	--disable-malloc0returnsnull \
+	--with-xcb \
+	--with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h \
+	--disable-specs
+
+HOST_XLIB_LIBX11_CONF_OPT = \
+	--disable-specs
+
+HOST_XLIB_LIBX11_DEPENDENCIES = host-xproto_xextproto host-libxcb host-xutil_util-macros host-xlib_xtrans host-xlib_libXau host-xlib_libXdmcp host-xproto_kbproto host-xproto_xproto host-xproto_xextproto host-xproto_inputproto host-xproto_xf86bigfontproto xproto_bigreqsproto host-xproto_xcmiscproto
+
+# src/util/makekeys is executed at build time to generate ks_tables.h, so
+# it should get compiled for the host. The libX11 makefile unfortunately
+# doesn't know about cross compilation so this doesn't work.
+# Long term, we should probably teach it about HOSTCC / HOST_CFLAGS, but for
+# now simply disable the src/util Makefile and build makekeys by hand in
+# advance
+define XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
+	echo '' > $(@D)/src/util/Makefile.am
+endef
+
+XLIB_LIBX11_POST_EXTRACT_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
+
+define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
+	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) -o makekeys makekeys.c
+endef
+
+XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libXScrnSaver/Config.in b/package/x11r7/libraries/xlib_libXScrnSaver/Config.in
new file mode 100644
index 0000000..5df9a00
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXScrnSaver/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBXSCRNSAVER
+	bool "libXScrnSaver"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
+	help
+	  X.Org XScrnSaver library
diff --git a/package/x11r7/libraries/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/libraries/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
new file mode 100644
index 0000000..00cc452
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXScrnSaver -- X.Org XScrnSaver library
+#
+################################################################################
+
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.0
+XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
+XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
+XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
+XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXau/Config.in b/package/x11r7/libraries/xlib_libXau/Config.in
new file mode 100644
index 0000000..a220f01
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXau/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXAU
+	bool "libXau"
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	help
+	  X.Org Xau library
diff --git a/package/x11r7/libraries/xlib_libXau/xlib_libXau.mk b/package/x11r7/libraries/xlib_libXau/xlib_libXau.mk
new file mode 100644
index 0000000..f7eb3bd
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXau/xlib_libXau.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xlib_libXau -- X.Org Xau library
+#
+################################################################################
+
+XLIB_LIBXAU_VERSION = 1.0.5
+XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
+XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXAU_INSTALL_STAGING = YES
+XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
+
+HOST_XLIB_LIBXAU_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libXaw/Config.in b/package/x11r7/libraries/xlib_libXaw/Config.in
new file mode 100644
index 0000000..1c10bc0
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXaw/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXAW
+	bool "libXaw"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXPM
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XLIB_LIBXP
+	help
+	  X.Org Xaw library
diff --git a/package/x11r7/libraries/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/libraries/xlib_libXaw/xlib_libXaw.mk
new file mode 100644
index 0000000..1142c76
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXaw/xlib_libXaw.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXaw -- X.Org Xaw library
+#
+################################################################################
+
+XLIB_LIBXAW_VERSION = 1.0.7
+XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
+XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXAW_INSTALL_STAGING = YES
+XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
+XLIB_LIBXAW_CONF_OPT = --disable-docs
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXcomposite/Config.in b/package/x11r7/libraries/xlib_libXcomposite/Config.in
new file mode 100644
index 0000000..14da977
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXcomposite/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	bool "libXcomposite"
+	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xcomposite library
diff --git a/package/x11r7/libraries/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/libraries/xlib_libXcomposite/xlib_libXcomposite.mk
new file mode 100644
index 0000000..919d6fc
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libXcomposite -- X.Org Xcomposite library
+#
+################################################################################
+
+XLIB_LIBXCOMPOSITE_VERSION = 0.4.1
+XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
+XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
+XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXcursor/Config.in b/package/x11r7/libraries/xlib_libXcursor/Config.in
new file mode 100644
index 0000000..6519cc7
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXcursor/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXCURSOR
+	bool "libXcursor"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xcursor library
diff --git a/package/x11r7/libraries/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/libraries/xlib_libXcursor/xlib_libXcursor.mk
new file mode 100644
index 0000000..3c72bbb
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXcursor/xlib_libXcursor.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xlib_libXcursor -- X.Org Xcursor library
+#
+################################################################################
+
+XLIB_LIBXCURSOR_VERSION = 1.1.10
+XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
+XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCURSOR_INSTALL_STAGING = YES
+XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
+
+HOST_XLIB_LIBXCURSOR_DEPENDENCIES = host-xlib_libX11 host-xlib_libXfixes host-xlib_libXrender host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libXdamage/Config.in b/package/x11r7/libraries/xlib_libXdamage/Config.in
new file mode 100644
index 0000000..2427486
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXdamage/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXDAMAGE
+	bool "libXdamage"
+	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xdamage library
diff --git a/package/x11r7/libraries/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/libraries/xlib_libXdamage/xlib_libXdamage.mk
new file mode 100644
index 0000000..9f10e56
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXdamage/xlib_libXdamage.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libXdamage -- X.Org Xdamage library
+#
+################################################################################
+
+XLIB_LIBXDAMAGE_VERSION = 1.1.2
+XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
+XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
+XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXdmcp/Config.in b/package/x11r7/libraries/xlib_libXdmcp/Config.in
new file mode 100644
index 0000000..218ff15
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXdmcp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXDMCP
+	bool "libXdmcp"
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xdmcp library
diff --git a/package/x11r7/libraries/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/libraries/xlib_libXdmcp/xlib_libXdmcp.mk
new file mode 100644
index 0000000..6f513cf
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xlib_libXdmcp -- X.Org Xdmcp library
+#
+################################################################################
+
+XLIB_LIBXDMCP_VERSION = 1.0.3
+XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
+XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXDMCP_INSTALL_STAGING = YES
+XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
+
+HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libXext/Config.in b/package/x11r7/libraries/xlib_libXext/Config.in
new file mode 100644
index 0000000..823a165
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXext/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBXEXT
+	bool "libXext"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xext library
diff --git a/package/x11r7/libraries/xlib_libXext/xlib_libXext.mk b/package/x11r7/libraries/xlib_libXext/xlib_libXext.mk
new file mode 100644
index 0000000..2cdffa6
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXext/xlib_libXext.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXext -- X.Org Xext library
+#
+################################################################################
+
+XLIB_LIBXEXT_VERSION = 1.1.1
+XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
+XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXEXT_INSTALL_STAGING = YES
+XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
+XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXfixes/Config.in b/package/x11r7/libraries/xlib_libXfixes/Config.in
new file mode 100644
index 0000000..9bbabb2
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXfixes/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXFIXES
+	bool "libXfixes"
+	select BR2_PACKAGE_XPROTO_FIXESPROTO
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_XEXTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xfixes library
diff --git a/package/x11r7/libraries/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/libraries/xlib_libXfixes/xlib_libXfixes.mk
new file mode 100644
index 0000000..2d8b7fa
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXfixes/xlib_libXfixes.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xlib_libXfixes -- X.Org Xfixes library
+#
+################################################################################
+
+XLIB_LIBXFIXES_VERSION = 4.0.4
+XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
+XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFIXES_INSTALL_STAGING = YES
+XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
+
+HOST_XLIB_LIBXFIXES_DEPENDENCIES = host-xproto_fixesproto host-xlib_libX11 host-xproto_xextproto host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libXfont/Config.in b/package/x11r7/libraries/xlib_libXfont/Config.in
new file mode 100644
index 0000000..407a099
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXfont/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXFONT
+	bool "libXfont"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_XLIB_LIBFONTENC
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XFONT_ENCODINGS
+	help
+	  X.Org Xfont library
diff --git a/package/x11r7/libraries/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/libraries/xlib_libXfont/xlib_libXfont.mk
new file mode 100644
index 0000000..303992f
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXfont/xlib_libXfont.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# xlib_libXfont -- X.Org Xfont library
+#
+################################################################################
+
+XLIB_LIBXFONT_VERSION = 1.4.1
+XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
+XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFONT_AUTORECONF = YES
+XLIB_LIBXFONT_INSTALL_STAGING = YES
+XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
+XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
+
+HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
+HOST_XLIB_LIBXFONT_DEPENDENCIES = host-freetype host-xlib_libfontenc host-xlib_xtrans host-xproto_fontcacheproto host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libXfontcache/Config.in b/package/x11r7/libraries/xlib_libXfontcache/Config.in
new file mode 100644
index 0000000..3a20451
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXfontcache/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBXFONTCACHE
+	bool "libXfontcache"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
+	help
+	  X.Org Xfontcache library
diff --git a/package/x11r7/libraries/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/libraries/xlib_libXfontcache/xlib_libXfontcache.mk
new file mode 100644
index 0000000..1b1d4db
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXfontcache -- X.Org Xfontcache library
+#
+################################################################################
+
+XLIB_LIBXFONTCACHE_VERSION = 1.0.5
+XLIB_LIBXFONTCACHE_SOURCE = libXfontcache-$(XLIB_LIBXFONTCACHE_VERSION).tar.bz2
+XLIB_LIBXFONTCACHE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
+XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
+XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXft/Config.in b/package/x11r7/libraries/xlib_libXft/Config.in
new file mode 100644
index 0000000..6eef170
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXft/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXFT
+	bool "libXft"
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xft library
diff --git a/package/x11r7/libraries/xlib_libXft/xlib_libXft.mk b/package/x11r7/libraries/xlib_libXft/xlib_libXft.mk
new file mode 100644
index 0000000..44ddcbe
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXft/xlib_libXft.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXft -- X.Org Xft library
+#
+################################################################################
+
+XLIB_LIBXFT_VERSION = 2.1.14
+XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
+XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFT_AUTORECONF = YES
+XLIB_LIBXFT_INSTALL_STAGING = YES
+XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXi/Config.in b/package/x11r7/libraries/xlib_libXi/Config.in
new file mode 100644
index 0000000..ca5ab59
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXI
+	bool "libXi"
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xi library
diff --git a/package/x11r7/libraries/xlib_libXi/xlib_libXi.mk b/package/x11r7/libraries/xlib_libXi/xlib_libXi.mk
new file mode 100644
index 0000000..8c14007
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXi/xlib_libXi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXi -- X.Org Xi library
+#
+################################################################################
+
+XLIB_LIBXI_VERSION = 1.3
+XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
+XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXI_INSTALL_STAGING = YES
+XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
+XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXinerama/Config.in b/package/x11r7/libraries/xlib_libXinerama/Config.in
new file mode 100644
index 0000000..5a79b4e
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXinerama/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBXINERAMA
+	bool "libXinerama"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	help
+	  X.Org Xinerama library
diff --git a/package/x11r7/libraries/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/libraries/xlib_libXinerama/xlib_libXinerama.mk
new file mode 100644
index 0000000..aadf129
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXinerama/xlib_libXinerama.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXinerama -- X.Org Xinerama library
+#
+################################################################################
+
+XLIB_LIBXINERAMA_VERSION = 1.1
+XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
+XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXINERAMA_INSTALL_STAGING = YES
+XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
+XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXmu/Config.in b/package/x11r7/libraries/xlib_libXmu/Config.in
new file mode 100644
index 0000000..ed239dc
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXmu/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXMU
+	bool "libXmu"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xmu library
diff --git a/package/x11r7/libraries/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/libraries/xlib_libXmu/xlib_libXmu.mk
new file mode 100644
index 0000000..ad0d49d
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXmu/xlib_libXmu.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libXmu -- X.Org Xmu library
+#
+################################################################################
+
+XLIB_LIBXMU_VERSION = 1.0.5
+XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
+XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXMU_INSTALL_STAGING = YES
+XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXp/Config.in b/package/x11r7/libraries/xlib_libXp/Config.in
new file mode 100644
index 0000000..532d8ac
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXP
+	bool "libXp"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_PRINTPROTO
+	help
+	  X.Org Xp library
diff --git a/package/x11r7/libraries/xlib_libXp/xlib_libXp.mk b/package/x11r7/libraries/xlib_libXp/xlib_libXp.mk
new file mode 100644
index 0000000..1df392f
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXp/xlib_libXp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXp -- X.Org Xp library
+#
+################################################################################
+
+XLIB_LIBXP_VERSION = 1.0.0
+XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
+XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXP_INSTALL_STAGING = YES
+XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
+XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXpm/Config.in b/package/x11r7/libraries/xlib_libXpm/Config.in
new file mode 100644
index 0000000..528498c
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXpm/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXPM
+	bool "libXpm"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xpm library
diff --git a/package/x11r7/libraries/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/libraries/xlib_libXpm/xlib_libXpm.mk
new file mode 100644
index 0000000..6819f57
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXpm/xlib_libXpm.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libXpm -- X.Org Xpm library
+#
+################################################################################
+
+XLIB_LIBXPM_VERSION = 3.5.8
+XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
+XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPM_INSTALL_STAGING = YES
+XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXprintAppUtil/Config.in b/package/x11r7/libraries/xlib_libXprintAppUtil/Config.in
new file mode 100644
index 0000000..351675a
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXprintAppUtil/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL
+	bool "libXprintAppUtil"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXP
+	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	help
+	  X.Org XprintAppUtil library
diff --git a/package/x11r7/libraries/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk b/package/x11r7/libraries/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
new file mode 100644
index 0000000..f942626
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libXprintAppUtil -- X.Org XprintAppUtil library
+#
+################################################################################
+
+XLIB_LIBXPRINTAPPUTIL_VERSION = 1.0.1
+XLIB_LIBXPRINTAPPUTIL_SOURCE = libXprintAppUtil-$(XLIB_LIBXPRINTAPPUTIL_VERSION).tar.bz2
+XLIB_LIBXPRINTAPPUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPRINTAPPUTIL_INSTALL_STAGING = YES
+XLIB_LIBXPRINTAPPUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXprintUtil/Config.in b/package/x11r7/libraries/xlib_libXprintUtil/Config.in
new file mode 100644
index 0000000..1f397f4
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXprintUtil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	bool "libXprintUtil"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXP
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XPROTO_PRINTPROTO
+	help
+	  X.Org XprintUtil library
diff --git a/package/x11r7/libraries/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/libraries/xlib_libXprintUtil/xlib_libXprintUtil.mk
new file mode 100644
index 0000000..b693b28
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXprintUtil/xlib_libXprintUtil.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libXprintUtil -- X.Org XprintUtil library
+#
+################################################################################
+
+XLIB_LIBXPRINTUTIL_VERSION = 1.0.1
+XLIB_LIBXPRINTUTIL_SOURCE = libXprintUtil-$(XLIB_LIBXPRINTUTIL_VERSION).tar.bz2
+XLIB_LIBXPRINTUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
+XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXrandr/Config.in b/package/x11r7/libraries/xlib_libXrandr/Config.in
new file mode 100644
index 0000000..3b3ebd5
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXrandr/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXRANDR
+	bool "libXrandr"
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xrandr library
diff --git a/package/x11r7/libraries/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/libraries/xlib_libXrandr/xlib_libXrandr.mk
new file mode 100644
index 0000000..038494b
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXrandr/xlib_libXrandr.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXrandr -- X.Org Xrandr library
+#
+################################################################################
+
+XLIB_LIBXRANDR_VERSION = 1.3.0
+XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
+XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRANDR_INSTALL_STAGING = YES
+XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
+XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXrender/Config.in b/package/x11r7/libraries/xlib_libXrender/Config.in
new file mode 100644
index 0000000..c723e4d
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXrender/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBXRENDER
+	bool "libXrender"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xrender library
diff --git a/package/x11r7/libraries/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/libraries/xlib_libXrender/xlib_libXrender.mk
new file mode 100644
index 0000000..9a2abe3
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXrender/xlib_libXrender.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# xlib_libXrender -- X.Org Xrender library
+#
+################################################################################
+
+XLIB_LIBXRENDER_VERSION = 0.9.5
+XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
+XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRENDER_INSTALL_STAGING = YES
+XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
+XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
+
+HOST_XLIB_LIBXRENDER_DEPENDENCIES = host-xlib_libX11 host-xproto_renderproto host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libXres/Config.in b/package/x11r7/libraries/xlib_libXres/Config.in
new file mode 100644
index 0000000..39abbbf
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXres/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXRES
+	bool "libXres"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org XRes library
diff --git a/package/x11r7/libraries/xlib_libXres/xlib_libXres.mk b/package/x11r7/libraries/xlib_libXres/xlib_libXres.mk
new file mode 100644
index 0000000..79c3bcf
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXres/xlib_libXres.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXres -- X.Org XRes library
+#
+################################################################################
+
+XLIB_LIBXRES_VERSION = 1.0.4
+XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
+XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXRES_INSTALL_STAGING = YES
+XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
+XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXt/Config.in b/package/x11r7/libraries/xlib_libXt/Config.in
new file mode 100644
index 0000000..6557e20
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXt/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXT
+	bool "libXt"
+	select BR2_PACKAGE_XLIB_LIBSM
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_KBPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XCB_PROTO
+	select BR2_PACKAGE_LIBXCB
+	help
+	  X.Org Xt library
diff --git a/package/x11r7/libraries/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch b/package/x11r7/libraries/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
new file mode 100644
index 0000000..fc5ea7d
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
@@ -0,0 +1,96 @@
+From da5ba611fbff6f939a7cec9ca41fa7df0f76a197 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Cardona?= <remi@gentoo.org>
+Date: Thu, 5 Nov 2009 11:55:22 +0100
+Subject: [PATCH] fix cross-compile again
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+makestrs should always be built for the target arch. When cross-compiling,
+create a native version "xmakestrs" which will always be noinst, and use it
+to generate the other sources.
+
+This avoids installing a makestrs built for the wrong arch.
+
+Based on this patch :
+http://overlays.gentoo.org/proj/embedded/browser/openmoko/trunk/openmoko-target/x11-libs/libXt/files/libXt-1.0.7-crosscompile-makestr.patch
+
+Signed-off-by: R??mi Cardona <remi@gentoo.org>
+---
+ configure.ac     |    2 ++
+ src/Makefile.am  |    8 +++++++-
+ util/Makefile.am |   15 ++++++++++-----
+ 3 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6a66d45..73bfbc0 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,6 +40,8 @@ AC_PROG_LIBTOOL
+ AM_PROG_CC_C_O
+ XORG_DEFAULT_OPTIONS
+ 
++AM_CONDITIONAL(CROSS_COMPILING, [ test $cross_compiling = yes ])
++
+ if test x"$CC_FOR_BUILD" = x; then
+ 	if test x"$cross_compiling" = xyes; then
+ 		AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
+diff --git a/src/Makefile.am b/src/Makefile.am
+index a43fb22..6b767a7 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -92,12 +92,18 @@ BUILT_FILES = $(BUILT_SOURCE) $(BUILT_HEADER)
+ 
+ STRING_LIST = $(top_srcdir)/util/string.list
+ 
++if CROSS_COMPILING
++MAKESTRS=$(top_builddir)/util/xmakestrs
++else
++MAKESTRS=$(top_builddir)/util/makestrs
++endif
++
+ all-local: $(BUILT_FILES)
+ 
+ $(BUILT_HEADER): $(BUILT_SOURCE)
+ 
+ $(BUILT_SOURCE):
+-	$(top_builddir)/util/makestrs -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
++	$(MAKESTRS) -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
+ 	mkdir -p $(top_builddir)/src
+ 	mkdir -p $(top_builddir)/include/X11
+ 	cp StringDefs.h $(top_builddir)/include/X11
+diff --git a/util/Makefile.am b/util/Makefile.am
+index d51365e..6853d89 100644
+--- a/util/Makefile.am
++++ b/util/Makefile.am
+@@ -1,13 +1,10 @@
+ if INSTALL_MAKESTRS
+ bin_PROGRAMS = makestrs
++noinst_PROGRAMS = $(MAKESTRS_PROG)
+ else
+-noinst_PROGRAMS = makestrs
++noinst_PROGRAMS = makestrs $(MAKESTRS_PROG)
+ endif
+ 
+-CC = @CC_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST = \
+ 	Shell.ht \
+ 	StrDefs.ct \
+@@ -45,3 +42,11 @@ SUFFIXES = .$(APP_MAN_SUFFIX) .man
+ 
+ .man.$(APP_MAN_SUFFIX):
+ 	$(AM_V_GEN)$(SED) $(MAN_SUBSTS) < $< > $@
++
++if CROSS_COMPILING
++MAKESTRS_PROG=xmakestrs$(EXEEXT)
++
++xmakestrs$(EXEEXT): makestrs.c
++	$(AM_V_GEN)$(CC_FOR_BUILD) $(X11_CFLAGS) $(CPPFLAGS_FOR_BUILD) \
++	$(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ makestrs.c
++endif
+-- 
+1.6.5.2
+
diff --git a/package/x11r7/libraries/xlib_libXt/xlib_libXt.mk b/package/x11r7/libraries/xlib_libXt/xlib_libXt.mk
new file mode 100644
index 0000000..765f0d5
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXt/xlib_libXt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xlib_libXt -- X.Org Xt library
+#
+################################################################################
+
+XLIB_LIBXT_VERSION = 1.0.7
+XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
+XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXT_AUTORECONF = YES
+XLIB_LIBXT_INSTALL_STAGING = YES
+XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
+XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXtst/Config.in b/package/x11r7/libraries/xlib_libXtst/Config.in
new file mode 100644
index 0000000..8853bde
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXtst/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXTST
+	bool "libXtst"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_RECORDPROTO
+	help
+	  X.Org Xtst library
diff --git a/package/x11r7/libraries/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/libraries/xlib_libXtst/xlib_libXtst.mk
new file mode 100644
index 0000000..feab32a
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXtst/xlib_libXtst.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# xlib_libXtst -- X.Org Xtst library
+#
+################################################################################
+
+XLIB_LIBXTST_VERSION = 1.1.0
+XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
+XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXTST_INSTALL_STAGING = YES
+
+XLIB_LIBXTST_DEPENDENCIES = \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXi \
+	xproto_recordproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXv/Config.in b/package/x11r7/libraries/xlib_libXv/Config.in
new file mode 100644
index 0000000..90f07f3
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXV
+	bool "libXv"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xv library
diff --git a/package/x11r7/libraries/xlib_libXv/xlib_libXv.mk b/package/x11r7/libraries/xlib_libXv/xlib_libXv.mk
new file mode 100644
index 0000000..c51e4d0
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXv/xlib_libXv.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXv -- X.Org Xv library
+#
+################################################################################
+
+XLIB_LIBXV_VERSION = 1.0.5
+XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
+XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXV_INSTALL_STAGING = YES
+XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
+XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXvMC/Config.in b/package/x11r7/libraries/xlib_libXvMC/Config.in
new file mode 100644
index 0000000..90c0e74
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXvMC/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XLIB_LIBXVMC
+	bool "libXvMC"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXV
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org XvMC library
diff --git a/package/x11r7/libraries/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/libraries/xlib_libXvMC/xlib_libXvMC.mk
new file mode 100644
index 0000000..725fa1e
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXvMC/xlib_libXvMC.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXvMC -- X.Org XvMC library
+#
+################################################################################
+
+XLIB_LIBXVMC_VERSION = 1.0.5
+XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
+XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXVMC_INSTALL_STAGING = YES
+XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
+XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXxf86dga/Config.in b/package/x11r7/libraries/xlib_libXxf86dga/Config.in
new file mode 100644
index 0000000..5e21502
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXxf86dga/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXXF86DGA
+	bool "libXxf86dga"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xxf86dga library
diff --git a/package/x11r7/libraries/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/libraries/xlib_libXxf86dga/xlib_libXxf86dga.mk
new file mode 100644
index 0000000..515bf51
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXxf86dga -- X.Org Xxf86dga library
+#
+################################################################################
+
+XLIB_LIBXXF86DGA_VERSION = 1.1.1
+XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
+XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
+XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
+XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libXxf86vm/Config.in b/package/x11r7/libraries/xlib_libXxf86vm/Config.in
new file mode 100644
index 0000000..9e32188
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXxf86vm/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXXF86VM
+	bool "libXxf86vm"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org Xxf86vm library
diff --git a/package/x11r7/libraries/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/libraries/xlib_libXxf86vm/xlib_libXxf86vm.mk
new file mode 100644
index 0000000..b7a3292
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libXxf86vm -- X.Org Xxf86vm library
+#
+################################################################################
+
+XLIB_LIBXXF86VM_VERSION = 1.1.0
+XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
+XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXXF86VM_INSTALL_STAGING = YES
+XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
+XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libdmx/Config.in b/package/x11r7/libraries/xlib_libdmx/Config.in
new file mode 100644
index 0000000..879f689
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libdmx/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBDMX
+	bool "libdmx"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_DMXPROTO
+	help
+	  X.Org dmx library
diff --git a/package/x11r7/libraries/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/libraries/xlib_libdmx/xlib_libdmx.mk
new file mode 100644
index 0000000..bd21f22
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libdmx/xlib_libdmx.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libdmx -- X.Org dmx library
+#
+################################################################################
+
+XLIB_LIBDMX_VERSION = 1.1.0
+XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
+XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBDMX_INSTALL_STAGING = YES
+XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
+XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libfontenc/Config.in b/package/x11r7/libraries/xlib_libfontenc/Config.in
new file mode 100644
index 0000000..d2a3023
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libfontenc/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XLIB_LIBFONTENC
+	bool "libfontenc"
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org fontenc library
diff --git a/package/x11r7/libraries/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/libraries/xlib_libfontenc/xlib_libfontenc.mk
new file mode 100644
index 0000000..948e244
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libfontenc/xlib_libfontenc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xlib_libfontenc -- X.Org fontenc library
+#
+################################################################################
+
+XLIB_LIBFONTENC_VERSION = 1.0.5
+XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
+XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBFONTENC_INSTALL_STAGING = YES
+XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
+
+HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_liboldX/Config.in b/package/x11r7/libraries/xlib_liboldX/Config.in
new file mode 100644
index 0000000..e312921
--- /dev/null
+++ b/package/x11r7/libraries/xlib_liboldX/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XLIB_LIBOLDX
+	bool "liboldX"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  X.Org oldX library
diff --git a/package/x11r7/libraries/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/libraries/xlib_liboldX/xlib_liboldX.mk
new file mode 100644
index 0000000..56895ab
--- /dev/null
+++ b/package/x11r7/libraries/xlib_liboldX/xlib_liboldX.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_liboldX -- X.Org oldX library
+#
+################################################################################
+
+XLIB_LIBOLDX_VERSION = 1.0.1
+XLIB_LIBOLDX_SOURCE = liboldX-$(XLIB_LIBOLDX_VERSION).tar.bz2
+XLIB_LIBOLDX_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBOLDX_INSTALL_STAGING = YES
+XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
+XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libpciaccess/Config.in b/package/x11r7/libraries/xlib_libpciaccess/Config.in
new file mode 100644
index 0000000..b53aa31
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libpciaccess/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBPCIACCESS
+	bool "libpciaccess"
+	depends on BR2_LARGEFILE
+	help
+	  X.Org libpciaccess
+
+comment "libpciaccess requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/x11r7/libraries/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/libraries/xlib_libpciaccess/xlib_libpciaccess.mk
new file mode 100644
index 0000000..6c78225
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xlib_libpciaccess -- X.Org pciaccess library
+#
+################################################################################
+
+XLIB_LIBPCIACCESS_VERSION = 0.11.0
+XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
+XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_libxkbfile/Config.in b/package/x11r7/libraries/xlib_libxkbfile/Config.in
new file mode 100644
index 0000000..ccd35fa
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libxkbfile/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXKBFILE
+	bool "libxkbfile"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_KBPROTO
+	help
+	  X.Org xkbfile library
diff --git a/package/x11r7/libraries/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/libraries/xlib_libxkbfile/xlib_libxkbfile.mk
new file mode 100644
index 0000000..d80fa0f
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xlib_libxkbfile -- X.Org xkbfile library
+#
+################################################################################
+
+XLIB_LIBXKBFILE_VERSION = 1.0.6
+XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
+XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXKBFILE_INSTALL_STAGING = YES
+XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
+
+HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xproto_kbproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libraries/xlib_libxkbui/Config.in b/package/x11r7/libraries/xlib_libxkbui/Config.in
new file mode 100644
index 0000000..ceab305
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libxkbui/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XLIB_LIBXKBUI
+	bool "libxkbui"
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XPROTO_KBPROTO
+	help
+	  X.Org xkbui library
diff --git a/package/x11r7/libraries/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/libraries/xlib_libxkbui/xlib_libxkbui.mk
new file mode 100644
index 0000000..d605989
--- /dev/null
+++ b/package/x11r7/libraries/xlib_libxkbui/xlib_libxkbui.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_libxkbui -- X.Org xkbui library
+#
+################################################################################
+
+XLIB_LIBXKBUI_VERSION = 1.0.2
+XLIB_LIBXKBUI_SOURCE = libxkbui-$(XLIB_LIBXKBUI_VERSION).tar.bz2
+XLIB_LIBXKBUI_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXKBUI_INSTALL_STAGING = YES
+XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libraries/xlib_xtrans/Config.in b/package/x11r7/libraries/xlib_xtrans/Config.in
new file mode 100644
index 0000000..7c8bae7
--- /dev/null
+++ b/package/x11r7/libraries/xlib_xtrans/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XLIB_XTRANS
+	bool "xtrans"
+	help
+	  X.Org xtrans library
diff --git a/package/x11r7/libraries/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/libraries/xlib_xtrans/xlib_xtrans.mk
new file mode 100644
index 0000000..a153f4a
--- /dev/null
+++ b/package/x11r7/libraries/xlib_xtrans/xlib_xtrans.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xlib_xtrans -- X.Org xtrans library
+#
+################################################################################
+
+XLIB_XTRANS_VERSION = 1.2.5
+XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
+XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_XTRANS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/libxcb/Config.in b/package/x11r7/libxcb/Config.in
deleted file mode 100644
index fb48a02..0000000
--- a/package/x11r7/libxcb/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_LIBXCB
-	bool "libxcb"
-	select BR2_PACKAGE_PTHREAD_STUBS
-	select BR2_PACKAGE_XCB_PROTO
-	select BR2_PACKAGE_XLIB_LIBXDMCP
-	select BR2_PACKAGE_XLIB_LIBXAU
-	help
-		The X protocol C-language Binding (XCB) is a replacement for
-		Xlib featuring a small footprint, latency hiding, direct access
-		to the protocol, improved threading support, and extensibility.
-
-		http://xcb.freedesktop.org/
-
-
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
deleted file mode 100644
index 8fb3dd3..0000000
--- a/package/x11r7/libxcb/libxcb.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-#############################################################
-#
-# libxcb
-#
-#############################################################
-LIBXCB_VERSION = 1.5
-LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
-LIBXCB_SITE = http://xcb.freedesktop.org/dist/
-
-LIBXCB_INSTALL_STAGING = YES
-
-LIBXCB_DEPENDENCIES = \
-	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
-	host-xcb-proto host-python host-pkg-config
-LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
-	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-
-HOST_LIBXCB_DEPENDENCIES = \
-	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
-	host-xlib_libXau host-python
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
diff --git a/package/x11r7/mcookie/Config.in b/package/x11r7/mcookie/Config.in
deleted file mode 100644
index 2e9cfc7..0000000
--- a/package/x11r7/mcookie/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_MCOOKIE
-	bool "mcookie"
-	help
-	  cookie generator for X server
-
-	  http://www.x.org
diff --git a/package/x11r7/mcookie/mcookie.c b/package/x11r7/mcookie/mcookie.c
deleted file mode 100644
index 902d92f..0000000
--- a/package/x11r7/mcookie/mcookie.c
+++ /dev/null
@@ -1,425 +0,0 @@
-/* mcookie.c -- Generates random numbers for xauth
- * Created: Fri Feb  3 10:42:48 1995 by faith at cs.unc.edu
- * Revised: Fri Mar 19 07:48:01 1999 by faith at acm.org
- * Public Domain 1995, 1999 Rickard E. Faith (faith at acm.org)
- * This program comes with ABSOLUTELY NO WARRANTY.
- * 
- * $Id: mcookie.c,v 1.5 1997/07/06 00:13:06 aebr Exp $
- *
- * This program gathers some random bits of data and used the MD5
- * message-digest algorithm to generate a 128-bit hexadecimal number for
- * use with xauth(1).
- *
- * NOTE: Unless /dev/random is available, this program does not actually
- * gather 128 bits of random information, so the magic cookie generated
- * will be considerably easier to guess than one might expect.
- *
- * 1999-02-22 Arkadiusz Mi?kiewicz <misiek@pld.ORG.PL>
- * - added Native Language Support
- * 1999-03-21 aeb: Added some fragments of code from Colin Plumb.
- *
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include <sys/time.h>
-#include <time.h>
-#include <unistd.h>
-
-#define BUFFERSIZE 4096
-
-
-#ifndef MD5_H
-#define MD5_H
-
-#if defined (__alpha__) || defined (__ia64__) || defined (__x86_64__)
-typedef unsigned int uint32;
-#else
-typedef unsigned long uint32;
-#endif
-
-struct MD5Context {
-	uint32 buf[4];
-	uint32 bits[2];
-	unsigned char in[64];
-};
-
-void MD5Init(struct MD5Context *context);
-void MD5Update(struct MD5Context *context, unsigned char const *buf,
-	       unsigned len);
-void MD5Final(unsigned char digest[16], struct MD5Context *context);
-void MD5Transform(uint32 buf[4], uint32 const in[16]);
-
-/*
- * This is needed to make RSAREF happy on some MS-DOS compilers.
- */
-typedef struct MD5Context MD5_CTX;
-
-#endif /* !MD5_H */
-
-
-
-/*
- * This code implements the MD5 message-digest algorithm.
- * The algorithm is due to Ron Rivest.  This code was
- * written by Colin Plumb in 1993, no copyright is claimed.
- * This code is in the public domain; do with it what you wish.
- *
- * Equivalent code is available from RSA Data Security, Inc.
- * This code has been tested against that, and is equivalent,
- * except that you don't need to include two pages of legalese
- * with every copy.
- *
- * To compute the message digest of a chunk of bytes, declare an
- * MD5Context structure, pass it to MD5Init, call MD5Update as
- * needed on buffers full of bytes, and then call MD5Final, which
- * will fill a supplied 16-byte array with the digest.
- */
-#include <string.h>		/* for memcpy() */
-#include <endian.h>
-
-#if __BYTE_ORDER == __LITTLE_ENDIAN
-#define byteReverse(buf, len)	/* Nothing */
-#else
-void byteReverse(unsigned char *buf, unsigned longs);
-
-/*
- * Note: this code is harmless on little-endian machines.
- */
-void byteReverse(unsigned char *buf, unsigned longs)
-{
-    uint32 t;
-    do {
-	t = (uint32) ((unsigned) buf[3] << 8 | buf[2]) << 16 |
-	    ((unsigned) buf[1] << 8 | buf[0]);
-	*(uint32 *) buf = t;
-	buf += 4;
-    } while (--longs);
-}
-#endif
-
-/*
- * Start MD5 accumulation.  Set bit count to 0 and buffer to mysterious
- * initialization constants.
- */
-void MD5Init(struct MD5Context *ctx)
-{
-    ctx->buf[0] = 0x67452301;
-    ctx->buf[1] = 0xefcdab89;
-    ctx->buf[2] = 0x98badcfe;
-    ctx->buf[3] = 0x10325476;
-
-    ctx->bits[0] = 0;
-    ctx->bits[1] = 0;
-}
-
-/*
- * Update context to reflect the concatenation of another buffer full
- * of bytes.
- */
-void MD5Update(struct MD5Context *ctx, unsigned char const *buf, unsigned len)
-{
-    uint32 t;
-
-    /* Update bitcount */
-
-    t = ctx->bits[0];
-    if ((ctx->bits[0] = t + ((uint32) len << 3)) < t)
-	ctx->bits[1]++;		/* Carry from low to high */
-    ctx->bits[1] += len >> 29;
-
-    t = (t >> 3) & 0x3f;	/* Bytes already in shsInfo->data */
-
-    /* Handle any leading odd-sized chunks */
-
-    if (t) {
-	unsigned char *p = (unsigned char *) ctx->in + t;
-
-	t = 64 - t;
-	if (len < t) {
-	    memcpy(p, buf, len);
-	    return;
-	}
-	memcpy(p, buf, t);
-	byteReverse(ctx->in, 16);
-	MD5Transform(ctx->buf, (uint32 *) ctx->in);
-	buf += t;
-	len -= t;
-    }
-    /* Process data in 64-byte chunks */
-
-    while (len >= 64) {
-	memcpy(ctx->in, buf, 64);
-	byteReverse(ctx->in, 16);
-	MD5Transform(ctx->buf, (uint32 *) ctx->in);
-	buf += 64;
-	len -= 64;
-    }
-
-    /* Handle any remaining bytes of data. */
-
-    memcpy(ctx->in, buf, len);
-}
-
-/*
- * Final wrapup - pad to 64-byte boundary with the bit pattern 
- * 1 0* (64-bit count of bits processed, MSB-first)
- */
-void MD5Final(unsigned char digest[16], struct MD5Context *ctx)
-{
-    unsigned count;
-    unsigned char *p;
-
-    /* Compute number of bytes mod 64 */
-    count = (ctx->bits[0] >> 3) & 0x3F;
-
-    /* Set the first char of padding to 0x80.  This is safe since there is
-       always at least one byte free */
-    p = ctx->in + count;
-    *p++ = 0x80;
-
-    /* Bytes of padding needed to make 64 bytes */
-    count = 64 - 1 - count;
-
-    /* Pad out to 56 mod 64 */
-    if (count < 8) {
-	/* Two lots of padding:  Pad the first block to 64 bytes */
-	memset(p, 0, count);
-	byteReverse(ctx->in, 16);
-	MD5Transform(ctx->buf, (uint32 *) ctx->in);
-
-	/* Now fill the next block with 56 bytes */
-	memset(ctx->in, 0, 56);
-    } else {
-	/* Pad block to 56 bytes */
-	memset(p, 0, count - 8);
-    }
-    byteReverse(ctx->in, 14);
-
-    /* Append length in bits and transform */
-    ((uint32 *) ctx->in)[14] = ctx->bits[0];
-    ((uint32 *) ctx->in)[15] = ctx->bits[1];
-
-    MD5Transform(ctx->buf, (uint32 *) ctx->in);
-    byteReverse((unsigned char *) ctx->buf, 4);
-    memcpy(digest, ctx->buf, 16);
-    memset(ctx, 0, sizeof(ctx));	/* In case it's sensitive */
-}
-
-/* The four core functions - F1 is optimized somewhat */
-
-/* #define F1(x, y, z) (x & y | ~x & z) */
-#define F1(x, y, z) (z ^ (x & (y ^ z)))
-#define F2(x, y, z) F1(z, x, y)
-#define F3(x, y, z) (x ^ y ^ z)
-#define F4(x, y, z) (y ^ (x | ~z))
-
-/* This is the central step in the MD5 algorithm. */
-#define MD5STEP(f, w, x, y, z, data, s) \
-	( w += f(x, y, z) + data,  w = w<<s | w>>(32-s),  w += x )
-
-/*
- * The core of the MD5 algorithm, this alters an existing MD5 hash to
- * reflect the addition of 16 longwords of new data.  MD5Update blocks
- * the data and converts bytes into longwords for this routine.
- */
-void MD5Transform(uint32 buf[4], uint32 const in[16])
-{
-    register uint32 a, b, c, d;
-
-    a = buf[0];
-    b = buf[1];
-    c = buf[2];
-    d = buf[3];
-
-    MD5STEP(F1, a, b, c, d, in[0] + 0xd76aa478, 7);
-    MD5STEP(F1, d, a, b, c, in[1] + 0xe8c7b756, 12);
-    MD5STEP(F1, c, d, a, b, in[2] + 0x242070db, 17);
-    MD5STEP(F1, b, c, d, a, in[3] + 0xc1bdceee, 22);
-    MD5STEP(F1, a, b, c, d, in[4] + 0xf57c0faf, 7);
-    MD5STEP(F1, d, a, b, c, in[5] + 0x4787c62a, 12);
-    MD5STEP(F1, c, d, a, b, in[6] + 0xa8304613, 17);
-    MD5STEP(F1, b, c, d, a, in[7] + 0xfd469501, 22);
-    MD5STEP(F1, a, b, c, d, in[8] + 0x698098d8, 7);
-    MD5STEP(F1, d, a, b, c, in[9] + 0x8b44f7af, 12);
-    MD5STEP(F1, c, d, a, b, in[10] + 0xffff5bb1, 17);
-    MD5STEP(F1, b, c, d, a, in[11] + 0x895cd7be, 22);
-    MD5STEP(F1, a, b, c, d, in[12] + 0x6b901122, 7);
-    MD5STEP(F1, d, a, b, c, in[13] + 0xfd987193, 12);
-    MD5STEP(F1, c, d, a, b, in[14] + 0xa679438e, 17);
-    MD5STEP(F1, b, c, d, a, in[15] + 0x49b40821, 22);
-
-    MD5STEP(F2, a, b, c, d, in[1] + 0xf61e2562, 5);
-    MD5STEP(F2, d, a, b, c, in[6] + 0xc040b340, 9);
-    MD5STEP(F2, c, d, a, b, in[11] + 0x265e5a51, 14);
-    MD5STEP(F2, b, c, d, a, in[0] + 0xe9b6c7aa, 20);
-    MD5STEP(F2, a, b, c, d, in[5] + 0xd62f105d, 5);
-    MD5STEP(F2, d, a, b, c, in[10] + 0x02441453, 9);
-    MD5STEP(F2, c, d, a, b, in[15] + 0xd8a1e681, 14);
-    MD5STEP(F2, b, c, d, a, in[4] + 0xe7d3fbc8, 20);
-    MD5STEP(F2, a, b, c, d, in[9] + 0x21e1cde6, 5);
-    MD5STEP(F2, d, a, b, c, in[14] + 0xc33707d6, 9);
-    MD5STEP(F2, c, d, a, b, in[3] + 0xf4d50d87, 14);
-    MD5STEP(F2, b, c, d, a, in[8] + 0x455a14ed, 20);
-    MD5STEP(F2, a, b, c, d, in[13] + 0xa9e3e905, 5);
-    MD5STEP(F2, d, a, b, c, in[2] + 0xfcefa3f8, 9);
-    MD5STEP(F2, c, d, a, b, in[7] + 0x676f02d9, 14);
-    MD5STEP(F2, b, c, d, a, in[12] + 0x8d2a4c8a, 20);
-
-    MD5STEP(F3, a, b, c, d, in[5] + 0xfffa3942, 4);
-    MD5STEP(F3, d, a, b, c, in[8] + 0x8771f681, 11);
-    MD5STEP(F3, c, d, a, b, in[11] + 0x6d9d6122, 16);
-    MD5STEP(F3, b, c, d, a, in[14] + 0xfde5380c, 23);
-    MD5STEP(F3, a, b, c, d, in[1] + 0xa4beea44, 4);
-    MD5STEP(F3, d, a, b, c, in[4] + 0x4bdecfa9, 11);
-    MD5STEP(F3, c, d, a, b, in[7] + 0xf6bb4b60, 16);
-    MD5STEP(F3, b, c, d, a, in[10] + 0xbebfbc70, 23);
-    MD5STEP(F3, a, b, c, d, in[13] + 0x289b7ec6, 4);
-    MD5STEP(F3, d, a, b, c, in[0] + 0xeaa127fa, 11);
-    MD5STEP(F3, c, d, a, b, in[3] + 0xd4ef3085, 16);
-    MD5STEP(F3, b, c, d, a, in[6] + 0x04881d05, 23);
-    MD5STEP(F3, a, b, c, d, in[9] + 0xd9d4d039, 4);
-    MD5STEP(F3, d, a, b, c, in[12] + 0xe6db99e5, 11);
-    MD5STEP(F3, c, d, a, b, in[15] + 0x1fa27cf8, 16);
-    MD5STEP(F3, b, c, d, a, in[2] + 0xc4ac5665, 23);
-
-    MD5STEP(F4, a, b, c, d, in[0] + 0xf4292244, 6);
-    MD5STEP(F4, d, a, b, c, in[7] + 0x432aff97, 10);
-    MD5STEP(F4, c, d, a, b, in[14] + 0xab9423a7, 15);
-    MD5STEP(F4, b, c, d, a, in[5] + 0xfc93a039, 21);
-    MD5STEP(F4, a, b, c, d, in[12] + 0x655b59c3, 6);
-    MD5STEP(F4, d, a, b, c, in[3] + 0x8f0ccc92, 10);
-    MD5STEP(F4, c, d, a, b, in[10] + 0xffeff47d, 15);
-    MD5STEP(F4, b, c, d, a, in[1] + 0x85845dd1, 21);
-    MD5STEP(F4, a, b, c, d, in[8] + 0x6fa87e4f, 6);
-    MD5STEP(F4, d, a, b, c, in[15] + 0xfe2ce6e0, 10);
-    MD5STEP(F4, c, d, a, b, in[6] + 0xa3014314, 15);
-    MD5STEP(F4, b, c, d, a, in[13] + 0x4e0811a1, 21);
-    MD5STEP(F4, a, b, c, d, in[4] + 0xf7537e82, 6);
-    MD5STEP(F4, d, a, b, c, in[11] + 0xbd3af235, 10);
-    MD5STEP(F4, c, d, a, b, in[2] + 0x2ad7d2bb, 15);
-    MD5STEP(F4, b, c, d, a, in[9] + 0xeb86d391, 21);
-
-    buf[0] += a;
-    buf[1] += b;
-    buf[2] += c;
-    buf[3] += d;
-}
-
-
-
-
-struct rngs {
-   const char *path;
-   int minlength, maxlength;
-} rngs[] = {
-   { "/dev/random",              16,  16 }, /* 16 bytes = 128 bits suffice */
-   { "/proc/interrupts",          0,   0 },
-   { "/proc/slabinfo",            0,   0 },
-   { "/proc/stat",                0,   0 },
-   { "/dev/urandom",             32,  64 },
-};
-#define RNGS (sizeof(rngs)/sizeof(struct rngs))
-
-int Verbose = 0;
-
-/* The basic function to hash a file */
-static off_t
-hash_file(struct MD5Context *ctx, int fd)
-{
-   off_t count = 0;
-   ssize_t r;
-   unsigned char buf[BUFFERSIZE];
-
-   while ((r = read(fd, buf, sizeof(buf))) > 0) {
-      MD5Update(ctx, buf, r);
-      count += r;
-   }
-   /* Separate files with a null byte */
-   buf[0] = 0;
-   MD5Update(ctx, buf, 1);
-   return count;
-}
-
-int main( int argc, char **argv )
-{
-   int               i;
-   struct MD5Context ctx;
-   unsigned char     digest[16];
-   unsigned char     buf[BUFFERSIZE];
-   int               fd;
-   int               c;
-   pid_t             pid;
-   char              *file = NULL;
-   int               r;
-   struct timeval    tv;
-   struct timezone   tz;
-
-   while ((c = getopt( argc, argv, "vf:" )) != -1)
-      switch (c) {
-      case 'v': ++Verbose;     break;
-      case 'f': file = optarg; break;
-      }
-
-   MD5Init( &ctx );
-   
-   gettimeofday( &tv, &tz );
-   MD5Update( &ctx, (unsigned char *)&tv, sizeof( tv ) );
-   pid = getppid();
-   MD5Update( &ctx, (unsigned char *)&pid, sizeof( pid ));
-   pid = getpid();
-   MD5Update( &ctx, (unsigned char *)&pid, sizeof( pid ));
-
-   if (file) {
-      int count = 0;
-      
-      if (file[0] == '-' && !file[1])
-	 fd = fileno(stdin);
-      else
-	 fd = open( file, O_RDONLY );
-
-      if (fd < 0) {
-	 fprintf( stderr, "Could not open %s\n", file );
-      } else {
-         count = hash_file( &ctx, fd );
-	 if (Verbose)
-	    fprintf( stderr, "Got %d bytes from %s\n", count, file );
-
-	 if (file[0] != '-' || file[1]) close( fd );
-      }
-   }
-
-   for (i = 0; i < RNGS; i++) {
-      if ((fd = open( rngs[i].path, O_RDONLY|O_NONBLOCK )) >= 0) {
-	 int count = sizeof(buf);
-
-	 if (rngs[i].maxlength && count > rngs[i].maxlength)
-	    count = rngs[i].maxlength;
-	 r = read( fd, buf, count );
-	 if (r > 0)
-	    MD5Update( &ctx, buf, r );
-	 else
-	    r = 0;
-	 close( fd );
-	 if (Verbose)
-	    fprintf( stderr, "Got %d bytes from %s\n", r, rngs[i].path );
-	 if (rngs[i].minlength && r >= rngs[i].minlength)
-	    break;
-      } else if (Verbose)
-	 fprintf( stderr, "Could not open %s\n", rngs[i].path );
-   }
-
-   MD5Final( digest, &ctx );
-   for (i = 0; i < 16; i++) printf( "%02x", digest[i] );
-   putchar ( '\n' );
-   
-   /*
-    * The following is important for cases like disk full, so shell scripts
-    * can bomb out properly rather than think they succeeded.
-    */
-   if (fflush(stdout) < 0 || fclose(stdout) < 0)
-      return 1;
-
-   return 0;
-}
diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
deleted file mode 100644
index 030dd74..0000000
--- a/package/x11r7/mcookie/mcookie.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-#############################################################
-#
-# mcookie
-#
-#############################################################
-
-# Source included in Buildroot
-MCOOKIE_SOURCE =
-
-define MCOOKIE_EXTRACT_CMDS
-	cp package/x11r7/mcookie/mcookie.c $(@D)/
-endef
-
-define MCOOKIE_BUILD_CMDS
-	(cd $(@D); $(TARGET_CC) -Wall -Os -s mcookie.c -o mcookie)
-endef
-
-define MCOOKIE_INSTALL_TARGET_CMDS
-	install -m 0755 -D $(@D)/mcookie $(TARGET_DIR)/usr/bin/mcookie
-endef
-
-$(eval $(call GENTARGETS))
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
deleted file mode 100644
index 596eea3..0000000
--- a/package/x11r7/mesa3d/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_MESA3D
-	bool "Mesa 3D Graphics Library"
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XPROTO_DRI2PROTO
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_EXPAT
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
-	depends on BR2_PACKAGE_XSERVER_xorg
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Mesa 3D, an open-source implementation of the OpenGL specification.
-
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
deleted file mode 100644
index 095d66d..0000000
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-#############################################################
-#
-# mesa3d
-#
-#############################################################
-MESA3D_VERSION:=7.6.1
-MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
-MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
-
-MESA3D_CONF_OPT = --disable-egl --disable-glu --disable-glw --disable-glut --disable-gallium --with-driver=dri --with-dri-drivers=swrast
-MESA3D_INSTALL_STAGING = YES
-
-MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/other/xdata_xbitmaps/Config.in b/package/x11r7/other/xdata_xbitmaps/Config.in
new file mode 100644
index 0000000..2308cae
--- /dev/null
+++ b/package/x11r7/other/xdata_xbitmaps/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XDATA_XBITMAPS
+	bool "xbitmaps"
+	help
+	  No description available
diff --git a/package/x11r7/other/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/other/xdata_xbitmaps/xdata_xbitmaps.mk
new file mode 100644
index 0000000..b94531b
--- /dev/null
+++ b/package/x11r7/other/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xdata_xbitmaps -- No description available
+#
+################################################################################
+
+XDATA_XBITMAPS_VERSION = 1.1.0
+XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
+XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XBITMAPS_INSTALL_STAGING = YES
+XDATA_XBITMAPS_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/other/xdata_xcursor-themes/Config.in b/package/x11r7/other/xdata_xcursor-themes/Config.in
new file mode 100644
index 0000000..78d1020
--- /dev/null
+++ b/package/x11r7/other/xdata_xcursor-themes/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XDATA_XCURSOR_THEMES
+	bool "xdata_xcursor-themes"
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	help
+	  No description available
diff --git a/package/x11r7/other/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/other/xdata_xcursor-themes/xdata_xcursor-themes.mk
new file mode 100644
index 0000000..c954bec
--- /dev/null
+++ b/package/x11r7/other/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# xdata_xcursor-themes - No description available
+#
+#############################################################
+XDATA_XCURSOR_THEMES_VERSION = 1.0.2
+XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
+XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
+XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
+XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/other/xkeyboard-config/Config.in b/package/x11r7/other/xkeyboard-config/Config.in
new file mode 100644
index 0000000..8e27dac
--- /dev/null
+++ b/package/x11r7/other/xkeyboard-config/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XKEYBOARD_CONFIG
+	bool "xkeyboard-config"
+	select BR2_PACKAGE_XAPP_XKBCOMP
+	help
+	  keyboard configuration database for X
+
+	  http://xlibs.freedesktop.org/xkbdesc
diff --git a/package/x11r7/other/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/other/xkeyboard-config/xkeyboard-config.mk
new file mode 100644
index 0000000..61cd9fc
--- /dev/null
+++ b/package/x11r7/other/xkeyboard-config/xkeyboard-config.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# xkeyboard-config
+#
+#############################################################
+XKEYBOARD_CONFIG_VERSION = 2.0
+XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
+XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
+XKEYBOARD_CONFIG_INSTALL_STAGING = NO
+XKEYBOARD_CONFIG_INSTALL_TARGET = YES
+XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
+
+XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
+
+$(eval $(call AUTOTARGETS))
+
diff --git a/package/x11r7/protocols/xcb-proto/Config.in b/package/x11r7/protocols/xcb-proto/Config.in
new file mode 100644
index 0000000..4a6dfe4
--- /dev/null
+++ b/package/x11r7/protocols/xcb-proto/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XCB_PROTO
+	bool "xcb-proto"
+	help
+		The protocol headers that define XCB.
+
+		http://xcb.freedesktop.org/
+
diff --git a/package/x11r7/protocols/xcb-proto/xcb-proto.mk b/package/x11r7/protocols/xcb-proto/xcb-proto.mk
new file mode 100644
index 0000000..3479a23
--- /dev/null
+++ b/package/x11r7/protocols/xcb-proto/xcb-proto.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# xcb-proto
+#
+#############################################################
+XCB_PROTO_VERSION = 1.6
+XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
+XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
+
+XCB_PROTO_INSTALL_STAGING = YES
+
+XCB_PROTO_DEPENDENCIES = host-python
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
+
diff --git a/package/x11r7/protocols/xproto_applewmproto/Config.in b/package/x11r7/protocols/xproto_applewmproto/Config.in
new file mode 100644
index 0000000..51a5fd5
--- /dev/null
+++ b/package/x11r7/protocols/xproto_applewmproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_APPLEWMPROTO
+	bool "applewmproto"
+	help
+	  No description available
diff --git a/package/x11r7/protocols/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/protocols/xproto_applewmproto/xproto_applewmproto.mk
new file mode 100644
index 0000000..0ba5830
--- /dev/null
+++ b/package/x11r7/protocols/xproto_applewmproto/xproto_applewmproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_applewmproto -- No description available
+#
+################################################################################
+
+XPROTO_APPLEWMPROTO_VERSION = 1.4.1
+XPROTO_APPLEWMPROTO_SOURCE = applewmproto-$(XPROTO_APPLEWMPROTO_VERSION).tar.bz2
+XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
+XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_bigreqsproto/Config.in b/package/x11r7/protocols/xproto_bigreqsproto/Config.in
new file mode 100644
index 0000000..c431ef2
--- /dev/null
+++ b/package/x11r7/protocols/xproto_bigreqsproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_BIGREQSPROTO
+	bool "bigreqsproto"
+	help
+	  X.Org BigReqs protocol headers
diff --git a/package/x11r7/protocols/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/protocols/xproto_bigreqsproto/xproto_bigreqsproto.mk
new file mode 100644
index 0000000..c9ce4cc
--- /dev/null
+++ b/package/x11r7/protocols/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_bigreqsproto -- X.Org BigReqs protocol headers
+#
+################################################################################
+
+XPROTO_BIGREQSPROTO_VERSION = 1.1.0
+XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
+XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
+XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_compositeproto/Config.in b/package/x11r7/protocols/xproto_compositeproto/Config.in
new file mode 100644
index 0000000..136900a
--- /dev/null
+++ b/package/x11r7/protocols/xproto_compositeproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_COMPOSITEPROTO
+	bool "compositeproto"
+	help
+	  X.Org Composite protocol headers
diff --git a/package/x11r7/protocols/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/protocols/xproto_compositeproto/xproto_compositeproto.mk
new file mode 100644
index 0000000..becf87f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_compositeproto/xproto_compositeproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_compositeproto -- X.Org Composite protocol headers
+#
+################################################################################
+
+XPROTO_COMPOSITEPROTO_VERSION = 0.4.1
+XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
+XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
+XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_damageproto/Config.in b/package/x11r7/protocols/xproto_damageproto/Config.in
new file mode 100644
index 0000000..068ed2b
--- /dev/null
+++ b/package/x11r7/protocols/xproto_damageproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_DAMAGEPROTO
+	bool "damageproto"
+	help
+	  X.Org Damage protocol headers
diff --git a/package/x11r7/protocols/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/protocols/xproto_damageproto/xproto_damageproto.mk
new file mode 100644
index 0000000..eb2d0a9
--- /dev/null
+++ b/package/x11r7/protocols/xproto_damageproto/xproto_damageproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_damageproto -- X.Org Damage protocol headers
+#
+################################################################################
+
+XPROTO_DAMAGEPROTO_VERSION = 1.2.0
+XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
+XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
+XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_dmxproto/Config.in b/package/x11r7/protocols/xproto_dmxproto/Config.in
new file mode 100644
index 0000000..dc048b1
--- /dev/null
+++ b/package/x11r7/protocols/xproto_dmxproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_DMXPROTO
+	bool "dmxproto"
+	help
+	  X.Org DMX protocol headers
diff --git a/package/x11r7/protocols/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/protocols/xproto_dmxproto/xproto_dmxproto.mk
new file mode 100644
index 0000000..eb6a4b1
--- /dev/null
+++ b/package/x11r7/protocols/xproto_dmxproto/xproto_dmxproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_dmxproto -- X.Org DMX protocol headers
+#
+################################################################################
+
+XPROTO_DMXPROTO_VERSION = 2.3
+XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
+XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DMXPROTO_INSTALL_STAGING = YES
+XPROTO_DMXPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_dri2proto/Config.in b/package/x11r7/protocols/xproto_dri2proto/Config.in
new file mode 100644
index 0000000..3fe5aa1
--- /dev/null
+++ b/package/x11r7/protocols/xproto_dri2proto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_DRI2PROTO
+	bool "dri2proto"
+	help
+	  X.Org DRI2 protocol headers
diff --git a/package/x11r7/protocols/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/protocols/xproto_dri2proto/xproto_dri2proto.mk
new file mode 100644
index 0000000..5fe2252
--- /dev/null
+++ b/package/x11r7/protocols/xproto_dri2proto/xproto_dri2proto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_dri2proto -- X.Org DRI2 protocol headers
+#
+################################################################################
+
+XPROTO_DRI2PROTO_VERSION = 2.3
+XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
+XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DRI2PROTO_INSTALL_STAGING = YES
+XPROTO_DRI2PROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_fixesproto/Config.in b/package/x11r7/protocols/xproto_fixesproto/Config.in
new file mode 100644
index 0000000..d419fa1
--- /dev/null
+++ b/package/x11r7/protocols/xproto_fixesproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_FIXESPROTO
+	bool "fixesproto"
+	help
+	  X.Org Fixes protocol headers
diff --git a/package/x11r7/protocols/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/protocols/xproto_fixesproto/xproto_fixesproto.mk
new file mode 100644
index 0000000..3ead64f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_fixesproto/xproto_fixesproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_fixesproto -- X.Org Fixes protocol headers
+#
+################################################################################
+
+XPROTO_FIXESPROTO_VERSION = 4.1.1
+XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
+XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_FIXESPROTO_INSTALL_STAGING = YES
+XPROTO_FIXESPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_fontcacheproto/Config.in b/package/x11r7/protocols/xproto_fontcacheproto/Config.in
new file mode 100644
index 0000000..daa6c7f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_fontcacheproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
+	bool "fontcacheproto"
+	help
+	  X.Org Fontcache protocol headers
diff --git a/package/x11r7/protocols/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/protocols/xproto_fontcacheproto/xproto_fontcacheproto.mk
new file mode 100644
index 0000000..5e5ff5e
--- /dev/null
+++ b/package/x11r7/protocols/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_fontcacheproto -- X.Org Fontcache protocol headers
+#
+################################################################################
+
+XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
+XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
+XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
+XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_fontsproto/Config.in b/package/x11r7/protocols/xproto_fontsproto/Config.in
new file mode 100644
index 0000000..b00220c
--- /dev/null
+++ b/package/x11r7/protocols/xproto_fontsproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_FONTSPROTO
+	bool "fontsproto"
+	help
+	  X.Org Fonts protocol headers
diff --git a/package/x11r7/protocols/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/protocols/xproto_fontsproto/xproto_fontsproto.mk
new file mode 100644
index 0000000..33c1a80
--- /dev/null
+++ b/package/x11r7/protocols/xproto_fontsproto/xproto_fontsproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_fontsproto -- X.Org Fonts protocol headers
+#
+################################################################################
+
+XPROTO_FONTSPROTO_VERSION = 2.1.0
+XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
+XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_FONTSPROTO_INSTALL_STAGING = YES
+XPROTO_FONTSPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_glproto/Config.in b/package/x11r7/protocols/xproto_glproto/Config.in
new file mode 100644
index 0000000..28ceb9c
--- /dev/null
+++ b/package/x11r7/protocols/xproto_glproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_GLPROTO
+	bool "glproto"
+	help
+	  X.Org GL protocol headers
diff --git a/package/x11r7/protocols/xproto_glproto/xproto_glproto.mk b/package/x11r7/protocols/xproto_glproto/xproto_glproto.mk
new file mode 100644
index 0000000..d5816cd
--- /dev/null
+++ b/package/x11r7/protocols/xproto_glproto/xproto_glproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_glproto -- X.Org GL protocol headers
+#
+################################################################################
+
+XPROTO_GLPROTO_VERSION = 1.4.10
+XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
+XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_GLPROTO_INSTALL_STAGING = YES
+XPROTO_GLPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_inputproto/Config.in b/package/x11r7/protocols/xproto_inputproto/Config.in
new file mode 100644
index 0000000..fcccb26
--- /dev/null
+++ b/package/x11r7/protocols/xproto_inputproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_INPUTPROTO
+	bool "inputproto"
+	help
+	  X.Org Input protocol headers
diff --git a/package/x11r7/protocols/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/protocols/xproto_inputproto/xproto_inputproto.mk
new file mode 100644
index 0000000..063a7f3
--- /dev/null
+++ b/package/x11r7/protocols/xproto_inputproto/xproto_inputproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_inputproto -- X.Org Input protocol headers
+#
+################################################################################
+
+XPROTO_INPUTPROTO_VERSION = 2.0
+XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
+XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_INPUTPROTO_INSTALL_STAGING = YES
+XPROTO_INPUTPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_kbproto/Config.in b/package/x11r7/protocols/xproto_kbproto/Config.in
new file mode 100644
index 0000000..ce568d7
--- /dev/null
+++ b/package/x11r7/protocols/xproto_kbproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_KBPROTO
+	bool "kbproto"
+	help
+	  X.Org KB protocol headers
diff --git a/package/x11r7/protocols/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/protocols/xproto_kbproto/xproto_kbproto.mk
new file mode 100644
index 0000000..b2478f2
--- /dev/null
+++ b/package/x11r7/protocols/xproto_kbproto/xproto_kbproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_kbproto -- X.Org KB protocol headers
+#
+################################################################################
+
+XPROTO_KBPROTO_VERSION = 1.0.4
+XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
+XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_KBPROTO_INSTALL_STAGING = YES
+XPROTO_KBPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_printproto/Config.in b/package/x11r7/protocols/xproto_printproto/Config.in
new file mode 100644
index 0000000..69e214f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_printproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_PRINTPROTO
+	bool "printproto"
+	help
+	  X.Org Print protocol headers
diff --git a/package/x11r7/protocols/xproto_printproto/xproto_printproto.mk b/package/x11r7/protocols/xproto_printproto/xproto_printproto.mk
new file mode 100644
index 0000000..b500002
--- /dev/null
+++ b/package/x11r7/protocols/xproto_printproto/xproto_printproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_printproto -- X.Org Print protocol headers
+#
+################################################################################
+
+XPROTO_PRINTPROTO_VERSION = 1.0.3
+XPROTO_PRINTPROTO_SOURCE = printproto-$(XPROTO_PRINTPROTO_VERSION).tar.bz2
+XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_PRINTPROTO_INSTALL_STAGING = YES
+XPROTO_PRINTPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_randrproto/Config.in b/package/x11r7/protocols/xproto_randrproto/Config.in
new file mode 100644
index 0000000..097ec8f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_randrproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_RANDRPROTO
+	bool "randrproto"
+	help
+	  X.Org Randr protocol headers
diff --git a/package/x11r7/protocols/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/protocols/xproto_randrproto/xproto_randrproto.mk
new file mode 100644
index 0000000..dd60b7f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_randrproto/xproto_randrproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_randrproto -- X.Org Randr protocol headers
+#
+################################################################################
+
+XPROTO_RANDRPROTO_VERSION = 1.3.1
+XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
+XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RANDRPROTO_INSTALL_STAGING = YES
+XPROTO_RANDRPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_recordproto/Config.in b/package/x11r7/protocols/xproto_recordproto/Config.in
new file mode 100644
index 0000000..9fd5b88
--- /dev/null
+++ b/package/x11r7/protocols/xproto_recordproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_RECORDPROTO
+	bool "recordproto"
+	help
+	  X.Org Record protocol headers
diff --git a/package/x11r7/protocols/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/protocols/xproto_recordproto/xproto_recordproto.mk
new file mode 100644
index 0000000..d37eec7
--- /dev/null
+++ b/package/x11r7/protocols/xproto_recordproto/xproto_recordproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_recordproto -- X.Org Record protocol headers
+#
+################################################################################
+
+XPROTO_RECORDPROTO_VERSION = 1.14
+XPROTO_RECORDPROTO_SOURCE = recordproto-$(XPROTO_RECORDPROTO_VERSION).tar.bz2
+XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RECORDPROTO_INSTALL_STAGING = YES
+XPROTO_RECORDPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_renderproto/Config.in b/package/x11r7/protocols/xproto_renderproto/Config.in
new file mode 100644
index 0000000..5b5806f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_renderproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_RENDERPROTO
+	bool "renderproto"
+	help
+	  X.Org Render protocol headers
diff --git a/package/x11r7/protocols/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/protocols/xproto_renderproto/xproto_renderproto.mk
new file mode 100644
index 0000000..49d2fbc
--- /dev/null
+++ b/package/x11r7/protocols/xproto_renderproto/xproto_renderproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_renderproto -- X.Org Render protocol headers
+#
+################################################################################
+
+XPROTO_RENDERPROTO_VERSION = 0.11
+XPROTO_RENDERPROTO_SOURCE = renderproto-$(XPROTO_RENDERPROTO_VERSION).tar.bz2
+XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RENDERPROTO_INSTALL_STAGING = YES
+XPROTO_RENDERPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_resourceproto/Config.in b/package/x11r7/protocols/xproto_resourceproto/Config.in
new file mode 100644
index 0000000..4aec708
--- /dev/null
+++ b/package/x11r7/protocols/xproto_resourceproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_RESOURCEPROTO
+	bool "resourceproto"
+	help
+	  X.Org Resource protocol headers
diff --git a/package/x11r7/protocols/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/protocols/xproto_resourceproto/xproto_resourceproto.mk
new file mode 100644
index 0000000..134c76c
--- /dev/null
+++ b/package/x11r7/protocols/xproto_resourceproto/xproto_resourceproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_resourceproto -- X.Org Resource protocol headers
+#
+################################################################################
+
+XPROTO_RESOURCEPROTO_VERSION = 1.1.0
+XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
+XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
+XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_scrnsaverproto/Config.in b/package/x11r7/protocols/xproto_scrnsaverproto/Config.in
new file mode 100644
index 0000000..83176a0
--- /dev/null
+++ b/package/x11r7/protocols/xproto_scrnsaverproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
+	bool "scrnsaverproto"
+	help
+	  X.Org ScrnSaver protocol headers
diff --git a/package/x11r7/protocols/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/protocols/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
new file mode 100644
index 0000000..7eee0f8
--- /dev/null
+++ b/package/x11r7/protocols/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_scrnsaverproto -- X.Org ScrnSaver protocol headers
+#
+################################################################################
+
+XPROTO_SCRNSAVERPROTO_VERSION = 1.2.0
+XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
+XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
+XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_videoproto/Config.in b/package/x11r7/protocols/xproto_videoproto/Config.in
new file mode 100644
index 0000000..271c78f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_videoproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_VIDEOPROTO
+	bool "videoproto"
+	help
+	  X.Org Video protocol headers
diff --git a/package/x11r7/protocols/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/protocols/xproto_videoproto/xproto_videoproto.mk
new file mode 100644
index 0000000..1fd61a8
--- /dev/null
+++ b/package/x11r7/protocols/xproto_videoproto/xproto_videoproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_videoproto -- X.Org Video protocol headers
+#
+################################################################################
+
+XPROTO_VIDEOPROTO_VERSION = 2.3.0
+XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
+XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
+XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_windowswmproto/Config.in b/package/x11r7/protocols/xproto_windowswmproto/Config.in
new file mode 100644
index 0000000..d1a36ac
--- /dev/null
+++ b/package/x11r7/protocols/xproto_windowswmproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO
+	bool "windowswmproto"
+	help
+	  No description available
diff --git a/package/x11r7/protocols/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/protocols/xproto_windowswmproto/xproto_windowswmproto.mk
new file mode 100644
index 0000000..4e1ea80
--- /dev/null
+++ b/package/x11r7/protocols/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_windowswmproto -- No description available
+#
+################################################################################
+
+XPROTO_WINDOWSWMPROTO_VERSION = 1.0.4
+XPROTO_WINDOWSWMPROTO_SOURCE = windowswmproto-$(XPROTO_WINDOWSWMPROTO_VERSION).tar.bz2
+XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
+XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_xcmiscproto/Config.in b/package/x11r7/protocols/xproto_xcmiscproto/Config.in
new file mode 100644
index 0000000..f7ba153
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xcmiscproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XCMISCPROTO
+	bool "xcmiscproto"
+	help
+	  X.Org XCMisc protocol headers
diff --git a/package/x11r7/protocols/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/protocols/xproto_xcmiscproto/xproto_xcmiscproto.mk
new file mode 100644
index 0000000..f8e498d
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_xcmiscproto -- X.Org XCMisc protocol headers
+#
+################################################################################
+
+XPROTO_XCMISCPROTO_VERSION = 1.2.0
+XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
+XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
+XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_xextproto/Config.in b/package/x11r7/protocols/xproto_xextproto/Config.in
new file mode 100644
index 0000000..d80d76c
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xextproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XEXTPROTO
+	bool "xextproto"
+	help
+	  X.Org XExt protocol headers
diff --git a/package/x11r7/protocols/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/protocols/xproto_xextproto/xproto_xextproto.mk
new file mode 100644
index 0000000..881ab70
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xextproto/xproto_xextproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_xextproto -- X.Org XExt protocol headers
+#
+################################################################################
+
+XPROTO_XEXTPROTO_VERSION = 7.1.1
+XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
+XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XEXTPROTO_INSTALL_STAGING = YES
+XPROTO_XEXTPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_xf86bigfontproto/Config.in b/package/x11r7/protocols/xproto_xf86bigfontproto/Config.in
new file mode 100644
index 0000000..7af30d0
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86bigfontproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
+	bool "xf86bigfontproto"
+	help
+	  X.Org XF86BigFont protocol headers
diff --git a/package/x11r7/protocols/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/protocols/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
new file mode 100644
index 0000000..87b607e
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_xf86bigfontproto -- X.Org XF86BigFont protocol headers
+#
+################################################################################
+
+XPROTO_XF86BIGFONTPROTO_VERSION = 1.2.0
+XPROTO_XF86BIGFONTPROTO_SOURCE = xf86bigfontproto-$(XPROTO_XF86BIGFONTPROTO_VERSION).tar.bz2
+XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
+XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/protocols/xproto_xf86dgaproto/Config.in b/package/x11r7/protocols/xproto_xf86dgaproto/Config.in
new file mode 100644
index 0000000..7561b8a
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86dgaproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	bool "xf86dgaproto"
+	help
+	  X.Org XF86DGA protocol headers
diff --git a/package/x11r7/protocols/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/protocols/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
new file mode 100644
index 0000000..e8aed3c
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_xf86dgaproto -- X.Org XF86DGA protocol headers
+#
+################################################################################
+
+XPROTO_XF86DGAPROTO_VERSION = 2.1
+XPROTO_XF86DGAPROTO_SOURCE = xf86dgaproto-$(XPROTO_XF86DGAPROTO_VERSION).tar.bz2
+XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
+XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_xf86driproto/Config.in b/package/x11r7/protocols/xproto_xf86driproto/Config.in
new file mode 100644
index 0000000..8aeac87
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86driproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	bool "xf86driproto"
+	help
+	  X.Org XF86DRI protocol headers
diff --git a/package/x11r7/protocols/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/protocols/xproto_xf86driproto/xproto_xf86driproto.mk
new file mode 100644
index 0000000..0eb57f6
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_xf86driproto -- X.Org XF86DRI protocol headers
+#
+################################################################################
+
+XPROTO_XF86DRIPROTO_VERSION = 2.1.0
+XPROTO_XF86DRIPROTO_SOURCE = xf86driproto-$(XPROTO_XF86DRIPROTO_VERSION).tar.bz2
+XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
+XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_xf86rushproto/Config.in b/package/x11r7/protocols/xproto_xf86rushproto/Config.in
new file mode 100644
index 0000000..961c31f
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86rushproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XF86RUSHPROTO
+	bool "xf86rushproto"
+	help
+	  X.Org XF86Rush protocol headers
diff --git a/package/x11r7/protocols/xproto_xf86rushproto/xproto_xf86rushproto.mk b/package/x11r7/protocols/xproto_xf86rushproto/xproto_xf86rushproto.mk
new file mode 100644
index 0000000..577e325
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86rushproto/xproto_xf86rushproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_xf86rushproto -- X.Org XF86Rush protocol headers
+#
+################################################################################
+
+XPROTO_XF86RUSHPROTO_VERSION = 1.1.2
+XPROTO_XF86RUSHPROTO_SOURCE = xf86rushproto-$(XPROTO_XF86RUSHPROTO_VERSION).tar.bz2
+XPROTO_XF86RUSHPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86RUSHPROTO_INSTALL_STAGING = YES
+XPROTO_XF86RUSHPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_xf86vidmodeproto/Config.in b/package/x11r7/protocols/xproto_xf86vidmodeproto/Config.in
new file mode 100644
index 0000000..395c175
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86vidmodeproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	bool "xf86vidmodeproto"
+	help
+	  X.Org XF86VidMode protocol headers
diff --git a/package/x11r7/protocols/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/protocols/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
new file mode 100644
index 0000000..0194070
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_xf86vidmodeproto -- X.Org XF86VidMode protocol headers
+#
+################################################################################
+
+XPROTO_XF86VIDMODEPROTO_VERSION = 2.3
+XPROTO_XF86VIDMODEPROTO_SOURCE = xf86vidmodeproto-$(XPROTO_XF86VIDMODEPROTO_VERSION).tar.bz2
+XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
+XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_xineramaproto/Config.in b/package/x11r7/protocols/xproto_xineramaproto/Config.in
new file mode 100644
index 0000000..12c8e05
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xineramaproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	bool "xineramaproto"
+	help
+	  X.Org Xinerama protocol headers
diff --git a/package/x11r7/protocols/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/protocols/xproto_xineramaproto/xproto_xineramaproto.mk
new file mode 100644
index 0000000..ad2357c
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# xproto_xineramaproto -- X.Org Xinerama protocol headers
+#
+################################################################################
+
+XPROTO_XINERAMAPROTO_VERSION = 1.2
+XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
+XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
+XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/protocols/xproto_xproto/Config.in b/package/x11r7/protocols/xproto_xproto/Config.in
new file mode 100644
index 0000000..a5f88ef
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_XPROTO
+	bool "xproto"
+	help
+	  X.Org xproto protocol headers
diff --git a/package/x11r7/protocols/xproto_xproto/xproto_xproto.mk b/package/x11r7/protocols/xproto_xproto/xproto_xproto.mk
new file mode 100644
index 0000000..8f81d05
--- /dev/null
+++ b/package/x11r7/protocols/xproto_xproto/xproto_xproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_xproto -- X.Org xproto protocol headers
+#
+################################################################################
+
+XPROTO_XPROTO_VERSION = 7.0.16
+XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
+XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XPROTO_INSTALL_STAGING = YES
+XPROTO_XPROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/pthread-stubs/Config.in b/package/x11r7/pthread-stubs/Config.in
deleted file mode 100644
index de13e87..0000000
--- a/package/x11r7/pthread-stubs/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PTHREAD_STUBS
-	bool "pthread-stubs"
-	help
-		This library provides weak aliases for pthread functions not
-		provided in libc or otherwise available by default.
-
-		http://xcb.freedesktop.org/
-
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
deleted file mode 100644
index 25b4433..0000000
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-#############################################################
-#
-# pthread-stubs
-#
-#############################################################
-PTHREAD_STUBS_VERSION = 0.3
-PTHREAD_STUBS_SOURCE = libpthread-stubs-$(PTHREAD_STUBS_VERSION).tar.bz2
-PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
-
-PTHREAD_STUBS_INSTALL_STAGING = YES
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
diff --git a/package/x11r7/utils/mcookie/Config.in b/package/x11r7/utils/mcookie/Config.in
new file mode 100644
index 0000000..2e9cfc7
--- /dev/null
+++ b/package/x11r7/utils/mcookie/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MCOOKIE
+	bool "mcookie"
+	help
+	  cookie generator for X server
+
+	  http://www.x.org
diff --git a/package/x11r7/utils/mcookie/mcookie.c b/package/x11r7/utils/mcookie/mcookie.c
new file mode 100644
index 0000000..902d92f
--- /dev/null
+++ b/package/x11r7/utils/mcookie/mcookie.c
@@ -0,0 +1,425 @@
+/* mcookie.c -- Generates random numbers for xauth
+ * Created: Fri Feb  3 10:42:48 1995 by faith at cs.unc.edu
+ * Revised: Fri Mar 19 07:48:01 1999 by faith at acm.org
+ * Public Domain 1995, 1999 Rickard E. Faith (faith at acm.org)
+ * This program comes with ABSOLUTELY NO WARRANTY.
+ * 
+ * $Id: mcookie.c,v 1.5 1997/07/06 00:13:06 aebr Exp $
+ *
+ * This program gathers some random bits of data and used the MD5
+ * message-digest algorithm to generate a 128-bit hexadecimal number for
+ * use with xauth(1).
+ *
+ * NOTE: Unless /dev/random is available, this program does not actually
+ * gather 128 bits of random information, so the magic cookie generated
+ * will be considerably easier to guess than one might expect.
+ *
+ * 1999-02-22 Arkadiusz Mi?kiewicz <misiek@pld.ORG.PL>
+ * - added Native Language Support
+ * 1999-03-21 aeb: Added some fragments of code from Colin Plumb.
+ *
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <sys/time.h>
+#include <time.h>
+#include <unistd.h>
+
+#define BUFFERSIZE 4096
+
+
+#ifndef MD5_H
+#define MD5_H
+
+#if defined (__alpha__) || defined (__ia64__) || defined (__x86_64__)
+typedef unsigned int uint32;
+#else
+typedef unsigned long uint32;
+#endif
+
+struct MD5Context {
+	uint32 buf[4];
+	uint32 bits[2];
+	unsigned char in[64];
+};
+
+void MD5Init(struct MD5Context *context);
+void MD5Update(struct MD5Context *context, unsigned char const *buf,
+	       unsigned len);
+void MD5Final(unsigned char digest[16], struct MD5Context *context);
+void MD5Transform(uint32 buf[4], uint32 const in[16]);
+
+/*
+ * This is needed to make RSAREF happy on some MS-DOS compilers.
+ */
+typedef struct MD5Context MD5_CTX;
+
+#endif /* !MD5_H */
+
+
+
+/*
+ * This code implements the MD5 message-digest algorithm.
+ * The algorithm is due to Ron Rivest.  This code was
+ * written by Colin Plumb in 1993, no copyright is claimed.
+ * This code is in the public domain; do with it what you wish.
+ *
+ * Equivalent code is available from RSA Data Security, Inc.
+ * This code has been tested against that, and is equivalent,
+ * except that you don't need to include two pages of legalese
+ * with every copy.
+ *
+ * To compute the message digest of a chunk of bytes, declare an
+ * MD5Context structure, pass it to MD5Init, call MD5Update as
+ * needed on buffers full of bytes, and then call MD5Final, which
+ * will fill a supplied 16-byte array with the digest.
+ */
+#include <string.h>		/* for memcpy() */
+#include <endian.h>
+
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+#define byteReverse(buf, len)	/* Nothing */
+#else
+void byteReverse(unsigned char *buf, unsigned longs);
+
+/*
+ * Note: this code is harmless on little-endian machines.
+ */
+void byteReverse(unsigned char *buf, unsigned longs)
+{
+    uint32 t;
+    do {
+	t = (uint32) ((unsigned) buf[3] << 8 | buf[2]) << 16 |
+	    ((unsigned) buf[1] << 8 | buf[0]);
+	*(uint32 *) buf = t;
+	buf += 4;
+    } while (--longs);
+}
+#endif
+
+/*
+ * Start MD5 accumulation.  Set bit count to 0 and buffer to mysterious
+ * initialization constants.
+ */
+void MD5Init(struct MD5Context *ctx)
+{
+    ctx->buf[0] = 0x67452301;
+    ctx->buf[1] = 0xefcdab89;
+    ctx->buf[2] = 0x98badcfe;
+    ctx->buf[3] = 0x10325476;
+
+    ctx->bits[0] = 0;
+    ctx->bits[1] = 0;
+}
+
+/*
+ * Update context to reflect the concatenation of another buffer full
+ * of bytes.
+ */
+void MD5Update(struct MD5Context *ctx, unsigned char const *buf, unsigned len)
+{
+    uint32 t;
+
+    /* Update bitcount */
+
+    t = ctx->bits[0];
+    if ((ctx->bits[0] = t + ((uint32) len << 3)) < t)
+	ctx->bits[1]++;		/* Carry from low to high */
+    ctx->bits[1] += len >> 29;
+
+    t = (t >> 3) & 0x3f;	/* Bytes already in shsInfo->data */
+
+    /* Handle any leading odd-sized chunks */
+
+    if (t) {
+	unsigned char *p = (unsigned char *) ctx->in + t;
+
+	t = 64 - t;
+	if (len < t) {
+	    memcpy(p, buf, len);
+	    return;
+	}
+	memcpy(p, buf, t);
+	byteReverse(ctx->in, 16);
+	MD5Transform(ctx->buf, (uint32 *) ctx->in);
+	buf += t;
+	len -= t;
+    }
+    /* Process data in 64-byte chunks */
+
+    while (len >= 64) {
+	memcpy(ctx->in, buf, 64);
+	byteReverse(ctx->in, 16);
+	MD5Transform(ctx->buf, (uint32 *) ctx->in);
+	buf += 64;
+	len -= 64;
+    }
+
+    /* Handle any remaining bytes of data. */
+
+    memcpy(ctx->in, buf, len);
+}
+
+/*
+ * Final wrapup - pad to 64-byte boundary with the bit pattern 
+ * 1 0* (64-bit count of bits processed, MSB-first)
+ */
+void MD5Final(unsigned char digest[16], struct MD5Context *ctx)
+{
+    unsigned count;
+    unsigned char *p;
+
+    /* Compute number of bytes mod 64 */
+    count = (ctx->bits[0] >> 3) & 0x3F;
+
+    /* Set the first char of padding to 0x80.  This is safe since there is
+       always at least one byte free */
+    p = ctx->in + count;
+    *p++ = 0x80;
+
+    /* Bytes of padding needed to make 64 bytes */
+    count = 64 - 1 - count;
+
+    /* Pad out to 56 mod 64 */
+    if (count < 8) {
+	/* Two lots of padding:  Pad the first block to 64 bytes */
+	memset(p, 0, count);
+	byteReverse(ctx->in, 16);
+	MD5Transform(ctx->buf, (uint32 *) ctx->in);
+
+	/* Now fill the next block with 56 bytes */
+	memset(ctx->in, 0, 56);
+    } else {
+	/* Pad block to 56 bytes */
+	memset(p, 0, count - 8);
+    }
+    byteReverse(ctx->in, 14);
+
+    /* Append length in bits and transform */
+    ((uint32 *) ctx->in)[14] = ctx->bits[0];
+    ((uint32 *) ctx->in)[15] = ctx->bits[1];
+
+    MD5Transform(ctx->buf, (uint32 *) ctx->in);
+    byteReverse((unsigned char *) ctx->buf, 4);
+    memcpy(digest, ctx->buf, 16);
+    memset(ctx, 0, sizeof(ctx));	/* In case it's sensitive */
+}
+
+/* The four core functions - F1 is optimized somewhat */
+
+/* #define F1(x, y, z) (x & y | ~x & z) */
+#define F1(x, y, z) (z ^ (x & (y ^ z)))
+#define F2(x, y, z) F1(z, x, y)
+#define F3(x, y, z) (x ^ y ^ z)
+#define F4(x, y, z) (y ^ (x | ~z))
+
+/* This is the central step in the MD5 algorithm. */
+#define MD5STEP(f, w, x, y, z, data, s) \
+	( w += f(x, y, z) + data,  w = w<<s | w>>(32-s),  w += x )
+
+/*
+ * The core of the MD5 algorithm, this alters an existing MD5 hash to
+ * reflect the addition of 16 longwords of new data.  MD5Update blocks
+ * the data and converts bytes into longwords for this routine.
+ */
+void MD5Transform(uint32 buf[4], uint32 const in[16])
+{
+    register uint32 a, b, c, d;
+
+    a = buf[0];
+    b = buf[1];
+    c = buf[2];
+    d = buf[3];
+
+    MD5STEP(F1, a, b, c, d, in[0] + 0xd76aa478, 7);
+    MD5STEP(F1, d, a, b, c, in[1] + 0xe8c7b756, 12);
+    MD5STEP(F1, c, d, a, b, in[2] + 0x242070db, 17);
+    MD5STEP(F1, b, c, d, a, in[3] + 0xc1bdceee, 22);
+    MD5STEP(F1, a, b, c, d, in[4] + 0xf57c0faf, 7);
+    MD5STEP(F1, d, a, b, c, in[5] + 0x4787c62a, 12);
+    MD5STEP(F1, c, d, a, b, in[6] + 0xa8304613, 17);
+    MD5STEP(F1, b, c, d, a, in[7] + 0xfd469501, 22);
+    MD5STEP(F1, a, b, c, d, in[8] + 0x698098d8, 7);
+    MD5STEP(F1, d, a, b, c, in[9] + 0x8b44f7af, 12);
+    MD5STEP(F1, c, d, a, b, in[10] + 0xffff5bb1, 17);
+    MD5STEP(F1, b, c, d, a, in[11] + 0x895cd7be, 22);
+    MD5STEP(F1, a, b, c, d, in[12] + 0x6b901122, 7);
+    MD5STEP(F1, d, a, b, c, in[13] + 0xfd987193, 12);
+    MD5STEP(F1, c, d, a, b, in[14] + 0xa679438e, 17);
+    MD5STEP(F1, b, c, d, a, in[15] + 0x49b40821, 22);
+
+    MD5STEP(F2, a, b, c, d, in[1] + 0xf61e2562, 5);
+    MD5STEP(F2, d, a, b, c, in[6] + 0xc040b340, 9);
+    MD5STEP(F2, c, d, a, b, in[11] + 0x265e5a51, 14);
+    MD5STEP(F2, b, c, d, a, in[0] + 0xe9b6c7aa, 20);
+    MD5STEP(F2, a, b, c, d, in[5] + 0xd62f105d, 5);
+    MD5STEP(F2, d, a, b, c, in[10] + 0x02441453, 9);
+    MD5STEP(F2, c, d, a, b, in[15] + 0xd8a1e681, 14);
+    MD5STEP(F2, b, c, d, a, in[4] + 0xe7d3fbc8, 20);
+    MD5STEP(F2, a, b, c, d, in[9] + 0x21e1cde6, 5);
+    MD5STEP(F2, d, a, b, c, in[14] + 0xc33707d6, 9);
+    MD5STEP(F2, c, d, a, b, in[3] + 0xf4d50d87, 14);
+    MD5STEP(F2, b, c, d, a, in[8] + 0x455a14ed, 20);
+    MD5STEP(F2, a, b, c, d, in[13] + 0xa9e3e905, 5);
+    MD5STEP(F2, d, a, b, c, in[2] + 0xfcefa3f8, 9);
+    MD5STEP(F2, c, d, a, b, in[7] + 0x676f02d9, 14);
+    MD5STEP(F2, b, c, d, a, in[12] + 0x8d2a4c8a, 20);
+
+    MD5STEP(F3, a, b, c, d, in[5] + 0xfffa3942, 4);
+    MD5STEP(F3, d, a, b, c, in[8] + 0x8771f681, 11);
+    MD5STEP(F3, c, d, a, b, in[11] + 0x6d9d6122, 16);
+    MD5STEP(F3, b, c, d, a, in[14] + 0xfde5380c, 23);
+    MD5STEP(F3, a, b, c, d, in[1] + 0xa4beea44, 4);
+    MD5STEP(F3, d, a, b, c, in[4] + 0x4bdecfa9, 11);
+    MD5STEP(F3, c, d, a, b, in[7] + 0xf6bb4b60, 16);
+    MD5STEP(F3, b, c, d, a, in[10] + 0xbebfbc70, 23);
+    MD5STEP(F3, a, b, c, d, in[13] + 0x289b7ec6, 4);
+    MD5STEP(F3, d, a, b, c, in[0] + 0xeaa127fa, 11);
+    MD5STEP(F3, c, d, a, b, in[3] + 0xd4ef3085, 16);
+    MD5STEP(F3, b, c, d, a, in[6] + 0x04881d05, 23);
+    MD5STEP(F3, a, b, c, d, in[9] + 0xd9d4d039, 4);
+    MD5STEP(F3, d, a, b, c, in[12] + 0xe6db99e5, 11);
+    MD5STEP(F3, c, d, a, b, in[15] + 0x1fa27cf8, 16);
+    MD5STEP(F3, b, c, d, a, in[2] + 0xc4ac5665, 23);
+
+    MD5STEP(F4, a, b, c, d, in[0] + 0xf4292244, 6);
+    MD5STEP(F4, d, a, b, c, in[7] + 0x432aff97, 10);
+    MD5STEP(F4, c, d, a, b, in[14] + 0xab9423a7, 15);
+    MD5STEP(F4, b, c, d, a, in[5] + 0xfc93a039, 21);
+    MD5STEP(F4, a, b, c, d, in[12] + 0x655b59c3, 6);
+    MD5STEP(F4, d, a, b, c, in[3] + 0x8f0ccc92, 10);
+    MD5STEP(F4, c, d, a, b, in[10] + 0xffeff47d, 15);
+    MD5STEP(F4, b, c, d, a, in[1] + 0x85845dd1, 21);
+    MD5STEP(F4, a, b, c, d, in[8] + 0x6fa87e4f, 6);
+    MD5STEP(F4, d, a, b, c, in[15] + 0xfe2ce6e0, 10);
+    MD5STEP(F4, c, d, a, b, in[6] + 0xa3014314, 15);
+    MD5STEP(F4, b, c, d, a, in[13] + 0x4e0811a1, 21);
+    MD5STEP(F4, a, b, c, d, in[4] + 0xf7537e82, 6);
+    MD5STEP(F4, d, a, b, c, in[11] + 0xbd3af235, 10);
+    MD5STEP(F4, c, d, a, b, in[2] + 0x2ad7d2bb, 15);
+    MD5STEP(F4, b, c, d, a, in[9] + 0xeb86d391, 21);
+
+    buf[0] += a;
+    buf[1] += b;
+    buf[2] += c;
+    buf[3] += d;
+}
+
+
+
+
+struct rngs {
+   const char *path;
+   int minlength, maxlength;
+} rngs[] = {
+   { "/dev/random",              16,  16 }, /* 16 bytes = 128 bits suffice */
+   { "/proc/interrupts",          0,   0 },
+   { "/proc/slabinfo",            0,   0 },
+   { "/proc/stat",                0,   0 },
+   { "/dev/urandom",             32,  64 },
+};
+#define RNGS (sizeof(rngs)/sizeof(struct rngs))
+
+int Verbose = 0;
+
+/* The basic function to hash a file */
+static off_t
+hash_file(struct MD5Context *ctx, int fd)
+{
+   off_t count = 0;
+   ssize_t r;
+   unsigned char buf[BUFFERSIZE];
+
+   while ((r = read(fd, buf, sizeof(buf))) > 0) {
+      MD5Update(ctx, buf, r);
+      count += r;
+   }
+   /* Separate files with a null byte */
+   buf[0] = 0;
+   MD5Update(ctx, buf, 1);
+   return count;
+}
+
+int main( int argc, char **argv )
+{
+   int               i;
+   struct MD5Context ctx;
+   unsigned char     digest[16];
+   unsigned char     buf[BUFFERSIZE];
+   int               fd;
+   int               c;
+   pid_t             pid;
+   char              *file = NULL;
+   int               r;
+   struct timeval    tv;
+   struct timezone   tz;
+
+   while ((c = getopt( argc, argv, "vf:" )) != -1)
+      switch (c) {
+      case 'v': ++Verbose;     break;
+      case 'f': file = optarg; break;
+      }
+
+   MD5Init( &ctx );
+   
+   gettimeofday( &tv, &tz );
+   MD5Update( &ctx, (unsigned char *)&tv, sizeof( tv ) );
+   pid = getppid();
+   MD5Update( &ctx, (unsigned char *)&pid, sizeof( pid ));
+   pid = getpid();
+   MD5Update( &ctx, (unsigned char *)&pid, sizeof( pid ));
+
+   if (file) {
+      int count = 0;
+      
+      if (file[0] == '-' && !file[1])
+	 fd = fileno(stdin);
+      else
+	 fd = open( file, O_RDONLY );
+
+      if (fd < 0) {
+	 fprintf( stderr, "Could not open %s\n", file );
+      } else {
+         count = hash_file( &ctx, fd );
+	 if (Verbose)
+	    fprintf( stderr, "Got %d bytes from %s\n", count, file );
+
+	 if (file[0] != '-' || file[1]) close( fd );
+      }
+   }
+
+   for (i = 0; i < RNGS; i++) {
+      if ((fd = open( rngs[i].path, O_RDONLY|O_NONBLOCK )) >= 0) {
+	 int count = sizeof(buf);
+
+	 if (rngs[i].maxlength && count > rngs[i].maxlength)
+	    count = rngs[i].maxlength;
+	 r = read( fd, buf, count );
+	 if (r > 0)
+	    MD5Update( &ctx, buf, r );
+	 else
+	    r = 0;
+	 close( fd );
+	 if (Verbose)
+	    fprintf( stderr, "Got %d bytes from %s\n", r, rngs[i].path );
+	 if (rngs[i].minlength && r >= rngs[i].minlength)
+	    break;
+      } else if (Verbose)
+	 fprintf( stderr, "Could not open %s\n", rngs[i].path );
+   }
+
+   MD5Final( digest, &ctx );
+   for (i = 0; i < 16; i++) printf( "%02x", digest[i] );
+   putchar ( '\n' );
+   
+   /*
+    * The following is important for cases like disk full, so shell scripts
+    * can bomb out properly rather than think they succeeded.
+    */
+   if (fflush(stdout) < 0 || fclose(stdout) < 0)
+      return 1;
+
+   return 0;
+}
diff --git a/package/x11r7/utils/mcookie/mcookie.mk b/package/x11r7/utils/mcookie/mcookie.mk
new file mode 100644
index 0000000..030dd74
--- /dev/null
+++ b/package/x11r7/utils/mcookie/mcookie.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# mcookie
+#
+#############################################################
+
+# Source included in Buildroot
+MCOOKIE_SOURCE =
+
+define MCOOKIE_EXTRACT_CMDS
+	cp package/x11r7/mcookie/mcookie.c $(@D)/
+endef
+
+define MCOOKIE_BUILD_CMDS
+	(cd $(@D); $(TARGET_CC) -Wall -Os -s mcookie.c -o mcookie)
+endef
+
+define MCOOKIE_INSTALL_TARGET_CMDS
+	install -m 0755 -D $(@D)/mcookie $(TARGET_DIR)/usr/bin/mcookie
+endef
+
+$(eval $(call GENTARGETS))
diff --git a/package/x11r7/utils/xutil_makedepend/Config.in b/package/x11r7/utils/xutil_makedepend/Config.in
new file mode 100644
index 0000000..0b091b0
--- /dev/null
+++ b/package/x11r7/utils/xutil_makedepend/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XUTIL_MAKEDEPEND
+	bool "makedepend"
+	help
+	  No description available
diff --git a/package/x11r7/utils/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/utils/xutil_makedepend/xutil_makedepend.mk
new file mode 100644
index 0000000..5c7bfd3
--- /dev/null
+++ b/package/x11r7/utils/xutil_makedepend/xutil_makedepend.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xutil_makedepend -- No description available
+#
+################################################################################
+
+XUTIL_MAKEDEPEND_VERSION = 1.0.2
+XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
+XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
+XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
+XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
+
+HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/utils/xutil_util-macros/Config.in b/package/x11r7/utils/xutil_util-macros/Config.in
new file mode 100644
index 0000000..10b1a59
--- /dev/null
+++ b/package/x11r7/utils/xutil_util-macros/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XUTIL_UTIL_MACROS
+	bool "util-macros"
+	help
+	  No description available
diff --git a/package/x11r7/utils/xutil_util-macros/xutil_util-macros-1.3.0.patch b/package/x11r7/utils/xutil_util-macros/xutil_util-macros-1.3.0.patch
new file mode 100644
index 0000000..de3ff01
--- /dev/null
+++ b/package/x11r7/utils/xutil_util-macros/xutil_util-macros-1.3.0.patch
@@ -0,0 +1,9 @@
+--- xutil_util-macros-1.3.0/xorg-macros.m4.in.orig	2010-01-23 19:23:30.306334212 +0200
++++ xutil_util-macros-1.3.0/xorg-macros.m4.in	2010-01-23 19:25:03.462333685 +0200
+@@ -499,3 +499,6 @@ XORG_RELEASE_VERSION
+ XORG_CHANGELOG
+ XORG_MANPAGE_SECTIONS
+ ]) # XORG_DEFAULT_OPTIONS
++
++# Buildroot stuff
++AC_SUBST(STAGING_DIR)
diff --git a/package/x11r7/utils/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/utils/xutil_util-macros/xutil_util-macros.mk
new file mode 100644
index 0000000..c06cf01
--- /dev/null
+++ b/package/x11r7/utils/xutil_util-macros/xutil_util-macros.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xutil_util-macros -- No description available
+#
+################################################################################
+
+XUTIL_UTIL_MACROS_VERSION = 1.3.0
+XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
+XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
+XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
+XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/x11r7.mk b/package/x11r7/x11r7.mk
index ea0363f..6915f71 100644
--- a/package/x11r7/x11r7.mk
+++ b/package/x11r7/x11r7.mk
@@ -1 +1,2 @@
-include package/x11r7/*/*.mk
+include package/x11r7/*/*/*.mk
+
diff --git a/package/x11r7/xapp_appres/Config.in b/package/x11r7/xapp_appres/Config.in
deleted file mode 100644
index 7574659..0000000
--- a/package/x11r7/xapp_appres/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_APPRES
-	bool "appres"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  list X application resource database
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
deleted file mode 100644
index a91a416..0000000
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_appres -- list X application resource database
-#
-################################################################################
-
-XAPP_APPRES_VERSION = 1.0.1
-XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
-XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_bdftopcf/Config.in b/package/x11r7/xapp_bdftopcf/Config.in
deleted file mode 100644
index a9caffa..0000000
--- a/package/x11r7/xapp_bdftopcf/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_BDFTOPCF
-	bool "bdftopcf"
-	select BR2_PACKAGE_XLIB_LIBXFONT
-	help
-	  X.Org bdftopcf application
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
deleted file mode 100644
index c2d6335..0000000
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xapp_bdftopcf -- X.Org bdftopcf application
-#
-################################################################################
-
-XAPP_BDFTOPCF_VERSION = 1.0.2
-XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
-XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
-HOST_XAPP_BDFTOPCF_DEPENDENCIES = host-xlib_libXfont
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_beforelight/Config.in b/package/x11r7/xapp_beforelight/Config.in
deleted file mode 100644
index 3a11189..0000000
--- a/package/x11r7/xapp_beforelight/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_BEFORELIGHT
-	bool "beforelight"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  screen saver
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
deleted file mode 100644
index d806231..0000000
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_beforelight -- screen saver
-#
-################################################################################
-
-XAPP_BEFORELIGHT_VERSION = 1.0.2
-XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
-XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_bitmap/Config.in b/package/x11r7/xapp_bitmap/Config.in
deleted file mode 100644
index e5bb5e8..0000000
--- a/package/x11r7/xapp_bitmap/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_BITMAP
-	bool "bitmap"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XDATA_XBITMAPS
-	help
-	  X.Org bitmap application
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
deleted file mode 100644
index 5fdc260..0000000
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_bitmap -- X.Org bitmap application
-#
-################################################################################
-
-XAPP_BITMAP_VERSION = 1.0.3
-XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
-XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_editres/Config.in b/package/x11r7/xapp_editres/Config.in
deleted file mode 100644
index 390ec48..0000000
--- a/package/x11r7/xapp_editres/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_EDITRES
-	bool "editres"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  a dynamic resource editor for X Toolkit applications
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
deleted file mode 100644
index 794985f..0000000
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_editres -- a dynamic resource editor for X Toolkit applications
-#
-################################################################################
-
-XAPP_EDITRES_VERSION = 1.0.2
-XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
-XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_fonttosfnt/Config.in b/package/x11r7/xapp_fonttosfnt/Config.in
deleted file mode 100644
index eb35710..0000000
--- a/package/x11r7/xapp_fonttosfnt/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_FONTTOSFNT
-	bool "fonttosfnt"
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBFONTENC
-	help
-	  X.Org fonttosfnt application
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
deleted file mode 100644
index b71819a..0000000
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_fonttosfnt -- X.Org fonttosfnt application
-#
-################################################################################
-
-XAPP_FONTTOSFNT_VERSION = 1.0.3
-XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
-XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_fslsfonts/Config.in b/package/x11r7/xapp_fslsfonts/Config.in
deleted file mode 100644
index 1917d61..0000000
--- a/package/x11r7/xapp_fslsfonts/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_FSLSFONTS
-	bool "fslsfonts"
-	select BR2_PACKAGE_XLIB_LIBFS
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  list fonts served by X font server
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
deleted file mode 100644
index f18424e..0000000
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_fslsfonts -- list fonts served by X font server
-#
-################################################################################
-
-XAPP_FSLSFONTS_VERSION = 1.0.1
-XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
-XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_fstobdf/Config.in b/package/x11r7/xapp_fstobdf/Config.in
deleted file mode 100644
index 0a1f62b..0000000
--- a/package/x11r7/xapp_fstobdf/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_FSTOBDF
-	bool "fstobdf"
-	select BR2_PACKAGE_XLIB_LIBFS
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  generate BDF font from X font server
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
deleted file mode 100644
index 190bab8..0000000
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_fstobdf -- generate BDF font from X font server
-#
-################################################################################
-
-XAPP_FSTOBDF_VERSION = 1.0.2
-XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
-XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_iceauth/Config.in b/package/x11r7/xapp_iceauth/Config.in
deleted file mode 100644
index ce2db98..0000000
--- a/package/x11r7/xapp_iceauth/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_ICEAUTH
-	bool "iceauth"
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  ICE authority file utility
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
deleted file mode 100644
index 93d55dc..0000000
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_iceauth -- ICE authority file utility
-#
-################################################################################
-
-XAPP_ICEAUTH_VERSION = 1.0.3
-XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
-XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_ico/Config.in b/package/x11r7/xapp_ico/Config.in
deleted file mode 100644
index 892f2be..0000000
--- a/package/x11r7/xapp_ico/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_ICO
-	bool "ico"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  animate an icosahedron or other polyhedron
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
deleted file mode 100644
index 1dd4604..0000000
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_ico -- animate an icosahedron or other polyhedron
-#
-################################################################################
-
-XAPP_ICO_VERSION = 1.0.2
-XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
-XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_ICO_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_listres/Config.in b/package/x11r7/xapp_listres/Config.in
deleted file mode 100644
index a3be6b3..0000000
--- a/package/x11r7/xapp_listres/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_LISTRES
-	bool "listres"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  list resources in widgets
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
deleted file mode 100644
index 49224bb..0000000
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_listres -- list resources in widgets
-#
-################################################################################
-
-XAPP_LISTRES_VERSION = 1.0.1
-XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
-XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
deleted file mode 100644
index aec83a0..0000000
--- a/package/x11r7/xapp_luit/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_LUIT
-	bool "luit"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBFONTENC
-	help
-	  Locale and ISO 2022 support for Unicode terminals
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
deleted file mode 100644
index bab8045..0000000
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_luit -- Locale and ISO 2022 support for Unicode terminals
-#
-################################################################################
-
-XAPP_LUIT_VERSION = 1.0.4
-XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
-XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_mkfontdir/Config.in b/package/x11r7/xapp_mkfontdir/Config.in
deleted file mode 100644
index 155772d..0000000
--- a/package/x11r7/xapp_mkfontdir/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_MKFONTDIR
-	bool "mkfontdir"
-	select BR2_PACKAGE_XAPP_MKFONTSCALE
-	help
-	  create an index of X font files in a directory
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
deleted file mode 100644
index 3957ba6..0000000
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xapp_mkfontdir -- create an index of X font files in a directory
-#
-################################################################################
-
-XAPP_MKFONTDIR_VERSION = 1.0.5
-XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
-XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
-HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
deleted file mode 100644
index 540dd45..0000000
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_MKFONTSCALE
-	bool "mkfontscale"
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBFONTENC
-	help
-	  create an index of scalable font files for X
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
deleted file mode 100644
index a4218b0..0000000
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xapp_mkfontscale -- create an index of scalable font files for X
-#
-################################################################################
-
-XAPP_MKFONTSCALE_VERSION = 1.0.7
-XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
-XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
-HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_oclock/Config.in b/package/x11r7/xapp_oclock/Config.in
deleted file mode 100644
index 00cd413..0000000
--- a/package/x11r7/xapp_oclock/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_OCLOCK
-	bool "oclock"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  round X clock
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
deleted file mode 100644
index 1300e63..0000000
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_oclock -- round X clock
-#
-################################################################################
-
-XAPP_OCLOCK_VERSION = 1.0.1
-XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
-XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_rgb/Config.in b/package/x11r7/xapp_rgb/Config.in
deleted file mode 100644
index 038b849..0000000
--- a/package/x11r7/xapp_rgb/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_RGB
-	bool "rgb"
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  uncompile an rgb color-name database
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
deleted file mode 100644
index 0b0d541..0000000
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_rgb -- uncompile an rgb color-name database
-#
-################################################################################
-
-XAPP_RGB_VERSION = 1.0.1
-XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
-XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_RGB_DEPENDENCIES = xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_rstart/Config.in b/package/x11r7/xapp_rstart/Config.in
deleted file mode 100644
index 1bf61b3..0000000
--- a/package/x11r7/xapp_rstart/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_RSTART
-	bool "rstart"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  X.Org rstart application
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
deleted file mode 100644
index cd71890..0000000
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_rstart -- X.Org rstart application
-#
-################################################################################
-
-XAPP_RSTART_VERSION = 1.0.2
-XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
-XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_RSTART_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_scripts/Config.in b/package/x11r7/xapp_scripts/Config.in
deleted file mode 100644
index 691f0e2..0000000
--- a/package/x11r7/xapp_scripts/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_SCRIPTS
-	bool "scripts"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  start an X program on a remote machine
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
deleted file mode 100644
index 3e844b4..0000000
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_scripts -- start an X program on a remote machine
-#
-################################################################################
-
-XAPP_SCRIPTS_VERSION = 1.0.1
-XAPP_SCRIPTS_SOURCE = scripts-$(XAPP_SCRIPTS_VERSION).tar.bz2
-XAPP_SCRIPTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_sessreg/Config.in b/package/x11r7/xapp_sessreg/Config.in
deleted file mode 100644
index 0796bc1..0000000
--- a/package/x11r7/xapp_sessreg/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_SESSREG
-	bool "sessreg"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  manage utmp/wtmp entries for non-init clients
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
deleted file mode 100644
index a1f3f4b..0000000
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_sessreg -- manage utmp/wtmp entries for non-init clients
-#
-################################################################################
-
-XAPP_SESSREG_VERSION = 1.0.5
-XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
-XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_setxkbmap/Config.in b/package/x11r7/xapp_setxkbmap/Config.in
deleted file mode 100644
index 2b1389c..0000000
--- a/package/x11r7/xapp_setxkbmap/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_SETXKBMAP
-	bool "setxkbmap"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	help
-	  Controls the keyboard layout of a running X server.
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
deleted file mode 100644
index f503a47..0000000
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_setxkbmap -- Controls the keyboard layout of a running X server.
-#
-################################################################################
-
-XAPP_SETXKBMAP_VERSION = 1.1.0
-XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
-XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_showfont/Config.in b/package/x11r7/xapp_showfont/Config.in
deleted file mode 100644
index edfab3f..0000000
--- a/package/x11r7/xapp_showfont/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_SHOWFONT
-	bool "showfont"
-	select BR2_PACKAGE_XLIB_LIBFS
-	help
-	  font dumper for X font server
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
deleted file mode 100644
index 4c8b689..0000000
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_showfont -- font dumper for X font server
-#
-################################################################################
-
-XAPP_SHOWFONT_VERSION = 1.0.1
-XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
-XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_smproxy/Config.in b/package/x11r7/xapp_smproxy/Config.in
deleted file mode 100644
index 80ab984..0000000
--- a/package/x11r7/xapp_smproxy/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_SMPROXY
-	bool "smproxy"
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  Session Manager Proxy
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
deleted file mode 100644
index 3082cb1..0000000
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_smproxy -- Session Manager Proxy
-#
-################################################################################
-
-XAPP_SMPROXY_VERSION = 1.0.3
-XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
-XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_twm/Config.in b/package/x11r7/xapp_twm/Config.in
deleted file mode 100644
index 25bf800..0000000
--- a/package/x11r7/xapp_twm/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_TWM
-	bool "twm"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  No description available
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
deleted file mode 100644
index 18de28f..0000000
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_twm -- No description available
-#
-################################################################################
-
-XAPP_TWM_VERSION = 1.0.3
-XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
-XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_viewres/Config.in b/package/x11r7/xapp_viewres/Config.in
deleted file mode 100644
index 32827c8..0000000
--- a/package/x11r7/xapp_viewres/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_VIEWRES
-	bool "viewres"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  graphical class browser for Xt
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
deleted file mode 100644
index 69d8598..0000000
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_viewres -- graphical class browser for Xt
-#
-################################################################################
-
-XAPP_VIEWRES_VERSION = 1.0.1
-XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
-XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_x11perf/Config.in b/package/x11r7/xapp_x11perf/Config.in
deleted file mode 100644
index 0f1eca8..0000000
--- a/package/x11r7/xapp_x11perf/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_X11PERF
-	bool "x11perf"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXFT
-	help
-	  summarize x11perf results
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
deleted file mode 100644
index 6112769..0000000
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_x11perf -- summarize x11perf results
-#
-################################################################################
-
-XAPP_X11PERF_VERSION = 1.5.1
-XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
-XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xauth/Config.in b/package/x11r7/xapp_xauth/Config.in
deleted file mode 100644
index 919fd50..0000000
--- a/package/x11r7/xapp_xauth/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_XAUTH
-	bool "xauth"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAU
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  X authority file utility
diff --git a/package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch b/package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
deleted file mode 100644
index 61c6b14..0000000
--- a/package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- xauth-1.0.3/configure.ac.orig	2007-06-06 22:33:44.000000000 +0200
-+++ xauth-1.0.3/configure.ac	2007-06-06 22:33:57.000000000 +0200
-@@ -40,7 +40,7 @@
- AC_CHECK_HEADERS([net/errno.h])
- 
- # Checks for pkg-config packages
--PKG_CHECK_MODULES(XAUTH, x11 xau xext xmuu)
-+PKG_CHECK_MODULES(XAUTH, x11 xau xext xmuu xcb)
- AC_SUBST(XAUTH_CFLAGS)
- AC_SUBST(XAUTH_LIBS)
- 
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
deleted file mode 100644
index 93977f9..0000000
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xauth -- X authority file utility
-#
-################################################################################
-
-XAPP_XAUTH_VERSION = 1.0.4
-XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
-XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
deleted file mode 100644
index 9756235..0000000
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XBACKLIGHT
-	bool "xbacklight"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	help
-	  xbacklight
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
deleted file mode 100644
index 8be5d37..0000000
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_backlight -- xbacklight
-#
-################################################################################
-
-XAPP_XBACKLIGHT_VERSION = 1.1.1
-XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
-XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xbiff/Config.in b/package/x11r7/xapp_xbiff/Config.in
deleted file mode 100644
index ea4b58a..0000000
--- a/package/x11r7/xapp_xbiff/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XBIFF
-	bool "xbiff"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XDATA_XBITMAPS
-	help
-	  mailbox flag for X
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
deleted file mode 100644
index 78adad9..0000000
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xbiff -- mailbox flag for X
-#
-################################################################################
-
-XAPP_XBIFF_VERSION = 1.0.1
-XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
-XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcalc/Config.in b/package/x11r7/xapp_xcalc/Config.in
deleted file mode 100644
index 2552be0..0000000
--- a/package/x11r7/xapp_xcalc/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XCALC
-	bool "xcalc"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  scientific calculator for X
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
deleted file mode 100644
index beb1313..0000000
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xcalc -- scientific calculator for X
-#
-################################################################################
-
-XAPP_XCALC_VERSION = 1.0.2
-XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
-XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
-XAPP_XCALC_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xclipboard/Config.in b/package/x11r7/xapp_xclipboard/Config.in
deleted file mode 100644
index 941c219..0000000
--- a/package/x11r7/xapp_xclipboard/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XCLIPBOARD
-	bool "xclipboard"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  interchange between cut buffer and selection
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
deleted file mode 100644
index 28a93b9..0000000
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xclipboard -- interchange between cut buffer and selection
-#
-################################################################################
-
-XAPP_XCLIPBOARD_VERSION = 1.0.1
-XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
-XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xclock/Config.in b/package/x11r7/xapp_xclock/Config.in
deleted file mode 100644
index 083a6d1..0000000
--- a/package/x11r7/xapp_xclock/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XAPP_XCLOCK
-	bool "xclock"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXFT
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	help
-	  analog / digital clock for X
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
deleted file mode 100644
index 271b1b0..0000000
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xclock -- analog / digital clock for X
-#
-################################################################################
-
-XAPP_XCLOCK_VERSION = 1.0.3
-XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
-XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcmsdb/Config.in b/package/x11r7/xapp_xcmsdb/Config.in
deleted file mode 100644
index 99c9cbb..0000000
--- a/package/x11r7/xapp_xcmsdb/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XCMSDB
-	bool "xcmsdb"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  Device Color Characterization utility for X Color Management System
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
deleted file mode 100644
index deab354..0000000
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xcmsdb -- Device Color Characterization utility for X Color Management System
-#
-################################################################################
-
-XAPP_XCMSDB_VERSION = 1.0.2
-XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
-XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcursorgen/Config.in b/package/x11r7/xapp_xcursorgen/Config.in
deleted file mode 100644
index c47ec28..0000000
--- a/package/x11r7/xapp_xcursorgen/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XCURSORGEN
-	bool "xcursorgen"
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
-	help
-	  create an X cursor file from a collection of PNG images
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
deleted file mode 100644
index 2634fd5..0000000
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xapp_xcursorgen -- create an X cursor file from a collection of PNG images
-#
-################################################################################
-
-XAPP_XCURSORGEN_VERSION = 1.0.4
-XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
-XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
-
-HOST_XAPP_XCURSORGEN_DEPENDENCIES = host-libpng host-xlib_libX11 host-xlib_libXcursor
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_xdbedizzy/Config.in b/package/x11r7/xapp_xdbedizzy/Config.in
deleted file mode 100644
index 5cba398..0000000
--- a/package/x11r7/xapp_xdbedizzy/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XDBEDIZZY
-	bool "xdbedizzy"
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	help
-	  X.Org xdbedizzy application
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
deleted file mode 100644
index 8559a16..0000000
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xdbedizzy -- X.Org xdbedizzy application
-#
-################################################################################
-
-XAPP_XDBEDIZZY_VERSION = 1.0.2
-XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
-XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp xlib_libXprintUtil
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xditview/Config.in b/package/x11r7/xapp_xditview/Config.in
deleted file mode 100644
index 22944f7..0000000
--- a/package/x11r7/xapp_xditview/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XDITVIEW
-	bool "xditview"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  display ditroff output
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
deleted file mode 100644
index 3b1152d..0000000
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xditview -- display ditroff output
-#
-################################################################################
-
-XAPP_XDITVIEW_VERSION = 1.0.1
-XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
-XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
deleted file mode 100644
index b1c50d5..0000000
--- a/package/x11r7/xapp_xdm/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_XAPP_XDM
-	bool "xdm"
-	select BR2_PACKAGE_XAPP_XINIT
-	select BR2_PACKAGE_XAPP_SESSREG
-	select BR2_PACKAGE_XAPP_XRDB
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXDMCP
-	select BR2_PACKAGE_XLIB_LIBXINERAMA
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org xdm application
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
deleted file mode 100644
index 4dc0d02..0000000
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xdm -- X.Org xdm application
-#
-################################################################################
-
-XAPP_XDM_VERSION = 1.1.6
-XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
-XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
-XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
deleted file mode 100644
index e6ff686..0000000
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_XAPP_XDPYINFO
-	bool "xdpyinfo"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXI
-	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXTST
-	select BR2_PACKAGE_XLIB_LIBXXF86DGA
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_PRINTPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
-	help
-	  display information utility for X
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
deleted file mode 100644
index 9cd6c97..0000000
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xdpyinfo -- display information utility for X
-#
-################################################################################
-
-XAPP_XDPYINFO_VERSION = 1.1.0
-XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
-XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
deleted file mode 100644
index 970bff5..0000000
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XDRIINFO
-	bool "xdriinfo"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	depends on BR2_PACKAGE_MESA3D
-	help
-	  query configuration information of DRI drivers
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
deleted file mode 100644
index 3e7284b..0000000
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xdriinfo -- query configuration information of DRI drivers
-#
-################################################################################
-
-XAPP_XDRIINFO_VERSION = 1.0.3
-XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
-XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
deleted file mode 100644
index 98e230d..0000000
--- a/package/x11r7/xapp_xedit/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XEDIT
-	bool "xedit"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	help
-	  simple text editor for X
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
deleted file mode 100644
index fd4158e..0000000
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xedit -- simple text editor for X
-#
-################################################################################
-
-XAPP_XEDIT_VERSION = 1.0.2
-XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
-XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xev/Config.in b/package/x11r7/xapp_xev/Config.in
deleted file mode 100644
index e2e05b3..0000000
--- a/package/x11r7/xapp_xev/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XEV
-	bool "xev"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  print contents of X events
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
deleted file mode 100644
index 4fa50fe..0000000
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xev -- print contents of X events
-#
-################################################################################
-
-XAPP_XEV_VERSION = 1.0.4
-XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
-XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEV_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
deleted file mode 100644
index a7b7737..0000000
--- a/package/x11r7/xapp_xeyes/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_XEYES
-	bool "xeyes"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXT
-	help
-	  X.Org xeyes application
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
deleted file mode 100644
index 8019aa9..0000000
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xeyes -- X.Org xeyes application
-#
-################################################################################
-
-XAPP_XEYES_VERSION = 1.0.1
-XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
-XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
deleted file mode 100644
index 769ebf6..0000000
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XF86DGA
-	bool "xf86dga"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXXF86DGA
-	help
-	  test program for the XFree86-DGA extension
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
deleted file mode 100644
index 9975916..0000000
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xf86dga -- test program for the XFree86-DGA extension
-#
-################################################################################
-
-XAPP_XF86DGA_VERSION = 1.0.2
-XAPP_XF86DGA_SOURCE = xf86dga-$(XAPP_XF86DGA_VERSION).tar.bz2
-XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXxf86dga
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfd/Config.in b/package/x11r7/xapp_xfd/Config.in
deleted file mode 100644
index f006b1e..0000000
--- a/package/x11r7/xapp_xfd/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_XFD
-	bool "xfd"
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXFT
-	help
-	  X.Org xfd application
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
deleted file mode 100644
index 5717875..0000000
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xfd -- X.Org xfd application
-#
-################################################################################
-
-XAPP_XFD_VERSION = 1.0.1
-XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
-XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfontsel/Config.in b/package/x11r7/xapp_xfontsel/Config.in
deleted file mode 100644
index 0c6aa37..0000000
--- a/package/x11r7/xapp_xfontsel/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XFONTSEL
-	bool "xfontsel"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  point and click selection of X11 font names
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
deleted file mode 100644
index 9556fca..0000000
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xfontsel -- point and click selection of X11 font names
-#
-################################################################################
-
-XAPP_XFONTSEL_VERSION = 1.0.1
-XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
-XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
deleted file mode 100644
index e71d89f..0000000
--- a/package/x11r7/xapp_xfs/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XFS
-	bool "xfs"
-	select BR2_PACKAGE_XLIB_LIBFS
-	select BR2_PACKAGE_XLIB_LIBXFONT
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	help
-	  X font server
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
deleted file mode 100644
index 611b642..0000000
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xfs -- X font server
-#
-################################################################################
-
-XAPP_XFS_VERSION = 1.0.5
-XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
-XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfsinfo/Config.in b/package/x11r7/xapp_xfsinfo/Config.in
deleted file mode 100644
index 84c8ac1..0000000
--- a/package/x11r7/xapp_xfsinfo/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XFSINFO
-	bool "xfsinfo"
-	select BR2_PACKAGE_XLIB_LIBFS
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  X font server information utility
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
deleted file mode 100644
index bef0aed..0000000
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xfsinfo -- X font server information utility
-#
-################################################################################
-
-XAPP_XFSINFO_VERSION = 1.0.1
-XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
-XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xgamma/Config.in b/package/x11r7/xapp_xgamma/Config.in
deleted file mode 100644
index b20a784..0000000
--- a/package/x11r7/xapp_xgamma/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XGAMMA
-	bool "xgamma"
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	help
-	  Alter a monitor's gamma correction through the X server
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
deleted file mode 100644
index 0993482..0000000
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xgamma -- Alter a monitor's gamma correction through the X server
-#
-################################################################################
-
-XAPP_XGAMMA_VERSION = 1.0.3
-XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
-XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xgc/Config.in b/package/x11r7/xapp_xgc/Config.in
deleted file mode 100644
index 98faba8..0000000
--- a/package/x11r7/xapp_xgc/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XGC
-	bool "xgc"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  X graphics demo
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
deleted file mode 100644
index e39d268..0000000
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xgc -- X graphics demo
-#
-################################################################################
-
-XAPP_XGC_VERSION = 1.0.1
-XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
-XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XGC_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xhost/Config.in b/package/x11r7/xapp_xhost/Config.in
deleted file mode 100644
index 659b34d..0000000
--- a/package/x11r7/xapp_xhost/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XHOST
-	bool "xhost"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  Controls host and/or user access to a running X server.
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
deleted file mode 100644
index 7859f23..0000000
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xhost -- Controls host and/or user access to a running X server.
-#
-################################################################################
-
-XAPP_XHOST_VERSION = 1.0.3
-XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
-XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
deleted file mode 100644
index 9ac2817..0000000
--- a/package/x11r7/xapp_xinit/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XINIT
-	bool "xinit"
-	select BR2_PACKAGE_XAPP_XAUTH
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  X Window System initializer
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
deleted file mode 100644
index 48637f2..0000000
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xinit -- X Window System initializer
-#
-################################################################################
-
-XAPP_XINIT_VERSION = 1.2.1
-XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
-XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xinput/Config.in b/package/x11r7/xapp_xinput/Config.in
deleted file mode 100644
index 2505dd3..0000000
--- a/package/x11r7/xapp_xinput/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XINPUT
-	bool "xinput"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXI
-	help
-	  xinput
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
deleted file mode 100644
index 4e6884d..0000000
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xinput -- xinput
-#
-################################################################################
-
-XAPP_XINPUT_VERSION = 1.5.0
-XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
-XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbcomp/Config.in b/package/x11r7/xapp_xkbcomp/Config.in
deleted file mode 100644
index 2b575b2..0000000
--- a/package/x11r7/xapp_xkbcomp/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XKBCOMP
-	bool "xkbcomp"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	help
-	  compile XKB keyboard description
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
deleted file mode 100644
index f37d106..0000000
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xapp_xkbcomp -- compile XKB keyboard description
-#
-################################################################################
-
-XAPP_XKBCOMP_VERSION = 1.1.1
-XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
-XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
-HOST_XAPP_XKBCOMP_DEPENDENCIES = host-xlib_libX11 host-xlib_libxkbfile
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_xkbevd/Config.in b/package/x11r7/xapp_xkbevd/Config.in
deleted file mode 100644
index cf31565..0000000
--- a/package/x11r7/xapp_xkbevd/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XKBEVD
-	bool "xkbevd"
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	help
-	  XKB event daemon
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
deleted file mode 100644
index e8f7a36..0000000
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xkbevd -- XKB event daemon
-#
-################################################################################
-
-XAPP_XKBEVD_VERSION = 1.1.0
-XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
-XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbprint/Config.in b/package/x11r7/xapp_xkbprint/Config.in
deleted file mode 100644
index e7a4242..0000000
--- a/package/x11r7/xapp_xkbprint/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XKBPRINT
-	bool "xkbprint"
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	help
-	  print an XKB keyboard description
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
deleted file mode 100644
index 98c7560..0000000
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xkbprint -- print an XKB keyboard description
-#
-################################################################################
-
-XAPP_XKBPRINT_VERSION = 1.0.1
-XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
-XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbutils/Config.in b/package/x11r7/xapp_xkbutils/Config.in
deleted file mode 100644
index 22a819b..0000000
--- a/package/x11r7/xapp_xkbutils/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XKBUTILS
-	bool "xkbutils"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	help
-	  X.Org xkbutils application
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
deleted file mode 100644
index 1ccbdb9..0000000
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xkbutils -- X.Org xkbutils application
-#
-################################################################################
-
-XAPP_XKBUTILS_VERSION = 1.0.2
-XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
-XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkill/Config.in b/package/x11r7/xapp_xkill/Config.in
deleted file mode 100644
index fcab92a..0000000
--- a/package/x11r7/xapp_xkill/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XKILL
-	bool "xkill"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  kill a client by its X resource
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
deleted file mode 100644
index 16c3760..0000000
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xkill -- kill a client by its X resource
-#
-################################################################################
-
-XAPP_XKILL_VERSION = 1.0.2
-XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
-XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xload/Config.in b/package/x11r7/xapp_xload/Config.in
deleted file mode 100644
index 25c79d2..0000000
--- a/package/x11r7/xapp_xload/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XLOAD
-	bool "xload"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  system load average display for X
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
deleted file mode 100644
index f84c158..0000000
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xload -- system load average display for X
-#
-################################################################################
-
-XAPP_XLOAD_VERSION = 1.0.2
-XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
-XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
deleted file mode 100644
index 04f779d..0000000
--- a/package/x11r7/xapp_xlogo/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XAPP_XLOGO
-	bool "xlogo"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXFT
-	help
-	  X Window System logo
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
deleted file mode 100644
index f79eafa..0000000
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xlogo -- X Window System logo
-#
-################################################################################
-
-XAPP_XLOGO_VERSION = 1.0.1
-XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
-XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
-			  xlib_libXft host-pkg-config
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsatoms/Config.in b/package/x11r7/xapp_xlsatoms/Config.in
deleted file mode 100644
index 2ad8484..0000000
--- a/package/x11r7/xapp_xlsatoms/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XLSATOMS
-	bool "xlsatoms"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  list interned atoms defined on server
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
deleted file mode 100644
index 887f815..0000000
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xlsatoms -- list interned atoms defined on server
-#
-################################################################################
-
-XAPP_XLSATOMS_VERSION = 1.0.2
-XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
-XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsclients/Config.in b/package/x11r7/xapp_xlsclients/Config.in
deleted file mode 100644
index f8f6132..0000000
--- a/package/x11r7/xapp_xlsclients/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XLSCLIENTS
-	bool "xlsclients"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  X.Org xlsclients application
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
deleted file mode 100644
index 5a8563a..0000000
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xlsclients -- X.Org xlsclients application
-#
-################################################################################
-
-XAPP_XLSCLIENTS_VERSION = 1.0.2
-XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
-XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsfonts/Config.in b/package/x11r7/xapp_xlsfonts/Config.in
deleted file mode 100644
index dab61eb..0000000
--- a/package/x11r7/xapp_xlsfonts/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XLSFONTS
-	bool "xlsfonts"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  X.Org xlsfonts application
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
deleted file mode 100644
index 6f997d8..0000000
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xlsfonts -- X.Org xlsfonts application
-#
-################################################################################
-
-XAPP_XLSFONTS_VERSION = 1.0.1
-XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
-XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmag/Config.in b/package/x11r7/xapp_xmag/Config.in
deleted file mode 100644
index 44d2c8e..0000000
--- a/package/x11r7/xapp_xmag/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XMAG
-	bool "xmag"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  X.Org xmag application
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
deleted file mode 100644
index caf7bf6..0000000
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xmag -- X.Org xmag application
-#
-################################################################################
-
-XAPP_XMAG_VERSION = 1.0.2
-XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
-XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMAG_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xman/Config.in b/package/x11r7/xapp_xman/Config.in
deleted file mode 100644
index af9525b..0000000
--- a/package/x11r7/xapp_xman/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XAPP_XMAN
-	bool "xman"
-	help
-	  Manual page display program for the X Window System
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
deleted file mode 100644
index e3f623e..0000000
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-#############################################################
-#
-# xapp_xman - Manual page display program for the X Window System
-#
-#############################################################
-XAPP_XMAN_VERSION:=1.0.3
-XAPP_XMAN_SOURCE:=xman-$(XAPP_XMAN_VERSION).tar.bz2
-XAPP_XMAN_SITE:=http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMAN_INSTALL_TARGET = YES
-
-XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
-		ac_cv_file__etc_man_config=no \
-		ac_cv_file__etc_manpath_config=no
-
-XAPP_XMAN_CONF_OPT = --disable-IPv6
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmessage/Config.in b/package/x11r7/xapp_xmessage/Config.in
deleted file mode 100644
index e80562f..0000000
--- a/package/x11r7/xapp_xmessage/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XMESSAGE
-	bool "xmessage"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  display a message or query in a window (X-based /bin/echo)
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
deleted file mode 100644
index 3f47b26..0000000
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xmessage -- display a message or query in a window (X-based /bin/echo)
-#
-################################################################################
-
-XAPP_XMESSAGE_VERSION = 1.0.2
-XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
-XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
deleted file mode 100644
index 3da965a..0000000
--- a/package/x11r7/xapp_xmh/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XMH
-	bool "xmh"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  send and read mail with an X interface to MH
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
deleted file mode 100644
index 280b7e7..0000000
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xmh -- send and read mail with an X interface to MH
-#
-################################################################################
-
-XAPP_XMH_VERSION = 1.0.1
-XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
-XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMH_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmodmap/Config.in b/package/x11r7/xapp_xmodmap/Config.in
deleted file mode 100644
index 9be79ab..0000000
--- a/package/x11r7/xapp_xmodmap/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XMODMAP
-	bool "xmodmap"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  utility for modifying keymaps and pointer button mappings in X
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
deleted file mode 100644
index 1a6c44a..0000000
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xmodmap -- utility for modifying keymaps and pointer button mappings in X
-#
-################################################################################
-
-XAPP_XMODMAP_VERSION = 1.0.4
-XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
-XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmore/Config.in b/package/x11r7/xapp_xmore/Config.in
deleted file mode 100644
index 23fd147..0000000
--- a/package/x11r7/xapp_xmore/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XMORE
-	bool "xmore"
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  plain text display program for the X Window System
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
deleted file mode 100644
index bd371ea..0000000
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xmore -- plain text display program for the X Window System
-#
-################################################################################
-
-XAPP_XMORE_VERSION = 1.0.1
-XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
-XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xplsprinters/Config.in b/package/x11r7/xapp_xplsprinters/Config.in
deleted file mode 100644
index 16a139b..0000000
--- a/package/x11r7/xapp_xplsprinters/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XPLSPRINTERS
-	bool "xplsprinters"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	help
-	  shows a list of Xprint printers and it's attributes
diff --git a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
deleted file mode 100644
index 08a1b4a..0000000
--- a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xplsprinters -- shows a list of Xprint printers and it's attributes
-#
-################################################################################
-
-XAPP_XPLSPRINTERS_VERSION = 1.0.1
-XAPP_XPLSPRINTERS_SOURCE = xplsprinters-$(XAPP_XPLSPRINTERS_VERSION).tar.bz2
-XAPP_XPLSPRINTERS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPLSPRINTERS_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xpr/Config.in b/package/x11r7/xapp_xpr/Config.in
deleted file mode 100644
index 0710d62..0000000
--- a/package/x11r7/xapp_xpr/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XPR
-	bool "xpr"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  X.Org xpr application
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
deleted file mode 100644
index 4ac3da4..0000000
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xpr -- X.Org xpr application
-#
-################################################################################
-
-XAPP_XPR_VERSION = 1.0.3
-XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
-XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xprehashprinterlist/Config.in b/package/x11r7/xapp_xprehashprinterlist/Config.in
deleted file mode 100644
index 056fdb6..0000000
--- a/package/x11r7/xapp_xprehashprinterlist/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST
-	bool "xprehashprinterlist"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXP
-	help
-	  Recomputes the list of available printers.
diff --git a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
deleted file mode 100644
index 1bb7365..0000000
--- a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xprehashprinterlist -- Recomputes the list of available printers.
-#
-################################################################################
-
-XAPP_XPREHASHPRINTERLIST_VERSION = 1.0.1
-XAPP_XPREHASHPRINTERLIST_SOURCE = xprehashprinterlist-$(XAPP_XPREHASHPRINTERLIST_VERSION).tar.bz2
-XAPP_XPREHASHPRINTERLIST_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPREHASHPRINTERLIST_DEPENDENCIES = xlib_libX11 xlib_libXp
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xprop/Config.in b/package/x11r7/xapp_xprop/Config.in
deleted file mode 100644
index 314e79f..0000000
--- a/package/x11r7/xapp_xprop/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XPROP
-	bool "xprop"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  property displayer for X
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
deleted file mode 100644
index 1615ac2..0000000
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xprop -- property displayer for X
-#
-################################################################################
-
-XAPP_XPROP_VERSION = 1.1.0
-XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
-XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrandr/Config.in b/package/x11r7/xapp_xrandr/Config.in
deleted file mode 100644
index fe9bd4e..0000000
--- a/package/x11r7/xapp_xrandr/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XRANDR
-	bool "xrandr"
-	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  primitive command line interface to RandR extension
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch b/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
deleted file mode 100644
index 6dc3534..0000000
--- a/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- a/xrandr.c.orig	2008-02-02 17:09:45.000000000 -0500
-+++ b/xrandr.c	2008-02-02 17:04:51.000000000 -0500
-@@ -189,7 +189,7 @@ reflection_name (Rotation rotation)
- 
- #if HAS_RANDR_1_2
- typedef enum _policy {
--    clone, extend
-+    clone1, extend
- } policy_t;
- 
- typedef enum _relation {
-@@ -1602,7 +1602,7 @@ main (int argc, char **argv)
-     int		ret = 0;
- #if HAS_RANDR_1_2
-     output_t	*output = NULL;
--    policy_t	policy = clone;
-+    policy_t	policy = clone1;
-     Bool    	setit_1_2 = False;
-     Bool    	query_1_2 = False;
-     Bool	modeit = False;
-@@ -1863,7 +1863,7 @@ main (int argc, char **argv)
- 	    continue;
- 	}
- 	if (!strcmp ("--clone", argv[i])) {
--	    policy = clone;
-+	    policy = clone1;
- 	    setit_1_2 = True;
- 	    continue;
- 	}
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
deleted file mode 100644
index 74bf97b..0000000
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xapp_xrandr -- primitive command line interface to RandR extension
-#
-################################################################################
-
-XAPP_XRANDR_VERSION = 1.3.2
-XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
-XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
-XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrdb/Config.in b/package/x11r7/xapp_xrdb/Config.in
deleted file mode 100644
index 8c07857..0000000
--- a/package/x11r7/xapp_xrdb/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XRDB
-	bool "xrdb"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  X server resource database utility
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
deleted file mode 100644
index 3a0cfdc..0000000
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xrdb -- X server resource database utility
-#
-################################################################################
-
-XAPP_XRDB_VERSION = 1.0.6
-XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
-XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrefresh/Config.in b/package/x11r7/xapp_xrefresh/Config.in
deleted file mode 100644
index 16b1e50..0000000
--- a/package/x11r7/xapp_xrefresh/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XREFRESH
-	bool "xrefresh"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  refresh all or part of an X screen
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
deleted file mode 100644
index ac7ed7c..0000000
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xrefresh -- refresh all or part of an X screen
-#
-################################################################################
-
-XAPP_XREFRESH_VERSION = 1.0.3
-XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
-XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xset/Config.in b/package/x11r7/xapp_xset/Config.in
deleted file mode 100644
index ff697e5..0000000
--- a/package/x11r7/xapp_xset/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XSET
-	bool "xset"
-	select BR2_PACKAGE_XLIB_LIBXFONTCACHE
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  X.Org xset application
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
deleted file mode 100644
index 32d6722..0000000
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xset -- X.Org xset application
-#
-################################################################################
-
-XAPP_XSET_VERSION = 1.1.0
-XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
-XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetmode/Config.in b/package/x11r7/xapp_xsetmode/Config.in
deleted file mode 100644
index a08e02d..0000000
--- a/package/x11r7/xapp_xsetmode/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XSETMODE
-	bool "xsetmode"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXI
-	help
-	  set the mode for an X Input device
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
deleted file mode 100644
index 158318d..0000000
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xsetmode -- set the mode for an X Input device
-#
-################################################################################
-
-XAPP_XSETMODE_VERSION = 1.0.0
-XAPP_XSETMODE_SOURCE = xsetmode-$(XAPP_XSETMODE_VERSION).tar.bz2
-XAPP_XSETMODE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetpointer/Config.in b/package/x11r7/xapp_xsetpointer/Config.in
deleted file mode 100644
index 2b0b462..0000000
--- a/package/x11r7/xapp_xsetpointer/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XSETPOINTER
-	bool "xsetpointer"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXI
-	help
-	  set an X Input device as the main pointer
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
deleted file mode 100644
index 1a02542..0000000
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xsetpointer -- set an X Input device as the main pointer
-#
-################################################################################
-
-XAPP_XSETPOINTER_VERSION = 1.0.0
-XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
-XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetroot/Config.in b/package/x11r7/xapp_xsetroot/Config.in
deleted file mode 100644
index 82c0dba..0000000
--- a/package/x11r7/xapp_xsetroot/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XSETROOT
-	bool "xsetroot"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XDATA_XBITMAPS
-	help
-	  X.Org xsetroot application
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
deleted file mode 100644
index 937f3e5..0000000
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xsetroot -- X.Org xsetroot application
-#
-################################################################################
-
-XAPP_XSETROOT_VERSION = 1.0.3
-XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
-XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsm/Config.in b/package/x11r7/xapp_xsm/Config.in
deleted file mode 100644
index d06dc6c..0000000
--- a/package/x11r7/xapp_xsm/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XSM
-	bool "xsm"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	help
-	  X Session Manager
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
deleted file mode 100644
index c7e261f..0000000
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xsm -- X Session Manager
-#
-################################################################################
-
-XAPP_XSM_VERSION = 1.0.1
-XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
-XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSM_DEPENDENCIES = xlib_libXaw
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xstdcmap/Config.in b/package/x11r7/xapp_xstdcmap/Config.in
deleted file mode 100644
index f15c36b..0000000
--- a/package/x11r7/xapp_xstdcmap/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XSTDCMAP
-	bool "xstdcmap"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  X standard colormap utility
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
deleted file mode 100644
index e33a51e..0000000
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xstdcmap -- X standard colormap utility
-#
-################################################################################
-
-XAPP_XSTDCMAP_VERSION = 1.0.1
-XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
-XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xvidtune/Config.in b/package/x11r7/xapp_xvidtune/Config.in
deleted file mode 100644
index b1902cd..0000000
--- a/package/x11r7/xapp_xvidtune/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XVIDTUNE
-	bool "xvidtune"
-	select BR2_PACKAGE_XLIB_LIBXAW
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	help
-	  video mode tuner for Xorg
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
deleted file mode 100644
index 0fd91db..0000000
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xvidtune -- video mode tuner for Xorg
-#
-################################################################################
-
-XAPP_XVIDTUNE_VERSION = 1.0.1
-XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
-XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xvinfo/Config.in b/package/x11r7/xapp_xvinfo/Config.in
deleted file mode 100644
index 2612c04..0000000
--- a/package/x11r7/xapp_xvinfo/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XVINFO
-	bool "xvinfo"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXV
-	help
-	  Print out X-Video extension adaptor information
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
deleted file mode 100644
index fe10628..0000000
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xvinfo -- Print out X-Video extension adaptor information
-#
-################################################################################
-
-XAPP_XVINFO_VERSION = 1.1.0
-XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
-XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwd/Config.in b/package/x11r7/xapp_xwd/Config.in
deleted file mode 100644
index b7b3172..0000000
--- a/package/x11r7/xapp_xwd/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XWD
-	bool "xwd"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  dump an image of an X window
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
deleted file mode 100644
index 95d6098..0000000
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xwd -- dump an image of an X window
-#
-################################################################################
-
-XAPP_XWD_VERSION = 1.0.3
-XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
-XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwininfo/Config.in b/package/x11r7/xapp_xwininfo/Config.in
deleted file mode 100644
index 4e09570..0000000
--- a/package/x11r7/xapp_xwininfo/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XWININFO
-	bool "xwininfo"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXMU
-	help
-	  window information utility for X
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
deleted file mode 100644
index 541efde..0000000
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xwininfo -- window information utility for X
-#
-################################################################################
-
-XAPP_XWININFO_VERSION = 1.0.5
-XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
-XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwud/Config.in b/package/x11r7/xapp_xwud/Config.in
deleted file mode 100644
index cb8337e..0000000
--- a/package/x11r7/xapp_xwud/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XAPP_XWUD
-	bool "xwud"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  image displayer for X
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
deleted file mode 100644
index 69bb228..0000000
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xwud -- image displayer for X
-#
-################################################################################
-
-XAPP_XWUD_VERSION = 1.0.2
-XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
-XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XWUD_DEPENDENCIES = xlib_libX11
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xcb-proto/Config.in b/package/x11r7/xcb-proto/Config.in
deleted file mode 100644
index 4a6dfe4..0000000
--- a/package/x11r7/xcb-proto/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XCB_PROTO
-	bool "xcb-proto"
-	help
-		The protocol headers that define XCB.
-
-		http://xcb.freedesktop.org/
-
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
deleted file mode 100644
index 3479a23..0000000
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-#############################################################
-#
-# xcb-proto
-#
-#############################################################
-XCB_PROTO_VERSION = 1.6
-XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
-XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
-
-XCB_PROTO_INSTALL_STAGING = YES
-
-XCB_PROTO_DEPENDENCIES = host-python
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
diff --git a/package/x11r7/xcb-util/Config.in b/package/x11r7/xcb-util/Config.in
deleted file mode 100644
index cf79327..0000000
--- a/package/x11r7/xcb-util/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XCB_UTIL
-	bool "xcb-util"
-	help
-	  Libraries which sit on top of libxcb, the core X protocol library,
-	  and some of the extension libraries.
-
-	  http://xcb.freedesktop.org/
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
deleted file mode 100644
index 0158c9f..0000000
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-#############################################################
-#
-# xcb-util
-#
-#############################################################
-XCB_UTIL_VERSION = 0.3.6
-XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
-XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
-XCB_UTIL_DEPENDENCIES = host-gperf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xdata_xbitmaps/Config.in b/package/x11r7/xdata_xbitmaps/Config.in
deleted file mode 100644
index 2308cae..0000000
--- a/package/x11r7/xdata_xbitmaps/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XDATA_XBITMAPS
-	bool "xbitmaps"
-	help
-	  No description available
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
deleted file mode 100644
index b94531b..0000000
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdata_xbitmaps -- No description available
-#
-################################################################################
-
-XDATA_XBITMAPS_VERSION = 1.1.0
-XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
-XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
-XDATA_XBITMAPS_INSTALL_STAGING = YES
-XDATA_XBITMAPS_INSTALL_TARGET = YES
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdata_xcursor-themes/Config.in b/package/x11r7/xdata_xcursor-themes/Config.in
deleted file mode 100644
index 78d1020..0000000
--- a/package/x11r7/xdata_xcursor-themes/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XDATA_XCURSOR_THEMES
-	bool "xdata_xcursor-themes"
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
-	help
-	  No description available
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
deleted file mode 100644
index c954bec..0000000
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-#############################################################
-#
-# xdata_xcursor-themes - No description available
-#
-#############################################################
-XDATA_XCURSOR_THEMES_VERSION = 1.0.2
-XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
-XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
-XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
-XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
-XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-acecad/Config.in b/package/x11r7/xdriver_xf86-input-acecad/Config.in
deleted file mode 100644
index 7e1838e..0000000
--- a/package/x11r7/xdriver_xf86-input-acecad/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD
-	bool "xf86-input-acecad"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Acecad Flair input driver
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
deleted file mode 100644
index e55f979..0000000
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-acecad -- Acecad Flair input driver
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.4.0
-XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/Config.in b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
deleted file mode 100644
index 87fe5b3..0000000
--- a/package/x11r7/xdriver_xf86-input-aiptek/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK
-	bool "xf86-input-aiptek"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Aiptek USB Digital Tablet Input Driver for Linux
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
deleted file mode 100644
index c3299ac..0000000
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-aiptek -- Aiptek USB Digital Tablet Input Driver for Linux
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.0
-XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
deleted file mode 100644
index 248be7e..0000000
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
-	bool "xf86-input-evdev"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Generic Linux input driver
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
deleted file mode 100644
index d1964b2..0000000
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-evdev -- Generic Linux input driver
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.3.0
-XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/Config.in b/package/x11r7/xdriver_xf86-input-joystick/Config.in
deleted file mode 100644
index 4a7439a..0000000
--- a/package/x11r7/xdriver_xf86-input-joystick/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
-	bool "xf86-input-joystick"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for joystick input devices
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
deleted file mode 100644
index afbf286..0000000
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-joystick -- X.Org driver for joystick input devices
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.4.99.2
-XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
deleted file mode 100644
index 481c763..0000000
--- a/package/x11r7/xdriver_xf86-input-keyboard/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
-	bool "xf86-input-keyboard"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Keyboard input driver
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
deleted file mode 100644
index e0b57de..0000000
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-keyboard -- Keyboard input driver
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.4.0
-XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
deleted file mode 100644
index c8e39b0..0000000
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
-	bool "xf86-input-mouse"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for mouse input devices
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
deleted file mode 100644
index 55c6370..0000000
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-mouse -- X.Org driver for mouse input devices
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.5.0
-XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
deleted file mode 100644
index 258dee2..0000000
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
-	bool "xf86-input-synaptics"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for synaptics input devices
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
deleted file mode 100644
index 6f9d66d..0000000
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-synaptics -- X.Org driver for synaptics input devices
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.2.0
-XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
deleted file mode 100644
index 377e7e4..0000000
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
-	bool "xf86-input-vmmouse"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  VMWare mouse input driver
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
deleted file mode 100644
index 386c4d1..0000000
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-vmmouse -- VMWare mouse input driver
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 12.6.5
-XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-void/Config.in b/package/x11r7/xdriver_xf86-input-void/Config.in
deleted file mode 100644
index ab4230b..0000000
--- a/package/x11r7/xdriver_xf86-input-void/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
-	bool "xf86-input-void"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  null input driver
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
deleted file mode 100644
index 1beed2e..0000000
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-void -- null input driver
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_VOID_VERSION = 1.3.0
-XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
deleted file mode 100644
index dea5258..0000000
--- a/package/x11r7/xdriver_xf86-video-apm/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
-	bool "xf86-video-apm"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86RUSHPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Alliance ProMotion video driver
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
deleted file mode 100644
index ab6e8fb..0000000
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-apm -- Alliance ProMotion video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_APM_VERSION = 1.2.2
-XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ark/Config.in b/package/x11r7/xdriver_xf86-video-ark/Config.in
deleted file mode 100644
index d9703de..0000000
--- a/package/x11r7/xdriver_xf86-video-ark/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
-	bool "xf86-video-ark"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for ark cards
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
deleted file mode 100644
index 6cb689e..0000000
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-ark -- X.Org driver for ark cards
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.2
-XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ast/Config.in b/package/x11r7/xdriver_xf86-video-ast/Config.in
deleted file mode 100644
index b2a0bc8..0000000
--- a/package/x11r7/xdriver_xf86-video-ast/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AST
-	bool "xf86-video-ast"
-	help
-	  No description available
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
deleted file mode 100644
index f71b707..0000000
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-ast -- No description available
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_AST_VERSION = 0.89.9
-XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
deleted file mode 100644
index 107a57b..0000000
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
-	bool "xf86-video-ati"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  ATI video driver
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
deleted file mode 100644
index d276176..0000000
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
-+++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
-@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--	AC_CHECK_FILE([${sdkdir}/dri.h],
-+ 	if test "$cross_compiling" = "no" ; then
-+		AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
--	AC_CHECK_FILE([${sdkdir}/sarea.h],
-+		AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
--	AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
--	AC_CHECK_FILE([${sdkdir}/damage.h],
-+		AC_CHECK_FILE([${sdkdir}/damage.h],
-                       [have_damage_h="yes"], [have_damage_h="no"])
-+ 	else
-+ 		have_dri_h="yes"
-+ 		have_sarea_h="yes"
-+ 		have_dristruct_h="yes"
-+ 	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
deleted file mode 100644
index a357cf2..0000000
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-ati -- ATI video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_ATI_VERSION = 6.12.4
-XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
deleted file mode 100644
index 29a99ec..0000000
--- a/package/x11r7/xdriver_xf86-video-chips/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
-	bool "xf86-video-chips"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Chips and Technologies video driver
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
deleted file mode 100644
index 5e9d9ab..0000000
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-chips -- Chips and Technologies video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.2
-XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/Config.in b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
deleted file mode 100644
index 31ed634..0000000
--- a/package/x11r7/xdriver_xf86-video-cirrus/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
-	bool "xf86-video-cirrus"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Cirrus Logic video driver
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
deleted file mode 100644
index 774688d..0000000
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-cirrus -- Cirrus Logic video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_CIRRUS_VERSION = 1.3.2
-XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/Config.in b/package/x11r7/xdriver_xf86-video-dummy/Config.in
deleted file mode 100644
index 2a172cc..0000000
--- a/package/x11r7/xdriver_xf86-video-dummy/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
-	bool "xf86-video-dummy"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for dummy cards
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
deleted file mode 100644
index 91182fe..0000000
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-dummy -- X.Org driver for dummy cards
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.2
-XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/Config.in b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
deleted file mode 100644
index 8907fe1..0000000
--- a/package/x11r7/xdriver_xf86-video-fbdev/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
-	bool "xf86-video-fbdev"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  video driver for framebuffer device
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
deleted file mode 100644
index 600335e..0000000
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-fbdev -- video driver for framebuffer device
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.4.1
-XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
deleted file mode 100644
index c60b62c..0000000
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
-	bool "xf86-video-geode"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  video driver for geode device
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
deleted file mode 100644
index faee8ca..0000000
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-geode -- video driver for geode device
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.6
-XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
deleted file mode 100644
index ea9abd7..0000000
--- a/package/x11r7/xdriver_xf86-video-glide/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
-	bool "xf86-video-glide"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
-	help
-	  video driver for glide device
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
deleted file mode 100644
index cd611b6..0000000
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-glide -- video driver for glide device
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.0.3
-XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
deleted file mode 100644
index 782b6da..0000000
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
-	bool "xf86-video-glint"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  GLINT/Permedia video driver
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
deleted file mode 100644
index 8c420d3..0000000
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- a/configure.ac	2008-06-23 11:17:07.000000000 -0400
-+++ b/configure.ac	2008-06-23 11:16:31.000000000 -0400
-@@ -75,12 +75,20 @@ CPPFLAGS="$SAVE_CPPFLAGS"
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
--                      [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
--                      [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
--                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	if test "$cross_compiling" = "no" ; then
-+ 		AC_CHECK_FILE([${sdkdir}/dri.h],
-+                        [have_dri_h="yes"], [have_dri_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/sarea.h],
-+                        [have_sarea_h="yes"], [have_sarea_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+                        [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/damage.h],
-+                        [have_damage_h="yes"], [have_damage_h="no"])
-+  	else
-+  		have_dri_h="yes"
-+  		have_sarea_h="yes"
-+  		have_dristruct_h="yes"
-+  	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
deleted file mode 100644
index 2ff7669..0000000
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-glint -- GLINT/Permedia video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_GLINT_VERSION = 1.2.4
-XDRIVER_XF86_VIDEO_GLINT_SOURCE = xf86-video-glint-$(XDRIVER_XF86_VIDEO_GLINT_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-i128/Config.in b/package/x11r7/xdriver_xf86-video-i128/Config.in
deleted file mode 100644
index a66fda6..0000000
--- a/package/x11r7/xdriver_xf86-video-i128/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
-	bool "xf86-video-i128"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Number 9 I128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
deleted file mode 100644
index 4188dc5..0000000
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-i128 -- Number 9 I128 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_I128_VERSION = 1.3.3
-XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-i740/Config.in b/package/x11r7/xdriver_xf86-video-i740/Config.in
deleted file mode 100644
index 9d1a040..0000000
--- a/package/x11r7/xdriver_xf86-video-i740/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
-	bool "xf86-video-i740"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Intel i740 video driver
diff --git a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
deleted file mode 100644
index 47ba28d..0000000
--- a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-i740 -- Intel i740 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_I740_VERSION = 1.3.2
-XDRIVER_XF86_VIDEO_I740_SOURCE = xf86-video-i740-$(XDRIVER_XF86_VIDEO_I740_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
deleted file mode 100644
index 9a1d6cf..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
-	bool "xf86-video-intel"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	help
-	  Intel video driver
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
deleted file mode 100644
index 0b020ac..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/configure.ac.orig	2010-01-04 22:20:07.000000000 +0000
-+++ b/configure.ac	2010-02-19 12:12:50.000000000 +0000
-@@ -103,7 +103,7 @@
- CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
- CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
- AC_MSG_CHECKING([whether to include DRI support])
--if test x$DRI != xno; then
-+if test "$cross_compiling" = "no" -a test x$DRI != xno; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
deleted file mode 100644
index 76a33eb..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
+++ /dev/null
@@ -1,25 +0,0 @@
---- xdriver_xf86-video-intel-2.9.1/configure.ac.orig	2010-01-28 11:18:27.526329157 +0200
-+++ xdriver_xf86-video-intel-2.9.1/configure.ac	2010-01-28 11:21:38.065198735 +0200
-@@ -114,6 +114,7 @@ save_CFLAGS="$CFLAGS"
- CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
- CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
- AC_MSG_CHECKING([whether to include DRI support])
-+if test "$cross_compiling" = "no" ; then
- if test x$DRI != xno; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-@@ -132,6 +133,14 @@ if test x$DRI = xauto; then
-                 DRI="no"
-         fi
- fi
-+else
-+if test x$DRI != xno; then
-+	have_dri_h="yes"
-+	have_sarea_h="yes"
-+	have_dristruct_h="yes"
-+	DRI="yes"
-+fi
-+fi
- AC_MSG_RESULT([$DRI])
- CFLAGS="$save_CFLAGS $DEBUGFLAGS"
- 
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
deleted file mode 100644
index a24a241..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-intel -- Intel video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.10.0
-XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
-XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
deleted file mode 100644
index f2464e7..0000000
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
-	bool "xf86-video-mach64"
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  mach64 video driver
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
deleted file mode 100644
index d276176..0000000
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
-+++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
-@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--	AC_CHECK_FILE([${sdkdir}/dri.h],
-+ 	if test "$cross_compiling" = "no" ; then
-+		AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
--	AC_CHECK_FILE([${sdkdir}/sarea.h],
-+		AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
--	AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
--	AC_CHECK_FILE([${sdkdir}/damage.h],
-+		AC_CHECK_FILE([${sdkdir}/damage.h],
-                       [have_damage_h="yes"], [have_damage_h="no"])
-+ 	else
-+ 		have_dri_h="yes"
-+ 		have_sarea_h="yes"
-+ 		have_dristruct_h="yes"
-+ 	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
deleted file mode 100644
index 0636085..0000000
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-mach64 -- mach64 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.8.2
-XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
deleted file mode 100644
index 40c6f3a..0000000
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
-	bool "xf86-video-mga"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Matrox video driver
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
deleted file mode 100644
index 5707bd1..0000000
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- xf86-video-mga-1.4.9/configure.ac.orig	2007-06-10 11:55:24.000000000 +0200
-+++ xf86-video-mga-1.4.9/configure.ac	2007-06-10 12:00:37.000000000 +0200
-@@ -77,12 +77,18 @@
- AC_HEADER_STDC
- 
- if test "x$DRI" != xno; then
-+	if test "$cross_compiling" = no; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
deleted file mode 100644
index 64bae46..0000000
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-mga -- Matrox video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_MGA_VERSION = 1.4.11
-XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
deleted file mode 100644
index 2e028a7..0000000
--- a/package/x11r7/xdriver_xf86-video-neomagic/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
-	bool "xf86-video-neomagic"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Neomagic video driver
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
deleted file mode 100644
index 27e028b..0000000
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-neomagic -- Neomagic video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.2.4
-XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
deleted file mode 100644
index e2effe8..0000000
--- a/package/x11r7/xdriver_xf86-video-newport/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
-	bool "xf86-video-newport"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Newport video driver
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
deleted file mode 100644
index 1138744..0000000
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-newport -- Newport video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_NEWPORT_VERSION = 0.2.3
-XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWPORT_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-nv/Config.in b/package/x11r7/xdriver_xf86-video-nv/Config.in
deleted file mode 100644
index 943bc14..0000000
--- a/package/x11r7/xdriver_xf86-video-nv/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
-	bool "xf86-video-nv"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  NVIDIA video driver
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
deleted file mode 100644
index 4886fe8..0000000
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-nv -- NVIDIA video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.15
-XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
deleted file mode 100644
index 4a69246..0000000
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
-	bool "xf86-video-openchrome"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
-	select BR2_PACKAGE_XLIB_LIBXVMC
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Openchrome, A free and Open Source video driver for the VIA/S3G
-	  UniChrome and UniChrome Pro graphics chipsets.
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
deleted file mode 100644
index e259398..0000000
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- a/configure.ac	2008-04-09 15:42:55.000000000 -0400
-+++ b/configure.ac	2008-06-23 09:39:06.000000000 -0400
-@@ -87,12 +87,18 @@ if test x$XSERVER_LIBPCIACCESS = xyes; t
- fi
- 
- if test "$DRI" != no; then
-+	if test "$cross_compiling" = "no" ; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
deleted file mode 100644
index c166559..0000000
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-#############################################################
-#
-# openchrome
-#
-#############################################################
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.904
-XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://www.openchrome.org/releases
-
-XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
-	xserver_xorg-server \
-	libdrm \
-	xlib_libX11 \
-	xlib_libXcomposite \
-	xlib_libXvMC \
-	xproto_fontsproto \
-	xproto_glproto \
-	xproto_randrproto \
-	xproto_renderproto \
-	xproto_xextproto \
-	xproto_xf86driproto \
-	xproto_xproto
-
-
-XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
deleted file mode 100644
index 96bd8d7..0000000
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
-	bool "xf86-video-r128"
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  R128 video driver
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch
deleted file mode 100644
index d276176..0000000
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
-+++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
-@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--	AC_CHECK_FILE([${sdkdir}/dri.h],
-+ 	if test "$cross_compiling" = "no" ; then
-+		AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
--	AC_CHECK_FILE([${sdkdir}/sarea.h],
-+		AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
--	AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
--	AC_CHECK_FILE([${sdkdir}/damage.h],
-+		AC_CHECK_FILE([${sdkdir}/damage.h],
-                       [have_damage_h="yes"], [have_damage_h="no"])
-+ 	else
-+ 		have_dri_h="yes"
-+ 		have_sarea_h="yes"
-+ 		have_dristruct_h="yes"
-+ 	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
deleted file mode 100644
index 8430d73..0000000
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-r128 -- R128 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.8.1
-XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-rendition/Config.in b/package/x11r7/xdriver_xf86-video-rendition/Config.in
deleted file mode 100644
index 9238aec..0000000
--- a/package/x11r7/xdriver_xf86-video-rendition/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
-	bool "xf86-video-rendition"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Rendition video driver
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
deleted file mode 100644
index 51efbd4..0000000
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-rendition -- Rendition video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_RENDITION_VERSION = 4.2.3
-XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_RENDITION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-s3/Config.in b/package/x11r7/xdriver_xf86-video-s3/Config.in
deleted file mode 100644
index 1091028..0000000
--- a/package/x11r7/xdriver_xf86-video-s3/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
-	bool "xf86-video-s3"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for s3 cards
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
deleted file mode 100644
index 6c619c9..0000000
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-s3 -- X.Org driver for s3 cards
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_S3_VERSION = 0.6.3
-XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
deleted file mode 100644
index 6f31864..0000000
--- a/package/x11r7/xdriver_xf86-video-s3virge/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
-	bool "xf86-video-s3virge"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  S3 ViRGE video driver
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
deleted file mode 100644
index 68b0acc..0000000
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-s3virge -- S3 ViRGE video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_S3VIRGE_VERSION = 1.10.4
-XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VIRGE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
deleted file mode 100644
index a9c8f6c..0000000
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
-	bool "xf86-video-savage"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  S3 Savage video driver
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
deleted file mode 100644
index b9c296b..0000000
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/configure.ac	2008-05-21 16:04:23.000000000 -0400
-+++ b/configure.ac	2008-06-23 11:41:50.000000000 -0400
-@@ -68,12 +68,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
--                      [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
--                      [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
--                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	if test "$cross_compiling" = "no" ; then
-+ 		AC_CHECK_FILE([${sdkdir}/dri.h],
-+                        [have_dri_h="yes"], [have_dri_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/sarea.h],
-+                        [have_sarea_h="yes"], [have_sarea_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+                        [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	else
-+  		have_dri_h="yes"
-+  		have_sarea_h="yes"
-+  		have_dristruct_h="yes"
-+  	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
deleted file mode 100644
index 32ef7f5..0000000
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-savage -- S3 Savage video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.1
-XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
deleted file mode 100644
index db15116..0000000
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
-	bool "xf86-video-siliconmotion"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Silicon Motion video driver
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
deleted file mode 100644
index 9f5d7fd..0000000
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-siliconmotion -- Silicon Motion video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.3
-XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
deleted file mode 100644
index ac2b632..0000000
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
-	bool "xf86-video-sis"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  SiS and XGI video driver
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
deleted file mode 100644
index 9e06480..0000000
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- xf86-video-sis-0.9.3/configure.ac.orig	2007-06-10 21:00:29.000000000 +0200
-+++ xf86-video-sis-0.9.3/configure.ac	2007-06-10 21:00:45.000000000 +0200
-@@ -71,12 +71,18 @@
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
-+	if test "$cross_compiling" = "no" ; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
deleted file mode 100644
index 8343761..0000000
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-sis -- SiS and XGI video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.2
-XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
deleted file mode 100644
index b00a8a7..0000000
--- a/package/x11r7/xdriver_xf86-video-sisusb/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
-	bool "xf86-video-sisusb"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  SiS USB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
deleted file mode 100644
index e9e529d..0000000
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-sisusb -- SiS USB video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.3
-XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/Config.in b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
deleted file mode 100644
index 661c179..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg14/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
-	bool "xf86-video-suncg14"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  CG14 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
deleted file mode 100644
index f7c4f64..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-suncg14 -- CG14 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNCG14_VERSION = 1.1.1
-XDRIVER_XF86_VIDEO_SUNCG14_SOURCE = xf86-video-suncg14-$(XDRIVER_XF86_VIDEO_SUNCG14_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG14_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
deleted file mode 100644
index 539a95a..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg3/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
-	bool "xf86-video-suncg3"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  CG3 video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
deleted file mode 100644
index adef006..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-suncg3 -- CG3 video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNCG3_VERSION = 1.1.1
-XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
deleted file mode 100644
index 9496f8d..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg6/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
-	bool "xf86-video-suncg6"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  GX/Turbo GX video driver
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
deleted file mode 100644
index 0d1f11e..0000000
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-suncg6 -- GX/Turbo GX video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNCG6_VERSION = 1.1.1
-XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
deleted file mode 100644
index 76f5b9a..0000000
--- a/package/x11r7/xdriver_xf86-video-sunffb/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
-	bool "xf86-video-sunffb"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  SUNFFB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
deleted file mode 100644
index be667a2..0000000
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-sunffb -- SUNFFB video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNFFB_VERSION = 1.2.1
-XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/Config.in b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
deleted file mode 100644
index 29d24a2..0000000
--- a/package/x11r7/xdriver_xf86-video-sunleo/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO
-	bool "xf86-video-sunleo"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Leo video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
deleted file mode 100644
index b0cc953..0000000
--- a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-sunleo -- Leo video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNLEO_VERSION = 1.2.0
-XDRIVER_XF86_VIDEO_SUNLEO_SOURCE = xf86-video-sunleo-$(XDRIVER_XF86_VIDEO_SUNLEO_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNLEO_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNLEO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
deleted file mode 100644
index 3c82739..0000000
--- a/package/x11r7/xdriver_xf86-video-suntcx/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
-	bool "xf86-video-suntcx"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  TCX video driver
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
deleted file mode 100644
index 135ddd7..0000000
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-suntcx -- TCX video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_SUNTCX_VERSION = 1.1.1
-XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
deleted file mode 100644
index 57bb411..0000000
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
-	bool "xf86-video-tdfx"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  3Dfx video driver
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
deleted file mode 100644
index e53591b..0000000
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- xf86-video-tdfx-1.3.0/configure.ac.orig	2007-06-10 21:01:54.000000000 +0200
-+++ xf86-video-tdfx-1.3.0/configure.ac	2007-06-10 21:02:06.000000000 +0200
-@@ -67,13 +67,20 @@
- # Checks for header files.
- AC_HEADER_STDC
- 
--if test "$DRI" != no; then
-+if test "x$DRI" != xno; then
-+	if test "$cross_compiling" = "no" ; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+		AC_CHECK_HEADER
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
deleted file mode 100644
index dd2643a..0000000
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-tdfx -- 3Dfx video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.3
-XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
deleted file mode 100644
index 800a8f6..0000000
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
-	bool "xf86-video-tga"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org driver for tga cards
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
deleted file mode 100644
index fb69d51..0000000
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-tga -- X.Org driver for tga cards
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.1
-XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
deleted file mode 100644
index 4a7a477..0000000
--- a/package/x11r7/xdriver_xf86-video-trident/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
-	bool "xf86-video-trident"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Trident video driver
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
deleted file mode 100644
index af44f69..0000000
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-trident -- Trident video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_TRIDENT_VERSION = 1.3.3
-XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRIDENT_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tseng/Config.in b/package/x11r7/xdriver_xf86-video-tseng/Config.in
deleted file mode 100644
index f72b87b..0000000
--- a/package/x11r7/xdriver_xf86-video-tseng/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
-	bool "xf86-video-tseng"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Tseng Labs video driver
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
deleted file mode 100644
index dc3d8fa..0000000
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-tseng -- Tseng Labs video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_TSENG_VERSION = 1.2.3
-XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-v4l/Config.in b/package/x11r7/xdriver_xf86-video-v4l/Config.in
deleted file mode 100644
index 3bb41fc..0000000
--- a/package/x11r7/xdriver_xf86-video-v4l/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
-	bool "xf86-video-v4l"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  video4linux driver
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
deleted file mode 100644
index 214fc67..0000000
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-v4l -- video4linux driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_V4L_VERSION = 0.2.0
-XDRIVER_XF86_VIDEO_V4L_SOURCE = xf86-video-v4l-$(XDRIVER_XF86_VIDEO_V4L_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-vesa/Config.in b/package/x11r7/xdriver_xf86-video-vesa/Config.in
deleted file mode 100644
index 865f52c..0000000
--- a/package/x11r7/xdriver_xf86-video-vesa/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
-	bool "xf86-video-vesa"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Generic VESA video driver
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
deleted file mode 100644
index bf9ffe7..0000000
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- xf86-video-vesa-2.0.0/configure.ac.orig	2007-06-11 13:10:35.000000000 +0200
-+++ xf86-video-vesa-2.0.0/configure.ac	2007-06-11 14:16:45.000000000 +0200
-@@ -56,8 +56,8 @@
- PKG_CHECK_MODULES(XORG, xorg-server >= 1.0.99.901 xproto fontsproto $REQUIRED_MODULES)
- sdkdir=$(pkg-config --variable=sdkdir xorg-server)
- 
--CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
--INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
-+CFLAGS="$CFLAGS $XORG_CFLAGS "'-I$(top_srcdir)/src'
-+INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
- AC_SUBST([CFLAGS])
- AC_SUBST([INCLUDES])
- 
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
deleted file mode 100644
index bc4c38e..0000000
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-vesa -- Generic VESA video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_VESA_VERSION = 2.2.1
-XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
deleted file mode 100644
index 9093b38..0000000
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
-	bool "xf86-video-vmware"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  VMware SVGA video driver
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
deleted file mode 100644
index 4425112..0000000
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-vmware -- VMware SVGA video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_VMWARE_VERSION = 10.16.8
-XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
deleted file mode 100644
index 9b770be..0000000
--- a/package/x11r7/xdriver_xf86-video-voodoo/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
-	bool "xf86-video-voodoo"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  Voodoo video driver
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
deleted file mode 100644
index 86caaae..0000000
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-voodoo -- Voodoo video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_VOODOO_VERSION = 1.2.3
-XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
deleted file mode 100644
index 3b3d406..0000000
--- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
-	bool "xf86-video-wsfb"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
-	help
-	  WSFB based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
deleted file mode 100644
index 7dfbd8d..0000000
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-wsfb -- WSFB video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.3.0
-XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
deleted file mode 100644
index d0fe665..0000000
--- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
-	bool "xf86-video-xgi"
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  XGI based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
deleted file mode 100644
index fc7903c..0000000
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- xdriver_xf86-video-xgi-1.5.1/configure.ac.orig	2009-09-07 08:03:18.000000000 +0300
-+++ xdriver_xf86-video-xgi-1.5.1/configure.ac	2010-02-03 23:58:40.507035914 +0200
-@@ -78,12 +78,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "x$DRI" = xauto; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
-+        if test "$cross_compiling" = "no" ; then
-+                AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
-+                AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+                AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+        else
-+                have_dri_h="yes"
-+                have_sarea_h="yes"
-+                have_dristruct_h="yes"
-+        fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
deleted file mode 100644
index 837c9dd..0000000
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-xgi -- XGI video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_XGI_VERSION = 1.5.1
-XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_XGI_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
deleted file mode 100644
index 8d466f4..0000000
--- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
-	bool "xf86-video-xgixp"
-	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  XGIXP based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
deleted file mode 100644
index 9736252..0000000
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- xdriver_xf86-video-xgixp-1.7.99.4/configure.ac.orig	2009-09-07 08:09:14.000000000 +0300
-+++ xdriver_xf86-video-xgixp-1.7.99.4/configure.ac	2010-02-04 00:12:22.159108635 +0200
-@@ -63,12 +63,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- # Checks for header files.
- AC_HEADER_STDC
- 
--AC_CHECK_FILE([${sdkdir}/dri.h],
-+if test "$cross_compiling" = "no" ; then
-+        AC_CHECK_FILE([${sdkdir}/dri.h],
-               [have_dri_h="yes"], [have_dri_h="no"])
--AC_CHECK_FILE([${sdkdir}/sarea.h],
-+        AC_CHECK_FILE([${sdkdir}/sarea.h],
-               [have_sarea_h="yes"], [have_sarea_h="no"])
--AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+        AC_CHECK_FILE([${sdkdir}/dristruct.h],
-               [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+else
-+        have_dri_h="yes"
-+        have_sarea_h="yes"
-+        have_dristruct_h="yes"
-+fi
- 
- AC_DEFINE(XF86DRI_DEVEL,1,[Enable developmental DRI driver support])
- 
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
deleted file mode 100644
index a3edd20..0000000
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-xgixp -- XGIXP video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_XGIXP_VERSION = 1.7.99.4
-XDRIVER_XF86_VIDEO_XGIXP_SOURCE = xf86-video-xgixp-$(XDRIVER_XF86_VIDEO_XGIXP_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xfont_encodings/Config.in b/package/x11r7/xfont_encodings/Config.in
deleted file mode 100644
index af40da1..0000000
--- a/package/x11r7/xfont_encodings/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_ENCODINGS
-	bool "encodings"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
deleted file mode 100644
index 8c4aac4..0000000
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xfont_encodings -- No description available
-#
-################################################################################
-
-XFONT_ENCODINGS_VERSION = 1.0.3
-XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
-XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_ENCODINGS_MAKE_OPT =
-XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
-HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xfont_font-adobe-100dpi/Config.in b/package/x11r7/xfont_font-adobe-100dpi/Config.in
deleted file mode 100644
index aaac639..0000000
--- a/package/x11r7/xfont_font-adobe-100dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI
-	bool "font-adobe-100dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
deleted file mode 100644
index 45029e1..0000000
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-adobe-100dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_ADOBE_100DPI_VERSION = 1.0.1
-XFONT_FONT_ADOBE_100DPI_SOURCE = font-adobe-100dpi-$(XFONT_FONT_ADOBE_100DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-adobe-75dpi/Config.in b/package/x11r7/xfont_font-adobe-75dpi/Config.in
deleted file mode 100644
index f1c0a41..0000000
--- a/package/x11r7/xfont_font-adobe-75dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI
-	bool "font-adobe-75dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
deleted file mode 100644
index e172323..0000000
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-adobe-75dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.1
-XFONT_FONT_ADOBE_75DPI_SOURCE = font-adobe-75dpi-$(XFONT_FONT_ADOBE_75DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
deleted file mode 100644
index 02f2aeb..0000000
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI
-	bool "font-adobe-utopia-100dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
deleted file mode 100644
index cbb78ad..0000000
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-adobe-utopia-100dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.2
-XFONT_FONT_ADOBE_UTOPIA_100DPI_SOURCE = font-adobe-utopia-100dpi-$(XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in b/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
deleted file mode 100644
index 4a6e29c..0000000
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI
-	bool "font-adobe-utopia-75dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
deleted file mode 100644
index f4e9c8b..0000000
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-adobe-utopia-75dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.2
-XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in b/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
deleted file mode 100644
index d1efb70..0000000
--- a/package/x11r7/xfont_font-adobe-utopia-type1/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1
-	bool "font-adobe-utopia-type1"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
deleted file mode 100644
index 5056e63..0000000
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-adobe-utopia-type1 -- No description available
-#
-################################################################################
-
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.2
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_SOURCE = font-adobe-utopia-type1-$(XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION).tar.bz2
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-alias/Config.in b/package/x11r7/xfont_font-alias/Config.in
deleted file mode 100644
index b655160..0000000
--- a/package/x11r7/xfont_font-alias/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ALIAS
-	bool "font-alias"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
deleted file mode 100644
index 34b52e2..0000000
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-alias -- No description available
-#
-################################################################################
-
-XFONT_FONT_ALIAS_VERSION = 1.0.2
-XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
-XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-arabic-misc/Config.in b/package/x11r7/xfont_font-arabic-misc/Config.in
deleted file mode 100644
index acbdf7c..0000000
--- a/package/x11r7/xfont_font-arabic-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ARABIC_MISC
-	bool "font-arabic-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
deleted file mode 100644
index e26f998..0000000
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-arabic-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_ARABIC_MISC_VERSION = 1.0.1
-XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.bz2
-XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bh-100dpi/Config.in b/package/x11r7/xfont_font-bh-100dpi/Config.in
deleted file mode 100644
index dc405a2..0000000
--- a/package/x11r7/xfont_font-bh-100dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BH_100DPI
-	bool "font-bh-100dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
deleted file mode 100644
index 52e30b5..0000000
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bh-100dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_BH_100DPI_VERSION = 1.0.1
-XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.bz2
-XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bh-75dpi/Config.in b/package/x11r7/xfont_font-bh-75dpi/Config.in
deleted file mode 100644
index 6cd334e..0000000
--- a/package/x11r7/xfont_font-bh-75dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BH_75DPI
-	bool "font-bh-75dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
deleted file mode 100644
index 58ebb96..0000000
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bh-75dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_BH_75DPI_VERSION = 1.0.1
-XFONT_FONT_BH_75DPI_SOURCE = font-bh-75dpi-$(XFONT_FONT_BH_75DPI_VERSION).tar.bz2
-XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
deleted file mode 100644
index 0e082d5..0000000
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI
-	bool "font-bh-lucidatypewriter-100dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
deleted file mode 100644
index 7f3e82a..0000000
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bh-lucidatypewriter-100dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION = 1.0.1
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SOURCE = font-bh-lucidatypewriter-100dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION).tar.bz2
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
deleted file mode 100644
index 126fb85..0000000
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI
-	bool "font-bh-lucidatypewriter-75dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
deleted file mode 100644
index 35b1ecc..0000000
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bh-lucidatypewriter-75dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION = 1.0.1
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SOURCE = font-bh-lucidatypewriter-75dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION).tar.bz2
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bh-ttf/Config.in b/package/x11r7/xfont_font-bh-ttf/Config.in
deleted file mode 100644
index 2590798..0000000
--- a/package/x11r7/xfont_font-bh-ttf/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BH_TTF
-	bool "font-bh-ttf"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
deleted file mode 100644
index 2ded871..0000000
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bh-ttf -- No description available
-#
-################################################################################
-
-XFONT_FONT_BH_TTF_VERSION = 1.0.1
-XFONT_FONT_BH_TTF_SOURCE = font-bh-ttf-$(XFONT_FONT_BH_TTF_VERSION).tar.bz2
-XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bh-type1/Config.in b/package/x11r7/xfont_font-bh-type1/Config.in
deleted file mode 100644
index 047268c..0000000
--- a/package/x11r7/xfont_font-bh-type1/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BH_TYPE1
-	bool "font-bh-type1"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
deleted file mode 100644
index 524bbc6..0000000
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bh-type1 -- No description available
-#
-################################################################################
-
-XFONT_FONT_BH_TYPE1_VERSION = 1.0.1
-XFONT_FONT_BH_TYPE1_SOURCE = font-bh-type1-$(XFONT_FONT_BH_TYPE1_VERSION).tar.bz2
-XFONT_FONT_BH_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/Config.in b/package/x11r7/xfont_font-bitstream-100dpi/Config.in
deleted file mode 100644
index 81393c5..0000000
--- a/package/x11r7/xfont_font-bitstream-100dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI
-	bool "font-bitstream-100dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
deleted file mode 100644
index 46fe2f7..0000000
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bitstream-100dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_BITSTREAM_100DPI_VERSION = 1.0.1
-XFONT_FONT_BITSTREAM_100DPI_SOURCE = font-bitstream-100dpi-$(XFONT_FONT_BITSTREAM_100DPI_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/Config.in b/package/x11r7/xfont_font-bitstream-75dpi/Config.in
deleted file mode 100644
index bada475..0000000
--- a/package/x11r7/xfont_font-bitstream-75dpi/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI
-	bool "font-bitstream-75dpi"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
deleted file mode 100644
index f489def..0000000
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bitstream-75dpi -- No description available
-#
-################################################################################
-
-XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.1
-XFONT_FONT_BITSTREAM_75DPI_SOURCE = font-bitstream-75dpi-$(XFONT_FONT_BITSTREAM_75DPI_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bitstream-speedo/Config.in b/package/x11r7/xfont_font-bitstream-speedo/Config.in
deleted file mode 100644
index 70750f6..0000000
--- a/package/x11r7/xfont_font-bitstream-speedo/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO
-	bool "font-bitstream-speedo"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
deleted file mode 100644
index 72dd7cc..0000000
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bitstream-speedo -- No description available
-#
-################################################################################
-
-XFONT_FONT_BITSTREAM_SPEEDO_VERSION = 1.0.1
-XFONT_FONT_BITSTREAM_SPEEDO_SOURCE = font-bitstream-speedo-$(XFONT_FONT_BITSTREAM_SPEEDO_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_SPEEDO_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-bitstream-type1/Config.in b/package/x11r7/xfont_font-bitstream-type1/Config.in
deleted file mode 100644
index d482a6d..0000000
--- a/package/x11r7/xfont_font-bitstream-type1/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1
-	bool "font-bitstream-type1"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
deleted file mode 100644
index 5ee876e..0000000
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bitstream-type1 -- No description available
-#
-################################################################################
-
-XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.1
-XFONT_FONT_BITSTREAM_TYPE1_SOURCE = font-bitstream-type1-$(XFONT_FONT_BITSTREAM_TYPE1_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in b/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
deleted file mode 100644
index a0085f5..0000000
--- a/package/x11r7/xfont_font-cronyx-cyrillic/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC
-	bool "font-cronyx-cyrillic"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
deleted file mode 100644
index 7b8c25a..0000000
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-cronyx-cyrillic -- No description available
-#
-################################################################################
-
-XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.1
-XFONT_FONT_CRONYX_CYRILLIC_SOURCE = font-cronyx-cyrillic-$(XFONT_FONT_CRONYX_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-cursor-misc/Config.in b/package/x11r7/xfont_font-cursor-misc/Config.in
deleted file mode 100644
index 03ed530..0000000
--- a/package/x11r7/xfont_font-cursor-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
-	bool "font-cursor-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
deleted file mode 100644
index 47c5433..0000000
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-cursor-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_CURSOR_MISC_VERSION = 1.0.1
-XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.bz2
-XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-daewoo-misc/Config.in b/package/x11r7/xfont_font-daewoo-misc/Config.in
deleted file mode 100644
index 9e45341..0000000
--- a/package/x11r7/xfont_font-daewoo-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC
-	bool "font-daewoo-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
deleted file mode 100644
index 7b2d16d..0000000
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-daewoo-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.1
-XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSION).tar.bz2
-XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-dec-misc/Config.in b/package/x11r7/xfont_font-dec-misc/Config.in
deleted file mode 100644
index 326ea9b..0000000
--- a/package/x11r7/xfont_font-dec-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_DEC_MISC
-	bool "font-dec-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
deleted file mode 100644
index d90733d..0000000
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-dec-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_DEC_MISC_VERSION = 1.0.1
-XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.bz2
-XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-ibm-type1/Config.in b/package/x11r7/xfont_font-ibm-type1/Config.in
deleted file mode 100644
index 92783af..0000000
--- a/package/x11r7/xfont_font-ibm-type1/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_IBM_TYPE1
-	bool "font-ibm-type1"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
deleted file mode 100644
index 561179d..0000000
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-ibm-type1 -- No description available
-#
-################################################################################
-
-XFONT_FONT_IBM_TYPE1_VERSION = 1.0.1
-XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.bz2
-XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-isas-misc/Config.in b/package/x11r7/xfont_font-isas-misc/Config.in
deleted file mode 100644
index 2e77f66..0000000
--- a/package/x11r7/xfont_font-isas-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_ISAS_MISC
-	bool "font-isas-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
deleted file mode 100644
index 837ed13..0000000
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-isas-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_ISAS_MISC_VERSION = 1.0.1
-XFONT_FONT_ISAS_MISC_SOURCE = font-isas-misc-$(XFONT_FONT_ISAS_MISC_VERSION).tar.bz2
-XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-jis-misc/Config.in b/package/x11r7/xfont_font-jis-misc/Config.in
deleted file mode 100644
index 6a59cce..0000000
--- a/package/x11r7/xfont_font-jis-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_JIS_MISC
-	bool "font-jis-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
deleted file mode 100644
index 742a995..0000000
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-jis-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_JIS_MISC_VERSION = 1.0.1
-XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz2
-XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-micro-misc/Config.in b/package/x11r7/xfont_font-micro-misc/Config.in
deleted file mode 100644
index 1420cbd..0000000
--- a/package/x11r7/xfont_font-micro-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_MICRO_MISC
-	bool "font-micro-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
deleted file mode 100644
index 6f0bd58..0000000
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-micro-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_MICRO_MISC_VERSION = 1.0.1
-XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.bz2
-XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-misc-cyrillic/Config.in b/package/x11r7/xfont_font-misc-cyrillic/Config.in
deleted file mode 100644
index e793d70..0000000
--- a/package/x11r7/xfont_font-misc-cyrillic/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC
-	bool "font-misc-cyrillic"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
deleted file mode 100644
index 716e04a..0000000
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-misc-cyrillic -- No description available
-#
-################################################################################
-
-XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.1
-XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-misc-ethiopic/Config.in b/package/x11r7/xfont_font-misc-ethiopic/Config.in
deleted file mode 100644
index aa3b834..0000000
--- a/package/x11r7/xfont_font-misc-ethiopic/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC
-	bool "font-misc-ethiopic"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
deleted file mode 100644
index 2af5345..0000000
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-misc-ethiopic -- No description available
-#
-################################################################################
-
-XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.1
-XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.bz2
-XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-misc-meltho/Config.in b/package/x11r7/xfont_font-misc-meltho/Config.in
deleted file mode 100644
index dcc6c84..0000000
--- a/package/x11r7/xfont_font-misc-meltho/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_MISC_MELTHO
-	bool "font-misc-meltho"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
deleted file mode 100644
index 3707c1f..0000000
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-misc-meltho -- No description available
-#
-################################################################################
-
-XFONT_FONT_MISC_MELTHO_VERSION = 1.0.1
-XFONT_FONT_MISC_MELTHO_SOURCE = font-misc-meltho-$(XFONT_FONT_MISC_MELTHO_VERSION).tar.bz2
-XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-misc-misc/Config.in b/package/x11r7/xfont_font-misc-misc/Config.in
deleted file mode 100644
index b3e4fc1..0000000
--- a/package/x11r7/xfont_font-misc-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_MISC_MISC
-	bool "font-misc-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
deleted file mode 100644
index af4cc31..0000000
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# font-misc-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_MISC_MISC_VERSION = 1.1.0
-XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.bz2
-XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xfont_font-mutt-misc/Config.in b/package/x11r7/xfont_font-mutt-misc/Config.in
deleted file mode 100644
index e27ea74..0000000
--- a/package/x11r7/xfont_font-mutt-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_MUTT_MISC
-	bool "font-mutt-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
deleted file mode 100644
index 7c24ed9..0000000
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-mutt-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_MUTT_MISC_VERSION = 1.0.1
-XFONT_FONT_MUTT_MISC_SOURCE = font-mutt-misc-$(XFONT_FONT_MUTT_MISC_VERSION).tar.bz2
-XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-schumacher-misc/Config.in b/package/x11r7/xfont_font-schumacher-misc/Config.in
deleted file mode 100644
index d37babc..0000000
--- a/package/x11r7/xfont_font-schumacher-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC
-	bool "font-schumacher-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
deleted file mode 100644
index 2cf822e..0000000
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-schumacher-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.1.0
-XFONT_FONT_SCHUMACHER_MISC_SOURCE = font-schumacher-misc-$(XFONT_FONT_SCHUMACHER_MISC_VERSION).tar.bz2
-XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-screen-cyrillic/Config.in b/package/x11r7/xfont_font-screen-cyrillic/Config.in
deleted file mode 100644
index a1f02d0..0000000
--- a/package/x11r7/xfont_font-screen-cyrillic/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC
-	bool "font-screen-cyrillic"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
deleted file mode 100644
index 7db1b53..0000000
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-screen-cyrillic -- No description available
-#
-################################################################################
-
-XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.2
-XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-sony-misc/Config.in b/package/x11r7/xfont_font-sony-misc/Config.in
deleted file mode 100644
index a4ce4ab..0000000
--- a/package/x11r7/xfont_font-sony-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_SONY_MISC
-	bool "font-sony-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
deleted file mode 100644
index 53036af..0000000
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-sony-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_SONY_MISC_VERSION = 1.0.1
-XFONT_FONT_SONY_MISC_SOURCE = font-sony-misc-$(XFONT_FONT_SONY_MISC_VERSION).tar.bz2
-XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-sun-misc/Config.in b/package/x11r7/xfont_font-sun-misc/Config.in
deleted file mode 100644
index 07603a1..0000000
--- a/package/x11r7/xfont_font-sun-misc/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_SUN_MISC
-	bool "font-sun-misc"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
deleted file mode 100644
index 7001e5d..0000000
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-sun-misc -- No description available
-#
-################################################################################
-
-XFONT_FONT_SUN_MISC_VERSION = 1.0.1
-XFONT_FONT_SUN_MISC_SOURCE = font-sun-misc-$(XFONT_FONT_SUN_MISC_VERSION).tar.bz2
-XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-util/Config.in b/package/x11r7/xfont_font-util/Config.in
deleted file mode 100644
index 4edeffd..0000000
--- a/package/x11r7/xfont_font-util/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_UTIL
-	bool "font-util"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
deleted file mode 100644
index 680fdc7..0000000
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# font-util -- No description available
-#
-################################################################################
-
-XFONT_FONT_UTIL_VERSION = 1.1.1
-XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
-XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
-XFONT_FONT_UTIL_INSTALL_STAGING = YES
-XFONT_FONT_UTIL_INSTALL_TARGET = NO
-
-HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
deleted file mode 100644
index c804441..0000000
--- a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC
-	bool "font-winitzki-cyrillic"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
deleted file mode 100644
index 8a55a50..0000000
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-winitzki-cyrillic -- No description available
-#
-################################################################################
-
-XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.1
-XFONT_FONT_WINITZKI_CYRILLIC_SOURCE = font-winitzki-cyrillic-$(XFONT_FONT_WINITZKI_CYRILLIC_VERSION).tar.bz2
-XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xfont_font-xfree86-type1/Config.in b/package/x11r7/xfont_font-xfree86-type1/Config.in
deleted file mode 100644
index b7d0587..0000000
--- a/package/x11r7/xfont_font-xfree86-type1/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1
-	bool "font-xfree86-type1"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
deleted file mode 100644
index 999b789..0000000
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-xfree86-type1 -- No description available
-#
-################################################################################
-
-XFONT_FONT_XFREE86_TYPE1_VERSION = 1.0.2
-XFONT_FONT_XFREE86_TYPE1_SOURCE = font-xfree86-type1-$(XFONT_FONT_XFREE86_TYPE1_VERSION).tar.bz2
-XFONT_FONT_XFREE86_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
deleted file mode 100644
index 8e27dac..0000000
--- a/package/x11r7/xkeyboard-config/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XKEYBOARD_CONFIG
-	bool "xkeyboard-config"
-	select BR2_PACKAGE_XAPP_XKBCOMP
-	help
-	  keyboard configuration database for X
-
-	  http://xlibs.freedesktop.org/xkbdesc
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
deleted file mode 100644
index 61cd9fc..0000000
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-#############################################################
-#
-# xkeyboard-config
-#
-#############################################################
-XKEYBOARD_CONFIG_VERSION = 2.0
-XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
-XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
-XKEYBOARD_CONFIG_INSTALL_STAGING = NO
-XKEYBOARD_CONFIG_INSTALL_TARGET = YES
-XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
-
-XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
-
-$(eval $(call AUTOTARGETS))
-
diff --git a/package/x11r7/xlib_libFS/Config.in b/package/x11r7/xlib_libFS/Config.in
deleted file mode 100644
index 0c8a729..0000000
--- a/package/x11r7/xlib_libFS/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBFS
-	bool "libFS"
-	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	help
-	  X.Org FS library
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
deleted file mode 100644
index d6334aa..0000000
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libFS -- X.Org FS library
-#
-################################################################################
-
-XLIB_LIBFS_VERSION = 1.0.2
-XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
-XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBFS_INSTALL_STAGING = YES
-XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
-XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libICE/Config.in b/package/x11r7/xlib_libICE/Config.in
deleted file mode 100644
index d63f935..0000000
--- a/package/x11r7/xlib_libICE/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBICE
-	bool "libICE"
-	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org ICE library
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
deleted file mode 100644
index 566e1de..0000000
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libICE -- X.Org ICE library
-#
-################################################################################
-
-XLIB_LIBICE_VERSION = 1.0.6
-XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
-XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBICE_INSTALL_STAGING = YES
-XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libSM/Config.in b/package/x11r7/xlib_libSM/Config.in
deleted file mode 100644
index ef83b53..0000000
--- a/package/x11r7/xlib_libSM/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBSM
-	bool "libSM"
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org SM library
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
deleted file mode 100644
index 7ff5830..0000000
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libSM -- X.Org SM library
-#
-################################################################################
-
-XLIB_LIBSM_VERSION = 1.1.1
-XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
-XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBSM_INSTALL_STAGING = YES
-XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
-XLIB_LIBSM_CONF_OPT = --without-libuuid
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
deleted file mode 100644
index e1189ff..0000000
--- a/package/x11r7/xlib_libX11/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBX11
-	bool "libX11"
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XLIB_LIBXAU
-	select BR2_PACKAGE_XLIB_LIBXDMCP
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
-	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
-	select BR2_PACKAGE_XPROTO_XCMISCPROTO
-	help
-	  X.Org X11 library
diff --git a/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch b/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
deleted file mode 100644
index 9c4eae2..0000000
--- a/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-[patch]: configure: add --with-keysymdef argument for cross compilation
-
-Based on a similar patch from Openembedded.
-
-The libX11 configure script hardcodes the location to keysymdef.h as
-<prefix>/include/X11/keysymdef.h, which is fine for native compilation,
-but breaks with cross compilation as that directory is a location on
-the target, not the build host.
-
-Fix it by providing an explicit --with-keysymdef=<full-path-to-file>.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>Index: libX11-1.1.5/configure.ac
-===================================================================
-Index: xlib_libX11-1.3.2/configure.ac
-===================================================================
---- xlib_libX11-1.3.2.orig/configure.ac	2009-10-23 22:55:03.000000000 +0200
-+++ xlib_libX11-1.3.2/configure.ac	2010-05-04 16:26:39.000000000 +0200
-@@ -280,8 +280,15 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+      AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+      KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+      dir=`pkg-config --variable=includedir xproto`
-+      KEYSYMDEF="$dir/X11/keysymdef.h"
-+fi
-+
- if test -f "$KEYSYMDEF"; then
-         AC_MSG_RESULT([$KEYSYMDEF])
- else
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
deleted file mode 100644
index e017fea..0000000
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ /dev/null
@@ -1,43 +0,0 @@
-################################################################################
-#
-# xlib_libX11 -- X.Org X11 library
-#
-################################################################################
-
-XLIB_LIBX11_VERSION = 1.3.2
-XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
-XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBX11_AUTORECONF = YES
-XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto host-xproto_xproto
-XLIB_LIBX11_CONF_OPT = \
-	--disable-malloc0returnsnull \
-	--with-xcb \
-	--with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h \
-	--disable-specs
-
-HOST_XLIB_LIBX11_CONF_OPT = \
-	--disable-specs
-
-HOST_XLIB_LIBX11_DEPENDENCIES = host-xproto_xextproto host-libxcb host-xutil_util-macros host-xlib_xtrans host-xlib_libXau host-xlib_libXdmcp host-xproto_kbproto host-xproto_xproto host-xproto_xextproto host-xproto_inputproto host-xproto_xf86bigfontproto xproto_bigreqsproto host-xproto_xcmiscproto
-
-# src/util/makekeys is executed at build time to generate ks_tables.h, so
-# it should get compiled for the host. The libX11 makefile unfortunately
-# doesn't know about cross compilation so this doesn't work.
-# Long term, we should probably teach it about HOSTCC / HOST_CFLAGS, but for
-# now simply disable the src/util Makefile and build makekeys by hand in
-# advance
-define XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
-	echo '' > $(@D)/src/util/Makefile.am
-endef
-
-XLIB_LIBX11_POST_EXTRACT_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
-
-define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
-	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) -o makekeys makekeys.c
-endef
-
-XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXScrnSaver/Config.in b/package/x11r7/xlib_libXScrnSaver/Config.in
deleted file mode 100644
index 5df9a00..0000000
--- a/package/x11r7/xlib_libXScrnSaver/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXSCRNSAVER
-	bool "libXScrnSaver"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
-	help
-	  X.Org XScrnSaver library
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
deleted file mode 100644
index 00cc452..0000000
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXScrnSaver -- X.Org XScrnSaver library
-#
-################################################################################
-
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.0
-XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
-XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
-XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
-XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
deleted file mode 100644
index a220f01..0000000
--- a/package/x11r7/xlib_libXau/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXAU
-	bool "libXau"
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-	help
-	  X.Org Xau library
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
deleted file mode 100644
index f7eb3bd..0000000
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xlib_libXau -- X.Org Xau library
-#
-################################################################################
-
-XLIB_LIBXAU_VERSION = 1.0.5
-XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
-XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXAU_INSTALL_STAGING = YES
-XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
-
-HOST_XLIB_LIBXAU_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXaw/Config.in b/package/x11r7/xlib_libXaw/Config.in
deleted file mode 100644
index 1c10bc0..0000000
--- a/package/x11r7/xlib_libXaw/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXAW
-	bool "libXaw"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXPM
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XLIB_LIBXP
-	help
-	  X.Org Xaw library
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
deleted file mode 100644
index 1142c76..0000000
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXaw -- X.Org Xaw library
-#
-################################################################################
-
-XLIB_LIBXAW_VERSION = 1.0.7
-XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
-XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXAW_INSTALL_STAGING = YES
-XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
-XLIB_LIBXAW_CONF_OPT = --disable-docs
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXcomposite/Config.in b/package/x11r7/xlib_libXcomposite/Config.in
deleted file mode 100644
index 14da977..0000000
--- a/package/x11r7/xlib_libXcomposite/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
-	bool "libXcomposite"
-	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xcomposite library
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
deleted file mode 100644
index 919d6fc..0000000
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libXcomposite -- X.Org Xcomposite library
-#
-################################################################################
-
-XLIB_LIBXCOMPOSITE_VERSION = 0.4.1
-XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
-XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
-XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXcursor/Config.in b/package/x11r7/xlib_libXcursor/Config.in
deleted file mode 100644
index 6519cc7..0000000
--- a/package/x11r7/xlib_libXcursor/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXCURSOR
-	bool "libXcursor"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xcursor library
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
deleted file mode 100644
index 3c72bbb..0000000
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xlib_libXcursor -- X.Org Xcursor library
-#
-################################################################################
-
-XLIB_LIBXCURSOR_VERSION = 1.1.10
-XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
-XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXCURSOR_INSTALL_STAGING = YES
-XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
-
-HOST_XLIB_LIBXCURSOR_DEPENDENCIES = host-xlib_libX11 host-xlib_libXfixes host-xlib_libXrender host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXdamage/Config.in b/package/x11r7/xlib_libXdamage/Config.in
deleted file mode 100644
index 2427486..0000000
--- a/package/x11r7/xlib_libXdamage/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXDAMAGE
-	bool "libXdamage"
-	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xdamage library
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
deleted file mode 100644
index 9f10e56..0000000
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libXdamage -- X.Org Xdamage library
-#
-################################################################################
-
-XLIB_LIBXDAMAGE_VERSION = 1.1.2
-XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
-XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
-XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXdmcp/Config.in b/package/x11r7/xlib_libXdmcp/Config.in
deleted file mode 100644
index 218ff15..0000000
--- a/package/x11r7/xlib_libXdmcp/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXDMCP
-	bool "libXdmcp"
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xdmcp library
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
deleted file mode 100644
index 6f513cf..0000000
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xlib_libXdmcp -- X.Org Xdmcp library
-#
-################################################################################
-
-XLIB_LIBXDMCP_VERSION = 1.0.3
-XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
-XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXDMCP_INSTALL_STAGING = YES
-XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
-
-HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXext/Config.in b/package/x11r7/xlib_libXext/Config.in
deleted file mode 100644
index 823a165..0000000
--- a/package/x11r7/xlib_libXext/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXEXT
-	bool "libXext"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xext library
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
deleted file mode 100644
index 2cdffa6..0000000
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXext -- X.Org Xext library
-#
-################################################################################
-
-XLIB_LIBXEXT_VERSION = 1.1.1
-XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
-XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXEXT_INSTALL_STAGING = YES
-XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
-XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXfixes/Config.in b/package/x11r7/xlib_libXfixes/Config.in
deleted file mode 100644
index 9bbabb2..0000000
--- a/package/x11r7/xlib_libXfixes/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXFIXES
-	bool "libXfixes"
-	select BR2_PACKAGE_XPROTO_FIXESPROTO
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xfixes library
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
deleted file mode 100644
index 2d8b7fa..0000000
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xlib_libXfixes -- X.Org Xfixes library
-#
-################################################################################
-
-XLIB_LIBXFIXES_VERSION = 4.0.4
-XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
-XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFIXES_INSTALL_STAGING = YES
-XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
-
-HOST_XLIB_LIBXFIXES_DEPENDENCIES = host-xproto_fixesproto host-xlib_libX11 host-xproto_xextproto host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXfont/Config.in b/package/x11r7/xlib_libXfont/Config.in
deleted file mode 100644
index 407a099..0000000
--- a/package/x11r7/xlib_libXfont/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXFONT
-	bool "libXfont"
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_XLIB_LIBFONTENC
-	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XFONT_ENCODINGS
-	help
-	  X.Org Xfont library
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
deleted file mode 100644
index 303992f..0000000
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# xlib_libXfont -- X.Org Xfont library
-#
-################################################################################
-
-XLIB_LIBXFONT_VERSION = 1.4.1
-XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
-XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFONT_AUTORECONF = YES
-XLIB_LIBXFONT_INSTALL_STAGING = YES
-XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
-XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
-
-HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
-HOST_XLIB_LIBXFONT_DEPENDENCIES = host-freetype host-xlib_libfontenc host-xlib_xtrans host-xproto_fontcacheproto host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXfontcache/Config.in b/package/x11r7/xlib_libXfontcache/Config.in
deleted file mode 100644
index 3a20451..0000000
--- a/package/x11r7/xlib_libXfontcache/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXFONTCACHE
-	bool "libXfontcache"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
-	help
-	  X.Org Xfontcache library
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
deleted file mode 100644
index 1b1d4db..0000000
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXfontcache -- X.Org Xfontcache library
-#
-################################################################################
-
-XLIB_LIBXFONTCACHE_VERSION = 1.0.5
-XLIB_LIBXFONTCACHE_SOURCE = libXfontcache-$(XLIB_LIBXFONTCACHE_VERSION).tar.bz2
-XLIB_LIBXFONTCACHE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
-XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
-XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXft/Config.in b/package/x11r7/xlib_libXft/Config.in
deleted file mode 100644
index 6eef170..0000000
--- a/package/x11r7/xlib_libXft/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXFT
-	bool "libXft"
-	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xft library
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
deleted file mode 100644
index 44ddcbe..0000000
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXft -- X.Org Xft library
-#
-################################################################################
-
-XLIB_LIBXFT_VERSION = 2.1.14
-XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
-XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFT_AUTORECONF = YES
-XLIB_LIBXFT_INSTALL_STAGING = YES
-XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXi/Config.in b/package/x11r7/xlib_libXi/Config.in
deleted file mode 100644
index ca5ab59..0000000
--- a/package/x11r7/xlib_libXi/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXI
-	bool "libXi"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xi library
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
deleted file mode 100644
index 8c14007..0000000
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXi -- X.Org Xi library
-#
-################################################################################
-
-XLIB_LIBXI_VERSION = 1.3
-XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
-XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXI_INSTALL_STAGING = YES
-XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
-XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXinerama/Config.in b/package/x11r7/xlib_libXinerama/Config.in
deleted file mode 100644
index 5a79b4e..0000000
--- a/package/x11r7/xlib_libXinerama/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXINERAMA
-	bool "libXinerama"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	help
-	  X.Org Xinerama library
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
deleted file mode 100644
index aadf129..0000000
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXinerama -- X.Org Xinerama library
-#
-################################################################################
-
-XLIB_LIBXINERAMA_VERSION = 1.1
-XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
-XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXINERAMA_INSTALL_STAGING = YES
-XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
-XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXmu/Config.in b/package/x11r7/xlib_libXmu/Config.in
deleted file mode 100644
index ed239dc..0000000
--- a/package/x11r7/xlib_libXmu/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXMU
-	bool "libXmu"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xmu library
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
deleted file mode 100644
index ad0d49d..0000000
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libXmu -- X.Org Xmu library
-#
-################################################################################
-
-XLIB_LIBXMU_VERSION = 1.0.5
-XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
-XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXMU_INSTALL_STAGING = YES
-XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXp/Config.in b/package/x11r7/xlib_libXp/Config.in
deleted file mode 100644
index 532d8ac..0000000
--- a/package/x11r7/xlib_libXp/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXP
-	bool "libXp"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXAU
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_PRINTPROTO
-	help
-	  X.Org Xp library
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
deleted file mode 100644
index 1df392f..0000000
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXp -- X.Org Xp library
-#
-################################################################################
-
-XLIB_LIBXP_VERSION = 1.0.0
-XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
-XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXP_INSTALL_STAGING = YES
-XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
-XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
deleted file mode 100644
index 528498c..0000000
--- a/package/x11r7/xlib_libXpm/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXPM
-	bool "libXpm"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xpm library
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
deleted file mode 100644
index 6819f57..0000000
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libXpm -- X.Org Xpm library
-#
-################################################################################
-
-XLIB_LIBXPM_VERSION = 3.5.8
-XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
-XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXPM_INSTALL_STAGING = YES
-XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXprintAppUtil/Config.in b/package/x11r7/xlib_libXprintAppUtil/Config.in
deleted file mode 100644
index 351675a..0000000
--- a/package/x11r7/xlib_libXprintAppUtil/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL
-	bool "libXprintAppUtil"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	help
-	  X.Org XprintAppUtil library
diff --git a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
deleted file mode 100644
index f942626..0000000
--- a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libXprintAppUtil -- X.Org XprintAppUtil library
-#
-################################################################################
-
-XLIB_LIBXPRINTAPPUTIL_VERSION = 1.0.1
-XLIB_LIBXPRINTAPPUTIL_SOURCE = libXprintAppUtil-$(XLIB_LIBXPRINTAPPUTIL_VERSION).tar.bz2
-XLIB_LIBXPRINTAPPUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXPRINTAPPUTIL_INSTALL_STAGING = YES
-XLIB_LIBXPRINTAPPUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXprintUtil/Config.in b/package/x11r7/xlib_libXprintUtil/Config.in
deleted file mode 100644
index 1f397f4..0000000
--- a/package/x11r7/xlib_libXprintUtil/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	bool "libXprintUtil"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_PRINTPROTO
-	help
-	  X.Org XprintUtil library
diff --git a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
deleted file mode 100644
index b693b28..0000000
--- a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libXprintUtil -- X.Org XprintUtil library
-#
-################################################################################
-
-XLIB_LIBXPRINTUTIL_VERSION = 1.0.1
-XLIB_LIBXPRINTUTIL_SOURCE = libXprintUtil-$(XLIB_LIBXPRINTUTIL_VERSION).tar.bz2
-XLIB_LIBXPRINTUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
-XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXrandr/Config.in b/package/x11r7/xlib_libXrandr/Config.in
deleted file mode 100644
index 3b3ebd5..0000000
--- a/package/x11r7/xlib_libXrandr/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXRANDR
-	bool "libXrandr"
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xrandr library
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
deleted file mode 100644
index 038494b..0000000
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXrandr -- X.Org Xrandr library
-#
-################################################################################
-
-XLIB_LIBXRANDR_VERSION = 1.3.0
-XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
-XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXRANDR_INSTALL_STAGING = YES
-XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
-XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXrender/Config.in b/package/x11r7/xlib_libXrender/Config.in
deleted file mode 100644
index c723e4d..0000000
--- a/package/x11r7/xlib_libXrender/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXRENDER
-	bool "libXrender"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xrender library
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
deleted file mode 100644
index 9a2abe3..0000000
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# xlib_libXrender -- X.Org Xrender library
-#
-################################################################################
-
-XLIB_LIBXRENDER_VERSION = 0.9.5
-XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
-XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXRENDER_INSTALL_STAGING = YES
-XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
-XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
-
-HOST_XLIB_LIBXRENDER_DEPENDENCIES = host-xlib_libX11 host-xproto_renderproto host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXres/Config.in b/package/x11r7/xlib_libXres/Config.in
deleted file mode 100644
index 39abbbf..0000000
--- a/package/x11r7/xlib_libXres/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXRES
-	bool "libXres"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org XRes library
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
deleted file mode 100644
index 79c3bcf..0000000
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXres -- X.Org XRes library
-#
-################################################################################
-
-XLIB_LIBXRES_VERSION = 1.0.4
-XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
-XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXRES_INSTALL_STAGING = YES
-XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
-XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXt/Config.in b/package/x11r7/xlib_libXt/Config.in
deleted file mode 100644
index 6557e20..0000000
--- a/package/x11r7/xlib_libXt/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXT
-	bool "libXt"
-	select BR2_PACKAGE_XLIB_LIBSM
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XCB_PROTO
-	select BR2_PACKAGE_LIBXCB
-	help
-	  X.Org Xt library
diff --git a/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch b/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
deleted file mode 100644
index fc5ea7d..0000000
--- a/package/x11r7/xlib_libXt/xlib_libXt-1.0.7-fix-cross-compile.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From da5ba611fbff6f939a7cec9ca41fa7df0f76a197 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?R=C3=A9mi=20Cardona?= <remi@gentoo.org>
-Date: Thu, 5 Nov 2009 11:55:22 +0100
-Subject: [PATCH] fix cross-compile again
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-makestrs should always be built for the target arch. When cross-compiling,
-create a native version "xmakestrs" which will always be noinst, and use it
-to generate the other sources.
-
-This avoids installing a makestrs built for the wrong arch.
-
-Based on this patch :
-http://overlays.gentoo.org/proj/embedded/browser/openmoko/trunk/openmoko-target/x11-libs/libXt/files/libXt-1.0.7-crosscompile-makestr.patch
-
-Signed-off-by: R??mi Cardona <remi@gentoo.org>
----
- configure.ac     |    2 ++
- src/Makefile.am  |    8 +++++++-
- util/Makefile.am |   15 ++++++++++-----
- 3 files changed, 19 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6a66d45..73bfbc0 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,6 +40,8 @@ AC_PROG_LIBTOOL
- AM_PROG_CC_C_O
- XORG_DEFAULT_OPTIONS
- 
-+AM_CONDITIONAL(CROSS_COMPILING, [ test $cross_compiling = yes ])
-+
- if test x"$CC_FOR_BUILD" = x; then
- 	if test x"$cross_compiling" = xyes; then
- 		AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
-diff --git a/src/Makefile.am b/src/Makefile.am
-index a43fb22..6b767a7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -92,12 +92,18 @@ BUILT_FILES = $(BUILT_SOURCE) $(BUILT_HEADER)
- 
- STRING_LIST = $(top_srcdir)/util/string.list
- 
-+if CROSS_COMPILING
-+MAKESTRS=$(top_builddir)/util/xmakestrs
-+else
-+MAKESTRS=$(top_builddir)/util/makestrs
-+endif
-+
- all-local: $(BUILT_FILES)
- 
- $(BUILT_HEADER): $(BUILT_SOURCE)
- 
- $(BUILT_SOURCE):
--	$(top_builddir)/util/makestrs -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
-+	$(MAKESTRS) -i $(top_srcdir) $(STRINGSABIOPTIONS) < $(STRING_LIST) > StringDefs.c
- 	mkdir -p $(top_builddir)/src
- 	mkdir -p $(top_builddir)/include/X11
- 	cp StringDefs.h $(top_builddir)/include/X11
-diff --git a/util/Makefile.am b/util/Makefile.am
-index d51365e..6853d89 100644
---- a/util/Makefile.am
-+++ b/util/Makefile.am
-@@ -1,13 +1,10 @@
- if INSTALL_MAKESTRS
- bin_PROGRAMS = makestrs
-+noinst_PROGRAMS = $(MAKESTRS_PROG)
- else
--noinst_PROGRAMS = makestrs
-+noinst_PROGRAMS = makestrs $(MAKESTRS_PROG)
- endif
- 
--CC = @CC_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = \
- 	Shell.ht \
- 	StrDefs.ct \
-@@ -45,3 +42,11 @@ SUFFIXES = .$(APP_MAN_SUFFIX) .man
- 
- .man.$(APP_MAN_SUFFIX):
- 	$(AM_V_GEN)$(SED) $(MAN_SUBSTS) < $< > $@
-+
-+if CROSS_COMPILING
-+MAKESTRS_PROG=xmakestrs$(EXEEXT)
-+
-+xmakestrs$(EXEEXT): makestrs.c
-+	$(AM_V_GEN)$(CC_FOR_BUILD) $(X11_CFLAGS) $(CPPFLAGS_FOR_BUILD) \
-+	$(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ makestrs.c
-+endif
--- 
-1.6.5.2
-
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
deleted file mode 100644
index 765f0d5..0000000
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xlib_libXt -- X.Org Xt library
-#
-################################################################################
-
-XLIB_LIBXT_VERSION = 1.0.7
-XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
-XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXT_AUTORECONF = YES
-XLIB_LIBXT_INSTALL_STAGING = YES
-XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
-XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
deleted file mode 100644
index 8853bde..0000000
--- a/package/x11r7/xlib_libXtst/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXTST
-	bool "libXtst"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXI
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_RECORDPROTO
-	help
-	  X.Org Xtst library
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
deleted file mode 100644
index feab32a..0000000
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# xlib_libXtst -- X.Org Xtst library
-#
-################################################################################
-
-XLIB_LIBXTST_VERSION = 1.1.0
-XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
-XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXTST_INSTALL_STAGING = YES
-
-XLIB_LIBXTST_DEPENDENCIES = \
-	xlib_libX11 \
-	xlib_libXext \
-	xlib_libXi \
-	xproto_recordproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXv/Config.in b/package/x11r7/xlib_libXv/Config.in
deleted file mode 100644
index 90f07f3..0000000
--- a/package/x11r7/xlib_libXv/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXV
-	bool "libXv"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xv library
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
deleted file mode 100644
index c51e4d0..0000000
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXv -- X.Org Xv library
-#
-################################################################################
-
-XLIB_LIBXV_VERSION = 1.0.5
-XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
-XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXV_INSTALL_STAGING = YES
-XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
-XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXvMC/Config.in b/package/x11r7/xlib_libXvMC/Config.in
deleted file mode 100644
index 90c0e74..0000000
--- a/package/x11r7/xlib_libXvMC/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXVMC
-	bool "libXvMC"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXV
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org XvMC library
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
deleted file mode 100644
index 725fa1e..0000000
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXvMC -- X.Org XvMC library
-#
-################################################################################
-
-XLIB_LIBXVMC_VERSION = 1.0.5
-XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
-XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXVMC_INSTALL_STAGING = YES
-XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
-XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXxf86dga/Config.in b/package/x11r7/xlib_libXxf86dga/Config.in
deleted file mode 100644
index 5e21502..0000000
--- a/package/x11r7/xlib_libXxf86dga/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXXF86DGA
-	bool "libXxf86dga"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xxf86dga library
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
deleted file mode 100644
index 515bf51..0000000
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXxf86dga -- X.Org Xxf86dga library
-#
-################################################################################
-
-XLIB_LIBXXF86DGA_VERSION = 1.1.1
-XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
-XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
-XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
-XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXxf86vm/Config.in b/package/x11r7/xlib_libXxf86vm/Config.in
deleted file mode 100644
index 9e32188..0000000
--- a/package/x11r7/xlib_libXxf86vm/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXXF86VM
-	bool "libXxf86vm"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xxf86vm library
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
deleted file mode 100644
index b7a3292..0000000
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXxf86vm -- X.Org Xxf86vm library
-#
-################################################################################
-
-XLIB_LIBXXF86VM_VERSION = 1.1.0
-XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
-XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXXF86VM_INSTALL_STAGING = YES
-XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
-XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libdmx/Config.in b/package/x11r7/xlib_libdmx/Config.in
deleted file mode 100644
index 879f689..0000000
--- a/package/x11r7/xlib_libdmx/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBDMX
-	bool "libdmx"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_DMXPROTO
-	help
-	  X.Org dmx library
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
deleted file mode 100644
index bd21f22..0000000
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libdmx -- X.Org dmx library
-#
-################################################################################
-
-XLIB_LIBDMX_VERSION = 1.1.0
-XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
-XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBDMX_INSTALL_STAGING = YES
-XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
-XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
deleted file mode 100644
index d2a3023..0000000
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBFONTENC
-	bool "libfontenc"
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org fontenc library
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
deleted file mode 100644
index 948e244..0000000
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xlib_libfontenc -- X.Org fontenc library
-#
-################################################################################
-
-XLIB_LIBFONTENC_VERSION = 1.0.5
-XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
-XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBFONTENC_INSTALL_STAGING = YES
-XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
-
-HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_liboldX/Config.in b/package/x11r7/xlib_liboldX/Config.in
deleted file mode 100644
index e312921..0000000
--- a/package/x11r7/xlib_liboldX/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBOLDX
-	bool "liboldX"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  X.Org oldX library
diff --git a/package/x11r7/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
deleted file mode 100644
index 56895ab..0000000
--- a/package/x11r7/xlib_liboldX/xlib_liboldX.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_liboldX -- X.Org oldX library
-#
-################################################################################
-
-XLIB_LIBOLDX_VERSION = 1.0.1
-XLIB_LIBOLDX_SOURCE = liboldX-$(XLIB_LIBOLDX_VERSION).tar.bz2
-XLIB_LIBOLDX_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBOLDX_INSTALL_STAGING = YES
-XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
-XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/x11r7/xlib_libpciaccess/Config.in
deleted file mode 100644
index b53aa31..0000000
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBPCIACCESS
-	bool "libpciaccess"
-	depends on BR2_LARGEFILE
-	help
-	  X.Org libpciaccess
-
-comment "libpciaccess requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
deleted file mode 100644
index 6c78225..0000000
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xlib_libpciaccess -- X.Org pciaccess library
-#
-################################################################################
-
-XLIB_LIBPCIACCESS_VERSION = 0.11.0
-XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
-XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libxkbfile/Config.in b/package/x11r7/xlib_libxkbfile/Config.in
deleted file mode 100644
index ccd35fa..0000000
--- a/package/x11r7/xlib_libxkbfile/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXKBFILE
-	bool "libxkbfile"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	help
-	  X.Org xkbfile library
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
deleted file mode 100644
index d80fa0f..0000000
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xlib_libxkbfile -- X.Org xkbfile library
-#
-################################################################################
-
-XLIB_LIBXKBFILE_VERSION = 1.0.6
-XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
-XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXKBFILE_INSTALL_STAGING = YES
-XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
-
-HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xproto_kbproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libxkbui/Config.in b/package/x11r7/xlib_libxkbui/Config.in
deleted file mode 100644
index ceab305..0000000
--- a/package/x11r7/xlib_libxkbui/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXKBUI
-	bool "libxkbui"
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	help
-	  X.Org xkbui library
diff --git a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
deleted file mode 100644
index d605989..0000000
--- a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libxkbui -- X.Org xkbui library
-#
-################################################################################
-
-XLIB_LIBXKBUI_VERSION = 1.0.2
-XLIB_LIBXKBUI_SOURCE = libxkbui-$(XLIB_LIBXKBUI_VERSION).tar.bz2
-XLIB_LIBXKBUI_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXKBUI_INSTALL_STAGING = YES
-XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_xtrans/Config.in b/package/x11r7/xlib_xtrans/Config.in
deleted file mode 100644
index 7c8bae7..0000000
--- a/package/x11r7/xlib_xtrans/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XLIB_XTRANS
-	bool "xtrans"
-	help
-	  X.Org xtrans library
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
deleted file mode 100644
index a153f4a..0000000
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_xtrans -- X.Org xtrans library
-#
-################################################################################
-
-XLIB_XTRANS_VERSION = 1.2.5
-XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
-XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_XTRANS_INSTALL_STAGING = YES
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_applewmproto/Config.in b/package/x11r7/xproto_applewmproto/Config.in
deleted file mode 100644
index 51a5fd5..0000000
--- a/package/x11r7/xproto_applewmproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_APPLEWMPROTO
-	bool "applewmproto"
-	help
-	  No description available
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
deleted file mode 100644
index 0ba5830..0000000
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_applewmproto -- No description available
-#
-################################################################################
-
-XPROTO_APPLEWMPROTO_VERSION = 1.4.1
-XPROTO_APPLEWMPROTO_SOURCE = applewmproto-$(XPROTO_APPLEWMPROTO_VERSION).tar.bz2
-XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
-XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_bigreqsproto/Config.in b/package/x11r7/xproto_bigreqsproto/Config.in
deleted file mode 100644
index c431ef2..0000000
--- a/package/x11r7/xproto_bigreqsproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_BIGREQSPROTO
-	bool "bigreqsproto"
-	help
-	  X.Org BigReqs protocol headers
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
deleted file mode 100644
index c9ce4cc..0000000
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_bigreqsproto -- X.Org BigReqs protocol headers
-#
-################################################################################
-
-XPROTO_BIGREQSPROTO_VERSION = 1.1.0
-XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
-XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
-XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_compositeproto/Config.in b/package/x11r7/xproto_compositeproto/Config.in
deleted file mode 100644
index 136900a..0000000
--- a/package/x11r7/xproto_compositeproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_COMPOSITEPROTO
-	bool "compositeproto"
-	help
-	  X.Org Composite protocol headers
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
deleted file mode 100644
index becf87f..0000000
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_compositeproto -- X.Org Composite protocol headers
-#
-################################################################################
-
-XPROTO_COMPOSITEPROTO_VERSION = 0.4.1
-XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
-XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
-XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_damageproto/Config.in b/package/x11r7/xproto_damageproto/Config.in
deleted file mode 100644
index 068ed2b..0000000
--- a/package/x11r7/xproto_damageproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_DAMAGEPROTO
-	bool "damageproto"
-	help
-	  X.Org Damage protocol headers
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
deleted file mode 100644
index eb2d0a9..0000000
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_damageproto -- X.Org Damage protocol headers
-#
-################################################################################
-
-XPROTO_DAMAGEPROTO_VERSION = 1.2.0
-XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
-XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
-XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_dmxproto/Config.in b/package/x11r7/xproto_dmxproto/Config.in
deleted file mode 100644
index dc048b1..0000000
--- a/package/x11r7/xproto_dmxproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_DMXPROTO
-	bool "dmxproto"
-	help
-	  X.Org DMX protocol headers
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
deleted file mode 100644
index eb6a4b1..0000000
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_dmxproto -- X.Org DMX protocol headers
-#
-################################################################################
-
-XPROTO_DMXPROTO_VERSION = 2.3
-XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
-XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DMXPROTO_INSTALL_STAGING = YES
-XPROTO_DMXPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_dri2proto/Config.in b/package/x11r7/xproto_dri2proto/Config.in
deleted file mode 100644
index 3fe5aa1..0000000
--- a/package/x11r7/xproto_dri2proto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_DRI2PROTO
-	bool "dri2proto"
-	help
-	  X.Org DRI2 protocol headers
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
deleted file mode 100644
index 5fe2252..0000000
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_dri2proto -- X.Org DRI2 protocol headers
-#
-################################################################################
-
-XPROTO_DRI2PROTO_VERSION = 2.3
-XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
-XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DRI2PROTO_INSTALL_STAGING = YES
-XPROTO_DRI2PROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_fixesproto/Config.in b/package/x11r7/xproto_fixesproto/Config.in
deleted file mode 100644
index d419fa1..0000000
--- a/package/x11r7/xproto_fixesproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_FIXESPROTO
-	bool "fixesproto"
-	help
-	  X.Org Fixes protocol headers
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
deleted file mode 100644
index 3ead64f..0000000
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_fixesproto -- X.Org Fixes protocol headers
-#
-################################################################################
-
-XPROTO_FIXESPROTO_VERSION = 4.1.1
-XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
-XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FIXESPROTO_INSTALL_STAGING = YES
-XPROTO_FIXESPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_fontcacheproto/Config.in b/package/x11r7/xproto_fontcacheproto/Config.in
deleted file mode 100644
index daa6c7f..0000000
--- a/package/x11r7/xproto_fontcacheproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
-	bool "fontcacheproto"
-	help
-	  X.Org Fontcache protocol headers
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
deleted file mode 100644
index 5e5ff5e..0000000
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_fontcacheproto -- X.Org Fontcache protocol headers
-#
-################################################################################
-
-XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
-XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
-XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
-XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_fontsproto/Config.in b/package/x11r7/xproto_fontsproto/Config.in
deleted file mode 100644
index b00220c..0000000
--- a/package/x11r7/xproto_fontsproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_FONTSPROTO
-	bool "fontsproto"
-	help
-	  X.Org Fonts protocol headers
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
deleted file mode 100644
index 33c1a80..0000000
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_fontsproto -- X.Org Fonts protocol headers
-#
-################################################################################
-
-XPROTO_FONTSPROTO_VERSION = 2.1.0
-XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
-XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FONTSPROTO_INSTALL_STAGING = YES
-XPROTO_FONTSPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_glproto/Config.in b/package/x11r7/xproto_glproto/Config.in
deleted file mode 100644
index 28ceb9c..0000000
--- a/package/x11r7/xproto_glproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_GLPROTO
-	bool "glproto"
-	help
-	  X.Org GL protocol headers
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
deleted file mode 100644
index d5816cd..0000000
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_glproto -- X.Org GL protocol headers
-#
-################################################################################
-
-XPROTO_GLPROTO_VERSION = 1.4.10
-XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
-XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_GLPROTO_INSTALL_STAGING = YES
-XPROTO_GLPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_inputproto/Config.in b/package/x11r7/xproto_inputproto/Config.in
deleted file mode 100644
index fcccb26..0000000
--- a/package/x11r7/xproto_inputproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_INPUTPROTO
-	bool "inputproto"
-	help
-	  X.Org Input protocol headers
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
deleted file mode 100644
index 063a7f3..0000000
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_inputproto -- X.Org Input protocol headers
-#
-################################################################################
-
-XPROTO_INPUTPROTO_VERSION = 2.0
-XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
-XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_INPUTPROTO_INSTALL_STAGING = YES
-XPROTO_INPUTPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_kbproto/Config.in b/package/x11r7/xproto_kbproto/Config.in
deleted file mode 100644
index ce568d7..0000000
--- a/package/x11r7/xproto_kbproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_KBPROTO
-	bool "kbproto"
-	help
-	  X.Org KB protocol headers
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
deleted file mode 100644
index b2478f2..0000000
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_kbproto -- X.Org KB protocol headers
-#
-################################################################################
-
-XPROTO_KBPROTO_VERSION = 1.0.4
-XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
-XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_KBPROTO_INSTALL_STAGING = YES
-XPROTO_KBPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_printproto/Config.in b/package/x11r7/xproto_printproto/Config.in
deleted file mode 100644
index 69e214f..0000000
--- a/package/x11r7/xproto_printproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_PRINTPROTO
-	bool "printproto"
-	help
-	  X.Org Print protocol headers
diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
deleted file mode 100644
index b500002..0000000
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_printproto -- X.Org Print protocol headers
-#
-################################################################################
-
-XPROTO_PRINTPROTO_VERSION = 1.0.3
-XPROTO_PRINTPROTO_SOURCE = printproto-$(XPROTO_PRINTPROTO_VERSION).tar.bz2
-XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_PRINTPROTO_INSTALL_STAGING = YES
-XPROTO_PRINTPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_randrproto/Config.in b/package/x11r7/xproto_randrproto/Config.in
deleted file mode 100644
index 097ec8f..0000000
--- a/package/x11r7/xproto_randrproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RANDRPROTO
-	bool "randrproto"
-	help
-	  X.Org Randr protocol headers
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
deleted file mode 100644
index dd60b7f..0000000
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_randrproto -- X.Org Randr protocol headers
-#
-################################################################################
-
-XPROTO_RANDRPROTO_VERSION = 1.3.1
-XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
-XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RANDRPROTO_INSTALL_STAGING = YES
-XPROTO_RANDRPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_recordproto/Config.in b/package/x11r7/xproto_recordproto/Config.in
deleted file mode 100644
index 9fd5b88..0000000
--- a/package/x11r7/xproto_recordproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RECORDPROTO
-	bool "recordproto"
-	help
-	  X.Org Record protocol headers
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
deleted file mode 100644
index d37eec7..0000000
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_recordproto -- X.Org Record protocol headers
-#
-################################################################################
-
-XPROTO_RECORDPROTO_VERSION = 1.14
-XPROTO_RECORDPROTO_SOURCE = recordproto-$(XPROTO_RECORDPROTO_VERSION).tar.bz2
-XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RECORDPROTO_INSTALL_STAGING = YES
-XPROTO_RECORDPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_renderproto/Config.in b/package/x11r7/xproto_renderproto/Config.in
deleted file mode 100644
index 5b5806f..0000000
--- a/package/x11r7/xproto_renderproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RENDERPROTO
-	bool "renderproto"
-	help
-	  X.Org Render protocol headers
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
deleted file mode 100644
index 49d2fbc..0000000
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_renderproto -- X.Org Render protocol headers
-#
-################################################################################
-
-XPROTO_RENDERPROTO_VERSION = 0.11
-XPROTO_RENDERPROTO_SOURCE = renderproto-$(XPROTO_RENDERPROTO_VERSION).tar.bz2
-XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RENDERPROTO_INSTALL_STAGING = YES
-XPROTO_RENDERPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_resourceproto/Config.in b/package/x11r7/xproto_resourceproto/Config.in
deleted file mode 100644
index 4aec708..0000000
--- a/package/x11r7/xproto_resourceproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RESOURCEPROTO
-	bool "resourceproto"
-	help
-	  X.Org Resource protocol headers
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
deleted file mode 100644
index 134c76c..0000000
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_resourceproto -- X.Org Resource protocol headers
-#
-################################################################################
-
-XPROTO_RESOURCEPROTO_VERSION = 1.1.0
-XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
-XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
-XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_scrnsaverproto/Config.in b/package/x11r7/xproto_scrnsaverproto/Config.in
deleted file mode 100644
index 83176a0..0000000
--- a/package/x11r7/xproto_scrnsaverproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
-	bool "scrnsaverproto"
-	help
-	  X.Org ScrnSaver protocol headers
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
deleted file mode 100644
index 7eee0f8..0000000
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_scrnsaverproto -- X.Org ScrnSaver protocol headers
-#
-################################################################################
-
-XPROTO_SCRNSAVERPROTO_VERSION = 1.2.0
-XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
-XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
-XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_videoproto/Config.in b/package/x11r7/xproto_videoproto/Config.in
deleted file mode 100644
index 271c78f..0000000
--- a/package/x11r7/xproto_videoproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_VIDEOPROTO
-	bool "videoproto"
-	help
-	  X.Org Video protocol headers
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
deleted file mode 100644
index 1fd61a8..0000000
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_videoproto -- X.Org Video protocol headers
-#
-################################################################################
-
-XPROTO_VIDEOPROTO_VERSION = 2.3.0
-XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
-XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
-XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_windowswmproto/Config.in b/package/x11r7/xproto_windowswmproto/Config.in
deleted file mode 100644
index d1a36ac..0000000
--- a/package/x11r7/xproto_windowswmproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO
-	bool "windowswmproto"
-	help
-	  No description available
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
deleted file mode 100644
index 4e1ea80..0000000
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_windowswmproto -- No description available
-#
-################################################################################
-
-XPROTO_WINDOWSWMPROTO_VERSION = 1.0.4
-XPROTO_WINDOWSWMPROTO_SOURCE = windowswmproto-$(XPROTO_WINDOWSWMPROTO_VERSION).tar.bz2
-XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
-XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xcmiscproto/Config.in b/package/x11r7/xproto_xcmiscproto/Config.in
deleted file mode 100644
index f7ba153..0000000
--- a/package/x11r7/xproto_xcmiscproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XCMISCPROTO
-	bool "xcmiscproto"
-	help
-	  X.Org XCMisc protocol headers
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
deleted file mode 100644
index f8e498d..0000000
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_xcmiscproto -- X.Org XCMisc protocol headers
-#
-################################################################################
-
-XPROTO_XCMISCPROTO_VERSION = 1.2.0
-XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
-XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
-XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_xextproto/Config.in b/package/x11r7/xproto_xextproto/Config.in
deleted file mode 100644
index d80d76c..0000000
--- a/package/x11r7/xproto_xextproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XEXTPROTO
-	bool "xextproto"
-	help
-	  X.Org XExt protocol headers
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
deleted file mode 100644
index 881ab70..0000000
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_xextproto -- X.Org XExt protocol headers
-#
-################################################################################
-
-XPROTO_XEXTPROTO_VERSION = 7.1.1
-XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
-XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XEXTPROTO_INSTALL_STAGING = YES
-XPROTO_XEXTPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_xf86bigfontproto/Config.in b/package/x11r7/xproto_xf86bigfontproto/Config.in
deleted file mode 100644
index 7af30d0..0000000
--- a/package/x11r7/xproto_xf86bigfontproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
-	bool "xf86bigfontproto"
-	help
-	  X.Org XF86BigFont protocol headers
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
deleted file mode 100644
index 87b607e..0000000
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_xf86bigfontproto -- X.Org XF86BigFont protocol headers
-#
-################################################################################
-
-XPROTO_XF86BIGFONTPROTO_VERSION = 1.2.0
-XPROTO_XF86BIGFONTPROTO_SOURCE = xf86bigfontproto-$(XPROTO_XF86BIGFONTPROTO_VERSION).tar.bz2
-XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
-XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_xf86dgaproto/Config.in b/package/x11r7/xproto_xf86dgaproto/Config.in
deleted file mode 100644
index 7561b8a..0000000
--- a/package/x11r7/xproto_xf86dgaproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	bool "xf86dgaproto"
-	help
-	  X.Org XF86DGA protocol headers
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
deleted file mode 100644
index e8aed3c..0000000
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_xf86dgaproto -- X.Org XF86DGA protocol headers
-#
-################################################################################
-
-XPROTO_XF86DGAPROTO_VERSION = 2.1
-XPROTO_XF86DGAPROTO_SOURCE = xf86dgaproto-$(XPROTO_XF86DGAPROTO_VERSION).tar.bz2
-XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
-XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86driproto/Config.in b/package/x11r7/xproto_xf86driproto/Config.in
deleted file mode 100644
index 8aeac87..0000000
--- a/package/x11r7/xproto_xf86driproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	bool "xf86driproto"
-	help
-	  X.Org XF86DRI protocol headers
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
deleted file mode 100644
index 0eb57f6..0000000
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_xf86driproto -- X.Org XF86DRI protocol headers
-#
-################################################################################
-
-XPROTO_XF86DRIPROTO_VERSION = 2.1.0
-XPROTO_XF86DRIPROTO_SOURCE = xf86driproto-$(XPROTO_XF86DRIPROTO_VERSION).tar.bz2
-XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
-XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86rushproto/Config.in b/package/x11r7/xproto_xf86rushproto/Config.in
deleted file mode 100644
index 961c31f..0000000
--- a/package/x11r7/xproto_xf86rushproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86RUSHPROTO
-	bool "xf86rushproto"
-	help
-	  X.Org XF86Rush protocol headers
diff --git a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
deleted file mode 100644
index 577e325..0000000
--- a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_xf86rushproto -- X.Org XF86Rush protocol headers
-#
-################################################################################
-
-XPROTO_XF86RUSHPROTO_VERSION = 1.1.2
-XPROTO_XF86RUSHPROTO_SOURCE = xf86rushproto-$(XPROTO_XF86RUSHPROTO_VERSION).tar.bz2
-XPROTO_XF86RUSHPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86RUSHPROTO_INSTALL_STAGING = YES
-XPROTO_XF86RUSHPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86vidmodeproto/Config.in b/package/x11r7/xproto_xf86vidmodeproto/Config.in
deleted file mode 100644
index 395c175..0000000
--- a/package/x11r7/xproto_xf86vidmodeproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
-	bool "xf86vidmodeproto"
-	help
-	  X.Org XF86VidMode protocol headers
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
deleted file mode 100644
index 0194070..0000000
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_xf86vidmodeproto -- X.Org XF86VidMode protocol headers
-#
-################################################################################
-
-XPROTO_XF86VIDMODEPROTO_VERSION = 2.3
-XPROTO_XF86VIDMODEPROTO_SOURCE = xf86vidmodeproto-$(XPROTO_XF86VIDMODEPROTO_VERSION).tar.bz2
-XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
-XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xineramaproto/Config.in b/package/x11r7/xproto_xineramaproto/Config.in
deleted file mode 100644
index 12c8e05..0000000
--- a/package/x11r7/xproto_xineramaproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	bool "xineramaproto"
-	help
-	  X.Org Xinerama protocol headers
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
deleted file mode 100644
index ad2357c..0000000
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_xineramaproto -- X.Org Xinerama protocol headers
-#
-################################################################################
-
-XPROTO_XINERAMAPROTO_VERSION = 1.2
-XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
-XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
-XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xproto/Config.in b/package/x11r7/xproto_xproto/Config.in
deleted file mode 100644
index a5f88ef..0000000
--- a/package/x11r7/xproto_xproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XPROTO
-	bool "xproto"
-	help
-	  X.Org xproto protocol headers
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
deleted file mode 100644
index 8f81d05..0000000
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_xproto -- X.Org xproto protocol headers
-#
-################################################################################
-
-XPROTO_XPROTO_VERSION = 7.0.16
-XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
-XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XPROTO_INSTALL_STAGING = YES
-XPROTO_XPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xutil_makedepend/Config.in b/package/x11r7/xutil_makedepend/Config.in
deleted file mode 100644
index 0b091b0..0000000
--- a/package/x11r7/xutil_makedepend/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XUTIL_MAKEDEPEND
-	bool "makedepend"
-	help
-	  No description available
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
deleted file mode 100644
index 5c7bfd3..0000000
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xutil_makedepend -- No description available
-#
-################################################################################
-
-XUTIL_MAKEDEPEND_VERSION = 1.0.2
-XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
-XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
-XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
-XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
-
-HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xutil_util-macros/Config.in b/package/x11r7/xutil_util-macros/Config.in
deleted file mode 100644
index 10b1a59..0000000
--- a/package/x11r7/xutil_util-macros/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XUTIL_UTIL_MACROS
-	bool "util-macros"
-	help
-	  No description available
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch
deleted file mode 100644
index de3ff01..0000000
--- a/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- xutil_util-macros-1.3.0/xorg-macros.m4.in.orig	2010-01-23 19:23:30.306334212 +0200
-+++ xutil_util-macros-1.3.0/xorg-macros.m4.in	2010-01-23 19:25:03.462333685 +0200
-@@ -499,3 +499,6 @@ XORG_RELEASE_VERSION
- XORG_CHANGELOG
- XORG_MANPAGE_SECTIONS
- ]) # XORG_DEFAULT_OPTIONS
-+
-+# Buildroot stuff
-+AC_SUBST(STAGING_DIR)
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
deleted file mode 100644
index c06cf01..0000000
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xutil_util-macros -- No description available
-#
-################################################################################
-
-XUTIL_UTIL_MACROS_VERSION = 1.3.0
-XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
-XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
-XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
-XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-- 
1.7.0.4
