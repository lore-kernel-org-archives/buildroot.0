Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4650FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BFED60238
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BFED60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB99C405BF;
	Tue,  3 Aug 2021 22:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laoDp54VucE1; Tue,  3 Aug 2021 22:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BEC41608;
	Tue,  3 Aug 2021 22:56:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08E2A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 470E040605
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbY9Tz4RG_oK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 045424057E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4978E85F62; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 09:42:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8601137c08e112a67a565bee1c245481b62f96cd
X-Git-Newrev: 11e8ced584068ce0e15ea6b1af117aa12d423126
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.4978E85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mono-gtksharp3: fix
 build with latest mono
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=11e8ced584068ce0e15ea6b1af117aa12d423126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure with latest mono which is raised since commit
4c8a285b6e35c4028341f874760bfa9226ebff94

Fixes:
 - http://autobuild.buildroot.org/results/ff3edfe406f00a29429d2fa4258af12c87e5fb96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-Mono-compilation-error-branch.patch       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch b/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch
new file mode 100644
index 0000000000..0d52401b4a
--- /dev/null
+++ b/package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch
@@ -0,0 +1,25 @@
+From fe18352a4bc9f0cf3b6cf63b8cc03c5d6e41863b Mon Sep 17 00:00:00 2001
+From: plprevost <plprevost@sii.fr>
+Date: Wed, 12 May 2021 16:46:16 +0200
+Subject: [PATCH] refs issue:#298 Fix mono compilation errors
+
+[Retrieved from:
+https://github.com/mono/gtk-sharp/pull/299/commits/fe18352a4bc9f0cf3b6cf63b8cc03c5d6e41863b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ sample/test/TestRange.cs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sample/test/TestRange.cs b/sample/test/TestRange.cs
+index 82fb81105..8727c9a77 100644
+--- a/sample/test/TestRange.cs
++++ b/sample/test/TestRange.cs
+@@ -8,7 +8,7 @@
+ 
+ using System;
+ 
+-using Gtk;
++using Gtk; using Range = Gtk.Range;
+ 
+ namespace WidgetViewer {
+ 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
