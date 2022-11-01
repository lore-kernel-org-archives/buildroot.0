Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA39BC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B43D415FA;
	Tue,  1 Nov 2022 22:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B43D415FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J08l_s_MXiv5; Tue,  1 Nov 2022 22:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A2940F4E;
	Tue,  1 Nov 2022 22:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A2940F4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFB81BF5DE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0922C60D70
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0922C60D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvxCkXN2xAfR for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:04:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC1F60881
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDC1F60881
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:04:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id CCB50C0004;
 Tue,  1 Nov 2022 22:04:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:03:37 +0100
Message-Id: <20221101220354.403933-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667340242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxPWIedVmZ3mmfpHkyVQOjZG6OL2+CKXx/diaf3UR6s=;
 b=ofHHVOwyZtshWtg3LcLrroo4bcwN4bJcCYCcKOWpybMm4p5ZXZT0ISTia1AlLvMT0SdLAR
 Uuv7s5xrawWHPp1AlCIPDBUiyXXDA+ltXtuIDQRcNUKT/9Pj8r02IYR2Rq0xIqFD1+WeX7
 s7raqQjK8Aip7zWL8oIB1ryF7NyWFLhgg4X0GhUlHfOwjvVYDtD+7NXVbEW3uobYWUVDtt
 HV55Id2qwgv4gnlYnBPpnxUNO+MgrKjIR+n6HNTit1V3jt0Cnmbb6IqyzAI057vU2laX0J
 jmJCIQx4vRPKruPm/Y42ZLZIyIczOKOtQOC6prlCQY2V3G1WaEk8PdywNfu8qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ofHHVOwy
Subject: [Buildroot] [PATCH 05/21] configs/bananapi_m2_plus: remove defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mike Harmony <mike.harmony@snapav.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499005

Cc: Mike Harmony <mike.harmony@snapav.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                          |  4 ----
 board/sinovoip/m2-plus/boot.cmd     |  7 ------
 board/sinovoip/m2-plus/genimage.cfg | 34 -----------------------------
 configs/bananapi_m2_plus_defconfig  | 30 -------------------------
 4 files changed, 75 deletions(-)
 delete mode 100644 board/sinovoip/m2-plus/boot.cmd
 delete mode 100644 board/sinovoip/m2-plus/genimage.cfg
 delete mode 100644 configs/bananapi_m2_plus_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index dc968f9c4f..4eade50385 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2145,10 +2145,6 @@ F:	configs/licheepi_zero_defconfig
 N:	Mike Frampton <mikeframpo@gmail.com>
 F:	package/qcom-db410c-firmware/
 
-N:	Mike Harmony <mike.harmony@snapav.com>
-F:	board/sinovoip/m2-plus/
-F:	configs/bananapi_m2_plus_defconfig
-
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
diff --git a/board/sinovoip/m2-plus/boot.cmd b/board/sinovoip/m2-plus/boot.cmd
deleted file mode 100644
index d22464a1c1..0000000000
--- a/board/sinovoip/m2-plus/boot.cmd
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-mmc dev 0
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-bananapi-m2-plus.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/sinovoip/m2-plus/genimage.cfg b/board/sinovoip/m2-plus/genimage.cfg
deleted file mode 100644
index 9311e026dd..0000000000
--- a/board/sinovoip/m2-plus/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-bananapi-m2-plus.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
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
-	}
-}
diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
deleted file mode 100644
index 77a403ce81..0000000000
--- a/configs/bananapi_m2_plus_defconfig
+++ /dev/null
@@ -1,30 +0,0 @@
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sinovoip/m2-plus/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-bananapi-m2-plus"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Sinovoip_BPI_M2_Plus"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sinovoip/m2-plus/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
