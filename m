From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xlib_libxkbui: removed in X11R7.7
Message-ID: <20130324225159.EC7FF9B21A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=922a349431af614a92530c1dc83d4faeb5ae8a22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/Config.in                      |    1 -
 package/x11r7/xlib_libxkbui/Config.in        |    7 -------
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk |   13 -------------
 3 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 3773e45..3c342e7 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -52,7 +52,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libdmx/Config.in
 		source package/x11r7/xlib_libfontenc/Config.in
 		source package/x11r7/xlib_libxkbfile/Config.in
-		source package/x11r7/xlib_libxkbui/Config.in
 		source package/x11r7/xlib_xtrans/Config.in
 		source package/x11r7/xlib_libpciaccess/Config.in
 		source package/x11r7/xlib_libpthread-stubs/Config.in
diff --git a/package/x11r7/xlib_libxkbui/Config.in b/package/x11r7/xlib_libxkbui/Config.in
deleted file mode 100644
index ceab305..0000000
--- a/package/x11r7/xlib_libxkbui/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBXKBUI
-	bool "libxkbui"
-	select BR2_PACKAGE_XLIB_LIBXKBFILE
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	help
-	  X.Org xkbui library
diff --git a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
deleted file mode 100644
index 7e6ec25..0000000
--- a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xlib_libxkbui -- X.Org xkbui library
-#
-################################################################################
-
-XLIB_LIBXKBUI_VERSION = 1.0.2
-XLIB_LIBXKBUI_SOURCE = libxkbui-$(XLIB_LIBXKBUI_VERSION).tar.bz2
-XLIB_LIBXKBUI_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXKBUI_INSTALL_STAGING = YES
-XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
-
-$(eval $(autotools-package))
