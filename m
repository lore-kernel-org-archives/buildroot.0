Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C14CC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E2444F4E6;
	Fri, 28 Feb 2025 16:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-citCLWhWXj; Fri, 28 Feb 2025 16:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C674FF3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C674FF3C;
	Fri, 28 Feb 2025 16:50:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F46268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00FE842EBE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIVpXWfbD8nQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3266E4280E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3266E4280E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2921887C2C; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jan 2025 11:58:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ba2fb599cd002b57fa70e978d91884c98d8aad05
X-Git-Newrev: edfc67fb1a5f0fe67ba9de91e90b06a44902c231
X-Patchwork-Hint: ignore
Message-Id: <20250228162957.2921887C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: bump to version
 9.2.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edfc67fb1a5f0fe67ba9de91e90b06a44902c231
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes log:
https://wiki.qemu.org/ChangeLog/9.2

Remove upstream patches:
0003-target-arm-Add-new-MMU-indexes-for-AArch32-Secure-PL.patch
0002-Revert-target-arm-Fix-usage-of-MMU-indexes-when-EL3-.patch

Rebase remaining patch to apply with fuzz factor 0:
0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch

Rename --disable-sanitizers to --disable-{asan, ubsan} following
upstream changes:
https://gitlab.com/qemu-project/qemu/-/commit/cb771ac1f59ced0aba5acedacfd4e92a9d0727b6

Qemu defconfigs were runtime tested on Gitlab-CI:
https://gitlab.com/kubu93/buildroot/-/pipelines/1609609766/

Runtime tests using host-qemu was locally tested:
  TestXvisor, TestFwts

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...son-don-t-build-fp-bench-test-if-fenv.h-i.patch |  14 +-
 ...et-arm-Fix-usage-of-MMU-indexes-when-EL3-.patch | 375 --------------------
 ...Add-new-MMU-indexes-for-AArch32-Secure-PL.patch | 380 ---------------------
 package/qemu/qemu.hash                             |   2 +-
 package/qemu/qemu.mk                               |   5 +-
 5 files changed, 12 insertions(+), 764 deletions(-)

diff --git a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
index f9e523a627..509850b8fa 100644
--- a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
+++ b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
@@ -1,4 +1,4 @@
-From d6fea3c321c7eb18e6dd151f5d4b0cc46b77bcc0 Mon Sep 17 00:00:00 2001
+From 67d9845d3583053baaae73883be73ca257bfcf20 Mon Sep 17 00:00:00 2001
 From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Date: Tue, 30 Apr 2024 09:40:55 +0200
 Subject: [PATCH] tests/fp/meson: don't build fp-bench test if fenv.h is
@@ -16,17 +16,19 @@ Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 [Dario: make the patch to be applied with fuzz factor 0]
 Upstream: https://patchwork.ozlabs.org/project/qemu-devel/patch/20240430164752.645521-1-dario.binacchi@amarulasolutions.com/
+[Romain: rebase on Qemu 9.2.0]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
 ---
  tests/fp/meson.build | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/tests/fp/meson.build b/tests/fp/meson.build
-index 114b4b483ea7..0e1237be54ed 100644
+index 9059a24752..2b290f83e7 100644
 --- a/tests/fp/meson.build
 +++ b/tests/fp/meson.build
