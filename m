Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E261C3DA4B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB975407AC;
	Sat, 13 Jul 2024 14:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FrpEiQIs5WB; Sat, 13 Jul 2024 14:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BEA94134B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BEA94134B;
	Sat, 13 Jul 2024 14:53:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 293001BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFACA606A7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ss9n5QKxrGAf for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD02C606E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD02C606E3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB33081809; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:52:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35604d58d76870926f4b1cd8f05386817cdca6e6
X-Git-Newrev: eba5339c12a0a6b452759f9e3acdc6ea11c271dd
X-Patchwork-Hint: ignore
Message-Id: <20240713145315.CB33081809@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/beaglev-secondboot: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eba5339c12a0a6b452759f9e3acdc6ea11c271dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The beaglev-secondboot was meant for the BeagleV-Starlight
board (beaglev_defconfig) but the support was removed.

Remove beaglev-secondboot too.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                |  7 +++++++
 DEVELOPERS                                      |  1 -
 boot/Config.in                                  |  1 -
 boot/beaglev-secondboot/Config.in               |  9 --------
 boot/beaglev-secondboot/beaglev-secondboot.hash |  3 ---
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 28 -------------------------
 6 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 78dcabed63..28cfce3ce1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_TARGET_BEAGLEV_SECONDBOOT
+	bool "beaglev-secondboot has been removed"
+	select BR2_LEGACY
+	help
+	  The beaglev-secondboot package has been removed after
+	  the beaglev_defconfig removal.
+
 config BR2_PACKAGE_ONEVPL_INTEL_GPU
 	bool "onevpl-intel-gpu has been renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 7477a871dc..9bfca9e0d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3069,7 +3069,6 @@ N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/stmicroelectronics/stm32mp157c-dk2/
 F:	boot/beaglev-ddrinit/
-F:	boot/beaglev-secondboot/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	configs/stm32mp157c_dk2_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 25a50265d2..8f504fee34 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -5,7 +5,6 @@ source "boot/at91bootstrap3/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
 source "boot/beaglev-ddrinit/Config.in"
-source "boot/beaglev-secondboot/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/edk2/Config.in"
diff --git a/boot/beaglev-secondboot/Config.in b/boot/beaglev-secondboot/Config.in
deleted file mode 100644
index a9695fc138..0000000000
--- a/boot/beaglev-secondboot/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_TARGET_BEAGLEV_SECONDBOOT
-	bool "beaglev-secondboot"
-	depends on BR2_riscv
-	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
-	help
-	  This package builds the SecondBoot firmware used on the
-	  BeagleV platform.
-
-	  https://github.com/starfive-tech/beagle_secondBoot
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
deleted file mode 100644
index d35d3a3856..0000000000
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  bf152500e9f7e467bb1dee95a2291f9ecfaaebe1d64b93f6d403cfaf50e540e0  beaglev-secondboot-e17302063c9a4b74475b18ff24dd149c27257354.tar.gz
-sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
deleted file mode 100644
index 7e5f5681f4..0000000000
--- a/boot/beaglev-secondboot/beaglev-secondboot.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# beaglev-secondboot
-#
-################################################################################
-
-# Commit on the 'starfive' branch
-BEAGLEV_SECONDBOOT_VERSION = e17302063c9a4b74475b18ff24dd149c27257354
-BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
-BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
-BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
-BEAGLEV_SECONDBOOT_DEPENDENCIES = host-riscv64-elf-toolchain
-BEAGLEV_SECONDBOOT_LICENSE = GPL-2.0+
-BEAGLEV_SECONDBOOT_LICENSE_FILES = LICENSE
-
-define BEAGLEV_SECONDBOOT_BUILD_CMDS
-	$(MAKE) -C $(@D)/build \
-		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
-		SUFFIX=buildroot \
-		GIT_VERSION=$(BEAGLEV_SECONDBOOT_VERSION)
-endef
-
-define BEAGLEV_SECONDBOOT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-JH7100-buildroot.bin.out \
-		$(BINARIES_DIR)/bootloader-JH7100-buildroot.bin.out
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
