Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6A4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7928416B7;
	Mon, 25 Apr 2022 19:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2Vd12YgVoB3; Mon, 25 Apr 2022 19:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 416844169E;
	Mon, 25 Apr 2022 19:08:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0189F1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E421760BDE
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xD02osmd7qI for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:07:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4387D605E0
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 26A05842F5; Mon, 25 Apr 2022 18:57:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:07:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2b04d4e096b912cf9a5165d2a35651e82a87e89
X-Git-Newrev: 9315eb7ede87e072c121985d2ab67ccb973f20ac
X-Patchwork-Hint: ignore
Message-Id: <20220425185738.26A05842F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=9315eb7ede87e072c121985d2ab67ccb973f20ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 10648db92bc5c4bfd49b58ce4f1c213defdfc7de forgot to update hash of
LICENCE file (update in year:
https://github.com/PCRE2Project/pcre2/commit/3103b8f20a3b9944b177e812fde29fbfb8b90558):

 >>> pcre2 10.40 Collecting legal info
 ERROR: LICENCE has wrong sha256 hash:
 ERROR: expected: 15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025
 ERROR: got     : 87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987

Fixes:
 - http://autobuild.buildroot.org/results/275c5478d63d3d4016d440870e96f04230df69d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/pcre2.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index e4f7980749..e3fe6b2d53 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -2,4 +2,4 @@
 # https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.40/pcre2-10.40.tar.bz2.sig
 sha256  14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68  pcre2-10.40.tar.bz2
 # Locally computed
-sha256  15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025  LICENCE
+sha256  87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987  LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
