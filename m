Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461CEC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 09:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD8060B73;
	Wed,  1 May 2024 09:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ba4v9tC7tgvS; Wed,  1 May 2024 09:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 470D260B65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 470D260B65;
	Wed,  1 May 2024 09:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 193D11BF3A3
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0044340677
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYI6Ox_tIAOH for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 09:24:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AFE440360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AFE440360
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AFE440360
 for <buildroot@buildroot.org>; Wed,  1 May 2024 09:24:52 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d874b89081so15490411fa.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 02:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714555490; x=1715160290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNBBwvbWghnrTpKHy8Rzy86rwDvrF2y6RlcEWfiUu+8=;
 b=PykEMudQnKrAuddt0xEPYxVye3kxSmhyMYglz6p7JmhjWd4wL/whYLst1dDcwRDu8Q
 8Lo8mG+bi0KdX1Y751BF5/wejb8Af+7L7jABKbRUyfzS+7oa2D9Calzb7KTJbD2hqd0y
 BQFrQDcg7rhI6p2UkrU0H+GvUxWGSsN/5203ONhGeRhxdQQBXtgytrwysNIev8XBDHmF
 sQ++Z5LuEAlPv3kI4Ii9a6jDCuJuaP1Amc8IQjV8eIkYWFSbhJgev+d3UeIaRJCFQG4G
 ShQX1Bnv/WSbjJNQdhQRA2yHAeHQS4GXkevBhWi1V8c/KQqU4cgJVleFMWhAa3oGcO/z
 OL5Q==
X-Gm-Message-State: AOJu0Yz/oU7vJXJKDdFKP/uCWTmzUC1Ap432nulhQT5bNrII8XnjBUBN
 3/2l2um+/jFXRwAoJ3vhRldWvzibdAkC/b7Rgphn5f7hUrFfo+QvmWyS6HlE
X-Google-Smtp-Source: AGHT+IFnapzqBpaoCq7RXDUtMaECpW6WqW0wpM36ezPPLBJrrNxBktv7U9dwlNW4Quy27OKytrSWOQ==
X-Received: by 2002:a2e:8186:0:b0:2dd:374d:724e with SMTP id
 e6-20020a2e8186000000b002dd374d724emr1345209ljg.1.1714555489599; 
 Wed, 01 May 2024 02:24:49 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 s23-20020a2e81d7000000b002dfbff5667csm1446410ljg.52.2024.05.01.02.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 02:24:49 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 12:23:28 +0300
Message-ID: <20240501092328.323236-3-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240501092328.323236-1-dm.chestnykh@gmail.com>
References: <20240501092328.323236-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714555490; x=1715160290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNBBwvbWghnrTpKHy8Rzy86rwDvrF2y6RlcEWfiUu+8=;
 b=ffEiTuNPLtH0m3nVcsKP1eXDg7g85uI70qdHJRDOah5MjP1e6MjQKAkp3MsCkbqLkV
 U0ZkCnUUlSVItwaAwniqNr3k3mNknQWWHug1FAnt3aLniOv3ecGAcIVRyPoiNiB2XW1U
 1gq7K7YL1dkYR0u5nJD76PJW88395FWLqdCyOzrcGoATzlBEkYEpNEQM8LUgXQD4b94q
 YnBHbscmf2oe5u5zkZYLSEKHqC3uV6EhqHanUqC1g0rqRipJQe0lhW21DjEZN4EDZl+0
 lN6vTh4v4cTO0pRoru4UQs9J686TL/5yuPQQncJmY0zCaM8eFcoiOs5RVjaQTdxnpcRA
 91IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ffEiTuNP
Subject: [Buildroot] [PATCH 3/3] package/gcc: Remove unneeded patch.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sparc systems work with uClibc-ng-1.0.48.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 ...get-92095-internal-error-with-O1-mcp.patch | 322 ------------------
 1 file changed, 322 deletions(-)
 delete mode 100644 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch

