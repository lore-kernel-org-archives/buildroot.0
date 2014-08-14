From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 14 Aug 2014 10:35:19 +0200
Subject: [Buildroot] [PATCH 1/2] configs/freescale_imx6dlsabresd: add
	defconfig for iMX6DL SabreSD
Message-ID: <1408005320-6100-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is very similar to freescale_imx6sabresd_defconfig, which supports the
i.MX6Q ("Quad", quad core CPU) version of the board, except it supports the
i.MX6DL (DualLite, dual core CPU) version.

The differences are in the U-boot configuration and the device tree file.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Vincent Stehl? <vincent.stehle@freescale.com>
---
 configs/freescale_imx6dlsabresd_defconfig | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 configs/freescale_imx6dlsabresd_defconfig

diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
new file mode 100644
index 0000000..4177e16
--- /dev/null
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -0,0 +1,27 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
-- 
1.9.1
