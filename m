From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 12:12:18 +0100
Subject: [Buildroot] [git commit] x11r7/xcb-util-image: new package
Message-ID: <20130309114337.DC9F79AF42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d3f97257ffb9ed89761f503014f0e3375f2d6a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                        |    1 +
 package/x11r7/xcb-util-image/Config.in         |   15 +++++++++++++++
 package/x11r7/xcb-util-image/xcb-util-image.mk |   14 ++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 2abd593..5d0f991 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -15,6 +15,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/xcb-util/Config.in
+		source package/x11r7/xcb-util-image/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
 		source package/x11r7/xcb-util-wm/Config.in
 		source package/x11r7/xlib_libFS/Config.in
diff --git a/package/x11r7/xcb-util-image/Config.in b/package/x11r7/xcb-util-image/Config.in
new file mode 100644
index 0000000..31fc61a
--- /dev/null
+++ b/package/x11r7/xcb-util-image/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_XCB_UTIL_IMAGE
+	bool "xcb-util-image"
+	select BR2_PACKAGE_XCB_UTIL
+	help
+	  The XCB util modules provides a number of libraries which sit on top
+	  of libxcb, the core X protocol library, and some of the extension
+	  libraries. These experimental libraries provide convenience functions
+	  and interfaces which make the raw X protocol more usable. Some of the
+	  libraries also provide client-side code which is not strictly part of
+	  the X protocol but which have traditionally been provided by Xlib.
+
+	  XCB util-image module provides the following library:
+	    - image: Port of Xlib's XImage and XShmImage functions.
+
+	  http://xcb.freedesktop.org/
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
new file mode 100644
index 0000000..0309f3b
--- /dev/null
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# xcb-util-image
+#
+#############################################################
+
+XCB_UTIL_IMAGE_VERSION = 0.3.9
+XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
+XCB_UTIL_IMAGE_INSTALL_STAGING = YES
+XCB_UTIL_IMAGE_LICENSE = MIT
+XCB_UTIL_IMAGE_DEPENDENCIES = xcb-util
+
+$(eval $(autotools-package))
