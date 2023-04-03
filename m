Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FA5C76188
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 14:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC021415E5;
	Mon,  3 Apr 2023 14:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC021415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V317xWSc8Sjp; Mon,  3 Apr 2023 14:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1055415D4;
	Mon,  3 Apr 2023 14:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1055415D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A32B1BF99D
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 14:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1C6E4146F
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 14:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C6E4146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7y4CzL7vWUQ for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 14:46:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D00404096A
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D00404096A
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 14:46:49 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 45F3D20222;
 Mon,  3 Apr 2023 09:41:10 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Apr 2023 09:41:03 -0500
Message-Id: <20230403144105.419341-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] docs/manual: rewrite section for
 upstream documentation
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2:
  - Minor updates commit message body
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
