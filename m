From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Apr 2014 08:34:08 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_xwd: Add missing dependency
	xlib_libxkbfile
Message-ID: <1397802848-4446-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/12b/12b7894a4f67d963ea93622eea1adc2d2c3d6847/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwd/Config.in   |    1 +
 package/x11r7/xapp_xwd/xapp_xwd.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xwd/Config.in b/package/x11r7/xapp_xwd/Config.in
index b7b3172..ada4820 100644
--- a/package/x11r7/xapp_xwd/Config.in
+++ b/package/x11r7/xapp_xwd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XAPP_XWD
 	bool "xwd"
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
 	  dump an image of an X window
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index c46dbb5..0cda34e 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -9,6 +9,6 @@ XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWD_LICENSE = MIT
 XAPP_XWD_LICENSE_FILES = COPYING
-XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
+XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libxkbfile
 
 $(eval $(autotools-package))
-- 
1.7.10.4
