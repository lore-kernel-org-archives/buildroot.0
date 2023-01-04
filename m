Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46230C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1AC042AAB;
	Tue, 21 Feb 2023 00:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1AC042AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvKK99ZaFn2W; Tue, 21 Feb 2023 00:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B135A42D19;
	Tue, 21 Feb 2023 00:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B135A42D19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA081BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F183D61AD6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F183D61AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHwEoCvAbSHV for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 309D66F9FC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309D66F9FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E0FF8648F; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:51:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 98613ad592828a3626400f52a1504fe5234fc7f1
X-Git-Newrev: 5424bd0a827ef2a36707b5c12a11251169622160
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.1E0FF8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/amarula_vyasa_rk3288_defconfig: bump to Linux version 6.1.2 and
 U-Boot 2022.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=5424bd0a827ef2a36707b5c12a11251169622160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index ff96019e1e..7976537225 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
