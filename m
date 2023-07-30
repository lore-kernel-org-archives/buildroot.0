Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6F0C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 17:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7FCC405A2;
	Sun, 30 Jul 2023 17:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7FCC405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJggHqpdZ4VK; Sun, 30 Jul 2023 17:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C5A1408C0;
	Sun, 30 Jul 2023 17:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C5A1408C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7071BF3BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3D5F60F14
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3D5F60F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvZspflS_6jB for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 17:32:47 +0000 (UTC)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4EA560F12
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 17:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4EA560F12
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1a1fa977667so2969290fac.1
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690738366; x=1691343166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VPuzPCxjR3kSIHiAKH7zoWJRzyQTAw3LQXlPCudbE7g=;
 b=RJd/k7tzxhVfKk5a0FrMpe2ccxcgCKttDta7knwa+QiuAFU2ZnS1TUaAdxSG+7L1Zn
 e+pN54S8L4RCiXhWOIAORWkjZddaw/VXX9OpasIuAwdwmgl0OZDRRtG7UyMToCj35hwm
 XNdn/gU5+5v22LeuDbjr21OYKyDxyDXM6NRTlJN+1sTB1XrFcStfw1hOid2KjV1RUfRK
 PDSuJyrbBAXj1HQQgDmGoUZIL7Og6VrPx1EjWfNjNJf4RsAmDTd6OtQ0o/g0PIvlhST0
 nj+fiGcnzGevHBa651kUJjqsXlpJLLPAX0l0QpADgrDOxker5iyNO0YTiNo5R4LQ5ZmG
 8BtA==
X-Gm-Message-State: ABy/qLaGeGnn6BVNcaKnM11UQI5IAZKlyaD/HB+j/hrjLPOgk1zQWf/a
 exICAY6+ZzY7xei73u/QcX/vnwpZnBY=
X-Google-Smtp-Source: APBJJlHEe0pcVpRgzOXITNFc4qkGrgZVtqPje5y74LzmdK926M7m46lKldE8dS9yFwYM4G0LQ5V1pA==
X-Received: by 2002:a05:6870:a413:b0:1b7:3359:58b2 with SMTP id
 m19-20020a056870a41300b001b7335958b2mr9612365oal.39.1690738366177; 
 Sun, 30 Jul 2023 10:32:46 -0700 (PDT)
Received: from localhost.localdomain
 (76-250-43-185.lightspeed.mdsnwi.sbcglobal.net. [76.250.43.185])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a9d6847000000b006b95392cf09sm3414273oto.33.2023.07.30.10.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 10:32:45 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:32:42 -0500
Message-Id: <20230730173242.6669-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690738366; x=1691343166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VPuzPCxjR3kSIHiAKH7zoWJRzyQTAw3LQXlPCudbE7g=;
 b=cTOZKFu1vOHwpESCydkgXZYq9eHdGmghXiW+SGORAUuBcI+6IaGXQHiYJ5/UL8yqUr
 /FbJEhQKrrphgMrjQaBj2hbcFq3eXkJ7nMSOih2RrfT0jkL4Ue2q7LiecuXT7lUu4rNY
 luOb3PbmhfhwDrEiSD3teKa1DKZajkcgqTP+X5z4/OEglgfG8MCEyE9sOrzG2gxX4w2r
 aiC67KYBadwUaW83LsfvDgmGRU8GJlSj7ph7JSe+PLJ6FzSWMwah5NCApxPtWskYU64P
 DIfmsKbnBzggEplFZf/Vfw/fWKEGRpuGJ15ZKeu02g5AhNn1UGWvXVA79c0lVwv9XuAg
 I4bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cTOZKFu1
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.x86: add Intel and AMD GCC
 targets
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
Cc: Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sync the CPU target list with what's available up to GCC 13.

Multiple references used for flags and synonyms [0] [1] [2] [3].

[0]: https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
[1]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/config/i386/i386.h;hb=refs/tags/releases/gcc-13.2.0
[2]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/common/config/i386/i386-common.cc;hb=refs/tags/releases/gcc-13.2.0
[3]: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 arch/Config.in.x86 | 199 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 198 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 8ddd1fa994..d7b84df1e9 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -19,12 +19,17 @@ config BR2_X86_CPU_HAS_AVX
 	bool
 config BR2_X86_CPU_HAS_AVX2
 	bool
+
+# BR2_X86_CPU_HAS_AVX512 is used to enable the x86_64-v4 toolchain(s).
+# Some CPUs have a _subset_ of AVX512, but do not meet the minimum requirements
+# for x86_64-v4 (AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL).
+# Reference: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512
 config BR2_X86_CPU_HAS_AVX512
 	bool
 
 # This list of CPU architecture variant is (loosely) ordered according
 # to the gcc documentation at
-# https://gcc.gnu.org/onlinedocs/gcc-11.2.0/gcc/x86-Options.html
+# https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
 choice
 	prompt "Target Architecture Variant"
 	default BR2_x86_i586 if BR2_i386
