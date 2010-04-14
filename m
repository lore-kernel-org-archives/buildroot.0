From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 18:06:42 +0100
Subject: [Buildroot] [PATCH 3/7] Remove XFree86-Misc (lib & proto) as
	removed from X11R7.5
In-Reply-To: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1271264806-23336-4-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/Config.in                            |    2 --
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 +-
 .../xdriver_xf86-video-ati.mk                      |    2 +-
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 .../xdriver_xf86-video-sisusb.mk                   |    2 +-
 package/x11r7/xlib_libXxf86misc/Config.in          |    8 --------
 .../x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk   |   15 ---------------
 package/x11r7/xproto_xf86miscproto/Config.in       |    4 ----
 .../xproto_xf86miscproto/xproto_xf86miscproto.mk   |   14 --------------
 9 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXxf86misc/Config.in
 delete mode 100644 package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
 delete mode 100644 package/x11r7/xproto_xf86miscproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 9c43aca..74c6510 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -77,7 +77,6 @@ endmenu
 		source package/x11r7/xlib_libXv/Config.in
 		source package/x11r7/xlib_libXvMC/Config.in
 		source package/x11r7/xlib_libXxf86dga/Config.in
-		source package/x11r7/xlib_libXxf86misc/Config.in
 		source package/x11r7/xlib_libXxf86vm/Config.in
 		source package/x11r7/xlib_libdmx/Config.in
 		source package/x11r7/xlib_libfontenc/Config.in
@@ -300,7 +299,6 @@ endmenu
 		source package/x11r7/xproto_xf86bigfontproto/Config.in
 		source package/x11r7/xproto_xf86dgaproto/Config.in
 		source package/x11r7/xproto_xf86driproto/Config.in
-		source package/x11r7/xproto_xf86miscproto/Config.in
 		source package/x11r7/xproto_xf86rushproto/Config.in
 		source package/x11r7/xproto_xf86vidmodeproto/Config.in
 		source package/x11r7/xproto_xineramaproto/Config.in
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 64ef8a0..36cc067 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -8,6 +8,6 @@ XAPP_XDPYINFO_VERSION = 1.1.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_AUTORECONF = NO
-XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86misc xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86miscproto xproto_xf86vidmodeproto xlib_libdmx
+XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xdpyinfo))
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index e2c40da..59c9acf 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -8,7 +8,7 @@ XDRIVER_XF86_VIDEO_ATI_VERSION = 6.12.4
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xf86miscproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 XDRIVER_XF86_VIDEO_ATI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ati))
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index cfcb3f1..40ccab5 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -8,7 +8,7 @@ XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.2
 XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xf86miscproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 XDRIVER_XF86_VIDEO_SIS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sis))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index 36a683f..5068606 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -8,7 +8,7 @@ XDRIVER_XF86_VIDEO_SISUSB_VERSION = 0.9.3
 XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SISUSB_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86miscproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
 XDRIVER_XF86_VIDEO_SISUSB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sisusb))
diff --git a/package/x11r7/xlib_libXxf86misc/Config.in b/package/x11r7/xlib_libXxf86misc/Config.in
deleted file mode 100644
index 205140c..0000000
--- a/package/x11r7/xlib_libXxf86misc/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXXF86MISC
-	bool "libXxf86misc"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XF86MISCPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  X.Org Xxf86misc library
diff --git a/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk b/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
deleted file mode 100644
index 5f4b793..0000000
--- a/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xlib_libXxf86misc -- X.Org Xxf86misc library
-#
-################################################################################
-
-XLIB_LIBXXF86MISC_VERSION = 1.0.2
-XLIB_LIBXXF86MISC_SOURCE = libXxf86misc-$(XLIB_LIBXXF86MISC_VERSION).tar.bz2
-XLIB_LIBXXF86MISC_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXXF86MISC_AUTORECONF = NO
-XLIB_LIBXXF86MISC_INSTALL_STAGING = YES
-XLIB_LIBXXF86MISC_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86miscproto xproto_xproto
-XLIB_LIBXXF86MISC_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
-
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXxf86misc))
diff --git a/package/x11r7/xproto_xf86miscproto/Config.in b/package/x11r7/xproto_xf86miscproto/Config.in
deleted file mode 100644
index cd19ff3..0000000
--- a/package/x11r7/xproto_xf86miscproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86MISCPROTO
-	bool "xf86miscproto"
-	help
-	  X.Org XF86Misc protocol headers
diff --git a/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk b/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
deleted file mode 100644
index 8cf8482..0000000
--- a/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xproto_xf86miscproto -- X.Org XF86Misc protocol headers
-#
-################################################################################
-
-XPROTO_XF86MISCPROTO_VERSION = 0.9.3
-XPROTO_XF86MISCPROTO_SOURCE = xf86miscproto-$(XPROTO_XF86MISCPROTO_VERSION).tar.bz2
-XPROTO_XF86MISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86MISCPROTO_AUTORECONF = NO
-XPROTO_XF86MISCPROTO_INSTALL_STAGING = YES
-XPROTO_XF86MISCPROTO_INSTALL_TARGET = NO
-
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86miscproto))
-- 
1.7.0
