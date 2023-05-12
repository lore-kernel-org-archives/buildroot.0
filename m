Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DCEC77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 16:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C89284042;
	Fri, 12 May 2023 16:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C89284042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxACEveubESL; Fri, 12 May 2023 16:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71612813B2;
	Fri, 12 May 2023 16:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71612813B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEFD81BF297
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B044208F
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B044208F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJkWq3HMSDbX for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 16:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 553BC4204F
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 553BC4204F
 for <buildroot@buildroot.org>; Fri, 12 May 2023 16:42:56 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-304935cc79bso9558977f8f.2
 for <buildroot@buildroot.org>; Fri, 12 May 2023 09:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683909774; x=1686501774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JT18pjtdpbFd8TNA3Oa0yElwy5jWyPaRwXns32kKv9k=;
 b=IAg9lYwhLmTNx12ct5SyYXFVa14WLWTpNjfdYCwVwfAeoz1Jrj9BFKjp8VTRJB/HzO
 3TXQ6mUu2fMYPHjarYcPNvAo6vHXUrop0othPIlmjNmFmoCzr4HN/Oujds2g6BSfMd3D
 Q4AffPHV1hyvlx/ejYhmFEWasfzNFYtXGPopOU6i80juFsBTY2IulsWEby2zR1VJMSg+
 tqZ0GIhBPG1Apz2EJs+OdtlosyZfDvj+Lfs0rawfaDGnUYM1Y1vd5LUhlEF/Y/w4KA7H
 5aShorNbvy/CzYuumTFW69cPw8pIHR+HQfN3wmhIVu/JctYvuDQ7zbiXl9BR+gtVgUc1
 +IVg==
X-Gm-Message-State: AC+VfDzxHkm4tlaf/EiQtwAq2HvsyEuC6NdBUoIao/UO8B2GpZBNn0I1
 WnTkkHkM4cdnr7hMVahwEnvRr6dZxOg=
X-Google-Smtp-Source: ACHHUZ7JRmmcZXIuA+n7ajG9X6/X+Y0cZ+OySRPhmLzs3PHXYUo8SpKxLZ3Zw2iV8TiH3dEALGnVAw==
X-Received: by 2002:a5d:4c42:0:b0:307:7a43:db8c with SMTP id
 n2-20020a5d4c42000000b003077a43db8cmr17299267wrt.38.1683909774229; 
 Fri, 12 May 2023 09:42:54 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr. [83.204.213.113])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm23952068wrn.93.2023.05.12.09.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 09:42:53 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 18:42:48 +0200
Message-Id: <20230512164248.3179932-4-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512164248.3179932-1-bisson.gary@gmail.com>
References: <20230512164248.3179932-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683909774; x=1686501774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JT18pjtdpbFd8TNA3Oa0yElwy5jWyPaRwXns32kKv9k=;
 b=q9Ldyfvu5dskBx0ZFwEiDkL3czuwf5OiEYcPZl2+k7C1YBc6T6xj7hxeyGXcWm0RIp
 wl3Ic4oYymDc8CAe0Jvc5H7QHGj38AgtsFv2Rg1ywxK83sFgg5GgSElrsAcYUoFJ/rjJ
 5gehAWPDbsPWSpGl1bcN5Dc+Wg+SGieAft7bJy5mncSao8tn1iw2pijtSlPjQo9fOfgo
 FIlYd++Lt7VE/oFlch/w5zZgftuXLpR5nb76WRr1qoog3U1ndLpWugfLonEwqK7V3eqa
 v4/rll53vQg6r40zeWHMJvWVQNGqacrk1O8QcSGf4sNtkEJKrRtAF4neZxHXYfBKzO2h
 qP/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=q9Ldyfvu
Subject: [Buildroot] [PATCH 3/3] package/freescale-imx/imx-gpu-g2d: bump to
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
https://github.com/nxp-imx/meta-imx/tree/langdale-6.1.1-1.0.0/meta-bsp/recipes-graphics/imx-g2d

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 27f6a438d1..8bb6a6fe32 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7737a3372bcde34e2d275397df67c307df5033d5b133ac770f75cac4e1ec2580  imx-gpu-g2d-6.4.3.p4.4-arm.bin
-sha256  8341d6e2cde3f3ffa035dc95b0487dd04a50531cc80f4cddc5a689ebc4946e02  imx-gpu-g2d-6.4.3.p4.4-aarch64.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  65427c12b43c7bb3838ec2bc91a5853c310652b920a65b2b52bacad8e761a8e4  imx-gpu-g2d-6.4.11.p1.0-arm.bin
+sha256  9bf8ebbfc85245d75ab7d133c3e135a4c5f23a0430c75883af9700e9cb82c151  imx-gpu-g2d-6.4.11.p1.0-aarch64.bin
+sha256  e17419ff1c87b5754282227f651745bd7b3986aed983e2d494505828022db4a8  COPYING
+sha256  eff6daec54c4f86eb4682eeecd3dd24ffe90398c9460c2e573dd4141bcd28652  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 42a1fe70cf..a93c51cba3 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.3.p4.4-aarch64
+IMX_GPU_G2D_VERSION = 6.4.11.p1.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.3.p4.4-arm
+IMX_GPU_G2D_VERSION = 6.4.11.p1.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
