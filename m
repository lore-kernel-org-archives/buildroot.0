Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D528C55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F3D14076D;
	Tue,  4 Aug 2026 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vJdgExzEB2C; Tue,  4 Aug 2026 20:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1FB4075F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785873688;
	bh=Hh5g2cXlMoe0NQ/syLGZtUWYSQV22nPRRtgrLwwXqWk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sMvQBabuzGmN3Ib1ViBHbFcy6bg+uzsGpfnnxVW+GtAdUATWE5f3k4V7MnsBf1Id6
	 eWAByETHvVxzEmMlITxha3iQqvLwVbjprv5W8vJNgPk8n7li2bzGtuSOMgG8/tSF9P
	 eSl+GwpndDqjNUcmrN4SARLKLfw3+t98eEkBBJEmuuUeaLFaARJ89EoVKHbpDMTwxO
	 LOyZEgIFEBwC/WMCzmrDDze0cyeRvQ1YLhUsKXommx+ahBisysw97iFZbKx/ATdQSl
	 a6TbFK7smSsT82IuyAV+hzRHQ7fryO7iYX2RlNgfgnq+sXXnhXCmnf4FtddgtqXCiU
	 JM9r+scZT/zsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C1FB4075F;
	Tue,  4 Aug 2026 20:01:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74032296
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A9494014F
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJud0FizdZV9 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68B0B400DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68B0B400DB
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:01:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B6E28C582; Tue,  4 Aug 2026 20:00:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 22:00:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1ce687923a12bd7d92e7a1e671ae036676f3478
X-Git-Newrev: 41806d5ed5e11cba57c714167ddeb55cc6eb6891
X-Patchwork-Hint: ignore
Message-Id: <20260804200033.1B6E28C582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_aria_g25_{128mb,
 256mb}_defconfig: remove defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/41806d5ed5e11cba57c714167ddeb55cc6eb6891
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This configuration for the acmesystems aria g25 were added back in July
2015 (commit 2e52be798276fe0c28949f4a16fce0ca20e52153), and has not
been updated in any significant way since 2019 (the last major kernel
update [1]).

This defconfig still use a 4.19 kernel that is no longer maintained.

Remove its support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913801 (acmesystems_aria_g25_256mb_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913800 (acmesystems_aria_g25_128mb_defconfig)

[1] ab10b5b3ee6aa1e19aa6264153eeed9054d4c2e7

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/acmesystems/aria-g25/genimage.cfg            | 36 ------------------
 .../patches/at91bootstrap3/at91bootstrap3.hash     |  2 -
 .../patches/linux-headers/linux-headers.hash       |  1 -
 .../acmesystems/aria-g25/patches/linux/linux.hash  |  2 -
 board/acmesystems/aria-g25/readme.txt              | 44 ----------------------
 configs/acmesystems_aria_g25_128mb_defconfig       | 26 -------------
 configs/acmesystems_aria_g25_256mb_defconfig       | 26 -------------
 7 files changed, 137 deletions(-)

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
deleted file mode 100644
index 29dc697153..0000000000
--- a/board/acmesystems/aria-g25/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the Acmesystems Aria G25
-
-image boot.vfat {
-	vfat {
-		file zImage {
-			image = "zImage"
-		}
-
-		file at91-ariag25.dtb {
-			image = "at91-ariag25.dtb"
-		}
-
-		file boot.bin {
-			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bin"
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
diff --git a/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash b/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/acmesystems/aria-g25/patches/linux/linux.hash b/board/acmesystems/aria-g25/patches/linux/linux.hash
deleted file mode 100644
index 81824a41ee..0000000000
--- a/board/acmesystems/aria-g25/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/board/acmesystems/aria-g25/readme.txt b/board/acmesystems/aria-g25/readme.txt
deleted file mode 100644
index cb9e9abf77..0000000000
--- a/board/acmesystems/aria-g25/readme.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Acme Systems Aria G25
-
-Build instructions
-==================
-
-To build an image for the Aria G25 choose the configuration
-corresponding to the Aria variant.
-
-For 128MB RAM variant type:
-
-$ make acmesystems_aria_g25_128mb_defconfig
-
-else for 256MB RAM variant type:
-
-$ make acmesystems_aria_g25_256mb_defconfig
-
-To customize the configuration choosed type:
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
-Once the build process is finished you will have an image called
-"sdcard.img" in the output/images/ directory.
-
-Write the bootable SD card image "sdcard.img" onto an SD card with
-"dd" command:
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Assuming your Aria G25 baseboard has a MicroSD socket, for example
-with the Terra baseboard, insert the microSD card into the baseboard
-slot and power it.
-
-To get the kernel log messages you can use a DPI cable
-(http://www.acmesystems.it/DPI)
-
-You can find additional informations, tutorials and a very
-comprehensive documentation on http://www.acmesystems.it/aria.
diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
deleted file mode 100644
index 0aff8f92e0..0000000000
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
deleted file mode 100644
index e75ca9cf34..0000000000
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
