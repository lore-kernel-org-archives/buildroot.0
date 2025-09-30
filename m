Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE16CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDEED615DA;
	Wed,  1 Oct 2025 21:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3nCJUhTYsRq; Wed,  1 Oct 2025 21:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1914B615A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1914B615A6;
	Wed,  1 Oct 2025 21:00:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A05572
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89A5C41241
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTOUnaCD4sr0 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A660D4123B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A660D4123B
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A368B81763; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:33:22 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 0e7927c8fd8e3ca02bcb5d2c91847a1229fccc42
X-Git-Newrev: da33bc0e7b37197809b2316878692ccca524fab9
X-Patchwork-Hint: ignore
Message-Id: <20251001210011.A368B81763@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] configs/atmel_sama5d3xek:
 remove defconfig, broken
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

commit: https://git.buildroot.net/buildroot/commit/?id=da33bc0e7b37197809b2316878692ccca524fab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167647

It is still based on the 4.9 kernel, which was LTS but is no longer
maintained.

There is no DEVELOPERS entry attached to this configuration as well,
and this defconfig has been broken for at least 2 months, probably
more (our Gitlab CI history is only kept for ~2 months). So let's drop
it, unles someone volunteers to resurrect it.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8e9e4feae1c17d8f34d12953cb4583a77086e3de)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                |  1 -
 configs/atmel_sama5d3xek_defconfig | 26 --------------------------
 2 files changed, 27 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 89969e4326..f55499e7cd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -96,7 +96,6 @@ configs/atmel_sama5d3_xplained_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d3_xplained_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d3_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
-configs/atmel_sama5d3xek_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d4_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
deleted file mode 100644
index 2fcd7e002b..0000000000
--- a/configs/atmel_sama5d3xek_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_cortex_a5=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="sama5"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d33ek sama5d34ek sama5d35ek sama5d36ek"
-BR2_TARGET_ROOTFS_UBI=y
-BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
-BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam_5.8)/u-boot-at91-linux4sam_5.8.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3xek_nandflash"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_PACKAGE_HOST_SAM_BA=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
