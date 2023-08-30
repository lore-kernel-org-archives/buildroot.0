Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15EAC83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC5941D98;
	Wed, 30 Aug 2023 11:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BC5941D98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA0XSI1cRshN; Wed, 30 Aug 2023 11:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2B441DA4;
	Wed, 30 Aug 2023 11:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A2B441DA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 145531BF980
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F7B81452
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F7B81452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iz83zSUP4toj for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A40D8149D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A40D8149D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E8BF86588; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:53:52 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6695c97334d4be52370d78774eb39223257298de
X-Git-Newrev: e57158821e4225bdef7dc265a0843147e5b3632c
X-Patchwork-Hint: ignore
Message-Id: <20230830110347.3E8BF86588@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] arch/Config.in.x86: drop
 AVX512 from alderlake
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

commit: https://git.buildroot.net/buildroot/commit/?id=e57158821e4225bdef7dc265a0843147e5b3632c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Alder Lake CPUs have AVX512 support disabled [0].

To prevent potential issues, remove the AVX512 support advertisement.

This puts Buildroot inline with the GCC options [1].

[0]: https://www.intel.com/content/www/us/en/support/articles/000089918/processors.html
[1]: https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html

Fixes: e7b94130 ("arch/Config.in.x86: add sapphirerapids, alderlake, rocketlake")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f82a65b15b1805b9cbde0220e68e0267d0dbdb2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index c770ae3ffe..56ce1eb0cc 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -450,7 +450,6 @@ config BR2_x86_alderlake
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
-	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_x86_rocketlake
 	bool "rocketlake"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
