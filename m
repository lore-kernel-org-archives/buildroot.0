Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08982CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B5F040166;
	Thu, 19 Oct 2023 07:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B5F040166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHaf50UwO4_1; Thu, 19 Oct 2023 07:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DFB7424C1;
	Thu, 19 Oct 2023 07:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DFB7424C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 657B51BF990
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EADD40166
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EADD40166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYd7w9z3W9ss for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:46:29 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3F314010D
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3F314010D
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so4043555e87.0
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 00:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701586; x=1698306386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87Tc9xkpgXBLFA4WClUoTxUIXhZ6QCJkLp3FoyCxGOM=;
 b=Tubp03f5q0VfKLQuP0Jk3f1AAR1Veyla9+XyGxDgMxtPv3L5f6Zdkyog0rCykzTE6T
 viSeAGICacsSgByYwKlFC/XHK/kEcD6Cwh0VfE/xGDAzRObvQ5rQYZqmJBmdCbLT2kOi
 68Ou7K9S8SONjyc6qVLS55YbXPVe91xr2Em5dp4ESLb3mhbOXrkSYVNLEavqytb8frYb
 TnNTI7DSP4GosHfdsXCda0WL5G34oDAxikjB8tC8a8Bd668FP2SvvIzSLD//awWjxYRh
 IsYkYzz8YApCDrhFJnU+Vyi0T24Am1fHJ04u/Zna5Lmf/DlCluN0IZ6dDzFNl6aPLR8U
 QGmw==
X-Gm-Message-State: AOJu0Yz+w6bM3Q0zpF9gvtuguw/kKyWH9nGn7637G3DsWR+e0fKmf6pw
 tB2dE/EoMgpCYGkhr8iv015Cfk1dM/6l5KvLdfnkHK8tHdg=
X-Google-Smtp-Source: AGHT+IGSITmcZba7/yGiYN0/4S5z4NwAVknci5VPL+TG5LWZDoZEwqF/62VlUOKbpzetNteOgvVHGQ==
X-Received: by 2002:ac2:54a2:0:b0:503:32bb:d5ca with SMTP id
 w2-20020ac254a2000000b0050332bbd5camr773056lfk.31.1697701586222; 
 Thu, 19 Oct 2023 00:46:26 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040535648639sm3739268wmb.36.2023.10.19.00.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 00:46:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 09:46:14 +0200
Message-ID: <20231019074615.1672645-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
References: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697701586; x=1698306386;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87Tc9xkpgXBLFA4WClUoTxUIXhZ6QCJkLp3FoyCxGOM=;
 b=rCYn2ONEPf/4DrjqfibFparS/hyAZWHmjdBWMfHeS8N/LOn00LPRgPpQc8yYKEEb0K
 6ewFMeGZH2rIkAugQFDuJ2FYQ7lCmxzAWzg5YrmnTJRs8era+IKbm5nA4nD1+eZi2s87
 cbWGVBlK9gEt8xO9Hix8SSNgPSpqrLT8BLq7U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rCYn2ONE
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
