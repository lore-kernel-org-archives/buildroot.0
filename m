Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A7CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 773FC40499;
	Sun, 17 Sep 2023 21:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 773FC40499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4SB9oLRSLxe; Sun, 17 Sep 2023 21:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A083A4054E;
	Sun, 17 Sep 2023 21:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A083A4054E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7FC1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 21:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 473B781A1C
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 473B781A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PAv832JV8UDQ for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B28A81801
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B28A81801
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37D8C872F7; Sun, 17 Sep 2023 21:07:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:59:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2031fc88096f8651397cdc2e96a249a6f92ae292
X-Git-Newrev: 96130dc204d193f68070f8aa1665123e913c5f5b
X-Patchwork-Hint: ignore
Message-Id: <20230917210739.37D8C872F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix formatting for
 LIBFOO_SVN_EXTERNAL
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

commit: https://git.buildroot.net/buildroot/commit/?id=96130dc204d193f68070f8aa1665123e913c5f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7dd27cbe5b9e (support/download: add support to exclude svn
externals) introduced an improperly formatted list item. That was
carried over with bf2d7f8f5395 (package/pkg-generic: don't download svn
externals by default).

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 98f822c55c..76b037f436 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -347,7 +347,7 @@ not and can not work as people would expect it should:
   Git LFS to store large files out of band.  This is only available for
   packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).
 
-+ +LIBFOO_SVN_EXTERNALS+ can be set to +YES+ to create an archive with
+* +LIBFOO_SVN_EXTERNALS+ can be set to +YES+ to create an archive with
   the svn external references. This is only available for packages
   downloaded with subversion.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
