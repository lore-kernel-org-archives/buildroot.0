From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 12 Sep 2013 09:05:36 +0200
Subject: [Buildroot] [PATCH] libsoc: add new package
Message-ID: <1378969536-3711-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in        |    1 +
 package/libsoc/Config.in |    7 +++++++
 package/libsoc/libsoc.mk |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/libsoc/Config.in
 create mode 100644 package/libsoc/libsoc.mk

diff --git a/package/Config.in b/package/Config.in
index a94cb62..45d81df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -518,6 +518,7 @@ source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
 source "package/libqmi/Config.in"
 source "package/libserial/Config.in"
+source "package/libsoc/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libsoc/Config.in b/package/libsoc/Config.in
new file mode 100644
index 0000000..911ba7a
--- /dev/null
+++ b/package/libsoc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBSOC
+	bool "libsoc"
+	depends on BR2_USE_MMU # fork()
+	help
+	  libsoc: C library for interfacing with common SoC peripherals through generic kernel interfaces
+
+	  https://github.com/jackmitch/libsoc
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
new file mode 100644
index 0000000..1d751cd
--- /dev/null
+++ b/package/libsoc/libsoc.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libsoc
+#
+#############################################################
+LIBSOC_VERSION = 356760dcb93b22d6c67c5232cde2ade8c968c932
+LIBSOC_SITE = http://github.com/jackmitch/libsoc/tarball/$(LIBSOC_VERSION)
+LIBSOC_AUTORECONF = YES
+LIBSOC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+
-- 
1.7.7
