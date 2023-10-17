Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D6CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 13:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D04A40AFF;
	Tue, 17 Oct 2023 13:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D04A40AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1vKtz0oJZwJ; Tue, 17 Oct 2023 13:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B5E340A78;
	Tue, 17 Oct 2023 13:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B5E340A78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 711BF1BF267
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57775417BD
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57775417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2R09BTirEnD for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D4D141DA8
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4D141DA8
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so61376421fa.3
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 06:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548389; x=1698153189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87Tc9xkpgXBLFA4WClUoTxUIXhZ6QCJkLp3FoyCxGOM=;
 b=CkGx0BYnTBG+kHGezDeCWZgRPi2KoV18wEaabrXNfC8BdLUdzJ5Hvk3k40xpHJni9R
 MOd5n3gzrrx5E54OKGCw0FlkDO7KwDJSATSq5LogmT1LAqhiUvat2UQZeoe+pPQWDISE
 k3KffHu2AzywlJ02n+zCbor+bQKr2Ta11xARKmalnnBFQjhOZs/IOFn8uv/X/aHl/31f
 zDGzxuMV5/jOxpysFcegy/p80b1Wxgw/Xdf+WE+9T7a8ETnvOo00VIujUijsJIyuRQAI
 3bC09hV8GBkI3J+3H1YLsmEizaChHoU7AElAQqqIu2M59hTIxIX446le49NkaYBNDeID
 ACJg==
X-Gm-Message-State: AOJu0YwBkY+y+GEdr4AtBD4rSbNiBdiNcaYq3YPYEhMAYGVA7PHnTZsd
 BdEv/0JdnRsPNjbsVW4J5G+SQH29Ifdbd56YzcdSXf5R8MghpA==
X-Google-Smtp-Source: AGHT+IEuNaUB2nR643+zkSLwmTftHn6ua/2cigbQ4EwqeqLx2H80AiqePc/kc9jR4f2ccp0CFgKlXw==
X-Received: by 2002:a2e:b892:0:b0:2c0:17bc:124e with SMTP id
 r18-20020a2eb892000000b002c017bc124emr1733600ljp.38.1697548389479; 
 Tue, 17 Oct 2023 06:13:09 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05600c319a00b00405588aa40asm1880730wmp.24.2023.10.17.06.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 06:13:08 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 15:12:56 +0200
Message-ID: <20231017131257.2211225-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
References: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697548389; x=1698153189;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87Tc9xkpgXBLFA4WClUoTxUIXhZ6QCJkLp3FoyCxGOM=;
 b=gzeHEwS1ZDlqksUjtr7ggNjjZTPeTrbp/A2tPt3q/IW9CZie70rtd9XH2oLKOsX4NH
 UpEJB0nsoCiKwuVbtL4BCP4AOZOGpJLf1r8rJjPtpcD9snnBXBcKJ38hvvcy6mTNACOW
 ovBX9pvsj2GQo/N5x4neGrlAXaGYmDrpbaHWE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gzeHEwS1
Subject: [Buildroot] [PATCH 4/5] package/flutter-pi: bump version to
 6a2873870f50e71b09dcbf50c661a44383104da4
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

 - Drop upstream 0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
 - Disable new charset converter plugin.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...er_surface-properly-fallback-to-surf.patch | 59 -------------------
 package/flutter-pi/flutter-pi.hash            |  2 +-
 package/flutter-pi/flutter-pi.mk              |  3 +-
 3 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch

diff --git a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch b/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
deleted file mode 100644
index 7a1a49b3d4..0000000000
--- a/package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 856f9849763535d62ed01b538ba23905875c93f4 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 26 Sep 2023 20:31:17 +0200
-Subject: [PATCH] src/egl_gbm_render_surface: properly fallback to surface with
- no modifier
-
-In 869fa7fcfbeb, we added a fallback to be able to create an EGL sruface
-when the driver do not support modifiers, like the llvmpipe software
-renderer (or like some proprietary drivers, like the MALI ones), as
-reported in #269 [0].
-
-However, in c6537673c9b6, there was a big overhaul of renderer
-infrastructure. That commit lost the with-modifiers code path and only
-kept the without-modifiers fallback one (i.e. it only kept the call to
-gbm_surface_create(), not to gbm_surface_create_with_modifiers()).
-
-Then in b0d09f5032a4, the with-modifier code path was re-instated, but
-in a way that made it exclusive with the without-modifiers one. That is,
-the without-modifiers code path was not a fallback to when the other
-failed.
-
-Re-instate the fallback mechanism as intiially implemented.
-
-[0] https://github.com/ardera/flutter-pi/issues/269
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/ardera/flutter-pi/pull/367
----
- src/egl_gbm_render_surface.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/egl_gbm_render_surface.c b/src/egl_gbm_render_surface.c
-index ce9e5e7..8a58667 100644
---- a/src/egl_gbm_render_surface.c
-+++ b/src/egl_gbm_render_surface.c
-@@ -146,6 +146,7 @@ static int egl_gbm_render_surface_init(
-     }
- #endif
- 
-+    gbm_surface = NULL;
-     if (allowed_modifiers != NULL) {
-         gbm_surface = gbm_surface_create_with_modifiers(
-             gbm_device,
-@@ -158,9 +159,10 @@ static int egl_gbm_render_surface_init(
-         if (gbm_surface == NULL) {
-             ok = errno;
-             LOG_ERROR("Couldn't create GBM surface for rendering. gbm_surface_create_with_modifiers: %s\n", strerror(ok));
--            return ok;
-+            LOG_ERROR("Will retry without modifiers\n");
-         }
--    } else {
-+    }
-+    if (gbm_surface == NULL) {
-         gbm_surface = gbm_surface_create(
-             gbm_device,
-             size.x,
--- 
-2.25.1
-
diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index f7148963a4..e69fe5b884 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4af79c8f53c15913f52a83a221f099a2a750d023a0bc4560d0db6f15def79a2  flutter-pi-d62e84350d2869b3ec1dfb1af21bfe234c4b817f-br1.tar.gz
+sha256  e9c9f64a8f7390cabd8e8f8158f200fe5cd04e0811e72e08a1ef8a5df56620b1  flutter-pi-6a2873870f50e71b09dcbf50c661a44383104da4-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 27f140c177..81034062d6 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = d62e84350d2869b3ec1dfb1af21bfe234c4b817f
+FLUTTER_PI_VERSION = 6a2873870f50e71b09dcbf50c661a44383104da4
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
@@ -27,6 +27,7 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
+	-DBUILD_CHARSET_CONVERTER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
 	-DTRY_BUILD_GSTREAMER_VIDEO_PLAYER_PLUGIN=OFF \
 	-DTRY_ENABLE_OPENGL=OFF \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
