Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F46EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA5840A91;
	Tue, 25 Jan 2022 07:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tivCRlwcwsFA; Tue, 25 Jan 2022 07:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CB1A4034A;
	Tue, 25 Jan 2022 07:59:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2CF1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A62040448
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nu87gqr52zkb for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AF1A40A8A
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A3BBC8233A; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b84dcf9686f7e97249676915b7c042f3624e453
X-Git-Newrev: e7b9413056ccc1a359375c756c3f3c4e7e96e344
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.A3BBC8233A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add sapphirerapids,
 alderlake, rocketlake
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7b9413056ccc1a359375c756c3f3c4e7e96e344
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These were added in gcc 11.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 08837b7cea..cae5502051 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -423,6 +423,45 @@ config BR2_x86_tigerlake
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_sapphirerapids
+	bool "sapphirerapids"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_x86_alderlake
+	bool "alderlake"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_x86_rocketlake
+	bool "rocketlake"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_X86_CPU_HAS_AVX512
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_x86_k6
 	bool "k6"
 	depends on !BR2_x86_64
@@ -565,6 +604,9 @@ config BR2_GCC_TARGET_ARCH
 	default "cascadelake"	if BR2_x86_cascadelake
 	default "cooperlake"	if BR2_x86_cooperlake
 	default "tigerlake"	if BR2_x86_tigerlake
+	default "sapphirerapids" if BR2_x86_sapphirerapids
+	default "alderlake"	if BR2_x86_alderlake
+	default "rocketlake"	if BR2_x86_rocketlake
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
