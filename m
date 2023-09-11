Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A961BEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 13:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CAED41731;
	Mon, 11 Sep 2023 13:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CAED41731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9r6D3hyf2Ba; Mon, 11 Sep 2023 13:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256DD416D2;
	Mon, 11 Sep 2023 13:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256DD416D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5601BF2C5
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29D0A81493
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D0A81493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFKP5CIjV7Un for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 13:04:08 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB4E80A8D
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 13:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB4E80A8D
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-79329a8f78bso156024139f.3
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 06:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694437447; x=1695042247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jURRG+f5QMhuOuc39nZ09/sYrs4sjZ7RIFepVzbJ5oA=;
 b=Y3St6RvgLtXdbUvv4GZUT/3aqnH7Nx826HtAbAfixCdP1I1hSTbJLDNknzQcQjuYIR
 SPbruPCrAANrjLq381LDOf2Nw11QI601lfZ9uTJkD4s6h2JH2Ungt2ZjMom/4/NKMday
 gtq9Vuk7X76E4A4CroQccgHdml+SUiMib6Ry0CUUQEvKdoETP8eEC1sX8UwzRZk2YoAS
 QOiNi7We5UpM7K3kHqEawjXsRmO5o0Sx/LDTYN29IGjNNxQPdel43T4FP1dvzV/mhEYH
 gHUmxoJn7gwR7Al1ILdfnedW45FXa8lYuFWq15zgRbXAeKqq2FCmamn6eC22VgamAoHz
 lR6g==
X-Gm-Message-State: AOJu0YykHYljQySB1U7Sah9D022dOQNVasfTPeIwoHrHqv1w9vx6BEsj
 ZwFMN2j9SorVeehYflOrWOU1Hwwc/wN3JA==
X-Google-Smtp-Source: AGHT+IE6PUTzbTTak3DFo0yz817CpDPMCRrUgFFE7/2Gn/hm9f1ReZNJkJsACUTHOLrGRauEj9qA9g==
X-Received: by 2002:a6b:e917:0:b0:787:ff98:c38c with SMTP id
 u23-20020a6be917000000b00787ff98c38cmr11785449iof.10.1694437447073; 
 Mon, 11 Sep 2023 06:04:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 fs12-20020a05663865cc00b0043193e32c78sm2149019jab.152.2023.09.11.06.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:04:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 07:04:02 -0600
Message-Id: <20230911130402.3010064-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694437447; x=1695042247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jURRG+f5QMhuOuc39nZ09/sYrs4sjZ7RIFepVzbJ5oA=;
 b=X7nq5AUH4OYPFxt5TrwYVdAW9A3oDTY8Nh4J+S59Bu7zn3xwrEw4gdjGJkzksXVV5L
 CIjk726hR7/i49pNM6LrQc0f594skC4S8K9idN5LsYjyd5Le9xsbrLc4wLC7eUjD0jUV
 O1qRrsWWdkAXUhphmClpnmXVEEu0sBJu26bVlEjkMu8koll0pHPNSvt81+w/Pil0SK6t
 2d+XliKoED4fVu5DtiNVpr8QpXx02wax+iGbQbgT9A07J8G3ySyM1BEqsSpbmI/2Z/bL
 GrKgmlivEfjzKyKzJpK1VmxvmoFOSHwCPJFAxJc7fxzZKJsE2EDMYzLlf94YofWSLu52
 IHZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=X7nq5AUH
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-kobs: bump to
 version ff13a99a22aa73cca0e09a33c2ebb6a94ad698da
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
 James Hilliard <james.hilliard1@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update github organization name to nxp-imx which is being
redirected to.

Rename COPYING TO LICENSE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 4 ++--
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 39f02ea04a..39ab2b6545 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5855c8964f908ad30e5d4500180ee57c51af68186289ef1bdf8553ee60d3b1f5  imx-kobs-a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b.tar.gz
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  e83c9bca2706a33832174fc609b434d513a39b54ca90a714a6d0bb6f7a0386f7  imx-kobs-ff13a99a22aa73cca0e09a33c2ebb6a94ad698da.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index 91b39f6fa4..d33d3a1b77 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b
-IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
+IMX_KOBS_VERSION = ff13a99a22aa73cca0e09a33c2ebb6a94ad698da
+IMX_KOBS_SITE = $(call github,nxp-imx,imx-kobs,$(IMX_KOBS_VERSION))
 IMX_KOBS_LICENSE = GPL-2.0+
-IMX_KOBS_LICENSE_FILES = COPYING
+IMX_KOBS_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
