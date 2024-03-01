Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD9EC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 12:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22C12400B9;
	Fri,  1 Mar 2024 12:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrHuU3_rInRr; Fri,  1 Mar 2024 12:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE96D4193B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE96D4193B;
	Fri,  1 Mar 2024 12:13:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B0971BF2EC
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 281A441E07
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 12:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6voU--6nAp4r for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 12:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.44;
 helo=mail-wm1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 132D3409F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 132D3409F7
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 132D3409F7
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 12:12:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412cb54f086so860105e9.3
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 04:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709295177; x=1709899977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l16dmXGfD0wRCOmMiT93f2Uh5MC44txOy48mI9yBuTo=;
 b=AO8Y6Qlde0WsvYT0/gZa86JnCxDg9rS65UM612fs13m7DGzN3t6gyFqtTXxkDPcrgE
 AA2l9/IKKqeryUmxkozmgQAo6cYJ0u9AvQVE9DH4xgfxL9lRBOJ4DAfoGyGBdgYO6Sjx
 Ug3GUqlyT6JKZH49O7btf4i+6ZEALzrd2XUyMzP9bAbQg1t43JV1RO2ut3kZj/5hXpnW
 2oppnM6XokiXIY8UTc+RxetX8JcqGgIV8iUB/IAFDCed2ghISpHKbaQMycw+ezdYuusj
 UI0aK867kjtySatgYAAntBY+JsoBlOG5zNHI3kChf53SP9Ah/waofCBKLdkt1VCF69Du
 AKkA==
X-Gm-Message-State: AOJu0YxLdnnQoJCvx8C7YWAi1+HFfmPyXiCEjKfU04m8G14yaHOQW2yO
 oDfehy6rMwQa2jlYM7NXIIgTeOq5EAYiVyXCJC2LJmU251eIFRPwV6tXSKG0
X-Google-Smtp-Source: AGHT+IEyhS+GK8fLZM5a7Sgtdhhh3X7e+BdwdlA5XZ51fwLpDv9sNd2XC+VwAbYrj+cjI6SUZQXAMA==
X-Received: by 2002:a05:600c:1c10:b0:412:b704:c0e with SMTP id
 j16-20020a05600c1c1000b00412b7040c0emr1187823wms.4.1709295177122; 
 Fri, 01 Mar 2024 04:12:57 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:21b0:b5e5:77b3:1dae])
 by smtp.gmail.com with ESMTPSA id
 jj2-20020a05600c6a0200b004120537210esm8189417wmb.46.2024.03.01.04.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:12:56 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 13:12:50 +0100
Message-Id: <20240301121251.52287-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/2] package/sdl2: drop video-x11-{xinerama,
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
