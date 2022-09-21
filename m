Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFDCECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B4561078;
	Wed, 21 Sep 2022 20:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B4561078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzJ6PY2Nkmic; Wed, 21 Sep 2022 20:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987C861067;
	Wed, 21 Sep 2022 20:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987C861067
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 637571BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA3041729
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA3041729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMf76uM3SsFm for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:37:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FC5C417D6
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FC5C417D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A62E85D91; Wed, 21 Sep 2022 20:37:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:33:05 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2fe1a18b7fdac3fad33a6d2a5a13a8d660013ce8
X-Git-Newrev: d91453a419437f3cde9ba7026ec8b7c2316d0951
X-Patchwork-Hint: ignore
Message-Id: <20220921203705.0A62E85D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libmdbx: drop
 useless hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=d91453a419437f3cde9ba7026ec8b7c2316d0951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Commit c099842544248b10f4284a5d47084db8f476fcda ("package/libmdbx:
bump version to 0.11.8") forgot to drop the hash for the previous
0.11.7 version, let's do so now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b831f84e1354487e715a15dfe2c1c81bc954c467)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 3f2be134c3..33b2b53afa 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,6 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
 sha256  06011f361481ee7adc2111e48b7b121384294e0b6b8f10c75e7886629297b279  libmdbx-amalgamated-0.11.8.tar.xz
-sha256  3a9fb6a4cd941e646597235518714373fda1ca6d4c5e23669afe70ea87c20940  libmdbx-amalgamated-0.11.7.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
