Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22157C77B73
	for <buildroot@archiver.kernel.org>; Mon, 22 May 2023 10:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70B4340CC0;
	Mon, 22 May 2023 10:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B4340CC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qsXFEwX3bc7w; Mon, 22 May 2023 10:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F181402CE;
	Mon, 22 May 2023 10:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F181402CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC75F1BF39D
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 10:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D2A560C18
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 10:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D2A560C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp1UoPYNl9wF for <buildroot@lists.busybox.net>;
 Mon, 22 May 2023 10:14:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3993060B43
Received: from fenrir.uberspace.de (fenrir.uberspace.de [185.26.156.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3993060B43
 for <buildroot@buildroot.org>; Mon, 22 May 2023 10:14:51 +0000 (UTC)
Received: (qmail 24015 invoked by uid 989); 22 May 2023 10:14:48 -0000
From: Alexander Bau <dev@abau.org>
To: buildroot@buildroot.org
Date: Mon, 22 May 2023 12:14:37 +0200
Message-Id: <20230522101438.1026434-1-dev@abau.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Rspamd-Bar: +
X-Rspamd-Report: R_MISSING_CHARSET(0.5) MIME_GOOD(-0.1) MID_CONTAINS_FROM(1)
X-Rspamd-Score: 1.4
Received: from unknown (HELO unkown) (::1)
 by fenrir.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 22 May 2023 12:14:47 +0200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=abau.org; s=uberspace; h=from;
 bh=0LvG/wlVYdoYvnyIQcvU/JPoY6l9FTTJCBPsDWkOtzc=;
 b=WaOl7ciaep1ZgBMF/nSL64WAmJHpqx/AuB0zMt9rqAYdSsXF2X4rfCGHHZGbKMQFjvzOmg9X+v
 Th45Y1NLkMm/bhHkVdyJlz7wCLOpKViN8HO+iZjVv5NH4mV2e494JWCwxuu5w3FbW/X2XA6hLzOl
 exrYhy8AyJJPK9mzORqVWCB5WdSh+OfJo4Gth5CBNZzzvtqmvsXOFrebOaDsPmii+y2lLHehtUgw
 GUBVcgBOzbLvG3Hi6EXMlvaT0CSiomx5D6qB7WeZNyHII73HAHM3ZF5bXCgUdnp534fNKV3ZLwrA
 HzvHxu2+yb7cExG5adShp9EKfm65bLgFgi3E2citaJprwY+hA3TdbhjmA+KlwjjT5jK9TokwNe7E
 VY+Xs68g443IahQO3CG/He78ABcht9IMV+DWb3tO5D8ttyd/iPqaS2sRiq1HaZ830/l6Vqa2z5Qu
 ehKNHi8s9Qc4oqjDtPQehCHoNqOCXYTZO2jZE5k2PZ6kjY3MUw+aRurddWyM4DwTsARV2e5bPzXf
 AgnchWaf3imN6ykZAaU5X6c4jihOrDkmTjFr2LZdzSiTnp76q0d8NjWNdGJJzzhQ85mDOo9GtEca
 9bnvUjARzIGDrfBhMZzFgZAoJ0IHgPLLstOydG1mQX7JiRDyFI9JraO60/At/DHtXNMZbs2BYUoZ
 A=
X-Mailman-Original-Authentication-Results: fenrir.uberspace.de;
 auth=pass (plain)
Subject: [Buildroot] [PATCH] package/sdl2: support building for Wayland
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
Cc: Alexander Bau <dev@abau.org>, Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/sdl2/Config.in | 7 +++++++
 package/sdl2/sdl2.mk   | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 7c8258fe73..85d7c09385 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -29,6 +29,13 @@ comment "X11 video driver needs X.org"
 	depends on !BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_SDL2_WAYLAND
+	bool "Wayland video driver"
+	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL2_OPENGLES
+	depends on BR2_PACKAGE_LIBXKBCOMMON
+
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # libdrm
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 5f2e1e0ed1..223497942f 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -23,7 +23,6 @@ SDL2_CONF_OPTS += \
 	--disable-video-vivante \
 	--disable-video-cocoa \
 	--disable-video-metal \
-	--disable-video-wayland \
 	--disable-video-dummy \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
@@ -147,6 +146,12 @@ else
 SDL2_CONF_OPTS += --disable-video-x11 --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
+SDL2_CONF_OPTS += --enable-video-wayland
+else
+SDL2_CONF_OPTS += --disable-video-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2_OPENGL),y)
 SDL2_CONF_OPTS += --enable-video-opengl
 SDL2_DEPENDENCIES += libgl
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
