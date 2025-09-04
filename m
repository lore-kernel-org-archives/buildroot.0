Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F15FCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6219C60688;
	Thu,  4 Sep 2025 16:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZxIMXgQzyrH; Thu,  4 Sep 2025 16:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3245460634
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3245460634;
	Thu,  4 Sep 2025 16:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C70DB69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DCB66063F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJy8U106HlFp for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABB4060633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABB4060633
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9C5B87F4B; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:04:14 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d7922b199d748d41bc7553f1a4b2c171783400da
X-Git-Newrev: c5b000cf7c379c5f0b527e03b2689a8549ba38d3
X-Patchwork-Hint: ignore
Message-Id: <20250904163334.A9C5B87F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] configs/at91sam9g45m10ek:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5b000cf7c379c5f0b527e03b2689a8549ba38d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272530

It is still based on the 4.8.6 kernel, which is not even an LTS
kernel, so we cannot easily update to fix the issues which are most
likely due to the newer gcc/binutils versions we're using now.

There is no DEVELOPERS entry attached to this configuration as well,
and this defconfig has been broken for at least 2 months, probably
more (our Gitlab CI history is only kept for ~2 months). So let's drop
it, unless someone volunteers to resurrect it.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 5f4e2e61ff716dfc946486bfc3e02020e615600e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                |  1 -
 configs/at91sam9g45m10ek_defconfig | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5a66a8f163..02a758cae1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -109,7 +109,6 @@ configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
deleted file mode 100644
index 7072e5a689..0000000000
--- a/configs/at91sam9g45m10ek_defconfig
+++ /dev/null
@@ -1,21 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9m10g45ek"
-BR2_TARGET_ROOTFS_UBI=y
-BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9m10g45eknf_uboot"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9m10g45ek_nandflash"
-BR2_PACKAGE_HOST_SAM_BA=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
