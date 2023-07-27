Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57185C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8808813EA;
	Thu, 27 Jul 2023 21:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8808813EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WC5BMwXBKDuS; Thu, 27 Jul 2023 21:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E28813BB;
	Thu, 27 Jul 2023 21:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E28813BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 526B21BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C6A2418AF
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6A2418AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIfvDnN0RasZ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 115294020B
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 115294020B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F104383725; Thu, 27 Jul 2023 21:13:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:13:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1738b5582ba0cf715303f4ebfa1d2323a33d0ae4
X-Git-Newrev: f82a65b15b1805b9cbde0220e68e0267d0dbdb2b
X-Patchwork-Hint: ignore
Message-Id: <20230727211347.F104383725@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: drop AVX512 from
 alderlake
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f82a65b15b1805b9cbde0220e68e0267d0dbdb2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alder Lake CPUs have AVX512 support disabled [0].

To prevent potential issues, remove the AVX512 support advertisement.

This puts Buildroot inline with the GCC options [1].

[0]: https://www.intel.com/content/www/us/en/support/articles/000089918/processors.html
[1]: https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html

Fixes: e7b94130 ("arch/Config.in.x86: add sapphirerapids, alderlake, rocketlake")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 38e486eafd..8ddd1fa994 100644
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
