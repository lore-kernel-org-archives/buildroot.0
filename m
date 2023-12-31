Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1643C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 17:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 847FA404A8;
	Sun, 31 Dec 2023 17:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 847FA404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ONVtiQXtwO0; Sun, 31 Dec 2023 17:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A605040477;
	Sun, 31 Dec 2023 17:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A605040477
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96CC71BF3EB
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7339840477
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7339840477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enaB6txT6DwS for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 17:35:19 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10E96404A0
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 17:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E96404A0
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 986493520E80; Sun, 31 Dec 2023 18:26:19 +0100 (CET)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 18:25:33 +0100
Message-Id: <20231231172538.1279608-2-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231231172538.1279608-1-wbx@openadk.org>
References: <20231231172538.1279608-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704043579; bh=xqhqLCxX+XOXA4luajJ2zi/3GgVKQwKS1y9VkYcKvBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Toquhm+1ok0uttC2sou09jzHHGsfoIS3CRXk8IA/uvsKnVaf0P4Mu3+ufuxs5fBrl
 HPHQeSCG/lYuote0T9xIhur2Cqfmru7tcgYOa5+qCp1Yl/DHEAri8YbVe5lRn0L5Jf
 DrHCL+LkNmx5UHXhquiuvEAM2W1celo7wOl6Yc/8RPTU6Qlzzxjrdpz7Jbudr33Qmm
 rv86mRQEH6x6L832jKS05jCfMrBaUpnCRxfnIx0YFR165eu2ANNO1zzVKlhqSti57Y
 1bUKHFN31MUmImxaI6kn/BW28wKhizHXfEPkSWP1TmH4W6+F9lKHW1nCdipP/3F4lf
 SS+rdr5uZ1QUQ==
Subject: [Buildroot] [PATCH 1/6] package/gcc: remove special arc version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/Config.in.host                    |   9 -
 .../0001-arc-Refurbish-adc-sbc-patterns.patch | 243 ------------------
 ...er-Remove-cyclades-from-libsanitizer.patch | 121 ---------
 ...-machine-names-in-__has_include-.-PR.patch | 124 ---------
 .../0100-uclibc-conf.patch                    |  29 ---
 package/gcc/gcc.hash                          |   2 -
 package/gcc/gcc.mk                            |   5 -
 7 files changed, 533 deletions(-)
 delete mode 100644 package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch
 delete mode 100644 package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
 delete mode 100644 package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
 delete mode 100644 package/gcc/arc-2020.09-release/0100-uclibc-conf.patch

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fd721088ec..db6f378d6a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,19 +2,11 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
-	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_GCC_VERSION_12_X
 	help
 	  Select the version of gcc you wish to use.
 
-config BR2_GCC_VERSION_ARC
-	bool "gcc arc (10.x)"
-	# Only supported architecture
-	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
-
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
 	# powerpc spe support has been deprecated since gcc 8.x.
@@ -81,7 +73,6 @@ config BR2_GCC_VERSION
 	default "11.4.0"    if BR2_GCC_VERSION_11_X
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
 	default "13.2.0"    if BR2_GCC_VERSION_13_X
