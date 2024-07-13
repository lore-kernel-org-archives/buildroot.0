Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4E4C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA48C613E2;
	Sat, 13 Jul 2024 09:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yg66iEmkrEjR; Sat, 13 Jul 2024 09:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DBDD6140F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DBDD6140F;
	Sat, 13 Jul 2024 09:37:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEAE1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3800C610FB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsbvzrPs9oYm for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88F7160711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F7160711
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88F7160711
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c79so3923523e87.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863468; x=1721468268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1G0r7i9MD1wvZ1nv1Xf79JBpFUJRuZtWnJh74IKKj0A=;
 b=V9yh+wMHcHM5aZRbJ1YAiqM2cS39OlqE0RwFlUq68hLqAzL1EpI3ixRG/GeC384/Em
 vBF0SAQOr3w1g8n4K4VWzj+Ulfi+F3Tp3FQMJ4Jc5zjmo3Oj4hxZ4CYNZrdfSk0iJ2sl
 DIEVcYyUGMqpaC1h1SorgvO0aDVLssvBsvzP+VuQ6wGUvBb66CcWc0BHBdZTV326wx6R
 POMkNgj1XGjq7XVWelU+C91/XDDStMzkJMwa6fgZzcsQo3X1VLSLeQzARA1Ji5mLut3M
 7uj34IqCf6og7i0uGwtIroxi+dTYQN2hi4xxKUFIYApOA19+hC8aX11FFpPkSndgkcvK
 jzfw==
X-Gm-Message-State: AOJu0Yxlbr7UD/JMfvhSbZKIylwAUvXe+uxjAcDuLpy/UPBiC8msfj1Z
 e5hjd1a4dyNmX9GbmtrUNF5w7zt64RLa6tKx7vhKVJAWdBflLKPgxWEK7DcBgX16cQN9w3sH+ps
 iik4=
X-Google-Smtp-Source: AGHT+IF116d+yXOdtjwB+puDvW6541gOpWxtKuyKzxy0SWoTAUFe128E8CzScgrBlFuTIDR9kJ+xmw==
X-Received: by 2002:a05:6512:2038:b0:52e:9f6c:9b06 with SMTP id
 2adb3069b0e04-52eb99d6ca1mr6971599e87.60.1720863467781; 
 Sat, 13 Jul 2024 02:37:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db03900sm941349f8f.92.2024.07.13.02.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:37:44 +0200
Message-ID: <20240713093744.2089572-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863468; x=1721468268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1G0r7i9MD1wvZ1nv1Xf79JBpFUJRuZtWnJh74IKKj0A=;
 b=ETpt3dr/3ZE+FDcx1AZ8GCAPQNQlKOXk22ZMSn4hlh7uwp6U6ktJLTv/g7ZqkiJWi6
 yXPIfrpEO1rLIl0+Ka404eZle0h4DjB5Ofu8BFRkxo4RVvOfe+q2sQ2n/e2yaKVefvIW
 Xu+E+8lFIzVdOgVMveIv45BIOOuoizf7N9sFE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ETpt3dr/
Subject: [Buildroot] [PATCH] configs/beagleboardx15: remove defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Theo Debrouwere <t.debrouwere@televic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The beagleboardx15 boards files should be moved to
board/beagleboard directory but doing so we noticed that
beagleboardx15_defconfig was failing to build on Buildroot's
Gitlab-Ci [1] due too old BSP (uboot 2016.11 and kernel 4.9)
built with the internal toolchain.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633702

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
---
 .checkpackageignore               |  1 -
 DEVELOPERS                        |  2 --
 board/beagleboardx15/genimage.cfg | 27 -----------------
 board/beagleboardx15/readme.txt   | 49 -------------------------------
 configs/beagleboardx15_defconfig  | 29 ------------------
 5 files changed, 108 deletions(-)
 delete mode 100644 board/beagleboardx15/genimage.cfg
 delete mode 100644 board/beagleboardx15/readme.txt
 delete mode 100644 configs/beagleboardx15_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index ade6c9fd20..3a215eb038 100644
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
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
