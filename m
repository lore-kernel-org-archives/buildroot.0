From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 20:44:11 +0100
Subject: [Buildroot] [PATCH 1/7] configs: remove gnublin_defconfig
In-Reply-To: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1443901457-7914-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig tries to fetch its kernel source code and U-Boot source
code from gitorious.org, which is not longer available. Therefore,
this defconfig has been failing to build since quite some time. Since
there's no obvious other place to grab the kernel and u-boot source
code, and the defconfig was not updated since a long time, let's
simply get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/gnublin_defconfig | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 configs/gnublin_defconfig

diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
deleted file mode 100644
index 369c9da..0000000
--- a/configs/gnublin_defconfig
+++ /dev/null
@@ -1,28 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# System
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.7"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_7=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Gnublin"
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=475000
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="GNUBLIN"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2009.11_gnublin_support_v2"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v3.7-gnublin-2"
-BR2_LINUX_KERNEL_DEFCONFIG="gnublin"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.6.0
