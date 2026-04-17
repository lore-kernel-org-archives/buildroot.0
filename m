Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642EAF436B6
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195AD81702;
	Fri, 17 Apr 2026 15:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLdZExya2c00; Fri, 17 Apr 2026 15:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84AA981749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439223;
	bh=noyAf3xiqQyubjMyoaNIT2lQAJb4VqXBLwZVZDdGhrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y51BQ7Yc55xwROOwwRjPHwQPlkRlgJSm9RQkcNYiYWp4uFNYsH6RCa0Q0CiO65FM7
	 fP1v4AKWedt/1l5hWgLBz9wEIUUAGauSWm+wm6Q49zAVOgyZP/a1FjgRqHXg6BetEn
	 r0FFavRAsJEnYON5Ux0PqgFgWYdeQREhMLDV27oihPK1CIxAntOkXnDEZsvRdzn0rY
	 LaGpMhDqXsxqPIFCurvWO2ybbzV49+5yxWR61mnlbdnAfSjOJ4WAjnseahLUCy3T7d
	 KQJczy9BOdOJG1v6ag6P/o7OXUs6FVRyNiKd0MsLh1JLEvejvXi20O5juqoPRTyuiB
	 xbieAPE+sYC1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84AA981749;
	Fri, 17 Apr 2026 15:20:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D504E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97F0A40607
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68eliZDOE3xe for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93D9340608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93D9340608
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45B87819B9; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 16:06:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e8f97b0496450991c57d29d91ede57fcb0560c0
X-Git-Newrev: cf01628aa3cdedf73aa811252d238be4a09c9c96
X-Patchwork-Hint: ignore
Message-Id: <20260417152008.45B87819B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] arch: mark a set of
 target configurations as secondary
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf01628aa3cdedf73aa811252d238be4a09c9c96
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Those target configurations marked as "secondary" will be tested with a
lower probability in autobuilders. The intent is to focus the Buildroot
development (and bugfixes) on mainstream configurations, while still
keeping some other, less common, configurations.

This commit marks the following CPU architectures as secondary:

BR2_arcle (ARC little endian)
BR2_armeb (ARM big endian)
BR2_aarch64_be (AArch64 big endian)
BR2_hppa (PA-RISC)
BR2_loongarch64
BR2_m68k
BR2_microblazeel (Microblaze AXI, little endian)
BR2_microblazebe (Microblaze non-AXI, big endian)
BR2_mips (MIPS, big endian)
BR2_mipsel (MIPS, little endian)
BR2_mips64 (MIPS64 big endian)
BR2_or1k (OpenRISC)
BR2_powerpc (PowerPC, big endian)
BR2_powerpc64 (PowerPC64, big endian)
BR2_s390x
BR2_sh (SuperH)
BR2_sparc
BR2_sparc64
BR2_xtensa

In the following CPU architecture, only specific configurations are
marked secondary:

In BR2_armeb (ARM little endian),
- armv4 cores (arm920t, arm922t, fa526/626, strongarm sa110/sa1100)

In BR2_riscv:
- all 32-bit configurations
- 64-bit no-MMU

In BR2_i386 (x86 32-bit),
- i486, i586 and X1000 CPU

There was no strict rule established to build this list of secondary
configurations. This list was built mainly from the observation of
which architecture/CPUs are still widely used in the field
(disregarding its age), the quality of their upstream support and
the general relevance in the Buildroot project.

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Arnout: use !BR2_HIDE_SECONDARY_TARGET_OPTIONS instead of
BR2_SHOW_SECONDARY_TARGET_OPTIONS]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ddce0814a794b27a6449b144f85c90fa53e92ac6)
[thomas: kept x1000 & i586 as primary]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 arch/Config.in       | 17 +++++++++++++++++
 arch/Config.in.arm   |  5 +++++
 arch/Config.in.riscv |  2 ++
 arch/Config.in.x86   |  1 +
 4 files changed, 25 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 6b54c65df9..de15944eb2 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -23,6 +23,7 @@ choice
 
 config BR2_arcle
 	bool "ARC (little endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of
@@ -49,6 +50,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
@@ -67,6 +69,7 @@ config BR2_aarch64
 
 config BR2_aarch64_be
 	bool "AArch64 (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
@@ -82,6 +85,7 @@ config BR2_i386
 
 config BR2_m68k
 	bool "m68k"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
 	help
 	  Motorola 68000 family microprocessor
@@ -89,6 +93,7 @@ config BR2_m68k
 
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
@@ -98,6 +103,7 @@ config BR2_microblazeel
 
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
@@ -107,6 +113,7 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big
@@ -116,6 +123,7 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little
@@ -125,6 +133,7 @@ config BR2_mipsel
 
 config BR2_mips64
 	bool "MIPS64 (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -145,6 +154,7 @@ config BR2_mips64el
 
 config BR2_or1k
 	bool "OpenRISC"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  OpenRISC is a free and open processor for embedded system.
@@ -152,6 +162,7 @@ config BR2_or1k
 
 config BR2_powerpc
 	bool "PowerPC"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
@@ -161,6 +172,7 @@ config BR2_powerpc
 
 config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -191,6 +203,7 @@ config BR2_riscv
 
 config BR2_s390x
 	bool "s390x"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -200,6 +213,7 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
@@ -210,6 +224,7 @@ config BR2_sh
 
 config BR2_sparc
 	bool "SPARC"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
@@ -220,6 +235,7 @@ config BR2_sparc
 
 config BR2_sparc64
 	bool "SPARC64"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -240,6 +256,7 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
 	help
 	  Xtensa is a Tensilica processor IP architecture.
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f01dcc4d5a..6996f3d7ca 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -112,22 +112,27 @@ choice
 
 if !BR2_ARCH_IS_64
 comment "armv4 cores"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 config BR2_arm920t
 	bool "arm920t"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_arm922t
 	bool "arm922t"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_fa526
 	bool "fa526/626"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 23d095d1a6..f7ffd5fdc3 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -51,10 +51,12 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
+	select BR2_RISCV_USE_MMU if BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 endchoice
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f9b32130b2..34ab056b5f 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -42,6 +42,7 @@ choice
 
 config BR2_x86_i486
 	bool "i486"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_i586
 	bool "i586"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
