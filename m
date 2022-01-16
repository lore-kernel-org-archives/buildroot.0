Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DB4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 11:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA4560B97;
	Sun, 16 Jan 2022 11:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfzBLviIEzfj; Sun, 16 Jan 2022 11:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA26860BA4;
	Sun, 16 Jan 2022 11:26:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EB8C1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 11:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CCAC826FB
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 11:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqP9KdYtw8pq for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 11:26:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A267A81C56
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 11:26:06 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m1so46659005lfq.4
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBJbWyNIw746DMoygMaw3UohMhI9bJeQKfFtquay1no=;
 b=jE01zlnBWQVlSUMEonxHwZ/Mn1OYVs40GW8SdgHo7cB2QLRZILVmnhod2yEip2zwfx
 aQN4FQ+ja4NshRNCXLgyX1pZFTltY3zey0ZLk4yxHx4Hg0VxjTSFDLc7MOZVpWif6cDC
 5qOHSXS6EAjh1gpXXzgRW1gaJLcZwPokdAkOh7ozIWaAFRShwk1jrJ5P68WTG1TDSW1n
 vHbwKES4TxO3yURCRLEElJIYeE9D6fCLau7Qcg6xorOG6RfvevJseb4oIJdnZph+txTf
 s4scfnbs5NiOrvl5C/8GQ/i8X+xkoKUohfhUMOREVW+f19SRATheyF0l04H1toMrrE5r
 Apsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBJbWyNIw746DMoygMaw3UohMhI9bJeQKfFtquay1no=;
 b=y7swlZZ2GzQz6naXGPX4Bwny9LzqXY0q3jj4LYlGWuqLeZgXeFidu6QU1IY+ugv76m
 CzWRjGhcLiaVkZdO80f73TPjn14s4v8pTV2iX6uC8nFA19vYP163KOMSEBN5Qhmn6qg6
 MilGaE40HY4CQ2XjN7PQUQ+k9Y+Tx7fy0jWab9PCfTCerAE2TYtZ7AHg7WQDTb0mEEPW
 NfCMwSzf6Jf4nHE5a0TrgOQ1byl3dwS03zIN+mfB9vGQWyY2fBIB8GC96+LYPa9aALrp
 MhSWOLNOGtjEK9M7Kh73Klxmoz9vE6THmx9dPcYcdxtBK3Lw0EQVcMhMi39eeWd1UPF6
 Tv1Q==
X-Gm-Message-State: AOAM533V/G4cAhIGGsSCqcWEeOBQ7dkeOtRuwlaZ8Ssa748NKPuYeudn
 XN5Vy2OANhQAQxHLjXM1cjZ6Tzl4QAE=
X-Google-Smtp-Source: ABdhPJzndKoTjVbD64UP2LAAfceMl8T6vAab7lnxb5EI5fRJmSicPEOQL/TQGWyntRB8c1VfDKCtIg==
X-Received: by 2002:a05:6512:4cc:: with SMTP id
 w12mr13543664lfq.610.1642332364261; 
 Sun, 16 Jan 2022 03:26:04 -0800 (PST)
Received: from hellfire.local ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id e14sm1095520lfn.198.2022.01.16.03.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 03:26:03 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 14:26:00 +0300
Message-Id: <20220116112600.28441-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/orangepi/orangepi-zero:extlinux,
 refactoring
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
- common scenarios for multiple boards to create the SD image: board/orangepi/common;
- extlinux.conf instead of boot.scr;
- exclude FAT partition;
- defconfig refactoring;
- kernel: bump to version 5.12.19, if newer then BR2_PACKAGE_XR819_XRADIO will not compile;
- u-boot: bump to version 2022.01

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 board/orangepi/common/extlinux.conf       |  5 ++
 board/orangepi/common/genimage.cfg        | 19 +++++++
 board/orangepi/common/post-build.sh       | 34 ++++++++++++
 board/orangepi/common/uboot-extras.config |  3 +
 board/orangepi/orangepi-zero/boot.cmd     |  9 ---
 board/orangepi/orangepi-zero/genimage.cfg | 36 ------------
 configs/orangepi_zero_defconfig           | 67 ++++++++++++++---------
 7 files changed, 102 insertions(+), 71 deletions(-)
 create mode 100644 board/orangepi/common/extlinux.conf
 create mode 100644 board/orangepi/common/genimage.cfg
 create mode 100755 board/orangepi/common/post-build.sh
 create mode 100644 board/orangepi/common/uboot-extras.config
 delete mode 100644 board/orangepi/orangepi-zero/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero/genimage.cfg

