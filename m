Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA2CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 10:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C91D80F9F;
	Tue, 19 Aug 2025 10:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtbW6TadI_t6; Tue, 19 Aug 2025 10:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039ED81167
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 039ED81167;
	Tue, 19 Aug 2025 10:15:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34269E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ADC560ADD
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JR7civbmjCk for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 10:15:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7C5760A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C5760A64
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7C5760A64
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:15:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 47A96C6B390
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:15:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFF1F60697;
 Tue, 19 Aug 2025 10:15:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A87441C22833F; 
 Tue, 19 Aug 2025 12:15:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
Date: Tue, 19 Aug 2025 12:15:30 +0200
Message-ID: <20250819101531.3320258-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755598540; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2kpoPtuF2LXWOY6A24lDRdInriFxbpRgX2Dgq8hTBzU=;
 b=pCKvsxJnS05sRsspU7En31k9D6YQTHp9FQnmd05IVl77/hNeNNkB62vVdIRcK8hH0UFnwI
 5Z/YCCeqgOX9btjlnnm/8IEA/ma+iBTRUNPUjzrzQW38J55Zw3T0fg+137eHX0dFQHU+t2
 TRCvZudaYkrgj9inDn5nNeLYlyxvYJQ+PdLBfDSSxZGIxBLysz79aXa31zhm6VUJMJK0w4
 t1JuOrM5cvWNMN+ZKgthNkJlDLoF6Z37yxbOzOdw70G9nadTS4fDDzHJxHgLxf3hXrMfct
 YxVg2EsEvL0FJNxickPmXzPd8m5LIt1J4w0PHvYT6ZdJDQGUEaCVlggQ9gEHtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pCKvsxJn
Subject: [Buildroot] [PATCH] configs/riotboard: remove defconfig, broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769450

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Driotboard&kind=BUILD

It is using the outdated, not even LTS 4.18.x kernel, which most
likely explains why it no longer builds with modern toolchains.

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769450

Cc: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  1 -
 DEVELOPERS                                    |  4 --
 board/embest/riotboard/genimage.cfg           | 17 ---------
 board/embest/riotboard/readme.txt             | 38 -------------------
 .../boot/extlinux/extlinux.conf               |  6 ---
 configs/riotboard_defconfig                   | 28 --------------
 6 files changed, 94 deletions(-)
 delete mode 100644 board/embest/riotboard/genimage.cfg
 delete mode 100644 board/embest/riotboard/readme.txt
 delete mode 100644 board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
 delete mode 100644 configs/riotboard_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 9f0db52969..35854db7ce 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -167,7 +167,6 @@ configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
-configs/riotboard_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
 configs/rock_pi_n8_defconfig lib_defconfig.ForceCheckHash
 configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index d2f36e5465..6b95ff365a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2559,10 +2559,6 @@ F:	package/ofono/
 N:	Niklas Cassel <niklas.cassel@wdc.com>
 F:	configs/qemu_riscv64_nommu_virt_defconfig
 
-N:	Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
-F:	board/embest/riotboard/
-F:	configs/riotboard_defconfig
-
 N:	Nimai Mahajan <nimaim@gmail.com>
 F:	package/libucl/
 
diff --git a/board/embest/riotboard/genimage.cfg b/board/embest/riotboard/genimage.cfg
deleted file mode 100644
index d2e851a78d..0000000000
--- a/board/embest/riotboard/genimage.cfg
+++ /dev/null
@@ -1,17 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.imx"
-		offset = 1K
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-		offset = 1M
-		size = 60M
-	}
-}
diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
deleted file mode 100644
index 4ba836fa5a..0000000000
--- a/board/embest/riotboard/readme.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Buildroot for Embest RIoTboard
-==============================
-
-This is a small development board, based on Freescale IMX6 Solo SoC
-(single core ARM Cortex-A9).
-
-More details about the board can be found at:
-
-  http://www.embest-tech.com/riotboard
-
-1. Compiling buildroot
-----------------------
-
-$ make riotboard_defconfig
-$ make
-
-2. Installing buildroot
------------------------
-
-Prepare an SD-card and plug it into your card reader. Always double
-check the block device before writing to it, as writing to the wrong
-block device can cause irrecoverable data loss. Now you can write the
-image to your SD-card:
-
-sudo dd if=output/images/sdcard.img of=/dev/<sdcard-block-device> bs=1M
-
-3. Running buildroot
---------------------
-
-Position the board so you can read the label "RIoTboard" on the right
-side of SW1 DIP switches. Configure the SW1 swiches like this:
-
-1   0  1   0   0  1   0  1
-ON OFF ON OFF OFF ON OFF ON
-
-Now plug your prepared SD-card in slot J6. Connect a serial console
-(115200, 8, N, 1) to header J18. Connect a 5V/1A power supply to the
-board and enjoy.
diff --git a/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf b/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
deleted file mode 100644
index 23e48a0da7..0000000000
--- a/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
+++ /dev/null
@@ -1,6 +0,0 @@
-default buildroot
-
-label buildroot
-kernel /boot/zImage
-devicetree /boot/imx6dl-riotboard.dtb
-append console=ttymxc1,115200 root=/dev/mmcblk1p1 rw
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
deleted file mode 100644
index 709b54ff06..0000000000
--- a/configs/riotboard_defconfig
+++ /dev/null
@@ -1,28 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/embest/riotboard/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="riotboard"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
