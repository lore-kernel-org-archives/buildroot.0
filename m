Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C635C77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10D8C410E8;
	Mon, 24 Apr 2023 20:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10D8C410E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1O-hXTYHEVg; Mon, 24 Apr 2023 20:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4A4641746;
	Mon, 24 Apr 2023 20:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4A4641746
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC1631BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D11AD81F34
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11AD81F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaDOAFIHTDiQ for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF3D81F50
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DF3D81F50
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:32 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-63b35789313so3677216b3a.3
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367931; x=1684959931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qvrw/7mhfB8jFDFtd4I/hZk6iINaclwNvJNUeZMLaGM=;
 b=PtPoYWjQeAHzC25pY99KsxnkIsph8OWwioYJNNMpl2x2QLHhNtQ8Ic5FIn5r4UPQ8L
 zLuRJC0jVpf8H1J8ET6c2/c+vtzv18oD0bLznsXjVudrYIXmtNuWLG5hXakYzWeLuycl
 67/l9wbj8UB2NgBE3lwFGsaWBGHCpSrlZ6QaPnpxxG3DkmTZxko25ikOrSuhb27Xj4es
 a2OLVnkAlCIC/OYZ0aWXF0yhezU6qaQ9OAblg4BRTcXu0pCSTx3fuVpkx+hYInhaoZj9
 Sat4/Aq5jL2cSvM1tAeHJINtrI+Knciyn/uF2DQ0u2HSSlyzJ9HbDXkWra2k8xa9Ulrd
 SgLQ==
X-Gm-Message-State: AAQBX9fz7tLC2+9Bm1Y7Da4EkuYoLMuoVQ1be2EmHdhMLJWuOjGronz8
 aB/zP7hM57mO/Zy/0+aAIvFBL72+0ntpfw==
X-Google-Smtp-Source: AKy350a52zs/lZcXAwjqgnRdiOn7Nvjn7ONytxotJXKtecKt8smGXUdcKLzRl27Heg2UQSAp8ZWETg==
X-Received: by 2002:a05:6a21:3286:b0:ef:b897:5b0a with SMTP id
 yt6-20020a056a21328600b000efb8975b0amr19731819pzb.19.1682367931317; 
 Mon, 24 Apr 2023 13:25:31 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:30 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:14 -0700
Message-Id: <20230424202514.1546092-14-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367931; x=1684959931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qvrw/7mhfB8jFDFtd4I/hZk6iINaclwNvJNUeZMLaGM=;
 b=r+hjzzuJTy9V6VXu57XBREvgJk1BvRR2X6Qsys90G0bEKydWuDBu57CEE/W+ZmCfzT
 HddZlFt+/EWTw8Cny45yeX6ZqW7Ofp+paBlQGXeRocepNqifz8iMfWpoiehD7BnjvsQO
 rn0ZxvubS38rSO81Lga3c2BlNKlTa5veGkwgd83Z3gVZRuF2AuhmJQyjsUjlcocpevn/
 tTnt8zL8b7ZnvHq4L7YiKSpoAgD1EvZzjoj6iGZllODBr8hvLLNa78CS4dQa7e5quzeq
 zd2irnt5PPntOmrOtZhUrIohpt2pGL0Izj6pUPy2emP+Ol4tcDxsIWpkfzrCBeJJRjsM
 F8+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=r+hjzzuJ
Subject: [Buildroot] [PATCH 13/13] package/refpolicy: bump to version
 2.20221101
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index b08c22ed4e..a09e59c270 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  965f98f0b68a24fd0b8e8d973d319332aea88973e1d6c455ef9c2a31aefaeaa6  refpolicy-2.20220106.tar.bz2
+sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index f11b72755a..8fea7cc254 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20220106
+REFPOLICY_VERSION = 2.20221101
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
