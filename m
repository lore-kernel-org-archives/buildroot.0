Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D9FCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8905A402ED;
	Mon,  2 Sep 2024 20:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrV0hDasx8Wv; Mon,  2 Sep 2024 20:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7200740313
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7200740313;
	Mon,  2 Sep 2024 20:34:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 078001BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7AED80AB6
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAweuVlU_QUI for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E354680A9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E354680A9B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E354680A9B
 for <buildroot@busybox.net>; Mon,  2 Sep 2024 20:34:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42bac9469e8so38220785e9.3
 for <buildroot@busybox.net>; Mon, 02 Sep 2024 13:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309284; x=1725914084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yyVZ1MJvcTpnx1aCAAgFg/Ua6QW3LhyMZwIYCA5dgLI=;
 b=fLASiZLdRdndCGZ1xXENZ9RZ2exqXN2ORuifos2P7c7KqF1WJsYIdoUjs2Q6h30s96
 Ta2IdKfekh2sVVRPYQXO5N49yAsIM83tHm+ebIfpE6VTy445+vt3K407/Q1bSY/Mu8kS
 pGHD1glfibNobAzJnYLproH5yEfPa3iShDDUAteSgprD9dvS3kMo2nwCM28BBFyj/Eec
 cvb75XTeK0wMcteHO+3WRh8J9rWCAtyehLej11hjqAele7zYjvJysK3KbR7hhFLwxFyU
 exZ2d1MOKS0jRhG4HhI/Ohb+IeYwVCvrNBVzVsnSi285MbcKZj+kaq6dzhCIR41LcrDW
 UZ2g==
X-Gm-Message-State: AOJu0YyH03VlgdaKo1Pu+3Aa2U+SXlIZZR9ztYZi8C5qFbDYWMVif1sW
 oDN6PN/Yxpz+n/kp/p0J8vg09gcaASem6jNOPQrL1WnsIlhSkmgIeEcocxv3qf30YyQ3Qxb3/7y
 zuA==
X-Google-Smtp-Source: AGHT+IHJdun1GcUP289Fg6is1g8MlPhDkyPIHhmwdxRfmPNCTqQ3OsASla+gv7ke6sZACJAyFOPA2w==
X-Received: by 2002:a05:600c:358b:b0:426:6099:6eaa with SMTP id
 5b1f17b1804b1-42c82f673c7mr28924165e9.26.1725309283492; 
 Mon, 02 Sep 2024 13:34:43 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6da24bbsm148822805e9.0.2024.09.02.13.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:34:43 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Sep 2024 22:34:24 +0200
Message-ID: <20240902203424.2649384-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725309284; x=1725914084; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yyVZ1MJvcTpnx1aCAAgFg/Ua6QW3LhyMZwIYCA5dgLI=;
 b=cIUJO1ltyYUy9+GkD+iHvuUUfkUI7xn3Tih3ouEsVSs5qWMdZyl5qykUWqZxyvTSxM
 RJv7nYOPHwWBnkd1QwFvUkfZWYwsT5rMY/swLNtq0zuX4isJ5HnRzqXsN2bVreu3UBaV
 qbZJVH+zi2qjPC9pK9MLOq8zWeCeud42mRLVIMxrA3vGHua52rx9w2GeYM2N0FDQgPJX
 /by80ikOuK26z69iMQR/bvLaUpRDS8INh8/PzS9jw+tyMciS7ozrqdV3hKitjotL1j1L
 2MxAuTskHRoGijoTk5y9uv1TWTAqzRJG1+/YgD3DQD09QQhoU6JKj1dprawEy3gMUVsD
 qGkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=cIUJO1lt
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index be9ee77cc..01ea652f9 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  34fbf37e7f8e159b0a187bf8b0663af0187161ba4c5015828590c919645d596a  open62541-v1.3.11-git4.tar.gz
+sha256  dab44ad50b10cc5f9e9e1f44f0510e0c5f7a8226c6bba821babafc5a79acdc2d  open62541-v1.3.12-git4.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 26c3cd5c2..92ce3b852 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.11
+OPEN62541_VERSION = v1.3.12
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
