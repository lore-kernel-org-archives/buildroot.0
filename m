Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E114C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A4B80CD2;
	Tue,  7 Jul 2026 04:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6Hbfeazok1i; Tue,  7 Jul 2026 04:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74DFF80CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397271;
	bh=bqZonI6Rd8SktRRL8iyDaF+O7o05kDx7lTxdmwiR5RM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GpQgRWrc3Fx2wL2+suFKU4ppmfgEoMNp3SHlPhAjoy9nc8Wj14/WqwTr8JxOuEXmJ
	 tA7CFdDKE6d7NOjJhoYGAlJo5eu4H7GrfP99+fQDQlKl45HRvxEfGz1s9pXWapOjnU
	 6pAzXKAtoxLRPE/mdTZhO6RA1PNmCFnQcSRyfIAbLCOZ3l8EiZ4cjV40qGdv49Fe5w
	 T6HU+Be8n1qZpkNAqhP/xKKDkiO+2ljVOLy5g+dbuQRPVDhQbxX/1pE2bfyuu8HfJG
	 mQzu7fx/GaPIW4TjJSAcvl7pHBXutnXEmfO8K9gX0cmWaYOFUgLruGCCnvtzR4pgXD
	 dQeZazI970YwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DFF80CB1;
	Tue,  7 Jul 2026 04:07:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DA1E315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5386940547
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTs5p8NhukhP for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6F96404C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F96404C1
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6F96404C1
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:07:49 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-385b78b44a0so1932982a91.0
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397269; x=1784002069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P45ibYG9ChDz3t95wtJd26nm+jZ8MDQduEQarBw+SA0=;
 b=dOWMVi2uNNTGbx+Bxm+W/JdAW+kWmrdg+VCO+g7CjigiCwgvHQ5srhHqdf7dkFaHTA
 0ACwTe2xbyjYSmI0MUe64X7+T4jCht2gU0UoC0ypyb6S44m8cYKkkKwa4gZ2N7f2+hV+
 FLay9Ja7GTjzJW+tw5gsHWJTh7T/vZ7Lbdogg33pZjaIAXnZgKfSxqYgV55ZOPfKU2+x
 a4nED6D7muYMjqsfTML/RPQ+F+QnMasfyv+kO97/MhlgIN6Lk4OvqQxJZbmgoLSsw1jq
 vQjLjzQiNF4Cd0hi3hwWC+A61BD6812qt7xCO3YhWcTZFzOa5L5Tx0a1FgtY1VfPgF+Y
 xqMw==
X-Gm-Message-State: AOJu0Yxo1NXBI/YuHpGV0MinSDoLM0OmXj8uX6bf6pmcVIeJ0s4PuPEF
 E8jjM64gaS3hOcmH37CiWA84hxn0JhzRY0apSc1grRP7fpPbKYC2rCMGTsUMHKyL
X-Gm-Gg: AfdE7cnr4jF6VdT4U+8SHKAG6vYbm3oNSECL8CBmDidzvow12h9CFK0SEr0rYxOcG80
 bALhrQICq4VJtJUvHYPDMOqdPufmJsP8jPD0x6Q4Jh83RrFl2Vr2LC90Sa0ahZNW99NR00XzNhb
 J06IKfhdWvh2auGZjnkDOsLhmgmlpEK+Jjl1DC69om3kMkIf5qOl7MeWo0Otwl8BOBptOyP3zOQ
 O3ZZi/2SHPXwY6jU+DtAlFcVvaq+giP7IT6TelI0MnsRiGiuw3Xjnhjo6qKGyejIE72nZW0H1CZ
 cYpYF5LLnxsJKwWkhWBmV+lJN5bPJnH7fchWTIAHcKJRflJ9kg7wxxetND+OJPeweJchZk7M2/Q
 vZ9BkG6TJpfE9cd/YuHvailq8kOqdyeCpjWg28x+ONCXHfVvET+pIjPphncP0u6RrfgrTnQWgiY
 4l+Y/n7A+mwGolR2Q7Qte7+YLzWy5sHKnOHy+5dtPKuczLQ1eCgQZ2HffkFm/qdaKIyzwEvD3so
 g==
X-Received: by 2002:a17:90a:fc50:b0:381:f7a:2e0d with SMTP id
 98e67ed59e1d1-3875854e02amr3440668a91.33.1783397268701; 
 Mon, 06 Jul 2026 21:07:48 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:07:48 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:36 -0700
Message-Id: <20260707040544.108052-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397269; x=1784002069; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P45ibYG9ChDz3t95wtJd26nm+jZ8MDQduEQarBw+SA0=;
 b=TFdsyaerrjUYTUH/wGqVV7/xY4gCzcR7+X9f4k37VIwwZZiwMpeYiOl6d8mvmZTfZE
 utLBALzYDJv0acNpvD3u76BICBUax+AlNuwY4aanzCK110rd0XqfqXSwzds/jSpPvF8j
 Ov48aLnbv/wcz8eDLanQv3E6U+dbiHhVqvKlQAME0TKqeS5y+++VlFMry+60vvUnuWkD
 UO6M07sx26Q9M6gnX//PIUhiGuptQXjOe9BGdwCpmxIEMkaWwFGIIfOLmdvp/zQYw0nv
 2mlEkIDPsJe8tLPQbCOvvK/STT82UjAb6nyfLmvYh03sweIgBeNe57B7k2kuuPSfv74K
 D4jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TFdsyaer
Subject: [Buildroot] [PATCH 1/9] package/fmlib: bump version to
 lf-6.18.20-2.0.0
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

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/fmlib/fmlib.hash | 2 +-
 package/fmlib/fmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 4f2b3d4d46..838c518e3a 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e39b3a756d4b53ab58b9282ed55505e69c7a79d8e79d5c9eb953d931ce7cdf8  fmlib-lf-6.12.34-2.1.0.tar.gz
+sha256  a260289e73e6d6220ac8ce87301509a0e0bbb58b71ebda8dd0edc5808735f22d  fmlib-lf-6.18.20-2.0.0.tar.gz
 sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  LICENSE
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index e5f4f3c820..9ccb0b891d 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = lf-6.12.34-2.1.0
+FMLIB_VERSION = lf-6.18.20-2.0.0
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
