Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DACFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDDC881369;
	Sat,  5 Feb 2022 16:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKWEIt0G0QX4; Sat,  5 Feb 2022 16:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 254DC81300;
	Sat,  5 Feb 2022 16:05:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 245BD1BF429
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 16:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 205746080A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 16:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbIQ4WBpyH9Z for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 16:05:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D360607F9
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 16:05:17 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id c3so7746787pls.5
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bVN2N6ho91N3IX/zpnPrIwheeUdAqZ1m8rcqGlR14Ic=;
 b=WVaZB6vkCy340swvG9T251yRk1kRfN59SC9cGTW/Col4XbajFdvcK7aYh3q2KIKgmq
 YY267yz5+w7ihlcha0anzK8fI4YfC3ZdHgnLmHv/VHYhq9D99G0L3DMkr0WbIDpcs56/
 eRmKlmLt11++U4eQ/83+sG+gcVFWvRkukxjP9MBvbduZr5YjyOnNDVbXqPMKtpcZTRTK
 2Dy750wOG/eUXdprGTRGtdnB0P5e2zvNCSY1kOhtkf6QRg+FCxwacZ3wWJUpMI1rM6A5
 qJHcaCBcovNITw4HMUA1jPfT9S8V0NElNSNayTzKK6J+Z7oss5zCapXeg+Hbq0Vv1aOM
 GHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bVN2N6ho91N3IX/zpnPrIwheeUdAqZ1m8rcqGlR14Ic=;
 b=ogV0IXn1ZJUdFBrqrBR4R2nOW3f+94BOeMZwPDr47Ndogsv05AEfflb0PIDpLQ4bJv
 hVWefWnEQShb1xJ8J+fh4ZPnvuMQuS8+hkS04xh5mmBucrK2VEyBTp+bOdC5qAB2on5w
 E90BEOnQXWKR960OuTtuC74oSuuApWkKDxFxsKVqj1W4UB7nR6X7bzGnT5xIHm12TYOW
 doq9HCKWJfIfqFwYIHCpEMgPwGQkELUQw6YlSTeoheTnN1uB9Qm2HH+AZEMUtvyGUX5J
 o3ufkaWkZug6Npev7dw2LxGlGne4ICLoC0cSCyTRVwt3RKjnBvYYyPTbyWcWyRnILshf
 W1XA==
X-Gm-Message-State: AOAM533zuH+pAMdoWe4+6rebqivJI55cCtC/0FXDfrg8NhAyyoOdlucm
 +OknUwbKc2tyoa0ClPCoQAOjjg/ferRVhA==
X-Google-Smtp-Source: ABdhPJxnN23LpgwFBOOS7g6xHOf+j8/ltRnbXO3H9C6KxbfFnSt1stlGEKduiiNPRgBAyZj7qHUwrQ==
X-Received: by 2002:a17:90b:4c43:: with SMTP id
 np3mr9253180pjb.88.1644077116439; 
 Sat, 05 Feb 2022 08:05:16 -0800 (PST)
Received: from solsona.hitronhub.home (S0106f81d0f601923.cg.shawcable.net.
 [174.0.44.90])
 by smtp.gmail.com with ESMTPSA id j12sm2046256pfu.79.2022.02.05.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 08:05:16 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 09:05:11 -0700
Message-Id: <20220205160511.4602-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] bump version to 2.0.18
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
Cc: PeterThompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: PeterThompson <peter.macleod.thompson@gmail.com>

Signed-off-by: PeterThompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 16459e4a59..a490b002b6 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
-sha256  f6370809c9f644760920d9945c5be07aed17664975f2e4741013d4d9a2ec696f  COPYING.txt
+sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
+sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 326cb99366..1fe7c0a075 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.0.15
+SDL2_TTF_VERSION = 2.0.18
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
