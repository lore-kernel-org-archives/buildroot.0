Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF1DC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ED24417D4;
	Sun,  5 Nov 2023 21:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ED24417D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mpwnkJeDGGip; Sun,  5 Nov 2023 21:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A87417CA;
	Sun,  5 Nov 2023 21:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A87417CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3788C1BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16AAC40A68
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16AAC40A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qmiW6NCqqur for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:48:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0572400CB
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0572400CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC177868B6; Sun,  5 Nov 2023 21:48:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 22:48:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1506a904c9abf8c8d8ed9a4f6f36f2591b7671d
X-Git-Newrev: 6898781f03140e301196a533953a202751be2f59
X-Patchwork-Hint: ignore
Message-Id: <20231105214839.BC177868B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: svn downloads can be
 hash-checked
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

commit: https://git.buildroot.net/buildroot/commit/?id=6898781f03140e301196a533953a202751be2f59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 89f5e989323a (support/download/svn: generate reproducible
svn archives), we've been able to generate reproducible archives, and
thus we have been able to verify the hashes for those archives.

However, the manual was not changed, and still falsely hinted that this
was not the cae.

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.adoc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 04f5241d05..7150018a3b 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -534,9 +534,9 @@ typically indicates that the +.hash+ file is wrong but the downloaded
 file is probably OK.
 
 Hashes are currently checked for files fetched from http/ftp servers,
-Git repositories, files copied using scp and local files. Hashes are
-not checked for other version control systems (such as Subversion,
-CVS, etc.) because Buildroot currently does not generate reproducible
+Git or subversion repositories, files copied using scp and local files.
+Hashes are not checked for other version control systems (such as CVS,
+mercurial) because Buildroot currently does not generate reproducible
 tarballs when source code is fetched from such version control
 systems.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
