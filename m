From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 30 Jan 2018 00:37:20 +0300
Subject: [Buildroot] [PATCH 2/2] orangepi-pc-plus: bump kernel and u-boot
 versions
In-Reply-To: <20180129213720.24321-1-geomatsi@gmail.com>
References: <20180129213720.24321-1-geomatsi@gmail.com>
Message-ID: <20180129213720.24321-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump Linux to 4.15 and U-Boot to 2018.01. Enable dhcp for eth0 since
Ethernet support for Allwinner H2/H3 SoCs has landed in Linux 4.15.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_pc_plus_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 70056d75ec..7969e8a4bf 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -2,12 +2,13 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
+BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
@@ -18,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.16.1
