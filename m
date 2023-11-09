Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E62C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 17:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70BAA400AF;
	Thu,  9 Nov 2023 17:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70BAA400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSEnmma2n3TX; Thu,  9 Nov 2023 17:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 609E1416DB;
	Thu,  9 Nov 2023 17:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 609E1416DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF811BF2B6
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6392041F6E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6392041F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjA0xJIlqrZ3 for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8070141F66
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8070141F66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F22686E19; Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 18:22:10 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 65e19c6c8ce69aa2ea5b0370feaf706214aeb395
X-Git-Newrev: cf635737ede4b1db7bdcb396a49f0abd0b62cd66
X-Patchwork-Hint: ignore
Message-Id: <20231109172543.6F22686E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] docs/manual: svn
 downloads can be hash-checked
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf635737ede4b1db7bdcb396a49f0abd0b62cd66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Since commit 89f5e989323a (support/download/svn: generate reproducible
svn archives), we've been able to generate reproducible archives, and
thus we have been able to verify the hashes for those archives.

However, the manual was not changed, and still falsely hinted that this
was not the cae.

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6898781f03140e301196a533953a202751be2f59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 04f5241d05..7150018a3b 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
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
