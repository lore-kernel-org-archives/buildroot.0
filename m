Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636E5C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10AEB61234;
	Fri, 16 Sep 2022 11:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10AEB61234
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVflRk89RxbB; Fri, 16 Sep 2022 11:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385A161222;
	Fri, 16 Sep 2022 11:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385A161222
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A31771BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C909241C9C
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C909241C9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XaxN9Rin_0h for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 369FE418B8
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 369FE418B8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 311D183CC2; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 13:35:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aee882d3aff7588d09d59ff1e21d4a6365ed93a4
X-Git-Newrev: 284419a95f8c76be3e1853eaa4031a9dd6f94661
X-Patchwork-Hint: ignore
Message-Id: <20220916114646.311D183CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-pygame:
 drop bogus BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
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

commit: https://git.buildroot.net/buildroot/commit/?id=284419a95f8c76be3e1853eaa4031a9dd6f94661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The symbol does not configure anything, so drop it.
It was added in 2012 by commit 'dda08e492d Add pygame package'

Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c00fa1062e8bd48799f506b998c3e2737215c24e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
