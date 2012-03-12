From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 12 Mar 2012 11:24:04 +0100
Subject: [Buildroot] [PATCH] New package: parted
Message-ID: <1331547844-23763-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in        |    1 +
 package/parted/Config.in |    9 +++++++++
 package/parted/parted.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/parted/Config.in
 create mode 100644 package/parted/parted.mk

diff --git a/package/Config.in b/package/Config.in
index 4838edc..36a221c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -202,6 +202,7 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
+source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
diff --git a/package/parted/Config.in b/package/parted/Config.in
new file mode 100644
index 0000000..86d6679
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
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
new file mode 100644
index 0000000..c4107e7
--- /dev/null
+++ b/package/parted/parted.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# parted
+#
+#############################################################
+
+PARTED_VERSION = 3.1
+PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
+PARTED_SITE = $(BR2_GNU_MIRROR)/parted
+PARTED_DEPENDENCIES = readline util-linux lvm2
+PARTED_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.7
