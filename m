Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EBAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03617610C6;
	Sun, 29 May 2022 13:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNY5ZeBnTKOn; Sun, 29 May 2022 13:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074AC6108E;
	Sun, 29 May 2022 13:18:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3A01BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57EBB60F19
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nITptA7RSxWe for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AAF660F08
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so3601685wmq.1
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yeNddeoTcyK20OuPe4HycYNJxziaZcyomgEhXrSN0Us=;
 b=DbuxRMXsTLbL9CRRCpaYg3y1171+lLGVV+KL8fX3tihvyc27VY2xkE9SFZQTy6f7yP
 Ty6H0P5DFl099bOOR3PBZGwGdWVxzI6F1etspzwtsY76e83MirFqJAwFa9L4pTLo0rHu
 JMxIiW+6qcpLmO9sNvZ9YBLcNBXrOG7D9cAkl8atSzOO6hbSZafHjWtHO1+z2i3HT0pc
 SI8bHXybEZt9u/vk3CMv31aZqARlzmQ3VGKkNsXhEVGp49jO/6tRdumoLsLDAq/DGhTI
 62KQkFeGzGoIys39cMgkdl7b12WCyuMdfJiucfL85GhmfIN8VCCj70v5oEmflc1+QzSr
 V3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yeNddeoTcyK20OuPe4HycYNJxziaZcyomgEhXrSN0Us=;
 b=5GknFH7yyKmGYkE6Mk6fh3j/AvjNI6LacJtrg3uu5O6Kmd+VaeOVlVk45oDbbcC/Qo
 YnToqVEAoB3xE3FN75WTWzowb1YO9ewWjY8wrQFuNOaHAqDd0hZTeWnz3tAHpyy3uWiF
 9v/wnTx8I1//mStCu6X8MExvpf84wYy5svWogsfnEznCOE08rEzAS4K7tUw9oBaCPmR0
 PmGrdZC7V9pq+YxFt2Qu02Qm75i+EPd2swP3yRWLWiGgqNYbw3t2ZZi6Lw9KYLst/mam
 5ecy2svj5lKAsKVw6ocPFsu2Bkci2SxdpKEZJOFvRWtxBLYdhzh0mDMZ5B5D28FE/vIJ
 C+Cw==
X-Gm-Message-State: AOAM530/X5mRaboU7RRgtP1lhZTBPX84XsKoQTTcPKe5KN+TUpqVJSmT
 EqYA+n3Cv8r6oJU0QYxHwTXihk3UzWY=
X-Google-Smtp-Source: ABdhPJwEWj9CwsvTaM1CQ3cMLfOPi2WludgZqnlr5Owye4z794xK8/ukG93T6YK8Ko6VrVzC7svwtQ==
X-Received: by 2002:a7b:c015:0:b0:397:3685:5148 with SMTP id
 c21-20020a7bc015000000b0039736855148mr15063924wmb.174.1653830299258; 
 Sun, 29 May 2022 06:18:19 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:18 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:01 +0200
Message-Id: <20220529131811.481017-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 01/11] arch/Config.in.riscv: add Zicsr
 and Zifencei standalone extensions
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
Cc: Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since gcc 12, default Riscv ISA spec version was bump to 20191213 [1].

This introduce a major incompatibility issue is the csr read/write
(csrr*/csrw*) instructions and fence.i instruction has separated from
the "I" extension, become two standalone extensions: Zicsr and
Zifencei; so you might get error messages like that: unrecognized
opcode "csrr" (or "fence.i").

Indeed, without Zifencei we can't build opensbi bootloader [3]:

opensbi-1.0/lib/sbi/sbi_tlb.c: Assembler messages:
opensbi-1.0/lib/sbi/sbi_tlb.c:190: Error: unrecognized opcode `fence.i', extension `zifencei' required

As a workaround, opensbi build system has been patched [4] to use
-march=rv64imafdc_zicsr_zifencei when needed.
This workaround doesn't work in Buildroot due to the local patch
0001-Makefile-Don-t-specify-mabi-or-march.patch removing -march
from CFLAGS.

Fix this issue by introducing two additional Kconfig option
enabling Zicsr and Zifencei standalone extensions for gcc >= 12
as recommanded by [2].

Select Zicsr and Zifencei for General purpose (G) architecture variant
(BR2_riscv_g) since theses extentions were implicitely enabled
previously.

[1] https://gcc.gnu.org/gcc-12/changes.html
[2] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4
[3] https://github.com/riscv-software-src/opensbi/blob/v0.9/lib/sbi/sbi_tlb.c#L173
[4] https://github.com/riscv-software-src/opensbi/commit/5d53b55aa77ffeefd4012445dfa6ad3535e1ff2c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
---
 arch/Config.in.riscv | 21 ++++++++++++++++++++-
 arch/arch.mk.riscv   |  6 ++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 288ed833eb..91feea0918 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -18,6 +18,12 @@ config BR2_RISCV_ISA_RVD
 config BR2_RISCV_ISA_RVC
 	bool
 
+config BR2_RISCV_ISA_RVZicsr
+	bool
+
+config BR2_RISCV_ISA_RVZifencei
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_riscv_g
@@ -29,8 +35,11 @@ config BR2_riscv_g
 	select BR2_RISCV_ISA_RVA
 	select BR2_RISCV_ISA_RVF
 	select BR2_RISCV_ISA_RVD
+	select BR2_RISCV_ISA_RVZicsr if BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_RISCV_ISA_RVZifencei if BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	help
-	  General purpose (G) is equivalent to IMAFD.
+	  General purpose (G) is equivalent to IMAFD
+	  (with Zicsr and Zifencei since gcc >= 12).
 
 config BR2_riscv_custom
 	bool "Custom architecture"
@@ -63,6 +72,16 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
+
+if BR2_TOOLCHAIN_GCC_AT_LEAST_12
+config BR2_RISCV_ISA_CUSTOM_RVZicsr
+	bool "Control and Status Register (CSR) Instructions"
+	select BR2_RISCV_ISA_RVZicsr
+
+config BR2_RISCV_ISA_CUSTOM_RVZifencei
+	bool "Instruction-Fetch Fence"
+	select BR2_RISCV_ISA_RVZifencei
+endif
 endif
 
 choice
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..294a5f90a9 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,5 +26,11 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_RISCV_ISA_RVZicsr),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr
+endif
+ifeq ($(BR2_RISCV_ISA_RVZifencei),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zifencei
+endif
 
 endif
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
