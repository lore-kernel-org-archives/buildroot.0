Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E74C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1F5424BE;
	Fri, 28 Feb 2025 16:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5unG1AMN8k1k; Fri, 28 Feb 2025 16:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 258ED46637
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 258ED46637;
	Fri, 28 Feb 2025 16:47:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A52168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60873424D2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl8rnoHj2kSB for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F934257F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F934257F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE5384C4E; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9fab7bb79dddaeff17dd084160b0dbd4754a5fc0
X-Git-Newrev: 6b8025042d9495a15f5021e791d0f35bf2704afe
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.5BE5384C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2: drop directfb
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b8025042d9495a15f5021e791d0f35bf2704afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As we're about to remove the DirectFB package, let's drop DirectFB
support in sdl2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy       | 7 +++++++
 package/sdl2/Config.in | 7 -------
 package/sdl2/sdl2.mk   | 9 +--------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1a1ee21424..f610f1311b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_SDL2_DIRECTFB
+	bool "sdl2 directfb support removed"
+	select BR2_LEGACY
+	help
+	  The directfb support from SDL2 is no longer available, as
+	  directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_SDL_DIRECTFB
 	bool "sdl directfb support removed"
 	select BR2_LEGACY
diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 7c8258fe73..f1c22e4f80 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -11,13 +11,6 @@ config BR2_PACKAGE_SDL2
 
 if BR2_PACKAGE_SDL2
 
-config BR2_PACKAGE_SDL2_DIRECTFB
-	bool "DirectFB video driver"
-	depends on BR2_PACKAGE_DIRECTFB
-
-comment "DirectFB video driver needs directfb"
-	depends on !BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_SDL2_X11
 	bool "X11 video driver"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 9eee5c7123..62d6e91894 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -27,6 +27,7 @@ SDL2_CONF_OPTS += \
 	--disable-video-dummy \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
+	--disable-video-directfb \
 	--disable-ime \
 	--disable-ibus \
 	--disable-fcitx \
@@ -77,14 +78,6 @@ else
 SDL2_CONF_OPTS += --disable-3dnow
 endif
 
-ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
-SDL2_DEPENDENCIES += directfb
-SDL2_CONF_OPTS += --enable-video-directfb
-SDL2_CONF_ENV += ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-else
-SDL2_CONF_OPTS += --disable-video-directfb
-endif
-
 ifeq ($(BR2_PACKAGE_SDL2_OPENGLES)$(BR2_PACKAGE_RPI_USERLAND),yy)
 SDL2_DEPENDENCIES += rpi-userland
 SDL2_CONF_OPTS += --enable-video-rpi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
