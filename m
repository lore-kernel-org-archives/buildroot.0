Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5ADC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC86812F1;
	Wed, 27 Jul 2022 15:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CC86812F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id waF8rTszkeGe; Wed, 27 Jul 2022 15:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF2B812CA;
	Wed, 27 Jul 2022 15:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF2B812CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FAFE1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B9A3405E7
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B9A3405E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWPWNA8mAfmo for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 571F84013D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 571F84013D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 11606866CE; Wed, 27 Jul 2022 14:48:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:58:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 786b7fb110f45d5d766fecd41151497e6e7000ab
X-Git-Newrev: 9e4da84a950d018ba84aa61efdc7a96f669871b8
X-Patchwork-Hint: ignore
Message-Id: <20220727144847.11606866CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/csky: drop architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e4da84a950d018ba84aa61efdc7a96f669871b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently have no internal and no external toolchain for csky.
The website is down (no https:// available, and the http:// index
page is 404).

This commit removes the architecture entry; remnants will be dropped in
followup changes.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy    |  7 +++++++
 DEVELOPERS          |  1 -
 arch/Config.in      | 14 --------------
 arch/Config.in.csky | 52 ----------------------------------------------------
 arch/arch.mk.csky   | 26 --------------------------
 5 files changed, 7 insertions(+), 93 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 949bca1cd0..24b4236ade 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
+config BR2_csky
+	bool "csky architecture removed"
+	select BR2_LEGACY
+	help
+	  The csky architecture was removed, by lack of toolchain
+	  support.
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 	bool "mesa DRI i915 driver removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6d6f25affd..700533dbf7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1186,7 +1186,6 @@ F:	support/testing/tests/package/sample_python_pybind.py
 F:	support/testing/tests/package/test_python_pybind.py
 
 N:	Guo Ren <ren_guo@c-sky.com>
-F:	arch/Config.in.csky
 F:	board/csky/
 F:	configs/csky_*
 
diff --git a/arch/Config.in b/arch/Config.in
index 1d38c7a065..1c0c400a98 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -70,16 +70,6 @@ config BR2_aarch64_be
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
 	  http://en.wikipedia.org/wiki/ARM
 
-config BR2_csky
-	bool "csky"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-	select BR2_USE_MMU
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
-	help
-	  csky is processor IP from china.
-	  http://www.c-sky.com/
-	  http://www.github.com/c-sky
-
 config BR2_i386
 	bool "i386"
 	select BR2_USE_MMU
@@ -376,10 +366,6 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
-if BR2_csky
-source "arch/Config.in.csky"
-endif
-
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
deleted file mode 100644
index b20b39e225..0000000000
--- a/arch/Config.in.csky
+++ /dev/null
@@ -1,52 +0,0 @@
-choice
-	prompt "Target Architecture Variant"
-	default BR2_ck610
-	help
-	  Specific CPU variant to use
-
-config BR2_ck610
-	# Not supported by upstream gcc <= 9, and handled as a special
-	# exception in package/gcc/Config.in.host
-	bool "ck610"
-
-config BR2_ck807
-	bool "ck807"
-
-config BR2_ck810
-	bool "ck810"
-
-config BR2_ck860
-	bool "ck860"
-
-endchoice
-
-config BR2_CSKY_FPU
-	bool "Enable FPU coprocessor"
-	depends on BR2_ck810 || BR2_ck807 || BR2_ck860
-	help
-	  You can say N here if your C-SKY CPU doesn't have a
-	  Floating-Point Coprocessor or if you don't need FPU support
-	  for your user-space programs.
-
-config BR2_CSKY_VDSP
-	bool "Enable VDSP enhanced instructions Co-processor"
-	depends on BR2_CSKY_FPU
-
-config BR2_GCC_TARGET_FLOAT_ABI
-	default "soft"		if !BR2_CSKY_FPU
-	default "hard"		if BR2_CSKY_FPU
-
-config BR2_ARCH
-	default "csky"
-
-config BR2_NORMALIZED_ARCH
-	default "csky"
-
-config BR2_ENDIAN
-	default "LITTLE"
-
-config BR2_READELF_ARCH_NAME
-	default "CSKY"
-
-# vim: ft=kconfig
-# -*- mode:kconfig; -*-
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
deleted file mode 100644
index fb59ae22fd..0000000000
--- a/arch/arch.mk.csky
+++ /dev/null
@@ -1,26 +0,0 @@
-#
-# Configure the GCC_TARGET_ARCH variable and append the
-# appropriate C-SKY ISA extensions.
-#
-
-ifeq ($(BR2_csky),y)
-
-ifeq ($(BR2_ck610),y)
-GCC_TARGET_CPU := ck610
-else ifeq ($(BR2_ck807),y)
-GCC_TARGET_CPU := ck807
-else ifeq ($(BR2_ck810),y)
-GCC_TARGET_CPU := ck810
-else ifeq ($(BR2_ck860),y)
-GCC_TARGET_CPU := ck860
-endif
-
-ifeq ($(BR2_CSKY_FPU),y)
-GCC_TARGET_CPU := $(GCC_TARGET_CPU)f
-endif
-
-ifeq ($(BR2_CSKY_VDSP),y)
-GCC_TARGET_CPU := $(GCC_TARGET_CPU)v
-endif
-
-endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
