From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Wed, 15 Feb 2012 23:04:15 +0100
Subject: [Buildroot] [PATCH 3/3 v2] configs: add support for PandaBoard and
	PandaBoard ES
In-Reply-To: <1329343455-32714-1-git-send-email-n-dechesne@ti.com>
References: <1329343455-32714-1-git-send-email-n-dechesne@ti.com>
Message-ID: <1329343455-32714-4-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a default configuration for Panda and PandaES, tested on both
platforms.

DEVTMPFS is enabled, to use static dev configuration one would need
to update the generic dev table for ttyO driver.

Panda is well supported in mainline kernel with omap2plus_defconfig,
so this should be safe.

U-boot SPL support is enabled by default as x-loader is now
deprecated.

With OMAP platforms u-boot,img format is prefered now, so it's enabled
by default as well.

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
---
 configs/pandaboard_defconfig |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 configs/pandaboard_defconfig

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
new file mode 100644
index 0000000..61d9e00
--- /dev/null
+++ b/configs/pandaboard_defconfig
@@ -0,0 +1,25 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+
+# GCC
+BR2_GCC_VERSION_4_6_X=y
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
+BR2_TARGET_UBOOT_SPL=y
-- 
1.7.9
