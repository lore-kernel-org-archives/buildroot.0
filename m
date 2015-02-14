From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 17:40:04 +0100
Subject: [Buildroot] [git commit branch/next] configs: get rid of avr32
	defconfigs
Message-ID: <20150214164751.EBF957FC42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=188c0a3168e1670069556c42c3130f006f5b062d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atngw100_defconfig  |   35 -----------------------------------
 configs/atstk100x_defconfig |   26 --------------------------
 2 files changed, 0 insertions(+), 61 deletions(-)

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
deleted file mode 100644
index d410f5b..0000000
--- a/configs/atngw100_defconfig
+++ /dev/null
@@ -1,35 +0,0 @@
-# AVR32 is deprecated
-BR2_DEPRECATED=y
-
-# Architecture
-BR2_avr32=y
-
-# Lock down kernel headers version, to match the kernel version used
-# below.
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.9.11"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
-
-# Filesystems
-BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
-BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
-BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
-BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
-BR2_TARGET_ROOTFS_JFFS2_BE=y
-BR2_TARGET_ROOTFS_TAR=y
-BR2_TARGET_ROOTFS_TAR_NONE=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="atngw100"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.09"
-
-# Kernel. Locked to 3.9.x, because 3.10.x fails to build with
-# relocation truncated to fit: R_AVR32_16N_PCREL against symbol
-# `_ctype'
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.11"
-BR2_LINUX_KERNEL_DEFCONFIG="atngw100"
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
deleted file mode 100644
index 0e17e36..0000000
--- a/configs/atstk100x_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-# AVR32 is deprecated
-BR2_DEPRECATED=y
-
-# Architecture
-BR2_avr32=y
-
-# Lock to same version as kernel
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.9.11"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
-
-# U-Boot
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.09"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.11"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="atstk1002"
-
-# Filesystem
-BR2_TARGET_ROOTFS_TAR=y
