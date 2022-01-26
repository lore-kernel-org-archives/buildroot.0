Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269A6C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 13:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51E784BC0;
	Wed, 26 Jan 2022 13:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QD38S_juWsUD; Wed, 26 Jan 2022 13:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D7284BB7;
	Wed, 26 Jan 2022 13:08:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 088AB1BF3AD
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0300440949
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a63tmnUVUV3 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 13:07:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C88840985
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82FCB82753; Wed, 26 Jan 2022 13:00:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 14:05:40 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 0171ea611a308cf227dd2f8f8f79bf1616f34ad7
X-Git-Newrev: a17bb098d474737f74ce23dbbdb78e28c5676719
X-Patchwork-Hint: ignore
Message-Id: <20220126130036.82FCB82753@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/flare-engine:
 enable ogg support in SDL2-mixer via Tremor
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a17bb098d474737f74ce23dbbdb78e28c5676719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Flare games use OGG audio file format througt SDL2-mixer.

Without OGG support, flare-engine trigger a lot of errors in its
log and fail to start the game.

ERROR: SoundManager: ItemManager: Loading sound /usr/share/flare/mods/fantasycore/soundfx/inventory/inventory_gem.ogg (soundfx/inventory/inventory_gem.ogg) failed: Unrecognized audio format

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1f66c3557a391a00a7527e2b2e8fddd83f0ba0aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flare-engine/Config.in       | 1 +
 package/flare-engine/flare-engine.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
index d08b740af3..9c997c2b9a 100644
--- a/package/flare-engine/Config.in
+++ b/package/flare-engine/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_FLARE_ENGINE
 	select BR2_PACKAGE_SDL2_IMAGE
 	select BR2_PACKAGE_SDL2_MIXER
 	select BR2_PACKAGE_SDL2_TTF
+	select BR2_PACKAGE_TREMOR # for SDL2_mixer ogg support
 	help
 	  Flare (Free Libre Action Roleplaying Engine) is a simple game
 	  engine built to handle a very specific kind of game:
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 14d2681fda..d722a42208 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -9,7 +9,7 @@ FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
 
-FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
+FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf tremor
 
 # Don't use /usr/games and /usr/share/games
 FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