diff --git a/board/orangepi/common/extlinux.conf b/board/orangepi/common/extlinux.conf
new file mode 100644
index 0000000000..015f29270e
--- /dev/null
+++ b/board/orangepi/common/extlinux.conf
@@ -0,0 +1,5 @@
+LABEL default
+  kernel /boot/%LINUXIMAGE%
+  devicetreedir /boot
+  append root=PARTUUID=%PARTUUID% rootwait console=${console}
+# append root=PARTUUID=%PARTUUID% rootwait console=${console} rootfstype=ext4 quiet panic=10
diff --git a/board/orangepi/common/genimage.cfg b/board/orangepi/common/genimage.cfg
new file mode 100644
index 0000000000..fd250ef05d
--- /dev/null
+++ b/board/orangepi/common/genimage.cfg
@@ -0,0 +1,19 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = gpt
+		gpt-no-backup = true
+		gpt-location = 1008K # 1MB - 16KB
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB - 16KB
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/orangepi/common/post-build.sh b/board/orangepi/common/post-build.sh
new file mode 100755
index 0000000000..296f94b174
--- /dev/null
+++ b/board/orangepi/common/post-build.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
+		echo "uImage"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
+		echo "Image"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" ${BR2_CONFIG}; then
+		echo "Image.gz"
+	else
+		echo "zImage"
+	fi
+}
+
+generic_getty()
+{
+	if grep -Eq "^BR2_TARGET_GENERIC_GETTY=y$" ${BR2_CONFIG}; then
+		echo ""
+	else
+		echo "s/\s*console=\S*//"
+	fi
+}
+
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+
+sed -e "$(generic_getty)" \
+	-e "s/%LINUXIMAGE%/$(linux_image)/g" \
+	-e "s/%PARTUUID%/$PARTUUID/g" \
+	"board/orangepi/common/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+
+sed "s/%PARTUUID%/$PARTUUID/g" "board/orangepi/common/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/orangepi/common/uboot-extras.config b/board/orangepi/common/uboot-extras.config
new file mode 100644
index 0000000000..5aa97523d9
--- /dev/null
+++ b/board/orangepi/common/uboot-extras.config
@@ -0,0 +1,3 @@
+CONFIG_BOOTDELAY=0
+CONFIG_USE_PREBOOT=y
+CONFIG_PREBOOT="setenv preboot;"
diff --git a/board/orangepi/orangepi-zero/boot.cmd b/board/orangepi/orangepi-zero/boot.cmd
deleted file mode 100644
index d094a64fe5..0000000000
--- a/board/orangepi/orangepi-zero/boot.cmd
+++ /dev/null
@@ -1,9 +0,0 @@
-setenv fdt_high ffffffff
-
-part uuid mmc 0:2 uuid
-setenv bootargs console=ttyS0,115200 root=PARTUUID=${uuid} rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-zero.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero/genimage.cfg b/board/orangepi/orangepi-zero/genimage.cfg
deleted file mode 100644
index 32f5454ae6..0000000000
--- a/board/orangepi/orangepi-zero/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the OrangePi Zero
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h2-plus-orangepi-zero.dtb",
-			"boot.scr"
-		}
-	}
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 1c107b10e6..908bcea893 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -1,49 +1,64 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
+
+# System
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
-BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_SYSTEM_DHCP="eth0"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
+BR2_GCC_ENABLE_LTO=y
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/orangepi/common/uboot-extras.config"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.19"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="63M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^64bit,fast_commit"
+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
+BR2_TARGET_ROOTFS_TAR=n
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_GENIMAGE=y
 
-# wireless driver and firmware
+# Wireless driver and firmware
+# [16.01.2022] Doesn't compile with newer kernels > 5.12.x
 BR2_PACKAGE_XR819_XRADIO=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
 
-# wireless support
+# Wireless support
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
@@ -51,5 +66,5 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
 BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
 BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 
-# spi flash support
+# Spi flash support
 BR2_PACKAGE_MTD=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
