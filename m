Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796B9CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506094047E;
	Thu,  4 Sep 2025 16:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSXd2PQj_key; Thu,  4 Sep 2025 16:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 409AF40472
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 409AF40472;
	Thu,  4 Sep 2025 16:14:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB0F106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3D5380771
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LXzpV-C64pr for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7608E8077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7608E8077F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7429987F0E; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fd7720562bb6b32bd0f039ad28ca3b933fa4d961
X-Git-Newrev: 26cfbf7f7dd94a31153b615801b8a4fe1d118ce5
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.7429987F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/socrates_cyclone5: remove defconfig, broken
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
Content-Type: multipart/mixed; boundary="===============6867853911192997564=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6867853911192997564==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=26cfbf7f7dd94a31153b615801b8a4fe1d118ce5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026772887

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dsocrates_cyclone5&kind=BUILD

It uses the outdated and not even LTS 4.16.7 Linux kernel, which no
longer builds with modern toolchains.

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026772887

Cc: Michał Łyszczek <michal.lyszczek@bofc.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 908ce5b8bb1d61c9e1e18ea9bc153ada3fd07dd1)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                         |  1 -
 DEVELOPERS                                  |  2 -
 board/altera/socrates_cyclone5/boot-env.txt |  8 ----
 board/altera/socrates_cyclone5/genimage.cfg | 59 -----------------------------
 board/altera/socrates_cyclone5/readme.txt   | 52 -------------------------
 configs/socrates_cyclone5_defconfig         | 32 ----------------
 6 files changed, 154 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6b87803dca..a09c8d45f9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -198,7 +198,6 @@ configs/snps_arc700_nsim_defconfig lib_defconfig.ForceCheckHash
 configs/snps_archs38_axs103_defconfig lib_defconfig.ForceCheckHash
 configs/snps_archs38_haps_defconfig lib_defconfig.ForceCheckHash
 configs/snps_archs38_hsdk_defconfig lib_defconfig.ForceCheckHash
-configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 3c687d590e..43d00ad3fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2403,8 +2403,6 @@ F:	package/libavl/
 F:	package/rcw-smarc-sal28/
 
 N:	Michał Łyszczek <michal.lyszczek@bofc.pl>
-F:	board/altera/socrates_cyclone5/
-F:	configs/socrates_cyclone5_defconfig
 F:	package/netifrc/
 F:	package/openrc/
 F:	package/skeleton-init-openrc/
diff --git a/board/altera/socrates_cyclone5/boot-env.txt b/board/altera/socrates_cyclone5/boot-env.txt
deleted file mode 100644
index ed5b61386c..0000000000
--- a/board/altera/socrates_cyclone5/boot-env.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-linux_load_address=0x100000
-linux_dtb_load_address=0x100
-linux_dtb=socfpga_cyclone5_socrates.dtb
-linux_load=mmc rescan; fatload mmc 0:1 ${linux_load_address} zImage; fatload mmc 0:1 ${linux_dtb_load_address} ${linux_dtb}
-bootargs=console=ttyS0,115200 root=/dev/mmcblk0p3 ro rootwait
-source_env=fatload mmc 0:1 0x2000000 boot.scr; source 0x2000000
-bootcmd=run linux_load; bootz ${linux_load_address} - ${linux_dtb_load_address}
-bootdelay=1
diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
deleted file mode 100644
index d31c3838be..0000000000
--- a/board/altera/socrates_cyclone5/genimage.cfg
+++ /dev/null
@@ -1,59 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"socfpga_cyclone5_socrates.dtb"
-		}
-	}
-
-	size = 8M
-}
-
-image uboot.img {
-	hdimage {
-		partition-table = "no"
-	}
-
-	partition spl {
-		in-partition-table = "no"
-		image = "u-boot-spl.bin.crc"
-		offset = 0
-		size = 64K
-	}
-
-	partition uboot-full {
-		in-partition-table = "no"
-		image = "u-boot.img"
-		offset = 256K
-	}
-
-	size = 1M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition uboot-env {
-		in-partition-table = "no"
-		image = "uboot-env.bin"
-		offset = 17K # 512 * 34 -> just after gpt
-	}
-
-	partition boot {
-		partition-type = 0xc
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition uboot {
-		partition-type = 0xa2
-		image = "uboot.img"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-		size = 500M
-	}
-}
diff --git a/board/altera/socrates_cyclone5/readme.txt b/board/altera/socrates_cyclone5/readme.txt
deleted file mode 100644
index 4e78feef11..0000000000
--- a/board/altera/socrates_cyclone5/readme.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-EBV SoCrates Evaluation Board
-
-Intro
-=====
-
-More information about this board can be found here:
-https://rocketboards.org/foswiki/Documentation/EBVSoCratesEvaluationBoard
-
-Build
-=====
-
-First, load socrates config for buildroot
-
-    make socrates_cyclone5_defconfig
-
-Build everything
-
-    make
-
-Following files will be generated in output/images
-
-.
-├── boot.vfat
-├── rootfs.ext2
-├── rootfs.ext4 -> rootfs.ext2
-├── rootfs.tar
-├── sdcard.img
-├── socfpga_cyclone5_socrates.dtb
-├── u-boot-spl.bin
-├── u-boot-spl.bin.crc
-├── u-boot.bin
-├── u-boot.img
-├── uboot-env.bin
-├── uboot.img
-└── zImage
-
-
-Creating bootable SD card
-=========================
-
-Simply invoke
-
-dd if=output/images/sdcard.img of=/dev/sdX
-
-Where X is your SD card device (not partition)
-
-Booting
-=======
-
-Pins 6:8 on P18 selector is used to determine boot device. To boot socrates from
-sdcard set these pins to value 0x5 (101b). Remaining pins are used to determine
-how to configure FPGA and are not associated with booting into Linux kernel.
diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
deleted file mode 100644
index d23e08a255..0000000000
--- a/configs/socrates_cyclone5_defconfig
+++ /dev/null
@@ -1,32 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_NEON=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/altera/socrates_cyclone5/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
-BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socrates"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_socrates"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
-BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="8192"

--===============6867853911192997564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6867853911192997564==--
