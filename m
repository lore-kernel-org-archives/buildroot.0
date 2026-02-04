Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25183E95372
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E7B60A97;
	Wed,  4 Feb 2026 10:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBs65EukzUc6; Wed,  4 Feb 2026 10:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED07D60AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770200108;
	bh=ESayT0WRETE9BTN+tttnpZeqdt+5r0I8u70+RN48Jek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UgbqcUHkfoMnvoVBHpgq7lt0Fp7yLIdDRRH+PwY+2xHh0QOd+R3J7hL5hWzE14OSk
	 43CLpT9nITFiRfL/yjdCnqLaa5LPihGTglMWEU7oJnH0FhmHs1ZFLgchJpwQOiAoKj
	 bjralasjS/x95G55w9n/BVWuTsZZYKY0hWR7hEDEPJJsON/kDkq67LbDD8AC+wW3Db
	 kKZZlvxiAYIn5DLo9R5OuiuR1iD8Bp/wCdppDUWMqs4i5HMJRxY18JnI2/StkbZe8I
	 KgCS5Uy2AkgQKOPzhh1JucT2xrO3bDZX2dl8hR1bYVk8uNBBlShXnDBgsOpvYQ03qN
	 8+5tk4Xv5tG2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED07D60AA4;
	Wed,  4 Feb 2026 10:15:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 819E9F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C3F40600
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tR2SSoV2y0D3 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE75405E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFE75405E8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1C5F86843; Wed,  4 Feb 2026 10:15:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 11:11:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed9466e7f90595d7cc1cbf1d67829ce8dd5f1188
X-Git-Newrev: 166bfd3e6690979ba6b044809a86651f6eb3f440
X-Patchwork-Hint: ignore
Message-Id: <20260204101505.B1C5F86843@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: riscv: Add RISCV_ISA_EXTRA config
 string
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/166bfd3e6690979ba6b044809a86651f6eb3f440
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Adds a new user-configurable string to arch/Config.in.riscv, and in
arch/arch.mk.riscv appends it to GCC_TARGET_ARCH.

This enables custom extensions/combinations to be easily configured.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Jesse Taube <Mr.Bossman075@gmail.com>
[Arnout:
 - fix check-package warnings
 - introduce ARCH_RISV_ISA_EXTRA to simplify stripping of quotes
]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 arch/Config.in.riscv | 7 +++++++
 arch/arch.mk.riscv   | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 23d095d1a6..299190f364 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -45,6 +45,13 @@ config BR2_RISCV_ISA_RVV
 	bool "Vector Instructions (V)"
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 
+config BR2_RISCV_ISA_EXTRA
+	string "Append extra RISC-V ISA extensions"
+	help
+	  Extra ISA extensions to append to the ISA extensions string.
+	  They are underscore-separated.  For example,
+	  "zba_zbb_zvl256b".
+
 choice
 	prompt "Target Architecture Size"
 	default BR2_RISCV_64
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index ee5c434b97..e47666eadd 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -39,4 +39,9 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr_zifencei
 endif
 
+ARCH_RISV_ISA_EXTRA = $(call qstrip, $(BR2_RISCV_ISA_EXTRA))
+ifneq ($(ARCH_RISV_ISA_EXTRA),)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_$(ARCH_RISV_ISA_EXTRA)
+endif
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
