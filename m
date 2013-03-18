From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:42 +0100
Subject: [Buildroot] [PATCH 002/120] xlib_libXfontcache: removed in X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-3-git-send-email-jbb@gamblify.com>
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
 package/x11r7/xlib_libXfontcache/Config.in             |    7 -------
 package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |   14 --------------
 3 files changed, 22 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXfontcache/Config.in
 delete mode 100644 package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 0d4c07c..cbb916c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -32,7 +32,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXext/Config.in
 		source package/x11r7/xlib_libXfixes/Config.in
 		source package/x11r7/xlib_libXfont/Config.in
-		source package/x11r7/xlib_libXfontcache/Config.in
 		source package/x11r7/xlib_libXft/Config.in
 		source package/x11r7/xlib_libXi/Config.in
 		source package/x11r7/xlib_libXinerama/Config.in
diff --git a/package/x11r7/xlib_libXfontcache/Config.in b/package/x11r7/xlib_libXfontcache/Config.in
deleted file mode 100644
index 3a20451..0000000
--- a/package/x11r7/xlib_libXfontcache/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXFONTCACHE
-	bool "libXfontcache"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
-	help
-	  X.Org Xfontcache library
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
deleted file mode 100644
index b2faf5c..0000000
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libXfontcache -- X.Org Xfontcache library
-#
-################################################################################
-
-XLIB_LIBXFONTCACHE_VERSION = 1.0.5
-XLIB_LIBXFONTCACHE_SOURCE = libXfontcache-$(XLIB_LIBXFONTCACHE_VERSION).tar.bz2
-XLIB_LIBXFONTCACHE_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
-XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
-XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(autotools-package))
-- 
1.7.10.4
