Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1905BCD37AD
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF475613E4;
	Fri, 15 Sep 2023 21:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF475613E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRqR-Ena7GiU; Fri, 15 Sep 2023 21:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034B861379;
	Fri, 15 Sep 2023 21:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034B861379
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A6F31BF3D2
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02C8183ED3
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C8183ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id maEVNOzRDsaP for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:52:15 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A7D383ECF
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7D383ECF
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c336f5b1ffso23509035ad.2
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 14:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694814734; x=1695419534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3D5Fkv98taogMLW4f+AmXJJJ4baSXFvjSzIgUWU8FA0=;
 b=shboRi7j032RYpcf/iAnqebKsSNvPachVJYcddWJhT8nuNnmINRARGxoXv3Lmqkhv1
 GR/c3/hh3pXVAgMjZ44OPwZEsq0koHaUIgdSxW+id2HLXCtp6QT5cLbOqem3XqiEaRBD
 S1RIWcHuEVP2iX0jdKetRm7FkjDpXtXzD94C6uGvUSGGEvgYU2h0wlboLXsWNDqVX9k0
 7RREKaV0Do8nfCItJt7HxBuF6rDhxptek/DGUlCdbyaMRh2O6Sz3DuArRAOzL7gXacbx
 c6ZZY9Ux3N/EnG/MAlCRtc6s+SaESJYkJgL2VIN0WAwVdNJiQSJ8Mb/Ppke85gX1TeIG
 SShQ==
X-Gm-Message-State: AOJu0Yw/DwZ5x5ckH8/L3AI9HIZAOF5q2ClBOUZJpmbEyOJMr7BCnRru
 ObOQhRl996u2R/ZVkQNmbDjCVdq54A0lc7zU/w66x6n/0IU=
X-Google-Smtp-Source: AGHT+IGHf2Bks2Sy8q2ho6RdS2/j08t02ZtX+Sj3PKdaAPl/aTxYimCCmIhAbkw0mNshllBVyxGyzg==
X-Received: by 2002:a17:902:c404:b0:1be:e7ba:3a97 with SMTP id
 k4-20020a170902c40400b001bee7ba3a97mr3537436plk.15.1694814734474; 
 Fri, 15 Sep 2023 14:52:14 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709027c9200b001b9c5e07bc3sm3898125pll.238.2023.09.15.14.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 14:52:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 14:52:11 -0700
Message-ID: <20230915215211.214167-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694814734; x=1695419534; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3D5Fkv98taogMLW4f+AmXJJJ4baSXFvjSzIgUWU8FA0=;
 b=sXhFWFWViSB/57eH//YdOVUH0ZiZ+SpL5BUiNTAsPyo3mzyFfY2Ty6YnhaVsGS+QqH
 OD7ksset4K5RZ6j1w5gtf5uRdm+VIuYQSNTake6kpmBihvhKQuAa9V73yFHjsmWwkCqP
 RcJ04ZTzz66HDggY04ZdsEWP9KvqwOiCHHmdKZcsunVMZeYJrfkk8XuTMtqRr1b30mV/
 BXAffuwSi9LGlTkWnmkiZ43HwLhEq2kkgcoaQ2QFxHn1+2LGYda+qLYWHqZae2/hJBQK
 /wlQVspxE5AAduGHNavmsWwkkgWY5DPbwySTSRNCz6sKC4O/OrQUOZ9ehfSKQL7RXLJf
 KnRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=sXhFWFWV
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version 1.7.6
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
Cc: Christian Stewart <christian@aperture.us>, Stefan Agner <stefan@agner.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfixes and updates.

Containerd v1.7.x comes with new features including container sandboxing.

https://github.com/containerd/containerd/releases/tag/v1.7.6

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 8404675e30..d5e0ef4517 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b109aceacc814d7a637ed94ba5ade829cd2642841d03e06971ef124fa3b86899  containerd-1.6.22.tar.gz
+sha256  084a62f78f96cb5fda02221425f14df09d3e0acd093e4d4b3527900e3ff94677  containerd-1.7.6.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index c4a6d854c3..0591400709 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.22
+CONTAINERD_VERSION = 1.7.6
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
