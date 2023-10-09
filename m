Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33B2E95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 08:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 836F9820AE;
	Mon,  9 Oct 2023 08:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 836F9820AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUb9pbth3rRZ; Mon,  9 Oct 2023 08:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E334E820C4;
	Mon,  9 Oct 2023 08:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E334E820C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 400741BF355
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 08:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17A0040920
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 08:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A0040920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rbcoyi5Sxd5Y for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 08:06:29 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0DD54091F
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 08:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0DD54091F
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3296b49c546so2335442f8f.3
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 01:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696838787; x=1697443587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QGDG6dpCKgwH2LcwWSd+oTE7e/IGuo2Wxu2ZtdqkiBU=;
 b=H8b1fBNqFMhJVaLJaRMIenTBuFi+UC0sNaGVYjlormrE/j19A3WOVj4j4W+umPLDi6
 UCm/b7LLaE9uP1OqmWGHKsFeSopKpef4XevOj6SXTrEEfTAFwJjGG+faOLp6JO7XGh9V
 P3OmtrjwkFccUlajGKgLCG16n0Y6eJ4OsoHP8EGXW+QU0E+7JDNwnA+mv9p/i0S9aJ4q
 /cpDKXDV4iNJnWjYWPyi5/BiQVC+qI7inkRoguqI/wi77MgS20uzsV6+5vx+7pdiYGyb
 zL9bsPNaj5xCMbU9d6IbTRAhpi/9POJ9qBPa9DNZCiz1iHSYpKlR/6wIMeI5tOs3wyx8
 80kQ==
X-Gm-Message-State: AOJu0YxJa1GqVFZm7ZnH9MpNnOwrpDkBKmPogcniC/EdH4RdHtpOfb/R
 zLurnFEL+EBt+vdoI43htcxb10qwi2PQaq/cEh0uSjSR
X-Google-Smtp-Source: AGHT+IEIRLmgEDb02mG3xP4X4rOXmot5t/iBWCZIiVvdnFaN/m7vQ7jgNKPxxZG8yF+HbpLk8zCBug==
X-Received: by 2002:a5d:6445:0:b0:31c:6420:ff4 with SMTP id
 d5-20020a5d6445000000b0031c64200ff4mr11344631wrw.36.1696838787188; 
 Mon, 09 Oct 2023 01:06:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4b0f000000b00325aca09ad1sm8902521wrq.24.2023.10.09.01.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 01:06:26 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:06:11 +0200
Message-ID: <20231009080612.23347-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696838787; x=1697443587;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QGDG6dpCKgwH2LcwWSd+oTE7e/IGuo2Wxu2ZtdqkiBU=;
 b=c1Jh/I2wprd3EDKUfHmpOLiBTHWf3X0leHgCI6924TlEyKIbceyluO29uikUQyh8S1
 Sbxss5JTU16YOso8PLX7euRnqpDdoiH9cH5Z8Pva15Z/EINg75KHsfNpJ40kpnqt4Xld
 Ro0e2Xs4AtObzdaAJrso0HU68sG9UD47Wvo/w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c1Jh/I2w
Subject: [Buildroot] [PATCH v3 1/2] package/refpolicy: bump version to
 2.20231002
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index a09e59c270..70d1acc9af 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
+sha256  c89cd3b2e5d99765cc24536fd8e76de83951ad23e05472350328b5a4f8bee410  refpolicy-2.20231002.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 8fea7cc254..fb1c213b84 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20221101
+REFPOLICY_VERSION = 2.20231002
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
