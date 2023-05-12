Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B466EC77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6551084AE5;
	Fri, 12 May 2023 16:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6551084AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idO0eIVoXAR3; Fri, 12 May 2023 16:43:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840D684917;
	Fri, 12 May 2023 16:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 840D684917
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C905F1BF8B4
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFB5D847C2
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB5D847C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1chf2t9a5oy for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 16:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C15D9847A4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C15D9847A4
 for <buildroot@buildroot.org>; Fri, 12 May 2023 16:42:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4ec041fc3so14890545e9.1
 for <buildroot@buildroot.org>; Fri, 12 May 2023 09:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683909774; x=1686501774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEjc22rYIsIcTTI7fMXx9TM5+BlBPXifSbVJGIgrIzw=;
 b=gueTekbrKAji2v9PDE2Vx4YdSQufgXDIaWHDPYCCB/lADjZPIJsPzZ+u3dwj7S27/D
 qz7Nd1e5pAhEyJIvdiEcPJNaZVNgtP2svyC58+4pEZoIIt0/S4Sidevl/Z24zhm4pPei
 So6OwP6aa/n1ql8nUvqaW3VBFAnZ7nbLeFnHMP8HgCRNmYJsWNCTI/JNFt16FtNoeio3
 aYxbCA+qoEFAybpWrrow/Qn8ppoADsd2kT5lyY7nAEPnA7CgF+ue9SJLFyw5c4buijCP
 DpeQ2aYux6Y1g5kO6pOIfSJPL3oyC6HQOpaDAabr7oKBcdJ6ZQNsKYa0WYJB7Xo8+VQt
 jPyA==
X-Gm-Message-State: AC+VfDxod8aN/IBqpGQST8QdmE39YRABX9EzY5KBHuqBnb9XykQ+CvRW
 t36Gw7QgLBnL4xQkvV4PCwRA6XH7lQE=
X-Google-Smtp-Source: ACHHUZ7sTe8rBfvft2SV9JIFFz3QGaE2/sIC6rmN5SrhLsujYNPs/7CjM4XvCYVznwhBlCYUB2gPFQ==
X-Received: by 2002:a7b:cb57:0:b0:3f1:7a4a:7f9 with SMTP id
 v23-20020a7bcb57000000b003f17a4a07f9mr18049703wmj.7.1683909773620; 
 Fri, 12 May 2023 09:42:53 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr. [83.204.213.113])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm23952068wrn.93.2023.05.12.09.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 09:42:53 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 18:42:47 +0200
Message-Id: <20230512164248.3179932-3-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512164248.3179932-1-bisson.gary@gmail.com>
References: <20230512164248.3179932-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683909774; x=1686501774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEjc22rYIsIcTTI7fMXx9TM5+BlBPXifSbVJGIgrIzw=;
 b=a2kzc1qJQ0QVTiAQhwYGoSHlNYHfbeWs1m+TtAnwLBcipKdAntgIZk2nmY3E9/jGdi
 Fe1X5Jdpbh5Ny5kqYz6/VqXjR0DZDEGzE4jgkMnu3Fxqb09zQkrTcpXs0fkBCkCWIZt8
 TMHV5mJ+5qOwIC9/zF0ajj3TVprZY74dP3zIeAjYrs5cQLzXf4i+qG4EWlPeU87sa10s
 sBB+JLA3m7DcySLo7h2oEB1R/9a6Y/RbygOn508/TedvSrieqa9mcjzapVz1sKNg8m2g
 8NV2PJW9lyPYLLYmaWpLRyQIoYfFXWolwzmYHxhuKwQbNVLJsJ53WEPI+mTT4h2shKZQ
 GPxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=a2kzc1qJ
Subject: [Buildroot] [PATCH 2/3] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.11.p1.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Same version as NXP release 6.1.1-1.0.0 [1]
- EULA/COPYING: update to LA_OPT_NXP_Software_License v42
- Requires toolchain with glibc 2.34+

[1]
https://github.com/nxp-imx/meta-imx/tree/langdale-6.1.1-1.0.0/meta-bsp/recipes-graphics/imx-gpu-viv

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index a0e6345b7a..8f5708898d 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5b9dd02cb2dfa564903872576cd6586fbf4a02abdb8e180978bd84205ab302a7  imx-gpu-viv-6.4.3.p4.4-aarch32.bin
-sha256  5c52bd15146c24d449638c6276c07103949c8efbc53d002518541bc37c57e424  imx-gpu-viv-6.4.3.p4.4-aarch64.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  6e2f3fb43d16c30fd0b23027f5205818e9d4c74d4903f1c63f265ccf8269f01d  imx-gpu-viv-6.4.11.p1.0-aarch32.bin
+sha256  4a5f2235500dc4bdfaaeaffa0e4c13cdd28436cc0d859e5be222bce990fda461  imx-gpu-viv-6.4.11.p1.0-aarch64.bin
+sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
+sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 359dcc5923..6e9cbec4d8 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch64
+IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.3.p4.4-aarch32
+IMX_GPU_VIV_VERSION = 6.4.11.p1.0-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
