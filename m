Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47442F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE25817A6;
	Fri, 17 Apr 2026 15:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUEt83sakRwA; Fri, 17 Apr 2026 15:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1781D81773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439376;
	bh=mvx1wNxXrF1IoHtFfI5U2zZqr1tk+/u2Qc7irR+sItI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sS9hZD6XzcrEtl37loQonvPewav5fS5oDpRhr7f/ViZ0wArGrW9VMyHd4XZc9Jwth
	 QJ92//MGhTKIRb4rxEPtb+JQh9BFqhoeg67OgL0cDw9H8IY1eor0AtVx9liGrrR+Lq
	 KMfgOi4el7s1uekA8XOj4FTo/tJEihzDQigaEUjf66sov8hLDPiNY1VDT3g3cMxY42
	 VF0fLBC3hCMwoZ17lbelhR604lM6DlTkCmVnLnZ57Ej2LmPeNmWOdmH0p4jO4AijM7
	 4DEI5hti/05jhuodsPU3N0mla0olito3HoKrtjH5vWSCONWhOEBzyI0GL/IjsHfttk
	 3UEAf1DrFzfJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1781D81773;
	Fri, 17 Apr 2026 15:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F98D396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FA7440DF0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-NnB1D_3oGZ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFC2940DEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFC2940DEC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62F0F81DD9; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:04 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: bf5c58e0d36220cd3a15873453db63819a7b8e99
X-Git-Newrev: bbfbabcc50b7b051a9fde67c0c37ce2739846c19
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.62F0F81DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] arch: mark a set of
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbfbabcc50b7b051a9fde67c0c37ce2739846c19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 arch/Config.in       | 19 +++++++++++++++++++
 arch/Config.in.arm   |  5 +++++
 arch/Config.in.riscv |  2 ++
 arch/Config.in.x86   |  3 +++
 4 files changed, 29 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index bdfc2b092c..624b5e9d21 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -23,6 +23,7 @@ choice
 
 config BR2_arcle
 	bool "ARC (little endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of
@@ -41,6 +42,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
@@ -59,6 +61,7 @@ config BR2_aarch64
 
 config BR2_aarch64_be
 	bool "AArch64 (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
@@ -67,6 +70,7 @@ config BR2_aarch64_be
 
 config BR2_hppa
 	bool "HPPA"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Precision Architecture (a.k.a. PA-RISC) is a 32-bit
@@ -82,6 +86,7 @@ config BR2_i386
 
 config BR2_loongarch64
 	bool "LoongArch64"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
@@ -92,6 +97,7 @@ config BR2_loongarch64
 
 config BR2_m68k
 	bool "m68k"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
 	help
 	  Motorola 68000 family microprocessor
@@ -99,6 +105,7 @@ config BR2_m68k
 
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
@@ -108,6 +115,7 @@ config BR2_microblazeel
 
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
@@ -117,6 +125,7 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big
@@ -126,6 +135,7 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little
@@ -135,6 +145,7 @@ config BR2_mipsel
 
 config BR2_mips64
 	bool "MIPS64 (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -155,6 +166,7 @@ config BR2_mips64el
 
 config BR2_or1k
 	bool "OpenRISC"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  OpenRISC is a free and open processor for embedded system.
@@ -162,6 +174,7 @@ config BR2_or1k
 
 config BR2_powerpc
 	bool "PowerPC"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
@@ -171,6 +184,7 @@ config BR2_powerpc
 
 config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -201,6 +215,7 @@ config BR2_riscv
 
 config BR2_s390x
 	bool "s390x"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -210,6 +225,7 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
@@ -220,6 +236,7 @@ config BR2_sh
 
 config BR2_sparc
 	bool "SPARC"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
@@ -230,6 +247,7 @@ config BR2_sparc
 
 config BR2_sparc64
 	bool "SPARC64"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -250,6 +268,7 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
 	help
 	  Xtensa is a Tensilica processor IP architecture.
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a0bf6c3386..313073db5c 100644
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
index 299190f364..8801590d80 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -58,10 +58,12 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
+	select BR2_RISCV_USE_MMU if BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 endchoice
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f9b32130b2..64decb3460 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -42,12 +42,15 @@ choice
 
 config BR2_x86_i486
 	bool "i486"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_i586
 	bool "i586"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_x1000
 	bool "x1000"
+	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 	help
 	  The Intel X1000 is a Pentium class microprocessor in the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
