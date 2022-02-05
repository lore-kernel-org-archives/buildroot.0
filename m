Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6533DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 18:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D088C4055D;
	Sat,  5 Feb 2022 18:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xz_XCci6vHwl; Sat,  5 Feb 2022 18:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBEAA401F2;
	Sat,  5 Feb 2022 18:13:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DA231BF41B
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5470A401F2
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPFY3eelAI8k for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 18:13:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17B9340156
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 18:13:04 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id i186so8035275pfe.0
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bVN2N6ho91N3IX/zpnPrIwheeUdAqZ1m8rcqGlR14Ic=;
 b=VdMv+TtQUM7Et3Qu0Yh4P3MTA7Fz6HL7BSBgxXbCsH3R66UdfUt16ouVijSdRCsDMQ
 UsEFiemsCdPEATq+fS0sr5lFaiCJoZcZ+4KD/2vMZd5HuAbkllhsz36h/i9l1MWsMRAy
 JPRZ7FEJJXT6iBzEQcHmHiunPWE10MNE0w4JGJNrjdSBz8hx2lrX0DrpK13cTNuuoKD5
 mPjb7sBTHu4kdPKcvqpuCNUWThpMdNRzkHigx1Bah3TQfxb7oO4Clkbf7JI60/VO3PEf
 6GMgo1N6M8KlrHWDpioJAV3gKptj2acFLXR1TRm1VXfpsCRlIxfepDIx2T4LDcJVY4P9
 r0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bVN2N6ho91N3IX/zpnPrIwheeUdAqZ1m8rcqGlR14Ic=;
 b=7Htb25wyC2Wnd+DD/R2fdSEMscfzRMfzuxC1e10V4pluJ5gwYfxNq6TOnZkMGdgzeq
 WqAxtcUqQ4+hnzZ88wbEspNqJ/AWVCMbGPnVXk2fbElsTXg+AlJoG6sAdZi2o3GkYqEo
 fXSjOAdDxAUVAnfYpwMs+Ixs0lVSUoHG63njIFJftbnXbIIXvL/LIfy6Zx972C2dIS2t
 6Oab3cIvjsr4z7BMGFpYrFHKhX2SMdcehPUsCXj5WXg6WGP1lz0Mu5UvNw8o2ZRlsIFR
 J5mE8gx7/7+xZQfoWY9fKh1pQ70hrRfhcQ0QD/Y+abEmNmjXK1t/zKKa7Xlfog4QIP7Q
 nnwg==
X-Gm-Message-State: AOAM531pUMLOl2KAijvy4k33+aAfE1tE4wWJFdEZEdM3b3bhAw2rC7OG
 znjgblOz9LRERkotlsHYUVfViOJJLp1XcQ==
X-Google-Smtp-Source: ABdhPJy4W/1LwqUuOGuGwiLP/AFB1QZgPIeDerwWxbVc42nb+5IKxLnx3OCcLyhrNxFsMblGalZxSw==
X-Received: by 2002:a63:8b42:: with SMTP id j63mr3719662pge.551.1644084784284; 
 Sat, 05 Feb 2022 10:13:04 -0800 (PST)
Received: from solsona.hitronhub.home (S0106f81d0f601923.cg.shawcable.net.
 [174.0.44.90])
 by smtp.gmail.com with ESMTPSA id f9sm4370750pgf.94.2022.02.05.10.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 10:13:03 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 11:12:58 -0700
Message-Id: <20220205181259.5831-1-peter.macleod.thompson@gmail.com>
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
