From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Jun 2015 10:13:36 +0200
Subject: [Buildroot] [PATCH 1/2] libump: new package
Message-ID: <1435306417-12448-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

previously, this library was a part of sunxi-mali

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in        |  1 +
 package/libump/Config.in |  9 +++++++++
 package/libump/libump.mk | 13 +++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/libump/Config.in
 create mode 100644 package/libump/libump.mk

diff --git a/package/Config.in b/package/Config.in
index fac632f..025b4e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/libump/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
diff --git a/package/libump/Config.in b/package/libump/Config.in
new file mode 100644
index 0000000..859caa6
--- /dev/null
+++ b/package/libump/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBUMP
+	bool "libump"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_arm
+	help
+	  The ARMs Universal Memory Provider userspace library.
+	  This library is a requirement for ARMs binary Mali driver.
+
+	  http://github.com/linux-sunxi/libump
diff --git a/package/libump/libump.mk b/package/libump/libump.mk
new file mode 100644
index 0000000..65012ff
--- /dev/null
+++ b/package/libump/libump.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libump
+#
+################################################################################
+
+LIBUMP_VERSION = ec0680628744f30b8fac35e41a7bd8e23e59c39f
+LIBUMP_SITE = $(call github,linux-sunxi,libump,$(LIBUMP_VERSION))
+LIBUMP_LICENSE = Apache-2.0
+LIBUMP_AUTORECONF = YES
+LIBUMP_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.1.4
