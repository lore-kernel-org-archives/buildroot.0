Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D45C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 527B7418FF;
	Wed, 15 Mar 2023 14:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 527B7418FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_eFrPx8uJZy; Wed, 15 Mar 2023 14:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4872E418BD;
	Wed, 15 Mar 2023 14:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4872E418BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6561BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1437780E86
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1437780E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZJbIedjiFR4 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54B0380E8F
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B0380E8F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4182787426; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:40:55 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 63cda1daa0480f2a60fbdb0ba7d71629bef9e549
X-Git-Newrev: 53405e589c5b26472b9cb000e25e42644d6357d0
X-Patchwork-Hint: ignore
Message-Id: <20230315144315.4182787426@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/uacme: security
 bump to version 1.7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=53405e589c5b26472b9cb000e25e42644d6357d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Includes https://github.com/ndilieto/uacme/commit/fe91f46b620f8c58805fcf48cb4f4a793c8a47a4
Fixes https://github.com/ndilieto/uacme/issues/64

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d97fe11e59122c65df6216a7767f0b004fbd0dec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 6c71f6b94d..063b0b57ac 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0ec8e5bcb8ed2b532572ca4878d30b2a794f607b995348ebc176d566b64d73f9  uacme-1.7.3.tar.gz
+sha256  a638fe0878dba8fdda62f89e7a284243edbcd31b92c11b5cfdc7d3efd9547bca  uacme-1.7.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index a70ec3a635..9b2360937b 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.3
+UACME_VERSION = 1.7.4
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
