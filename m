Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ED4CEF17E
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B6F607A3;
	Tue,  8 Oct 2024 20:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZ3gHWQ3mYf8; Tue,  8 Oct 2024 20:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8938860882
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8938860882;
	Tue,  8 Oct 2024 20:41:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 804471BF31C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EDC1404C9
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ocCrDbst93s for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3824E40065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3824E40065
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3824E40065
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:41:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so62309135e9.1
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 13:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728420113; x=1729024913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZhI7bNtGVuCutPeP/TvgrriXc5Og/altjwjloj9MdU=;
 b=rul/7ALGfUKyR4L2gvX/nSrjgp2laGFtTOcl2Wudnb/kCgRadEjmI/LLbpSF4pG6CG
 X7CiQn3H7b+79gkcecCxNi/xupHWisX+tXev/SG901HUqvRAbBjD5KX9/Zio+tciPfq2
 8NaT3ee6XJdAma5b1jfybymh3dAYuqgDpAqaDPrp2y6PLNgmUmOarQByBw9HEQtGfzUl
 sgSti9GDKoWxJDof2EM/IYQljmO1PGMD4KCT7j51vOI7WyXd8KP1K4bcJszIt6OWJB8k
 htSMSnmMoFxMuglqn4EkP30bTWG87g2MXdpw4/ozrftuBbueHFv5xHgd/bydNtdzxmgj
 Hkmw==
X-Gm-Message-State: AOJu0YzddnR19dEwyRNHxOiY2hp8WmFoX2/LVvyFsw49sicbbRzDDrVj
 EpQoYTz2byxYrWupya2tBdyGoFK+h2jFbxeCszuMNLy2aOz90Lgv+c+wPT+rB58WIbAykfzhhCo
 i++Y=
X-Google-Smtp-Source: AGHT+IH5TxV6auMPi2dV1b+k7MXmPIZA1lFUyryMaxYDm4fkKHzwmlB2aP4E1jswMGBMmUp6CHAhSw==
X-Received: by 2002:a05:600c:5021:b0:42c:bb10:7292 with SMTP id
 5b1f17b1804b1-430ccf0281cmr151875e9.1.1728420113052; 
 Tue, 08 Oct 2024 13:41:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d31165724sm2015570f8f.63.2024.10.08.13.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:41:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 22:41:45 +0200
Message-ID: <20241008204145.3837269-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008204145.3837269-1-dario.binacchi@amarulasolutions.com>
References: <20241008204145.3837269-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728420113; x=1729024913;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZhI7bNtGVuCutPeP/TvgrriXc5Og/altjwjloj9MdU=;
 b=Qqendx7S9Mk4jN3/Y37B2kpZ3xVSIVKnDr0cRTkM26nqAIX+4sKk8kRblcptvHghgT
 fi9tz4eL1qoH8epNqsESo06O3YFkKJ1+83q97vDcfjcmtitBMiAsIbhDJccwU2VyYfGC
 Z2v+LoE6IRjCmtHg0rubG1YZL0DCMqjkoPSMo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Qqendx7S
Subject: [Buildroot] [PATCH 2/2] configs/stm32f469_disco_sd: bump U-Boot to
 2024.10
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps U-Boot to version 2024.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f469_disco_sd_defconfig                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index fe9b4f53dc63..904fa56c02a3 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index 7b853ac143a1..84b22d596c91 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
