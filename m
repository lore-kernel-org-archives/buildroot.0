Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF569C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 07:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF4660E90;
	Sat,  5 Feb 2022 07:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skwdGlEv8z4v; Sat,  5 Feb 2022 07:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDE760E8F;
	Sat,  5 Feb 2022 07:28:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D120A1BF479
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 07:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8CE0401E1
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 07:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bCHAQaRF49A for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 07:28:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D492440224
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 07:28:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id o17so11704628ljp.1
 for <buildroot@buildroot.org>; Fri, 04 Feb 2022 23:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ocbHN9O3gYqyzXvZuZRBBvT/4ibzcii+Mh35HRuSTEc=;
 b=jokogN1Jj/yLTpVxiR5eFOz8uYmGFZ+7z+3sr8qSQEm3QXQNtISNi+WlCtvPXinJa4
 KvGQhBi2DEdfdF4FjnyLujWMbxgkg4DyBMzdnFMhUuWO11rJV3gQkcvxs9xvC25AZu0j
 sV3X0qV5qd+9nvOpqcTDOYmEmZDA/ojzC3XF616IM84bJsxt09pYu/WSDvyi5vEdlgUR
 xlkvbfdmYHkyexdZmiXKDnCSDLayJjby9CWnquFsT8sdXKKmTOI1V+K9hkWRgjFVEHIO
 jP9PGkKzwJ8V9dCKeQG3AFbfuBsqtS/Mtxp6hS+wxPcdqv6Z+fGwoPkJkJ+ijCknldld
 zmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ocbHN9O3gYqyzXvZuZRBBvT/4ibzcii+Mh35HRuSTEc=;
 b=mFLT0uPqutCqPDcV3wx+EhZ2Ebx79Db50SSztGmlPiKWHWMFEuRDBjpXxmArwwbhDa
 Inzm+BUi6/b2NBx12rHjapOD9sja6IiqCYNlkKQL2vSO9/ruL5NXySZab8Kyz0VIwf3h
 oqz0w+zMpfAaH+9vgc9Eh7FM19t5blgzB7ukwzsPRA5naj5yv7CI/L7IGiLr40ln1hd2
 MP3hBZIhB0CplMnaGIJsG8GKhqF4UX/aVhZA8PDdHtvhEnrbnubXeNQsnyNBLjRTZmKh
 68VAYW+5+Ih90MXCN/brZ+2L5eKe1uMpxWPIVu0FT5XXi3Oup3iDf49mwz8WYYVBNdcz
 kIDQ==
X-Gm-Message-State: AOAM530eSm9J3y269Jm+iHI5ENoVEtTYse+o4IpHH/2utzU1kqsJm2NT
 sJ8dl9v+ZJnhNCvXcFdNlaSj5hUV1ZM=
X-Google-Smtp-Source: ABdhPJykL/NMJBh6qdwi42utWgRuE9Th3kUPxe33l1YZ79OdQ0YXwM/PaaSI2QOaPWfah5wpyUfwSw==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr1824382ljl.359.1644046088462; 
 Fri, 04 Feb 2022 23:28:08 -0800 (PST)
Received: from hellfire.local ([178.155.5.31])
 by smtp.gmail.com with ESMTPSA id bi8sm615198lfb.292.2022.02.04.23.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 23:28:07 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 10:28:01 +0300
Message-Id: <20220205072801.13567-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/orangepi_zero_defconfig: switch to
 extlinux
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
- Exclude FAT partition, he is no longer needed for U-Boot.
- Switch the rootfs partition from MBR to GPT for partition-uuid to work.
- Switch to extlinux, this is convenient for debugging.
- Create common scenarios for multiple boards to create an SD image: board/orangepi/common.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 board/orangepi/common/extlinux.conf       |  5 ++++
 board/orangepi/common/genimage.cfg        | 23 +++++++++++++++
 board/orangepi/common/post-build.sh       | 34 +++++++++++++++++++++
 board/orangepi/orangepi-zero/boot.cmd     |  9 ------
 board/orangepi/orangepi-zero/genimage.cfg | 36 -----------------------
 configs/orangepi_zero_defconfig           | 11 ++++---
 6 files changed, 67 insertions(+), 51 deletions(-)
 create mode 100644 board/orangepi/common/extlinux.conf
 create mode 100644 board/orangepi/common/genimage.cfg
 create mode 100755 board/orangepi/common/post-build.sh
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
index 0000000000..fa0d988991
--- /dev/null
+++ b/board/orangepi/common/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+	}
+
+	hdimage {
+		partition-table-type = gpt
+		gpt-location = 1008K # 1MB - 16KB(GPT)
+		gpt-no-backup = true
+		# After writing the image to the SD card,
+		# backup GPT data structures at the end of the disk:
+		# gdisk /dev/mmcblk0 then press the buttons: x, e, w, y
+	}
+
+	partition rootfs {
+		offset = 1M
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
index 5aaa1566c5..96f0c3f600 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -20,10 +20,13 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="63M"
+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloader
@@ -39,16 +42,12 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Required tools to create the SD image
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
 
 # Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # Wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
