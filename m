Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0502EB64CA
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 19:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE8440469;
	Sat,  7 Sep 2024 19:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85cLrwHUN15N; Sat,  7 Sep 2024 19:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3048740363
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3048740363;
	Sat,  7 Sep 2024 19:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 239E31BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD426818DC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3ZBWKzrKCWP for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 19:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEBDA81919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEBDA81919
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEBDA81919
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 19:05:48 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-81f9339e534so131072639f.3
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 12:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725735947; x=1726340747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t0qupq+DPzxFhAF21IvuIN84VAHni2GCVOGaihWlpaY=;
 b=VOMQGymuh+NvOlkuMyxLQxNFuImYkGCVc3RagGek5vv0mdCTShURSafr43tBRRXBE2
 5ZsgsWkxrunjnz6/fiFnPYqOurBivW3rpijt1pT2sPLyej69ZPpV/Rpx0CjYVq8GK1OA
 aR4LCvl+SzDVLRUvuhdgKfLVQ42tkKgjlbZZBEZ9c5+tG0D+KhBJYS9I1A9yWoVz1MO5
 kuBc65i9dcTAdyuTJWTqJQuQhK2LoyC2Piz9b8Xi7M4kLGv9v/6NzfRdyPlz45KNon/k
 Z7entqDrzgkl9TxTw5D2K/Cd9GEEzYdgerdijy1DrEMCQC/BqFGr//fMgcBtBX1s8xEj
 BPmg==
X-Gm-Message-State: AOJu0Yzu/1vc+9B+Z9ihy/VzUCR3cr3l8TXwrF2spYg3giH14+kBTtFM
 s3ILtRWX5F5wDthXk4Ij7aTcmhKAmjMGISA+5CSvflqP8odx60yz1HsQdg==
X-Google-Smtp-Source: AGHT+IESwy0/JaXn/QPyKIILpdCHQtM7EwIhc10Uwg1pyA/GywnWalfZh/+lquG39hVlwlANQshaYw==
X-Received: by 2002:a05:6e02:18c8:b0:3a0:4e27:e704 with SMTP id
 e9e14a558f8ab-3a056868d5bmr23630375ab.10.1725735947154; 
 Sat, 07 Sep 2024 12:05:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a058fe5598sm4534475ab.38.2024.09.07.12.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 12:05:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Sep 2024 13:05:41 -0600
Message-Id: <20240907190542.879982-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725735947; x=1726340747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t0qupq+DPzxFhAF21IvuIN84VAHni2GCVOGaihWlpaY=;
 b=nsMvrs51rejWz73jurRgEfyVafe/0S1AJ8ECLlIkyBMNEpQP4wXTJwWSsSqwjqW74m
 UtjhnfX5Sb33CfG4jJhgi/se+1OxZAQ6hoyp4R2MhFashMpnmmXYnxoaNcGj0KpE+scY
 mRnt4d5Tgjfyir6b56whz7DlW6gZDcYtaggFSdPSEMJ9XPgTTwB0rKvPdvIq4Iprzw2n
 4IACEa0nlOFhTmQJ8CLjfalYHXr/UmjdOvvd+xWt493G9H0yNV3OFvE2rCeqBcSMkDwX
 PmBn/baUqYubDN/Y51MGj63g63TxdzPDWygFksJt+YucTW/YwI6Ht62e0GWVbBbTOZml
 c0nA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nsMvrs51
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.68
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 3adca75140..1bf764b621 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  9ee7ac57b188d391cead705d3596a6d3240341786475149db297782a52269aa5  ell-0.65.tar.xz
+sha256  ddcbf381d758f61a02954bf5d2907c8900462abb7b2dcf45589874978bc10125  ell-0.68.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index a682635539..4fe5fa7c56 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.65
+ELL_VERSION = 0.68
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
