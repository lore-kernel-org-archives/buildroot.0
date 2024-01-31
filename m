Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C5FC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7DB844C2;
	Wed, 31 Jan 2024 20:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F7DB844C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ct2tMoHIshHT; Wed, 31 Jan 2024 20:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A26784437;
	Wed, 31 Jan 2024 20:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A26784437
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14B821BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEEBB60B22
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEEBB60B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdbSPX7DlsP9 for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:17:57 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 454DE60B1A
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454DE60B1A
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d934c8f8f7so1641105ad.2
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 12:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706732276; x=1707337076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xeGkcCaGtbqKRrVY+c4dbRrovF+pImnz4N7EVPJ6BqE=;
 b=seFk6Gl80mysPglB+/O+4YDCodBeDZ2airN1s62e/TZBXN90OgW/MrXI9nn+ysf3PC
 H4X2Yx+DnvMYconoJtdz3uDzHxdsr1sqBfLLqBNo48uJK3pF1W02lNcGXXl5a1g3lDbt
 z+Ve2/WdF2LxAU4XhjyDiLAo0JT5lqauhVxROHGsgrQWTshHCuxJBsf9fVvYcSMh15+H
 HIg31sCeSPdWxg1M7gPZoyaGrPz64RFoNw/YB/9+UQX95DClJpv/s79Aqm8Dvx5MbktR
 CKLuiPnUPWNe+ePo4SL36DQ9cJ2AIyvyx5oNJUVDhXxwIw727BZpAtLJ/qSeFCU9A7KJ
 0VIA==
X-Gm-Message-State: AOJu0Yw33ChXHv6tRqV9XKzE6A74l+2fwhNuv/yQKxVgVw3hCgTXGrsu
 sKxZmlmY0t3DPM9t5U7lyWyjATw7I9z/v66r+OUSr7BnxeA4q3fg2xvTXxMs
X-Google-Smtp-Source: AGHT+IFEBw12sOY3NI8dEJ6wdVRhWxdyIHX22jPYxcnONAaVij2v3y4BfIbMNF4noPeNHvTSTbF52g==
X-Received: by 2002:a17:903:2584:b0:1d4:b60f:1de5 with SMTP id
 jb4-20020a170903258400b001d4b60f1de5mr121828plb.26.1706732276204; 
 Wed, 31 Jan 2024 12:17:56 -0800 (PST)
Received: from blastoff3.hitronhub.home
 ([2604:3d09:c74:2000:8c07:f573:4ebd:aaab])
 by smtp.gmail.com with ESMTPSA id
 lo4-20020a170903434400b001d8f1616a05sm5269223plb.91.2024.01.31.12.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 12:17:55 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 13:17:47 -0700
Message-Id: <20240131201747.23175-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706732276; x=1707337076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xeGkcCaGtbqKRrVY+c4dbRrovF+pImnz4N7EVPJ6BqE=;
 b=RNEgfSo59/ePMVHc0uvFkBQTSalt3GLYol1+Sn0sTw6yzZ30Z4k17uzSbU9Dc2ZFiM
 JhAyXP4e9J8IuPYvb4sBSITjO2lHeZXd8/sQL5RIKVbByehTeHWO9PoML1Lf15qHaPjc
 qYoXIX5LRvjEZNNnk251Lb5yDPpDnGVTNhiynuT7laav8ZktOF3YhmzdmLmzfMIbPHqd
 3TFDn9wo+VndmLFx9pmLZjWaH6a+s6QaLPUo7/93ICvzJ0B8ykuG7RTLWA83vcXbzW2z
 6cqMclQiTpK9+pgZcD73y/pBZ3HmVAMfd5cdtZY7o5yGm8Nme1gWzU4CwDhgvNtXpq8l
 lACw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RNEgfSo5
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.22.0
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
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

Update LICENSE.txt hash for change in copyright year to 2024

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index f43ec790fd..7693aeba6b 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9dc71ed93487521b107a2c4a9ca6bf43fb62f6bddd5c26b055e6b91418a22053  SDL2_ttf-2.20.2.tar.gz
-sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
+sha256  d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723  SDL2_ttf-2.22.0.tar.gz
+sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index c2c4b660f8..f4f293cec1 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.20.2
+SDL2_TTF_VERSION = 2.22.0
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
