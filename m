From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:45 +0100
Subject: [Buildroot] [PATCH 005/120] xlib_libXprintAppUtil: removed in
	X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-6-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/Config.in                                   |    1 -
 package/x11r7/xlib_libXprintAppUtil/Config.in             |    7 -------
 .../x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk  |   13 -------------
 3 files changed, 21 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXprintAppUtil/Config.in
 delete mode 100644 package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 1e647c3..8e44112 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -37,7 +37,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
-		source package/x11r7/xlib_libXprintAppUtil/Config.in
 		source package/x11r7/xlib_libXprintUtil/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
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
index b01af40..0000000
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
-$(eval $(autotools-package))
-- 
1.7.10.4
