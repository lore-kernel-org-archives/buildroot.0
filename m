Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F950EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0074741960;
	Fri, 28 Jul 2023 20:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0074741960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sm2cRhQoD1wS; Fri, 28 Jul 2023 20:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD78341897;
	Fri, 28 Jul 2023 20:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD78341897
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDF61BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92905417CC
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92905417CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7V9G18mC9UNH for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7637E41884
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7637E41884
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7254483940; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:05:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01849e8ddb86ec2c4b8259b8cfa8dfc6eedb4d92
X-Git-Newrev: d37a8f3a2e2a387b102f2982d51aca78bcc09727
X-Patchwork-Hint: ignore
Message-Id: <20230728200820.7254483940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: remove gcc 10.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=d37a8f3a2e2a387b102f2982d51aca78bcc09727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 13.2 is around, gcc 12.3 is the default version, so drop
10.4 in order to reduce the gcc choice.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   7 +
 ...R-target-92095-internal-error-with-O1-mcp.patch | 328 ---------------------
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch | 200 -------------
 ...k-Use-cmodel-large-when-building-crtstuff.patch |  60 ----
 ..._REENTRANT-for-OpenRISC-when-pthread-is-p.patch |  31 --
 ...disable-split-stack-for-non-thread-builds.patch |  26 --
 ...t-fix-machine-names-in-__has_include-.-PR.patch | 124 --------
 package/gcc/Config.in.host                         |  11 -
 8 files changed, 7 insertions(+), 780 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2678e0ca70..ddbb0daf4c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.08"
 
+config BR2_GCC_VERSION_10_X
+	bool "gcc 10.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 10.x has been removed. The current
+	  default version (12.x or later) has been selected instead.
+
 config BR2_KERNEL_HEADERS_6_3
 	bool "kernel headers version 6.3.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
