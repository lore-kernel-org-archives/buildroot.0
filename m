From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:30 +0100
Subject: [Buildroot] [PATCH 02/32] x11r7/xcb-util-wm: new package
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                  |    1 +
 package/x11r7/xcb-util-wm/Config.in      |   16 ++++++++++++++++
 package/x11r7/xcb-util-wm/xcb-util-wm.mk |   14 ++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/x11r7/xcb-util-wm/Config.in
 create mode 100644 package/x11r7/xcb-util-wm/xcb-util-wm.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 706574c..2abd593 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -16,6 +16,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
+		source package/x11r7/xcb-util-wm/Config.in
 		source package/x11r7/xlib_libFS/Config.in
 		source package/x11r7/xlib_libICE/Config.in
 		source package/x11r7/xlib_libSM/Config.in
diff --git a/package/x11r7/xcb-util-wm/Config.in b/package/x11r7/xcb-util-wm/Config.in
new file mode 100644
index 0000000..5e7d94e
--- /dev/null
+++ b/package/x11r7/xcb-util-wm/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XCB_UTIL_WM
+	bool "xcb-util-wm"
+	select BR2_PACKAGE_LIBXCB
+	help
+	  The XCB util modules provides a number of libraries which sit on top
+	  of libxcb, the core X protocol library, and some of the extension
+	  libraries. These experimental libraries provide convenience functions
+	  and interfaces which make the raw X protocol more usable. Some of the
+	  libraries also provide client-side code which is not strictly part of
+	  the X protocol but which have traditionally been provided by Xlib.
+
+	  XCB util-wm module provides the following libraries:
+	    - ewmh: Both client and window-manager helpers for EWMH.
+	    - icccm: Both client and window-manager helpers for ICCCM.
+
+	  http://xcb.freedesktop.org/
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
new file mode 100644
index 0000000..0338b85
--- /dev/null
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# xcb-util-wm
+#
+#############################################################
+
+XCB_UTIL_WM_VERSION = 0.3.9
+XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_WM_SOURCE = xcb-util-wm-$(XCB_UTIL_WM_VERSION).tar.bz2
+XCB_UTIL_WM_INSTALL_STAGING = YES
+XCB_UTIL_WM_LICENSE = MIT
+XCB_UTIL_WM_DEPENDENCIES = libxcb
+
+$(eval $(autotools-package))
-- 
1.7.9.5
