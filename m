Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF14C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 19:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF2EF80D96;
	Sat, 20 Apr 2024 19:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHnWqdBW2Y_Y; Sat, 20 Apr 2024 19:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C702C80E51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C702C80E51;
	Sat, 20 Apr 2024 19:00:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A15F1BF3C5
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 19:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 740E081FEF
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 19:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAQHNdrFGZMX for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 19:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.45;
 helo=mail-wr1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 941D280D96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 941D280D96
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 941D280D96
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 19:00:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-34a7e47d164so1103792f8f.3
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 12:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639601; x=1714244401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SlqAbMIR3nqD28jrTQCtmt+gAQz8E+0E1Ws7HxZ70c=;
 b=nPELDK9YIibot2dMK9xsLPsMcZdUVv2rkJPrkpHtCx5n92xZk6oGifNYCf8NZaz3mx
 3hB3vyd/uCsYULPZq8VH1N+J9vWhIqSVnwiKcg3k3l8A9p2Au93I3wmRFSyR53TYWo1T
 j4M3vIh2asQSKjm7EE3T4CY1Phfloiy2xGCAQFLiFOr15ss8dj+6EHrEk3uwneFm21LG
 yrlOytxqq2u0ORq0STRcbOT0Ie7hD3/O6Pej7geGvn+bNfSyRR0RAjnygAYVopc8GniQ
 ix/bctisu3OyhoH3MDk/+8ufU91dRExVbJ0xoF4odPsJGHcPAzxLzT1bn5sHC0Oh3Zxn
 VWDA==
X-Gm-Message-State: AOJu0YxYTcPiGuAlcaFEAhHAmHDdh9B7mHHjE2GXw8GHoPir+iqmfxWN
 1yDbxAGAH1Xp5ytHCEl3X3clDFWuMv16EmhtFaDxEvUMWeLwvxk647LZ5Q==
X-Google-Smtp-Source: AGHT+IEh6SGG/HfytoSffNZQzTEJpf7I/dYh2G5ydl2KG2oOxQj5ftXJy7rAIlzNWIOxV1/ZLNP+Hg==
X-Received: by 2002:adf:f1d0:0:b0:346:7f2e:6d19 with SMTP id
 z16-20020adff1d0000000b003467f2e6d19mr3945451wro.39.1713639600684; 
 Sat, 20 Apr 2024 12:00:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 x12-20020adfdd8c000000b00349f139dbe4sm7534822wrl.91.2024.04.20.12.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 12:00:00 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:59:58 +0200
Message-Id: <20240420185958.4165997-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/fluent-bit: bump to v3.0.2
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
- https://fluentbit.io/announcements/v3.0.1
- https://fluentbit.io/announcements/v3.0.2

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/fluent-bit/fluent-bit.hash | 2 +-
 package/fluent-bit/fluent-bit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index cc9c976d60..b58cd89fd5 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e70ae5be2f0ca1cb842a1c8d2762437907c522765f79b5c0c391eaa1b57c9f4c  fluent-bit-3.0.0.tar.gz
+sha256  d2bbf633ddaa79210db31a18c65feb81377d9e3ffca01c0f88fc68d2dfbb2661  fluent-bit-3.0.2.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 33054bea66..ff1b1de527 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.0.0
+FLUENT_BIT_VERSION = 3.0.2
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
