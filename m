From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:46 +0100
Subject: [Buildroot] [PATCH 006/120] xlib_lixXprintUtil: removed in X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-7-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/Config.in                                |    1 -
 package/x11r7/xlib_libXprintUtil/Config.in             |    8 --------
 package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |   13 -------------
 3 files changed, 22 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXprintUtil/Config.in
 delete mode 100644 package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 8e44112..c3fb28d 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -37,7 +37,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
-		source package/x11r7/xlib_libXprintUtil/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
 		source package/x11r7/xlib_libXres/Config.in
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
index 8e76686..0000000
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
-$(eval $(autotools-package))
-- 
1.7.10.4
