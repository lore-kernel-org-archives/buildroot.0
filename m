From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Date: Thu, 23 Apr 2020 15:16:07 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH]
 configs/snps_arc*_defconfig: update linux version
In-Reply-To: <CY4PR1201MB013668B2298F4DA9764F6E5EDEDC0@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <20200410201659.24208-1-Evgeniy.Didin@synopsys.com>,
 <CY4PR1201MB013668B2298F4DA9764F6E5EDEDC0@CY4PR1201MB0136.namprd12.prod.outlook.com>
Message-ID: <CY4PR1201MB0136C85BF87C0449CB216E89DED30@CY4PR1201MB0136.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Evgeniy,

ping!

---
 Eugeniy Paltsev


________________________________________
From: Eugeniy Paltsev <paltsev@synopsys.com>
Sent: Sunday, April 12, 2020 16:11
To: buildroot at busybox.net; Evgeniy Didin; Alexey Brodkin
Cc: Evgeniy Didin; Thomas Petazzoni; arc-buildroot at synopsys.com
Subject: Re: [arc-buildroot] [PATCH] configs/snps_arc*_defconfig: update linux version

Hi Evgeniy,

Please add this patch for HSDK board as it hasn't backported to 5.6.x yet.
http://patchwork.ozlabs.org/patch/1267619/

---
 Eugeniy Paltsev


________________________________________
From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Sent: Friday, April 10, 2020 23:16
To: buildroot at busybox.net
Cc: Evgeniy Didin; Evgeniy Didin; Thomas Petazzoni; arc-buildroot at synopsys.com
Subject: [arc-buildroot] [PATCH] configs/snps_arc*_defconfig: update linux version

With this commit we update for ARC boards Linux kernel
version to 5.6.3 and Linux headers version to 5.6.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 configs/snps_arc700_axs101_defconfig  | 6 +++---
 configs/snps_archs38_axs103_defconfig | 6 +++---
 configs/snps_archs38_haps_defconfig   | 6 +++---
 configs/snps_archs38_hsdk_defconfig   | 6 +++---
 configs/snps_archs38_vdk_defconfig    | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index 5d9b5a5139..080250e92b 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"

-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y

 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.31"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index c6e2b10f0f..c5847809ba 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"

-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y

 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.31"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

diff --git a/configs/snps_archs38_haps_defconfig b/configs/snps_archs38_haps_defconfig
index cb5edea2c8..a95d760df2 100644
--- a/configs/snps_archs38_haps_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -7,12 +7,12 @@ BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y

-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y

 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.31"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 646cd99d99..af7cba6c2e 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -2,8 +2,8 @@
 BR2_arcle=y
 BR2_archs38_full=y

-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y

 # System
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
@@ -13,7 +13,7 @@ BR2_SYSTEM_DHCP="eth0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.31"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"

diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
index 7c7834f9bd..8d8e9f7559 100644
--- a/configs/snps_archs38_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 BR2_TARGET_ROOTFS_EXT2=y

-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y

 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.31"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
--
2.16.2
