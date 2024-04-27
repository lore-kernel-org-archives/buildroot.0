Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787D8C10F16
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A06F60904;
	Sat, 27 Apr 2024 18:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJSYXvzHaiMh; Sat, 27 Apr 2024 18:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B0F60A3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B0F60A3C;
	Sat, 27 Apr 2024 18:38:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 831FD1BF870
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40DB36081A
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QC1KfVZ0Kz43 for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F1CA606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F1CA606DC
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F1CA606DC
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34be34b3296so2310046f8f.1
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243087; x=1714847887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f6bkitNSmzfFwZ/1peJeJwbiuAGC3/dAW4rxzyor208=;
 b=dUO4gxuUuoOlgJk4zsi37CeRVumP4tVIP9BhtEe04LqoU3Br4nltpyF2h1M2u6P4Wv
 H50Gc7gRxtK0PX58jEAvztx6mjYDlRrMOosbBiU239bvanf5rFNqVti+qHiKS54KFOfy
 /Hk+OVczbokiCJpkI2Db1BG4pP/xIBsrtvXcPnZNoaZYU9GRtTbWxZNK+x3XTsAb7BZk
 1jEYym8uZcYveDiTsKzSBJ3I55xPT+XEMRvJRU33olhDv3k84K85FA4062oNFTItHHFh
 DDYB63PuG+geVn+kODqw+4a/KgExB6SAsBsTYC1spaHCjRZZj+x6SSCg5tA0KmCmF+Uw
 7WuQ==
X-Gm-Message-State: AOJu0YyTUFhPfvp1LBm3Ja8F6tKaP03afi9kGU5PSkkZB4RXSuWwzsIP
 VpyyRuHoDXtlKOMRpYYjB4EjnxJPGAF5Ioh/1yz2LsmfXRcwFnRfQcLi5A==
X-Google-Smtp-Source: AGHT+IFOSL5DRVIy5Rc8g7FzFPjg9vigRAwYkaS3i1nxJ0Jf9icqVBVY6s9dzIinjg0s49xNQWalwA==
X-Received: by 2002:adf:f991:0:b0:348:42f3:3d37 with SMTP id
 f17-20020adff991000000b0034842f33d37mr5115559wrr.20.1714243087375; 
 Sat, 27 Apr 2024 11:38:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:07 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:57 +0200
Message-ID: <4b1afde0603fc9b68363a54f09c027a0c0898ebb.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243087; x=1714847887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6bkitNSmzfFwZ/1peJeJwbiuAGC3/dAW4rxzyor208=;
 b=ZP5eK9DhmqjCwmvrvpAs0HOwHJZbYTzW9tN7DGJ6effXfU6aBdWdOF5pUhqv6WeWwO
 9T9452s47XqDKZj1gwLWYCYxEXrR3eG1wmbeAdcr76I7+rDoCLYLQqZnaTse/vzg+gjn
 GNe5gUoMTcLivjNbqDlt8tZ2Nd7XkpD6/856CDRgS2HFAtIP77unga8VnmVkjhwTjguy
 kTRKwPqayTObYr6NaaxNQJ3Lv//1OzNdoo85tEIYjtjUIDfWpjCwnRSBdaUAqbiXNMdN
 SpOK3Pubzd8bcrjpPWlIQXKeQ8Vk+qtiS/G3jFkkn5wUPVPiv7sALi1lY3CvM8ZEQKQX
 V+SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZP5eK9Dh
Subject: [Buildroot] [PATCH 10/15 v2] package/pkg-utils: add vendoring
 mechanism into generated archive filename
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we change the way we vendor packages, either because our download
backend or helpers evolve, or when the vendoring tools themselves change,
we must avoid generating new archives with the same name, or there would
be confusion when using older archives with newer Buildroot versions, or
the other way around (and that would mess with local caches, like the
one we share on s.b.o).

This is going to be the case for example, when we enforce a better and
more reproducible set of modes on archived files in the following
commits.

Introduce a version suffix for post-processed downloads, that we can
bump when needed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6181ae7a99..d1964299af 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -48,7 +48,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
 # Helper to build the extension for a package archive, based on various
 # conditions.
 # $(1): upper-case package name
-pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD)).tar.gz
+pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS)).tar.gz
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
