From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 20 Oct 2011 08:58:03 +0200
Subject: [Buildroot] [PATCH v2] New package: parted
Message-ID: <4E9FC67B.7030109@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in        |    1 +
 package/parted/Config.in |    9 +++++++++
 package/parted/parted.mk |   14 ++++++++++++++
 3 files changed, 24 insertions(+)

Index: b/package/Config.in
===================================================================
--- a/package/Config.in
+++ b/package/Config.in
@@ -194,6 +194,7 @@
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/openocd/Config.in"
+source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
Index: b/package/parted/Config.in
===================================================================
--- /dev/null
+++ b/package/parted/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PARTED
+	bool "parted"
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_UTIL_LINUX
+	help
+	  parted, the GNU partition resizing program
+
+	  http://www.gnu.org/software/parted/
Index: b/package/parted/parted.mk
===================================================================
--- /dev/null
+++ b/package/parted/parted.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# parted
+#
+#############################################################
+
+PARTED_VERSION = 3.0
+PARTED_SOURCE = parted-$(PARTED_VERSION).tar.gz
+PARTED_SITE = $(BR2_GNU_MIRROR)/parted
+PARTED_DEPENDENCIES = readline util-linux lvm2
+PARTED_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
+
