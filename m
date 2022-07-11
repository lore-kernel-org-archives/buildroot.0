Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EB5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9B82409E2;
	Mon, 11 Jul 2022 17:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B82409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVJHwFBVnndW; Mon, 11 Jul 2022 17:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B21F840488;
	Mon, 11 Jul 2022 17:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B21F840488
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8361BF9AC
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19C9160BF7
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19C9160BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxHK5Wf2Cok7 for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4015C60B8C
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4015C60B8C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6240483747; Mon, 11 Jul 2022 17:14:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:10:43 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 7b690727335c1076df05c03e9b3587ad29af47ae
X-Git-Newrev: 96429716fcdc1c0a2268e47c7cb73caf944a9464
X-Patchwork-Hint: ignore
Message-Id: <20220711171457.6240483747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate after
 i686 toolchain dependency fixes
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

commit: https://git.buildroot.net/buildroot/commit/?id=96429716fcdc1c0a2268e47c7cb73caf944a9464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes:

  http://autobuild.buildroot.net/results/56ac1a8fa5b34a9ca10eef98ae9fb090b8c762c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ae8177b18a03b5e1e1a22f92ccfab3d3ac31f4e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-bootlin/Config.in.options   | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 825556a5da..6e98a1dfda 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -44,7 +44,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42 && BR2_X86_CPU_HAS_AVX && BR2_X86_CPU_HAS_AVX2 && BR2_X86_CPU_HAS_AVX512
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
 	default y if BR2_i386 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3
-	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000
+	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000 && !BR2_x86_pentium_mmx && !BR2_x86_geode && !BR2_x86_c3 && !BR2_x86_winchip_c6 && !BR2_x86_winchip2
 	default y if BR2_xtensa && BR2_XTENSA_CUSTOM && BR2_XTENSA_LITTLE_ENDIAN
 
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
@@ -4668,6 +4668,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -4695,6 +4700,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -4722,6 +4732,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -4747,6 +4762,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
@@ -4771,6 +4791,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -4797,6 +4822,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
