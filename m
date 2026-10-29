Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC30606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dVCReZnO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D59640C19;
	Fri, 30 Oct 2026 14:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQC1ZgJwFMWi; Fri, 30 Oct 2026 14:08:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3782B40C40
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369288;
	b=K4H9PPU9k4UNQTsygTw3bNs1zy8V7nxeG/N7MK0RnObOaKZTtqFViujE98OJPu/T3NfQ
	 EKOdj8D0Ooan05zfqK0Hbh8xBLIw4r0NhYCn7Urnwzh9zB4frNGwr1rjof1tnTAshVl0B
	 S4zrDAsf46/4PvhB0r6h9JSGsX1HNwuhHnayE8H+3RzypBvU40YwNM+zOmfiNSE90s2RX
	 GkEcEHPnMinvuyVTR4/PmFZVZbvuGyUj1jMXF+BGGii/4OdmMRb3OWypGl85iqkdEeRtV
	 8ufaNZs2nolcI1oEws9s0O1JO8pqTXeJQhOalY0fK+pKimH7tVZ8GAfQWMNOF90yV5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wqIj7uEBpcHS+AFVmSw6qjOxs1ZU7s2jx2lFAbqtyX8=;
	b=GaximWGhFMlvEk5/4ocjtctCnYGf5JA6gtab7WcuF4UeVhG2LCRKqIcWi7Jz72ZJIL2o
	 zNQP4vgV6Jr5euWwdNmIUONRQsQrJYqfXocM/kejn58aT4mI4w4nuSWaqeFVnb4B62ESI
	 dG12Kn/wwnw6j/XUs4Tz89V1IPvjHH/APhkleLqTgjVSUZaeVJmzLufFtaS5526JgpQ4+
	 WQZqWq5BERdBB7zp/cHGK8AoQGEaOCX3ullZYLGZa0cGyW9wRpc9uL+7lw/FJl61XkWyv
	 VZDCYguIk+Z0xrT+xu87lf0LGHSZB+xBJ28vapJNOr3AU0+4QmiPDPhYIsxiplyO3Kg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369288;
	bh=wqIj7uEBpcHS+AFVmSw6qjOxs1ZU7s2jx2lFAbqtyX8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dVCReZnOLkGydmerUcfjySdq6fRFyxAzzLb6RSBrNkvh5Yx41yF81ae9SpHba7p/z
	 MFeISnY5mqctZctdchiPlypDDryEO4h9oOhpXQea3A1r1nk6VS3O8X1S0Sz0vaB9/V
	 /2YL1nA3T9WL3H2hab1MhtIUaJ3bz2KNXwoo24J4RPVBGTZxNPjyiMrukUYx19sDrw
	 F6c3HalxsCA2dorVq8y6omt9J95tttVN0phUc1IgNyDMS8L4jgP77VP5R3TuGeFlWr
	 1M00Hig+8BHWXPPl1C/Wjioi0teu9plfkzvKgIPotJBpG+vOtuBvvqMgf0FgpY1t0d
	 9+3OV89mLu8DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3782B40C40;
	Fri, 30 Oct 2026 14:08:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADFB4D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C9B040B39
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlw8OG904LVU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5005640B34
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=fmuuRZlbAXWeAd+QPbNc1hWCLoO+3RLrMhIcuvQFR3EmnOICHdA3999Isne7vyEvqUAc
 piGqXRXqjXob8DdPgW9ECTnqVJptdnYGRGCE8sh8TwhHZcaTgyudof9sHb+aQEJi9LDC6
 hpPjPS8b+ynwqk5Nzrp3ahx34FQoD/WB0x/sNFGIkSe4fOhYMyqAtt+E+xUMjCiwuDouU
 cje00BsQnfhXD75g6Mb/ZlOfOMh6qjjaiyohUilDnEoEtGeKK6vPN/r+vGe1HtnvFBx6B
 OD/Rd2dLdp22rDAI5ViZcXhkvVQohDB0l6zKPLs3l/pQFgM56wq35qHwz4JQRa4aBSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DKtRCv9Grwh+xAw/489/WUjiGpnKlUrcxM04hbJ4vFY=;
 b=maT6iPQD4pKBwz7L82mkAhVS2F6BH0G03sHmp+hDd7Z7uBRHeMWXC7bYCPZh4/+fCWa7
 MWDjb0xh8+kh9Mhyl8RaLokxWjrlAKVOO9HHPbBlUy8exIYDqNIAyVFZ6CifgYI+yX8vO
 hjevnQbC+6UT9h+y0etLTq+Je/+ZEzhOwSKk9HmFwSJZOIKieePVwYaIxzVJymYETalPB
 BmLJE0ybuG0czcJoO7DEWTB5AkCpdwVLMNcIschHIidOEnjJ0gLBTfJZxiAsckgnIOKSh
 TAu3GxHPapcMSumSEn4C+68ZqCEcALglWhzrpMnQousIJQjnL/pBV0bnMoxXQHp2++w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5005640B34
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 703C19D388; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 071b1fa150b74ae8b06c1ccd6a8b7a7e06fc61d7
X-Git-Newrev: 6f8daa05a02fb73e9fa470a3aab834cf9d9e772d
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.703C19D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "arch: mark a set
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
Content-Type: multipart/mixed; boundary="===============1987476085777209200=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1987476085777209200==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f8daa05a02fb73e9fa470a3aab834cf9d9e772d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit cf01628aa3cdedf73aa811252d238be4a09c9c96.

