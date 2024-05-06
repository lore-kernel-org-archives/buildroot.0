Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA6FC25B74
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB2060818;
	Mon,  6 May 2024 10:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H70L1rRbTk3b; Mon,  6 May 2024 10:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BEE66085A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BEE66085A;
	Mon,  6 May 2024 10:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CAB01BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3914860819
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glc2v6z0JTKR for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DEC560810
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DEC560810
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:51:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AF828671A; Mon,  6 May 2024 10:51:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 12:49:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66ebbebdb4dc7bc56339e0a1f1cb8d2e8e30c2f2
X-Git-Newrev: e4d07f8d816c864421b9f33ccaf2922cbd5d5a12
X-Patchwork-Hint: ignore
Message-Id: <20240506105145.4AF828671A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: remove
 BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4d07f8d816c864421b9f33ccaf2922cbd5d5a12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Arnout during the review [1], we can assume that U-Boot
needs ti-k3-boot-firmware when it is selected (likely by
ti-k3-r5-loader).

We can remove BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE without
legacy handling since this option is not part of any Buildroot
release.

[1] http://lists.busybox.net/pipermail/buildroot/2024-April/689263.html

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy              |  3 +--
 boot/uboot/Config.in          | 11 -----------
 boot/uboot/uboot.mk           |  6 +++++-
 configs/ti_am62x_sk_defconfig |  1 -
 configs/ti_am64x_sk_defconfig |  1 -
 5 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 98a4125f4b..599f67b7f8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -161,9 +161,8 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
 	  U-Boot binman tool (requires U-boot >= 2023.10).
 
 config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-	bool "u-boot TI K3 DM option has been renamed."
+	bool "u-boot TI K3 DM option has been removed."
 	select BR2_LEGACY
-	select BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
 	help
 	  The TI K3 Device Manager is already included in
 	  ti-k3-boot-firmware.
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8d2228dc7d..8133b780bb 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -240,17 +240,6 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
 
-config BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
-	bool "U-Boot needs ti-k3-boot-firmware"
-	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	help
-	  TI K3 devices needs at least ti-sysfw (System Firmware) when
-	  built with u-boot's binman tool.
-
-	  Some TI K3 devices using a split firmware boot flow (AM62,
-	  j721e) also need the Device Manager (DM) firmware to be
-	  available for the U-Boot build.
-
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0ee63cabdb..b9f165f041 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,7 +194,11 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE),y)
+# TI K3 devices needs at least ti-sysfw (System Firmware) provided
+# by ti-k3-boot-firmware when built with u-boot's binman tool.
+# Some TI K3 devices using a split firmware boot flow (AM62,
+# j721e) also need the Device Manager (DM) firmware.
+ifeq ($(BR2_TARGET_TI_K3_BOOT_FIRMWARE),y)
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
 endif
 
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 4050168184..84a409fc3b 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -37,7 +37,6 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 28e97f94e2..8dbe0fae33 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -37,7 +37,6 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
