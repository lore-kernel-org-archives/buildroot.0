Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB19C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D992283BC5;
	Thu, 28 Aug 2025 13:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l91OB1AIQ_vI; Thu, 28 Aug 2025 13:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B53C83BAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B53C83BAB;
	Thu, 28 Aug 2025 13:26:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F0861B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC8060DD2
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwmNpJ7cNKPg for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 177C460DFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 177C460DFA
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14E0287CF9; Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 15:14:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54ac9c6450fc996681227f7100ffd64d66af2f37
X-Git-Newrev: caf055a96c461ca3aa693fd0f7291d151be633ed
X-Patchwork-Hint: ignore
Message-Id: <20250828132628.14E0287CF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/riotboard: remove defconfig, broken
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=caf055a96c461ca3aa693fd0f7291d151be633ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |  1 -
 DEVELOPERS                                         |  4 ---
 board/embest/riotboard/genimage.cfg                | 17 ----------
 board/embest/riotboard/readme.txt                  | 38 ----------------------
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  6 ----
 configs/riotboard_defconfig                        | 28 ----------------
 6 files changed, 94 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ec3b11aa3f..eed9752a04 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -177,7 +177,6 @@ configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
-configs/riotboard_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
 configs/rock_pi_n8_defconfig lib_defconfig.ForceCheckHash
 configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 6bab6502ce..4c1cc01da9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2565,10 +2565,6 @@ F:	package/ofono/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
