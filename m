Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AB2C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A43ED408FB;
	Mon, 18 Dec 2023 19:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A43ED408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aY7nTmSiYYep; Mon, 18 Dec 2023 19:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF8F740910;
	Mon, 18 Dec 2023 19:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF8F740910
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14FD61BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E184660BEB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E184660BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZXJRQtYSYNo for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:06 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6E7160B50
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E7160B50
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d32c5ce32eso32828115ad.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928405; x=1703533205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NnZqJ7YcRCnCFhFeyHlU46GXe+jh06H6Dsao1EhjCsk=;
 b=XwMlKtXMOqqOSQhEK8UnjAXzUFhpuoyBahWbjO79yBZS14/yqeoJwJh575NfyHFrlf
 TUEXaV3OCdmRFXE9kX4thtscRsLNxjc0fThWS6JmgkO6msmjssxMTvFRaLseZoDg2cAd
 8fajOFdALeLXvomU78mpPnE+f3ixNCt6+8YunEckKYyN+MtqQIudZYgnwXqryhYVinfL
 7ql+oNy1cQyuDORvuPkL+ywOV42kVlkiXn9jTJTGTjhivQtX76aaCQTEykBPk1F/EaE5
 hZffu8evNA5pi/t5AHUovfKA0+rss4mQuAV+Z4gnbaEVnggXpl6VDXghLI58HCGfmOJ4
 UmnQ==
X-Gm-Message-State: AOJu0YxWsPY/aH1Jug+jq8CxPplgFqdHzLblyhP7T5Yzw/7SCBC+mqek
 Qv3ocytSOUU/boj6Ofknezo7j7UQje7CjKN6iAQ=
X-Google-Smtp-Source: AGHT+IHkmpCMNsGs6COWDKEkY6LFtknxilqz7XCbOgfMw2Pz6CdTOoq32ZbfTqn6pNhgQnkHE7oFgw==
X-Received: by 2002:a17:902:d4ca:b0:1d0:6ffd:6108 with SMTP id
 o10-20020a170902d4ca00b001d06ffd6108mr23046051plg.42.1702928405094; 
 Mon, 18 Dec 2023 11:40:05 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:46 -0700
Message-ID: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928405; x=1703533205;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NnZqJ7YcRCnCFhFeyHlU46GXe+jh06H6Dsao1EhjCsk=;
 b=gmYPq+JdVdopSoSkZtoZdmCbLrhVERfEH7M1YDgor/z1yBXo/BpqOxl/bLdw0Pi+8R
 IoYe6T1QpuTABFSAq9JG6Tj0Yi0DhOo9/rgHqncqLyMFCRe0w1/3IDnFMLb4ATaYXpgh
 dskhU7CVlmnyvJIJfEFKQuUmrl0/iL5Iy0Joc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gmYPq+Jd
Subject: [Buildroot] [PATCH v2 01/14] package/sway/Config.in: Remove
 duplicate dependencies
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
v1 -> v2: Add to series

 package/sway/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index f8d073520f..26b5b2ecea 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -2,17 +2,15 @@ config BR2_PACKAGE_SWAY
 	bool "sway"
 	depends on BR2_PACKAGE_SYSTEMD # is required by the sd-bus provider
 	depends on !BR2_STATIC_LIBS # wlroots
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
 	depends on BR2_USE_WCHAR # pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
 	depends on BR2_USE_MMU # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	select BR2_PACKAGE_WLROOTS
 	select BR2_PACKAGE_JSON_C
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