-@@ -126,12 +126,14 @@ test('fp-test-mulAdd', fptest,
-            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
-      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 180)
+@@ -139,12 +139,14 @@ test('fp-test-mulAdd', fptest,
+      timeout: slow_fp_tests.get('mulAdd', 30),
+      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'])
  
 -executable(
 -  'fp-bench',
@@ -46,5 +48,5 @@ index 114b4b483ea7..0e1237be54ed 100644
  fptestlog2 = executable(
    'fp-test-log2',
 -- 
-2.34.1
+2.47.1
 
diff --git a/package/qemu/0002-Revert-target-arm-Fix-usage-of-MMU-indexes-when-EL3-.patch b/package/qemu/0002-Revert-target-arm-Fix-usage-of-MMU-indexes-when-EL3-.patch
deleted file mode 100644
index b7a03ba91f..0000000000
--- a/package/qemu/0002-Revert-target-arm-Fix-usage-of-MMU-indexes-when-EL3-.patch
+++ /dev/null
@@ -1,375 +0,0 @@
-From 4a6a8a9e87e2de4acd37a9de44617d9b773b0b7c Mon Sep 17 00:00:00 2001
-From: Peter Maydell <peter.maydell@linaro.org>
-Date: Fri, 1 Nov 2024 14:28:44 +0000
-Subject: [PATCH] Revert "target/arm: Fix usage of MMU indexes when EL3 is
- AArch32"
-
-This reverts commit 4c2c0474693229c1f533239bb983495c5427784d.
-
-This commit tried to fix a problem with our usage of MMU indexes when
-EL3 is AArch32, using what it described as a "more complicated
-approach" where we share the same MMU index values for Secure PL1&0
-and NonSecure PL1&0. In theory this should work, but the change
-didn't account for (at least) two things:
-
-(1) The design change means we need to flush the TLBs at any point
-where the CPU state flips from one to the other.  We already flush
-the TLB when SCR.NS is changed, but we don't flush the TLB when we
-take an exception from NS PL1&0 into Mon or when we return from Mon
-to NS PL1&0, and the commit didn't add any code to do that.
-
-(2) The ATS12NS* address translate instructions allow Mon code (which
-is Secure) to do a stage 1+2 page table walk for NS.  I thought this
-was OK because do_ats_write() does a page table walk which doesn't
-use the TLBs, so because it can pass both the MMU index and also an
-ARMSecuritySpace argument we can tell the table walk that we want NS
-stage1+2, not S.  But that means that all the code within the ptw
-that needs to find e.g.  the regime EL cannot do so only with an
-mmu_idx -- all these functions like regime_sctlr(), regime_el(), etc
-would need to pass both an mmu_idx and the security_space, so they
-can tell whether this is a translation regime controlled by EL1 or
-EL3 (and so whether to look at SCTLR.S or SCTLR.NS, etc).
-
-In particular, because regime_el() wasn't updated to look at the
-ARMSecuritySpace it would return 1 even when the CPU was in Monitor
-mode (and the controlling EL is 3).  This meant that page table walks
-in Monitor mode would look at the wrong SCTLR, TCR, etc and would
-generally fault when they should not.
-
-Rather than trying to make the complicated changes needed to rescue
-the design of 4c2c04746932, we revert it in order to instead take the
-route that that commit describes as "the most straightforward" fix,
-where we add new MMU indexes EL30_0, EL30_3, EL30_3_PAN to correspond
-to "Secure PL1&0 at PL0", "Secure PL1&0 at PL1", and "Secure PL1&0 at
-PL1 with PAN".
-
-This revert will re-expose the "spurious alignment faults in
-Secure PL0" issue #2326; we'll fix it again in the next commit.
-
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-Upstream-Status: Pending
-Upstream: https://patchew.org/QEMU/20241101142845.1712482-1-peter.maydell@linaro.org
-See: https://gitlab.com/qemu-project/qemu/-/issues/2588#note_2189338512
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- target/arm/cpu.h               | 31 +++++++++++++------------------
- target/arm/helper.c            | 34 +++++++++++-----------------------
- target/arm/internals.h         | 27 ++++-----------------------
- target/arm/ptw.c               |  6 +-----
- target/arm/tcg/hflags.c        |  4 ----
- target/arm/tcg/translate-a64.c |  2 +-
- target/arm/tcg/translate.c     |  9 ++++-----
- target/arm/tcg/translate.h     |  2 --
- 8 files changed, 34 insertions(+), 81 deletions(-)
-
-diff --git a/target/arm/cpu.h b/target/arm/cpu.h
-index 9a3fd59562..216774f5d3 100644
---- a/target/arm/cpu.h
-+++ b/target/arm/cpu.h
-@@ -2784,7 +2784,8 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
-  *  + NonSecure PL1 & 0 stage 1
-  *  + NonSecure PL1 & 0 stage 2
-  *  + NonSecure PL2
-- *  + Secure PL1 & 0
-+ *  + Secure PL0
-+ *  + Secure PL1
-  * (reminder: for 32 bit EL3, Secure PL1 is *EL3*, not EL1.)
-  *
-  * For QEMU, an mmu_idx is not quite the same as a translation regime because:
-@@ -2802,39 +2803,37 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
-  *     The only use of stage 2 translations is either as part of an s1+2
-  *     lookup or when loading the descriptors during a stage 1 page table walk,
-  *     and in both those cases we don't use the TLB.
-- *  4. we want to be able to use the TLB for accesses done as part of a
-+ *  4. we can also safely fold together the "32 bit EL3" and "64 bit EL3"
-+ *     translation regimes, because they map reasonably well to each other
-+ *     and they can't both be active at the same time.
-+ *  5. we want to be able to use the TLB for accesses done as part of a
-  *     stage1 page table walk, rather than having to walk the stage2 page
-  *     table over and over.
-- *  5. we need separate EL1/EL2 mmu_idx for handling the Privileged Access
-+ *  6. we need separate EL1/EL2 mmu_idx for handling the Privileged Access
-  *     Never (PAN) bit within PSTATE.
-- *  6. we fold together most secure and non-secure regimes for A-profile,
-+ *  7. we fold together most secure and non-secure regimes for A-profile,
-  *     because there are no banked system registers for aarch64, so the
-  *     process of switching between secure and non-secure is
-  *     already heavyweight.
-- *  7. we cannot fold together Stage 2 Secure and Stage 2 NonSecure,
-+ *  8. we cannot fold together Stage 2 Secure and Stage 2 NonSecure,
-  *     because both are in use simultaneously for Secure EL2.
-  *
-  * This gives us the following list of cases:
-  *
-- * EL0 EL1&0 stage 1+2 (or AArch32 PL0 PL1&0 stage 1+2)
-- * EL1 EL1&0 stage 1+2 (or AArch32 PL1 PL1&0 stage 1+2)
-- * EL1 EL1&0 stage 1+2 +PAN (or AArch32 PL1 PL1&0 stage 1+2 +PAN)
-+ * EL0 EL1&0 stage 1+2 (aka NS PL0)
-+ * EL1 EL1&0 stage 1+2 (aka NS PL1)
-+ * EL1 EL1&0 stage 1+2 +PAN
-  * EL0 EL2&0
-  * EL2 EL2&0
-  * EL2 EL2&0 +PAN
-  * EL2 (aka NS PL2)
-- * EL3 (not used when EL3 is AArch32)
-+ * EL3 (aka S PL1)
-  * Stage2 Secure
-  * Stage2 NonSecure
-  * plus one TLB per Physical address space: S, NS, Realm, Root
-  *
-  * for a total of 14 different mmu_idx.
-  *
-- * Note that when EL3 is AArch32, the usage is potentially confusing
-- * because the MMU indexes are named for their AArch64 use, so code
-- * using the ARMMMUIdx_E10_1 might be at EL3, not EL1. This is because
-- * Secure PL1 is always at EL3.
-- *
-  * R profile CPUs have an MPU, but can use the same set of MMU indexes
-  * as A profile. They only need to distinguish EL0 and EL1 (and
-  * EL2 for cores like the Cortex-R52).
-@@ -3127,10 +3126,6 @@ FIELD(TBFLAG_A32, NS, 10, 1)
-  * This requires an SME trap from AArch32 mode when using NEON.
-  */
- FIELD(TBFLAG_A32, SME_TRAP_NONSTREAMING, 11, 1)
--/*
-- * Indicates whether we are in the Secure PL1&0 translation regime
-- */
--FIELD(TBFLAG_A32, S_PL1_0, 12, 1)
- 
- /*
-  * Bit usage when in AArch32 state, for M-profile only.
-diff --git a/target/arm/helper.c b/target/arm/helper.c
-index 0a582c1cd3..8fb4b474e8 100644
---- a/target/arm/helper.c
-+++ b/target/arm/helper.c
-@@ -3700,7 +3700,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-          */
-         format64 = arm_s1_regime_using_lpae_format(env, mmu_idx);
- 
--        if (arm_feature(env, ARM_FEATURE_EL2) && !arm_aa32_secure_pl1_0(env)) {
-+        if (arm_feature(env, ARM_FEATURE_EL2)) {
-             if (mmu_idx == ARMMMUIdx_E10_0 ||
-                 mmu_idx == ARMMMUIdx_E10_1 ||
-                 mmu_idx == ARMMMUIdx_E10_1_PAN) {
-@@ -3774,11 +3774,13 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
-     case 0:
-         /* stage 1 current state PL1: ATS1CPR, ATS1CPW, ATS1CPRP, ATS1CPWP */
-         switch (el) {
-+        case 3:
-+            mmu_idx = ARMMMUIdx_E3;
-+            break;
-         case 2:
-             g_assert(ss != ARMSS_Secure);  /* ARMv8.4-SecEL2 is 64-bit only */
-             /* fall through */
-         case 1:
--        case 3:
-             if (ri->crm == 9 && arm_pan_enabled(env)) {
-                 mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
-             } else {
-@@ -11859,11 +11861,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
- 
- uint64_t arm_sctlr(CPUARMState *env, int el)
- {
--    if (arm_aa32_secure_pl1_0(env)) {
--        /* In Secure PL1&0 SCTLR_S is always controlling */
--        el = 3;
--    } else if (el == 0) {
--        /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-+    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-+    if (el == 0) {
-         ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-         el = mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1;
-     }
-@@ -12523,12 +12522,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
-     return 0;
- }
- 
--/*
-- * Return the exception level we're running at if this is our mmu_idx.
-- * s_pl1_0 should be true if this is the AArch32 Secure PL1&0 translation
-- * regime.
-- */
--int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx, bool s_pl1_0)
-+/* Return the exception level we're running at if this is our mmu_idx */
-+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
- {
-     if (mmu_idx & ARM_MMU_IDX_M) {
-         return mmu_idx & ARM_MMU_IDX_M_PRIV;
-@@ -12540,7 +12535,7 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx, bool s_pl1_0)
-         return 0;
-     case ARMMMUIdx_E10_1:
-     case ARMMMUIdx_E10_1_PAN:
--        return s_pl1_0 ? 3 : 1;
-+        return 1;
-     case ARMMMUIdx_E2:
-     case ARMMMUIdx_E20_2:
-     case ARMMMUIdx_E20_2_PAN:
-@@ -12578,15 +12573,6 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
-             idx = ARMMMUIdx_E10_0;
-         }
-         break;
--    case 3:
--        /*
--         * AArch64 EL3 has its own translation regime; AArch32 EL3
--         * uses the Secure PL1&0 translation regime.
--         */
--        if (arm_el_is_aa64(env, 3)) {
--            return ARMMMUIdx_E3;
--        }
--        /* fall through */
-     case 1:
-         if (arm_pan_enabled(env)) {
-             idx = ARMMMUIdx_E10_1_PAN;
-@@ -12606,6 +12592,8 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
-             idx = ARMMMUIdx_E2;
-         }
-         break;
-+    case 3:
-+        return ARMMMUIdx_E3;
-     default:
-         g_assert_not_reached();
-     }
-diff --git a/target/arm/internals.h b/target/arm/internals.h
-index 38545552d0..47624318c2 100644
---- a/target/arm/internals.h
-+++ b/target/arm/internals.h
-@@ -275,20 +275,6 @@ FIELD(CNTHCTL, CNTPMASK, 19, 1)
- #define M_FAKE_FSR_NSC_EXEC 0xf /* NS executing in S&NSC memory */
- #define M_FAKE_FSR_SFAULT 0xe /* SecureFault INVTRAN, INVEP or AUVIOL */
- 
--/**
-- * arm_aa32_secure_pl1_0(): Return true if in Secure PL1&0 regime
-- *
-- * Return true if the CPU is in the Secure PL1&0 translation regime.
-- * This requires that EL3 exists and is AArch32 and we are currently
-- * Secure. If this is the case then the ARMMMUIdx_E10* apply and
-- * mean we are in EL3, not EL1.
-- */
--static inline bool arm_aa32_secure_pl1_0(CPUARMState *env)
--{
--    return arm_feature(env, ARM_FEATURE_EL3) &&
--        !arm_el_is_aa64(env, 3) && arm_is_secure(env);
--}
--
- /**
-  * raise_exception: Raise the specified exception.
-  * Raise a guest exception with the specified value, syndrome register
-@@ -822,12 +808,7 @@ static inline ARMMMUIdx core_to_aa64_mmu_idx(int mmu_idx)
-     return mmu_idx | ARM_MMU_IDX_A;
- }
- 
--/**
-- * Return the exception level we're running at if our current MMU index
-- * is @mmu_idx. @s_pl1_0 should be true if this is the AArch32
-- * Secure PL1&0 translation regime.
-- */
--int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx, bool s_pl1_0);
-+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
- 
- /* Return the MMU index for a v7M CPU in the specified security state */
- ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
-@@ -922,11 +903,11 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-         return 3;
-     case ARMMMUIdx_E10_0:
-     case ARMMMUIdx_Stage1_E0:
--    case ARMMMUIdx_E10_1:
--    case ARMMMUIdx_E10_1_PAN:
-+        return arm_el_is_aa64(env, 3) || !arm_is_secure_below_el3(env) ? 1 : 3;
-     case ARMMMUIdx_Stage1_E1:
-     case ARMMMUIdx_Stage1_E1_PAN:
--        return arm_el_is_aa64(env, 3) || !arm_is_secure_below_el3(env) ? 1 : 3;
-+    case ARMMMUIdx_E10_1:
-+    case ARMMMUIdx_E10_1_PAN:
-     case ARMMMUIdx_MPrivNegPri:
-     case ARMMMUIdx_MUserNegPri:
-     case ARMMMUIdx_MPriv:
-diff --git a/target/arm/ptw.c b/target/arm/ptw.c
-index 26e670290f..20ab736793 100644
---- a/target/arm/ptw.c
-+++ b/target/arm/ptw.c
-@@ -3576,11 +3576,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
-     case ARMMMUIdx_Stage1_E1:
-     case ARMMMUIdx_Stage1_E1_PAN:
-     case ARMMMUIdx_E2:
--        if (arm_aa32_secure_pl1_0(env)) {
--            ss = ARMSS_Secure;
--        } else {
--            ss = arm_security_space_below_el3(env);
--        }
-+        ss = arm_security_space_below_el3(env);
-         break;
-     case ARMMMUIdx_Stage2:
-         /*
-diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
-index bab7822ef6..f03977b4b0 100644
---- a/target/arm/tcg/hflags.c
-+++ b/target/arm/tcg/hflags.c
-@@ -198,10 +198,6 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
-         DP_TBFLAG_A32(flags, SME_TRAP_NONSTREAMING, 1);
-     }
- 
--    if (arm_aa32_secure_pl1_0(env)) {
--        DP_TBFLAG_A32(flags, S_PL1_0, 1);
--    }
--
-     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
- }
- 
-diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
-index 4684e7eb6e..bc2d64e883 100644
---- a/target/arm/tcg/translate-a64.c
-+++ b/target/arm/tcg/translate-a64.c
-@@ -11979,7 +11979,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
-     dc->tbii = EX_TBFLAG_A64(tb_flags, TBII);
-     dc->tbid = EX_TBFLAG_A64(tb_flags, TBID);
-     dc->tcma = EX_TBFLAG_A64(tb_flags, TCMA);
--    dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx, false);
-+    dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
- #if !defined(CONFIG_USER_ONLY)
-     dc->user = (dc->current_el == 0);
- #endif
-diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
-index e2748ff2bb..c5bc691d92 100644
---- a/target/arm/tcg/translate.c
-+++ b/target/arm/tcg/translate.c
-@@ -7546,6 +7546,10 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
- 
-     core_mmu_idx = EX_TBFLAG_ANY(tb_flags, MMUIDX);
-     dc->mmu_idx = core_to_arm_mmu_idx(env, core_mmu_idx);
-+    dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
-+#if !defined(CONFIG_USER_ONLY)
-+    dc->user = (dc->current_el == 0);
-+#endif
-     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
-     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
-     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
-@@ -7576,12 +7580,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-         }
-         dc->sme_trap_nonstreaming =
-             EX_TBFLAG_A32(tb_flags, SME_TRAP_NONSTREAMING);
--        dc->s_pl1_0 = EX_TBFLAG_A32(tb_flags, S_PL1_0);
-     }
--    dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx, dc->s_pl1_0);
--#if !defined(CONFIG_USER_ONLY)
--    dc->user = (dc->current_el == 0);
--#endif
-     dc->lse2 = false; /* applies only to aarch64 */
-     dc->cp_regs = cpu->cp_regs;
-     dc->features = env->features;
-diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
-index 3f0e9ceaa3..01c217f4a4 100644
---- a/target/arm/tcg/translate.h
-+++ b/target/arm/tcg/translate.h
-@@ -165,8 +165,6 @@ typedef struct DisasContext {
-     uint8_t gm_blocksize;
-     /* True if the current insn_start has been updated. */
-     bool insn_start_updated;
--    /* True if this is the AArch32 Secure PL1&0 translation regime */
--    bool s_pl1_0;
-     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
-     int c15_cpar;
-     /* Offset from VNCR_EL2 when FEAT_NV2 redirects this reg to memory */
--- 
-2.45.0
-
diff --git a/package/qemu/0003-target-arm-Add-new-MMU-indexes-for-AArch32-Secure-PL.patch b/package/qemu/0003-target-arm-Add-new-MMU-indexes-for-AArch32-Secure-PL.patch
deleted file mode 100644
index 5fec180ea1..0000000000
--- a/package/qemu/0003-target-arm-Add-new-MMU-indexes-for-AArch32-Secure-PL.patch
+++ /dev/null
@@ -1,380 +0,0 @@
-From 92e9bf227bab81becb9115c6bf0cdd0458c1f870 Mon Sep 17 00:00:00 2001
-From: Peter Maydell <peter.maydell@linaro.org>
-Date: Fri, 1 Nov 2024 14:28:45 +0000
-Subject: [PATCH] target/arm: Add new MMU indexes for AArch32 Secure PL1&0
-
-Our current usage of MMU indexes when EL3 is AArch32 is confused.
-Architecturally, when EL3 is AArch32, all Secure code runs under the
-Secure PL1&0 translation regime:
- * code at EL3, which might be Mon, or SVC, or any of the
-   other privileged modes (PL1)
- * code at EL0 (Secure PL0)
-
-This is different from when EL3 is AArch64, in which case EL3 is its
-own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
-have their own regime.
-
-We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
-do anything special about Secure PL0, which meant it used the same
-ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
-where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
-controlling register when in Secure PL0, which meant we were
-spuriously generating alignment faults because we were looking at the
-wrong SCTLR control bits.
-
-The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
-we wouldn't honour the PAN bit for Secure PL1, because there's no
-equivalent _PAN mmu index for it.
-
-Fix this by adding two new MMU indexes:
- * ARMMMUIdx_E30_0 is for Secure PL0
- * ARMMMUIdx_E30_3_PAN is for Secure PL1 when PAN is enabled
-The existing ARMMMUIdx_E3 is used to mean "Secure PL1 without PAN"
-(and would be named ARMMMUIdx_E30_3 in an AArch32-centric scheme).
-
-These extra two indexes bring us up to the maximum of 16 that the
-core code can currently support.
-
-This commit:
- * adds the new MMU index handling to the various places
-   where we deal in MMU index values
- * adds assertions that we aren't AArch32 EL3 in a couple of
-   places that currently use the E10 indexes, to document why
-   they don't also need to handle the E30 indexes
- * documents in a comment why regime_has_2_ranges() doesn't need
-   updating
-
-Notes for backporting: this commit depends on the preceding revert of
-4c2c04746932; that revert and this commit should probably be
-backported to everywhere that we originally backported 4c2c04746932.
-
-Cc: qemu-stable@nongnu.org
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2326
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-Upstream-Status: Pending
-Upstream: https://patchew.org/QEMU/20241101142845.1712482-1-peter.maydell@linaro.org
-See: https://gitlab.com/qemu-project/qemu/-/issues/2588#note_2189338512
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- target/arm/cpu.h           | 31 ++++++++++++++++++-------------
- target/arm/helper.c        | 38 ++++++++++++++++++++++++++++++++++----
- target/arm/internals.h     | 16 ++++++++++++++--
- target/arm/ptw.c           |  4 ++++
- target/arm/tcg/op_helper.c | 14 +++++++++++++-
- target/arm/tcg/translate.c |  3 +++
- 6 files changed, 86 insertions(+), 20 deletions(-)
-
-diff --git a/target/arm/cpu.h b/target/arm/cpu.h
-index 216774f5d3..28fac238a5 100644
---- a/target/arm/cpu.h
-+++ b/target/arm/cpu.h
-@@ -2784,8 +2784,7 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
-  *  + NonSecure PL1 & 0 stage 1
-  *  + NonSecure PL1 & 0 stage 2
-  *  + NonSecure PL2
-- *  + Secure PL0
-- *  + Secure PL1
-+ *  + Secure PL1 & 0
-  * (reminder: for 32 bit EL3, Secure PL1 is *EL3*, not EL1.)
-  *
-  * For QEMU, an mmu_idx is not quite the same as a translation regime because:
-@@ -2820,19 +2819,21 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
-  *
-  * This gives us the following list of cases:
-  *
-- * EL0 EL1&0 stage 1+2 (aka NS PL0)
-- * EL1 EL1&0 stage 1+2 (aka NS PL1)
-- * EL1 EL1&0 stage 1+2 +PAN
-+ * EL0 EL1&0 stage 1+2 (aka NS PL0 PL1&0 stage 1+2)
-+ * EL1 EL1&0 stage 1+2 (aka NS PL1 PL1&0 stage 1+2)
-+ * EL1 EL1&0 stage 1+2 +PAN (aka NS PL1 P1&0 stage 1+2 +PAN)
-  * EL0 EL2&0
-  * EL2 EL2&0
-  * EL2 EL2&0 +PAN
-  * EL2 (aka NS PL2)
-- * EL3 (aka S PL1)
-+ * EL3 (aka AArch32 S PL1 PL1&0)
-+ * AArch32 S PL0 PL1&0 (we call this EL30_0)
-+ * AArch32 S PL1 PL1&0 +PAN (we call this EL30_3_PAN)
-  * Stage2 Secure
-  * Stage2 NonSecure
-  * plus one TLB per Physical address space: S, NS, Realm, Root
-  *
-- * for a total of 14 different mmu_idx.
-+ * for a total of 16 different mmu_idx.
-  *
-  * R profile CPUs have an MPU, but can use the same set of MMU indexes
-  * as A profile. They only need to distinguish EL0 and EL1 (and
-@@ -2896,6 +2897,8 @@ typedef enum ARMMMUIdx {
-     ARMMMUIdx_E20_2_PAN = 5 | ARM_MMU_IDX_A,
-     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
-     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_E30_0     = 8 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_E30_3_PAN = 9 | ARM_MMU_IDX_A,
- 
-     /*
-      * Used for second stage of an S12 page table walk, or for descriptor
-@@ -2903,14 +2906,14 @@ typedef enum ARMMMUIdx {
-      * are in use simultaneously for SecureEL2: the security state for
-      * the S2 ptw is selected by the NS bit from the S1 ptw.
-      */
--    ARMMMUIdx_Stage2_S  = 8 | ARM_MMU_IDX_A,
--    ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_Stage2_S  = 10 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_Stage2    = 11 | ARM_MMU_IDX_A,
- 
-     /* TLBs with 1-1 mapping to the physical address spaces. */
--    ARMMMUIdx_Phys_S     = 10 | ARM_MMU_IDX_A,
--    ARMMMUIdx_Phys_NS    = 11 | ARM_MMU_IDX_A,
--    ARMMMUIdx_Phys_Root  = 12 | ARM_MMU_IDX_A,
--    ARMMMUIdx_Phys_Realm = 13 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_Phys_S     = 12 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_Phys_NS    = 13 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_Phys_Root  = 14 | ARM_MMU_IDX_A,
-+    ARMMMUIdx_Phys_Realm = 15 | ARM_MMU_IDX_A,
- 
-     /*
-      * These are not allocated TLBs and are used only for AT system
-@@ -2949,6 +2952,8 @@ typedef enum ARMMMUIdxBit {
-     TO_CORE_BIT(E20_2),
-     TO_CORE_BIT(E20_2_PAN),
-     TO_CORE_BIT(E3),
-+    TO_CORE_BIT(E30_0),
-+    TO_CORE_BIT(E30_3_PAN),
-     TO_CORE_BIT(Stage2),
-     TO_CORE_BIT(Stage2_S),
- 
-diff --git a/target/arm/helper.c b/target/arm/helper.c
-index 8fb4b474e8..2b6d0bff8c 100644
---- a/target/arm/helper.c
-+++ b/target/arm/helper.c
-@@ -444,6 +444,9 @@ static int alle1_tlbmask(CPUARMState *env)
-      * Note that the 'ALL' scope must invalidate both stage 1 and
-      * stage 2 translations, whereas most other scopes only invalidate
-      * stage 1 translations.
-+     *
-+     * For AArch32 this is only used for TLBIALLNSNH and VTTBR
-+     * writes, so only needs to apply to NS PL1&0, not S PL1&0.
-      */
-     return (ARMMMUIdxBit_E10_1 |
-             ARMMMUIdxBit_E10_1_PAN |
-@@ -3775,7 +3778,11 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
-         /* stage 1 current state PL1: ATS1CPR, ATS1CPW, ATS1CPRP, ATS1CPWP */
-         switch (el) {
-         case 3:
--            mmu_idx = ARMMMUIdx_E3;
-+            if (ri->crm == 9 && arm_pan_enabled(env)) {
-+                mmu_idx = ARMMMUIdx_E30_3_PAN;
-+            } else {
-+                mmu_idx = ARMMMUIdx_E3;
-+            }
-             break;
-         case 2:
-             g_assert(ss != ARMSS_Secure);  /* ARMv8.4-SecEL2 is 64-bit only */
-@@ -3795,7 +3802,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
-         /* stage 1 current state PL0: ATS1CUR, ATS1CUW */
-         switch (el) {
-         case 3:
--            mmu_idx = ARMMMUIdx_E10_0;
-+            mmu_idx = ARMMMUIdx_E30_0;
-             break;
-         case 2:
-             g_assert(ss != ARMSS_Secure);  /* ARMv8.4-SecEL2 is 64-bit only */
-@@ -4905,11 +4912,14 @@ static int vae1_tlbmask(CPUARMState *env)
-     uint64_t hcr = arm_hcr_el2_eff(env);
-     uint16_t mask;
- 
-+    assert(arm_feature(env, ARM_FEATURE_AARCH64));
-+
-     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-         mask = ARMMMUIdxBit_E20_2 |
-                ARMMMUIdxBit_E20_2_PAN |
-                ARMMMUIdxBit_E20_0;
-     } else {
-+        /* This is AArch64 only, so we don't need to touch the EL30_x TLBs */
-         mask = ARMMMUIdxBit_E10_1 |
-                ARMMMUIdxBit_E10_1_PAN |
-                ARMMMUIdxBit_E10_0;
-@@ -4948,6 +4958,8 @@ static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
-     uint64_t hcr = arm_hcr_el2_eff(env);
-     ARMMMUIdx mmu_idx;
- 
-+    assert(arm_feature(env, ARM_FEATURE_AARCH64));
-+
-     /* Only the regime of the mmu_idx below is significant. */
-     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-         mmu_idx = ARMMMUIdx_E20_0;
-@@ -11861,10 +11873,20 @@ void arm_cpu_do_interrupt(CPUState *cs)
- 
- uint64_t arm_sctlr(CPUARMState *env, int el)
- {
--    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-+    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0 or EL3&0 */
-     if (el == 0) {
-         ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
--        el = mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1;
-+        switch (mmu_idx) {
-+        case ARMMMUIdx_E20_0:
-+            el = 2;
-+            break;
-+        case ARMMMUIdx_E30_0:
-+            el = 3;
-+            break;
-+        default:
-+            el = 1;
-+            break;
-+        }
-     }
-     return env->cp15.sctlr_el[el];
- }
-@@ -12532,6 +12554,7 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-     switch (mmu_idx) {
-     case ARMMMUIdx_E10_0:
-     case ARMMMUIdx_E20_0:
-+    case ARMMMUIdx_E30_0:
-         return 0;
-     case ARMMMUIdx_E10_1:
-     case ARMMMUIdx_E10_1_PAN:
-@@ -12541,6 +12564,7 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-     case ARMMMUIdx_E20_2_PAN:
-         return 2;
-     case ARMMMUIdx_E3:
-+    case ARMMMUIdx_E30_3_PAN:
-         return 3;
-     default:
-         g_assert_not_reached();
-@@ -12569,6 +12593,9 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
-         hcr = arm_hcr_el2_eff(env);
-         if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-             idx = ARMMMUIdx_E20_0;
-+        } else if (arm_is_secure_below_el3(env) &&
-+                   !arm_el_is_aa64(env, 3)) {
-+            idx = ARMMMUIdx_E30_0;
-         } else {
-             idx = ARMMMUIdx_E10_0;
-         }
-@@ -12593,6 +12620,9 @@ ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
-         }
-         break;
-     case 3:
-+        if (!arm_el_is_aa64(env, 3) && arm_pan_enabled(env)) {
-+            return ARMMMUIdx_E30_3_PAN;
-+        }
-         return ARMMMUIdx_E3;
-     default:
-         g_assert_not_reached();
-diff --git a/target/arm/internals.h b/target/arm/internals.h
-index 47624318c2..a3fa6e91d5 100644
---- a/target/arm/internals.h
-+++ b/target/arm/internals.h
-@@ -852,7 +852,16 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
-     }
- }
- 
--/* Return true if this address translation regime has two ranges.  */
-+/*
-+ * Return true if this address translation regime has two ranges.
-+ * Note that this will not return the correct answer for AArch32
-+ * Secure PL1&0 (i.e. mmu indexes E3, E30_0, E30_3_PAN), but it is
-+ * never called from a context where EL3 can be AArch32. (The
-+ * correct return value for ARMMMUIdx_E3 would be different for
-+ * that case, so we can't just make the function return the
-+ * correct value anyway; we would need an extra "bool e3_is_aarch32"
-+ * argument which all the current callsites would pass as 'false'.)
-+ */
- static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
- {
-     switch (mmu_idx) {
-@@ -877,6 +886,7 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
-     case ARMMMUIdx_Stage1_E1_PAN:
-     case ARMMMUIdx_E10_1_PAN:
-     case ARMMMUIdx_E20_2_PAN:
-+    case ARMMMUIdx_E30_3_PAN:
-         return true;
-     default:
-         return false;
-@@ -900,10 +910,11 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-     case ARMMMUIdx_E2:
-         return 2;
-     case ARMMMUIdx_E3:
-+    case ARMMMUIdx_E30_0:
-+    case ARMMMUIdx_E30_3_PAN:
-         return 3;
-     case ARMMMUIdx_E10_0:
-     case ARMMMUIdx_Stage1_E0:
--        return arm_el_is_aa64(env, 3) || !arm_is_secure_below_el3(env) ? 1 : 3;
-     case ARMMMUIdx_Stage1_E1:
-     case ARMMMUIdx_Stage1_E1_PAN:
-     case ARMMMUIdx_E10_1:
-@@ -926,6 +937,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
- {
-     switch (mmu_idx) {
-     case ARMMMUIdx_E20_0:
-+    case ARMMMUIdx_E30_0:
-     case ARMMMUIdx_Stage1_E0:
-     case ARMMMUIdx_MUser:
-     case ARMMMUIdx_MSUser:
-diff --git a/target/arm/ptw.c b/target/arm/ptw.c
-index 20ab736793..65d7b07bc5 100644
---- a/target/arm/ptw.c
-+++ b/target/arm/ptw.c
-@@ -265,6 +265,8 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
-     case ARMMMUIdx_E20_2_PAN:
-     case ARMMMUIdx_E2:
-     case ARMMMUIdx_E3:
-+    case ARMMMUIdx_E30_0:
-+    case ARMMMUIdx_E30_3_PAN:
-         break;
- 
-     case ARMMMUIdx_Phys_S:
-@@ -3604,6 +3606,8 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
-         ss = ARMSS_Secure;
-         break;
-     case ARMMMUIdx_E3:
-+    case ARMMMUIdx_E30_0:
-+    case ARMMMUIdx_E30_3_PAN:
-         if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-             cpu_isar_feature(aa64_rme, env_archcpu(env))) {
-             ss = ARMSS_Root;
-diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
-index c083e5cfb8..1ecb465988 100644
---- a/target/arm/tcg/op_helper.c
-+++ b/target/arm/tcg/op_helper.c
-@@ -912,7 +912,19 @@ void HELPER(tidcp_el0)(CPUARMState *env, uint32_t syndrome)
- {
-     /* See arm_sctlr(), but we also need the sctlr el. */
-     ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
--    int target_el = mmu_idx == ARMMMUIdx_E20_0 ? 2 : 1;
-+    int target_el;
-+
-+    switch (mmu_idx) {
-+    case ARMMMUIdx_E20_0:
-+        target_el = 2;
-+        break;
-+    case ARMMMUIdx_E30_0:
-+        target_el = 3;
-+        break;
-+    default:
-+        target_el = 1;
-+        break;
-+    }
- 
-     /*
-      * The bit is not valid unless the target el is aa64, but since the
-diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
-index c5bc691d92..9ee761fc64 100644
---- a/target/arm/tcg/translate.c
-+++ b/target/arm/tcg/translate.c
-@@ -228,6 +228,9 @@ static inline int get_a32_user_mem_index(DisasContext *s)
-      */
-     switch (s->mmu_idx) {
-     case ARMMMUIdx_E3:
-+    case ARMMMUIdx_E30_0:
-+    case ARMMMUIdx_E30_3_PAN:
-+        return arm_to_core_mmu_idx(ARMMMUIdx_E30_0);
-     case ARMMMUIdx_E2:        /* this one is UNPREDICTABLE */
-     case ARMMMUIdx_E10_0:
-     case ARMMMUIdx_E10_1:
--- 
-2.45.0
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 169fe05068..9be69ffbbc 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834  qemu-9.1.0.tar.xz
+sha256  f859f0bc65e1f533d040bbe8c92bcfecee5af2c921a6687c652fb44d089bd894  qemu-9.2.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 76394b3e77..2fd2e6767b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 9.1.0
+QEMU_VERSION = 9.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
@@ -288,6 +288,7 @@ define QEMU_CONFIGURE_CMDS
 			--python=$(HOST_DIR)/bin/python3 \
 			--ninja=$(HOST_DIR)/bin/ninja \
 			--disable-alsa \
+			--disable-asan \
 			--disable-bpf \
 			--disable-brlapi \
 			--disable-bsd-user \
@@ -314,10 +315,10 @@ define QEMU_CONFIGURE_CMDS
 			--disable-pa \
 			--disable-plugins \
 			--disable-rbd \
-			--disable-sanitizers \
 			--disable-selinux \
 			--disable-sparse \
 			--disable-strip \
+			--disable-ubsan \
 			--disable-vde \
 			--disable-vhost-crypto \
 			--disable-vhost-user-blk-server \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
