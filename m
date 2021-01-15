From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri, 15 Jan 2021 12:03:17 -0800
Subject: [Buildroot] [PATCH 2/4] configs/snps_archs38_hsdk_defconfig:
 refresh defconfig
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
Message-ID: <20210115200319.4139041-3-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No config changes done

| make snps_archs38_hsdk_defconfig
| make savedefconfig

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 configs/snps_archs38_hsdk_defconfig | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 9a9d57b32589..b8fd35636000 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,33 +1,19 @@
-# Architecture
 BR2_arcle=y
 BR2_archs38_full=y
-
-# Linux headers same as kernel, a 5.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
-
-# System
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
 BR2_SYSTEM_DHCP="eth0"
-
-# Kernel
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
-
-# Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
-
-# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
@@ -35,7 +21,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_ELF=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/synopsys/hsdk/uboot.env.txt"
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x4000"
-- 
2.25.1
