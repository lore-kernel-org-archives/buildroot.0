Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C7BE95A65
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 18:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E4640438;
	Sat,  7 Oct 2023 18:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E4640438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJgyPoKMOXog; Sat,  7 Oct 2023 18:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E78974185E;
	Sat,  7 Oct 2023 18:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E78974185E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23A9C1BF59D
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0964760F1B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0964760F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8700AoyKH9G for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 18:04:45 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E89D60BEB
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 18:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E89D60BEB
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4054f790190so30902505e9.2
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 11:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696701882; x=1697306682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGDG6dpCKgwH2LcwWSd+oTE7e/IGuo2Wxu2ZtdqkiBU=;
 b=o6jqiMc5N3eegpb689QMPDFCZXluX4CyOX6mYn6H0v8qt5B7bXnAbTAaP5vv1vz94t
 mqIzWMEmRQiiQUipSRb9OJeDzUUnHAh/57lnGKfs7bec3C9AjBFETcR/mZ0SzaVctLP4
 ACw4HU/uloTxG81JaqryOA47o9woO/kWyN7ukqLZKr0l499t5YL7BLMcnW7a/VWOYpze
 eWUi2/9E3VLY5jnuSit60Z3mc9WI/N+yqAOMXlhGYcDv1/iRlCCNmwTSqfY/u5KBy2ad
 LgRlBhDUzN72olMM7ra+WK8MYJG/w/I74omX7j1RlDwWXZ76vTZQDSV/KAQuO0l8mWJP
 m/dQ==
X-Gm-Message-State: AOJu0Yxhg8Ffot4GKXp4rAROaYMe0Wup6KlSBFsTi5mIXUMkYiPXIeGG
 vWSv2gppgQJKAPCFxe5MX60KmB2hfZqHKo7uBTsBgA==
X-Google-Smtp-Source: AGHT+IE/JB72b1MHNptFxoG6yb6S8QYB1RuObUHCorKtQCxKH6yYYuxI3rMVKCqS1BfniHO3PORl3A==
X-Received: by 2002:a1c:ed07:0:b0:405:37bb:d93e with SMTP id
 l7-20020a1ced07000000b0040537bbd93emr9146412wmh.9.1696701882619; 
 Sat, 07 Oct 2023 11:04:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a1ced0b000000b004051f8d6207sm6742601wmh.6.2023.10.07.11.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 11:04:42 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 20:04:30 +0200
Message-ID: <20231007180430.1069138-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231007180430.1069138-1-adam.duskett@amarulasolutions.com>
References: <20231007180430.1069138-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696701882; x=1697306682;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGDG6dpCKgwH2LcwWSd+oTE7e/IGuo2Wxu2ZtdqkiBU=;
 b=rJ2LQzVtfIsCGoHKo5PIAlSID+iKMdNV1oO4W8219dX91g7f3gtWik6vR4NrKAVTAf
 uG/yPhnF/J12H2Ixu2QSNieJC5Klj1iQdMrUd3jxMEqYw7AfXKATCBr3PZ/XHsR6TGou
 dDuaZy2A47fkSr7RqTtDyMma0GlragnpiYP7s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rJ2LQzVt
Subject: [Buildroot] [PATCH 2/2] package/refpolicy: bump version to
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
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
