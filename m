Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBEDC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F15CE8402F;
	Thu, 29 Sep 2022 21:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F15CE8402F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YeT2dU6neEd; Thu, 29 Sep 2022 21:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2576484026;
	Thu, 29 Sep 2022 21:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2576484026
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD851BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1A5941C4D
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1A5941C4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8Eb0xMyihKP for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5F9741C3C
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5F9741C3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3E8086615; Thu, 29 Sep 2022 21:21:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 22:40:50 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 71d77cda325780c1b95cb27601400587eb35ea67
X-Git-Newrev: 8725ddd8b15bd8d0bc44245f749cb8d88924aaa7
X-Patchwork-Hint: ignore
Message-Id: <20220929212136.E3E8086615@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/uacme: bump
 version to 1.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8725ddd8b15bd8d0bc44245f749cb8d88924aaa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This new version includes
https://github.com/ndilieto/uacme/commit/9f3e5eae05ee4170872807cd2d7736072b04f8e5
which fixes the build with mbedtls 2.x.

Fixes:

  http://autobuild.buildroot.org/results/8fa4f0d2821796be312b366be2f095be07dd7b1e

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c5131e5d9f0ea1ba1830c68b64c964409c44966b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index f62463029a..6c71f6b94d 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e7598e794f5ec414d993c4f2f7df39e7c72f26e41302b875ddaf040d8103ec5f  uacme-1.7.2.tar.gz
+sha256  0ec8e5bcb8ed2b532572ca4878d30b2a794f607b995348ebc176d566b64d73f9  uacme-1.7.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 2482259411..a70ec3a635 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.2
+UACME_VERSION = 1.7.3
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
