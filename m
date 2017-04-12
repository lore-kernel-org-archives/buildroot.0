From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:17:56 +0200
Subject: [Buildroot] [git commit] configs/spns_axs*_defconfig: update linux
	and u-bootversion
Message-ID: <20170412191926.18A4282703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=243ba391871811de6ef5b8ba43de392237256858
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this commit we update axs10x defconfigs with the following changes:

 - rename "snps_axs101_defconfig" and "snps_axs103_defconfig" to
   "snps_arc700_axs101_defconfig" and "snps_archs38_axs103_defconfig",
   to reflect the ARC core being used
 - bump linux kernel version to 4.10.8
 - set up host linux headers to 4.10
 - bump u-boot version to 2017.01

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/{snps_axs101_defconfig => snps_arc700_axs101_defconfig}  | 8 ++++----
 configs/{snps_axs103_defconfig => snps_archs38_axs103_defconfig} | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/snps_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
similarity index 74%
rename from configs/snps_axs101_defconfig
rename to configs/snps_arc700_axs101_defconfig
index 48372ac..dc1810c 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -8,19 +8,19 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
similarity index 74%
rename from configs/snps_axs103_defconfig
rename to configs/snps_archs38_axs103_defconfig
index eb16b70..7100998 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -9,19 +9,19 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
