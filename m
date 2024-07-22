Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AEFC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 10:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF8964026A;
	Mon, 22 Jul 2024 10:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L00MZudZ966j; Mon, 22 Jul 2024 10:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C1624029C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C1624029C;
	Mon, 22 Jul 2024 10:10:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D3B51BF28C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 10:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AFE4808AB
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 10:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHqjXZzORGny for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 10:10:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E1DF808AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E1DF808AA
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E1DF808AA
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 10:10:33 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ef7fef3ccfso6187631fa.3
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 03:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721643031; x=1722247831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xB9kQtxT77UNvjgQ0e4QhO6kmbgNKKzBGiUvLpSlXOM=;
 b=b5Qg07u6p2imJVZ9q2sh0qdAUfGnYOoE1KAGgKTyr8nKXgwA/7hYJRp3zGHh6pFkut
 jmaG8cagp3bICKwhO2cg7919p812bQeklGinN6OjZdWN0MGDTIpZhMXPPSgx3tYvn6Wv
 tXOAY4LLuLMLkJofUA4xaF3Zljcq1SMROzP8X1smVsVKr72MYfHfju7LiHqCuHrzNfLZ
 vjqtGmcNlhRTYf0qLeMLFrU+JovF67VoCXONQ/M/sbzHcKAj4RAohGX54zPkNbGU9SHI
 rq2UenGZW/GP+dA8fDFwg9ZaYA+C/50Bpx5vmke7ImtjQA0m5UN1mexqqq1goqjWoxZ6
 SkyA==
X-Gm-Message-State: AOJu0Yw2KVCZrLPpGO7fVtfAIg7PPJeYmSna8b1toKcLeQH3ZtIeN9DF
 CxPo2V6oLjeyEhsKfQPplvHkf9b5YRqmIZ7m3Bo7Xlel/tFHbk7/I9ku+A==
X-Google-Smtp-Source: AGHT+IFh9VG95LQXPk88GidGDnv5Yvyy2sIW4ikNX6M8f79P8hMhwmBOFw6V4K5NV11pCJJTMwcjwQ==
X-Received: by 2002:a2e:8097:0:b0:2ee:8453:5164 with SMTP id
 38308e7fff4ca-2ef1662084dmr43880261fa.0.1721643031129; 
 Mon, 22 Jul 2024 03:10:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786841f8sm8121412f8f.19.2024.07.22.03.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:10:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 12:10:28 +0200
Message-ID: <20240722101028.345215-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721643031; x=1722247831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xB9kQtxT77UNvjgQ0e4QhO6kmbgNKKzBGiUvLpSlXOM=;
 b=nSik3b0kzktb6bV964tIMXxeQbVv/XOQbqmGzGuzvAL6UimBakqmQBcGM9Va4BnBxE
 lY2nZpAwrg/j4ZcFoXysSK1rgGuKiDFvxAQRX72110koGu4BHrnMtJLJDLyURP4fgcSh
 AQPP4ouQPQA6beJ9792T7eR40NiHMBgMkgv6ZhvPyo9XgIZiTX3qyuJL26kHjd45VC+x
 QITjRUfSAtPOr8eplFVTHQJabNsrBOfcBBlvDa25lELNfUn/73flkXd/BF1tF9rs0cda
 1CXEOR2fHZGw3OPsfUGDtFq+wD40NxQvwu8cMTlJlHCl3xX0TXkPJUggcePTLqL2LLWo
 duzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nSik3b0k
Subject: [Buildroot] [PATCH 1/1] package/brcm-patchram-plus: bump to latest
 git commit
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with gcc >= 14:

main.c: In function 'read_event':
main.c:715:25: error: implicit declaration of function 'read'; did you mean 'fread'? [-Wimplicit-function-declaration]
  715 |         while ((count = read(fd, &buffer[i], len)) < len) {
      |                         ^~~~
      |                         fread

Fixes:
 - http://autobuild.buildroot.org/results/67965a5245c3d98d683e2c788352bf7c1cf4f00e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brcm-patchram-plus/brcm-patchram-plus.hash | 2 +-
 package/brcm-patchram-plus/brcm-patchram-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
index f6910e714b..20bc56034c 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.hash
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  febad69fbc9185b4c6a31188cf381fd280b88d93cb7f5a40dfdbab9c599c29a7  brcm-patchram-plus-95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042.tar.gz
+sha256  1287021683e0e71b679b157020f047a44032f3af879b257ff0b94d8d4c3d016d  brcm-patchram-plus-15bd6638dd6d3a37d22dbc18059f6d9eb885f057.tar.gz
 sha256  26324f5c563b7e338c2876c8abe90c3681c1e9a6163fc59b494c94ad6493eda4  COPYING
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
index 329571d9a9..d873330769 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.mk
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRCM_PATCHRAM_PLUS_VERSION = 95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042
+BRCM_PATCHRAM_PLUS_VERSION = 15bd6638dd6d3a37d22dbc18059f6d9eb885f057
 BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
 BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
 BRCM_PATCHRAM_PLUS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
