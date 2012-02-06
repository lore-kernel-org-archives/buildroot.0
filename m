From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  6 Feb 2012 10:55:35 +0100
Subject: [Buildroot] [PATCH 3/3] New package: parted
In-Reply-To: <1328522135-5123-1-git-send-email-yegorslists@googlemail.com>
References: <1328522135-5123-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1328522135-5123-3-git-send-email-yegorslists@googlemail.com>
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
 package/parted/parted.mk |   14 ++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/parted/Config.in
 create mode 100644 package/parted/parted.mk

diff --git a/package/Config.in b/package/Config.in
index 7206f65..88437ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -201,6 +201,7 @@ source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
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
index 0000000..826c5f8
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
-- 
1.7.1.1
