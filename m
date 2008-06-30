From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 05:55:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: tinyx tinyx-old
	x11r7 x11r7/mcookie x11 etc...
Message-ID: <20080630125532.C5DAF3C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 05:55:29 -0700 (Mon, 30 Jun 2008)
New Revision: 22565

Log:
packages: fix xorg to compile modular and tiny versions

Based on googlecode r558 by John Voltz.


Added:
   trunk/buildroot/package/x11r7/mcookie/mcookie.c
   trunk/buildroot/package/x11r7/openchrome/openchrome-0.2.902-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-10-bitfield-fixes.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-11-bitops-fixes.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-20-add-inotify-architectures.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-30-absolute-axis.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-40-close-fd.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-1.1.2-50-xinput.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-synaptics/
   trunk/buildroot/package/x11r7/xdriver_xf86-input-synaptics/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics-0.14.7~git20070706-configure.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-cyrix/xdriver_xf86-video-cyrix-1.1.0-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.2.0-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810-1.7.4-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.3.2-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.8.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport-0.2.1-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.2.1-cross-compile.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.4.0.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-1.1.0-cross-compile.patch

Removed:
   trunk/buildroot/package/tinyx-old/Config.in
   trunk/buildroot/package/tinyx-old/tinyx-011010.patch
   trunk/buildroot/package/tinyx-old/tinyx-build.patch
   trunk/buildroot/package/tinyx-old/tinyx-config.patch
   trunk/buildroot/package/tinyx-old/tinyx.mk
   trunk/buildroot/package/tinyx/Config.in
   trunk/buildroot/package/tinyx/tinyx-011010-MB_CUR_MAX.patch
   trunk/buildroot/package/tinyx/tinyx-011010-strings.patch
   trunk/buildroot/package/tinyx/tinyx-011010.patch
   trunk/buildroot/package/tinyx/tinyx-build.patch
   trunk/buildroot/package/tinyx/tinyx-config.patch
   trunk/buildroot/package/tinyx/tinyx.mk
   trunk/buildroot/package/x11r7/openchrome/openchrome-r355-cross-compile.patch
   trunk/buildroot/package/x11r7/xdata_xkbdata/Config.in
   trunk/buildroot/package/x11r7/xdata_xkbdata/xdata_xkbdata.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-6.6.3.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint-1.1.1.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810-1.6.5.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.6.1.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.9.3.patch
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx-1.3.0.patch
   trunk/buildroot/package/xorg/Config.in
   trunk/buildroot/package/xorg/Xserver
   trunk/buildroot/package/xorg/Xsession
   trunk/buildroot/package/xorg/fontfile.patch
   trunk/buildroot/package/xorg/fonts.alias
   trunk/buildroot/package/xorg/fonts.cache-1
   trunk/buildroot/package/xorg/freetype.patch
   trunk/buildroot/package/xorg/kbproto.pc
   trunk/buildroot/package/xorg/libXfont-1.1.0-noftinternals.patch
   trunk/buildroot/package/xorg/libdir-la.patch
   trunk/buildroot/package/xorg/mcookie.c
   trunk/buildroot/package/xorg/x11.pc
   trunk/buildroot/package/xorg/xau.pc
   trunk/buildroot/package/xorg/xdmcp.pc
   trunk/buildroot/package/xorg/xext.pc
   trunk/buildroot/package/xorg/xextproto.pc
   trunk/buildroot/package/xorg/xinerama.pc
   trunk/buildroot/package/xorg/xorg-6.8.2-joystick_h.patch
   trunk/buildroot/package/xorg/xorg-6.8.2-linux_config.patch
   trunk/buildroot/package/xorg/xorg-6.8.2-xterm.patch
   trunk/buildroot/package/xorg/xorg-config.patch
   trunk/buildroot/package/xorg/xorg-mmx.patch
   trunk/buildroot/package/xorg/xorg-noxf86cfg.patch
   trunk/buildroot/package/xorg/xorg-uclibc.patch
   trunk/buildroot/package/xorg/xorg-x11-6.8.2-gcc4-fix.patch
   trunk/buildroot/package/xorg/xorg.conf
   trunk/buildroot/package/xorg/xorg.mk
   trunk/buildroot/package/xorg/xproto.pc
   trunk/buildroot/package/xorg/xrandr.pc

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/x11r7/Config.in
   trunk/buildroot/package/x11r7/mcookie/mcookie.mk
   trunk/buildroot/package/x11r7/openchrome/openchrome.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-calcomp/xdriver_xf86-input-calcomp.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-citron/xdriver_xf86-input-citron.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-dmc/xdriver_xf86-input-dmc.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-dynapro/xdriver_xf86-input-dynapro.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-elo2300/xdriver_xf86-input-elo2300.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-elographics/xdriver_xf86-input-elographics.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-fpit/xdriver_xf86-input-fpit.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-hyperpen/xdriver_xf86-input-hyperpen.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-jamstudio/xdriver_xf86-input-jamstudio.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-magellan/xdriver_xf86-input-magellan.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-microtouch/xdriver_xf86-input-microtouch.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-mutouch/xdriver_xf86-input-mutouch.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-palmax/xdriver_xf86-input-palmax.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-penmount/xdriver_xf86-input-penmount.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-spaceorb/xdriver_xf86-input-spaceorb.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-summa/xdriver_xf86-input-summa.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-tek4957/xdriver_xf86-input-tek4957.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-i810/xdriver_xf86-video-i810.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-via/xdriver_xf86-video-via.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
   trunk/buildroot/package/x11r7/xproto_inputproto/xproto_inputproto.mk
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:

Sorry, the patch is too large to include (5613 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=22565
