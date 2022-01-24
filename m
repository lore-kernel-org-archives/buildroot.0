Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7175BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259F360EED;
	Mon, 24 Jan 2022 23:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xg-8kpj4cwhx; Mon, 24 Jan 2022 23:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC0F60B06;
	Mon, 24 Jan 2022 23:03:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A66731BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9407184BA0
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOET5DDrA7FN for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8886884C2E
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32EC8E0002;
 Mon, 24 Jan 2022 23:01:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:01:11 +0100
Message-Id: <20220124230116.203218-14-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 13/16] arch/Config.in.x86: add goldmont,
 goldmont-plus, tremont, cascadelake, tigerlake CPU variants
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These were added in gcc 9.x. The goldmont, goldmont-plus and tremont
are for the low-power CPUs. While cascadelake and tigerlake are for
the high-end ones.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index e9c55bb319..dffc9a74d3 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -302,6 +302,36 @@ config BR2_x86_silvermont
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+config BR2_x86_goldmont
+	bool "goldmont"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_goldmont_plus
+	bool "goldmont-plus"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_tremont
+	bool "tremont"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_x86_skylake_avx512
 	bool "skylake-avx512"
 	select BR2_X86_CPU_HAS_MMX
@@ -354,6 +384,32 @@ config BR2_x86_icelake_server
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+config BR2_x86_cascadelake
+	bool "cascadelake"
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
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_tigerlake
+	bool "tigerlake"
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
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_x86_k6
 	bool "k6"
 	depends on !BR2_x86_64
@@ -486,10 +542,15 @@ config BR2_GCC_TARGET_ARCH
 	default "bonnel"	if BR2_x86_bonnel
 	default "westmere"	if BR2_x86_westmere
 	default "silvermont"	if BR2_x86_silvermont
+	default "goldmont"	if BR2_x86_goldmont
+	default "goldmont-plus"	if BR2_x86_goldmont_plus
+	default "tremont"	if BR2_x86_tremont
 	default "skylake-avx512" if BR2_x86_skylake_avx512
 	default "cannonlake"	if BR2_x86_cannonlake
 	default "icelake-client" if BR2_x86_icelake_client
 	default "icelake-server" if BR2_x86_icelake_server
+	default "cascadelake"	if BR2_x86_cascadelake
+	default "tigerlake"	if BR2_x86_tigerlake
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
