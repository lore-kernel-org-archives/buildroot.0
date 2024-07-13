Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53507C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2012B606C6;
	Sat, 13 Jul 2024 09:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV5Iky4pL5Qz; Sat, 13 Jul 2024 09:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FE4606C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FE4606C9;
	Sat, 13 Jul 2024 09:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97E0D1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8591384146
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uz1uVWWhG7KX for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80F9582085
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80F9582085
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:43:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E14B8640D; Sat, 13 Jul 2024 09:43:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:42:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a0de4d86cd1fbeb5ff0439259b297756b3a5d98
X-Git-Newrev: 7169c9412d11cb0ce22950ae726445018937a65d
X-Patchwork-Hint: ignore
Message-Id: <20240713094305.6E14B8640D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboardx15: remove defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7169c9412d11cb0ce22950ae726445018937a65d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The beagleboardx15 boards files should be moved to
board/beagleboard directory but doing so we noticed that
beagleboardx15_defconfig was failing to build on Buildroot's
Gitlab-Ci [1] due too old BSP (uboot 2016.11 and kernel 4.9)
built with the internal toolchain.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633702

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore               |  1 -
 DEVELOPERS                        |  2 --
 board/beagleboardx15/genimage.cfg | 27 ---------------------
 board/beagleboardx15/readme.txt   | 49 ---------------------------------------
 configs/beagleboardx15_defconfig  | 29 -----------------------
 5 files changed, 108 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6b4412a193..3fea2d9b39 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -142,7 +142,6 @@ configs/bananapi_m2_berry_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_ultra_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/bananapro_defconfig lib_defconfig.ForceCheckHash
-configs/beagleboardx15_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
 configs/beaglev_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 5336f0fe76..b66fda5fcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3029,8 +3029,6 @@ N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
 
 N:	Theo Debrouwere <t.debrouwere@televic.com>
-F:	board/beagleboardx15/
-F:	configs/beagleboardx15_defconfig
 F:	package/pugixml/
 
 N:	Thierry Bultel <tbultel@free.fr>
diff --git a/board/beagleboardx15/genimage.cfg b/board/beagleboardx15/genimage.cfg
deleted file mode 100644
index b1604105cd..0000000000
--- a/board/beagleboardx15/genimage.cfg
+++ /dev/null
@@ -1,27 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"MLO",
-			"u-boot.img"
-		}
-	}
-
-	size = 4M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
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
diff --git a/board/beagleboardx15/readme.txt b/board/beagleboardx15/readme.txt
deleted file mode 100644
index 5af2c914ba..0000000000
--- a/board/beagleboardx15/readme.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-BeagleBoard X15
-
-Intro
-=====
-This config currently supports the beagleboard x15,
-and generates a barebone image.
-
-The image must be flashed to a SD card to be used.
-
-How to build it
-===============
-
-  $ make beagleboardx15_defconfig
-
-Then you can edit the build options using
-
-  $ make menuconfig
-
-Compile all and build a sdcard image:
-
-  $ make
-
-Result of the build
--------------------
-
-After building, you should get a tree like this:
-
-  output/images/
-  +-- am57xx-beagle-x15.dtb
-  +-- am57xx-beagle-x15-revb1.dtb
-  +-- boot.vfat
-  +-- MLO
-  +--rootfs.ext2
-  +-- rootfs.ext4
-  +-- rootfs.tar
-  +-- sdcard.img
-  +-- u-boot.img
-  +-- u-boot-spl.bin
-  +-- zImage
-
-How to write the microSD card
-=============================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
deleted file mode 100644
index 039a07b11e..0000000000
--- a/configs/beagleboardx15_defconfig
+++ /dev/null
@@ -1,29 +0,0 @@
-BR2_arm=y
-BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboardx15/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
-BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am57xx-beagle-x15 am57xx-beagle-x15-revb1"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-# BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="MLO"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
