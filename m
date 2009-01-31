From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 31 Jan 2009 15:06:55 +0100
Subject: [Buildroot] [PATCH] x11r7: make xman and xcb-util visible in Kconfig
Message-ID: <200901311506.56000.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/x11r7/Config.in           |    2 ++
 package/x11r7/xapp_xman/Config.in |    5 ++---
 package/x11r7/xcb-util/Config.in  |    7 +++++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index c734da5..b6c5cf5 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -18,6 +18,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/pthread-stubs/Config.in
+		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xlib_libFS/Config.in
 		source package/x11r7/xlib_libICE/Config.in
 		source package/x11r7/xlib_libSM/Config.in
@@ -126,6 +127,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xlsclients/Config.in
 		source package/x11r7/xapp_xlsfonts/Config.in
 		source package/x11r7/xapp_xmag/Config.in
+		source package/x11r7/xapp_xman/Config.in
 		source package/x11r7/xapp_xmessage/Config.in
 		source package/x11r7/xapp_xmh/Config.in
 		source package/x11r7/xapp_xmodmap/Config.in
diff --git a/package/x11r7/xapp_xman/Config.in b/package/x11r7/xapp_xman/Config.in
index 0fe9627..af9525b 100644
--- a/package/x11r7/xapp_xman/Config.in
+++ b/package/x11r7/xapp_xman/Config.in
@@ -1,5 +1,4 @@
 config BR2_PACKAGE_XAPP_XMAN
-        bool "xapp_xman"
-        help
+	bool "xman"
+	help
 	  Manual page display program for the X Window System
-
diff --git a/package/x11r7/xcb-util/Config.in b/package/x11r7/xcb-util/Config.in
index e69de29..cf79327 100644
--- a/package/x11r7/xcb-util/Config.in
+++ b/package/x11r7/xcb-util/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XCB_UTIL
+	bool "xcb-util"
+	help
+	  Libraries which sit on top of libxcb, the core X protocol library,
+	  and some of the extension libraries.
+
+	  http://xcb.freedesktop.org/
-- 
1.6.1.2.256.g62566b
