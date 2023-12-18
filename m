Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169E4C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4BC040926;
	Mon, 18 Dec 2023 18:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4BC040926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSsnZWKdr1sJ; Mon, 18 Dec 2023 18:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE93F4192D;
	Mon, 18 Dec 2023 18:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE93F4192D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142BF1BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E08CE82236
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E08CE82236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDBPm3Spb0XE for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:50 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3FD782202
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3FD782202
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28b06be7cf6so1526209a91.2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925689; x=1703530489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iw7Z5G5RNYhjVu1OAl6PhKUamKXxSre8sViCYatWeaU=;
 b=vsIFqi2b65zRdSInlPUWWSRhIfG+L58fcEQ+Mt7BekcSO4gVQIE8hYSe4S4EAnmwxn
 9AMAtIq71WBKt8/azR/x7DVZvxd9y6J3vEuZwebKD+tmicISdJ48Hyl+Fq/3YjsFsg9z
 lGanwGjsJ3YRtgUSfjuM4epG+kCMeqd3/Xn/1vDDMO/pV4CYtITwsi6ROhDeqmTt+uv/
 hz/ddACKCrtOwFMGwhpWYSITyklxzxD3am/u/7qdI6r8FD9PYlldvmP20lnSbbrgEjaT
 s6toxlNEgX7tTBmenSIYYpDBSAyRSxpCweR2buPgO17E3xy0uvRps27DZiPerXX2byMR
 8xag==
X-Gm-Message-State: AOJu0YytMguP73jh33z7KzhJOe2y2ZzUGn8es3YTWa/uui6FoPktelsb
 NlYyCmpCNf5Lz6pFLJ3mHd5sWa1xsRTx1JDmejQ=
X-Google-Smtp-Source: AGHT+IHmtWEotvTT7OMmjFdpGq6zEM8pmHHSD/ApwM4OC9vkQWgy8FspQ9fXRzSA4blitRctp9id0w==
X-Received: by 2002:a17:90a:f2d6:b0:28b:313b:7cba with SMTP id
 gt22-20020a17090af2d600b0028b313b7cbamr1991865pjb.20.1702925688993; 
 Mon, 18 Dec 2023 10:54:48 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:48 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:32 -0700
Message-ID: <20231218185440.506995-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925689; x=1703530489;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iw7Z5G5RNYhjVu1OAl6PhKUamKXxSre8sViCYatWeaU=;
 b=aRKTNKKgMT/1gAad2/zB1TH6kqtChyKKxt77JGe5QNwbqejbE5HnoDuZyAILWr9Nt7
 YjzFkuBMAuBOo1OwjsEPYe4EPlW8HiaR7Lu5gnURutItRkvPW4/PvCtrwxxlTFRclqAY
 IpyYG4wEE1HTPBv9SK2ReVMdvLQcXlw9AqmO4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aRKTNKKg
Subject: [Buildroot] [PATCH v2 06/13] package/flutter-pi: add charset
 converter plugin option
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
v1 -> v2: add to series

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
index 4ec89bdfad..ab640d704a 100644
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
