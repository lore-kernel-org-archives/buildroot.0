Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31570C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E3B4168E;
	Wed,  3 Apr 2024 08:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aij0AjcT3CSS; Wed,  3 Apr 2024 08:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 198A141694
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 198A141694;
	Wed,  3 Apr 2024 08:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2378E1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98DF082023
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxbSIAAajxuK for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 865CB8202C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 865CB8202C
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 865CB8202C
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:40:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso650893166b.0
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133638; x=1712738438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QiTrRObMdVefrjPaPp1oNSOARpS2DyMCBEBQpTZbzhE=;
 b=aA4CS9AL9H3w/h275mV3YwM/tKMhgLBLyiOYWDPjaJhZQJiehedkaOA+TWx/4DvEGL
 eEicwu6TEJwYfQ1YkFkyTmyOthSt4CNpkgRKHfcX46HMl7asOFa/2Ov2Ynq5oe4rzrkJ
 YheAtEbJpYEGn4f8N0xcrdVvVa1dlCYBENQq5P8SSQcf5E3FbeidUOABfMcmFpB8p8ot
 1Sjzu69ZKRjVw8hwZpfmCaEvjV7UEhAPJA1xInYyccN3vyS7OvEGuU7vbR8btzMQdFob
 zWGLElMg5OL6Mg+eL+mqdClAn05VSK1XBmKl5EvrCJVJSXZ6eoiawBkfeB6bqKppqi+t
 Jawg==
X-Gm-Message-State: AOJu0Yw3vhxDtzuWk3TgcXWKWQrMzgSZCIS1BzQ+nCBk5DtJzIt9pleY
 nm6t1iSjaURQEiAS9H7nNwQUY6cU8TLU7W70pzNvIj3/Phd0wrNKZsfEy+T4r8X/GuX1e4AroJU
 =
X-Google-Smtp-Source: AGHT+IFwbsLRp7e7aB8lWazR2VC74E/GYfWSC4HkvcBbfg3Y59Hf9sIaaWSyApwAs8QPxJo9FoBAUQ==
X-Received: by 2002:a17:906:6981:b0:a4d:fda1:e242 with SMTP id
 i1-20020a170906698100b00a4dfda1e242mr10963348ejr.44.1712133638322; 
 Wed, 03 Apr 2024 01:40:38 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 n9-20020a1709062bc900b00a469d3df3c1sm7510691ejg.96.2024.04.03.01.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:40:38 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:40:29 +0200
Message-Id: <20240403084033.512286-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133638; x=1712738438; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QiTrRObMdVefrjPaPp1oNSOARpS2DyMCBEBQpTZbzhE=;
 b=l4Wk/Oy8g1drFYVUY7roQrXQampVsluvXunUHr0dUlEUhY/OzLKfjNYqoY2VZ9W2nE
 QwarKHOIVgYi6/bwzLLgVVaIojy0ml5mMZZPp25PkA10dlBlJ8FytGDmleMTjnwzpcUM
 QzwhnIldV6IQuko4VJWXpBBzQWgWoG+5n1reRxTYt62av96LTisSqk/xC2Rc5YBk7TUB
 IAQMGTIFa+FzZuycWJ+/oKwivaQgb4xVzFMGDx7F+Pml6tCs8Ew73hfJb5UIe5XPzi1v
 q6LwsEwsE4fUKAymzkqLIJ/59QRMNYg0xsglD4EEIYKHxlGFl1DM4rXJZ3l0YWMw4oB6
 wumg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=l4Wk/Oy8
Subject: [Buildroot] [PATCH 1/5] package/gnupg2: bump to version 2.4.5
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
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index c821afb55..8bb64c9ed 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  228b3984325fdeebc5e3f2d165c6419a5ebc28de  gnupg-2.4.4.tar.bz2
-sha256  67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6  gnupg-2.4.4.tar.bz2
+sha1  ae0935ead29a2dfa34d6b48d70808652bc3ca73b  gnupg-2.4.5.tar.bz2
+sha256  f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277  gnupg-2.4.5.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 986da4790..39b0a066f 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.4
+GNUPG2_VERSION = 2.4.5
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
