Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D92CF9C69
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB1E4086C;
	Sat, 21 Sep 2024 18:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvrL1KsLkIHD; Sat, 21 Sep 2024 18:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E575412F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E575412F7;
	Sat, 21 Sep 2024 18:49:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7E171BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B824940320
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOjUAWYieo8w for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B5534032C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B5534032C
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67E2B83D99; Sat, 21 Sep 2024 18:48:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:39:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a52fd38060f092edbb7f558217770e136899d19f
X-Git-Newrev: 0fa6bd5a964e8b8cd9d3728b0bb72d088d380a71
X-Patchwork-Hint: ignore
Message-Id: <20240921184813.67E2B83D99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2/Config.in: fix 'targeting' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fa6bd5a964e8b8cd9d3728b0bb72d088d380a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/Config.in | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7c235e96f7..e1f2fc105e 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -53,7 +53,7 @@ config BR2_TARGET_GRUB2_I386_PC
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 	help
-	  Select this option if the platform you're targetting is a
+	  Select this option if the platform you're targeting is a
 	  x86 or x86-64 legacy BIOS based platform.
 
 config BR2_TARGET_GRUB2_I386_EFI
@@ -62,7 +62,7 @@ config BR2_TARGET_GRUB2_I386_EFI
 	select BR2_TARGET_GRUB2_HAS_PTF
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting has a
+	  Select this option if the platform you're targeting has a
 	  32 bits EFI BIOS. Note that some x86-64 platforms use a 32
 	  bits EFI BIOS, and this option should be used in this case.
 
@@ -72,7 +72,7 @@ config BR2_TARGET_GRUB2_X86_64_EFI
 	select BR2_TARGET_GRUB2_HAS_PTF
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting has a
+	  Select this option if the platform you're targeting has a
 	  64 bits EFI BIOS.
 
 config BR2_TARGET_GRUB2_ARM_UBOOT
@@ -80,7 +80,7 @@ config BR2_TARGET_GRUB2_ARM_UBOOT
 	depends on BR2_arm
 	select BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 	help
-	  Select this option if the platform you're targetting is an
+	  Select this option if the platform you're targeting is an
 	  ARM u-boot platform, and you want to boot Grub 2 as an u-boot
 	  compatible image.
 
@@ -90,7 +90,7 @@ config BR2_TARGET_GRUB2_ARM_EFI
 	select BR2_TARGET_GRUB2_HAS_PTF
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting is an
+	  Select this option if the platform you're targeting is an
 	  ARM platform and you want to boot Grub 2 as an EFI
 	  application.
 
@@ -99,7 +99,7 @@ config BR2_TARGET_GRUB2_ARM64_EFI
 	depends on BR2_aarch64
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting is an
+	  Select this option if the platform you're targeting is an
 	  Aarch64 platform and you want to boot Grub 2 as an EFI
 	  application.
 
@@ -108,7 +108,7 @@ config BR2_TARGET_GRUB2_RISCV64_EFI
 	depends on BR2_RISCV_64
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting is a
+	  Select this option if the platform you're targeting is a
 	  64bit RISC-V platform and you want to boot Grub 2 as an EFI
 	  application.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
