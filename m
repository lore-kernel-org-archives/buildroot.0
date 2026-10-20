Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3528606A325
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UKlu1OVQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6400606ED;
	Tue, 20 Oct 2026 20:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ll_oCmyby_-y; Tue, 20 Oct 2026 20:27:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95B506070C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792528023;
	b=WGhRQBgeVxP6fFXgvHXYZb4sZ6kDv64g16SKY0iu3rPLki0GGQ8/+6BHUbi/vur2RU6C
	 OFtjxwXXaPNsri2o5Fc334szKvC0+bqDBxf/g43BhUPixI+nmOqcysjHkVV/Ve+qF1Fwj
	 uWDuzNwwTU3YY1FLE6vP27SrFUNq9w7il6GSndC0sklginPs9hzoL8uW1wtJ/oQ36NDjh
	 pNsBd+WR7j+Bp963+KuI1rbOhQnss7fP8s2ngPAMT/VlcSAy39UQLi0w3EtsIvc7NuZBX
	 M8RBE3NItdPflkFqb9+zKvUGNpVV2yNi+VHN4g2z0iJbRYlRihL+B/ZlIJok/AycqRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792528023;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UmjZEt7ckBSUtEOlOYay0opptYxy977UGkC/MrYp/+k=;
	b=BK9gDK+hMSceqgqdpKji5CQHO1t0JFt10M6PNid+ZQGUaLMQ7waUOK3wcazKHvj/PxbP
	 Jz2nUz4pDoQ02AN/1IWHKDV//IRp0tMQMheJZqBzjkKy9TpCw0oDyqxW/eMmI5WtK7KUm
	 ym/qJyawhh2HOTBr7ckGtDn/e0btvdxq7ZpKVxmQJl8egAz/gFMg5BPqcN7ofJGxkjsGJ
	 8hMTf9wLkESI1ERziNQMLeS9rSlSXzNg8duM9j1Jm8DVbEF3YSCEKtpev2gMJOFkbDwnz
	 iRnQpsthWHMUluf9jc7yAaIhGBcXDhpJMD9ErOJ/uyk/IPRxDGeJMaRnbEDR4/GTZgQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792528023;
	bh=UmjZEt7ckBSUtEOlOYay0opptYxy977UGkC/MrYp/+k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UKlu1OVQJJ1dcY3FpaQChynleBY1NEWJ3fU1DO7eO3tSZc2NRdug1Pt9Qjkj8FrSf
	 2HQKBMfXln7Bg4SVEklw14qu/C2P27VjlTVVCN5mK55BD5Lwxic24hinZSHND/y1uC
	 xLClbSQWWj9jw8d0fz5IbNZW4uBofBT7p5uGl+wQ9Uj5BMvKHIWz0hyPGeXc6179Sq
	 Oxsb9YtAOSHloZ9K4qOIotjrWb1gCxCyPlZnwvWepXhyl5f6rdsD6vzQiP9C3+7UE+
	 ZvNEno0VN+mKvyPNS8zVG0ZnKvA4dBBUwVdjRwOm0GDtY/0yYS8fejcmYcwmuITN45
	 tN2D1LFkmVsbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B506070C;
	Tue, 20 Oct 2026 20:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DAC4380
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 043BA40112
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JF2mZvkxqZWp for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:27:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 172894006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792528021;
 b=RqnfDWnhvR/iXVID+MlxURZtwv1WIWSgFFC/UsIbZIVuQIpFlB1q4cfdn0WtUSNX95Ou
 BA33w8vPealsJmkMUy4G7Driha+3WH6icE3lTdEFSphjzDvCImQIk56UKJe/d9Mbg+WvG
 5tQc9DmUz5oitjttKM/IlwK6LHI7uFOh+UfgefTZuE4jAxWWPyZiR3yd4WdG7lKvJXyi4
 /ImErM+CHKnfTxj4b9ZtnQvEDiRc3I0zGy5C9atJGv1yogZ/uESb/4Ju0hjpD+s/1bvGt
 DmeaKcBwWNC3Xb2Kl4itB7WArV+/gDa+WUqfUARVDKMP/f9NFZM0x2bQRQnJwKQMmRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792528021;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GnKpjW8tRQP5zF+N6aOAuZ2OvvH5F+TxegI3aiIfnIo=;
 b=Bz8lbLnpdqHAgIsQtHLOz9JoCPC7kC5x9Jj55mjp7DxKmu+uTegH+92fBy4EtXBkslGc
 imIucJs8RvwDOyd1xywoONDd8kfHy5h2Vr2wm3jQdrXblMBMewYoNyKFEGdu8JvbiiQ0e
 obpzRJKpQ+ZDWHF2R503sBS9Iu18QM46yKFb58TJod0PaO6PLBQwXsxrBsEVI9NJ4obOb
 FMsdwImI3UF/7XNWiBV57FGmyAXEtfTX69YjSvO1xjYqpbXrj47n4v3WMgld78PkuDf6K
 E5oIwXb4cDxpcpuwjNBpjg4TR4fBOB+YUbucBEPAtr+NQYQVpzyd5IBYG2qGCQJDawg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KqItX7kz; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 172894006F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:00 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6528A614D2;
 Tue, 20 Oct 2026 22:26:54 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 20 Oct 2026 22:26:37 +0200
Message-ID: <20261020202639.1094960-2-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020202639.1094960-1-ju.o@free.fr>
References: <20261020202639.1094960-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] Revert "arch: mark a set of target
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit ddce0814a794b27a6449b144f85c90fa53e92ac6.

Signed-off-by: Julien Olivain <ju.o@free.fr>
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
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
