From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed,  3 Aug 2016 15:47:12 +0300
Subject: [Buildroot] [PATCH] config: update synopsys defconfigs
Message-ID: <1470228432-31937-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we update ARC defconfigs with the following:

  - "snps_axs101_defconfig" and "snps_axs103_defconfig":
     - bump linux kernel version to 4.7
     - set up host linux headers to 4.7
     - bump u-boot version to 2016.07

  - "snps_hs38_smp_vdk_defconfig":
     - bump linux kernel version to 4.7
     - set up host linux headers to 4.7

Also we delete "snps_hs38_vdk_defconfig" as we doesn't support
uni-processor HS38 configuration for vdk any longer.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 configs/snps_axs101_defconfig       |  8 ++++----
 configs/snps_axs103_defconfig       |  8 ++++----
 configs/snps_hs38_smp_vdk_defconfig |  6 +++---
 configs/snps_hs38_vdk_defconfig     | 19 -------------------
 4 files changed, 11 insertions(+), 30 deletions(-)
 delete mode 100644 configs/snps_hs38_vdk_defconfig

diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index 08def3e..f7bcf4d 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -8,18 +8,18 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index d997508..840db74 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -9,18 +9,18 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
diff --git a/configs/snps_hs38_smp_vdk_defconfig b/configs/snps_hs38_smp_vdk_defconfig
index 9236a13..32922f8 100644
--- a/configs/snps_hs38_smp_vdk_defconfig
+++ b/configs/snps_hs38_smp_vdk_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+# Linux headers same as kernel, a 4.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/snps_hs38_vdk_defconfig b/configs/snps_hs38_vdk_defconfig
deleted file mode 100644
index de91df0..0000000
--- a/configs/snps_hs38_vdk_defconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# Architecture
-BR2_arcle=y
-BR2_archs38=y
-
-# System
-BR2_TARGET_GENERIC_HOSTNAME="hs38_vdk"
-BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
-BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
-BR2_TARGET_ROOTFS_EXT2=y
-
-# Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
-BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38"
-BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.5.5
