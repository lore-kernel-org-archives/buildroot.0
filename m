From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 20:44:17 +0100
Subject: [Buildroot] [PATCH 7/7] configs: remove old/broken Atmel
	configurations
In-Reply-To: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1443901457-7914-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The at91rm9200df_defconfig configuration is really old: it builds a
2.6.38 kernel with the old days kernel patches and a 2010.06
U-Boot. It hasn't been updated since a long time, so let's get rid of
it.

The at91sam9260dfc_defconfig, at91sam9261ek_defconfig and
at91sam9263ek_defconfig refer to kernel defconfigs that no longer
exists, so they fail to build.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91rm9200df_defconfig   | 30 ------------------------------
 configs/at91sam9260dfc_defconfig | 19 -------------------
 configs/at91sam9261ek_defconfig  | 19 -------------------
 configs/at91sam9263ek_defconfig  | 19 -------------------
 4 files changed, 87 deletions(-)
 delete mode 100644 configs/at91rm9200df_defconfig
 delete mode 100644 configs/at91sam9260dfc_defconfig
 delete mode 100644 configs/at91sam9261ek_defconfig
 delete mode 100644 configs/at91sam9263ek_defconfig

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
deleted file mode 100644
index 5994f43..0000000
--- a/configs/at91rm9200df_defconfig
+++ /dev/null
@@ -1,30 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm920t=y
-
-# Filesystem
-BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056=y
-BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x420
-BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x2100
-BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
-BR2_TARGET_ROOTFS_JFFS2_LE=y
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="2.6.38.8"
-BR2_DEFAULT_KERNEL_HEADERS="2.6.38.8"
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91rm9200ek"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.06"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.38-at91.patch.gz"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91rm9200ek"
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
deleted file mode 100644
index 20389f3..0000000
--- a/configs/at91sam9260dfc_defconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Host utilities
-#
-BR2_PACKAGE_HOST_SAM_BA=y
-
-# First stage bootloader
-BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
-
-# Second stage bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9260ek_dataflash_cs0"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260_9g20"
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
deleted file mode 100644
index 0824a00..0000000
--- a/configs/at91sam9261ek_defconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Host utilities
-#
-BR2_PACKAGE_HOST_SAM_BA=y
-
-# First stage bootloader
-BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9261ek"
-
-# Second stage bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9261ek_dataflash_cs0"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9261_9g10"
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
deleted file mode 100644
index 208e057..0000000
--- a/configs/at91sam9263ek_defconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Host utilities
-#
-BR2_PACKAGE_HOST_SAM_BA=y
-
-# First stage bootloader
-BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9263ek"
-
-# Second stage bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9263ek_dataflash_cs0"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9263"
-- 
2.6.0
