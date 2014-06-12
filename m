From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 12 Jun 2014 16:25:51 -0700
Subject: [Buildroot] [PATCH] imx6sabresd: bump kernel version to 3.10.17
Message-ID: <1402615551-21352-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/freescale_imx6sabresd_defconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configs/freescale_imx6sabresd_defconfig b/configs/freescale_imx6sabresd_defconfig
index 368e00b..16e4d0b 100644
--- a/configs/freescale_imx6sabresd_defconfig
+++ b/configs/freescale_imx6sabresd_defconfig
@@ -9,15 +9,19 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
-BR2_LINUX_KERNEL_DEFCONFIG="imx6"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabresd"
+BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
-- 
2.0.0