diff --git a/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
deleted file mode 100644
index ec2bf8835d..0000000000
--- a/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
+++ /dev/null
@@ -1,322 +0,0 @@
-From bb9b71752267444b4360442b89129bfc0ae938d3 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 20 Jan 2021 23:06:07 +0100
-Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
- -mcpu=niagara2 -fPIE)"
-
-This reverts commit 3fcce773f0f914c0499b130c6e9efa0e45ee54a0.
-
-Building the Buildroot defconfig qemu_sparc_ss10_defconfig using
-gcc 8.4, 9.3 and 10 produce a broken rootfs that trigger illegal
-instruction messages.
-
-gcc 8.3, 9.2 are the latest working gcc version.
-git bisect between gcc 8.4 and 8.4 allowed to identify
-the commit that introcuce the regression.
-
-Reverting this patch allowed to produce a working rootfs.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Eric Botcazou <ebotcazou@gcc.gnu.org>
----
- gcc/config/sparc/sparc-protos.h               |   1 -
- gcc/config/sparc/sparc.c                      | 121 +++++++-----------
- gcc/config/sparc/sparc.md                     |   5 +-
- .../gcc.c-torture/compile/20191108-1.c        |  14 --
- gcc/testsuite/gcc.target/sparc/overflow-3.c   |   2 +-
- gcc/testsuite/gcc.target/sparc/overflow-4.c   |   2 +-
- gcc/testsuite/gcc.target/sparc/overflow-5.c   |   2 +-
- 7 files changed, 53 insertions(+), 94 deletions(-)
- delete mode 100644 gcc/testsuite/gcc.c-torture/compile/20191108-1.c
-
-diff --git a/gcc/config/sparc/sparc-protos.h b/gcc/config/sparc/sparc-protos.h
-index b3f73c2f2bf..71a067e871c 100644
---- a/gcc/config/sparc/sparc-protos.h
-+++ b/gcc/config/sparc/sparc-protos.h
-@@ -69,7 +69,6 @@ extern void sparc_split_reg_mem (rtx, rtx, machine_mode);
- extern void sparc_split_mem_reg (rtx, rtx, machine_mode);
- extern int sparc_split_reg_reg_legitimate (rtx, rtx);
- extern void sparc_split_reg_reg (rtx, rtx, machine_mode);
--extern const char *output_load_pcrel_sym (rtx *);
- extern const char *output_ubranch (rtx, rtx_insn *);
- extern const char *output_cbranch (rtx, rtx, int, int, int, rtx_insn *);
- extern const char *output_return (rtx_insn *);
-diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
-index 73032d33596..db1b428db90 100644
---- a/gcc/config/sparc/sparc.c
-+++ b/gcc/config/sparc/sparc.c
-@@ -4200,6 +4200,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
- static bool
- sparc_cannot_force_const_mem (machine_mode mode, rtx x)
- {
-+  /* After IRA has run in PIC mode, it is too late to put anything into the
-+     constant pool if the PIC register hasn't already been initialized.  */
-+  if ((lra_in_progress || reload_in_progress)
-+      && flag_pic
-+      && !crtl->uses_pic_offset_table)
-+    return true;
-+
-   switch (GET_CODE (x))
-     {
-     case CONST_INT:
-@@ -4235,11 +4242,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
- }
- 
- /* Global Offset Table support.  */
--static GTY(()) rtx got_symbol_rtx = NULL_RTX;
--static GTY(()) rtx got_register_rtx = NULL_RTX;
- static GTY(()) rtx got_helper_rtx = NULL_RTX;
--
--static GTY(()) bool got_helper_needed = false;
-+static GTY(()) rtx got_register_rtx = NULL_RTX;
-+static GTY(()) rtx got_symbol_rtx = NULL_RTX;
- 
- /* Return the SYMBOL_REF for the Global Offset Table.  */
- 
-@@ -4252,6 +4257,27 @@ sparc_got (void)
-   return got_symbol_rtx;
- }
- 
-+#ifdef HAVE_GAS_HIDDEN
-+# define USE_HIDDEN_LINKONCE 1
-+#else
-+# define USE_HIDDEN_LINKONCE 0
-+#endif
-+
-+static void
-+get_pc_thunk_name (char name[32], unsigned int regno)
-+{
-+  const char *reg_name = reg_names[regno];
-+
-+  /* Skip the leading '%' as that cannot be used in a
-+     symbol name.  */
-+  reg_name += 1;
-+
-+  if (USE_HIDDEN_LINKONCE)
-+    sprintf (name, "__sparc_get_pc_thunk.%s", reg_name);
-+  else
-+    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC", regno);
-+}
-+
- /* Wrapper around the load_pcrel_sym{si,di} patterns.  */
- 
- static rtx
-@@ -4271,78 +4297,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
-   return insn;
- }
- 
--/* Output the load_pcrel_sym{si,di} patterns.  */
--
--const char *
--output_load_pcrel_sym (rtx *operands)
--{
--  if (flag_delayed_branch)
--    {
--      output_asm_insn ("sethi\t%%hi(%a1-4), %0", operands);
--      output_asm_insn ("call\t%a2", operands);
--      output_asm_insn (" add\t%0, %%lo(%a1+4), %0", operands);
--    }
--  else
--    {
--      output_asm_insn ("sethi\t%%hi(%a1-8), %0", operands);
--      output_asm_insn ("add\t%0, %%lo(%a1-4), %0", operands);
--      output_asm_insn ("call\t%a2", operands);
--      output_asm_insn (" nop", NULL);
--    }
--
--  if (operands[2] == got_helper_rtx)
--    got_helper_needed = true;
--
--  return "";
--}
--
--#ifdef HAVE_GAS_HIDDEN
--# define USE_HIDDEN_LINKONCE 1
--#else
--# define USE_HIDDEN_LINKONCE 0
--#endif
--
- /* Emit code to load the GOT register.  */
- 
- void
- load_got_register (void)
- {
--  rtx insn;
-+  if (!got_register_rtx)
-+    got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
- 
-   if (TARGET_VXWORKS_RTP)
--    {
--      if (!got_register_rtx)
--	got_register_rtx = pic_offset_table_rtx;
--
--      insn = gen_vxworks_load_got ();
--    }
-+    emit_insn (gen_vxworks_load_got ());
-   else
-     {
--      if (!got_register_rtx)
--	got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
--
-       /* The GOT symbol is subject to a PC-relative relocation so we need a
- 	 helper function to add the PC value and thus get the final value.  */
-       if (!got_helper_rtx)
- 	{
- 	  char name[32];
--
--	  /* Skip the leading '%' as that cannot be used in a symbol name.  */
--	  if (USE_HIDDEN_LINKONCE)
--	    sprintf (name, "__sparc_get_pc_thunk.%s",
--		     reg_names[REGNO (got_register_rtx)] + 1);
--	  else
--	    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC",
--					 REGNO (got_register_rtx));
--
-+	  get_pc_thunk_name (name, GLOBAL_OFFSET_TABLE_REGNUM);
- 	  got_helper_rtx = gen_rtx_SYMBOL_REF (Pmode, ggc_strdup (name));
- 	}
- 
--      insn
--	= gen_load_pcrel_sym (got_register_rtx, sparc_got (), got_helper_rtx);
-+      emit_insn (gen_load_pcrel_sym (got_register_rtx, sparc_got (),
-+				     got_helper_rtx));
-     }
--
--  emit_insn (insn);
- }
- 
- /* Ensure that we are not using patterns that are not OK with PIC.  */
-@@ -5494,7 +5472,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
-     return true;
- 
-   /* GOT register (%l7) if needed.  */
--  if (got_register_rtx && regno == REGNO (got_register_rtx))
-+  if (regno == GLOBAL_OFFSET_TABLE_REGNUM && got_register_rtx)
-     return true;
- 
-   /* If the function accesses prior frames, the frame pointer and the return
-@@ -12475,9 +12453,10 @@ static void
- sparc_file_end (void)
- {
-   /* If we need to emit the special GOT helper function, do so now.  */
--  if (got_helper_needed)
-+  if (got_helper_rtx)
-     {
-       const char *name = XSTR (got_helper_rtx, 0);
-+      const char *reg_name = reg_names[GLOBAL_OFFSET_TABLE_REGNUM];
- #ifdef DWARF2_UNWIND_INFO
-       bool do_cfi;
- #endif
-@@ -12514,22 +12493,17 @@ sparc_file_end (void)
- #ifdef DWARF2_UNWIND_INFO
-       do_cfi = dwarf2out_do_cfi_asm ();
-       if (do_cfi)
--	output_asm_insn (".cfi_startproc", NULL);
-+	fprintf (asm_out_file, "\t.cfi_startproc\n");
- #endif
-       if (flag_delayed_branch)
--	{
--	  output_asm_insn ("jmp\t%%o7+8", NULL);
--	  output_asm_insn (" add\t%%o7, %0, %0", &got_register_rtx);
--	}
-+	fprintf (asm_out_file, "\tjmp\t%%o7+8\n\t add\t%%o7, %s, %s\n",
-+		 reg_name, reg_name);
-       else
--	{
--	  output_asm_insn ("add\t%%o7, %0, %0", &got_register_rtx);
--	  output_asm_insn ("jmp\t%%o7+8", NULL);
--	  output_asm_insn (" nop", NULL);
--	}
-+	fprintf (asm_out_file, "\tadd\t%%o7, %s, %s\n\tjmp\t%%o7+8\n\t nop\n",
-+		 reg_name, reg_name);
- #ifdef DWARF2_UNWIND_INFO
-       if (do_cfi)
--	output_asm_insn (".cfi_endproc", NULL);
-+	fprintf (asm_out_file, "\t.cfi_endproc\n");
- #endif
-     }
- 
-@@ -13035,10 +13009,7 @@ sparc_init_pic_reg (void)
-   edge entry_edge;
-   rtx_insn *seq;
- 
--  /* In PIC mode, we need to always initialize the PIC register if optimization
--     is enabled, because we are called from IRA and LRA may later force things
--     to the constant pool for optimization purposes.  */
--  if (!flag_pic || (!crtl->uses_pic_offset_table && !optimize))
-+  if (!crtl->uses_pic_offset_table)
-     return;
- 
-   start_sequence ();
-diff --git a/gcc/config/sparc/sparc.md b/gcc/config/sparc/sparc.md
-index 468e2cc5d3b..25134bd1148 100644
---- a/gcc/config/sparc/sparc.md
-+++ b/gcc/config/sparc/sparc.md
-@@ -1601,7 +1601,10 @@
-    (clobber (reg:P O7_REG))]
-   "REGNO (operands[0]) == INTVAL (operands[3])"
- {
--  return output_load_pcrel_sym (operands);
-+  if (flag_delayed_branch)
-+    return "sethi\t%%hi(%a1-4), %0\n\tcall\t%a2\n\t add\t%0, %%lo(%a1+4), %0";
-+  else
-+    return "sethi\t%%hi(%a1-8), %0\n\tadd\t%0, %%lo(%a1-4), %0\n\tcall\t%a2\n\t nop";
- }
-   [(set (attr "type") (const_string "multi"))
-    (set (attr "length")
-diff --git a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c b/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
-deleted file mode 100644
-index 7929751bb06..00000000000
---- a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
-+++ /dev/null
-@@ -1,14 +0,0 @@
--/* PR target/92095 */
--/* Testcase by Sergei Trofimovich <slyfox@inbox.ru> */
--
--typedef union {
--  double a;
--  int b[2];
--} c;
--
--double d(int e)
--{
--  c f;
--  (&f)->b[0] = 15728640;
--  return e ? -(&f)->a : (&f)->a;
--}
-diff --git a/gcc/testsuite/gcc.target/sparc/overflow-3.c b/gcc/testsuite/gcc.target/sparc/overflow-3.c
-index 18253bb6e5e..8cb24f52f7b 100644
---- a/gcc/testsuite/gcc.target/sparc/overflow-3.c
-+++ b/gcc/testsuite/gcc.target/sparc/overflow-3.c
-@@ -1,5 +1,5 @@
- /* { dg-do compile } */
--/* { dg-options "-O -fno-pie" } */
-+/* { dg-options "-O" } */
- /* { dg-require-effective-target lp64 } */
- 
- #include <stdbool.h>
-diff --git a/gcc/testsuite/gcc.target/sparc/overflow-4.c b/gcc/testsuite/gcc.target/sparc/overflow-4.c
-index fb30877efb9..868edea2b9e 100644
---- a/gcc/testsuite/gcc.target/sparc/overflow-4.c
-+++ b/gcc/testsuite/gcc.target/sparc/overflow-4.c
-@@ -1,5 +1,5 @@
- /* { dg-do compile } */
--/* { dg-options "-O -fno-pie -mno-vis3" } */
-+/* { dg-options "-O -mno-vis3" } */
- /* { dg-require-effective-target lp64 } */
- 
- #include <stdbool.h>
-diff --git a/gcc/testsuite/gcc.target/sparc/overflow-5.c b/gcc/testsuite/gcc.target/sparc/overflow-5.c
-index 509d957715d..501ce04f7a1 100644
---- a/gcc/testsuite/gcc.target/sparc/overflow-5.c
-+++ b/gcc/testsuite/gcc.target/sparc/overflow-5.c
-@@ -1,5 +1,5 @@
- /* { dg-do compile } */
--/* { dg-options "-O -fno-pie -mvis3" } */
-+/* { dg-options "-O -mvis3" } */
- /* { dg-require-effective-target lp64 } */
- 
- #include <stdbool.h>
--- 
-2.25.4
-
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
