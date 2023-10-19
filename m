Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BE9CDB483
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 574924010D;
	Thu, 19 Oct 2023 07:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 574924010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbtkyOKC7AOH; Thu, 19 Oct 2023 07:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57ACD424B8;
	Thu, 19 Oct 2023 07:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57ACD424B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31DB41BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BD166FAC0
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD166FAC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hinX07yb8jQI for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:46:29 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05D8E6FAB2
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05D8E6FAB2
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso14084725e9.2
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 00:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701587; x=1698306387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLys1b6LNJhmcDGUgxlZVUrFkqG0U16iYWUW+fHvBWI=;
 b=u808PhqMpY6aVh9J0LR1boaeqJN2Hu/0bBe4Vpa3arxZAakel6USLI8uZn8XBY09x8
 xLdEC0HUyy6AQrYW2mNrT/mwLUKbyN/XANNu9AKceox5OHqYzlKx6o1KUITyJVJu6kW1
 J+qshlo22inFCUb5q9A/CzalYbMR8Tna1xSnDMB7git/M8OKDjuIiuIlE7nDv2yH8a8e
 nnFxUVB1ArY8yF4uOAXEPU7NXWPVpXh7l/+iI6UoMm/eWjucT0aOJdpEaW3HZCPu3F8J
 0Kf9kPfCo854PX2QV6EjaRBBBi9xxQi0wi4ZCOnn+mhSyEaAiAXhAnbDGHSI2kLZueDn
 0N3Q==
X-Gm-Message-State: AOJu0Ywu4Vfg5zAqtCKfjhuPdExm9fNV0LlOdFOugQCTb2caCaJo2tSW
 +lETLUq10M9etRWQlIRKOPSgxkA1bN9wmY5EZC0NbtBH1iU=
X-Google-Smtp-Source: AGHT+IGEB4RJqgUoSbHTxp8JyG6yEuMDwPEDSkncdo9cPSNQuNNfep9kOCZX9zEbcTANbyzjcMOHaQ==
X-Received: by 2002:a05:600c:1f8d:b0:405:36d7:4579 with SMTP id
 je13-20020a05600c1f8d00b0040536d74579mr1152158wmb.28.1697701586967; 
 Thu, 19 Oct 2023 00:46:26 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040535648639sm3739268wmb.36.2023.10.19.00.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 00:46:26 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 09:46:15 +0200
Message-ID: <20231019074615.1672645-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
References: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697701587; x=1698306387;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLys1b6LNJhmcDGUgxlZVUrFkqG0U16iYWUW+fHvBWI=;
 b=fLYa5pPZQEW/fqDmuunblj5yhpBbZ9r/YEx6BTvRjAIyyGGOp0yUkGb48+P+4qv8BK
 WRt2bQMdgw+Fkk8/gmnQ30s+pigVvLcUYpjNxo1hFQeKZhvvU9AOfARbNpsDxqE+F7Lx
 D+yHNzTiaK8SARm09i9gY7DP9lzNp9HX0x6GE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fLYa5pPZ
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
