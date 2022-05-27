Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DF2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DD44283D;
	Fri, 27 May 2022 08:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqSw7thnIPDJ; Fri, 27 May 2022 08:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139CB42833;
	Fri, 27 May 2022 08:00:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17C531BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61BB9412E9
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVrPgGjaY8PC for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45069412F0
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7951A865B8; Fri, 27 May 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 09:57:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0d7ba2aa40612c0edaecae5cdc28407c46382478
X-Git-Newrev: d2ae0e06c0fcb197ad3d9e809b07a5effa21f005
X-Patchwork-Hint: ignore
Message-Id: <20220527074654.7951A865B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pcre2: fix legal
 info
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2ae0e06c0fcb197ad3d9e809b07a5effa21f005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 9315eb7ede87e072c121985d2ab67ccb973f20ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
