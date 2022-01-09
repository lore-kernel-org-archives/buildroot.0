Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269B8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 07:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99FE960AD0;
	Sun,  9 Jan 2022 07:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4t7U0DBo1aUe; Sun,  9 Jan 2022 07:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17F560A93;
	Sun,  9 Jan 2022 07:27:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89C361BF473
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76B7E402DC
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2tugtcBGkLG for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 07:27:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 972CC400F5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 07:27:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8FA0082962; Sun,  9 Jan 2022 07:20:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 08:26:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcaed85304d14d3d0a8020e17af2d6daeca0be58
X-Git-Newrev: e27a700f3e140015c02be05853d94b7f3dcc0f28
X-Patchwork-Hint: ignore
Message-Id: <20220109072048.8FA0082962@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core/pkg-utils: add missing bracket/sep
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

commit: https://git.buildroot.net/buildroot/commit/?id=e27a700f3e140015c02be05853d94b7f3dcc0f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This appears to have been incorrectly removed in:
03aa3e6ac71a0fe1ff87fe192c8de0b1acebd0df

Fixes:
package/pkg-utils.mk:212: *** unterminated call to function 'foreach': missing ')'.  Stop.
make: *** [Makefile:84: _all] Error 2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6aa64a2096..7d1aea7710 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -214,7 +214,7 @@ define per-package-rsync
 	$(foreach pkg,$(1),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-			$(3)
+			$(3)$(sep))
 endef
 
 # prepares the per-package HOST_DIR and TARGET_DIR of the current
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
