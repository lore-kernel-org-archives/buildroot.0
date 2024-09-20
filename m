Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E3CCF9C6B
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 21:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56EEE40513;
	Fri, 20 Sep 2024 21:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBhX_mzoz8Jd; Fri, 20 Sep 2024 21:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD07409E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD07409E4;
	Fri, 20 Sep 2024 21:29:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF1F1BF5A6
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0968D605AF
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 21:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1uW8I-PhsiD for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 21:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16CAA6061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16CAA6061E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16CAA6061E
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 21:28:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46B5760004;
 Fri, 20 Sep 2024 21:28:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srlBL-00HCPt-2e;
 Fri, 20 Sep 2024 23:28:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 23:28:44 +0200
Message-Id: <20240920212848.4099245-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920212848.4099245-1-peter@korsgaard.com>
References: <20240920212848.4099245-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 5/8] boot/grub2/Config.in: fix 'targeting' typo
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
