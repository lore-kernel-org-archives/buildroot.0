Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8F6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 17:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF63241549;
	Mon,  9 May 2022 17:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xV59wnfLHj8Z; Mon,  9 May 2022 17:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD56410A0;
	Mon,  9 May 2022 17:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF52A1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 17:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC2A48188B
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 17:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vssya9bsTKFA for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 17:23:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 007BE81842
 for <buildroot@buildroot.org>; Mon,  9 May 2022 17:23:09 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d17so14540814plg.0
 for <buildroot@buildroot.org>; Mon, 09 May 2022 10:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VLzi6BMRHl0s45JrY3oS9IjefzK29WMElcduSfLw50=;
 b=c/yvFyMVdUwOnINECNwj+pqav9Pydc27DrlCIpisWOQcptmczlsmV8KWE+WrNOX2Bf
 Wj/+e8SM5jwUxx4X+kTXT5IbF3s8NLRVnvHkbGUuxmExpMY59c5Xlwx+OE7PFtOY77TA
 B9q1K3mpkWSyqx4ZyQ3Q2En2rRnXQwOMYIYiMIHCv84VAMbMwA49OnijRr+BXaqjx/ux
 JKdsQSV40IugXmJwCUjHnEtvHmC0IwgUhrjHeBieoMcbgmZPkIVJ/rTDc4AhR7VPuKwA
 Agy+HPJSZpPsOQCPHI2G1FS/AKvXTSqUkIzv9i2Hl1S9LjxFJzDDomtqhzXwd1pVmRen
 EZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VLzi6BMRHl0s45JrY3oS9IjefzK29WMElcduSfLw50=;
 b=0MCW97ONc0iTg9x3fhI89EGJVD7pALAXXhuFGTWvnAdJ10UR00QbSAKAbcw6Ll3gfZ
 bvayVn14FAkAO1CVqvaukiDoBJXDbxETS6HMUmZpf7TvV1vh6aAWPzdwop+DlyUvFT08
 JGGUXw1iCYr0WAzT2rvbmwVuE7Dj8gGKW7tc3RaH6TY2m/jBySR41HyofKFcLDZq7J3T
 Bawn9bwzhd/aEcOk+YxCgU1VcRfKe3564NM8mawkFzW58Cg4iYmRamS7vabyhdR0BabL
 F8PW62gByGifgHYkWsjb7ya0x/tmGDCJ1SmpSFYGDi64cTJUyOQtxlK0Ss69IcnTcv0F
 1QZA==
X-Gm-Message-State: AOAM532S9iWOX5HhNRYqK5eqtSj9YHUe2LUsvYn/lfgEaQmmPUlenBRh
 l1dfOHMFqfk9hpDKj4WCfuo4Nm/eIHs=
X-Google-Smtp-Source: ABdhPJwjHseHkiWAyI0c2PdtVlTzbVBYc1u5dVYUz/q0yNN25Dp4nvMCWhxqYJ4QfHU9rb/d4BOrdQ==
X-Received: by 2002:a17:90b:3901:b0:1dc:5a24:691 with SMTP id
 ob1-20020a17090b390100b001dc5a240691mr27432815pjb.40.1652116989292; 
 Mon, 09 May 2022 10:23:09 -0700 (PDT)
Received: from kyle-asus.localdomain
 ([2600:100f:b073:4c4a:70d0:227e:9024:d057])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170903100300b0015e8d4eb1c1sm160933plb.11.2022.05.09.10.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 10:23:09 -0700 (PDT)
From: Kyle Discher <discher.kyle@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 10:22:19 -0700
Message-Id: <20220509172219.18978-1-discher.kyle@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nodejs: bump to 16.15.0
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
Cc: Martin Bark <martin@barkynet.com>, Kyle Discher <discher.kyle@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6365ef852b..998229341e 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v14.18.3/SHASUMS256.txt
-sha256  783ac443cd343dd6c68d2abcf7e59e7b978a6a428f6a6025f9b84918b769d608  node-v14.18.3.tar.xz
+# From https://nodejs.org/dist/v16.15.0/SHASUMS256.txt
+sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7  node-v16.15.0.tar.xz
 
 # Hash for license file
 sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 4fe34e0aad..6dcaf34aa4 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.18.3
+NODEJS_VERSION = 16.15.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs c-ares \
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
