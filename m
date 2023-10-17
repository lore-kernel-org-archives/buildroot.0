Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B77CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 13:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7566A40B03;
	Tue, 17 Oct 2023 13:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7566A40B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEDe5FVYJBLn; Tue, 17 Oct 2023 13:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47DF6416EF;
	Tue, 17 Oct 2023 13:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47DF6416EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7EFA1BF267
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2353820C3
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2353820C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRx3JuRtSQry for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43102820BD
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43102820BD
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so54442555e9.0
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 06:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548390; x=1698153190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLys1b6LNJhmcDGUgxlZVUrFkqG0U16iYWUW+fHvBWI=;
 b=OiWAO489TabnOZRhWn1ShNHzAeukYeP5X1eRViyopbgK5d+vHfBsZXnXq82wak1UZQ
 v2cC+BOVcv5pyY3kUT/t8XVZHsTR8ZE0+g2BZ9F9y8oX2afxvKJwrKIeNeJiJ+kUWWfR
 uW0EPgHAo7obb8UyTLmA/eHpxY7TdZMi+XEhr08swWy2ZVTVw0YkRImO4VpWORaG0LJ7
 EPwjHk+vdFIfdeCU+EG0xNVrMymLT4irFrBT57DBu5VKjg3khfSu9nNNp9HQZ1JumeRd
 Pn77XGRZRPDVoa87yAERdNjdweqOn07320vzwLSFw6tGqkLbtOpX6wyM81PR+iHcrDjs
 TkZA==
X-Gm-Message-State: AOJu0Yy1ru8/JAUgxpCNRi76BlRDMxm+RalLjvY5cJiZhWAvjzb/+ES9
 ZXcFtvg0WZoE+/9MD5TkT9Ivj3dxIedI5a/VhD0s6hBfbUguuQ==
X-Google-Smtp-Source: AGHT+IHcrHncSkeKr/iLmoT1CkfkAhYmCFo+mnZwB7OCsAZ6mK+t6XNrXkFZDVyWtsrrvL2I5l0dtQ==
X-Received: by 2002:a05:600c:4591:b0:403:cc79:44f3 with SMTP id
 r17-20020a05600c459100b00403cc7944f3mr1823065wmo.19.1697548390049; 
 Tue, 17 Oct 2023 06:13:10 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05600c319a00b00405588aa40asm1880730wmp.24.2023.10.17.06.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 06:13:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 15:12:57 +0200
Message-ID: <20231017131257.2211225-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
References: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697548390; x=1698153190;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLys1b6LNJhmcDGUgxlZVUrFkqG0U16iYWUW+fHvBWI=;
 b=O8zaF+fQJuNdBp9+wby2GkBY2x2nieenYHLC64EHNOLTEBNB/7B9Eqy7+CbGeJICtS
 P+qpuzyATzfkVFakvTveh7Y1HSphYWvuv+ccjX0QCVShw7WzX/UgKwD5xed0OemUsYzh
 XrzDNCzD6LQYpZhj46J5Zv7WpikDzHqE5JbM0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O8zaF+fQ
Subject: [Buildroot] [PATCH 5/5] package/flutter-pi: add charset converter
 plugin option
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
 package/flutter-pi/Config.in     | 7 +++++++
 package/flutter-pi/flutter-pi.mk | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index ecebfad89b..45b6b4faef 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -23,6 +23,13 @@ if BR2_PACKAGE_FLUTTER_PI
 
 comment "plugins"
 
+config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
+	bool "charset converter"
+	help
+	  Adds platform-side implementation of charset_converter plugin.
+
+	  See: https://pub.dev/packages/charset_converter
+
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	bool "gstreamer audio player"
 	depends on BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 81034062d6..7798b5c513 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -27,7 +27,6 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
-	-DBUILD_CHARSET_CONVERTER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
 	-DTRY_ENABLE_OPENGL=OFF \
@@ -43,6 +42,12 @@ else
 FLUTTER_PI_CONF_OPTS += -DLTO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN),y)
+FLUTTER_PI_CONF_OPTS += -DBUILD_CHARSET_CONVERTER_PLUGIN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DBUILD_CHARSET_CONVERTER_PLUGIN=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN),y)
 FLUTTER_PI_DEPENDENCIES += gstreamer1 gst1-plugins-base
 FLUTTER_PI_CONF_OPTS += -DBUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=ON
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
