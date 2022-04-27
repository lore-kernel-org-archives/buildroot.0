Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE78C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 13:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F10741A00;
	Wed, 27 Apr 2022 13:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erX_nGEcXIU6; Wed, 27 Apr 2022 13:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C2A41817;
	Wed, 27 Apr 2022 13:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CBD81BF401
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 13:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898EB83386
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 13:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsoavDHtj_pP for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 13:14:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E00BF832FF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 13:14:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id l7so3354028ejn.2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51sY4NAyYzvWUqeiDVu6yYt1RppYiY7tl7YfVFq2xOA=;
 b=HE4iJLICj0Lgxa36RWy0/L+lgEns/9iFo55t2qW1zBTbJWQ6k+FdWBUnlmGlOQf/hw
 EBPaM7fBizGyKgUImWX1o8jrcjsreDnu4FzpDsxvKW19aJ1qbTVR0TEVXvQVj1YJBhwq
 ZB34C4OfO3+D1hpHaIU4UoR4albLnrAObq3URtNrFSKVZKj4Fy5ZaJG4nGvhMB3a2SS+
 cndKyBH0lajyTbLFEGGbbNmoeDsdOVEMKo3fcMRwSmt0JRlPgsXbAb/x4GdCG+A/V3u+
 zgmolA3Nvts1igUGzccNfFgKT7g6PYWaRV2was8WmczmR//wJxU9YAdjQafHJEsXgDup
 IJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51sY4NAyYzvWUqeiDVu6yYt1RppYiY7tl7YfVFq2xOA=;
 b=dx7Q/Uz1lERLkbD6JYBlaTHoOtJZh4rdzBFKzpFVHT7mHYbc1tk9uaB7Ur3CW/IsYc
 +oqSRAmwQXVPDKMvCXKbzrM+dctHRr8xhue+QyAyRphGCJwV/41F/F9/Fi5qOmftGkxw
 JqOYsx4bdbdqTHuKYhaWxlrEWCh84TruCSVSRU5UYQo+z3G2VywPixfubY7/DAuRcKmA
 MdBjTCR43p0qXT+W1SiNFbsKtUVuAXFyqCt98QvzxeZ3zo3AKZ2wDNnJjqeg+de3qDeF
 0NQlWRSbQTMjmcrWRxw2+lM9tEa/4HjakCcl8dR9eCzplDGMOy1rZmuyAuK6WbgS8LG3
 iGog==
X-Gm-Message-State: AOAM533ky3fc2y3b3ru3Tr0oj727a8TK2C3NTbQ893ZT1WMsNUNj1H/U
 u6U8oa62VxFETH8NSZFPYJaJHp2Z7P6vGZs=
X-Google-Smtp-Source: ABdhPJwqa+vpSpnFFtuqEcFxJ5W91iDbSMD+HUNkk6OiqMkk1B0FdmkSHuYLDPDpaVyAjwW3DD19pA==
X-Received: by 2002:a17:907:86a4:b0:6f3:ac7f:e9a2 with SMTP id
 qa36-20020a17090786a400b006f3ac7fe9a2mr8998778ejc.317.1651065241864; 
 Wed, 27 Apr 2022 06:14:01 -0700 (PDT)
Received: from localhost.localdomain (bbcs-119-245.pub.wingo.ch.
 [144.2.119.245]) by smtp.gmail.com with ESMTPSA id
 a6-20020a056402236600b00425f5e9ee4fsm4072198eda.1.2022.04.27.06.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:14:01 -0700 (PDT)
From: Noah Huetter <noahhuetter@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 15:14:00 +0200
Message-Id: <20220427131400.223113-1-noahhuetter@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Noah Huetter <noahhuetter@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Noah Huetter <noahhuetter@gmail.com>
---
 boot/opensbi/Config.in  | 6 ++++++
 boot/opensbi/opensbi.mk | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index f1443498d9..ff095ea800 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -119,4 +119,10 @@ config BR2_TARGET_OPENSBI_FW_FDT_PATH
 	  must be set in the U-Boot configuration for this file to be
 	  produced.
 
+config BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
+	string "Custom make options"
+	help
+	  List of custom make options passed at build time. Can be
+	  used for example to pass a BUILD_INFO= value.
+
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 8e055633a8..d007ae1299 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -31,7 +31,8 @@ BR_NO_CHECK_HASH_FOR += $(OPENSBI_SOURCE)
 endif
 
 OPENSBI_MAKE_ENV = \
-	CROSS_COMPILE=$(TARGET_CROSS)
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	$(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS))
 
 OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
 ifneq ($(OPENSBI_PLAT),)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
