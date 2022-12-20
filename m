Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95115C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 16:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14071415CF;
	Tue, 20 Dec 2022 16:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14071415CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-MBdAOWdjAE; Tue, 20 Dec 2022 16:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F1A41719;
	Tue, 20 Dec 2022 16:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F1A41719
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80F5F1BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68044408E5
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68044408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSLxpfME27r9 for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 16:23:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B06640879
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 16:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B06640879
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3695686AD9; Tue, 20 Dec 2022 16:23:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 17:22:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 072df09e2f62e6d797df743b0ebf42a6a5910ff9
X-Git-Newrev: 4cbef389f3e10d1cbdcd9961fb128dfd9b85debf
X-Patchwork-Hint: ignore
Message-Id: <20221220162308.3695686AD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scancpan: bump required perl version
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cbef389f3e10d1cbdcd9961fb128dfd9b85debf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the comment in package/perl/perl.mk instructs, bumping the perl
version must be propagated to utils/scancpan as well.

However, commit 7c1ef8129f37 (package/perl: bump to version 5.34.0)
forgot to do so.

Fixes: 7c1ef8129f37

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/scancpan | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 168619164f..48f8bd83b7 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.032 should be aligned with the version of perl actually
+# Below, 5.034 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.032;
+die <<"MSG" if $] < 5.034;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -498,7 +498,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.32.0
+    perlbrew install perl-5.34.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
