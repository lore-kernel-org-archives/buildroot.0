Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFB4C38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1772F404EC;
	Tue,  6 Sep 2022 20:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1772F404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqpV2Qr3DKPG; Tue,  6 Sep 2022 20:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45CFA401E1;
	Tue,  6 Sep 2022 20:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45CFA401E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FFFC1BF2A6
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E84415FD
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E84415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOSgMUg_SN16 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:50:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 703CD415ED
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703CD415ED
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5992A82235; Tue,  6 Sep 2022 20:35:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 22:41:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87ba9890c2dd0bcf6415047c3fb9053f6965d0c1
X-Git-Newrev: c475f3bc36a263bc7d3e1cdcd86fca0d48fbd27f
X-Patchwork-Hint: ignore
Message-Id: <20220906203505.5992A82235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: unbreak indentation
 for perf sub-options
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

commit: https://git.buildroot.net/buildroot/commit/?id=c475f3bc36a263bc7d3e1cdcd86fca0d48fbd27f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sub-options of a kconfig symbol are only preperly indented below that
sybol, if there is no inter-mixed sylbols or comments.

In this vase, the comment about perf being unavailable is in-between the
perf symbol and the sub-options, which means the perf options are int
indented.

Move the comment before the definition of perf, so that the options
directly follow the per fsymbol, and so they are properly indented.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 253a8593b9..82e62f826e 100644
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
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
