Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43197C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 20:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8523B409A2;
	Sat, 14 May 2022 20:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csx5NG_XNHHp; Sat, 14 May 2022 20:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5461B40994;
	Sat, 14 May 2022 20:39:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D9371BF681
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 20:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3574682D04
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 20:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KC_bv4WQdATx for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 20:39:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88E8F82951
 for <buildroot@buildroot.org>; Sat, 14 May 2022 20:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 28E1683FC0; Sat, 14 May 2022 20:28:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 22:39:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 814ed3896f62373f5e91978e3713642c2b6e85a9
X-Git-Newrev: 33e947a2d5db2e7b8fb0cfc64183add77b29c347
X-Patchwork-Hint: ignore
Message-Id: <20220514202845.28E1683FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=33e947a2d5db2e7b8fb0cfc64183add77b29c347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 07408779cc068041a2da6838fe077d1a679f1736 forgot to update hash of
LICENSE file (multiple components under MIT added:
https://github.com/nodejs/node/commit/71659fd4baa90006937e78d789ec0aef95672eb1
https://github.com/nodejs/node/commit/f17ce913c94d26c87a471179d99d8bc4134f7bb5)

ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5
ERROR: got     : 6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33

Fixes:
 - http://autobuild.buildroot.org/results/bd1e3238f294152d54ee8f5579431606309dbff3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/nodejs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 998229341e..716becccc9 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -2,4 +2,4 @@
 sha256  a0f812efc43f78321eca08957960a48f5e6bf97004d5058c8dd3b03c646ea4f7  node-v16.15.0.tar.xz
 
 # Hash for license file
-sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
+sha256  6211cc77f9ceaf365db12faf050775b3a1e6da7a1eff3577ba006c4918103c33  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
