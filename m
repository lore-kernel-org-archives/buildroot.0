Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D013AC25B08
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8382060F89;
	Mon, 15 Aug 2022 09:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8382060F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yH4Zg0UVE_Uk; Mon, 15 Aug 2022 09:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE0060F76;
	Mon, 15 Aug 2022 09:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCE0060F76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6BD11BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AB2041673
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB2041673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZkZ-y8DJ_77 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6152416A3
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6152416A3
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 088BE875B1; Mon, 15 Aug 2022 09:02:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c44b8a37957b543568e523546ad571eb157bd90
X-Git-Newrev: c00fa1062e8bd48799f506b998c3e2737215c24e
X-Patchwork-Hint: ignore
Message-Id: <20220815090239.088BE875B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pygame: drop bogus
 BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c00fa1062e8bd48799f506b998c3e2737215c24e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symbol does not configure anything, so drop it.
It was added in 2012 by commit 'dda08e492d Add pygame package'

Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pygame/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index 0a738527ea..57eb020742 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -41,12 +41,6 @@ config BR2_PACKAGE_PYTHON_PYGAME_MIXER
 	  pygame module for loading and playing sounds.
 	  Will autoselect sdl_mixer.
 
-config BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
-	bool "pygame.mixer.music"
-	depends on BR2_PACKAGE_PYTHON_PYGAME_MIXER
-	help
-	  pygame module for controlling streamed audio
-
 config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
 	bool "pygame.scrap"
 	depends on BR2_PACKAGE_SDL_X11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
