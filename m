Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF6BCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BF7403B8;
	Thu,  4 Sep 2025 16:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loo_uVzmfgA1; Thu,  4 Sep 2025 16:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 521F040407
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521F040407;
	Thu,  4 Sep 2025 16:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD24AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 727B180787
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rF93RPPDXukm for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F76380764
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F76380764
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CBF88617D; Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b3624ce42ed0b3400f37181fd26c0ac517372316
X-Git-Newrev: 60d63597000dc5e91d7775176d9debc585ed107e
X-Patchwork-Hint: ignore
Message-Id: <20250904161347.9CBF88617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] arch/Config.in.arm: fix
 typo in help text
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60d63597000dc5e91d7775176d9debc585ed107e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 36eed021b6cb291e4892e4749e8b123aed328ba4)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 arch/Config.in.arm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 546ba8070e..f01dcc4d5a 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -777,7 +777,7 @@ config BR2_ARM_INSTRUCTIONS_THUMB
 	# Thumb-1 and VFP are not compatible
 	depends on BR2_ARM_SOFT_FLOAT
 	help
-	  This option instructions the compiler to generate Thumb
+	  This option instructs the compiler to generate Thumb
 	  instructions, which allows to mix 16 bits instructions and
 	  32 bits instructions. This generally provides a much smaller
 	  compiled binary size.
@@ -790,7 +790,7 @@ config BR2_ARM_INSTRUCTIONS_THUMB2
 	bool "Thumb2"
 	depends on BR2_ARM_CPU_HAS_THUMB2
 	help
-	  This option instructions the compiler to generate Thumb2
+	  This option instructs the compiler to generate Thumb2
 	  instructions, which allows to mix 16 bits instructions and
 	  32 bits instructions. This generally provides a much smaller
 	  compiled binary size.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
