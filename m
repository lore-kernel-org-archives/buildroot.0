From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xapp_xplsprinters: removed in X11R7.7
Message-ID: <20130324225159.224F69B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a9f13a24783104b71c175c23ba3234264996cc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xapp_xplsprinters/Config.in          |    7 -------
 .../x11r7/xapp_xplsprinters/xapp_xplsprinters.mk   |   12 ------------
 3 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 5d0f991..026b448 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -128,7 +128,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xmh/Config.in
 		source package/x11r7/xapp_xmodmap/Config.in
 		source package/x11r7/xapp_xmore/Config.in
-		source package/x11r7/xapp_xplsprinters/Config.in
 		source package/x11r7/xapp_xpr/Config.in
 		source package/x11r7/xapp_xprehashprinterlist/Config.in
 		source package/x11r7/xapp_xprop/Config.in
diff --git a/package/x11r7/xapp_xplsprinters/Config.in b/package/x11r7/xapp_xplsprinters/Config.in
deleted file mode 100644
index 16a139b..0000000
--- a/package/x11r7/xapp_xplsprinters/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_XAPP_XPLSPRINTERS
-	bool "xplsprinters"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXP
-	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
-	help
-	  shows a list of Xprint printers and it's attributes
diff --git a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
deleted file mode 100644
index 4d2c697..0000000
--- a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xplsprinters -- shows a list of Xprint printers and it's attributes
-#
-################################################################################
-
-XAPP_XPLSPRINTERS_VERSION = 1.0.1
-XAPP_XPLSPRINTERS_SOURCE = xplsprinters-$(XAPP_XPLSPRINTERS_VERSION).tar.bz2
-XAPP_XPLSPRINTERS_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPLSPRINTERS_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
-
-$(eval $(autotools-package))