(alternative to commit 41f52f982a2c974258f23cf16c3722aba1bcb343)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 arch/Config.in       | 17 -----------------
 arch/Config.in.arm   |  5 -----
 arch/Config.in.riscv |  2 --
 arch/Config.in.x86   |  1 -
 4 files changed, 25 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index de15944eb2..6b54c65df9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -23,7 +23,6 @@ choice
 
 config BR2_arcle
 	bool "ARC (little endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Synopsys' DesignWare ARC Processor Cores are a family of
@@ -50,7 +49,6 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
@@ -69,7 +67,6 @@ config BR2_aarch64
 
 config BR2_aarch64_be
 	bool "AArch64 (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
@@ -85,7 +82,6 @@ config BR2_i386
 
 config BR2_m68k
 	bool "m68k"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
 	help
 	  Motorola 68000 family microprocessor
@@ -93,7 +89,6 @@ config BR2_m68k
 
 config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
@@ -103,7 +98,6 @@ config BR2_microblazeel
 
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
@@ -113,7 +107,6 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big
@@ -123,7 +116,6 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little
@@ -133,7 +125,6 @@ config BR2_mipsel
 
 config BR2_mips64
 	bool "MIPS64 (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -154,7 +145,6 @@ config BR2_mips64el
 
 config BR2_or1k
 	bool "OpenRISC"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  OpenRISC is a free and open processor for embedded system.
@@ -162,7 +152,6 @@ config BR2_or1k
 
 config BR2_powerpc
 	bool "PowerPC"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
@@ -172,7 +161,6 @@ config BR2_powerpc
 
 config BR2_powerpc64
 	bool "PowerPC64 (big endian)"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -203,7 +191,6 @@ config BR2_riscv
 
 config BR2_s390x
 	bool "s390x"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -213,7 +200,6 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
@@ -224,7 +210,6 @@ config BR2_sh
 
 config BR2_sparc
 	bool "SPARC"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_USE_MMU
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
@@ -235,7 +220,6 @@ config BR2_sparc
 
 config BR2_sparc64
 	bool "SPARC64"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	select BR2_ARCH_IS_64
 	select BR2_USE_MMU
 	help
@@ -256,7 +240,6 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
 	help
 	  Xtensa is a Tensilica processor IP architecture.
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 6996f3d7ca..f01dcc4d5a 100644
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
index f7ffd5fdc3..23d095d1a6 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -51,12 +51,10 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
-	select BR2_RISCV_USE_MMU if BR2_HIDE_SECONDARY_TARGET_OPTIONS
 
 endchoice
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 3870bd6215..6e79b35b05 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -50,7 +50,6 @@ choice
 
 config BR2_x86_i486
 	bool "i486"
-	depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS
 	depends on !BR2_x86_64
 config BR2_x86_i586
 	bool "i586"

--===============1987476085777209200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1987476085777209200==--
