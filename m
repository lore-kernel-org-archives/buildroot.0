From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Sep 2012 10:09:36 +0200
Subject: [Buildroot] [git commit] xapp_xsetroot: needs libXcursor
Message-ID: <20120930081022.2B21799759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=811ef867f314c9661c68a71394183177a1614f5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/1fe8d3496ca1b591cbc470f55067b4acc3ed4d63

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xsetroot/Config.in        |    1 +
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xsetroot/Config.in b/package/x11r7/xapp_xsetroot/Config.in
index 82c0dba..a70df80 100644
--- a/package/x11r7/xapp_xsetroot/Config.in
+++ b/package/x11r7/xapp_xsetroot/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XAPP_XSETROOT
 	bool "xsetroot"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
 	  X.Org xsetroot application
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 881e408..82fdc4e 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -7,6 +7,6 @@
 XAPP_XSETROOT_VERSION = 1.1.0
 XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
+XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXcursor xdata_xbitmaps
 
 $(eval $(autotools-package))
