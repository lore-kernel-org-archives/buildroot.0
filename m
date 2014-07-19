From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 16:44:51 +0200
Subject: [Buildroot] [PATCH] configs: remove lpc32xx defconfigs
Message-ID: <1405781091-32170-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those defconfigs rely on gcc 4.3.x, which was said to be the only gcc
version that was producing a working kernel. Since we have removed gcc
4.3.x, those defconfigs no longer build. Also, the kernel being used
in these defconfigs was 2.6.32, but there is a "new" 2.6.39 kernel
available from the lpclinux.com git repository, which maybe works fine
with more recent compilers.

However, those defconfigs were contributed by Alexandre Belloni, who
no longer has access to the hardware, so we have no way to verify that
a compiler update + kernel update actually works.

Therefore, we simply remove those defconfigs.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/ea3250_defconfig  | 49 -----------------------------------------------
 configs/fdi3250_defconfig | 49 -----------------------------------------------
 configs/phy3250_defconfig | 49 -----------------------------------------------
 3 files changed, 147 deletions(-)
 delete mode 100644 configs/ea3250_defconfig
 delete mode 100644 configs/fdi3250_defconfig
 delete mode 100644 configs/phy3250_defconfig

diff --git a/configs/ea3250_defconfig b/configs/ea3250_defconfig
deleted file mode 100644
index b7ce18b..0000000
--- a/configs/ea3250_defconfig
+++ /dev/null
@@ -1,49 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-BR2_ARM_TYPE="ARM926T"
-BR2_ARM_EABI=y
-
-#
-# GCC Options
-# We need to force GCC 4.3.x because it is the last version
-# that will compile a kernel with ethernet working correctly
-BR2_GCC_VERSION_4_3_X=y
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="2.6.34.7"
-BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"
-
-#
-# Host utilities
-#
-BR2_PACKAGE_HOST_LPC3250LOADER=y
-
-
-# Bootloaders
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="ea3250"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_VERSION="master"
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
-BR2_TARGET_UBOOT_FORMAT_BIN=y
-BR2_TARGET_LPC32XXCDL=y
-BR2_TARGET_LPC32XXCDL_BOARDNAME="ea3250"
-
-
-#
-# Kernel
-#
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
-BR2_LINUX_KERNEL_VERSION="master"
-BR2_LINUX_KERNEL_PATCH=""
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="ea3250"
-BR2_LINUX_KERNEL_UIMAGE=y
-
diff --git a/configs/fdi3250_defconfig b/configs/fdi3250_defconfig
deleted file mode 100644
index b7f6ad7..0000000
--- a/configs/fdi3250_defconfig
+++ /dev/null
@@ -1,49 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-BR2_ARM_TYPE="ARM926T"
-BR2_ARM_EABI=y
-
-#
-# GCC Options
-# We need to force GCC 4.3.x because it is the last version
-# that will compile a kernel with ethernet working correctly
-BR2_GCC_VERSION_4_3_X=y
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="2.6.34.7"
-BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"
-
-#
-# Host utilities
-#
-BR2_PACKAGE_HOST_LPC3250LOADER=y
-
-
-# Bootloaders
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="fdi3250"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_VERSION="master"
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
-BR2_TARGET_UBOOT_FORMAT_BIN=y
-BR2_TARGET_LPC32XXCDL=y
-BR2_TARGET_LPC32XXCDL_BOARDNAME="fdi3250"
-
-
-#
-# Kernel
-#
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
-BR2_LINUX_KERNEL_VERSION="master"
-BR2_LINUX_KERNEL_PATCH=""
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="fdi3250"
-BR2_LINUX_KERNEL_UIMAGE=y
-
diff --git a/configs/phy3250_defconfig b/configs/phy3250_defconfig
deleted file mode 100644
index fe49653..0000000
--- a/configs/phy3250_defconfig
+++ /dev/null
@@ -1,49 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-BR2_ARM_TYPE="ARM926T"
-BR2_ARM_EABI=y
-
-#
-# GCC Options
-# We need to force GCC 4.3.x because it is the last version
-# that will compile a kernel with ethernet working correctly
-BR2_GCC_VERSION_4_3_X=y
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="2.6.34.7"
-BR2_DEFAULT_KERNEL_HEADERS="2.6.34.7"
-
-#
-# Host utilities
-#
-BR2_PACKAGE_HOST_LPC3250LOADER=y
-
-
-# Bootloaders
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="phy3250"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_VERSION="master"
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
-BR2_TARGET_UBOOT_FORMAT_BIN=y
-BR2_TARGET_LPC32XXCDL=y
-BR2_TARGET_LPC32XXCDL_BOARDNAME="phy3250"
-
-
-#
-# Kernel
-#
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
-BR2_LINUX_KERNEL_VERSION="master"
-BR2_LINUX_KERNEL_PATCH=""
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="phy3250"
-BR2_LINUX_KERNEL_UIMAGE=y
-
-- 
2.0.0
