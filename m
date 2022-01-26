Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F761C3526D
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 13:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA96940214;
	Wed, 26 Jan 2022 13:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ValeCo0WuQ_L; Wed, 26 Jan 2022 13:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE0D41637;
	Wed, 26 Jan 2022 13:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29F3D1BF9B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25DF640132
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlIm96XMJgds for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 13:07:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE1040949
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:07:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 91A6182814; Wed, 26 Jan 2022 13:00:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 14:06:53 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 27b6400b3fe591345080c06029c2af082d7246df
X-Git-Newrev: f81703f466d4bc252932a4e1e8454482e70f88a7
X-Patchwork-Hint: ignore
Message-Id: <20220126130032.91A6182814@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/flare-game:
 really use LICENSE.txt as license file
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

commit: https://git.buildroot.net/buildroot/commit/?id=f81703f466d4bc252932a4e1e8454482e70f88a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The previous version bump [1] added the hash of LICENSE.txt but
forgot to update FLARE_GAME_LICENSE_FILES.

[1] 4d09d1b47672823e3dc2fb3a84e2349f6b19906c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7684604188f829820f96ced628137ff880e302f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flare-game/flare-game.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index 4bebc79595..e015ef4687 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -8,7 +8,7 @@ FLARE_GAME_VERSION = 1.11
 FLARE_GAME_SITE =  $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
-FLARE_GAME_LICENSE_FILES = README
+FLARE_GAME_LICENSE_FILES = LICENSE.txt
 
 FLARE_GAME_DEPENDENCIES = flare-engine
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
