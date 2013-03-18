From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:50 +0100
Subject: [Buildroot] [PATCH 010/120] xproto_printproto: removed in X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-11-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/Config.in                              |    1 -
 package/x11r7/xapp_xdpyinfo/Config.in                |    1 -
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk         |    2 +-
 package/x11r7/xproto_printproto/Config.in            |    4 ----
 package/x11r7/xproto_printproto/xproto_printproto.mk |   13 -------------
 5 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 package/x11r7/xproto_printproto/Config.in
 delete mode 100644 package/x11r7/xproto_printproto/xproto_printproto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 10ed29c..6ef9cfe 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -233,7 +233,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_glproto/Config.in
 		source package/x11r7/xproto_inputproto/Config.in
 		source package/x11r7/xproto_kbproto/Config.in
-		source package/x11r7/xproto_printproto/Config.in
 		source package/x11r7/xproto_randrproto/Config.in
 		source package/x11r7/xproto_recordproto/Config.in
 		source package/x11r7/xproto_renderproto/Config.in
diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index 9b19ad3..261a63f 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_XAPP_XDPYINFO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_PRINTPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 2134eca..a3d6ff7 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -7,6 +7,6 @@
 XAPP_XDPYINFO_VERSION = 1.2.0
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
+XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
 $(eval $(autotools-package))
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
index 641553f..0000000
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xproto_printproto -- X.Org Print protocol headers
-#
-################################################################################
-
-XPROTO_PRINTPROTO_VERSION = 1.0.5
-XPROTO_PRINTPROTO_SOURCE = printproto-$(XPROTO_PRINTPROTO_VERSION).tar.bz2
-XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_PRINTPROTO_INSTALL_STAGING = YES
-XPROTO_PRINTPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-- 
1.7.10.4
