Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BF5C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 19:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F126540BAC;
	Wed, 24 Aug 2022 19:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F126540BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1X1pp-2AQEUk; Wed, 24 Aug 2022 19:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A45740B83;
	Wed, 24 Aug 2022 19:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A45740B83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2430E1BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B6D5417C4
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 19:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B6D5417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOqhGDAvYeeQ for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 19:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC2E4174A
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EC2E4174A
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 19:26:31 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso2505424pjo.5
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 12:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qKM0WifSNhmvFNxa+8ggvSJ3dnNPVuvkyxbYElKtP7Q=;
 b=KzKsoHE89IIqVtUq/9zzOqL8f4ZKU5U2DC4oEZURzPfJMHcBqFATKBLQswaIL8MBIq
 Y/639u091Mqwg2W3VfZP+q0u7/ft/1N79e+paCmM/jzfWT5iMgB0cSD6Iu2IgVOYJTvQ
 4JpD0790dNUSjB10Z9WwSgOtw8VczM7Iu1zWVzkzszued6Whk5huC5nf6UB8ZVaiynGN
 qejhFdWgGftB11ptW6g8ZtapIUb7uhylBmJ4LYupfsK2kB/ywvfBG/bJkideXV4ifM2y
 d6IWj5bI5tDszQxG+g2tyEXkY/J96d5+rgjE6m6GkRey9xnF85rO3Hr2FjIIvP8QSDIP
 3PEA==
X-Gm-Message-State: ACgBeo0Yu7QeV5qrETdaXgigctgMJEo+j5boMCUcodZlQjx3bLHnT7qU
 0vioZWu4LTppyECYFwZ49SrqoRaJnkVa3ljh454=
X-Google-Smtp-Source: AA6agR4uSS4p56jBkXk8uLamJBpJXU3oYCFN+7dBdStxBLBA8jsNFPOOtExo0NVf6Ldb22J5G2HS1Q==
X-Received: by 2002:a17:90b:3b41:b0:1fb:5376:fb06 with SMTP id
 ot1-20020a17090b3b4100b001fb5376fb06mr639345pjb.240.1661369190653; 
 Wed, 24 Aug 2022 12:26:30 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a17090a1b0100b001fb4a8d82a7sm1741338pjq.56.2022.08.24.12.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 12:26:30 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:26:02 -0700
Message-Id: <20220824192604.2549356-12-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qKM0WifSNhmvFNxa+8ggvSJ3dnNPVuvkyxbYElKtP7Q=;
 b=WWUSWRuB5Ka7zZj5P3KFjz3aUQ5oxZksd04pBYJofmQGa4th2I+4006I+Vi3QDEAmF
 Nd9Zj4rQDDqWgNum/vftW8Y5/2nUgxmBnyIWPK59O1wsX47D2nASJ12OmlQeOsTTqxLc
 8R5Bg5RDI/8kGqWul/bnYE+7VjS9d3fuTLY5Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=WWUSWRuB
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
