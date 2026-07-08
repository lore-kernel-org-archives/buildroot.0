Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3866DC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B5881025;
	Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMiJyWjcUxmA; Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BBB810B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691085;
	bh=dFGcGQYO8RqNuHvm4pTYSrly+TfByLy2ksAHrqIBloU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sfi5HbmnpFNM4eOz9Tz+loD3QRJdzDyDy3ho5XQyybVEwnX097AMZe0eK4/0y+VSf
	 Zs1O76R57QT4agLtz08euiePF/RMb7xnpa3wxOzRLSPl35fVkooQ0XMYGrSbIQEcQk
	 a+NpCARVJb1SkVXrbJY87/iF8F+j9z++AtZ6ukOb+E8pM3cB6DSmKKkR/lyBTORaaI
	 Gtrt27SxUsna08s5YtJ2nsz8A6vBuR/oRvV3fNJNbydfhddMhzhIw+0ypYWSrnm+b/
	 Gpk7j8qsCTtPiRMis4a7iKpwCaeikpa5ykNR7xuCMCvz9j50cbUSm8OqA8oVuMb3aM
	 Gu30LHfE51lkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6BBB810B3;
	Fri, 10 Jul 2026 13:44:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 500C2108E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40E5640928
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPG0r7AnCD5a for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC8E408FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BC8E408FC
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE768868F; Fri, 10 Jul 2026 13:44:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:41:10 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6358506f5224b5294bb7c76feb63677e4e0b5b05
X-Git-Newrev: 1af9ec0567a6988061e4eca7a32cea523ad491ac
X-Patchwork-Hint: ignore
Message-Id: <20260710134406.8CE768868F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/gcc: bump 15.x
 series to 15.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1af9ec0567a6988061e4eca7a32cea523ad491ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Announcement:
https://gcc.gnu.org/pipermail/gcc-announce/2026/000191.html

GCC 15.3 is a bug-fix release from the GCC 15 branch
containing important fixes for regressions and serious bugs in
GCC 15.2 with more than 208 bugs fixed since the previous release.

For the list of bugs fixed in this version, see:
https://gcc.gnu.org/gcc-15/changes.html#15.3

