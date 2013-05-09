From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:50:55 +0200
Subject: [Buildroot] [PATCH 00/12] Add license informations to X.org stack
Message-ID: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches adds license informations to all packages in
package/x11r7 as well as a few other packages that are dependencies of
the X.org server.

The most annoying packages are the xfont_* ones, still they have very
varying licenses. Those ones should certainly be the one that should
be reviewed the most carefully.

Generally speaking, I'm wondering if it's really necessary to have all
those font packages. Do people actually use those old X.org fonts?

Best regards,

Thomas

Thomas Petazzoni (12):
  package/x11r7: add license informations to xapp_* packages
  package/x11r7: add license informations to xproto_* packages
  package/x11r7: add license informations to xdriver_* packages
  package/x11r7: add license informations to xlib_* packages
  package/x11r7: add license informations to xutil_* packages
  package/x11r7: add license informations to xfont_* packages
  package/x11r7: add license informations to misc other packages
  xserver_xorg-server: add license informations
  libatomic_ops: add license informations
  libdrm: add license informations
  libsha1: add license informations
  pixman: add license informations

 package/libatomic_ops/libatomic_ops.mk             |   10 ++++++++++
 package/libdrm/libdrm.mk                           |    3 +++
 package/libsha1/libsha1.mk                         |    3 +++
 package/pixman/pixman.mk                           |    3 +++
 package/x11r7/libxcb/libxcb.mk                     |    2 ++
 package/x11r7/mcookie/mcookie.mk                   |    1 +
 package/x11r7/mesa3d/mesa3d.mk                     |    3 +++
 package/x11r7/xapp_appres/xapp_appres.mk           |    2 ++
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    2 ++
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |    2 ++
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |    2 ++
 package/x11r7/xapp_editres/xapp_editres.mk         |    2 ++
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |    2 ++
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |    2 ++
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |    2 ++
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |    2 ++
 package/x11r7/xapp_ico/xapp_ico.mk                 |    2 ++
 package/x11r7/xapp_listres/xapp_listres.mk         |    2 ++
 package/x11r7/xapp_luit/xapp_luit.mk               |    2 ++
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |    2 ++
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    2 ++
 package/x11r7/xapp_oclock/xapp_oclock.mk           |    2 ++
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |    2 ++
 package/x11r7/xapp_rstart/xapp_rstart.mk           |    2 ++
 package/x11r7/xapp_scripts/xapp_scripts.mk         |    2 ++
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |    2 ++
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |    2 ++
 package/x11r7/xapp_showfont/xapp_showfont.mk       |    2 ++
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |    2 ++
 package/x11r7/xapp_twm/xapp_twm.mk                 |    2 ++
 package/x11r7/xapp_viewres/xapp_viewres.mk         |    2 ++
 package/x11r7/xapp_x11perf/xapp_x11perf.mk         |    2 ++
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 ++
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |    2 ++
 package/x11r7/xapp_xbiff/xapp_xbiff.mk             |    2 ++
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |    2 ++
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |    2 ++
 package/x11r7/xapp_xclock/xapp_xclock.mk           |    2 ++
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |    2 ++
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |    2 ++
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |    2 ++
 package/x11r7/xapp_xditview/xapp_xditview.mk       |    2 ++
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |    2 ++
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 ++
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |    2 ++
 package/x11r7/xapp_xedit/xapp_xedit.mk             |    2 ++
 package/x11r7/xapp_xev/xapp_xev.mk                 |    2 ++
 package/x11r7/xapp_xeyes/xapp_xeyes.mk             |    2 ++
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |    2 ++
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |    2 ++
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |    2 ++
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |    2 ++
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |    2 ++
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |    2 ++
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    2 ++
 package/x11r7/xapp_xhost/xapp_xhost.mk             |    2 ++
 .../xapp_xinput-calibrator.mk                      |    2 ++
 package/x11r7/xapp_xinput/xapp_xinput.mk           |    2 ++
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    2 ++
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |    2 ++
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk       |    2 ++
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |    2 ++
 package/x11r7/xapp_xkill/xapp_xkill.mk             |    2 ++
 package/x11r7/xapp_xload/xapp_xload.mk             |    2 ++
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    2 ++
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |    2 ++
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |    2 ++
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |    2 ++
 package/x11r7/xapp_xmag/xapp_xmag.mk               |    2 ++
 package/x11r7/xapp_xman/xapp_xman.mk               |    2 ++
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |    2 ++
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |    2 ++
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    2 ++
 package/x11r7/xapp_xmore/xapp_xmore.mk             |    2 ++
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |    2 ++
 package/x11r7/xapp_xprop/xapp_xprop.mk             |    2 ++
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 ++
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |    2 ++
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |    2 ++
 package/x11r7/xapp_xset/xapp_xset.mk               |    2 ++
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk       |    2 ++
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |    2 ++
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |    2 ++
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |    2 ++
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |    2 ++
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |    2 ++
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |    2 ++
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |    2 ++
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |    2 ++
 package/x11r7/xapp_xwud/xapp_xwud.mk               |    2 ++
 package/x11r7/xcb-proto/xcb-proto.mk               |    2 ++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |    4 ++++
 package/x11r7/xcb-util/xcb-util.mk                 |    4 ++++
 .../xcursor-transparent-theme.mk                   |    2 ++
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |    3 +++
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    3 +++
 .../xdriver_xf86-input-evdev.mk                    |    2 ++
 .../xdriver_xf86-input-joystick.mk                 |    2 ++
 .../xdriver_xf86-input-keyboard.mk                 |    2 ++
 .../xdriver_xf86-input-mouse.mk                    |    2 ++
 .../xdriver_xf86-input-synaptics.mk                |    2 ++
 .../xdriver_xf86-input-tslib.mk                    |    2 ++
 .../xdriver_xf86-input-vmmouse.mk                  |    2 ++
 .../xdriver_xf86-input-void.mk                     |    2 ++
 .../xdriver_xf86-video-ark.mk                      |    2 ++
 .../xdriver_xf86-video-ast.mk                      |    2 ++
 .../xdriver_xf86-video-ati.mk                      |    2 ++
 .../xdriver_xf86-video-cirrus.mk                   |    2 ++
 .../xdriver_xf86-video-dummy.mk                    |    2 ++
 .../xdriver_xf86-video-fbdev.mk                    |    2 ++
 .../xdriver_xf86-video-geode.mk                    |    2 ++
 .../xdriver_xf86-video-glide.mk                    |    2 ++
 .../xdriver_xf86-video-glint.mk                    |    2 ++
 .../xdriver_xf86-video-i128.mk                     |    2 ++
 .../xdriver_xf86-video-intel.mk                    |    2 ++
 .../xdriver_xf86-video-mach64.mk                   |    2 ++
 .../xdriver_xf86-video-mga.mk                      |    2 ++
 .../xdriver_xf86-video-neomagic.mk                 |    2 ++
 .../xdriver_xf86-video-newport.mk                  |    2 ++
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    2 ++
 .../xdriver_xf86-video-openchrome.mk               |    2 ++
 .../xdriver_xf86-video-r128.mk                     |    2 ++
 .../xdriver_xf86-video-savage.mk                   |    2 ++
 .../xdriver_xf86-video-siliconmotion.mk            |    2 ++
 .../xdriver_xf86-video-sis.mk                      |    2 ++
 .../xdriver_xf86-video-tdfx.mk                     |    2 ++
 .../xdriver_xf86-video-tga.mk                      |    2 ++
 .../xdriver_xf86-video-trident.mk                  |    2 ++
 .../xdriver_xf86-video-v4l.mk                      |    2 ++
 .../xdriver_xf86-video-vesa.mk                     |    2 ++
 .../xdriver_xf86-video-vmware.mk                   |    2 ++
 .../xdriver_xf86-video-voodoo.mk                   |    2 ++
 .../xdriver_xf86-video-wsfb.mk                     |    2 ++
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    3 +++
 .../xfont_font-adobe-100dpi.mk                     |    3 +++
 .../xfont_font-adobe-75dpi.mk                      |    3 +++
 .../xfont_font-adobe-utopia-100dpi.mk              |    3 +++
 .../xfont_font-adobe-utopia-75dpi.mk               |    3 +++
 .../xfont_font-adobe-utopia-type1.mk               |    3 +++
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    3 +++
 .../xfont_font-arabic-misc.mk                      |    3 +++
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    3 +++
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    3 +++
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    3 +++
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    3 +++
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    3 +++
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    3 +++
 .../xfont_font-bitstream-100dpi.mk                 |    3 +++
 .../xfont_font-bitstream-75dpi.mk                  |    3 +++
 .../xfont_font-bitstream-type1.mk                  |    3 +++
 .../xfont_font-cronyx-cyrillic.mk                  |    3 +++
 .../xfont_font-cursor-misc.mk                      |    3 +++
 .../xfont_font-daewoo-misc.mk                      |    2 ++
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    3 +++
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    3 +++
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    3 +++
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    2 ++
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    3 +++
 .../xfont_font-misc-cyrillic.mk                    |    3 +++
 .../xfont_font-misc-ethiopic.mk                    |    3 +++
 .../xfont_font-misc-meltho.mk                      |    3 +++
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    3 +++
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    3 +++
 .../xfont_font-schumacher-misc.mk                  |    3 +++
 .../xfont_font-screen-cyrillic.mk                  |    3 +++
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    3 +++
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    3 +++
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    3 +++
 .../xfont_font-winitzki-cyrillic.mk                |    3 +++
 .../xfont_font-xfree86-type1.mk                    |    3 +++
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 ++
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    2 ++
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 ++
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 ++
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 ++
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 ++
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 ++
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 ++
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    2 ++
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    2 ++
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    2 ++
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 ++
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    2 ++
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 ++
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    2 ++
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 ++
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 ++
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    2 ++
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 ++
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 ++
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 ++
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 ++
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 ++
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 ++
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 ++
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 ++
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 ++
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 ++
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 ++
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    2 ++
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 ++
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |    2 ++
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    2 ++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    2 ++
 .../xproto_applewmproto/xproto_applewmproto.mk     |    2 ++
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 ++
 .../xproto_compositeproto/xproto_compositeproto.mk |    2 ++
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    2 ++
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk   |    2 ++
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 ++
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    2 ++
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    2 ++
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    2 ++
 package/x11r7/xproto_glproto/xproto_glproto.mk     |    2 ++
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    2 ++
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    2 ++
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 ++
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    2 ++
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    2 ++
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 ++
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 ++
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 ++
 .../xproto_windowswmproto/xproto_windowswmproto.mk |    2 ++
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    2 ++
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 ++
 .../xproto_xf86bigfontproto.mk                     |    2 ++
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |    2 ++
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |    2 ++
 .../xproto_xf86vidmodeproto.mk                     |    2 ++
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    2 ++
 package/x11r7/xproto_xproto/xproto_xproto.mk       |    2 ++
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 ++
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 ++
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    3 +++
 234 files changed, 521 insertions(+)

-- 
1.7.9.5
