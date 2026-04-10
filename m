Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5249DF459F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 16:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032EF40CA9;
	Fri, 10 Apr 2026 16:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrGgJebe1IVb; Fri, 10 Apr 2026 16:29:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2554F40DD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775838546;
	bh=0z9GZxWwQwqVnWYyhgEJUBxiFKYNdWq9ocmjGWr7eP4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=erulZg1ParuMO3Ip5fGhQ+c0QdH6199Tpg8ZPzJvXUZqbsP19FhFbcS4qrRORWXjL
	 4LIn+bOdDF/0Ht6HYH7MbwZ7Klv5yWwYwKgrQikPvZK/3cBaRpc8x6u6xlQBfPN1et
	 f6Ml/LsoaPbxptIZkRVjIpvCNYyTWn85Za/Gm6drMxwQN+XGhDm3r0PJZPIPTg8qTi
	 2rEYDSf37XJoMU6rrUW5XXfaSdKCYHk3HM3x6wfv67S2oT+sR4yfuTtrmiU+XjokXw
	 fVTuFR1EwOrLSiWlgexJ3rg4oSqM6BimxdOCGdg0NUwwHhsLDhXZ4ZyT7EnQKoPMc0
	 ZtVR52FrbmBDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2554F40DD4;
	Fri, 10 Apr 2026 16:29:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99274237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AFAA838F0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcasezDIxBH6 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 16:29:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABA98838E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABA98838E6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABA98838E6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:29:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so1574092f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775838541; x=1776443341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZGfQ/zy1qcQpza23+Zh2y+EtPrl+WtEZDrI3PJimNI=;
 b=WXjoHidGMGaaORVrGifE9JAdsrMkVvpuf3FkHidB5dWDf3lu3bmIqzoqEDebWsI/uP
 Bmw5xTpI+AaISh05oPgAfMBzDoE7qh53lANl9kiDoEcOLdnhq6vvHqUmlZmwktZl/dlG
 mmcTcL8yoCyVrods32KtRdwb6YHzeyWgS9R3e9HIM5jGtwx81qLnn01eRdxvw6R8oSDf
 JLNGq/olxcfCqoHZLHhO+gjwo8EOdzR9AAoL3CKLTyn6soiOPsyF2YKbn1HPwncci+si
 YYbhIIj0wNCf2RYGt4LZ4qctVEkKADynoUe2Yh5j1Xe4iIscZlVg6phmI+5J7s8J9/5E
 0TfA==
X-Gm-Message-State: AOJu0Yy/faYhmuorqLQzehzta259T9SQxq61P3l+p63wZpNW8fN8w0KV
 OWJC7dov/HoLkRwuRSpxEdFBJcBSNUigXLB1ZrV6p2IyiTeYeT1nLkApB3bnkIVfQuehw6zywbJ
 eL04S
X-Gm-Gg: AeBDietEN/nFsq4uvyoFqAKFUx0QhIp8MlXNQPzQ24tfVx+SPRGKKDMemwRD8oEufOS
 Cz/1lndztb0sTYNB1wuL7xGccFll2PlVQe8tt2Z+MEWtI7ahIFOhaRxLM1RA0D7i5jBuQCOhg5T
 PERqUyFArkkXq1Ref/chNe70JowKeNdTcEwr9mOrQZnOlT9poilon7fC1pClfZA3++/wu9hQkgm
 DpUdQMRybir4xsZ9RlahPGVtTHCj6nr0dTQiJLNipvhjx0aSxA0pegf/XvV08frRt3ZwNydUiCx
 NnmhJk+rkLUSeADwhQ/OwwuFLq53qvA2Nq/HdvEWSpS3XineD39EN04qj+ptZOslDyzozl5ejVx
 0ls3ltP4eI/p84ZKeJgMXoGarAKQfLkCfmRag+OMc8wuBDizMU22q1ft+JMMLEvow6UNA+IOmcX
 Ua+x+XjqGdAkHZKZIFrscBNruWou4cSjZBTEMPD9MKgWwHXKhn6cInX/nZK7VRcQKykwADeEAH3
 uSAZGXKJuwSfGUhzDtBKmjgsd6Css3+bnSSTnIf0wgb9EOjSRcbLgM2Y42+F6/EQ9VJQi71mePe
 cDuTnEB4RGTcUXFUTUI=
X-Received: by 2002:a05:6000:1888:b0:43c:fc5c:a9fe with SMTP id
 ffacd0b85a97d-43d64268556mr6452391f8f.20.1775838541388; 
 Fri, 10 Apr 2026 09:29:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63de2999sm8200444f8f.6.2026.04.10.09.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 09:29:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri, 10 Apr 2026 18:28:57 +0200
Message-ID: <20260410162857.1449619-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775838541; x=1776443341;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fZGfQ/zy1qcQpza23+Zh2y+EtPrl+WtEZDrI3PJimNI=;
 b=SxMa7Tbpv8D4Cmc2K2MJYAAUpIy1/ABPG7hZa9XLwtQi05L+pBJKHJy/symRq2qG+6
 DVNFmaMNDU+f/2Zd6n+9i3ApWYO8EytvFmitOsqVr9iEsfUefdNwpWrhPpXGtU+bh7jy
 nWImen97UmSAmXFKJ6pgAfQYyDa1ip83lnQIQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SxMa7Tbp
Subject: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: bump Linux to
 6.18.21 and U-Boot to 2026.04
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.18.21 and U-Boot to
version 2026.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32h747-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32h747-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32h747_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
index 9f5d285c3569..5ae723bc6f3f 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
+sha256  1c38214fb137bae85b82b82537b5987358621b915ab2a8e4f09e60697c19474f  linux-6.18.21.tar.xz
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
index 92cd23196bea..0a95020e0099 100644
--- a/configs/stm32h747_disco_sd_defconfig
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
