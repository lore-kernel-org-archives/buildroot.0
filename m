Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F157C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 18:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E3E60B8F;
	Thu, 17 Feb 2022 18:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 085OoY7A-gTJ; Thu, 17 Feb 2022 18:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B096F72B;
	Thu, 17 Feb 2022 18:42:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFAB1BF3EB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C80760B8F
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 18:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcipFyL3lQzB for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 18:42:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A1A460B8B
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 18:42:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b9so944297lfv.7
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bg6MKUzixsXHHmKJc2Gc58NZ+QEAoyM/mDzfRuX2SJM=;
 b=C+gfY8Z0bdkUvgHhNjAgQ+dgnQt+nKQy3LvW1zaFdYSdyaEd8I4hwjvoToOo89/8hn
 sf+dEFG+DlIIDDsew4FoUH5/d85EW0WhnoJsR4FQiW+8RQktimraRY+x/fSs3ia1/6WU
 e3YoeiwTmGyg/sSQK2BZ1v4u/t75SOc+nYWI7KIi8QKQFwO9IG32pfqDbmB+KsfmaeMd
 0IlmOwEHqqqspwvlc9p6Xot9iMWp2xlOVjwANNyqeU0bGvdpg9CS83lJeu+W223lZBW1
 t8UH/ucnrUpPDSFHHj03ll94pO1ZCmR64jW0jLMqcl2kndqYGJIdFDXo5fF0OxMD1ohH
 0ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bg6MKUzixsXHHmKJc2Gc58NZ+QEAoyM/mDzfRuX2SJM=;
 b=BXYNJ7v0jf7LoJh82jGraIb75rQoeVeIlmV4wMbbywQbNMKoxUmew3Eq24V07pViz8
 J9VEFuIYQy2vz41x1IrfVeBdtuOAjkRqBesmUBkLqsX6yUGfyzmkK+2H/bZ5eOOwQmWS
 XoliQckJ0wBjmAYa/79ZjT6b3TmHY5VNW3yYQpWx0QttG8CEybkmOfPVx4TOVSTGZ45o
 YYxPXgutdyE6ljYkBWNBmRIyEzRy+nbuysQjn7CP+kRgZP3m0u442DimiHO+9yatwoQp
 W4F2JMc30EBZC7DuYJ09R6WXQbAfHRriIvT1IAi0hqc6cLCbKm2dUBlBNm3VmAEm7adj
 9iiQ==
X-Gm-Message-State: AOAM533S00BQkUWLx2w5VJicpIITvV4XnnSZ4Sgn4uNy7crBFkaZ7ile
 7LBzXjj3JeXsCWc+V7cQZFCOgm6YIxE=
X-Google-Smtp-Source: ABdhPJyXG3jCSY3HlE5kfYqAwlXUKGYYBV6OxJuhVfS0lh0YdxA4PpDSOmy38cGATba4OvWxkPzSJw==
X-Received: by 2002:a05:6512:6c4:b0:437:9409:984c with SMTP id
 u4-20020a05651206c400b004379409984cmr2896859lff.199.1645123334012; 
 Thu, 17 Feb 2022 10:42:14 -0800 (PST)
Received: from hellfire.local ([178.155.5.22])
 by smtp.gmail.com with ESMTPSA id c8sm40561lfr.119.2022.02.17.10.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 10:42:13 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:42:09 +0300
Message-Id: <20220217184209.16736-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/orangepi_pc_defconfig: switch to
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
* Switch to common scenarios for multiple boards to create an SD image: board/orangepi/common.
* Exclude FAT partition, it is no longer needed for U-Boot.
* Switch SD image from MBR to GPT for partition-uuid to work.
* Switch to extlinux, this is convenient for debugging.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 board/orangepi/orangepi-pc/boot.cmd     |  8 ------
 board/orangepi/orangepi-pc/genimage.cfg | 37 -------------------------
 configs/orangepi_pc_defconfig           |  9 ++----
 3 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 board/orangepi/orangepi-pc/boot.cmd
 delete mode 100644 board/orangepi/orangepi-pc/genimage.cfg

diff --git a/board/orangepi/orangepi-pc/boot.cmd b/board/orangepi/orangepi-pc/boot.cmd
deleted file mode 100644
index 9da625c803..0000000000
--- a/board/orangepi/orangepi-pc/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-pc/genimage.cfg b/board/orangepi/orangepi-pc/genimage.cfg
deleted file mode 100644
index 14e326cc56..0000000000
--- a/board/orangepi/orangepi-pc/genimage.cfg
+++ /dev/null
@@ -1,37 +0,0 @@
-# Minimal SD card image for the OrangePi PC
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-pc.dtb",
-			"boot.scr"
-		}
-	}
-
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
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 44ea9b95c4..fd0f64e0e6 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -5,8 +5,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
@@ -14,6 +15,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
@@ -27,9 +29,4 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
