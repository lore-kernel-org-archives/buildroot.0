From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:59 +0100
Subject: [Buildroot] [git commit] xcb-util-keysyms: new package
Message-ID: <20121230112958.E44A59A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42bc7af2e23fb46d323617644dc1e6d29880cb36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xcb-util-keysyms/Config.in           |   14 ++++++++++++++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |   12 ++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index bb538e1..94ad8a4 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -39,6 +39,7 @@ endmenu
 		source package/x11r7/mesa3d/Config.in
 		source package/x11r7/pthread-stubs/Config.in
 		source package/x11r7/xcb-util/Config.in
+		source package/x11r7/xcb-util-keysyms/Config.in
 		source package/x11r7/xlib_libFS/Config.in
 		source package/x11r7/xlib_libICE/Config.in
 		source package/x11r7/xlib_libSM/Config.in
diff --git a/package/x11r7/xcb-util-keysyms/Config.in b/package/x11r7/xcb-util-keysyms/Config.in
new file mode 100644
index 0000000..ef42eb2
--- /dev/null
+++ b/package/x11r7/xcb-util-keysyms/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	bool "xcb-util-keysyms"
+	help
+	  The XCB util modules provides a number of libraries which sit on top
+	  of libxcb, the core X protocol library, and some of the extension
+	  libraries. These experimental libraries provide convenience functions
+	  and interfaces which make the raw X protocol more usable. Some of the
+	  libraries also provide client-side code which is not strictly part of
+	  the X protocol but which have traditionally been provided by Xlib.
+
+	  XCB util-keysyms module provides the following library: keysyms:
+	  Standard X key constants and conversion to/from keycodes.
+
+	  http://xcb.freedesktop.org/
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
new file mode 100644
index 0000000..18db52a
--- /dev/null
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# xcb-util-keysyms
+#
+#############################################################
+XCB_UTIL_KEYSYMS_VERSION = 0.3.9
+XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
+XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist/
+XCB_UTIL_KEYSYMS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+
