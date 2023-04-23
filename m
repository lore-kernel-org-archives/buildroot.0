Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A89C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A7941816;
	Sun, 23 Apr 2023 09:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A7941816
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPK4J1fFKc58; Sun, 23 Apr 2023 09:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C0441811;
	Sun, 23 Apr 2023 09:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C0441811
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B25A1BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2940B60B58
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2940B60B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfkHej2IHkCO for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 166F160BA6
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 166F160BA6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 012AF843A2; Sun, 23 Apr 2023 09:50:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 11:42:19 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f87fe6d4198a8595606646ebf15c0a9746403bb1
X-Git-Newrev: d2b0ce01ba55cb32c01867aa93110cf5f72a07e1
X-Patchwork-Hint: ignore
Message-Id: <20230423095041.012AF843A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] docs/manual: rewrite
 section for upstream documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2b0ce01ba55cb32c01867aa93110cf5f72a07e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Previously, the documentation only requested links to upstream commits
when backporting patches.

Based on a mailing list discussion [0], patches should, when possible
and when approriate, provide a link as evidence that the patch has been
submitted upstream.

The motivation is that hopefully the patch gets applied to upstream at
some point reducing the long term maintenance burden within Buildroot.
This also makes future patch review on subsequent package version bumps
more streamlined.

For patches that are unique to BR and do not apply to the upstream
repository, patches should have a comment explaining why they do not
apply upstream.

[0] https://lists.buildroot.org/pipermail/buildroot/2023-March/666000.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b00b40a05437e1042b25c097b977d5a26bdee1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/patch-policy.txt | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 063ef984d8..dc35132ecf 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -144,24 +144,37 @@ AC_PROG_MAKE_SET
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
 ---------------
 
-=== Integrating patches found on the Web
+=== Additional patch documentation
 
-When integrating a patch of which you are not the author, you have to
-add a few things in the header of the patch itself.
+Ideally, all patches should document an upstream patch or patch submission, when
+applicable, via the +Upstream+ trailer.
 
-Depending on whether the patch has been obtained from the project
-repository itself, or from somewhere on the web, add one of the
-following tags:
+When backporting an upstream patch that has been accepted into mainline, it is
+preferred that the URL to the commit is referenced:
 
 ---------------
-Backported from: <some commit id>
+Upstream: <URL to upstream commit>
 ---------------
 
-or
+If a new issue is identified in Buildroot and upstream is generally affected by 
+the issue (it's not a Buildroot specific issue), users should submit the patch
+upstream and provide a link to that submission when possible:
 
 ---------------
-Fetch from: <some url>
+Upstream: <URL to upstream mailing list submission or merge request>
 ---------------
 
-It is also sensible to add a few words about any changes to the patch
-that may have been necessary.
+Patches that have been submitted but were denied upstream should note that and
+include comments about why the patch is being used despite the upstream status.
+
+Note: in any of the above scenarios, it is also sensible to add a few words
+about any changes to the patch that may have been necessary.
+
+If a patch does not apply upstream then this should be noted with a comment:
+
+---------------
+Upstream: N/A <additional information about why patch is Buildroot specific>
+---------------
+
+Adding this documentation helps streamline the patch review process during
+package version updates.
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
