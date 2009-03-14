From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Mar 2009 14:59:16 +0000 (UTC)
Subject: [Buildroot] svn commit: [25653] trunk/buildroot/package/x11r7:
	mesa3d openchrome xapp_bitmap xapp_luit etc...
Message-ID: <20090314145916.966C37643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-14 14:59:14 +0000 (Sat, 14 Mar 2009)
New Revision: 25653

Log:
x11r7: update to 7.4

Patch by Dan Lykowski <lykowdk@gmail.com>, closes #181.

Minor fixups for kdrive by me.

Added:
   trunk/buildroot/package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
   trunk/buildroot/package/x11r7/xapp_xbacklight/
   trunk/buildroot/package/x11r7/xapp_xbacklight/Config.in
   trunk/buildroot/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
   trunk/buildroot/package/x11r7/xapp_xinput/
   trunk/buildroot/package/x11r7/xapp_xinput/Config.in
   trunk/buildroot/package/x11r7/xapp_xinput/xapp_xbacklight.mk
   trunk/buildroot/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.3-clone-redef.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics-0.15.0-configure.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-geode/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-geode/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glide/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glide/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.1-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-impact/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-impact/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-impact/xdriver_xf86-video-impact.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mach64/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mach64/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-openchrome/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-openchrome/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-openchrome/openchrome-0.2.903-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-openchrome/openchrome.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-r128/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-r128/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb-1.2.0.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-1.2.0-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vermilion/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vermilion/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vermilion/xdriver_xf86-video-vermilion.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-wsfb/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-wsfb/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgixp/
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgixp/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-makekeys-nocc.patch
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt-1.0.5-makestrs-nocc.patch
   trunk/buildroot/package/x11r7/xlib_libpciaccess/
   trunk/buildroot/package/x11r7/xlib_libpciaccess/Config.in
   trunk/buildroot/package/x11r7/xlib_libpciaccess/xlib_libpciaccess-0.10.3-fix_mtrr_check.patch
   trunk/buildroot/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-servermd-add-avr32.patch
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.5-tslib-fix.patch
   trunk/buildroot/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6-linuxdoc.patch
   trunk/buildroot/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.6.patch

Removed:
   trunk/buildroot/package/x11r7/mesa3d/mesa3d-7.0.3-cleanup.patch
   trunk/buildroot/package/x11r7/mesa3d/mesa3d-7.0.3-gen_matypes.patch
   trunk/buildroot/package/x11r7/openchrome/Config.in
   trunk/buildroot/package/x11r7/openchrome/openchrome-0.2.902-cross-compile.patch
   trunk/buildroot/package/x11r7/openchrome/openchrome.mk
   trunk/buildroot/package/x11r7/xapp_xauth/xapp_xauth-1.0.2-xcb.patch
   trunk/buildroot/package/x11r7/xapp_xrandr/xapp_xrandr-1.2.2-clone-redef.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-calcomp/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-calcomp/xdriver_xf86-input-calcomp.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-citron/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-citron/xdriver_xf86-input-citron.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-digitaledge/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-digitaledge/xdriver_xf86-input-digitaledge.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-dmc/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-dmc/xdriver_xf86-input-dmc.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-dynapro/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-dynapro/xdriver_xf86-input-dynapro.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-elo2300/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-elo2300/xdriver_xf86-input-elo2300.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-elographics/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-elographics/xdriver_xf86-input-elographics.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-10-bitfield-fixes.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-11-bitops-fixes.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-20-add-inotify-architectures.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-30-absolute-axis.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-40-close-fd.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-50-xinput.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-fpit/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-fpit/xdriver_xf86-input-fpit.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-hyperpen/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-hyperpen/xdriver_xf86-input-hyperpen.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-jamstudio/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-jamstudio/xdriver_xf86-input-jamstudio.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-magellan/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-magellan/xdriver_xf86-input-magellan.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-magictouch/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-magictouch/xdriver_xf86-input-magictouch.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-microtouch/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-microtouch/xdriver_xf86-input-microtouch.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-mutouch/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-mutouch/xdriver_xf86-input-mutouch.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-palmax/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-palmax/xdriver_xf86-input-palmax.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-penmount/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-penmount/xdriver_xf86-input-penmount.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-spaceorb/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-spaceorb/xdriver_xf86-input-spaceorb.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-summa/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-summa/xdriver_xf86-input-summa.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics-0.14.7~git20070706-configure.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-tek4957/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-tek4957/xdriver_xf86-input-tek4957.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-ur98/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-ur98/xdriver_xf86-input-ur98.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-cyrix/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-cyrix/xdriver_xf86-video-cyrix-1.1.0-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-cyrix/xdriver_xf86-video-cyrix.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.0-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i810/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810-1.7.4-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-imstt/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-imstt/xdriver_xf86-video-imstt.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.3.2-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.8.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/xdriver_xf86-video-nsc.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb-1.1.0.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-1.1.0-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-1.3.0.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vga/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vga/xdriver_xf86-video-vga.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-via/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via-0.2.2.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11-1.1.3-makekeys-nocc.patch
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont-1.2.7-susv3-legacy.patch
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt-1.0.4-makestrs-nocc.patch
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-configure.patch
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-servermd-add-avr32.patch
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-tslib-fix.patch
   trunk/buildroot/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.5-linuxdoc.patch
   trunk/buildroot/package/x11r7/xutil_util-macros/xutil_util-macros-1.1.5.patch

