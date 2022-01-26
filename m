Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67683C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 13:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D33340977;
	Wed, 26 Jan 2022 13:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srp2qS_eV1RQ; Wed, 26 Jan 2022 13:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 553E040949;
	Wed, 26 Jan 2022 13:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11F261BF9B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EF2360F53
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OttG3ItyWceQ for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 13:07:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37F1860F4F
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8E3E982814; Wed, 26 Jan 2022 13:00:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 14:05:49 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a17bb098d474737f74ce23dbbdb78e28c5676719
X-Git-Newrev: 98524b449615350a860ccf0b63a106d7742477d7
X-Patchwork-Hint: ignore
Message-Id: <20220126130036.8E3E982814@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/flare-game:
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

commit: https://git.buildroot.net/buildroot/commit/?id=98524b449615350a860ccf0b63a106d7742477d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index d65e3d6c38..2845dc9714 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -8,7 +8,7 @@ FLARE_GAME_VERSION = 1.11
 FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
-FLARE_GAME_LICENSE_FILES = README
+FLARE_GAME_LICENSE_FILES = LICENSE.txt
 
 FLARE_GAME_DEPENDENCIES = flare-engine
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
