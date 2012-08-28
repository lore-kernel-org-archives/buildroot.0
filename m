From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 28 Aug 2012 15:48:56 +0200
Subject: [Buildroot] [PATCH] mtdev: new package
Message-ID: <503CCC48.7000409@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mtdev is a stand-alone library which transforms all variants
of kernel multitouch events to the slotted type B protocol.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/Config.in       |    1 +
 package/mtdev/Config.in |    8 ++++++++
 package/mtdev/mtdev.mk  |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/mtdev/Config.in
 create mode 100644 package/mtdev/mtdev.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..ff52e87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ source "package/libnfc-llcp/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
+source "package/mtdev/Config.in"
 endmenu
  menu "Javascript"
diff --git a/package/mtdev/Config.in b/package/mtdev/Config.in
new file mode 100644
index 0000000..3419903
--- /dev/null
+++ b/package/mtdev/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MTDEV
+	bool "mtdev"
+	help
+	  The mtdev is a stand-alone library which transforms all
+	  variants of kernel MT events to the slotted type B protocol.
+
+	  http://bitmath.org/code/mtdev/
+
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
new file mode 100644
index 0000000..09f76f2
--- /dev/null
+++ b/package/mtdev/mtdev.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# mtdev
+#
+#############################################################
+MTDEV_VERSION = 1.1.3
+MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
+MTDEV_SITE = http://bitmath.org/code/mtdev/
+
+MTDEV_LICENSE = MIT
+MTDEV_LICENSE_FILES = COPYING
+MTDEV_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.0.4
