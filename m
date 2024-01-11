Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E86C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADA042078;
	Thu, 11 Jan 2024 06:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADA042078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpIL_8ZK8vRz; Thu, 11 Jan 2024 06:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0288441E2D;
	Thu, 11 Jan 2024 06:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0288441E2D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE4911BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96C1983A56
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C1983A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpQMSNX27NEi for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:05:56 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8C3782896
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C3782896
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3608bd50cbeso18539235ab.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:05:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704953155; x=1705557955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQXJ4iyIdPNzEZKq9jRP4wowIsK1e/9MH0qTnbxaMmI=;
 b=vDuA70GtgAH3VGHE4ymqOCRkJCZzMqzTanynIS1Buy3an0d5MH2PNqX+PtyMVlht/w
 yePeQ4oo7/8WCwPb6MXyyOpRkc3rDBsihUONoO0zXTr4gdEdCT7u4XN4nSNewN1b28gB
 7FpCutzD9KZbaq3+t7yhKqjUdCJWze+C8yE89J28O5EVxo3nRZwsnjC/cD9doEQ01Bd4
 rvZEtenVsL3G+jAAa2ADxrLaPAk60AA5DkbqlwSEq3u3xw5nAyWOcj+fk3oNNHiZEKjU
 tISs0MzgXSih6bpSOlu4EcMXCtQWv4CazJCzQS89kiWOH/pqkWQ/w3EX7WnY4UuGXx4o
 HCUA==
X-Gm-Message-State: AOJu0YwnLDvWZAjJVFjKSgdz5mccMcNNGh0sbY+zVgvq7xQafsVHBCwL
 wez2lSFYhyTP4fI9yJMtjnIGAng4LAT0IQ==
X-Google-Smtp-Source: AGHT+IHwv1deggUdogNQNDNi2mLMdwp0HmlLwz8JhMp5tC8NGkZfejYOjLlC9vD0BjkkDgbmrCWAHg==
X-Received: by 2002:a05:6e02:2165:b0:35f:ceba:d524 with SMTP id
 s5-20020a056e02216500b0035fcebad524mr1042092ilv.17.1704953155379; 
 Wed, 10 Jan 2024 22:05:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 co12-20020a0566383e0c00b0046e2b201668sm125432jab.150.2024.01.10.22.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:05:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:05:52 -0700
Message-Id: <20240111060552.3028285-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704953155; x=1705557955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qQXJ4iyIdPNzEZKq9jRP4wowIsK1e/9MH0qTnbxaMmI=;
 b=On8oqnbLM89M9v8LqWzuzRQdrmqFTjWimgSOwg5YVlg5uYDTA4BfJeRfhngTHQLVyr
 P9mygvMdp8iBaY53HOz/VVobyNG8EWeGnbs+8EHYmaoLUI1hhiF+RfRLVJ/Gg2s8cOus
 LcUz7Iw4l++x2LJnBfksAzYx1Vk63edyb6aqBDTSDl8tw7+cv1RsSQklqx48uUMr96vT
 MaWfccr5ZzYEaBfibZnAhmBbbW8/pVXBDL+PqbXoeYs21mAKVkeYMiudII+izdU+N2N2
 tr6rF4YHm7L36ZSA7qsR3MJrJwM+BZlCFEoOYF6U9yiwU/vNYY9EWB8SQmjWAxiuHwU3
 f07g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=On8oqnbL
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 1.39.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License changed to MIT:
https://github.com/getsentry/sentry-python/commit/9ed5e27636d05bc30cd363c19a032ace8447f5ad

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 6 +++---
 package/python-sentry-sdk/python-sentry-sdk.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 38ae3380a8..2534a48221 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  ea2d728c847879f66c3d24cfbade2026  sentry-sdk-1.12.1.tar.gz
-sha256  5bbe4b72de22f9ac1e67f2a4e6efe8fbd595bb59b7b223443f50fe5802a5551c  sentry-sdk-1.12.1.tar.gz
+md5  94ba9002bbfaf8c443c496b05bbc32eb  sentry-sdk-1.39.2.tar.gz
+sha256  24c83b0b41c887d33328a9166f5950dc37ad58f01c9f2fbff6b87a6f1094170c  sentry-sdk-1.39.2.tar.gz
 # Locally computed sha256 checksums
-sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
+sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index c3092a5184..f1c5648f07 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 1.12.1
+PYTHON_SENTRY_SDK_VERSION = 1.39.2
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/32/03/496a7c8313658dec419303e8add969f314b7538c29f4ec5ebe6d86fb8ce2
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/66/90/9deac5c137e9f0ede908757d886af77938ef28f94b24decedbdf98f1ca4d
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
-PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
+PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
