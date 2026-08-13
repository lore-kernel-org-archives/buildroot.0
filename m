Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47A1C5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DF381288;
	Fri, 14 Aug 2026 13:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SiVMMNZ4rqR; Fri, 14 Aug 2026 13:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB2B812AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713598;
	bh=5S3IILoPyZ/F9xpYpptLRrbXLAf7HWXxuMB82IPaW/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kMR0xoEMMgUhCie22JEE4McVetIl5RDd0XyBTP7DxOLewpFl/SqLF35zlImxonwy5
	 D1T312crIrP1/SvViNNzJsTiAlfFBVqM1rdieJLljovQNq1e8W63z0Iyvk8nujveqy
	 Kj6x6HGZ0bbL97YCEAp645BmBArSF3YpJz4MNB7SfPYmbiNLA2/eubYy7+Rcd3xTUK
	 TIKE4AjY2MYMmdolKJZaQWmruL0W5mpOopGtJ8kJ66vUxFqNxtivu3PyN437YZ7eSV
	 LAKlXVgLS3xJIGt/dBRDHoEJPbQCcWWF6olg8vOuVfJF7IgOq+LCdyiYRF5poFuk3h
	 N13GfRRn/KSZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB2B812AC;
	Fri, 14 Aug 2026 13:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBCF233B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D1F811B3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4wPWxq393Y1 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAB2E80E3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAB2E80E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF4B28D667; Fri, 14 Aug 2026 13:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 10:27:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5b64eb831dd80a95791bed47e7ad5e6b2c9da853
X-Git-Newrev: 46aa6a905e1810b3436d7d581e87fffa630a4532
X-Patchwork-Hint: ignore
Message-Id: <20260814131855.CF4B28D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/acmesystems_arietta_g25_{128mb, 256mb}_defconfig: remove defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46aa6a905e1810b3436d7d581e87fffa630a4532
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This configuration for the acmesystems arietta g25 were added back in
February 2016 (commit e173aeece51852d652c557546d9944ee42c91e4f), and has
not been updated in any significant way since 2019 (the last major
kernel update [1]).

This defconfig still use a 4.19 kernel that is no longer maintained.

Remove its support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913803 (acmesystems_arietta_g25_256mb_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913802 (acmesystems_arietta_g25_128mb_defconfig)

[1] 42ea31c114f32a100923e51cb2b6b6d67c38ca3f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c8bf258e5bcc268eaab6fa9731a230b20fabd9aa)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 board/acmesystems/arietta-g25/genimage.cfg         | 36 ----------------
 .../patches/at91bootstrap3/at91bootstrap3.hash     |  2 -
 .../patches/linux-headers/linux-headers.hash       |  1 -
 .../arietta-g25/patches/linux/linux.hash           |  2 -
 board/acmesystems/arietta-g25/readme.txt           | 49 ----------------------
 configs/acmesystems_arietta_g25_128mb_defconfig    | 26 ------------
 configs/acmesystems_arietta_g25_256mb_defconfig    | 26 ------------
 7 files changed, 142 deletions(-)

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
deleted file mode 100644
index 3b67a474cd..0000000000
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the Acmesystems Arietta G25
-
-image boot.vfat {
-	vfat {
-		file zImage {
-			image = "zImage"
-		}
-
-		file acme-arietta.dtb {
-			image = "at91-ariettag25.dtb"
-		}
-
-		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3.bin"
-		}
-	}
-
-	size = 16M
-}
-
-image sdcard.img {
-	hdimage {
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
diff --git a/board/acmesystems/arietta-g25/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/arietta-g25/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/acmesystems/arietta-g25/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/acmesystems/arietta-g25/patches/linux-headers/linux-headers.hash b/board/acmesystems/arietta-g25/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/acmesystems/arietta-g25/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/acmesystems/arietta-g25/patches/linux/linux.hash b/board/acmesystems/arietta-g25/patches/linux/linux.hash
deleted file mode 100644
index 81824a41ee..0000000000
--- a/board/acmesystems/arietta-g25/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
deleted file mode 100644
index f356b0a264..0000000000
--- a/board/acmesystems/arietta-g25/readme.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Acme Systems Arietta G25
-
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Arietta G25. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-You can find additional informations, tutorials and a very comprehensive
-documentation on http://www.acmesystems.it/arietta.
-
-Build instructions
-==================
-
-To build an image for the Arietta G25 choose the configuration
-corresponding to the Arietta variant.
-
-For 128MB RAM variant type:
-
-$ make acmesystems_arietta_g25_128mb_defconfig
-
-else for 256MB RAM variant type:
-
-$ make acmesystems_arietta_g25_256mb_defconfig
-
-To customize the configuration chosen type:
-
-$ make menuconfig
-
-When you are ready to start building Buildroot type:
-
-$ make
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
-
-Insert the microSD card into the Arietta slot and power it.
-
-The image just built is fairly basic and the only output
-you will get is on serial console, please consider to use a DPI
-cable (http://www.acmesystems.it/DPI)
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
deleted file mode 100644
index 788818c118..0000000000
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/arietta-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
deleted file mode 100644
index c483ae4c57..0000000000
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/arietta-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
