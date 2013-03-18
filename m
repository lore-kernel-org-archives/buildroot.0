From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:47 +0100
Subject: [Buildroot] [PATCH 007/120] xcb-util: removed in X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-8-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/Config.in            |    1 -
 package/x11r7/xcb-util/Config.in   |    8 --------
 package/x11r7/xcb-util/xcb-util.mk |   13 -------------
 3 files changed, 22 deletions(-)
 delete mode 100644 package/x11r7/xcb-util/Config.in
 delete mode 100644 package/x11r7/xcb-util/xcb-util.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index c3fb28d..ae1add1 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -14,7 +14,6 @@ if BR2_PACKAGE_XORG7
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
-		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-image/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
 		source package/x11r7/xcb-util-wm/Config.in
diff --git a/package/x11r7/xcb-util/Config.in b/package/x11r7/xcb-util/Config.in
deleted file mode 100644
index dd77b1d..0000000
--- a/package/x11r7/xcb-util/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XCB_UTIL
-	bool "xcb-util"
-	depends on BR2_PACKAGE_LIBXCB
-	help
-	  Libraries which sit on top of libxcb, the core X protocol library,
-	  and some of the extension libraries.
-
-	  http://xcb.freedesktop.org/
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
deleted file mode 100644
index a1948e1..0000000
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-#############################################################
-#
-# xcb-util
-#
-#############################################################
-XCB_UTIL_VERSION = 0.3.9
-XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
-XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
-XCB_UTIL_INSTALL_STAGING = YES
-XCB_UTIL_DEPENDENCIES = host-gperf libxcb
-
-$(eval $(autotools-package))
-
-- 
1.7.10.4