@@ -227,6 +232,17 @@ config BR2_x86_sandybridge
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+config BR2_x86_ivybridge
+	bool "ivybridge"
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
@@ -335,6 +351,54 @@ config BR2_x86_tremont
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_sierraforest
+	bool "sierraforest"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+config BR2_x86_grandridge
+	bool "grandridge"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+config BR2_x86_knightslanding
+	bool "knightslanding"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+config BR2_x86_knightsmill
+	bool "knightsmill"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_x86_skylake_avx512
 	bool "skylake-avx512"
 	select BR2_X86_CPU_HAS_MMX
@@ -439,6 +503,8 @@ config BR2_x86_sapphirerapids
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  Use for Sapphire Rapids, Emerald Rapids
 config BR2_x86_alderlake
 	bool "alderlake"
 	select BR2_X86_CPU_HAS_MMX
@@ -451,6 +517,8 @@ config BR2_x86_alderlake
 	select BR2_X86_CPU_HAS_AVX
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+	help
+	  Use for Alder Lake, Raptor Lake, Meteor Lake
 config BR2_x86_rocketlake
 	bool "rocketlake"
 	select BR2_X86_CPU_HAS_MMX
@@ -464,6 +532,32 @@ config BR2_x86_rocketlake
 	select BR2_X86_CPU_HAS_AVX2
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_x86_graniterapids
+	bool "graniterapids"
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
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+config BR2_x86_graniterapids_d
+	bool "graniterapids-d"
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
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 config BR2_x86_k6
 	bool "k6"
 	depends on !BR2_x86_64
@@ -501,6 +595,13 @@ config BR2_x86_barcelona
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+config BR2_x86_bobcat
+	bool "bobcat"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_jaguar
 	bool "jaguar"
 	select BR2_X86_CPU_HAS_MMX
@@ -510,6 +611,25 @@ config BR2_x86_jaguar
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
+config BR2_x86_bulldozer
+	bool "bulldozer"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+config BR2_x86_piledriver
+	bool "piledriver"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_steamroller
 	bool "steamroller"
 	select BR2_X86_CPU_HAS_MMX
@@ -519,6 +639,68 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSSE3
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
+config BR2_x86_excavator
+	bool "excavator"
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
+config BR2_x86_zen
+	bool "zen"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_x86_zen2
+	bool "zen 2"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_x86_zen3
+	bool "zen 3"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
+	select BR2_X86_CPU_HAS_AVX
+	select BR2_X86_CPU_HAS_AVX2
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_x86_zen4
+	bool "zen 4"
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
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 config BR2_x86_geode
 	bool "geode (no mmx)"
 	depends on !BR2_x86_64
@@ -603,6 +785,7 @@ config BR2_GCC_TARGET_ARCH
 	default "nehalem"	if BR2_x86_nehalem
 	default "corei7-avx"	if BR2_x86_corei7_avx
 	default "sandybridge"	if BR2_x86_sandybridge
+	default "ivybridge"	if BR2_x86_ivybridge
 	default "core-avx2"	if BR2_x86_core_avx2
 	default "haswell"	if BR2_x86_haswell
 	default "broadwell"	if BR2_x86_broadwell
@@ -614,6 +797,10 @@ config BR2_GCC_TARGET_ARCH
 	default "goldmont"	if BR2_x86_goldmont
 	default "goldmont-plus"	if BR2_x86_goldmont_plus
 	default "tremont"	if BR2_x86_tremont
+	default "sierraforest"	if BR2_x86_sierraforest
+	default "grandridge"	if BR2_x86_grandridge
+	default "knl"		if BR2_x86_knightslanding
+	default "knm"		if BR2_x86_knightsmill
 	default "skylake-avx512" if BR2_x86_skylake_avx512
 	default "cannonlake"	if BR2_x86_cannonlake
 	default "icelake-client" if BR2_x86_icelake_client
@@ -624,11 +811,21 @@ config BR2_GCC_TARGET_ARCH
 	default "sapphirerapids" if BR2_x86_sapphirerapids
 	default "alderlake"	if BR2_x86_alderlake
 	default "rocketlake"	if BR2_x86_rocketlake
+	default "graniterapids"	if BR2_x86_graniterapids
+	default "graniterapids-d"	if BR2_x86_graniterapids_d
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver1"	if BR2_x86_bobcat
 	default "btver2"	if BR2_x86_jaguar
+	default "bdver1"	if BR2_x86_bulldozer
+	default "bdver2"	if BR2_x86_piledriver
 	default "bdver3"	if BR2_x86_steamroller
+	default "bdver4"	if BR2_x86_excavator
+	default "znver1"	if BR2_x86_zen
+	default "znver2"	if BR2_x86_zen2
+	default "znver3"	if BR2_x86_zen3
+	default "znver4"	if BR2_x86_zen4
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
