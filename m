Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58ED260B57;
	Tue, 25 Jan 2022 07:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gh8C52n_LXsc; Tue, 25 Jan 2022 07:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7325760B3B;
	Tue, 25 Jan 2022 07:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 388DF1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07B2F60F20
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Cp9Nclaaiu1 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4767E60B57
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5432E82774; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73d135a695cf59eb8ab6aafb59bfd281a7400203
X-Git-Newrev: 653fa001f30414165cb54dde577688d78cca6b42
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.5432E82774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add "newer" names for
 several Intel x86 CPU variants
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

commit: https://git.buildroot.net/buildroot/commit/?id=653fa001f30414165cb54dde577688d78cca6b42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In gcc commit d3c11974032e21121a051d423a1d71097edf752f ("Use proper
Intel processor names for -march=/-mtune="), which was merged in gcc
4.9, the following replacements were made:

 * corei7     -> nehalem
 * corei7-avx -> sandybridge
 * core-avx-i -> ivybridge
 * core-avx2  -> haswell
 * atom       -> bonnel
 * slm        -> silvermont

So this commit marks the Buildroot options BR2_x86_corei7,
BR2_x86_corei7_avx, BR2_x86_core_avx2 and BR2_x86_atom as deprecated,
and adds the four corresponding options with the newer names.

Note that the older options are still kept because the new option
names are only supported starting gcc 4.9, and we theoretically still
supports targets gcc as old as gcc 4.3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index a330d72f1d..4beb11662d 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -174,6 +174,19 @@ config BR2_x86_corei7
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "nehalem" is preferred. Use BR2_x86_nehalem instead.
+config BR2_x86_nehalem
+	bool "nehalem"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_westmere
 	bool "westmere"
 	select BR2_X86_CPU_HAS_MMX
@@ -193,6 +206,20 @@ config BR2_x86_corei7_avx
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "sandybridge" is preferred. Use BR2_x86_sandybridge instead.
+config BR2_x86_sandybridge
+	bool "sandybridge"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_core_avx2
 	bool "core-avx2"
 	select BR2_X86_CPU_HAS_MMX
@@ -204,6 +231,21 @@ config BR2_x86_core_avx2
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "haswell" is preferred. Use BR2_x86_haswell instead.
+config BR2_x86_haswell
+	bool "haswell"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_atom
 	bool "atom"
 	select BR2_X86_CPU_HAS_MMX
@@ -211,6 +253,17 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	help
+	  This option is deprecated. Since gcc 4.9, the gcc option
+	  "bonnel" is preferred. Use BR2_x86_bonnel instead.
+config BR2_x86_bonnel
+	bool "bonnel"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_x86_silvermont
 	bool "silvermont"
 	select BR2_X86_CPU_HAS_MMX
@@ -341,9 +394,13 @@ config BR2_GCC_TARGET_ARCH
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
 	default "corei7"	if BR2_x86_corei7
+	default "nehalem"	if BR2_x86_nehalem
 	default "corei7-avx"	if BR2_x86_corei7_avx
+	default "sandybridge"	if BR2_x86_sandybridge
 	default "core-avx2"	if BR2_x86_core_avx2
+	default "haswell"	if BR2_x86_haswell
 	default "atom"		if BR2_x86_atom
+	default "bonnel"	if BR2_x86_bonnel
 	default "westmere"	if BR2_x86_westmere
 	default "silvermont"	if BR2_x86_silvermont
 	default "k8"		if BR2_x86_opteron
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
