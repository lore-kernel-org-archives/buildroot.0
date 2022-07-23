Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648A5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E736684BDC;
	Sat, 23 Jul 2022 15:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E736684BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvWbBUB_gx75; Sat, 23 Jul 2022 15:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51DA84BE1;
	Sat, 23 Jul 2022 15:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B51DA84BE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84F441BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5753D84BDF
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5753D84BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPwB2cMxc0fI for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 620C384BDD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 620C384BDD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 46B048469F; Sat, 23 Jul 2022 15:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:31:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 650bc56a55f28ac66d0e4e9b566beaeaa8f6437d
X-Git-Newrev: d159163e40bd99b8f00944e34610eeea04c736da
X-Patchwork-Hint: ignore
Message-Id: <20220723151806.46B048469F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: remove gcc 9.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=d159163e40bd99b8f00944e34610eeea04c736da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 12.1 is around, gcc 11.3 is the default version, so drop
9.5 in order to reduce the gcc choice.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   7 +
 ...k-Fix-issue-with-set_got-clobbering-LR-r9.patch | 105 -------
 ..._REENTRANT-for-OpenRISC-when-pthread-is-p.patch |  31 --
 ...R-target-92095-internal-error-with-O1-mcp.patch | 325 ---------------------
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch | 201 -------------
 ...k-Use-cmodel-large-when-building-crtstuff.patch |  60 ----
 package/gcc/Config.in.host                         |  15 -
 package/gcc/gcc.hash                               |   2 -
 8 files changed, 7 insertions(+), 739 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 956da10a9f..7349f0b037 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
+config BR2_GCC_VERSION_9_X
+	bool "gcc 9.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 9.x has been removed. The current
+	  default version (11.x or later) has been selected instead.
+
 config BR2_PACKAGE_PHP_EXT_WDDX
 	bool "php wddx removed"
 	select BR2_LEGACY
