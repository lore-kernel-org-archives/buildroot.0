Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6CE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sjnnEQSN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2C160D69;
	Fri, 30 Oct 2026 14:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwWL2Q0GV2pT; Fri, 30 Oct 2026 14:20:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 124A860D6C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370006;
	b=DEFiEUQBuW+NR8cHlPO9TfEPcoZXQ7LGzjUzuXzFfjpRTdqjBVGRhm493cEFZAqtQZvU
	 3jnml0sOlc01n77V1KeLCiiQz6aflxmsAM7AYTq0mHvSMa3p4SzTRBS2hxd49VEvejdwe
	 4O5njcUT3fgQiP/JZeusvddUz2ZYPpnKVFrWf5htju/qWuLI8MQ24PwI2XAqQP57WOx0P
	 D/hOD70UAkFcb/iCkrzFkatC25egjgJr4pNbXbkmkL3FywIvsjh/gIR7dDMKKMsuJlRaj
	 P7llNXni0rxqI1jDix+9qAGAquYgq3zb0NbWXh1NPfUrxrzxheN5CpiQywfc3vn2FYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370006;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zln7bqWmCp+gBloFGvqik2d5W3EkYQOlg0gU5WeCj5s=;
	b=Fd7Kln2a1G1LWE9pxKyRzcrzU+e3dx6TKBdrxwPOwa2MuaYhbzrYYvXg6AR1GQLRj2+O
	 7T3ifnIcxfLHWHfePIZTZuDKUMpq7bF5aog+9yvqbH2lg+Zwk1LetEacyHPMmPp0pFhnx
	 g0bdp9H69o4d+B95Mg9vnKtYdzti/iK2aHtGHmvKamTVag2kbNZqJpkjIpBPKEcs4EdZ0
	 eSe9P+tq1Dv3ecTybUbSS4yvb/dY7lAncT9pUHNBzvhJ2uJ1hvj3sSoMfo9OhUhPKL4H0
	 A2l5J4N8d2u74wSxu+BvQ3FKDgJit+14LUzjIaFAgOW7oWWcvOiS/paq2PEj2dEBMLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370006;
	bh=zln7bqWmCp+gBloFGvqik2d5W3EkYQOlg0gU5WeCj5s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sjnnEQSNsvtVW79rSPwxeeWgCJrM0zr8neRzP/oaEt/FhpEb1e0IfF2iNJ/aN6UC5
	 +bbaSjsTwWKLRrjumfOBu9ZmLycqE6Wa6DffvcDan4zHJiLDluqAPGcW99fLRA1Khm
	 oHPuyetT8npnjTjv57/jxFGGYrSqrJFxoLFG3iPXgcOjp3CD5/Fwmqcp71fvQI3Zae
	 mJJRy7Trw19usKC7VE4lIb9ZsydaDfq2U+WA18qSPa4t5RgpXlW+fOlXTy+lWXBNNs
	 Ai3pOv4v8m5MNSE+AAjnq1SQjabHZdtceh2SFnbymLjJY+Qcf4dQ1ATQEzDPZ63MIN
	 wA6RhVX0l8tgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 124A860D6C;
	Fri, 30 Oct 2026 14:20:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA02D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B721B81332
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFJRbjLKywzv for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5C3FB812F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=fh2j/jWfw0R2AiBRIpPwM+/urfKHD30mS1QVNx2PDAXRvIagTXSL9Vbkef7X41Kj5s5G
 9jYMIjHLZ2EOVqjUheCCP9J01Vho8p+jOi4YKY7nbRhiTmgC40ma899YdzmWE6SEF4gfG
 hcNt5E03YYYuj3XDUPATc8rt7YaLdDYUC/KA9FWFfgakDaAqvFfIgKW926ZfqetgcoHTg
 acfD0Gg7ogLmIk5OvXUUttApFr9aieHeIhCITpI8mEzFvkpEcsIbVYVZZsksMQEKgLI/J
 HeSZM2YI5idEMwCWZNLTMQbAuyzVvwf/MK+09jAOcAwjHOnQTvOti6tluDJbLLK5XxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GNU5ZM6WcEgjntO38hjCblZH98ahFMee0lwIvZHJTF8=;
 b=nJG/7OF8FmdaGZiEvt/h1drKttHJyXsUpDm9ZK5yZpjB6tfpkaGIodwHMXdEkjGCdFGc
 nLjszBtoa50XjbBhfxfEwXlZwuWAnH/eLPt6KbWASuO4TiCB+ux6sR7lRbBIIEga1M9Cg
 Ov0E4hWmXlPKmwPAi9UkYyApdFYiOcld7cqFRWvl9Juc4u3W8J1ug181geoJDDPGsPexv
 yumU44YhNCBOohiVTzuv9tFc6zLe5y0LXJps2ykmJq+RXdu/p6tOIPbHFu4bxtvEL/9y7
 nFy5F6JoqSeaIVQOPaTsg9hNj+wgcM6rNDVvP0N8z6dJVXw/kYKFGGAV/224PdGPamA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C3FB812F1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AAD79D388; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b6037472a70785559c53ca705496cfc902655444
