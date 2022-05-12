Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7141C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 08:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B0524183F;
	Thu, 12 May 2022 08:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQ3U6TSo-7F3; Thu, 12 May 2022 08:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DBDF4198F;
	Thu, 12 May 2022 08:50:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B42481BF84C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C8B460A71
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtqXdNZ-7wO8 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4513360757
 for <buildroot@buildroot.org>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 931FE85A57; Thu, 12 May 2022 08:38:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 10:44:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de2961462bbb57985f73dfad18cc7a33d03fc433
X-Git-Newrev: fbd223942e59d820d26976da2639522db0a1b129
X-Patchwork-Hint: ignore
Message-Id: <20220512083801.931FE85A57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: drop fuse2 support and
 replace it with fuse3
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbd223942e59d820d26976da2639522db0a1b129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390-tools dropped FUSE2 support since v2.20.
It has been replaced with FUSE3.

Fixes:
- http://autobuild.buildroot.net/results/e12bace34870a33b68eb5759cece051aaaf5c1f9

References:
- https://github.com/ibm-s390-linux/s390-tools/pull/117
- https://github.com/ibm-s390-linux/s390-tools/issues/116

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s390-tools/s390-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 040db78c05..f381100792 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -77,8 +77,8 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_PFM=0
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-S390_TOOLS_DEPENDENCIES += libfuse
+ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
+S390_TOOLS_DEPENDENCIES += libfuse3
 S390_TOOLS_MAKE_OPTS += HAVE_FUSE=1
 else
 S390_TOOLS_MAKE_OPTS += HAVE_FUSE=0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
