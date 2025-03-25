Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1F8C35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 08:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68DD54087E;
	Tue, 25 Mar 2025 08:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3KjJm-3HcaF; Tue, 25 Mar 2025 08:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63DB40B5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63DB40B5A;
	Tue, 25 Mar 2025 08:47:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C86A1B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8CCF410B4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9nb6kNBved4 for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EA20410BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EA20410BC
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5966982B5E; Tue, 25 Mar 2025 08:47:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 09:43:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3df91fca0ef8df1b178e045959e257486504a9e
X-Git-Newrev: 38a3ddda93dd55b3e12a45a371fba35c1a03c225
X-Patchwork-Hint: ignore
Message-Id: <20250325084711.5966982B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=38a3ddda93dd55b3e12a45a371fba35c1a03c225
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aeeeefb855ab829e4de428a460ee5f59eecb6998)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/CHANGES b/CHANGES
index 8b0e596672..836871373c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -636,6 +636,18 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.12, released March 24st, 2025
+
+	Important / security related fixes.
+
+	Defconfigs: Octavo osd23mp1: Fix TF-A/Linux compilation after
+	move to newer toolchain versions.
+
+	Updated/fixed packages: compiler-rt, exim, expat, fio, foot,
+	jbig2dec, libjxl, libxml2, musl, optee-os, php, postgresql,
+	prboom, python-typing-extensions, systemd, util-linux,
+	watchdogd, webkitgtk
+
 2024.02.11, released February 21st, 2025
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
