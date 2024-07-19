Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1129C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D879409CB;
	Fri, 19 Jul 2024 03:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjWzMMwml4x4; Fri, 19 Jul 2024 03:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27794409CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27794409CE;
	Fri, 19 Jul 2024 03:33:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 369771BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14E21409CE
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qFyeFFUoE-X for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:33:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC521409CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC521409CB
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC521409CB
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:33:35 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-70365f905b6so919245a34.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721360014; x=1721964814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HLfOVTctHeYrbvfDMYSkanp6HnK/qDqublUruwKeUoo=;
 b=GRES6U1RbjkU2x8R4kMCzub4MYOF7nxTrjowoFVSPBOnBoU4xXV1ZH4C/UVYWzegjC
 HUxAcwH5wyz/qyBvAUQdb9NAI5sm5EWJNMw7Xnel+Hj8B/kW3Jpt+u7r4tdtpHx1HpS5
 1tCvaouCX6HusEy6ru6oltPuO2CqGVkpk9pVjjQNp6dBwy56TcErR0/PNvuw45Fv8S9L
 uJRELrP4qK1vKvUBlhr6pkAn1xcHhwXQ1yK7EHIq1921STh5VwPwQrM6KCC+/gXtMolN
 y2qvfu/YVpWk84e4kHEIIFxlf8f7COhZvb+MbbNEN+feiK8KUiM7uGMx2L1LCSc0j6PQ
 /7rA==
X-Gm-Message-State: AOJu0YwF+oSv1EPv6zUrZe6SjoJVcVcz8p7bQbeY4RS/hUr3oyf3fZ6/
 I7u4zT3bYCgfjEMczGSmMdQ8JIbnArDr0ro/ghxsO1JmqUUOVm9QrNR+sR7vxpvU4LBH/vtmvbZ
 OPGRlcw==
X-Google-Smtp-Source: AGHT+IGmf4SUaFAcelomQFTyRJq3LCl0pf1qEEL/MfGnQFzTz40ud7EZr4E3uDpdXET6F30A7ZpgqA==
X-Received: by 2002:a05:6830:44a8:b0:703:79c6:a9bb with SMTP id
 46e09a7af769-708e376b0dbmr6460544a34.7.1721360014335; 
 Thu, 18 Jul 2024 20:33:34 -0700 (PDT)
Received: from localhost ([157.97.134.29]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-79db9441ea3sm321182a12.57.2024.07.18.20.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 20:33:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 20:33:30 -0700
Message-ID: <20240719033331.13606-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721360014; x=1721964814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HLfOVTctHeYrbvfDMYSkanp6HnK/qDqublUruwKeUoo=;
 b=oE+HnXfRlx/cvEbpcxqwuVlwe6O4IJYk3snaGiRdXEPL9SC9oS+19ST9yQvxQSOcSJ
 WkbV1TukAkc3hGYENZAs868wIItal6jYe+8ISbeAx1dSW/0GeB8iMFjtTa81REqa7Rso
 mBbojDI+f4r8+26dTMmmF0YVPiLH+O8zhAAPcb8AIGnXdjdpK6W8ASLHb8s+qJs4PKe+
 8ib8Sf3PYHcAagAsi1p/NRsZo6Km0IzBtPV2B7pWIQiU3wk7eJHMsaBr325D08ks+ERI
 I2sV6OrHJ1/acKkrywT5XgqZnfTJlopQHQjcDeALNOaAW98zgFJldi8Kd3xH2sSmMqaF
 UISg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=oE+HnXfR
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
 v27.0.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v27.0.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 86de5ca785..b72b37223b 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2705abdd7a8a47ec88c0d2f0f31eede01ba4aa5ae8b5ab0e2c4ee25e7c314521  docker-engine-27.0.2-go2.tar.gz
+sha256  db02d9b5d98e85284538d6ead43b549c025acf937e98c09d18395bb331c1e607  docker-engine-27.0.3-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 1de112e4de..c7c51c5ef5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 27.0.2
+DOCKER_ENGINE_VERSION = 27.0.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
