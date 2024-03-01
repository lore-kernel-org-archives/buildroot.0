Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B418C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 12:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14DA241942;
	Fri,  1 Mar 2024 12:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kj-NyAgyBOcR; Fri,  1 Mar 2024 12:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B093B4194B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B093B4194B;
	Fri,  1 Mar 2024 12:18:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62C681BF2EC
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D6C141E1D
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzN32m89Ya35 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 12:18:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.50;
 helo=mail-wr1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4386241B37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4386241B37
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4386241B37
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 12:18:07 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-33d28468666so1280219f8f.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 04:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709295485; x=1709900285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YWM0Wtsnm3eOl/McjV7awaS/yT5/HOy20o3N8AJeUWw=;
 b=NQEm+0xxl3P6RmXSntltp6pyQ624ByFnfOL4S1zyc4dNUdN5nD68ezyP8NBCttQpDg
 92u9pRUdG/EXznQsHHE2TPKojipunMNGmdYcwPztAzPQQHPEPHcmC2b0rPGa7jRl7lYm
 1twg92CCx77Qqq+s9VamMmuhYpUocyg9Et+JDKJVFIrgfZthI5o7sX0pl6jNxZqv2Mcq
 W34sf7U4eRLwdp3iFP4jIuAM92qeCzJQlUlIcOSUEPt6fZAkCp5MLKzxBp9+Gi2cHExr
 hb1qHvNYqYHNu4Sz4YI/gyCmlwhGxvgdIyM4Wdd3uwZVvO3Zl7MsjTB31I70VLw8PYVO
 F1GQ==
X-Gm-Message-State: AOJu0YwJ2ttahz7mh+eTvA7Dflujy6nRQr9xWaATGaOYoH6OLfXTzJhd
 8VXBoSY6eWC3nXqjjDv8C6R+UI4XWpcKYSy7qrfExa/n1LcF/Zx9DHEM0wJT
X-Google-Smtp-Source: AGHT+IE4DxrInfDooDZvR6dahIebjfxHQYzZQGIxPjiT+CCy3W9obU3ylQ16fEa3WOLNwoLHuaCsWA==
X-Received: by 2002:a05:6000:1756:b0:33d:2474:5aa with SMTP id
 m22-20020a056000175600b0033d247405aamr1122444wrf.40.1709295484638; 
 Fri, 01 Mar 2024 04:18:04 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:21b0:b5e5:77b3:1dae])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfca92000000b0033dcc0d1399sm4457802wrh.25.2024.03.01.04.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:18:04 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 13:17:56 +0100
Message-Id: <20240301121757.52642-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 1/2] package/sdl2: drop video-x11-{xinerama,
 vm}
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
Cc: Michael Fischer <mf@go-sys.de>, Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support has been dropped since the major release 2.24.0:
https://github.com/libsdl-org/SDL/commit/7d7ec9c95146c44d4b4643ed552796bf07937057

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: n/a
---
 package/sdl2/sdl2.mk | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 42b4a433e8..eb5042e3cd 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -112,13 +112,6 @@ else
 SDL2_CONF_OPTS += --disable-video-x11-xcursor
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-SDL2_DEPENDENCIES += xlib_libXinerama
-SDL2_CONF_OPTS += --enable-video-x11-xinerama
-else
-SDL2_CONF_OPTS += --disable-video-x11-xinerama
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 SDL2_DEPENDENCIES += xlib_libXi
 SDL2_CONF_OPTS += --enable-video-x11-xinput
@@ -140,13 +133,6 @@ else
 SDL2_CONF_OPTS += --disable-video-x11-scrnsaver
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
-SDL2_DEPENDENCIES += xlib_libXxf86vm
-SDL2_CONF_OPTS += --enable-video-x11-vm
-else
-SDL2_CONF_OPTS += --disable-video-x11-vm
-endif
-
 else
 SDL2_CONF_OPTS += --disable-video-x11 --without-x
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