Modified:
   trunk/buildroot/package/x11r7/Config.in
   trunk/buildroot/package/x11r7/mesa3d/mesa3d.mk
   trunk/buildroot/package/x11r7/xapp_bitmap/xapp_bitmap.mk
   trunk/buildroot/package/x11r7/xapp_luit/xapp_luit.mk
   trunk/buildroot/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
   trunk/buildroot/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
   trunk/buildroot/package/x11r7/xapp_sessreg/xapp_sessreg.mk
   trunk/buildroot/package/x11r7/xapp_x11perf/xapp_x11perf.mk
   trunk/buildroot/package/x11r7/xapp_xauth/xapp_xauth.mk
   trunk/buildroot/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
   trunk/buildroot/package/x11r7/xapp_xev/xapp_xev.mk
   trunk/buildroot/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
   trunk/buildroot/package/x11r7/xapp_xpr/xapp_xpr.mk
   trunk/buildroot/package/x11r7/xapp_xprop/xapp_xprop.mk
   trunk/buildroot/package/x11r7/xapp_xrandr/xapp_xrandr.mk
   trunk/buildroot/package/x11r7/xapp_xrdb/xapp_xrdb.mk
   trunk/buildroot/package/x11r7/xapp_xset/xapp_xset.mk
   trunk/buildroot/package/x11r7/xapp_xwd/xapp_xwd.mk
   trunk/buildroot/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
   trunk/buildroot/package/x11r7/xcb-util/xcb-util.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
   trunk/buildroot/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
   trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS.mk
   trunk/buildroot/package/x11r7/xlib_libSM/xlib_libSM.mk
   trunk/buildroot/package/x11r7/xlib_libX11/xlib_libX11.mk
   trunk/buildroot/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
   trunk/buildroot/package/x11r7/xlib_libXau/xlib_libXau.mk
   trunk/buildroot/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
   trunk/buildroot/package/x11r7/xlib_libXext/xlib_libXext.mk
   trunk/buildroot/package/x11r7/xlib_libXfont/xlib_libXfont.mk
   trunk/buildroot/package/x11r7/xlib_libXft/xlib_libXft.mk
   trunk/buildroot/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
   trunk/buildroot/package/x11r7/xlib_libXmu/xlib_libXmu.mk
   trunk/buildroot/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
   trunk/buildroot/package/x11r7/xlib_libXt/xlib_libXt.mk
   trunk/buildroot/package/x11r7/xlib_libXv/xlib_libXv.mk
   trunk/buildroot/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
   trunk/buildroot/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
   trunk/buildroot/package/x11r7/xlib_xtrans/xlib_xtrans.mk
   trunk/buildroot/package/x11r7/xproto_glproto/xproto_glproto.mk
   trunk/buildroot/package/x11r7/xproto_inputproto/xproto_inputproto.mk
   trunk/buildroot/package/x11r7/xproto_xextproto/xproto_xextproto.mk
   trunk/buildroot/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
   trunk/buildroot/package/x11r7/xproto_xproto/xproto_xproto.mk
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
   trunk/buildroot/package/x11r7/xutil_util-macros/xutil_util-macros.mk


Changeset:

Sorry, the patch is too large to include (4448 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25653
