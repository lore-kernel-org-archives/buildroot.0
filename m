Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF8C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 18:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48AF88329A;
	Fri,  3 Dec 2021 18:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2YAa2ceEL03; Fri,  3 Dec 2021 18:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FBBA82F76;
	Fri,  3 Dec 2021 18:51:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 884451BF3CC
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 835C740182
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fp7yTy1iYyhR for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 18:51:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7271A4013D
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 18:51:16 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id z6so2728884plk.6
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 10:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3k/UyIsjbRjxoTO7rtEvYcluFOX/hKRFn9btyoDuk80=;
 b=fzejmHO2lT3544AHQQLrtZhAU8R6AVHRpSbMspiFcCPR08pSsOuE422jMBHW3E1iC9
 4XSRyAY90gr0BaMrPrOzYybHoaIf3H9SivBnrikMt45+9rZQ1zCrMv7ZTUmTK7bBiHlM
 6MKR1RNySAB/NoTiO1bjLZNiENIVmB9Psb9Ut+tZQlrX1GjLJGdrqxuujEN3zU2GEgmw
 AqjIzDHtjgGT0IpXhPEypQVvHhrfYJ6KD7JPdOgF2TL7udgHLtkWKWez2oGn5ApjLq0M
 MsyPoZF4n2YAAzvdC14X1ZEQzGDS605gM9vXm8VI9yBaEZEF+PxWFVMeFv9X+kJMz0c3
 PwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3k/UyIsjbRjxoTO7rtEvYcluFOX/hKRFn9btyoDuk80=;
 b=iAikiS0qG3pOVghC2dOy6fS5zxoPV9eH65ZL2OU6yiDD2P5gg/NWlRGo4lRGTBQCCH
 EyMW9SYIHr74lpmtTCL6Hk0mkrDWi33SpUeboy2HJFPP3LGuKxieRPFEn/9TrGKmEdj9
 Z1XYiGec4y5dNmTRZyHFcTxL/CgO2SiWYmj07aKXCPxZrXeBEG6yczap+m2wTSC3zoCQ
 u/eDSKJ+Hiz5qEae5eYrSM+hfMGUxwGiB1PSt4IE0XD2WSnORJLTkg7vbl4lnRxkeMik
 eJWM/orWvENl4Cw7A2oe7vPLrzZurEujpdHf99HuItF8GORdQZMhVqTzTOnXfxy4ZHH+
 0IfQ==
X-Gm-Message-State: AOAM532xLX+Atqfp7pUIXxlzomwsTMcXmydg81jzmt2I+r2FHsydsHsQ
 w2Ml2/YjeKh4+I7ychyMquPg7bg3bENCtg==
X-Google-Smtp-Source: ABdhPJx24ywaQfZxAtCvKWOpZId+gCr0Z31QbEZDVI70gC89gR1+j4mSq79PywOegYpg/NwFoGp7Hw==
X-Received: by 2002:a17:90b:4a0e:: with SMTP id
 kk14mr16124080pjb.42.1638557475602; 
 Fri, 03 Dec 2021 10:51:15 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id v15sm4505215pfu.195.2021.12.03.10.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 10:51:14 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 10:51:05 -0800
Message-Id: <20211203185106.1196187-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 1/2] boot/grub2/Config.in: add efi and legacy
 booleans
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add two new booleans to grub2/Config.in:
BR2_TARGET_GRUB_EFI and BR2_TARGET_GRUB_LEGACY.

Each target selects the appropriate bool, which makes it much more simple for
other packages such as mender-grubenv to check if grub legacy or EFI is
selected.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 boot/grub2/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7bbe697932..36a32520a4 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -40,6 +40,7 @@ config BR2_TARGET_GRUB2_HAS_PTF
 config BR2_TARGET_GRUB2_I386_PC
 	bool "i386-pc"
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_TARGET_GRUB_LEGACY
 	help
 	  Select this option if the platform you're targetting is a
 	  x86 or x86-64 legacy BIOS based platform.
@@ -48,6 +49,7 @@ config BR2_TARGET_GRUB2_I386_EFI
 	bool "i386-efi"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_TARGET_GRUB2_HAS_PTF
+	select BR2_TARGET_GRUB_EFI
 	help
 	  Select this option if the platform you're targetting has a
 	  32 bits EFI BIOS. Note that some x86-64 platforms use a 32
@@ -57,6 +59,7 @@ config BR2_TARGET_GRUB2_X86_64_EFI
 	bool "x86-64-efi"
 	depends on BR2_x86_64
 	select BR2_TARGET_GRUB2_HAS_PTF
+	select BR2_TARGET_GRUB_EFI
 	help
 	  Select this option if the platform you're targetting has a
 	  64 bits EFI BIOS.
@@ -73,6 +76,7 @@ config BR2_TARGET_GRUB2_ARM_EFI
 	bool "arm-efi"
 	depends on BR2_arm
 	select BR2_TARGET_GRUB2_HAS_PTF
+	select BR2_TARGET_GRUB_EFI
 	help
 	  Select this option if the platform you're targetting is an
 	  ARM platform and you want to boot Grub 2 as an EFI
@@ -81,6 +85,7 @@ config BR2_TARGET_GRUB2_ARM_EFI
 config BR2_TARGET_GRUB2_ARM64_EFI
 	bool "arm64-efi"
 	depends on BR2_aarch64
+	select BR2_TARGET_GRUB_EFI
 	help
 	  Select this option if the platform you're targetting is an
 	  Aarch64 platform and you want to boot Grub 2 as an EFI
@@ -145,6 +150,12 @@ config BR2_TARGET_GRUB2_INSTALL_TOOLS
 	  This will also install the Grub 2 loadable modules to the
 	  target.
 
+config BR2_TARGET_GRUB_EFI
+	bool
+
+config BR2_TARGET_GRUB_LEGACY
+	bool
+
 endif # BR2_TARGET_GRUB2
 
 comment "grub2 needs a toolchain w/ wchar"
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
