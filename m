Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05076C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 19:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FEAF82016;
	Wed, 21 Dec 2022 19:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FEAF82016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgytjAxSmXva; Wed, 21 Dec 2022 19:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEBA82011;
	Wed, 21 Dec 2022 19:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEBA82011
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA041BF420
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07FC861086
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07FC861086
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id neiUdhMnJHUy for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4312360FE0
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4312360FE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3082E86CC0; Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 20:38:50 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 17a3f721c321ef5e26e2f7bb5fa8c65de2b97b8a
X-Git-Newrev: ab1ed52570824e2a82890bb59de51d816ef3ea0c
X-Patchwork-Hint: ignore
Message-Id: <20221221194229.3082E86CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/scancpan: bump
 required perl version
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab1ed52570824e2a82890bb59de51d816ef3ea0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

As the comment in package/perl/perl.mk instructs, bumping the perl
version must be propagated to utils/scancpan as well.

However, commit 7c1ef8129f37 (package/perl: bump to version 5.34.0)
forgot to do so.

Fixes: 7c1ef8129f37

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4cbef389f3e10d1cbdcd9961fb128dfd9b85debf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
