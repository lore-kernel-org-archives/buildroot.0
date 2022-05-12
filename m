Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674D0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 12:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C3083E35;
	Thu, 12 May 2022 12:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlPrJaFkX8_9; Thu, 12 May 2022 12:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1633D829DC;
	Thu, 12 May 2022 12:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0F211BF3BA
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 12:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EB2783E05
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 12:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04AfYyEyqYLr for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 12:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D573828B5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 12:12:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ch13so9759077ejb.12
 for <buildroot@buildroot.org>; Thu, 12 May 2022 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nUtx3Zyms8TriXYhXI5NGCOnzCZY+VCcIYV/BXNjMCY=;
 b=SWpUOHPMexX8oleX7h7R9a/3TrHuPp34oKOmAxkcRTFt+AF7Z0/fyJTU4DA4Xn7NYy
 YnlhulUPlalrceHv8loPXlLjQkPEun/tGiF1U+GDth58G5a5rBLkREoj0avRQxQRjrz9
 RVsCL9Kxduh9Cy+1x8m0Mqf9Ly08aIbXyQ8aFJ8uDvaJxaFEqN9OhJcHRdp1lEIj9meH
 9qFD+gWw530Z0wHggj1rEGmuPiGiPvZXJ+bOcfqOx725qY2U7lhD1awqQBi9EWv78vMe
 EEqvfhNkjeo7cLexOOBR1Vb5onrUHZe+RwONDwFMhhe+1QaFBzabs2U104/K1hbORg9G
 Qklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nUtx3Zyms8TriXYhXI5NGCOnzCZY+VCcIYV/BXNjMCY=;
 b=YwvvTgHhwJcs5VNrY4KURg5qH7He2hUWZ0j1mtyLQl9c7ZUD6FzF6GBeVK4MSXdfSk
 IvZeKPcUU/GkLyL+niyFOyHV/s3d51yTARIPXg7CbFBi+HFfMQIoDUT3zIXETl8dqpg5
 WFlixu4n1h3XyaMNj2hYBkSns5hHXJ8JMguVqUdU6ybkTqzf/8PkQ7PFltTpmxLwhL4s
 5wIVA9/ubOhbXxcJsdi4QDqkXdR5ctqkLPO9kGzuTpEm6fdqp/J5uc/Hn+EVSsl7kVyZ
 0EsVexSK6sz1+3SgwPy0/HgiaCGTwiTvJRpDIhnMgP8dPSF2mGApiu/5gXefy8QM5n4S
 lHqw==
X-Gm-Message-State: AOAM532DY/h4IAXymP0ddwlPWc3KN6KVZ3U6CDVCBsLMxuDSDJFvMRQK
 sbVTEbpthOCe3b3SSgoXBL+R1fw3TfVV/g==
X-Google-Smtp-Source: ABdhPJxiWb9E11npdPJOVNuuTr5LLXkjcF9XcpXOgx1ksjRs/r3X4Tp21A/tcdPkZi8GyQ5AMJQitw==
X-Received: by 2002:a17:907:d05:b0:6f4:3729:8e36 with SMTP id
 gn5-20020a1709070d0500b006f437298e36mr29328459ejc.475.1652357539474; 
 Thu, 12 May 2022 05:12:19 -0700 (PDT)
Received: from arnoutx1.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 fb21-20020a1709073a1500b006f3ef214e1fsm1977634ejc.133.2022.05.12.05.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:12:18 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 14:12:16 +0200
Message-Id: <20220512121217.176652-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/nodejs: clean up DEPENDENCIES
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

One per line, and alphabetical (was already the case for host).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nodejs/nodejs.mk | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 6dcaf34aa4..909347eb2e 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -7,10 +7,21 @@
 NODEJS_VERSION = 16.15.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
-NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs c-ares \
-	libuv zlib nghttp2 \
+NODEJS_DEPENDENCIES = \
+	c-ares \
+	host-nodejs \
+	host-pkgconf \
+	host-python3 \
+	host-qemu \
+	libuv \
+	nghttp2 \
+	zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
-HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-pkgconf host-python3 \
+HOST_NODEJS_DEPENDENCIES = \
+	host-icu \
+	host-libopenssl \
+	host-pkgconf \
+	host-python3 \
 	host-zlib
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
