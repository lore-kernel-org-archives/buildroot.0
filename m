From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xapp_xprehashprinterlist: removed in
	X11R7.7
Message-ID: <20130324225159.67A6F9B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5ca572282a492200847a7ef6ddba63950f18634
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xapp_xprehashprinterlist/Config.in   |    6 ------
 .../xapp_xprehashprinterlist.mk                    |   12 ------------
 3 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 026b448..e17201a 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -129,7 +129,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xmodmap/Config.in
 		source package/x11r7/xapp_xmore/Config.in
 		source package/x11r7/xapp_xpr/Config.in
-		source package/x11r7/xapp_xprehashprinterlist/Config.in
 		source package/x11r7/xapp_xprop/Config.in
 		source package/x11r7/xapp_xrandr/Config.in
 		source package/x11r7/xapp_xrdb/Config.in
diff --git a/package/x11r7/xapp_xprehashprinterlist/Config.in b/package/x11r7/xapp_xprehashprinterlist/Config.in
deleted file mode 100644
index 056fdb6..0000000
--- a/package/x11r7/xapp_xprehashprinterlist/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST
-	bool "xprehashprinterlist"
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXP
-	help
-	  Recomputes the list of available printers.
diff --git a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
deleted file mode 100644
index 5ae32d2..0000000
--- a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# xapp_xprehashprinterlist -- Recomputes the list of available printers.
-#
-################################################################################
-
-XAPP_XPREHASHPRINTERLIST_VERSION = 1.0.1
-XAPP_XPREHASHPRINTERLIST_SOURCE = xprehashprinterlist-$(XAPP_XPREHASHPRINTERLIST_VERSION).tar.bz2
-XAPP_XPREHASHPRINTERLIST_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XPREHASHPRINTERLIST_DEPENDENCIES = xlib_libX11 xlib_libXp
-
-$(eval $(autotools-package))