-	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch b/package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch
deleted file mode 100644
index 3292b26a4e..0000000000
--- a/package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch
+++ /dev/null
@@ -1,243 +0,0 @@
-From b92c22b144d063c4436a6693045ceb57d344c495 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 11 Nov 2020 12:31:10 +0200
-Subject: [PATCH] arc: Refurbish adc/sbc patterns
-
-The adc/sbc patterns were unecessary spliting, remove that and
-associated functions.
-
-gcc/ChangeLog:
-
-2020-10-11  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc-protos.h (arc_scheduling_not_expected): Remove
-	it.
-	(arc_sets_cc_p): Likewise.
-	(arc_need_delay): Likewise.
-	* config/arc/arc.c (arc_sets_cc_p): Likewise.
-	(arc_need_delay): Likewise.
-	(arc_scheduling_not_expected): Likewise.
-	* config/arc/arc.md: Convert adc/sbc patterns to simple
-	instruction definitions.
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
-
-Downloaded from upstream commit
-https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/b92c22b144d063c4436a6693045ceb57d344c495
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- gcc/config/arc/arc-protos.h |  3 --
- gcc/config/arc/arc.c        | 53 ---------------------
- gcc/config/arc/arc.md       | 95 +++++++++++--------------------------
- 3 files changed, 29 insertions(+), 122 deletions(-)
-
-diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
-index c72d78e3b9e..de4cf47c818 100644
---- a/gcc/config/arc/arc-protos.h
-+++ b/gcc/config/arc/arc-protos.h
-@@ -90,10 +90,7 @@ extern void split_subsi (rtx *);
- extern void arc_split_move (rtx *);
- extern const char *arc_short_long (rtx_insn *insn, const char *, const char *);
- extern rtx arc_regno_use_in (unsigned int, rtx);
--extern bool arc_scheduling_not_expected (void);
--extern bool arc_sets_cc_p (rtx_insn *insn);
- extern int arc_label_align (rtx_insn *label);
--extern bool arc_need_delay (rtx_insn *insn);
- extern bool arc_text_label (rtx_insn *insn);
- 
- extern bool arc_short_comparison_p (rtx, int);
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 5a7b0cb6696..c3ee9181f93 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -10341,59 +10341,6 @@ arc_attr_type (rtx_insn *insn)
-   return get_attr_type (insn);
- }
- 
--/* Return true if insn sets the condition codes.  */
--
--bool
--arc_sets_cc_p (rtx_insn *insn)
--{
--  if (NONJUMP_INSN_P (insn))
--    if (rtx_sequence *seq = dyn_cast <rtx_sequence *> (PATTERN (insn)))
--      insn = seq->insn (seq->len () - 1);
--  return arc_attr_type (insn) == TYPE_COMPARE;
--}
--
--/* Return true if INSN is an instruction with a delay slot we may want
--   to fill.  */
--
--bool
--arc_need_delay (rtx_insn *insn)
--{
--  rtx_insn *next;
--
--  if (!flag_delayed_branch)
--    return false;
--  /* The return at the end of a function needs a delay slot.  */
--  if (NONJUMP_INSN_P (insn) && GET_CODE (PATTERN (insn)) == USE
--      && (!(next = next_active_insn (insn))
--	  || ((!NONJUMP_INSN_P (next) || GET_CODE (PATTERN (next)) != SEQUENCE)
--	      && arc_attr_type (next) == TYPE_RETURN))
--      && (!TARGET_PAD_RETURN
--	  || (prev_active_insn (insn)
--	      && prev_active_insn (prev_active_insn (insn))
--	      && prev_active_insn (prev_active_insn (prev_active_insn (insn))))))
--    return true;
--  if (NONJUMP_INSN_P (insn)
--      ? (GET_CODE (PATTERN (insn)) == USE
--	 || GET_CODE (PATTERN (insn)) == CLOBBER
--	 || GET_CODE (PATTERN (insn)) == SEQUENCE)
--      : JUMP_P (insn)
--      ? (GET_CODE (PATTERN (insn)) == ADDR_VEC
--	 || GET_CODE (PATTERN (insn)) == ADDR_DIFF_VEC)
--      : !CALL_P (insn))
--    return false;
--  return num_delay_slots (insn) != 0;
--}
--
--/* Return true if the scheduling pass(es) has/have already run,
--   i.e. where possible, we should try to mitigate high latencies
--   by different instruction selection.  */
--
--bool
--arc_scheduling_not_expected (void)
--{
--  return cfun->machine->arc_reorg_started;
--}
--
- /* Code has a minimum p2 alignment of 1, which we must restore after
-    an ADDR_DIFF_VEC.  */
- 
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index f91adbc0d94..c635b69ddd5 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -2847,43 +2847,25 @@ archs4x, archs4xd"
-    (set_attr "type" "compare")
-    (set_attr "length" "4,4,8")])
- 
--; w/c/c comes first (rather than w/0/C_0) to prevent the middle-end
--; needlessly prioritizing the matching constraint.
--; Rcw/0/C_0 comes before w/c/L so that the lower latency conditional
--; execution is used where possible.
--(define_insn_and_split "adc"
--  [(set (match_operand:SI 0 "dest_reg_operand" "=w,Rcw,w,Rcw,w")
--	(plus:SI (plus:SI (ltu:SI (reg:CC_C CC_REG) (const_int 0))
--			  (match_operand:SI 1 "nonmemory_operand"
--							 "%c,0,c,0,cCal"))
--		 (match_operand:SI 2 "nonmemory_operand" "c,C_0,L,I,cCal")))]
-+(define_insn "adc"
-+  [(set (match_operand:SI 0 "register_operand"    "=r,  r,r,r,  r,r")
-+	(plus:SI
-+	 (plus:SI
-+	  (ltu:SI (reg:CC_C CC_REG) (const_int 0))
-+	  (match_operand:SI 1 "nonmemory_operand" "%r,  0,r,0,Cal,r"))
-+	 (match_operand:SI 2 "nonmemory_operand"   "r,C_0,L,I,  r,Cal")))]
-   "register_operand (operands[1], SImode)
-    || register_operand (operands[2], SImode)"
-   "@
--	adc %0,%1,%2
--	add.cs %0,%1,1
--	adc %0,%1,%2
--	adc %0,%1,%2
--	adc %0,%1,%2"
--  ; if we have a bad schedule after sched2, split.
--  "reload_completed
--   && !optimize_size && (!TARGET_ARC600_FAMILY)
--   && arc_scheduling_not_expected ()
--   && arc_sets_cc_p (prev_nonnote_insn (insn))
--   /* If next comes a return or other insn that needs a delay slot,
--      expect the adc to get into the delay slot.  */
--   && next_nonnote_insn (insn)
--   && !arc_need_delay (next_nonnote_insn (insn))
--   /* Restore operands before emitting.  */
--   && (extract_insn_cached (insn), 1)"
--  [(set (match_dup 0) (match_dup 3))
--   (cond_exec
--     (ltu (reg:CC_C CC_REG) (const_int 0))
--     (set (match_dup 0) (plus:SI (match_dup 0) (const_int 1))))]
--  "operands[3] = simplify_gen_binary (PLUS, SImode, operands[1], operands[2]);"
-+    adc\\t%0,%1,%2
-+    add.cs\\t%0,%1,1
-+    adc\\t%0,%1,%2
-+    adc\\t%0,%1,%2
-+    adc\\t%0,%1,%2
-+    adc\\t%0,%1,%2"
-   [(set_attr "cond" "use")
-    (set_attr "type" "cc_arith")
--   (set_attr "length" "4,4,4,4,8")])
-+   (set_attr "length" "4,4,4,4,8,8")])
- 
- ; combiner-splitter cmp / scc -> cmp / adc
- (define_split
-@@ -3015,7 +2997,7 @@ archs4x, archs4xd"
-       DONE;
-     }
-   emit_insn (gen_sub_f (l0, l1, l2));
--  emit_insn (gen_sbc (h0, h1, h2, gen_rtx_REG (CCmode, CC_REG)));
-+  emit_insn (gen_sbc (h0, h1, h2));
-   DONE;
-   ")
- 
-@@ -3030,44 +3012,25 @@ archs4x, archs4xd"
-    (set_attr "type" "cc_arith")
-    (set_attr "length" "4")])
- 
--; w/c/c comes first (rather than Rcw/0/C_0) to prevent the middle-end
--; needlessly prioritizing the matching constraint.
--; Rcw/0/C_0 comes before w/c/L so that the lower latency conditional execution
--; is used where possible.
--(define_insn_and_split "sbc"
--  [(set (match_operand:SI 0 "dest_reg_operand" "=w,Rcw,w,Rcw,w")
--	(minus:SI (minus:SI (match_operand:SI 1 "nonmemory_operand"
--						"c,0,c,0,cCal")
--			    (ltu:SI (match_operand:CC_C 3 "cc_use_register")
--				    (const_int 0)))
--		  (match_operand:SI 2 "nonmemory_operand" "c,C_0,L,I,cCal")))]
-+(define_insn "sbc"
-+  [(set (match_operand:SI 0 "dest_reg_operand"   "=r,r,r,r,r,r")
-+	(minus:SI
-+	 (minus:SI
-+	  (match_operand:SI 1 "nonmemory_operand" "r,  0,r,0,  r,Cal")
-+	  (ltu:SI (reg:CC_C CC_REG) (const_int 0)))
-+	 (match_operand:SI 2 "nonmemory_operand"  "r,C_0,L,I,Cal,r")))]
-   "register_operand (operands[1], SImode)
-    || register_operand (operands[2], SImode)"
-   "@
--	sbc %0,%1,%2
--	sub.cs %0,%1,1
--	sbc %0,%1,%2
--	sbc %0,%1,%2
--	sbc %0,%1,%2"
--  ; if we have a bad schedule after sched2, split.
--  "reload_completed
--   && !optimize_size && (!TARGET_ARC600_FAMILY)
--   && arc_scheduling_not_expected ()
--   && arc_sets_cc_p (prev_nonnote_insn (insn))
--   /* If next comes a return or other insn that needs a delay slot,
--      expect the adc to get into the delay slot.  */
--   && next_nonnote_insn (insn)
--   && !arc_need_delay (next_nonnote_insn (insn))
--   /* Restore operands before emitting.  */
--   && (extract_insn_cached (insn), 1)"
--  [(set (match_dup 0) (match_dup 4))
--   (cond_exec
--     (ltu (reg:CC_C CC_REG) (const_int 0))
--     (set (match_dup 0) (plus:SI (match_dup 0) (const_int -1))))]
--  "operands[4] = simplify_gen_binary (MINUS, SImode, operands[1], operands[2]);"
-+    sbc\\t%0,%1,%2
-+    sub.cs\\t%0,%1,1
-+    sbc\\t%0,%1,%2
-+    sbc\\t%0,%1,%2
-+    sbc\\t%0,%1,%2
-+    sbc\\t%0,%1,%2"
-   [(set_attr "cond" "use")
-    (set_attr "type" "cc_arith")
--   (set_attr "length" "4,4,4,4,8")])
-+   (set_attr "length" "4,4,4,4,8,8")])
- 
- (define_insn "sub_f"
-   [(set (reg:CC CC_REG)
diff --git a/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
deleted file mode 100644
index 051d4db341..0000000000
--- a/package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 1557c3d919623a95c2aa090d3018c31401f63f88 Mon Sep 17 00:00:00 2001
-From: Tamar Christina <tamar.christina@arm.com>
-Date: Fri, 21 May 2021 12:16:56 +0100
-Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
-
-The Linux kernel has removed the interface to cyclades from
-the latest kernel headers[1] due to them being orphaned for the
-past 13 years.
-
-libsanitizer uses this header when compiling against glibc, but
-glibcs itself doesn't seem to have any references to cyclades.
-
-Further more it seems that the driver is broken in the kernel and
-the firmware doesn't seem to be available anymore.
-
-As such since this is breaking the build of libsanitizer (and so the
-GCC bootstrap[2]) I propose to remove this.
-
-[1] https://lkml.org/lkml/2021/3/2/153
-[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
-
-libsanitizer/ChangeLog:
-
-	PR sanitizer/100379
-	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
-	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
-	* sanitizer_common/sanitizer_platform_limits_posix.cc: Likewise.
-	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
----
- .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
- .../sanitizer_platform_limits_posix.cpp               | 11 -----------
- .../sanitizer_platform_limits_posix.h                 | 10 ----------
- 3 files changed, 30 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-index 490a04b2181..42e43a04441 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-@@ -366,15 +366,6 @@ static void ioctl_table_fill() {
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
--  _(CYGETDEFTHRESH, WRITE, sizeof(int));
--  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
--  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
--  _(CYGETTHRESH, WRITE, sizeof(int));
--  _(CYGETTIMEOUT, WRITE, sizeof(int));
--  _(CYSETDEFTHRESH, NONE, 0);
--  _(CYSETDEFTIMEOUT, NONE, 0);
--  _(CYSETTHRESH, NONE, 0);
--  _(CYSETTIMEOUT, NONE, 0);
-   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
-   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
-   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index aa845df4dde..badf6a401cc 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -130,7 +130,6 @@ typedef struct user_fpregs elf_fpregset_t;
- # include <sys/procfs.h>
- #endif
- #include <sys/user.h>
--#include <linux/cyclades.h>
- #include <linux/if_eql.h>
- #include <linux/if_plip.h>
- #include <linux/lp.h>
-@@ -443,7 +442,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
--  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
- #if EV_VERSION > (0x010000)
-   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
- #else
-@@ -809,15 +807,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- #endif // SANITIZER_LINUX
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
--  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
--  unsigned IOCTL_CYGETMON = CYGETMON;
--  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
--  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
--  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
--  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
--  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
--  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
-   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
-   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
-   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index d82fd5e4005..dc6423bc297 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -974,7 +974,6 @@ extern unsigned struct_vt_mode_sz;
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
- extern unsigned struct_ax25_parms_struct_sz;
--extern unsigned struct_cyclades_monitor_sz;
- extern unsigned struct_input_keymap_entry_sz;
- extern unsigned struct_ipx_config_data_sz;
- extern unsigned struct_kbdiacrs_sz;
-@@ -1319,15 +1318,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
- #endif  // SANITIZER_LINUX
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--extern unsigned IOCTL_CYGETDEFTHRESH;
--extern unsigned IOCTL_CYGETDEFTIMEOUT;
--extern unsigned IOCTL_CYGETMON;
--extern unsigned IOCTL_CYGETTHRESH;
--extern unsigned IOCTL_CYGETTIMEOUT;
--extern unsigned IOCTL_CYSETDEFTHRESH;
--extern unsigned IOCTL_CYSETDEFTIMEOUT;
--extern unsigned IOCTL_CYSETTHRESH;
--extern unsigned IOCTL_CYSETTIMEOUT;
- extern unsigned IOCTL_EQL_EMANCIPATE;
- extern unsigned IOCTL_EQL_ENSLAVE;
- extern unsigned IOCTL_EQL_GETMASTRCFG;
--- 
-2.31.1
-
diff --git a/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
deleted file mode 100644
index 8b6be49e68..0000000000
--- a/package/gcc/arc-2020.09-release/0003-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 65754c50a57e5a891cee75bb744eb93fdb3c443e Mon Sep 17 00:00:00 2001
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
diff --git a/package/gcc/arc-2020.09-release/0100-uclibc-conf.patch b/package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
deleted file mode 100644
index d354baf81f..0000000000
--- a/package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 326b880b20e5f8187dbda736b4c4c662cbfb00ca Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 2 May 2017 22:36:15 +0200
-Subject: [PATCH] uclibc-conf
-
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- contrib/regression/objs-gcc.sh | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
-index 60b0497..6dc7ead 100755
---- a/contrib/regression/objs-gcc.sh
-+++ b/contrib/regression/objs-gcc.sh
-@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
-  then
-   make all-gdb all-dejagnu all-ld || exit 1
-   make install-gdb install-dejagnu install-ld || exit 1
-+elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
-+ then
-+  make all-gdb all-dejagnu all-ld || exit 1
-+  make install-gdb install-dejagnu install-ld || exit 1
- elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
-   make bootstrap || exit 1
-   make install || exit 1
--- 
-2.9.3
-
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 478b0b1620..a2a38a005e 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -9,8 +9,6 @@ sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea78
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.2.0/sha512.sum
 sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2  gcc-13.2.0.tar.xz
 
-# Locally calculated (fetched from Github)
-sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 93bc46643c..f858b9841f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -10,13 +10,8 @@
 
 GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 
-ifeq ($(BR2_GCC_VERSION_ARC),y)
-GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
-endif
 
 HOST_GCC_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
 HOST_GCC_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
