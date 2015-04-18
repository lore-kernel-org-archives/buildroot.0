From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:20:07 +0200
Subject: [Buildroot] [git commit] package/x11r7/xcb-util-cursor: new package
Message-ID: <20150418162051.1184D80797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5832d14948b46847898a1583b74a40da4566fe1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rewrap Config.in help text
 - propagate BR2_PACKAGE_LIBXCB dependency.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xcb-util-cursor/Config.in            |   19 +++++++++++++++++++
 package/x11r7/xcb-util-cursor/xcb-util-cursor.hash |    2 ++
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   |   15 +++++++++++++++
 4 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4166a96..572963c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/libxcb/Config.in
 		source package/x11r7/libepoxy/Config.in
 		source package/x11r7/xcb-util/Config.in
+		source package/x11r7/xcb-util-cursor/Config.in
 		source package/x11r7/xcb-util-image/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
 		source package/x11r7/xcb-util-renderutil/Config.in
diff --git a/package/x11r7/xcb-util-cursor/Config.in b/package/x11r7/xcb-util-cursor/Config.in
new file mode 100644
index 0000000..ca30494
--- /dev/null
+++ b/package/x11r7/xcb-util-cursor/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_XCB_UTIL_CURSOR
+	bool "xcb-util-cursor"
+	select BR2_PACKAGE_XCB_UTIL
+	select BR2_PACKAGE_XCB_UTIL_IMAGE
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
+	depends on BR2_PACKAGE_LIBXCB
+	help
+	  The XCB util modules provides a number of libraries which
+	  sit on top of libxcb, the core X protocol library, and some
+	  of the extension libraries. These experimental libraries
+	  provide convenience functions and interfaces which make the
+	  raw X protocol more usable. Some of the libraries also
+	  provide client-side code which is not strictly part of the X
+	  protocol but which have traditionally been provided by Xlib.
+
+	  XCB util-cursor module provides the following libraries:
+	    - cursor: port of libxcursor
+
+	  http://xcb.freedesktop.org/
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
new file mode 100644
index 0000000..e5c47ca
--- /dev/null
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002555.html
+sha1	b55a92cd96c3ec1be9a26963df6d5f16e68fffea	xcb-util-cursor-0.1.2.tar.bz2
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
new file mode 100644
index 0000000..65704a1
--- /dev/null
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xcb-util-cursor
+#
+################################################################################
+
+XCB_UTIL_CURSOR_VERSION = 0.1.2
+XCB_UTIL_CURSOR_SITE = http://xcb.freedesktop.org/dist
+XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.bz2
+XCB_UTIL_CURSOR_LICENSE = MIT
+XCB_UTIL_CURSOR_LICENSE_FILES = COPYING
+XCB_UTIL_CURSOR_INSTALL_STAGING = YES
+XCB_UTIL_CURSOR_DEPENDENCIES = xcb-util xcb-util-image xcb-util-renderutil
+
+$(eval $(autotools-package))
