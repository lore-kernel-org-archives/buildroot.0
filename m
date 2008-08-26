From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 26 Aug 2008 09:27:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pixman x11r7
Message-ID: <20080826162725.ACBE63C8AA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-26 09:27:25 -0700 (Tue, 26 Aug 2008)
New Revision: 23210

Log:
Move pixman from package/x11r7/pixman to package/pixman
Means we can now bounce cairo to 1.6.x series.
pixman is not dependant on x libraries what so over so removed
the dependencies section.

Daniel Laird



Added:
   trunk/buildroot/package/pixman/

Removed:
   trunk/buildroot/package/x11r7/pixman/

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/pixman/pixman.mk
   trunk/buildroot/package/x11r7/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-26 15:43:10 UTC (rev 23209)
+++ trunk/buildroot/package/Config.in	2008-08-26 16:27:25 UTC (rev 23210)
@@ -330,6 +330,7 @@
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"
 source "package/lite/Config.in"
+source "package/pixman/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"

Copied: trunk/buildroot/package/pixman (from rev 23208, trunk/buildroot/package/x11r7/pixman)

Modified: trunk/buildroot/package/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/x11r7/pixman/pixman.mk	2008-08-26 14:52:17 UTC (rev 23208)
+++ trunk/buildroot/package/pixman/pixman.mk	2008-08-26 16:27:25 UTC (rev 23210)
@@ -3,7 +3,6 @@
 # pixman
 #
 ################################################################################
-
 PIXMAN_VERSION = 0.10.0
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
@@ -12,6 +11,4 @@
 PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install install-data
 
-PIXMAN_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
-
-$(eval $(call AUTOTARGETS,package/x11r7,pixman))
+$(eval $(call AUTOTARGETS,package,pixman))

Modified: trunk/buildroot/package/x11r7/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/Config.in	2008-08-26 15:43:10 UTC (rev 23209)
+++ trunk/buildroot/package/x11r7/Config.in	2008-08-26 16:27:25 UTC (rev 23210)
@@ -15,7 +15,6 @@
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
-		source package/x11r7/pixman/Config.in
 		source package/x11r7/pthread-stubs/Config.in
 		source package/x11r7/xlib_libFS/Config.in
 		source package/x11r7/xlib_libICE/Config.in