X-Git-Newrev: 06c4fae57c1ed3591fb23f7d2133914e089f72ea
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.7AAD79D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] Revert "arch: mark a set
 of target configurations as secondary"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3378290897891424290=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3378290897891424290==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06c4fae57c1ed3591fb23f7d2133914e089f72ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit ddce0814a794b27a6449b144f85c90fa53e92ac6.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 41f52f982a2c974258f23cf16c3722aba1bcb343)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 arch/Config.in       | 19 -------------------
 arch/Config.in.arm   |  5 -----
 arch/Config.in.riscv |  2 --
 arch/Config.in.x86   |  3 ---
 4 files changed, 29 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 863a1eed34..7bfa174b5f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -23,7 +23,6 @@ choice
 
 config BR2_arcle
 	bool "ARC (little endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of
@@ -42,7 +41,6 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
@@ -61,7 +59,6 @@ config BR2_aarch64
 
 config BR2_aarch64_be
 	bool "AArch64 (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
@@ -70,7 +67,6 @@ config BR2_aarch64_be
 
 config BR2_hppa
 	bool "HPPA"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Precision Architecture (a.k.a. PA-RISC) is a 32-bit
@@ -86,7 +82,6 @@ config BR2_i386
 
 config BR2_loongarch64
 	bool "LoongArch64"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
@@ -97,7 +92,6 @@ config BR2_loongarch64
 
 config BR2_m68k
 	bool "m68k"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
 	help
 	  Motorola 68000 family microprocessor
@@ -105,7 +99,6 @@ config BR2_m68k
 
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
@@ -115,7 +108,6 @@ config BR2_microblazeel
 
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
@@ -125,7 +117,6 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big
@@ -135,7 +126,6 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little
@@ -145,7 +135,6 @@ config BR2_mipsel
 
 config BR2_mips64
 	bool "MIPS64 (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -166,7 +155,6 @@ config BR2_mips64el
 
 config BR2_or1k
 	bool "OpenRISC"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  OpenRISC is a free and open processor for embedded system.
@@ -174,7 +162,6 @@ config BR2_or1k
 
 config BR2_powerpc
 	bool "PowerPC"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
@@ -184,7 +171,6 @@ config BR2_powerpc
 
 config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -215,7 +201,6 @@ config BR2_riscv
 
 config BR2_s390x
 	bool "s390x"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -225,7 +210,6 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
@@ -236,7 +220,6 @@ config BR2_sh
 
 config BR2_sparc
 	bool "SPARC"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
@@ -247,7 +230,6 @@ config BR2_sparc
 
 config BR2_sparc64
 	bool "SPARC64"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -268,7 +250,6 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
 	help
 	  Xtensa is a Tensilica processor IP architecture.
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 5c9037c959..eb5babe29b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -112,27 +112,22 @@ choice
 
 if !BR2_ARCH_IS_64
 comment "armv4 cores"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 config BR2_arm920t
 	bool "arm920t"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_arm922t
 	bool "arm922t"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_fa526
 	bool "fa526/626"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 8801590d80..299190f364 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -58,12 +58,10 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
-	select BR2_RISCV_USE_MMU if BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 endchoice
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 51b157409f..0a6d80bf03 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -50,15 +50,12 @@ choice
 
 config BR2_x86_i486
 	bool "i486"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_i586
 	bool "i586"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_x1000
 	bool "x1000"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 	help
 	  The Intel X1000 is a Pentium class microprocessor in the

--===============3378290897891424290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3378290897891424290==--
