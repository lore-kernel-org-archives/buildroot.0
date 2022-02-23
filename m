Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F2EC4321E
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DB55408F8;
	Wed, 23 Feb 2022 19:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXZHPKDKOQ5C; Wed, 23 Feb 2022 19:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03C6B408F1;
	Wed, 23 Feb 2022 19:15:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD5A41BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E468239A
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9n1sWG9hHM3 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E720D81B69
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:14:44 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bn33so26108688ljb.6
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=piTql1F2okZMcQK4fJIae2kZuuV5VqNmjAq8sNka/YY=;
 b=bJ0H+l+m/Ti47J8odJXCEtyu93cl8dASjR5P0IYDInshJtpogFYCmkme/oXTWehGn6
 1ls5yTrjvwqp1Rl1seTiNFnxyd1zYYALOAN6HPl4uW1JReepE/cqaKtiFQBywN+6pAfW
 EENo++MuoipZIOSb0XddA+do4q8Ki5yfycm3Gqa5GANeuQWvB01DjEGuPQa3Y7EeGZ19
 lH+IcWFXQxntI4FvJn96rDy7McGFhYvqlUDhbs/eL+bLJrX3c1IqQ55NPAyNbsI6zaio
 JXxiK6ZfQhHCXhlCnYATknQJMZ3n8UjoDZjO/SRf75hgnCo5D4/42ybWJPm+c3IItqK7
 AYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piTql1F2okZMcQK4fJIae2kZuuV5VqNmjAq8sNka/YY=;
 b=PYkeCqjs75MDgzd+nELqDPv44fIEb35a80xiBhrrVn1CoY/yd8O5XZrlpmeBEK7giC
 0Vj1BiU66ozgO9k0oJlUMkBeLIFC0D8cdapFozGhsCR3jg2l5dR9S0W0l5YML/XCunTl
 NI7ZvzkwxwX5MVzlwvdQsh4S8KkMkuavAZjA33ezDHgSEMYiMLivCWa7foSTWF+euw7i
 IazPZyD6gHAhi9LyjsFU+KfK0cIjuht7nXEju/+LufzOjESMjL/ZfJnGdEmO8qY+AkUm
 tslujgaH3rcQkQH4nE62xUUuzVxIVGbNymZb4Y9f3ttUzwhCYwaDj3dCuqPpRtlLmcUu
 fzsA==
X-Gm-Message-State: AOAM530STg8I2RaGi+kedH+kZbxv7u45z/xYyClzchluUMcZgfFY/hgo
 o+ZeA5bEOWQ2eYF//oplLymagjCcDACIrQ==
X-Google-Smtp-Source: ABdhPJxJ9knogV1PgF+NVn+SfzEsqOJ/HybZn2c47SS9zN2osxUz2yigQxiZQgVLf1JV4dlWyXyjoQ==
X-Received: by 2002:a2e:7009:0:b0:244:d483:b2b1 with SMTP id
 l9-20020a2e7009000000b00244d483b2b1mr621952ljc.308.1645643682752; 
 Wed, 23 Feb 2022 11:14:42 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id o22sm31750lfr.92.2022.02.23.11.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:14:42 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 22:14:35 +0300
Message-Id: <20220223191436.3045255-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223191436.3045255-1-geomatsi@gmail.com>
References: <20220223191436.3045255-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] board/orangepi/orangepi-one: switch to
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to extlinux instead of U-Boot boot script. Drop custom
boot script and genimage config. Instead use common orangepi
files from board/orangepi/common.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-one/boot.cmd     |  8 -----
 board/orangepi/orangepi-one/genimage.cfg | 37 ------------------------
 configs/orangepi_one_defconfig           |  9 ++----
 3 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 board/orangepi/orangepi-one/boot.cmd
 delete mode 100644 board/orangepi/orangepi-one/genimage.cfg

diff --git a/board/orangepi/orangepi-one/boot.cmd b/board/orangepi/orangepi-one/boot.cmd
deleted file mode 100644
index ab616e6ac9..0000000000
--- a/board/orangepi/orangepi-one/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-one.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-one/genimage.cfg b/board/orangepi/orangepi-one/genimage.cfg
deleted file mode 100644
index 2a14dcdec2..0000000000
--- a/board/orangepi/orangepi-one/genimage.cfg
+++ /dev/null
@@ -1,37 +0,0 @@
-# Minimal SD card image for the OrangePi PC
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-one.dtb",
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
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 1a2772a307..ba128424a0 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-one"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
@@ -25,11 +26,7 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-one/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-one/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
