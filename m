Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591BCC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC0F683E46;
	Sat,  6 Aug 2022 21:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC0F683E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-MoDzWBjcIK; Sat,  6 Aug 2022 21:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0625581A95;
	Sat,  6 Aug 2022 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0625581A95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B3631BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B95583E41
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B95583E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_kjuimgeSHU for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A789081A95
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A789081A95
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E390486E50; Sat,  6 Aug 2022 21:09:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 23:23:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72a009fa98a37825624f70dc2a1cf825a5999a0a
X-Git-Newrev: c0a44ba0dfbf4767a48f3c63cece57a707e8d678
X-Patchwork-Hint: ignore
Message-Id: <20220806210958.E390486E50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_neo: drop
 defconfig
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4324901376076152186=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4324901376076152186==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c0a44ba0dfbf4767a48f3c63cece57a707e8d678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nanopi-neo no longer builds, as uboot needs python2 on the host:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053540

I no longer have access to that board, so I can't test an update to
either uboot or the kernel anymore.

Drop the board.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  2 --
 board/friendlyarm/nanopi-neo/boot.cmd     |  8 ------
 board/friendlyarm/nanopi-neo/genimage.cfg | 34 ------------------------
 board/friendlyarm/nanopi-neo/readme.txt   | 42 ------------------------------
 configs/friendlyarm_nanopi_neo_defconfig  | 43 -------------------------------
 5 files changed, 129 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac000f1ba1..18f4d1f0e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3038,8 +3038,6 @@ F:	package/gloox/
 F:	package/tpm2-pkcs11/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
-F:	board/friendlyarm/nanopi-neo/
-F:	configs/friendlyarm_nanopi_neo_defconfig
 F:	fs/squashfs/
 F:	package/asterisk/
 F:	package/cegui/
diff --git a/board/friendlyarm/nanopi-neo/boot.cmd b/board/friendlyarm/nanopi-neo/boot.cmd
deleted file mode 100644
index 7874057859..0000000000
--- a/board/friendlyarm/nanopi-neo/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-neo.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
deleted file mode 100644
index 92af667552..0000000000
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-nanopi-neo.dtb",
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
-	}
-}
diff --git a/board/friendlyarm/nanopi-neo/readme.txt b/board/friendlyarm/nanopi-neo/readme.txt
deleted file mode 100644
index 84fb9cc484..0000000000
--- a/board/friendlyarm/nanopi-neo/readme.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Intro
-=====
-
-The instructions herein are valid for the FriendlyARM NanoPi NEO,
-both the 256MiB and 512MiB versions. They should also work for the
-NanoPi NEO Air, but this is untested so far.
-
-The FriendlyARM Nanopi NEO is a 4x4cm² board with an Allwiner H3 SoC:
-  - quad-core Cortex-A7 @1.2GHz
-  - 256 or 512MiB of DDR
-  - uSDCard as only storage option
-  - 3x USB 2.0 host (one socket, two on expansion pin-holes)
-  - 1x USB 2.0 OTG (also used as power source)
-  - 10/100 ethernet MAC
-  - GPIOs, SPI, I2c...
-
-Support for the Nanopi NEO in U-Boot and Linux is very recent, so only
-core, basic features are available.
-
-Unfortunately, support for the ethernet MAC and the USB OTG are not
-yet upstream, but are being actively worked on.
-
-
-How to build
-============
-
-    $ make friendlyarm_nanopi_neo_defconfig
-    $ make
-
-Note: you will need access to the internet to download the required
-sources.
-
-You will then obtain an image ready to be written to your micro SDcard:
-
-    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
-
-Notes:
-  - replace 'sdX' with the actual device with your micro SDcard,
-  - you may need to be root to do that (use 'sudo').
-
-Insert the micro SDcard in your NanoPi NEO and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
deleted file mode 100644
index 1519d828d6..0000000000
--- a/configs/friendlyarm_nanopi_neo_defconfig
+++ /dev/null
@@ -1,43 +0,0 @@
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
-
-BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
-
-# Linux headers same as kernel, a 5.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
-
-# Use a -rc kernel to get the DTS
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.13"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
-
-# Use an -rc tag because the defconfig is very recent
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo/boot.cmd"
-
-# Build an sdcard image
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Additional tools
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y

--===============4324901376076152186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4324901376076152186==--