diff --git a/package/gcc/9.4.0/0001-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch b/package/gcc/9.4.0/0001-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
deleted file mode 100644
index 185e16c179..0000000000
--- a/package/gcc/9.4.0/0001-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 014db5e5febec94e35c13ce89ee6b389328873a1 Mon Sep 17 00:00:00 2001
-From: shorne <shorne@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 31 Aug 2019 06:00:56 +0000
-Subject: [PATCH] or1k: Fix issue with set_got clobbering LR (r9)
-
-When compiling glibc we found that the GOT register was being allocated
-r9 when the instruction was still set_got_tmp.  That is a problem
-because r9 is the Link Register (LR) in OpenRISC which is used/clobbered
-in set_got.  We cannot use r9 as the GOT register.  Also, we cannot
-simply say set_got_tmp clobbers r9 as this is the reason for having the
-temporary set_got_tmp.
-
-Fix by using a register class constraint that does not allow r9 during
-register allocation.
-
-gcc/ChangeLog:
-
-        * config/or1k/constraints.md (t): New constraint.
-        * config/or1k/or1k.h (GOT_REGS): New register class.
-        * config/or1k/or1k.md (set_got_tmp, set_got): Use t contraint.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@275242 138bc75d-0d04-0410-961f-82ee72b054a4
-(cherry picked from commit 5b9471ffca25d39635680516ba2ff85295480fc3)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/or1k/constraints.md | 4 ++++
- gcc/config/or1k/or1k.h         | 3 +++
- gcc/config/or1k/or1k.md        | 4 ++--
- 3 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/or1k/constraints.md b/gcc/config/or1k/constraints.md
-index 93da8c058c6..a16b749008f 100644
---- a/gcc/config/or1k/constraints.md
-+++ b/gcc/config/or1k/constraints.md
-@@ -24,6 +24,7 @@
- 
- ; We use:
- ;  c - sibcall registers
-+;  t - got address registers (excludes LR (r9) which is clobbered by set_got)
- ;  I - constant signed 16-bit
- ;  K - constant unsigned 16-bit
- ;  M - constant signed 16-bit shifted left 16-bits (l.movhi)
-@@ -32,6 +33,9 @@
- (define_register_constraint "c" "SIBCALL_REGS"
-   "Registers which can hold a sibling call address")
- 
-+(define_register_constraint "t" "GOT_REGS"
-+  "Registers which can be used to store the Global Offset Table (GOT) address.")
-+
- ;; Immediates
- (define_constraint "I"
-   "A signed 16-bit immediate in the range -32768 to 32767."
-diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
-index 6dda230f217..feee702d89c 100644
---- a/gcc/config/or1k/or1k.h
-+++ b/gcc/config/or1k/or1k.h
-@@ -189,6 +189,7 @@ enum reg_class
- {
-   NO_REGS,
-   SIBCALL_REGS,
-+  GOT_REGS,
-   GENERAL_REGS,
-   FLAG_REGS,
-   ALL_REGS,
-@@ -200,6 +201,7 @@ enum reg_class
- #define REG_CLASS_NAMES {	\
-   "NO_REGS", 			\
-   "SIBCALL_REGS",		\
-+  "GOT_REGS",			\
-   "GENERAL_REGS",		\
-   "FLAG_REGS",			\
-   "ALL_REGS" }
-@@ -212,6 +214,7 @@ enum reg_class
- #define REG_CLASS_CONTENTS      \
- { { 0x00000000, 0x00000000 },	\
-   { SIBCALL_REGS_MASK,   0 },	\
-+  { 0xfffffdff, 0x00000000 },	\
-   { 0xffffffff, 0x00000003 },	\
-   { 0x00000000, 0x00000004 },	\
-   { 0xffffffff, 0x00000007 }	\
-diff --git a/gcc/config/or1k/or1k.md b/gcc/config/or1k/or1k.md
-index 2dad51cd46b..88f3f02630f 100644
---- a/gcc/config/or1k/or1k.md
-+++ b/gcc/config/or1k/or1k.md
-@@ -595,7 +595,7 @@
- ;; set_got pattern below.  This works because the set_got_tmp insn is the
- ;; first insn in the stream and that it isn't moved during RA.
- (define_insn "set_got_tmp"
--  [(set (match_operand:SI 0 "register_operand" "=r")
-+  [(set (match_operand:SI 0 "register_operand" "=t")
- 	(unspec_volatile:SI [(const_int 0)] UNSPECV_SET_GOT))]
-   ""
- {
-@@ -604,7 +604,7 @@
- 
- ;; The insn to initialize the GOT.
- (define_insn "set_got"
--  [(set (match_operand:SI 0 "register_operand" "=r")
-+  [(set (match_operand:SI 0 "register_operand" "=t")
- 	(unspec:SI [(const_int 0)] UNSPEC_SET_GOT))
-    (clobber (reg:SI LR_REGNUM))]
-   ""
--- 
-2.31.1
-
diff --git a/package/gcc/9.4.0/0002-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/9.4.0/0002-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
deleted file mode 100644
index 5ac03d7c0c..0000000000
--- a/package/gcc/9.4.0/0002-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
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
-index cbdc781418f..36303af892c 100644
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
-2.31.1
-
diff --git a/package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
deleted file mode 100644
index 0c69de93be..0000000000
--- a/package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
+++ /dev/null
@@ -1,325 +0,0 @@
-From 1107ecc3e8af31adc7bbd4e08c0614836bd1cebd Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 20 Jan 2021 23:22:16 +0100
-Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
- -mcpu=niagara2 -fPIE)"
-
-This reverts commit 6bf2990842388101897b6f465524cbc295ee8cf9.
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
-index f1c120c4860..f4b6f00a7b1 100644
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
-index 0553dc501e6..516dcf96d7b 100644
---- a/gcc/config/sparc/sparc.c
-+++ b/gcc/config/sparc/sparc.c
-@@ -4170,6 +4170,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
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
-@@ -4205,11 +4212,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
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
-@@ -4222,6 +4227,27 @@ sparc_got (void)
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
-@@ -4241,78 +4267,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
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
-@@ -5477,7 +5455,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
-     return true;
- 
-   /* GOT register (%l7) if needed.  */
--  if (got_register_rtx && regno == REGNO (got_register_rtx))
-+  if (regno == GLOBAL_OFFSET_TABLE_REGNUM && got_register_rtx)
-     return true;
- 
-   /* If the function accesses prior frames, the frame pointer and the return
-@@ -12520,9 +12498,10 @@ static void
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
-@@ -12559,22 +12538,17 @@ sparc_file_end (void)
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
-@@ -13080,10 +13054,7 @@ sparc_init_pic_reg (void)
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
-index d9ef79c13cc..6dbd054f1c7 100644
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
-2.31.1
-
diff --git a/package/gcc/9.4.0/0004-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/9.4.0/0004-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
deleted file mode 100644
index 894411f394..0000000000
--- a/package/gcc/9.4.0/0004-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
+++ /dev/null
@@ -1,201 +0,0 @@
-From 90b202b59fa2bdb68314a23471b32d3e16602bc8 Mon Sep 17 00:00:00 2001
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
- gcc/doc/invoke.texi         | 13 ++++++++++++-
- 5 files changed, 77 insertions(+), 3 deletions(-)
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
-index fc10fcfabde..df67d72b139 100644
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
-@@ -1097,7 +1104,7 @@ print_reloc (FILE *stream, rtx x, HOST_WIDE_INT add, reloc_kind kind)
-      no special markup.  */
-   static const char * const relocs[RKIND_MAX][RTYPE_MAX] = {
-     { "lo", "got", "gotofflo", "tpofflo", "gottpofflo", "tlsgdlo" },
--    { "ha", NULL,  "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
-+    { "ha", "gotha", "gotoffha", "tpoffha", "gottpoffha", "tlsgdhi" },
-   };
-   reloc_type type = RTYPE_DIRECT;
- 
-diff --git a/gcc/config/or1k/or1k.h b/gcc/config/or1k/or1k.h
-index feee702d89c..dbaf0d0fe4c 100644
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
-index 7bdbd842dd4..116524c3441 100644
---- a/gcc/config/or1k/or1k.opt
-+++ b/gcc/config/or1k/or1k.opt
-@@ -23,6 +23,9 @@
- 
- ; Please try to keep this file in ASCII collating order.
- 
-+HeaderInclude
-+config/or1k/or1k-opts.h
-+
- mhard-div
- Target RejectNegative InverseMask(SOFT_DIV)
- Use hardware divide instructions, use -msoft-div for emulation.
-@@ -31,6 +34,22 @@ mhard-mul
- Target RejectNegative InverseMask(SOFT_MUL).
- Use hardware multiply instructions, use -msoft-mul for emulation.
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
- Allows generation of binaries which use the l.cmov instruction.  If your target
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 7b5f6e03d9f..683c64417af 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -1032,7 +1032,9 @@ Objective-C and Objective-C++ Dialects}.
- @emph{OpenRISC Options}
- @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
- -msoft-mul  -msoft-div @gol
---mcmov  -mror  -msext  -msfimm  -mshftimm}
-+-mcmov  -mror  -mrori  -msext  -msfimm  -mshftimm @gol
-+-mcmodel=@var{code-model}}
-+
- 
- @emph{PDP-11 Options}
- @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
-@@ -27462,6 +27464,15 @@ MWAITX, SHA, CLZERO, AES, PCL_MUL, CX16, MOVBE, MMX, SSE, SSE2, SSE3, SSE4A,
- SSSE3, SSE4.1, SSE4.2, ABM, XSAVEC, XSAVES, CLFLUSHOPT, POPCNT, and 64-bit
- instruction set extensions.)
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
- @item btver1
- CPUs based on AMD Family 14h cores with x86-64 instruction set support.  (This
--- 
-2.31.1
-
diff --git a/package/gcc/9.4.0/0005-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/9.4.0/0005-or1k-Use-cmodel-large-when-building-crtstuff.patch
deleted file mode 100644
index 69d143349a..0000000000
--- a/package/gcc/9.4.0/0005-or1k-Use-cmodel-large-when-building-crtstuff.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From d64a757040fe36b0d9dc65d24107c656f66bc8e5 Mon Sep 17 00:00:00 2001
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
-index bdbf77a3e62..bfb45a90630 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -1061,12 +1061,12 @@ nios2-*-*)
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
-2.31.1
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3c9008bc9e..a7e237c3f7 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -21,20 +21,6 @@ config BR2_GCC_VERSION_POWERPC_SPE
 	depends on BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-config BR2_GCC_VERSION_9_X
-	bool "gcc 9.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
-	# powerpc spe support has been deprecated since gcc 8.x.
-	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
-	# C-SKY sk610 needs abiv1, which is not supported in
-	# upstream gcc. C-SKY gcc upstream support not tested
-	# with upstream binutils and glibc.
-	depends on !BR2_csky
-	# ARC HS48 rel 31 only supported by gcc arc fork.
-	depends on !BR2_archs4x_rel31
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
-
 config BR2_GCC_VERSION_10_X
 	bool "gcc 10.x"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
@@ -99,7 +85,6 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "9.4.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
 	default "12.1.0"    if BR2_GCC_VERSION_12_X
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index dc19c282c2..b1cfb1c9cf 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,5 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-#  From https://gcc.gnu.org/pub/gcc/releases/gcc-9.4.0/sha512.sum
-sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624  gcc-9.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