deleted file mode 100644
index e8283afadb..0000000000
--- a/package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
+++ /dev/null
@@ -1,328 +0,0 @@
-From d672b64ae257e789311dfd0aea947972af64b966 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 20 Jan 2021 23:26:29 +0100
-Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
- -mcpu=niagara2 -fPIE)"
-
-This reverts commit 0a83f1a441d7aaadecb368c237b6ee70bd7b91d6.
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
-Reported to gcc:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
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
-index 5f9999a669c..37452b06415 100644
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
-index 7cfa9f80676..3a721f19eb5 100644
---- a/gcc/config/sparc/sparc.c
-+++ b/gcc/config/sparc/sparc.c
-@@ -4243,6 +4243,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
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
-@@ -4278,11 +4285,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
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
-@@ -4295,6 +4300,27 @@ sparc_got (void)
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
-@@ -4314,78 +4340,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
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
-@@ -5550,7 +5528,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
-     return true;
- 
-   /* GOT register (%l7) if needed.  */
--  if (got_register_rtx && regno == REGNO (got_register_rtx))
-+  if (regno == GLOBAL_OFFSET_TABLE_REGNUM && got_register_rtx)
-     return true;
- 
-   /* If the function accesses prior frames, the frame pointer and the return
-@@ -12658,9 +12636,10 @@ static void
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
-@@ -12697,22 +12676,17 @@ sparc_file_end (void)
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
-@@ -13207,10 +13181,7 @@ sparc_init_pic_reg (void)
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
-index b242c4b4481..7d08f50705a 100644
---- a/gcc/config/sparc/sparc.md
-+++ b/gcc/config/sparc/sparc.md
-@@ -1603,7 +1603,10 @@
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
-index 52d6ab2b688..86dddfb09e6 100644
---- a/gcc/testsuite/gcc.target/sparc/overflow-3.c
-+++ b/gcc/testsuite/gcc.target/sparc/overflow-3.c
-@@ -1,6 +1,6 @@
- /* { dg-do compile } */
- /* { dg-require-effective-target lp64 } */
--/* { dg-options "-O -fno-pie" } */
-+/* { dg-options "-O" } */
- 
- #include <stdbool.h>
- #include <stdint.h>
-diff --git a/gcc/testsuite/gcc.target/sparc/overflow-4.c b/gcc/testsuite/gcc.target/sparc/overflow-4.c
-index c6121b958c3..019feee335c 100644
---- a/gcc/testsuite/gcc.target/sparc/overflow-4.c
-+++ b/gcc/testsuite/gcc.target/sparc/overflow-4.c
-@@ -1,6 +1,6 @@
- /* { dg-do compile } */
- /* { dg-require-effective-target lp64 } */
--/* { dg-options "-O -fno-pie -mno-vis3 -mno-vis4" } */
-+/* { dg-options "-O -mno-vis3 -mno-vis4" } */
- 
- #include <stdbool.h>
- #include <stdint.h>
-diff --git a/gcc/testsuite/gcc.target/sparc/overflow-5.c b/gcc/testsuite/gcc.target/sparc/overflow-5.c
-index f00283f6e7b..67d4ac38095 100644
---- a/gcc/testsuite/gcc.target/sparc/overflow-5.c
-+++ b/gcc/testsuite/gcc.target/sparc/overflow-5.c
-@@ -1,6 +1,6 @@
- /* { dg-do compile } */
- /* { dg-require-effective-target lp64 } */
--/* { dg-options "-O -fno-pie -mvis3" } */
-+/* { dg-options "-O -mvis3" } */
- 
- #include <stdbool.h>
- #include <stdint.h>
--- 
-2.34.3
-
diff --git a/package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
deleted file mode 100644
index 62eb437c62..0000000000
--- a/package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From 8555b8d4f1d873d172c12a540ff97c57ed17f045 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Sun, 2 May 2021 06:11:44 +0900
-Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
-
-When building libgeos we get an error with:
-
-    linux-uclibc/9.3.0/crtbeginS.o: in function `__do_global_dtors_aux':
-    crtstuff.c:(.text+0x118): relocation truncated to fit: R_OR1K_GOT16 against symbol `__cxa_finalize' defined in .text section in
-    /home/shorne/work/openrisc/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/output/host/or1k-buildroot-linux-uclibc/sysroot/lib/libc.so.
-
-This is caused by GOT code having a limit of 64k.  In OpenRISC this
-looks to be the only relocation code pattern to be limited to 64k.
-
-This patch allows specifying a new option -mcmodel=large which can be
-used to generate 2 more instructions to construct 32-bit addresses for
-up to 4G GOTs.
-
-gcc/ChangeLog:
-
-	PR 99783
-	* config/or1k/or1k-opts.h: New file.
-	* config/or1k/or1k.c (or1k_legitimize_address_1, print_reloc):
-	Support generating gotha relocations if -mcmodel=large is
-	specified.
-	* config/or1k/or1k.h (TARGET_CMODEL_SMALL, TARGET_CMODEL_LARGE):
-	New macros.
-	* config/or1k/or1k.opt (mcmodel=): New option.
-	* doc/invoke.text (OpenRISC Options): Document mcmodel.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- gcc/config/or1k/or1k-opts.h | 30 ++++++++++++++++++++++++++++++
- gcc/config/or1k/or1k.c      | 11 +++++++++--
- gcc/config/or1k/or1k.h      |  7 +++++++
- gcc/config/or1k/or1k.opt    | 19 +++++++++++++++++++
- gcc/doc/invoke.texi         | 12 +++++++++++-
- 5 files changed, 76 insertions(+), 3 deletions(-)
- create mode 100644 gcc/config/or1k/or1k-opts.h
-
-diff --git a/gcc/config/or1k/or1k-opts.h b/gcc/config/or1k/or1k-opts.h
-new file mode 100644
-index 00000000000..f791b894fdd
---- /dev/null
-+++ b/gcc/config/or1k/or1k-opts.h
-@@ -0,0 +1,30 @@
-+/* Definitions for option handling for OpenRISC.
-+   Copyright (C) 2021 Free Software Foundation, Inc.
-+   Contributed by Stafford Horne.
-+
-+   This file is part of GCC.
-+
-+   GCC is free software; you can redistribute it and/or modify it
-+   under the terms of the GNU General Public License as published
-+   by the Free Software Foundation; either version 3, or (at your
-+   option) any later version.
-+
-+   GCC is distributed in the hope that it will be useful, but WITHOUT
-+   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-+   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
-+   License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with GCC; see the file COPYING3.  If not see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#ifndef GCC_OR1K_OPTS_H
-+#define GCC_OR1K_OPTS_H
-+
-+/* The OpenRISC code generation models available.  */
-+enum or1k_cmodel_type {
-+  CMODEL_SMALL,
-+  CMODEL_LARGE
-+};
-+
-+#endif /* GCC_OR1K_OPTS_H */
-diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
-index 5fa5425aa2b..88613f9596b 100644
---- a/gcc/config/or1k/or1k.c
-+++ b/gcc/config/or1k/or1k.c
-@@ -750,7 +750,14 @@ or1k_legitimize_address_1 (rtx x, rtx scratch)
- 	    {
- 	      base = gen_sym_unspec (base, UNSPEC_GOT);
- 	      crtl->uses_pic_offset_table = 1;
--	      t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
-+	      if (TARGET_CMODEL_LARGE)
-+		{
-+	          emit_insn (gen_rtx_SET (t1, gen_rtx_HIGH (Pmode, base)));
-+	          emit_insn (gen_add3_insn (t1, t1, pic_offset_table_rtx));
-+	          t2 = gen_rtx_LO_SUM (Pmode, t1, base);
-+		}
-+	      else
-+	        t2 = gen_rtx_LO_SUM (Pmode, pic_offset_table_rtx, base);
- 	      t2 = gen_const_mem (Pmode, t2);
- 	      emit_insn (gen_rtx_SET (t1, t2));
- 	      base = t1;
-@@ -1089,7 +1096,7 @@ print_reloc (FILE *stream, rtx x, HOST_WIDE_INT add, reloc_kind kind)
-      no special markup.  */
-   static const char * const relocs[RKIND_MAX][RTYPE_MAX] = {
-     { "lo", "got", "gotofflo", "tpofflo", "gottpofflo", "tlsgdlo" },
--    { "ha", NULL,  "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
-+    { "ha", "gotha", "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
-   };
-   reloc_type type = RTYPE_DIRECT;
- 
-diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
-index 23db771d8fb..f1646d16dfd 100644
---- a/gcc/config/or1k/or1k.h
-+++ b/gcc/config/or1k/or1k.h
-@@ -21,6 +21,8 @@
- #ifndef GCC_OR1K_H
- #define GCC_OR1K_H
- 
-+#include "config/or1k/or1k-opts.h"
-+
- /* Names to predefine in the preprocessor for this target machine.  */
- #define TARGET_CPU_CPP_BUILTINS()		\
-   do						\
-@@ -35,6 +37,11 @@
-     }						\
-   while (0)
- 
-+#define TARGET_CMODEL_SMALL \
-+  (or1k_code_model == CMODEL_SMALL)
-+#define TARGET_CMODEL_LARGE \
-+  (or1k_code_model == CMODEL_LARGE)
-+
- /* Storage layout.  */
- 
- #define DEFAULT_SIGNED_CHAR 1
-diff --git a/gcc/config/or1k/or1k.opt b/gcc/config/or1k/or1k.opt
-index 03c9b8d0bba..8e035075f8a 100644
---- a/gcc/config/or1k/or1k.opt
-+++ b/gcc/config/or1k/or1k.opt
-@@ -21,6 +21,9 @@
- ; See the GCC internals manual (options.texi) for a description of
- ; this file's format.
- 
-+HeaderInclude
-+config/or1k/or1k-opts.h
-+
- mhard-div
- Target RejectNegative InverseMask(SOFT_DIV)
- Enable generation of hardware divide (l.div, l.divu) instructions.  This is the
-@@ -63,6 +66,22 @@ When -mhard-float is selected, enables generation of unordered floating point
- compare and set flag (lf.sfun*) instructions.  By default functions from libgcc
- are used to perform unordered floating point compare and set flag operations.
- 
-+mcmodel=
-+Target RejectNegative Joined Enum(or1k_cmodel_type) Var(or1k_code_model) Init(CMODEL_SMALL)
-+Specify the code model used for accessing memory addresses.  Specifying large
-+enables generating binaries with large global offset tables.  By default the
-+value is small.
-+
-+Enum
-+Name(or1k_cmodel_type) Type(enum or1k_cmodel_type)
-+Known code model types (for use with the -mcmodel= option):
-+
-+EnumValue
-+Enum(or1k_cmodel_type) String(small) Value(CMODEL_SMALL)
-+
-+EnumValue
-+Enum(or1k_cmodel_type) String(large) Value(CMODEL_LARGE)
-+
- mcmov
- Target RejectNegative Mask(CMOV)
- Enable generation of conditional move (l.cmov) instructions.  By default the
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index d7c787af226..848112e5b24 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -1103,7 +1103,8 @@ Objective-C and Objective-C++ Dialects}.
- @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
- -msoft-mul  -msoft-div @gol
- -msoft-float  -mhard-float  -mdouble-float -munordered-float @gol
---mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm}
-+-mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm @gol
-+-mcmodel=@var{code-model}}
- 
- @emph{PDP-11 Options}
- @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
-@@ -25142,6 +25143,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
- @code{l.slli}) instructions.  By default extra instructions will be generated
- to store the immediate to a register first.
- 
-+@item -mcmodel=small
-+@opindex mcmodel=small
-+Generate OpenRISC code for the small model: The GOT is limited to 64k. This is
-+the default model.
-+
-+@item -mcmodel=large
-+@opindex mcmodel=large
-+Generate OpenRISC code for the large model: The GOT may grow up to 4G in size.
-+
- 
- @end table
- 
--- 
-2.34.3
-
diff --git a/package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
deleted file mode 100644
index 30d0c607f5..0000000000
--- a/package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 3499ecd7c93c4c431cab83312bc5eabbf383c182 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Sun, 2 May 2021 06:11:45 +0900
-Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
-
-When linking gcc runtime objects into large binaries the link may fail
-with the below errors.  This will happen even if we are building with
--mcmodel=large.
-
-    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `deregister_tm_clones':
-    crtstuff.c:(.text+0x3c): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_deregisterTMCloneTable'
-    /home/shorne/work/openrisc/output/host/lib/gcc/or1k-buildroot-linux-uclibc/10.3.0/crtbeginS.o: in function `register_tm_clones':
-    crtstuff.c:(.text+0xc0): relocation truncated to fit: R_OR1K_GOT16 against undefined symbol `_ITM_registerTMCloneTable'
-
-This patch builds the gcc crtstuff binaries always with the
--mcmodel=large option to ensure they can be linked into large binaries.
-
-libgcc/ChangeLog:
-
-	PR 99783
-	* config.host (or1k-*, tmake_file): Add or1k/t-crtstuff.
-	* config/or1k/t-crtstuff: New file.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- libgcc/config.host            | 4 ++--
- libgcc/config/or1k/t-crtstuff | 2 ++
- 2 files changed, 4 insertions(+), 2 deletions(-)
- create mode 100644 libgcc/config/or1k/t-crtstuff
-
-diff --git a/libgcc/config.host b/libgcc/config.host
-index 89f41b56000..1210704d7e8 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -1137,12 +1137,12 @@ nios2-*-*)
- 	extra_parts="$extra_parts crti.o crtn.o"
- 	;;
- or1k-*-linux*)
--	tmake_file="$tmake_file or1k/t-or1k"
-+	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
- 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
- 	md_unwind_header=or1k/linux-unwind.h
- 	;;
- or1k-*-*)
--	tmake_file="$tmake_file or1k/t-or1k"
-+	tmake_file="$tmake_file or1k/t-or1k or1k/t-crtstuff"
- 	tmake_file="$tmake_file t-softfp-sfdf t-softfp"
- 	;;
- pdp11-*-*)
-diff --git a/libgcc/config/or1k/t-crtstuff b/libgcc/config/or1k/t-crtstuff
-new file mode 100644
-index 00000000000..dcae7f3498e
---- /dev/null
-+++ b/libgcc/config/or1k/t-crtstuff
-@@ -0,0 +1,2 @@
-+# Compile crtbeginS.o and crtendS.o with -mcmodel=large
-+CRTSTUFF_T_CFLAGS_S += -mcmodel=large
--- 
-2.34.3
-
diff --git a/package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
deleted file mode 100644
index e3dbbc7eb8..0000000000
--- a/package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d2e4e3e72b5f2f68d595dfd3a77f58744f3f243e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 27 Mar 2020 21:23:53 +0100
-Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
-
-The detection of pthread support fails on OpenRISC unless _REENTRANT
-is defined. Added the CPP_SPEC definition to correct this.
-
-Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- gcc/config/or1k/linux.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
-index 21cef067dda..2e1bb5601a9 100644
---- a/gcc/config/or1k/linux.h
-+++ b/gcc/config/or1k/linux.h
-@@ -32,6 +32,8 @@
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-or1k.so.1"
- 
-+#define CPP_SPEC "%{pthread:-D_REENTRANT}"
-+
- #undef LINK_SPEC
- #define LINK_SPEC "%{h*}			\
-    %{static:-Bstatic}				\
--- 
-2.34.3
-
diff --git a/package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch b/package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch
deleted file mode 100644
index 7ba9e0de54..0000000000
--- a/package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 14336d46b35577300dd68147a8f0c8165684850b Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 25 Jul 2022 00:29:55 +0200
-Subject: [PATCH] disable split-stack for non-thread builds
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-[Romain: convert to git format]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- libgcc/config/t-stack | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
-index cc0366b4cd8..f3f97e86d60 100644
---- a/libgcc/config/t-stack
-+++ b/libgcc/config/t-stack
-@@ -1,4 +1,6 @@
- # Makefile fragment to provide generic support for -fsplit-stack.
- # This should be used in config.host for any host which supports
- # -fsplit-stack.
-+ifeq ($(enable_threads),yes)
- LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
-+endif
--- 
-2.34.3
-
diff --git a/package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
deleted file mode 100644
index 8614537794..0000000000
--- a/package/gcc/10.4.0/0006-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From a6eedb593ca068d0ad8655dbb97fcd6371cba682 Mon Sep 17 00:00:00 2001
-From: Xi Ruoyao <xry111@mengyan1223.wang>
-Date: Mon, 28 Jun 2021 13:54:58 +0800
-Subject: [PATCH] fixinc: don't "fix" machine names in __has_include(...)
- [PR91085]
-
-fixincludes/
-
-	PR other/91085
-	* fixfixes.c (check_has_inc): New static function.
-	  (machine_name_fix): Don't replace header names in
-	  __has_include(...).
-	* inclhack.def (machine_name): Adjust test.
-	* tests/base/testing.h: Update.
-
-Upstream: 6bf383c37e6131a8e247e8a0997d55d65c830b6d
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- fixincludes/fixfixes.c           | 45 ++++++++++++++++++++++++++++++--
- fixincludes/inclhack.def         |  3 ++-
- fixincludes/tests/base/testing.h |  2 +-
- 3 files changed, 46 insertions(+), 4 deletions(-)
-
-diff --git a/fixincludes/fixfixes.c b/fixincludes/fixfixes.c
-index 034e15d9985..3ff87812036 100644
---- a/fixincludes/fixfixes.c
-+++ b/fixincludes/fixfixes.c
-@@ -477,6 +477,39 @@ FIX_PROC_HEAD( char_macro_def_fix )
-   fputs (text, stdout);
- }
- 
-+/* Check if the pattern at pos is actually in a "__has_include(...)"
-+   directive.  Return the pointer to the ')' of this
-+   "__has_include(...)" if it is, NULL otherwise.  */
-+static const char *
-+check_has_inc (const char *begin, const char *pos, const char *end)
-+{
-+  static const char has_inc[] = "__has_include";
-+  const size_t has_inc_len = sizeof (has_inc) - 1;
-+  const char *p;
-+
-+  for (p = memmem (begin, pos - begin, has_inc, has_inc_len);
-+       p != NULL;
-+       p = memmem (p, pos - p, has_inc, has_inc_len))
-+    {
-+      p += has_inc_len;
-+      while (p < end && ISSPACE (*p))
-+        p++;
-+
-+      /* "__has_include" may appear as "defined(__has_include)",
-+         search for the next appearance then.  */
-+      if (*p != '(')
-+        continue;
-+
-+      /* To avoid too much complexity, just hope there is never a
-+         ')' in a header name.  */
-+      p = memchr (p, ')', end - p);
-+      if (p == NULL || p > pos)
-+        return p;
-+    }
-+
-+  return NULL;
-+}
-+
- /* Fix for machine name #ifdefs that are not in the namespace reserved
-    by the C standard.  They won't be defined if compiling with -ansi,
-    and the headers will break.  We go to some trouble to only change
-@@ -524,7 +557,7 @@ FIX_PROC_HEAD( machine_name_fix )
-       /* If the 'name_pat' matches in between base and limit, we have
-          a bogon.  It is not worth the hassle of excluding comments
-          because comments on #if/#ifdef lines are rare, and strings on
--         such lines are illegal.
-+         such lines are only legal in a "__has_include" directive.
- 
-          REG_NOTBOL means 'base' is not at the beginning of a line, which
-          shouldn't matter since the name_re has no ^ anchor, but let's
-@@ -544,8 +577,16 @@ FIX_PROC_HEAD( machine_name_fix )
-             break;
- 
-           p = base + match[0].rm_so;
--          base += match[0].rm_eo;
- 
-+          /* Check if the match is in __has_include(...) (PR 91085). */
-+          q = check_has_inc (base, p, limit);
-+          if (q) 
-+            {
-+              base = q + 1;
-+              goto again;
-+            }
-+
-+          base += match[0].rm_eo;
-           /* One more test: if on the same line we have the same string
-              with the appropriate underscores, then leave it alone.
-              We want exactly two leading and trailing underscores.  */
-diff --git a/fixincludes/inclhack.def b/fixincludes/inclhack.def
-index f58e7771e1c..71bd717c233 100644
---- a/fixincludes/inclhack.def
-+++ b/fixincludes/inclhack.def
-@@ -3114,7 +3114,8 @@ fix = {
-     c_fix     = machine_name;
- 
-     test_text = "/* MACH_DIFF: */\n"
--    "#if defined( i386 ) || defined( sparc ) || defined( vax )"
-+    "#if defined( i386 ) || defined( sparc ) || defined( vax ) || "
-+    "defined( linux ) || __has_include ( <linux.h> )"
-     "\n/* no uniform test, so be careful  :-) */";
- };
- 
-diff --git a/fixincludes/tests/base/testing.h b/fixincludes/tests/base/testing.h
-index cf95321fb86..8b3accaf04e 100644
---- a/fixincludes/tests/base/testing.h
-+++ b/fixincludes/tests/base/testing.h
-@@ -64,7 +64,7 @@ BSD43__IOWR('T', 1) /* Some are multi-line */
- 
- #if defined( MACHINE_NAME_CHECK )
- /* MACH_DIFF: */
--#if defined( i386 ) || defined( sparc ) || defined( vax )
-+#if defined( i386 ) || defined( sparc ) || defined( vax ) || defined( linux ) || __has_include ( <linux.h> )
- /* no uniform test, so be careful  :-) */
- #endif  /* MACHINE_NAME_CHECK */
- 
--- 
-2.37.3
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e84ab84f23..4f2e47b9ea 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,16 +22,6 @@ config BR2_GCC_VERSION_POWERPC_SPE
 	depends on BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-config BR2_GCC_VERSION_10_X
-	bool "gcc 10.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
-	# powerpc spe support has been deprecated since gcc 8.x.
-	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
-	# ARC HS48 rel 31 only supported by gcc arc fork.
-	depends on !BR2_archs4x_rel31
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
-
 config BR2_GCC_VERSION_11_X
 	bool "gcc 11.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
@@ -88,7 +78,6 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "10.4.0"    if BR2_GCC_VERSION_10_X
 	default "11.4.0"    if BR2_GCC_VERSION_11_X
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
 	default "13.2.0"    if BR2_GCC_VERSION_13_X
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
