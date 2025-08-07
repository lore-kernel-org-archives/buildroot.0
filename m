Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E247C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC8B60633;
	Thu,  7 Aug 2025 17:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfX5KmEKLPLe; Thu,  7 Aug 2025 17:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59ED960648
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59ED960648;
	Thu,  7 Aug 2025 17:20:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B4831
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 611F7404AB
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rPyQtAmwLjv for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 660EC40491
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 660EC40491
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6456A80FCA; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:09:34 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4e06f6434981bae1e0583a2f0307af3af1cac8b7
X-Git-Newrev: 599f40da450544e5c99a59bc7554c6f459287a24
X-Patchwork-Hint: ignore
Message-Id: <20250807171916.6456A80FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gcc: drop useless
 condition on BR2_GCC_ENABLE_GRAPHITE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=599f40da450544e5c99a59bc7554c6f459287a24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

For a long while now, we only support building GCC >= 8.x, so the
dependency of BR2_GCC_ENABLE_GRAPHITE on GCC >= 5.x is useless, drop
it, together with the corresponding Config.in comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b5f14d65cb420685ea636c8541f98eff3b2f3630)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gcc/Config.in.host | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 401f2dbe2a..4623b20b45 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -131,10 +131,6 @@ config BR2_GCC_ENABLE_OPENMP
 
 config BR2_GCC_ENABLE_GRAPHITE
 	bool "Enable graphite support"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  This option enables the graphite optimizations in the
 	  compiler.
-
-comment "graphite support needs gcc >= 5.x"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
