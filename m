Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F0CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B064185C;
	Mon, 16 May 2022 13:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVQMPW1t5SdW; Mon, 16 May 2022 13:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA0C4183E;
	Mon, 16 May 2022 13:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56FE41BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 466E782CAC
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtDg7Cd9JDAO for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B51282C8E
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d21so4553989wra.10
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUK39nQ6d1rRagZ0nwiBGCp7oSDam4aARmixmGvENVA=;
 b=iSOb2ZxM6yYBE9tkdjK2S6gn85DxWnXbU/w492OanD8Zb1AJShe4ENQ1TQtiV4mw8t
 ObfA4x4U8KeobBDeSMG0DY4CkSByFuYBzJFMlqoLtip6TztkQzMxnfz5wHjY3Ykvuy73
 YIC7+xEEq+XB1ZgtR5O1dT006thXsyOlL+D/zQXAk3LPo1Q03BEkA7iEFR3bo2TEV+dP
 afcm9yhWF7F9Pcm9Pucm2eswwujwhfyWqwdPCHC2e+Z4OCayT3lqpxEgS8qaxXbePUit
 h6sSAs70on4Nph3BD+di1Y3Sxo371oEK8G1PM4Q3y5fpTjXiCgjo7wvYfjEc4t1bY1ak
 5rFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUK39nQ6d1rRagZ0nwiBGCp7oSDam4aARmixmGvENVA=;
 b=mdwLDEKGfPIYIj2o3RVsykdPHS2Tei1vdX+cT15yLTi3l12UVTJVyt1kOd1bO9NGLd
 YoOTKnCCoO13WS/EXhrIZsQ5CcL2o4wIEspjmPA+sdDzfR3asUJzs2RDdd3QDAzdLFX+
 JlzUmG+sOGyOu6ZL9asE+DKPiRV27sBsAk/ziA/ml69cSuwSGdENtFqjDOl1D/nTFKgn
 jm1HaQH7CQXi2kR7z+8kGjktbk+mRNNsUsPmn/6bYzACEkM+dsk1YR/4aj+qG8VITrrX
 XO2Ok7pqbTFgakR1gztXLPK26oNdnUXHubT7WExtVbGK7EC1BGE3odkOxIiv8Hwtf3/B
 JBXQ==
X-Gm-Message-State: AOAM531YmtOHeJ4g6RaOmQe/kRBx4XhkJdGtGxO7062VhcuL630QmmSD
 0UKyoP2VhCOxbSmTZE1c5enasNMJtPk=
X-Google-Smtp-Source: ABdhPJyruA4572xJ3vLEAOr+d4tgQX/gkgNkjuaBOE3nXLmuiSIp7VO84dEEkJ9UUc7O0omyceUIew==
X-Received: by 2002:a5d:6947:0:b0:20d:1233:6b99 with SMTP id
 r7-20020a5d6947000000b0020d12336b99mr650719wrw.134.1652706838254; 
 Mon, 16 May 2022 06:13:58 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:57 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:21 +0200
Message-Id: <20220516131334.1910858-8-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/20] package/erlang-p1-xml: bump version to
 1.1.49
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xml/erlang-p1-xml.hash | 2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index f2a4ab83e0..379ca7ef88 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  739f37a161a570071469ab1f3d8fc232f004ea616700fe7e46b6d8afa9d03a60  erlang-p1-xml-1.1.44.tar.gz
+sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-p1-xml-1.1.49.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 5730181ac6..eee2c74c03 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 1.1.44
+ERLANG_P1_XML_VERSION = 1.1.49
 ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
