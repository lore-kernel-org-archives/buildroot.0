Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E763C32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA0760E0B;
	Wed, 24 Aug 2022 02:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA0760E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06nszgmq3IZp; Wed, 24 Aug 2022 02:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D96260E3B;
	Wed, 24 Aug 2022 02:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D96260E3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 120BC1BF3FF
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED36E409DE
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED36E409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4QmsszHS55Z for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09FEA40921
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09FEA40921
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:32 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w138so12592589pfc.10
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qKM0WifSNhmvFNxa+8ggvSJ3dnNPVuvkyxbYElKtP7Q=;
 b=cPiRwwPX8s5Ux/9F12rCvY9nZEG2pPTH0dV3jST/5Bo0/SSewC09e2ScCANS3z8Ei6
 0jpNFBpwtF9PuRKCS9xox/DfaxbjCzR3TXhilolLUXTGi1Mr0Fmm9X7UERQAc14og+Zf
 9h1WClDnfsMpgTNpJhIaSZdEKpYNmWME+OYRH0nEX56EWDD5VyY77nY9BwkE+dC5Lp7S
 j9VSxIRj7HN4eLXMcNS2DAqXCrm7k0ZoFSuoBPYfKd5VXbdrM2SCUOSG1ZJrFaNrWOA1
 7W89ifQ7FIjcCxcjCfl1iatikgeKidgabiWJ4yKxSxcFCim966Ovm9Or68JZMCpKjAN3
 tJJw==
X-Gm-Message-State: ACgBeo39UT4Kp58HNA8SyZocB+/4+VpR97qchfp+U2y/OTdpmh1IuCE7
 BY9BaHJjO39SaNtJlPTOywhHAhmEHWKf65ZYeOM=
X-Google-Smtp-Source: AA6agR6W68pwN8hiL3G1e2Dhb1gnD/cwYZCm8Im3QcxnTvbGAOWBgn0GnOxBlkzJBpoMPUT8QNolkA==
X-Received: by 2002:a62:188f:0:b0:536:ee23:e3ed with SMTP id
 137-20020a62188f000000b00536ee23e3edmr6702286pfy.33.1661309372304; 
 Tue, 23 Aug 2022 19:49:32 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:32 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:55 -0700
Message-Id: <20220824024904.2529728-5-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qKM0WifSNhmvFNxa+8ggvSJ3dnNPVuvkyxbYElKtP7Q=;
 b=g2mTZgydI2dYNhgXyDK0boZEM6ca8gPo2bk+VriYYqoY3cZqx66lfYcVKGNVU/7RUL
 4rVj3XPpc+V269dKCdqONiUyW+KDSE+5Gl+p1mjKfdkCR3SWWVIW27pOa6WIr0Ytw3f+
 uv28mWTOpWGoyHJCqTHC9YrbADnG8H+7zQyJQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=g2mTZgyd
Subject: [Buildroot] [PATCH 5/7] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.3.p4.2
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To match NXP 5.15.32-2.0.0 release.
EULA/COPYING: update to LA_OPT_NXP_Software_License v35.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 4d28b037d0..181d85a575 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  39fe307916e19a0892a514621121086e276a43858af90230372a1344852116a2  imx-gpu-g2d-6.4.3.p2.0-arm.bin
-sha256  2642a49e088daae4cf568a150d01e7c095995e8a6ff1883c02c3fa6d26d254b3  imx-gpu-g2d-6.4.3.p2.0-aarch64.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  0ba9806c4efa0154fc9f7be406e42bc2c50b975abd32cbe322cf7bcf6ae0d350  imx-gpu-g2d-6.4.3.p4.2-arm.bin
+sha256  ff50ddfee2d989798a2aba84ef9114e01f8d867293891dc0aacfab1640cbf8a3  imx-gpu-g2d-6.4.3.p4.2-aarch64.bin
+sha256  4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517  COPYING
+sha256  4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 0e4078a962..cb40e5940b 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.3.p2.0-aarch64
+IMX_GPU_G2D_VERSION = 6.4.3.p4.2-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.3.p2.0-arm
+IMX_GPU_G2D_VERSION = 6.4.3.p4.2-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
