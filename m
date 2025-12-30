Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF24EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D7960BC5;
	Tue, 30 Dec 2025 22:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gpmf8zlBJvVG; Tue, 30 Dec 2025 22:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53CC60B85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133594;
	bh=gSZxhcnpPjd9JyDgNtyTy0I3xBVzfQEaYA6SeweoD/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VRXWKvuQBUj8NL6vM3WbtIBEp4zco/4nkjp6XWnSBzijOi8YALZ07JDc/m0CYWcY3
	 GIfjtdVAL2oD/I5OclL3SmZ99/+kYVn3W7dDn88lbQvXlbmpQWZ1gR/rS6JlX6c51x
	 K+IHRlrtPYrnynbiW+q5FHqcG2I8Dc5V82FaLnJKXYLoLfM3w00D6UX2rd/7B19YHz
	 HK0xXNqYlpMfGpOhFc6qiVuIblOxslRiZciWtMQMSuwx+KiLphKF/qYQ69Vuvmj318
	 HGfBb5kQxyy8hNad+BRd6UVmuve4rIZiCgQZQ6SF0Jk+Si5mc238sWBoCp5kFSyIXz
	 vHsR2X7ajsKkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53CC60B85;
	Tue, 30 Dec 2025 22:26:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26473277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD7514028B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ppcl9t8UViIg for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2983440333
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2983440333
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2371787CA9; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f591fd3fea63652f7134372656a06ec30ae7ff69
X-Git-Newrev: 830a1ef488ba8f245048ee0cbce198ea34d21270
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.2371787CA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox-player: drop
 rpi-userland support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=830a1ef488ba8f245048ee0cbce198ea34d21270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/glslsandbox-player.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glslsandbox-player/Config.in             | 5 -----
 package/glslsandbox-player/glslsandbox-player.mk | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 530c158fc3..d2e146d827 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -53,7 +53,6 @@ choice
 	prompt "Native windowing system"
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_UTGARD
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X if BR2_PACKAGE_MALI_T76X
-	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
@@ -81,10 +80,6 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X
 	bool "ARM/Mali T76x Frame Buffer"
 	depends on BR2_PACKAGE_MALI_T76X
 
-config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
-	bool "RaspberryPI Frame Buffer"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2
 	bool "SDL2"
 	depends on BR2_PACKAGE_SDL2_OPENGLES
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 0066f43567..2e5212396b 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -52,9 +52,6 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += mali-t76x
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=nullws
-else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
-GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
-GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=rpi
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += sdl2
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=sdl2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
