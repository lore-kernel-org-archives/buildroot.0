From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xlib_liboldX: removed in X11R7.7
Message-ID: <20130324225159.8BBF69B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc138da9f9a4a182fa221da2585968921add9270
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/Config.in                    |    1 -
 package/x11r7/xlib_liboldX/Config.in       |    5 -----
 package/x11r7/xlib_liboldX/xlib_liboldX.mk |   14 --------------
 3 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index e17201a..81b16f0 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -52,7 +52,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXxf86vm/Config.in
 		source package/x11r7/xlib_libdmx/Config.in
 		source package/x11r7/xlib_libfontenc/Config.in
-		source package/x11r7/xlib_liboldX/Config.in
 		source package/x11r7/xlib_libxkbfile/Config.in
 		source package/x11r7/xlib_libxkbui/Config.in
 		source package/x11r7/xlib_xtrans/Config.in
diff --git a/package/x11r7/xlib_liboldX/Config.in b/package/x11r7/xlib_liboldX/Config.in
deleted file mode 100644
index e312921..0000000
--- a/package/x11r7/xlib_liboldX/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBOLDX
-	bool "liboldX"
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  X.Org oldX library
diff --git a/package/x11r7/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
deleted file mode 100644
index f4db12b..0000000
--- a/package/x11r7/xlib_liboldX/xlib_liboldX.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_liboldX -- X.Org oldX library
-#
-################################################################################
-
-XLIB_LIBOLDX_VERSION = 1.0.1
-XLIB_LIBOLDX_SOURCE = liboldX-$(XLIB_LIBOLDX_VERSION).tar.bz2
-XLIB_LIBOLDX_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBOLDX_INSTALL_STAGING = YES
-XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
-XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
-
-$(eval $(autotools-package))
