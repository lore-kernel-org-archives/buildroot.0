From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 14 May 2018 11:09:24 +0300
Subject: [Buildroot] [PATCH v2] configs/snps_arc*_defconfig: update linux
 version
Message-ID: <20180514080924.5065-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we update Linux kernel version to 4.16.8
and Linux headers version to 4.16.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
Changes since v1:
-Switch kernel version to 4.16.8
-Switch back to BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_* option usage
 configs/snps_arc700_axs101_defconfig  | 6 +++---
 configs/snps_archs38_axs103_defconfig | 6 +++---
 configs/snps_archs38_haps_defconfig   | 6 +++---
 configs/snps_archs38_hsdk_defconfig   | 6 +++---
 configs/snps_archs38_vdk_defconfig    | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index 0fefaf4aa8..8a4814286e 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.8"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index 39ceeae433..11069a5d9d 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.8"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/snps_archs38_haps_defconfig b/configs/snps_archs38_haps_defconfig
index 6583c1ec3a..2ef49b4d44 100644
--- a/configs/snps_archs38_haps_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -7,12 +7,12 @@ BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.8"
 BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 125063b444..40aed984db 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -2,8 +2,8 @@
 BR2_arcle=y
 BR2_archs38=y
 
-# Linux headers
-BR2_KERNEL_HEADERS_4_14=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
@@ -13,7 +13,7 @@ BR2_SYSTEM_DHCP="eth0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.8"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
 
diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
index 46b539beec..129e3267e5 100644
--- a/configs/snps_archs38_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.8"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.16.2
