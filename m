Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38D3C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 706B74152D;
	Sat, 13 Jul 2024 14:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZfRsfLhXzgV; Sat, 13 Jul 2024 14:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F8AE4134B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F8AE4134B;
	Sat, 13 Jul 2024 14:53:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 393601BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0C3C60759
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PNQPQjzI61C for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BB160753
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3BB160753
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E09128650A; Sat, 13 Jul 2024 14:53:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:53:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eba5339c12a0a6b452759f9e3acdc6ea11c271dd
X-Git-Newrev: a226f9a9ca44b88faa8e6504bb1336724ab79827
X-Patchwork-Hint: ignore
Message-Id: <20240713145315.E09128650A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/beaglev-ddrinit: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a226f9a9ca44b88faa8e6504bb1336724ab79827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The beaglev-ddrinit was meant for the BeagleV-Starlight
board (beaglev_defconfig) but the support was removed.

Remove beaglev-ddrinit too.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                          |  7 +++++++
 DEVELOPERS                                |  1 -
 boot/Config.in                            |  1 -
 boot/beaglev-ddrinit/Config.in            |  9 ---------
 boot/beaglev-ddrinit/beaglev-ddrinit.hash |  3 ---
 boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 28 ----------------------------
 6 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 28cfce3ce1..36efcfb7af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_TARGET_BEAGLEV_DDRINIT
+	bool "beaglev-ddrinit has been removed"
+	select BR2_LEGACY
+	help
+	  The beaglev-secondboot package has been removed after
+	  the beaglev_defconfig removal.
+
 config BR2_TARGET_BEAGLEV_SECONDBOOT
 	bool "beaglev-secondboot has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9bfca9e0d8..fe3247273e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3068,7 +3068,6 @@ F:	package/go/
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/stmicroelectronics/stm32mp157c-dk2/
-F:	boot/beaglev-ddrinit/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	configs/stm32mp157c_dk2_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 8f504fee34..5c8d0e7ee5 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -4,7 +4,6 @@ source "boot/afboot-stm32/Config.in"
 source "boot/at91bootstrap3/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
-source "boot/beaglev-ddrinit/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/edk2/Config.in"
diff --git a/boot/beaglev-ddrinit/Config.in b/boot/beaglev-ddrinit/Config.in
deleted file mode 100644
index 7ca92a7b9b..0000000000
--- a/boot/beaglev-ddrinit/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_TARGET_BEAGLEV_DDRINIT
-	bool "beaglev-ddrinit"
-	depends on BR2_riscv
-	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
-	help
-	  This package builds the DDRinit firmware used on the BeagleV
-	  platform.
-
-	  https://github.com/starfive-tech/beagle_ddrinit
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
deleted file mode 100644
index d4235904d1..0000000000
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  08a49355f89fc2cb4f5101183339c9c6f86b722545d0abbc319aab26a511dad7  beaglev-ddrinit-8d6318acfe71e790c983b34448c9abfcfcec3ed8.tar.gz
-sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
deleted file mode 100644
index d9707de610..0000000000
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# beaglev-ddrinit
-#
-################################################################################
-
-# Commit on the 'starfive' branch
-BEAGLEV_DDRINIT_VERSION = 8d6318acfe71e790c983b34448c9abfcfcec3ed8
-BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
-BEAGLEV_DDRINIT_INSTALL_TARGET = NO
-BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
-BEAGLEV_DDRINIT_DEPENDENCIES = host-riscv64-elf-toolchain
-BEAGLEV_DDRINIT_LICENSE = GPL-2.0+
-BEAGLEV_DDRINIT_LICENSE_FILES = LICENSE
-
-define BEAGLEV_DDRINIT_BUILD_CMDS
-	$(MAKE) -C $(@D)/build \
-		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
-		SUFFIX=buildroot \
-		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
-endef
-
-define BEAGLEV_DDRINIT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/build/ddrinit-2133-buildroot.bin.out \
-		$(BINARIES_DIR)/ddrinit-2133-buildroot.bin.out
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
