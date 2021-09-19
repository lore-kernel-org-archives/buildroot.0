Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F058DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:10:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7393360F0F
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7393360F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E2EA400D1;
	Sun, 19 Sep 2021 07:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coFXj9mVC1Ox; Sun, 19 Sep 2021 07:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 583A540182;
	Sun, 19 Sep 2021 07:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69E9F1BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5840D40182
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ctwwDyM3Yax for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:10:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B597C400D1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:10:21 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id m21so4987861pgu.13
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44pJVc8n++JLpeVkxrsrFIgn9chcruqRKRM0yrdw4mM=;
 b=VtRnJkyK6KUqkCOiCw6iLpzUoAq0Dwewk+baso3BdTDjYHVvOaq0YljhVnUCM1NmDS
 L7ynaeoMpe1h5TFmNYnb2iT/OTVC3hH9HStBonUk+rhLxKSo1cq5dpR4B4Dr4GPNBKIQ
 7hVuzTV+bmPbOyb6yDBK+1wS4/0Q+gajAakBpySb6JXi+Pc2/SzaDd/P1fQ1Y6qR1aqR
 HpFaDOYM5Vhwz4anvgjaWt8CENdl8QvTaQl/iZMdeP/iWgBUOXVTXFLSyMd7deSQOzzN
 H5NqtJvBxLMilpq9I+/UxsN7C57EbVbpHzCGJ+66L+pY1XBrj46Wz6kPGj2MUifmO8Di
 k1zg==
X-Gm-Message-State: AOAM533N+VQ1jmBiCUAeFUpx+NUzdochRERHBJ1yqzWBYD9jzLSnhjoy
 GrNfw6PYJ7vkWACF3NSbr1pC/UIZYIFO4g==
X-Google-Smtp-Source: ABdhPJwxszfrnL3aPXiq7C5wUP7OJ/hffI3Nn3vyY2WrfTtg4DKlTHlWwEBYDpPJ8IUbgY+JQAuIpg==
X-Received: by 2002:a63:651:: with SMTP id 78mr18046025pgg.306.1632035421061; 
 Sun, 19 Sep 2021 00:10:21 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-194.sb.sd.cox.net.
 [68.6.75.194])
 by smtp.gmail.com with ESMTPSA id g24sm10786458pfk.52.2021.09.19.00.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 00:10:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 00:10:13 -0700
Message-Id: <20210919071016.3339939-2-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919071016.3339939-1-christian@paral.in>
References: <20210919071016.3339939-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v2 2/5] package/pkg-download.mk: add
 <pkg>_DOWNLOAD_POST_PROCESS variable
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This will allow packages to register than a download post-processing
is needed. Note that this variable is intentionally not documented: it
is an internal variable meant to be set by package infrastructures,
not directly by packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/pkg-download.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2527ba5c60..66a415cce0 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -117,6 +117,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