Removed patches which are included in this release,
renumbered patch 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit f8f6bcec0f523510a22882e4391999be81dc0e94)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |   2 +-
 ...disable-split-stack-for-non-thread-builds.patch |  26 --
 ...Enhance-support-for-atomics.-Fix-PR118280.patch | 286 ---------------------
 ...3-gcc-config-microblaze-fix-ira-for-GCC15.patch |  56 ----
 ...libgomp-Fix-GCC-build-after-glibc-cd748a6.patch |  77 ------
 ...libcody-Make-it-buildable-by-C-11-to-C-26.patch | 261 -------------------
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 8 files changed, 4 insertions(+), 710 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index cf197e4b16..e6587e305f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -354,7 +354,7 @@ package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch li
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/15.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
diff --git a/package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch
deleted file mode 100644
index c3b600cfb8..0000000000
--- a/package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7d5f59e035341430e20f47420535d0e987516e55 Mon Sep 17 00:00:00 2001
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
-2.50.1
-
diff --git a/package/gcc/15.2.0/0002-MicroBlaze-Enhance-support-for-atomics.-Fix-PR118280.patch b/package/gcc/15.2.0/0002-MicroBlaze-Enhance-support-for-atomics.-Fix-PR118280.patch
deleted file mode 100644
index 958339bf6c..0000000000
--- a/package/gcc/15.2.0/0002-MicroBlaze-Enhance-support-for-atomics.-Fix-PR118280.patch
+++ /dev/null
@@ -1,286 +0,0 @@
-From f14e0b13a5abbc15b4b3b4c0c6a125bbb0509465 Mon Sep 17 00:00:00 2001
-From: Gopi Kumar Bulusu <gopi@sankhya.com>
-Date: Thu, 10 Jul 2025 12:44:44 +0530
-Subject: [PATCH] MicroBlaze : Enhance support for atomics. Fix PR118280
-
-Atomic support enhanced to fix existing atomic_compare_and_swapsi pattern
-to handle side effects; new patterns atomic_fetch_op and atomic_test_and_set
-added. As MicroBlaze has no QImode test/set instruction, use shift magic
-to implement atomic_test_and_set. This fixes PR118280.
-
-Files Changed
-
-* gcc/config/microblaze/iterators.md: New
-* microblaze-protos.h/microblaze.cc : Add microblaze_subword_address
-* gcc/config/microblaze/microblaze.md: constants: Add UNSPECV_CAS_BOOL,
-  UNSPECV_CAS_MEM, UNSPECV_CAS_VAL, UNSPECV_ATOMIC_FETCH_OP
-  type: add atomic
-* gcc/config/microblaze/sync.md: Add atomic_fetch_<atomic_optab>si
-  atomic_test_and_set
-
-Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
-Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
-
-Signed-off-by: Kirk Meyer <kirk.meyer@sencore.com>
-Signed-off-by: David Holsgrove <david.holsgrove@xilinx.com>
-Signed-off-by: Gopi Kumar Bulusu <gopi@sankhya.com>
----
- gcc/config/microblaze/iterators.md        |  25 +++++
- gcc/config/microblaze/microblaze-protos.h |   1 +
- gcc/config/microblaze/microblaze.cc       |  28 ++++++
- gcc/config/microblaze/microblaze.h        |   2 +-
- gcc/config/microblaze/microblaze.md       |   7 +-
- gcc/config/microblaze/sync.md             | 107 ++++++++++++++++++----
- 6 files changed, 150 insertions(+), 20 deletions(-)
- create mode 100644 gcc/config/microblaze/iterators.md
-
-diff --git a/gcc/config/microblaze/iterators.md b/gcc/config/microblaze/iterators.md
-new file mode 100644
-index 00000000000..2ffc2422a0a
---- /dev/null
-+++ b/gcc/config/microblaze/iterators.md
-@@ -0,0 +1,25 @@
-+;; Iterator definitions for GCC MicroBlaze machine description files.
-+;; Copyright (C) 2012-2024 Free Software Foundation, Inc.
-+;;
-+;; This file is part of GCC.
-+;;
-+;; GCC is free software; you can redistribute it and/or modify
-+;; it under the terms of the GNU General Public License as published by
-+;; the Free Software Foundation; either version 3, or (at your option)
-+;; any later version.
-+;;
-+;; GCC is distributed in the hope that it will be useful,
-+;; but WITHOUT ANY WARRANTY; without even the implied warranty of
-+;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+;; GNU General Public License for more details.
-+;;
-+;; You should have received a copy of the GNU General Public License
-+;; along with GCC; see the file COPYING3.  If not see
-+;; <http://www.gnu.org/licenses/>.
-+
-+; atomics code iterator
-+(define_code_iterator any_atomic [plus ior xor and])
-+
-+; atomics code attribute
-+(define_code_attr atomic_optab
-+  [(plus "add") (ior "or") (xor "xor") (and "and")])
-diff --git a/gcc/config/microblaze/microblaze-protos.h b/gcc/config/microblaze/microblaze-protos.h
-index 90b79cfe716..1cee0b3096c 100644
---- a/gcc/config/microblaze/microblaze-protos.h
-+++ b/gcc/config/microblaze/microblaze-protos.h
-@@ -62,6 +62,7 @@ extern int symbol_mentioned_p (rtx);
- extern int label_mentioned_p (rtx);
- extern bool microblaze_cannot_force_const_mem (machine_mode, rtx);
- extern void microblaze_eh_return (rtx op0);
-+extern void microblaze_subword_address (rtx, rtx *, rtx *);
- #endif  /* RTX_CODE */
- 
- /* Declare functions in microblaze-c.cc.  */
-diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
-index 4b7f0a1a5e0..78b9428ef3b 100644
---- a/gcc/config/microblaze/microblaze.cc
-+++ b/gcc/config/microblaze/microblaze.cc
-@@ -1300,6 +1300,34 @@ microblaze_expand_block_move (rtx dest, rtx src, rtx length, rtx align_rtx)
-   return false;
- }
- 
-+/* Compute memory address *aligned_mem and corresponding shift value (*shift)
-+   from a QImode memory reference MEM */
-+void
-+microblaze_subword_address (rtx mem, rtx *aligned_mem, rtx *shift)
-+{
-+  /* Align the memory address to a word.  */
-+  rtx addr = force_reg (Pmode, XEXP (mem, 0));
-+
-+  rtx addr_mask = gen_int_mode (-4, Pmode);
-+
-+  rtx aligned_addr = gen_reg_rtx (Pmode);
-+
-+  emit_move_insn (aligned_addr,  gen_rtx_AND (Pmode, addr, addr_mask));
-+
-+  *aligned_mem = change_address (mem, SImode, aligned_addr);
-+
-+  /* Calculate the shift amount.  */
-+  emit_move_insn (*shift, gen_rtx_AND (SImode, addr, gen_int_mode (3, SImode)));
-+
-+  if (TARGET_LITTLE_ENDIAN == 0) {
-+    emit_move_insn (*shift,
-+		    gen_rtx_MINUS (SImode, gen_int_mode (3, SImode), *shift));
-+  }
-+
-+  emit_move_insn (*shift, gen_rtx_ASHIFT (SImode, *shift,
-+					  gen_int_mode (3, SImode)));
-+}
-+
- static bool
- microblaze_rtx_costs (rtx x, machine_mode mode, int outer_code ATTRIBUTE_UNUSED,
- 		      int opno ATTRIBUTE_UNUSED, int *total,
-diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
-index 2390542434b..b2e9ccde363 100644
---- a/gcc/config/microblaze/microblaze.h
-+++ b/gcc/config/microblaze/microblaze.h
-@@ -57,7 +57,7 @@ extern enum pipeline_type microblaze_pipe;
- 
- /* Default target_flags if no switches are specified  */
- #define TARGET_DEFAULT      (MASK_SOFT_MUL | MASK_SOFT_DIV | MASK_SOFT_FLOAT \
--                             | TARGET_ENDIAN_DEFAULT)
-+			      | TARGET_ENDIAN_DEFAULT)
- 
- /* Do we have CLZ?  */
- #define TARGET_HAS_CLZ      (TARGET_PATTERN_COMPARE && microblaze_has_clz)
-diff --git a/gcc/config/microblaze/microblaze.md b/gcc/config/microblaze/microblaze.md
-index 45c48a71e8d..270df8da0c5 100644
---- a/gcc/config/microblaze/microblaze.md
-+++ b/gcc/config/microblaze/microblaze.md
-@@ -21,6 +21,7 @@
- 
- (include "constraints.md")
- (include "predicates.md")
-+(include "iterators.md")
- 
- ;;----------------------------------------------------
- ;; Constants
-@@ -43,6 +44,10 @@
-   (UNSPEC_TLS           106)    ;; jump table
-   (UNSPEC_SET_TEXT      107)    ;; set text start
-   (UNSPEC_TEXT          108)    ;; data text relative
-+  (UNSPECV_CAS_BOOL     201)    ;; compare and swap (bool)
-+  (UNSPECV_CAS_VAL      202)    ;; compare and swap (val)
-+  (UNSPECV_CAS_MEM      203)    ;; compare and swap (mem)
-+  (UNSPECV_ATOMIC_FETCH_OP     204)    ;; atomic fetch op
- ])
- 
- (define_c_enum "unspec" [
-@@ -79,7 +84,7 @@
- ;; bshift 	Shift operations
- 
- (define_attr "type"
--  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap"
-+  "unknown,branch,jump,call,load,store,move,arith,darith,imul,idiv,icmp,multi,nop,no_delay_arith,no_delay_load,no_delay_store,no_delay_imul,no_delay_move,bshift,fadd,frsub,fmul,fdiv,fcmp,fsl,fsqrt,fcvt,trap,atomic"
-   (const_string "unknown"))
- 
- ;; Main data type used by the insn
-diff --git a/gcc/config/microblaze/sync.md b/gcc/config/microblaze/sync.md
-index db7b11e5379..6478ab6dcac 100644
---- a/gcc/config/microblaze/sync.md
-+++ b/gcc/config/microblaze/sync.md
-@@ -18,26 +18,97 @@
- ;; <http://www.gnu.org/licenses/>.
- 
- (define_insn "atomic_compare_and_swapsi"
--  [(match_operand:SI 0 "register_operand" "=&d")	;; bool output
--   (match_operand:SI 1 "register_operand" "=&d")	;; val output
--   (match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
--   (match_operand:SI 3 "register_operand" "d")		;; expected value
--   (match_operand:SI 4 "register_operand" "d")		;; desired value
--   (match_operand:SI 5 "const_int_operand" "")		;; is_weak
--   (match_operand:SI 6 "const_int_operand" "")		;; mod_s
--   (match_operand:SI 7 "const_int_operand" "")		;; mod_f
-+  [(set (match_operand:SI 0 "register_operand" "=&d")		;; bool output
-+        (unspec_volatile:SI
-+          [(match_operand:SI 2 "nonimmediate_operand" "+Q")	;; memory
-+           (match_operand:SI 3 "register_operand" "d")		;; expected value
-+           (match_operand:SI 4 "register_operand" "d")]		;; desired value
-+          UNSPECV_CAS_BOOL))
-+   (set (match_operand:SI 1 "register_operand" "=&d")		;; val output
-+        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_VAL))
-+   (set (match_dup 2)
-+        (unspec_volatile:SI [(const_int 0)] UNSPECV_CAS_MEM))
-+   (match_operand:SI 5 "const_int_operand" "")			;; is_weak
-+   (match_operand:SI 6 "const_int_operand" "")			;; mod_s
-+   (match_operand:SI 7 "const_int_operand" "")			;; mod_f
-    (clobber (match_scratch:SI 8 "=&d"))]
-   ""
-   {
--    output_asm_insn ("addc \tr0,r0,r0", operands);
--    output_asm_insn ("lwx  \t%1,%y2,r0", operands);
--    output_asm_insn ("addic\t%8,r0,0", operands);
--    output_asm_insn ("bnei \t%8,.-8", operands);
--    output_asm_insn ("cmp  \t%0,%1,%3", operands);
--    output_asm_insn ("bnei \t%0,.+16", operands);
--    output_asm_insn ("swx  \t%4,%y2,r0", operands);
--    output_asm_insn ("addic\t%8,r0,0", operands);
--    output_asm_insn ("bnei \t%8,.-28", operands);
--    return "";
-+    return "add  \t%0,r0,r0\n\t"
-+      "lwx  \t%1,%y2,r0\n\t"
-+      "addic\t%8,r0,0\n\t"
-+      "bnei \t%8,.-8\n\t"
-+      "cmp  \t%8,%1,%3\n\t"
-+      "bnei \t%8,.+20\n\t"
-+      "swx  \t%4,%y2,r0\n\t"
-+      "addic\t%8,r0,0\n\t"
-+      "bnei \t%8,.-28\n\t"
-+      "addi \t%0,r0,1";
-   }
-+  [(set_attr "type"	"atomic")
-+  (set_attr "mode"	"SI")
-+  (set_attr "length"	"40")]
- )
-+
-+;;
-+;;
-+;;
-+;;
-+(define_insn "atomic_fetch_<atomic_optab>si"
-+  [(set (match_operand:SI 0 "register_operand" "=&d")
-+	(match_operand:SI 1 "memory_operand" "+Q"))
-+   (set (match_dup 1)
-+	(unspec_volatile:SI
-+	  [(any_atomic:SI (match_dup 1)
-+		   (match_operand:SI 2 "register_operand" "d"))
-+	   (match_operand:SI 3 "const_int_operand")] ;; model
-+	 UNSPECV_ATOMIC_FETCH_OP))
-+   (clobber (match_scratch:SI 4 "=&d"))]	  ;; tmp_1
-+  ""
-+  {
-+    return 
-+      "lwx  \t%0,%y1,r0\n\t"
-+      "addic\t%4,r0,0\n\t"
-+      "bnei \t%4,.-8\n\t"
-+      "<atomic_optab>\t%4,%0,%2\n\t"
-+      "swx  \t%4,%y1,r0\n\t"
-+      "addic\t%4,r0,0\n\t"
-+      "bnei \t%4,.-24";
-+  }
-+  [(set_attr "type"	"atomic")
-+  (set_attr "mode"	"SI")
-+  (set_attr "length"	"28")])
-+
-+;;
-+;; MicroBlaze only supports lx/sx instructions for word mode only
-+;;
-+;; Use shift|mask magic to implement atomic_test_and_set using lwx/swx
-+;;
-+(define_expand "atomic_test_and_set"
-+  [(match_operand:QI 0 "register_operand" "")    ;; bool output
-+   (match_operand:QI 1 "memory_operand" "m")    ;; memory
-+   (match_operand:SI 2 "const_int_operand" "")]  ;; model
-+  ""
-+{
-+  rtx old = gen_reg_rtx (SImode);
-+  rtx mem = operands[1];
-+  rtx model = operands[2];
-+  rtx set = gen_reg_rtx (SImode);
-+  rtx aligned_mem = gen_reg_rtx (SImode);
-+  rtx shift = gen_reg_rtx (SImode);
-+
-+  microblaze_subword_address (mem, &aligned_mem, &shift);
-+
-+  emit_move_insn (set, GEN_INT (1));
-+  rtx shifted_set = gen_reg_rtx (SImode);
-+
-+  emit_move_insn (shifted_set, gen_rtx_ASHIFT (SImode, set, shift));
-+
-+  emit_insn (gen_atomic_fetch_orsi (old, aligned_mem, shifted_set, model));
-+
-+  emit_move_insn (old, gen_rtx_ASHIFTRT (SImode, old, shift));
-+
-+  emit_move_insn (operands[0], gen_lowpart (QImode, old));
-+
-+  DONE;
-+})
--- 
-2.50.1
-
diff --git a/package/gcc/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
deleted file mode 100644
index 663aab7218..0000000000
--- a/package/gcc/15.2.0/0003-gcc-config-microblaze-fix-ira-for-GCC15.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d2fdbd8c4abe67eea86877dfb3b3b9d8508c165f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 6 Aug 2025 22:32:30 +0200
-Subject: [PATCH] gcc/config/microblaze: fix ira for GCC15
-
-Add new hooks for callee-save on microblaze defined by [1] and
-return 1 to restore the old behavior prior to the commit [3].
-
-Tested with qemu_microblazeel_mmu_defconfig and used to generate
-Microblaze toolchains for the Bootlin toolchains 2025.08-1 [4][5].
-
-Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
-
-[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b191e8bdecf881d11c1544c441e38f4c18392a15
-[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/i386.cc;h=3128973ba79cccfc6761f451dcb716b9558cc4da;hb=d3ff498c478acefce35de04402f99171b4f64a1a#l20606
-[3] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b
-[4] https://lore.kernel.org/buildroot/87sehzndtp.fsf@dell.be.48ers.dk/T/#mce7decd0b3f6a41008d5de577538a8525c91b374
-[5] https://toolchains.bootlin.com/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/microblaze/microblaze.cc | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
-index 78b9428ef3b..84ea7e8d55a 100644
---- a/gcc/config/microblaze/microblaze.cc
-+++ b/gcc/config/microblaze/microblaze.cc
-@@ -3228,6 +3228,14 @@ microblaze_secondary_reload (bool in_p ATTRIBUTE_UNUSED, rtx x ATTRIBUTE_UNUSED,
-   return NO_REGS;
- }
- 
-+/* Implement TARGET_CALLEE_SAVE_COST.  */
-+static int
-+microblaze_callee_save_cost (spill_cost_type, unsigned int hard_regno, machine_mode,
-+		       unsigned int, int mem_cost, const HARD_REG_SET &, bool)
-+{
-+  return 1;
-+}
-+
- static void
- microblaze_globalize_label (FILE * stream, const char *name)
- {
-@@ -4066,6 +4074,9 @@ microblaze_starting_frame_offset (void)
- #undef TARGET_SECONDARY_RELOAD
- #define TARGET_SECONDARY_RELOAD		microblaze_secondary_reload
- 
-+#undef TARGET_CALLEE_SAVE_COST
-+#define TARGET_CALLEE_SAVE_COST microblaze_callee_save_cost
-+
- #undef  TARGET_ASM_OUTPUT_MI_THUNK
- #define TARGET_ASM_OUTPUT_MI_THUNK      microblaze_asm_output_mi_thunk
- 
--- 
-2.50.1
-
diff --git a/package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch b/package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch
deleted file mode 100644
index e24c4dd57e..0000000000
--- a/package/gcc/15.2.0/0004-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 9c9d3aef2f66625d9cb03ef4baee10ed6648e681 Mon Sep 17 00:00:00 2001
-From: Frank Scheiner <frank.scheiner@web.de>
-Date: Tue, 25 Nov 2025 16:58:23 -0700
-Subject: [PATCH] [PATCH] libgomp: Fix GCC build after glibc@cd748a6
-
-The toolchain autobuilds for ia64 failed ([1]) yesterday with:
-
-```
-libtool: compile:  /usr/src/t2-src/src.gcc.ia64-toolchain.251121.040147.278918/gcc-16-20251116/objs/gcc/xgcc-wrapper /usr/src/t2-src/src.gcc.ia64-toolchain.251121.040147.278918/gcc-16-20251116/objs/./gcc/xgcc -B/usr/src/t2-src/src.gcc.ia64-toolchain.251121.040147.278918/gcc-16-20251116/objs/./gcc/ -B/usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/bin/ -B/usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/lib/ -isystem /usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/include -isystem /usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux/TOOLCHAIN/cross/usr/ia64-t2-linux-gnu/sys-include --sysroot=/usr/src/t2-src/build/ia64-toolchain-24-svn-generic-ia64-itanium2-cross-linux -DHAVE_CONFIG_H -I. -I../../../libgomp -I../../../libgomp/config/linux/ia64 -I../../../libgomp
 /config/linux -I../../../libgomp/config/posix -I../../../libgomp -I../../../libgomp/../include -Wall -Werror -ftls-model=initial-exec -pthread -DUSING_INITIAL_EXEC_TLS -g -O2 -MT oacc-cuda.lo -MD -MP -MF .deps/oacc-cuda.Tpo -c ../../../libgomp/oacc-cuda.c -o oacc-cuda.o >/dev/null 2>&1
-../../../libgomp/affinity-fmt.c: In function 'gomp_display_affinity':
-../../../libgomp/affinity-fmt.c:330:25: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-  330 |               char *q = strchr (p + 1, '}');
-      |                         ^~~~~~
-```
-
-[1]: https://github.com/johnny-mnemonic/toolchain-autobuilds/actions/runs/19559235881
-
-This is not ia64-specific but due to the changes in the recent glibc
-commit "Implement C23 const-preserving standard library macros" (i.e.
-[2]) now requiring "char *q" to be a pointer to a const char to compile
-w/o error because of the return value of strchr() .
-
-[2]: https://sourceware.org/git/?p=glibc.git;a=commit;h=cd748a63ab1a7ae846175c532a3daab341c62690
-
-Also see the related discussion at [3] for details.
-
-[3]: https://sourceware.org/pipermail/libc-alpha/2025-November/172809.html
-
-The GCC build is fixed by the attached patch, see [4] for a successful
-build with the then latest snapshots of binutils, glibc and GCC.
-
-[4]: https://github.com/johnny-mnemonic/toolchain-autobuilds/actions/runs/19585045571
-
-Idea from Tomas, attached patch from me.
-
-Cheers,
-Frank
-
-0001-libgomp-Fix-GCC-build-after-glibc-cd748a6.patch
-
-From 80af9c233c694904174b54a59404d311378f41f8 Mon Sep 17 00:00:00 2001
-From: Frank Scheiner <frank.scheiner@web.de>
-Date: Sat, 22 Nov 2025 14:58:10 +0100
-Subject: [PATCH] libgomp: Fix GCC build after glibc@cd748a6
-
-char *q needs to be a pointer to a const char for the return value of
-strchr() with glibc after "Implement C23 const-preserving standard library
-macros".
-
-[glibc@cd748a6]: https://sourceware.org/git/?p=glibc.git;a=commit;h=cd748a63ab1a7ae846175c532a3daab341c62690
-
-libgomp/ChangeLog:
-	* affinity-fmt.c: Make char *q a pointer to a const char.
-
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=9c9d3aef2f66625d9cb03ef4baee10ed6648e681
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libgomp/affinity-fmt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgomp/affinity-fmt.c b/libgomp/affinity-fmt.c
-index 1fae893cbaca..8d3df5f1cd55 100644
---- a/libgomp/affinity-fmt.c
-+++ b/libgomp/affinity-fmt.c
-@@ -327,7 +327,7 @@ gomp_display_affinity (char *buffer, size_t size,
- 	      }
- 	  if (c == '{')
- 	    {
--	      char *q = strchr (p + 1, '}');
-+	      const char *q = strchr (p + 1, '}');
- 	      if (q)
- 		gomp_fatal ("unsupported long type name '%.*s' in affinity "
- 			    "format", (int) (q - (p + 1)), p + 1);
--- 
-2.43.7
-
diff --git a/package/gcc/15.2.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc/15.2.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index 8788a0c0bd..0000000000
--- a/package/gcc/15.2.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From 1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
-Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb7..147fecdbe50 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
- 
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
- 
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
-     {
-       if (e == EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
- 
-   Assert (!words.empty ());
--  if (words[0] == u8"ERROR")
-+  if (words[0] == (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () == 2 ? words[1]: u8"malformed error response");
-+		   words.size () == 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
- 
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
- 
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
- 
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () = std::move (msg);
-     }
-   else if (result.GetCode () == Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
-+  if (words[0] == (const char *) u8"HELLO"
-+      && (words.size () == 3 || words.size () == 4))
-     {
-       char *eptr;
-       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"PATHNAME" && words.size () == 2)
-+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
- 
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"OK")
-+  if (words[0] == (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"BOOL" && words.size () == 2)
-+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
-     {
--      if (words[1] == u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] == u8"TRUE")
-+      if (words[1] == (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] == (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b7..93bce93aa94 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
- 
- // C++11 doesn't have utf8 character literals :(
- 
-+#if __cpp_char8_t >= 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I == 2, "only single octet strings may be converted");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I == 2, "only single octet strings may be converted");
-   return s[0];
- }
-+#endif
- 
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >= 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote = false,
-+		   size_t len = ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >= 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb93..c18469fae84 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-   };
- }
- 
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
- 
- 	  if (err > 0)
--	    msg = u8"error processing '";
-+	    msg = (const char *) u8"error processing '";
- 	  else if (ix >= Detail::RC_HWM)
--	    msg = u8"unrecognized '";
-+	    msg = (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
--	    msg = u8"already connected '";
-+	    msg = (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
--	    msg = u8"not connected '";
-+	    msg = (const char *) u8"not connected '";
- 	  else
--	    msg = u8"malformed '";
-+	    msg = (const char *) u8"malformed '";
- 
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
- 
-   if (words.size () == 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version = ParseUnsigned (words[1]);
-   if (version == ~0u)
-     return nullptr;
--- 
-2.54.0
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 21581487df..d838b5c755 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -70,7 +70,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.3.0"    if BR2_GCC_VERSION_14_X
-	default "15.2.0"    if BR2_GCC_VERSION_15_X
+	default "15.3.0"    if BR2_GCC_VERSION_15_X
 	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index deb7c40fa3..5a8e552f1b 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
 sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
-sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-15.3.0/sha512.sum
+sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc4567bfe4128a6f64968c2cfc8eff40b36229cba7425349f7d637c654  gcc-15.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
