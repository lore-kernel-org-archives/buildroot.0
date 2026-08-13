Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2290C5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C81A8135F;
	Fri, 14 Aug 2026 13:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97EpXBiBx8G9; Fri, 14 Aug 2026 13:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 719C9812CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713698;
	bh=ffmeDDX1BQHvr0HyptLgPqJ2r1qku+229fsNojXTyAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DBhc9T/LEfc77QhMBvkVxopXNCtxloetuzOrX00n2In+lt+XIbEOr4fHtu9zZWeMR
	 z9d/mVYZj7GEGmUt/NWVaF3UMEiPZS5OE1IaagMwxU3Ibbif0f1SyD/CWsGaIkAu8t
	 bUGhv3ZxyT5OZkAIx7l24zXNgx4WljEXJxzFxe/dszxtvgLKNlXjl8dvQJQmOw1VcC
	 CHT4vVtVABLvKeYvrqA6r1x446RjJnACT3KqoIKfTDyEjWKVQ0eH5xqSJ2BnehdxK7
	 SI2kj+jRuWnivKXJh5eomeghpgrkGxc45YWw5gQY5l1Xvq+oyDRn5/v0WsE3pt00eo
	 6JWCXK+ECjXlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719C9812CD;
	Fri, 14 Aug 2026 13:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E9023F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 193DA60803
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6ZpjYwCs4ix for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87AA66080C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87AA66080C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BCA78D66C; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b71826fea491acef4ab3126be502096b60f0948b
X-Git-Newrev: 0de79da7a674849f6751368f67e93e5f505729bd
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.8BCA78D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] configs/ts4900_defconfig:
 remove defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3622959357492327008=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3622959357492327008==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0de79da7a674849f6751368f67e93e5f505729bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This configuration for the TS-4900 was added back in September
2016 (commit 3138ab3fee7b0251e3cb3fba9a373bd3cf9d6424), and has not
been updated in any significant way since then.

This defconfig still use a 4.12 kernel that is no longer maintained.

Remove its support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914086 (ts4900_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fac93ecea81a35f4535df7844896710f46103858)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                    |  2 --
 board/technologic/ts4900/genimage.cfg  | 10 -------
 board/technologic/ts4900/post-image.sh | 17 -----------
 board/technologic/ts4900/readme.txt    | 52 ----------------------------------
 configs/ts4900_defconfig               | 16 -----------
 5 files changed, 97 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4d5bd1e32c..e79e81048e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -52,7 +52,6 @@ board/stmicroelectronics/stm32f429-disco/flash.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_sd.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
 board/synopsys/axs10x/post-build.sh Shellcheck
-board/technologic/ts4900/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch lib_patch.Upstream
 boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch lib_patch.Upstream
@@ -151,7 +150,6 @@ configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
-configs/ts4900_defconfig lib_defconfig.ForceCheckHash
 configs/ts5500_defconfig lib_defconfig.ForceCheckHash
 configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/technologic/ts4900/genimage.cfg b/board/technologic/ts4900/genimage.cfg
deleted file mode 100644
index 7e580eb27b..0000000000
--- a/board/technologic/ts4900/genimage.cfg
+++ /dev/null
@@ -1,10 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-		size = 256M
-	}
-}
diff --git a/board/technologic/ts4900/post-image.sh b/board/technologic/ts4900/post-image.sh
deleted file mode 100755
index cb966d883b..0000000000
--- a/board/technologic/ts4900/post-image.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/bash
-#
-# Copyright (C) 2015-2016 Savoir-Faire Linux
-# Post image generation script.
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG=$BOARD_DIR/genimage.cfg
-GENIMAGE_TMP=$BUILD_DIR/.genimage_tmp
-
-rm -rf $GENIMAGE_TMP
-
-${HOST_DIR}/bin/genimage \
-        --config ${GENIMAGE_CFG} \
-        --rootpath $TARGET_DIR \
-        --tmppath $GENIMAGE_TMP \
-        --inputpath $BINARIES_DIR \
-        --outputpath $BINARIES_DIR
diff --git a/board/technologic/ts4900/readme.txt b/board/technologic/ts4900/readme.txt
deleted file mode 100644
index 121e639749..0000000000
--- a/board/technologic/ts4900/readme.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-Technologic Systems TS-4900
-===========================
-
-This document explains how to set up a basic Buildroot system for the
-Technologic Systems TS-4900 System on Module.
-
-The TS-4900 is a TS-SOCKET macrocontroller board based on the
-Freescale i.MX6 Single or Quad Core ARM Cortex-A9 CPU clocked at
-1GHz. The TS-4900 features Gigabit Ethernet, SATA II Port, PCI Express
-Bus, high speed USB host and device (OTG), and microSD card.
-More details on the board here:
-   https://docs.embeddedTS.com/TS-4900
-
-The TS-4900 is not currently supported by mainline Linux, so a
-Technologic Systems Linux is used based on Linux 4.1.
-The default U-boot configuration flashed scans the SD card to find the
-0x83 partition type, corresponding to the rootfs. Then it will load
-both uImage and dts from the /boot directory.
-To build the default configuration you only have to:
-
-   $ make ts4900_defconfig
-   $ make
-
-The output looks like:
-output/images/
-├── imx6q-ts4900.dtb
-├── rootfs.ext2
-├── rootfs.tar
-├── sdcard.img
-└── uImage
-
-Since both the uImage and the dts are contained in the /boot
-directory, the provided post-image script generates an image file
-containing only one partition for the rootfs:
-
-   $ fdisk output/images/sdcard.img
-                      Device Boot Start    End Blocks Id  System
-output/images/sdcard.img1               1      524288      262144   83  Linux
-
-This image can be directly written to an SD card.
-
-   $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
-
-In order to test the image on TS-4900 board, a TS baseboard, such as
-the TS-9xxx series, is needed to provide power, console header, RJ45
-connector etc.
-
-The bootloader comes pre-flashed on the board on an SPI flash. Since
-updating the bootloader is risky and not trivial, it is not included
-in the Buildroot defconfig. Refer to
-https://docs.embeddedTS.com/TS-4900#U-Boot for details on which
-U-Boot config to use and how to flash it.
diff --git a/configs/ts4900_defconfig b/configs/ts4900_defconfig
deleted file mode 100644
index e7950cea4b..0000000000
--- a/configs/ts4900_defconfig
+++ /dev/null
@@ -1,16 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4900/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-ts4900"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_PACKAGE_TS4900_FPGA=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_PACKAGE_HOST_GENIMAGE=y

--===============3622959357492327008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3622959357492327008==--
