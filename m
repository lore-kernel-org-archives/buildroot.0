Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8F1C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 20:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BE383F15;
	Fri, 19 Jul 2024 20:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbLb-qa5UZUM; Fri, 19 Jul 2024 20:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B783383F16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B783383F16;
	Fri, 19 Jul 2024 20:58:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D26F21BF31F
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 20:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF58940B97
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 20:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRti6V2fcxNG for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 20:58:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 074D740B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 074D740B93
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074D740B93
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 20:58:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 399E4FF802;
 Fri, 19 Jul 2024 20:58:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 22:58:01 +0200
Message-ID: <20240719205802.2095144-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721422683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=clfrTyapAteY8JB6LtJvY5KbkKEV/ilO411vHynXSHQ=;
 b=hwMEY/eeakDFtj13bOkEFJdhMHW4sHEqm/sNmlTdrhSiv7uouPiT3teDygZqirfyXTnhKE
 WceZ7nZRzhU74B/WwbQJqhSM3nvLFpfMHkgQxhCYlsDzp/4UVc0r0bsYlvRnglnTXIWE6a
 tBdYxQ7Pu2saWv2mLeQaIJc35pvaGUg/En7cvOvWkxUOSBMta/9tfporJ7gR4WMcl4KwPs
 2ME+pE/I1B/+9K2VJdgJXFXWk7KTCq0i6pLLaaXjk8olrHDvCdeeWG7/SsrBbJNk1C+CGJ
 wWdBtnJlmZOzI11MUS9tgCoE+4yzFG5BRrZHeSxD3ayrt8JOBYDjYA0hE5YvtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hwMEY/ee
Subject: [Buildroot] [PATCH] arch/Config.in.x86: drop knightslanding and
 knightsmill archs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to the GCC 14.x release notes at
https://gcc.gnu.org/gcc-14/changes.html:

  Xeon Phi CPUs support (a.k.a. Knight Landing and Knight Mill) are
  marked as deprecated. GCC will emit a warning when using the
  -mavx5124fmaps, -mavx5124vnniw, -mavx512er, -mavx512pf,
  -mprefetchwt1, -march=knl, -march=knm, -mtune=knl or -mtune=knm
  compiler switches. Support will be removed in GCC 15.

Using those architectures already emits warnings, which when treated
as errors cause build failures, such as:

  cc1: error: '-march=knm' support will be removed in GCC 15 [-Werror=deprecated]
  cc1: all warnings being treated as errors

Therefore, let's drop support for those two architectures, which are
anyway not common at all, especially in the embedded space.

Fixes:

  http://autobuild.buildroot.net/results/ce98c41b22212f52bf7b53d84871b8e03409dbca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy   | 14 ++++++++++++++
 arch/Config.in.x86 | 26 --------------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 414a14944e..95fcf46bca 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_x86_knightslanding
+	bool "knightslanding x86 architecture support dropped"
+	select BR2_LEGACY
+	help
+	  GCC 14.x has marked this architecture as obsolete, and emits
+	  a warning causing build failures.
+
+config BR2_x86_knightsmill
+	bool "knightsmill x86 architecture support dropped"
+	select BR2_LEGACY
+	help
+	  GCC 14.x has marked this architecture as obsolete, and emits
+	  a warning causing build failures.
+
 config BR2_PACKAGE_CAIRO_SVG
 	bool "cairo svg support"
 	select BR2_LEGACY
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 93a223b7ae..f9b32130b2 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -379,30 +379,6 @@ config BR2_x86_grandridge
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
-config BR2_x86_knightslanding
-	bool "knightslanding"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-	select BR2_X86_CPU_HAS_SSSE3
-	select BR2_X86_CPU_HAS_SSE4
-	select BR2_X86_CPU_HAS_SSE42
-	select BR2_X86_CPU_HAS_AVX
-	select BR2_X86_CPU_HAS_AVX2
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-config BR2_x86_knightsmill
-	bool "knightsmill"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-	select BR2_X86_CPU_HAS_SSSE3
-	select BR2_X86_CPU_HAS_SSE4
-	select BR2_X86_CPU_HAS_SSE42
-	select BR2_X86_CPU_HAS_AVX
-	select BR2_X86_CPU_HAS_AVX2
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_x86_skylake_avx512
 	bool "skylake-avx512"
 	select BR2_X86_CPU_HAS_MMX
@@ -791,8 +767,6 @@ config BR2_GCC_TARGET_ARCH
 	default "tremont"	if BR2_x86_tremont
 	default "sierraforest"	if BR2_x86_sierraforest
 	default "grandridge"	if BR2_x86_grandridge
-	default "knl"		if BR2_x86_knightslanding
-	default "knm"		if BR2_x86_knightsmill
 	default "skylake-avx512" if BR2_x86_skylake_avx512
 	default "cannonlake"	if BR2_x86_cannonlake
 	default "icelake-client" if BR2_x86_icelake_client
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
