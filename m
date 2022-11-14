Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370BCC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 16:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC8A60E0D;
	Mon, 14 Nov 2022 16:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC8A60E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yC5doNEH0DoU; Mon, 14 Nov 2022 16:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E897607D1;
	Mon, 14 Nov 2022 16:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E897607D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA6F71BF32B
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C359C40A60
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C359C40A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9x3714UhbuSC for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 16:18:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB96E402E5
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 16:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB96E402E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8CC483986; Mon, 14 Nov 2022 16:18:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 17:11:07 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0216becf87d8030f9cb8a1fadead994fa9df67cf
X-Git-Newrev: bf072683dba3691e7c0899882994a5fc6ef4d5e2
X-Patchwork-Hint: ignore
Message-Id: <20221114161834.D8CC483986@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/linux-tools:
 unbreak indentation for perf sub-options
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf072683dba3691e7c0899882994a5fc6ef4d5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Sub-options of a kconfig symbol are only preperly indented below that
sybol, if there is no inter-mixed sylbols or comments.

In this case, the comment about perf being unavailable is in-between the
perf symbol and the sub-options, which means the perf options are int
indented.

Move the comment before the definition of perf, so that the options
directly follow the per fsymbol, and so they are properly indented.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c475f3bc36a263bc7d3e1cdcd86fca0d48fbd27f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 732ac65a25..905518d0bf 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -47,6 +47,10 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 
 	  These tools are available only from kernel version 4.20.
 
+comment "perf needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
@@ -70,10 +74,6 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
 
 	  https://perf.wiki.kernel.org/
 
-comment "perf needs a toolchain w/ dynamic library"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS
-
 if BR2_PACKAGE_LINUX_TOOLS_PERF
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
