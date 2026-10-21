Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D24606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kl96DQ5b
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B59613D9;
	Wed, 21 Oct 2026 19:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6dmkhTC0Sdw; Wed, 21 Oct 2026 19:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 37F9261431
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610574;
	b=p8JsViiyGOCxKsqK3olMzpvYjsl5N6CAFNY9fhj47HPkS9yaBE38f0koJ/g+YmJWPC0r
	 acyaNqt/rCS7JPMCFbRxc26cBvTQlrwLkJ6nIbqIkvnNbhBowLU5yXH83KrbwUOoFFC6d
	 L3gEdG06LdkvH+ygE96ibiGAJv2oneWxofe9ZdARQ5Nm4EE12DefcbVGamVvtDx/1XbUG
	 momrKAysuIGH6ioOt6KamzSdKPi8RFe1JNhBCiXVoY+FrqQwvVB3kne8UkhqEllSp1SV1
	 h2wTX1A1VaFCUDwhMDAKmcrOd9olcBT3PjeZUevSEYSPOa9zqTJJ1Qf101jkcV6F/wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f2kcAFaqowFU9jiu047ggUt5CLt+kNZ+znypsw0fiJU=;
	b=Zj0wuDh5ElElSO1QptgPDgKvQ4O4hKXPycWcyVHggX8RM4VcEURNg5nrDC9xu7Hby7fy
	 m9H0Iz3uBz3PgzwvWhfSyHOUs5r65HAi6WC8G9Wxez1NVAlv6/BVZ8pe6zxG0fFhw9B2T
	 7GKCVY/87YSuDYDq8nONEOeaTDzKbT3/ljQb8uuGHdckWjf/8QNZSUniNS61zf+qjwmlw
	 awwChZQt6Mo3yTk3dOAUDbmG4Lvyp4Z/e+hBwApgqRRL+vkL/QYI3cayjOg4i/cGgyq4o
	 4xobGQ3lB2WhAmQAUHHPlomISD17zVqiZzTrWaxZJxHN4cZ7eFZ7VCCJpCgG8TkHUdg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610574;
	bh=f2kcAFaqowFU9jiu047ggUt5CLt+kNZ+znypsw0fiJU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kl96DQ5bbVbO5QeKyhAsF9wL0y+39eGaMdcGCvuXuOgZmKZ2O2tKqq0RES8BrsIkU
	 ShKmyzZR00hgsCbgEo5jLeEWyMSu4kKyPRt1nasUU4Zmg8lyc0d6vDKnr9IUE29nTC
	 Bzwuojt7xdEhefEBr0IZcyy9MyjWYjgummFyBWRCf0nyaaaRpWxwHJ4pTqNVuJs3zM
	 ZWu5zAD6+0sjUuh5yaxtndGXZ1e+hZl4VGMnv9X3+Ek5GuCe5mUUfp7haCbKxnzFh/
	 cwxswA+hKY/3/oyAeT5TW2h1VWw2cQP2jqW3DZTM2PHEkvvMMz6i4ziSFQWZ2mgPAn
	 UEzW46nlA7LDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F9261431;
	Wed, 21 Oct 2026 19:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A1883A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27D4B60B7B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6utvU9HS-Os for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:22:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D797610BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610570;
 b=fxxjC4DN4v1jx3fPsnbN9CScHkGV7nBRrOUiR3bw4KtViOpntKbbGTmp7fW6wpjNnt3j
 zDx4JZf/ChMl16A/OibzYtw8RScQ01jCnvkbHgRh+jug5m4VnI6rZzNwADusypyAE2YH9
 BApIevUAwCrMscLSpCHbaFv15vaEjwTYf2jUc4tXJYYbX6iXiksM/dghPpRIVNiK+ArK5
 YfWT7m11YvYrS5U9eTKLDXZwolzq6D68+UqOmbHuMQrJ+TimMo9Xqzx3Q53o0IEpu/ZBU
 1z1SveX27dm77L1iboPUoDAVM4CoBwINNzyouIM4td2qPuyGGvIgEPIpQ08AuFSraOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610570;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v54dwpSjMbUpD4bmyuPTSjJo8eLnLq8AbcVRRxrmq+M=;
 b=BX9T0Ay9p5o2xbrezysWPfwRO3lXo/rsCVeOgXFXjd2enBQdZxaKP5PtUPun5LSKuPmn
 iVdApbLqucuGB8fnCHJlu4TS1JHzpajQD/JJFHDTJh6HDnbm6+DfVZxdUCFSp0ueKejU7
 2AyLe9k74uM57Bi8ZLv8biJWF1OjUnGrzJvGQW7xRaHl+NnaMQb2+OPugZUhocy0XjKjJ
 2pXNY4VXIajPM9oXc4VbNy7PGGKkMSx7EADrlwgNGfibNYUzOgna5zPws5VxcrTFe1SR+
 e44ISFq6zixNrUrdhefUUQ9Pid5+QAhLC+cv2TI7pFts56CHQopwmVg131+c+hkY2uQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D797610BA
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A5DC99AB1; Wed, 21 Oct 2026 19:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:22:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91e703a5f18f32eb5e39d6d97db8abe648ac4618
X-Git-Newrev: 41f52f982a2c974258f23cf16c3722aba1bcb343
X-Patchwork-Hint: ignore
Message-Id: <20261021192126.7A5DC99AB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "arch: mark a set of target
 configurations as secondary"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/41f52f982a2c974258f23cf16c3722aba1bcb343
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit ddce0814a794b27a6449b144f85c90fa53e92ac6.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
