From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 05:48:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7:
	xdriver_xf86-input-acecad xdriver_xf86- etc...
Message-ID: <20080630124822.5F59A3C647@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 05:48:20 -0700 (Mon, 30 Jun 2008)
New Revision: 22563

Log:
x11r7: update xorg driver versions to match with X11R7.3

Based on googlecode r551 by John Voltz


Removed:
   trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.1.2.patch

Modified:
   trunk/buildroot/package/x11r7/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/xdriver_xf86-video-nsc.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
   trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/Config.in
   trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -196,6 +196,7 @@
 		source package/x11r7/xdriver_xf86-video-i740/Config.in
 		source package/x11r7/xdriver_xf86-video-i810/Config.in
 		source package/x11r7/xdriver_xf86-video-imstt/Config.in
+		source package/x11r7/xdriver_xf86-video-intel/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
 		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
 		source package/x11r7/xdriver_xf86-video-newport/Config.in

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -6,5 +6,5 @@
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-acecad 1.1.0
+	  xf86-input-acecad 1.2.0
 	  Acecad Flair input driver

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.1.0
+XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.2.0
 XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_ACECAD_AUTORECONF = NO

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -6,5 +6,5 @@
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-joystick 1.1.0
+	  xf86-input-joystick 1.2.3
 	  X.Org driver for joystick input devices

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.1.0
+XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.2.3
 XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = NO

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -7,5 +7,5 @@
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-keyboard 1.1.1
+	  xf86-input-keyboard 1.2.2
 	  Keyboard input driver

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.1.1
+XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.2.2
 XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_AUTORECONF = NO

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -6,5 +6,5 @@
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-mouse 1.1.2
+	  xf86-input-mouse 1.2.2
 	  X.Org driver for mouse input devices

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.1.2
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.2.2
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = NO

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -6,5 +6,5 @@
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-vmmouse 12.4.0
+	  xf86-input-vmmouse 12.4.1
 	  VMWare mouse input driver

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 12.4.0
+XDRIVER_XF86_INPUT_VMMOUSE_VERSION = 12.4.1
 XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_AUTORECONF = NO

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -10,5 +10,5 @@
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-nsc 2.8.2
+	  xf86-video-nsc 2.8.3
 	  Nsc video driver

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/xdriver_xf86-video-nsc.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/xdriver_xf86-video-nsc.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-nsc/xdriver_xf86-video-nsc.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NSC_VERSION = 2.8.2
+XDRIVER_XF86_VIDEO_NSC_VERSION = 2.8.3
 XDRIVER_XF86_VIDEO_NSC_SOURCE = xf86-video-nsc-$(XDRIVER_XF86_VIDEO_NSC_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NSC_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NSC_AUTORECONF = NO

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -9,5 +9,5 @@
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-nv 1.2.2.1
+	  xf86-video-nv 2.1.3
 	  NVIDIA video driver

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 1.2.2.1
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.3
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_AUTORECONF = NO

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/Config.in	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/Config.in	2008-06-30 12:48:20 UTC (rev 22563)
@@ -11,5 +11,5 @@
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-savage 2.1.2
+	  xf86-video-savage 2.1.3
 	  S3 Savage video driver

Deleted: trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.1.2.patch
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.1.2.patch	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage-2.1.2.patch	2008-06-30 12:48:20 UTC (rev 22563)
@@ -1,21 +0,0 @@
---- xf86-video-savage-2.1.2/configure.ac.orig	2007-06-10 11:51:23.000000000 +0200
-+++ xf86-video-savage-2.1.2/configure.ac	2007-06-10 11:52:46.000000000 +0200
-@@ -68,12 +68,18 @@
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
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

Modified: trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
===================================================================
--- trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk	2008-06-30 07:33:52 UTC (rev 22562)
+++ trunk/buildroot/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk	2008-06-30 12:48:20 UTC (rev 22563)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.1.2
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.1.3
 XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = NO
