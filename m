Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD6BC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8358782223;
	Mon, 19 May 2025 16:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDfjIhMPVOS2; Mon, 19 May 2025 16:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F1982A8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F1982A8F;
	Mon, 19 May 2025 16:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C42193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CE0960B57
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zrtrp11ZZyfo for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5179560BD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5179560BD8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:48:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EBD9874AA; Mon, 19 May 2025 16:48:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:46:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 62e784cb97641b5d09eaab04f81e10982d636bcc
X-Git-Newrev: b5f14d65cb420685ea636c8541f98eff3b2f3630
X-Patchwork-Hint: ignore
Message-Id: <20250519164806.3EBD9874AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: drop useless
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5f14d65cb420685ea636c8541f98eff3b2f3630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For a long while now, we only support building GCC >= 8.x, so the
dependency of BR2_GCC_ENABLE_GRAPHITE on GCC >= 5.x is useless, drop
it, together with the corresponding Config.in comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc/Config.in.host | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8930c2a42a..496ead1e6a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -128,10 +128,6 @@ config BR2_GCC_ENABLE_OPENMP
 
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
