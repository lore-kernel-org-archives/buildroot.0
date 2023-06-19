Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5261BEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BFE84156F;
	Mon, 19 Jun 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BFE84156F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYtIz1QpFgjF; Mon, 19 Jun 2023 19:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3377241555;
	Mon, 19 Jun 2023 19:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3377241555
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33ED81BF8B4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BC2D81F6D
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BC2D81F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVeBRxO1Pnol for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AF3581F54
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF3581F54
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 091DE842BC; Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 21:36:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dfc789f4f21367bc5f4b5454db0922821a765bc
X-Git-Newrev: 6508581652ce4cc9c98cd23601ce3a5fc3e8e2c6
X-Patchwork-Hint: ignore
Message-Id: <20230619193706.091DE842BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: fix license hash
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6508581652ce4cc9c98cd23601ce3a5fc3e8e2c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 1db3f0f84449843476c2887d2ea09323c66f33a4 failed to
update the license hash which is needed due to various commits in 2023
updating package versions and copyright year:
https://github.com/ccache/ccache/commits/master/LICENSE.adoc

Fixes:
http://autobuild.buildroot.net/results/41b/41b3427e30b6e44352fc78b27360fdadf9e46393/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/ccache/ccache.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 2b6cd65a74..736122e0ab 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
 sha256  3d3fb3f888a5b16c4fa7ee5214cca76348afd6130e8443de5f6f2424f2076a49  ccache-4.8.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  56cf64f68b7b8150300acd79899941615523ea5c56c120e92f5b175b7cc78e3c  LICENSE.adoc
+sha256  55ce274f2b898dad70d3695ab13f82656fd455bd8fb6d1c85d6f7c453bef0b2e  LICENSE.adoc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
