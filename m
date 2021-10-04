Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7D1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:43:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4506961425
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4506961425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFE283C3C;
	Mon,  4 Oct 2021 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_jtrsJMdaha; Mon,  4 Oct 2021 21:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D53183C47;
	Mon,  4 Oct 2021 21:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38B871BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27F6C83C47
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idl6jfQLOvbN for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:42:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B55283613
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:42:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 76A738F29F; Mon,  4 Oct 2021 21:40:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 23:40:52 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: cf949134b7371e23c4a8b44fc8b1d646628dfbce
X-Git-Newrev: 6549ee7aa37feeb9e7f06665e7352053815bf5ef
X-Patchwork-Hint: ignore
Message-Id: <20211004214004.76A738F29F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/wpewebkit:
 security bump to version 2.32.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6549ee7aa37feeb9e7f06665e7352053815bf5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

This is a minor release which provides fixes for CVE-2021-30858 and
a number of other potential security issues without an associated CVE.
Patch "0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch"
is deleted as it has been included in this release.

Full release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.32.4.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2021-0005.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5d062fdbe827882d1cab90a2c0208ed451bf5d96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-stp-support-for-FP-registers-plus-some-b.patch | 382 ---------------------
 package/wpewebkit/wpewebkit.hash                   |   9 +-
 package/wpewebkit/wpewebkit.mk                     |   2 +-
 3 files changed, 5 insertions(+), 388 deletions(-)

diff --git a/package/wpewebkit/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch b/package/wpewebkit/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch
deleted file mode 100644
index c8b8501bdb..0000000000
--- a/package/wpewebkit/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From 05f6ba814422a392d59037ebe4412168da0e44db Mon Sep 17 00:00:00 2001
-From: Mark Lam <mark.lam@apple.com>
-Date: Tue, 15 Jun 2021 01:04:01 +0000
-Subject: [PATCH] Add ldp and stp support for FP registers, plus some bug
- fixes. https://bugs.webkit.org/show_bug.cgi?id=226998 rdar://79313717
-
-Reviewed by Robin Morisset.
-
-This patch does the following:
-1. Add ldp and stp support for FP registers.
-   This simply entails providing wrappers that take FPRegisterID and passing true
-   for the V bit to the underlying loadStoreRegisterPairXXX encoding function.
-   V is for vector (aka floating point).  This will cause bit 26 in the instruction
-   to be set indicating that it's loading / storing floating point registers.
-
-2. Add ARM64 disassembler support ldp and stp for FP registers.
-   This includes fixing A64DOpcodeLoadStoreRegisterPair::mask to not exclude the
-   FP versions of the instructions.
-
-3. Add ARM64Assembler query methods for determining if an immediate is encodable
-   as the signed 12 bit immediate of ldp and stp instructions.
-
-4. Fix ldp and stp offset form to take an int instead of an unsigned.  The
-   immediate it takes is a 12-bit signed int, not unsigned.
-
-5. In loadStoreRegisterPairXXX encoding functions used by the forms of ldp and stp,
-   RELEASE_ASSERT that the passed in immediate is encodable.  Unlike ldur / stur,
-   there is no form of ldp / stp that takes the offset in a register that can be
-   used as a fail over.  Hence, if the immediate is not encodable, this is a
-   non-recoverable event.  The client is responsible for ensuring that the offset
-   is encodable.
-
-6. Added some testmasm tests for testing the offset form (as opposed to PreIndex
-   and PostIndex forms) of ldp and stp.  We currently only use the offset form
-   in our JITs.
-
-* assembler/ARM64Assembler.h:
-(JSC::ARM64Assembler::isValidLDPImm):
-(JSC::ARM64Assembler::isValidLDPFPImm):
-(JSC::ARM64Assembler::ldp):
-(JSC::ARM64Assembler::ldnp):
-(JSC::ARM64Assembler::isValidSTPImm):
-(JSC::ARM64Assembler::isValidSTPFPImm):
-(JSC::ARM64Assembler::stp):
-(JSC::ARM64Assembler::stnp):
-(JSC::ARM64Assembler::loadStoreRegisterPairPostIndex):
-(JSC::ARM64Assembler::loadStoreRegisterPairPreIndex):
-(JSC::ARM64Assembler::loadStoreRegisterPairOffset):
-(JSC::ARM64Assembler::loadStoreRegisterPairNonTemporal):
-* assembler/AssemblerCommon.h:
-(JSC::isValidSignedImm7):
-* assembler/MacroAssemblerARM64.h:
-(JSC::MacroAssemblerARM64::loadPair64):
-(JSC::MacroAssemblerARM64::storePair64):
-* assembler/testmasm.cpp:
-(JSC::testLoadStorePair64Int64):
-(JSC::testLoadStorePair64Double):
-* disassembler/ARM64/A64DOpcode.cpp:
-(JSC::ARM64Disassembler::A64DOpcodeLoadStoreRegisterPair::format):
-* disassembler/ARM64/A64DOpcode.h:
-
-
-
-Canonical link: https://commits.webkit.org/238801@main
-git-svn-id: https://svn.webkit.org/repository/webkit/trunk@278856 268f45cc-cd09-0410-ab3c-d52691b4dbfc
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-05f6ba814422a392d59037ebe4412168da0e44db]
----
- Source/JavaScriptCore/ChangeLog               |  61 +++
- .../JavaScriptCore/assembler/ARM64Assembler.h | 104 ++++-
- .../assembler/AssemblerCommon.h               |  11 +-
- .../assembler/MacroAssemblerARM64.h           |  20 +
- Source/JavaScriptCore/assembler/testmasm.cpp  | 437 ++++++++++++++++++
- .../disassembler/ARM64/A64DOpcode.cpp         |   8 +-
- .../disassembler/ARM64/A64DOpcode.h           |   4 +-
- 7 files changed, 630 insertions(+), 15 deletions(-)
-
-diff --git a/Source/JavaScriptCore/assembler/ARM64Assembler.h b/Source/JavaScriptCore/assembler/ARM64Assembler.h
-index 2cc53c8ccda5..758cbe402779 100644
---- a/Source/JavaScriptCore/assembler/ARM64Assembler.h
-+++ b/Source/JavaScriptCore/assembler/ARM64Assembler.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2012-2020 Apple Inc. All rights reserved.
-+ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
-  *
-  * Redistribution and use in source and binary forms, with or without
-  * modification, are permitted provided that the following conditions
-@@ -1114,6 +1114,20 @@ public:
-         insn(0x0);
-     }
- 
-+    template<int datasize>
-+    ALWAYS_INLINE static bool isValidLDPImm(int immediate)
-+    {
-+        unsigned immedShiftAmount = memPairOffsetShift(false, MEMPAIROPSIZE_INT(datasize));
-+        return isValidSignedImm7(immediate, immedShiftAmount);
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE static bool isValidLDPFPImm(int immediate)
-+    {
-+        unsigned immedShiftAmount = memPairOffsetShift(true, MEMPAIROPSIZE_FP(datasize));
-+        return isValidSignedImm7(immediate, immedShiftAmount);
-+    }
-+
-     template<int datasize>
-     ALWAYS_INLINE void ldp(RegisterID rt, RegisterID rt2, RegisterID rn, PairPostIndex simm)
-     {
-@@ -1129,17 +1143,45 @@ public:
-     }
- 
-     template<int datasize>
--    ALWAYS_INLINE void ldp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
-+    ALWAYS_INLINE void ldp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void ldnp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void ldp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPostIndex simm)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairPostIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void ldp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPreIndex simm)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairPreIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void ldp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
-     {
-         CHECK_DATASIZE();
--        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, pimm, rn, rt, rt2));
-+        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
-     }
- 
-     template<int datasize>
--    ALWAYS_INLINE void ldnp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
-+    ALWAYS_INLINE void ldnp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
-     {
-         CHECK_DATASIZE();
--        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, pimm, rn, rt, rt2));
-+        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
-     }
- 
-     template<int datasize>
-@@ -1743,6 +1785,18 @@ public:
-         smaddl(rd, rn, rm, ARM64Registers::zr);
-     }
- 
-+    template<int datasize>
-+    ALWAYS_INLINE static bool isValidSTPImm(int immediate)
-+    {
-+        return isValidLDPImm<datasize>(immediate);
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE static bool isValidSTPFPImm(int immediate)
-+    {
-+        return isValidLDPFPImm<datasize>(immediate);
-+    }
-+
-     template<int datasize>
-     ALWAYS_INLINE void stp(RegisterID rt, RegisterID rt2, RegisterID rn, PairPostIndex simm)
-     {
-@@ -1758,17 +1812,45 @@ public:
-     }
- 
-     template<int datasize>
--    ALWAYS_INLINE void stp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
-+    ALWAYS_INLINE void stp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void stnp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void stp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPostIndex simm)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairPostIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void stp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPreIndex simm)
-+    {
-+        CHECK_DATASIZE();
-+        insn(loadStoreRegisterPairPreIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
-+    }
-+
-+    template<int datasize>
-+    ALWAYS_INLINE void stp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
-     {
-         CHECK_DATASIZE();
--        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, pimm, rn, rt, rt2));
-+        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
-     }
- 
-     template<int datasize>
--    ALWAYS_INLINE void stnp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
-+    ALWAYS_INLINE void stnp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
-     {
-         CHECK_DATASIZE();
--        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, pimm, rn, rt, rt2));
-+        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
-     }
- 
-     template<int datasize>
-@@ -3544,6 +3626,7 @@ protected:
-         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
-         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
-         unsigned immedShiftAmount = memPairOffsetShift(V, size);
-+        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
-         int imm7 = immediate >> immedShiftAmount;
-         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
-         return (0x28800000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
-@@ -3575,6 +3658,7 @@ protected:
-         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
-         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
-         unsigned immedShiftAmount = memPairOffsetShift(V, size);
-+        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
-         int imm7 = immediate >> immedShiftAmount;
-         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
-         return (0x29800000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
-@@ -3592,6 +3676,7 @@ protected:
-         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
-         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
-         unsigned immedShiftAmount = memPairOffsetShift(V, size);
-+        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
-         int imm7 = immediate >> immedShiftAmount;
-         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
-         return (0x29000000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
-@@ -3609,6 +3694,7 @@ protected:
-         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
-         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
-         unsigned immedShiftAmount = memPairOffsetShift(V, size);
-+        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
-         int imm7 = immediate >> immedShiftAmount;
-         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
-         return (0x28000000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
-diff --git a/Source/JavaScriptCore/assembler/AssemblerCommon.h b/Source/JavaScriptCore/assembler/AssemblerCommon.h
-index a594823d6a4d..2e50ffdbc82a 100644
---- a/Source/JavaScriptCore/assembler/AssemblerCommon.h
-+++ b/Source/JavaScriptCore/assembler/AssemblerCommon.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2012-2019 Apple Inc. All rights reserved.
-+ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
-  *
-  * Redistribution and use in source and binary forms, with or without
-  * modification, are permitted provided that the following conditions
-@@ -74,6 +74,15 @@ ALWAYS_INLINE bool isValidSignedImm9(int32_t value)
-     return isInt9(value);
- }
- 
-+ALWAYS_INLINE bool isValidSignedImm7(int32_t value, int alignmentShiftAmount)
-+{
-+    constexpr int32_t disallowedHighBits = 32 - 7;
-+    int32_t shiftedValue = value >> alignmentShiftAmount;
-+    bool fitsIn7Bits = shiftedValue == ((shiftedValue << disallowedHighBits) >> disallowedHighBits);
-+    bool hasCorrectAlignment = value == (shiftedValue << alignmentShiftAmount);
-+    return fitsIn7Bits && hasCorrectAlignment;
-+}
-+
- class ARM64LogicalImmediate {
- public:
-     static ARM64LogicalImmediate create32(uint32_t value)
-diff --git a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h
-index f86aec1c5400..14e477fde3b8 100644
---- a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h
-+++ b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h
-@@ -1244,6 +1244,16 @@ public:
-         m_assembler.ldnp<64>(dest1, dest2, src, offset.m_value);
-     }
- 
-+    void loadPair64(RegisterID src, FPRegisterID dest1, FPRegisterID dest2)
-+    {
-+        loadPair64(src, TrustedImm32(0), dest1, dest2);
-+    }
-+
-+    void loadPair64(RegisterID src, TrustedImm32 offset, FPRegisterID dest1, FPRegisterID dest2)
-+    {
-+        m_assembler.ldp<64>(dest1, dest2, src, offset.m_value);
-+    }
-+
-     void abortWithReason(AbortReason reason)
-     {
-         // It is safe to use dataTempRegister directly since this is a crashing JIT Assert.
-@@ -1568,6 +1578,16 @@ public:
-         m_assembler.stnp<64>(src1, src2, dest, offset.m_value);
-     }
- 
-+    void storePair64(FPRegisterID src1, FPRegisterID src2, RegisterID dest)
-+    {
-+        storePair64(src1, src2, dest, TrustedImm32(0));
-+    }
-+
-+    void storePair64(FPRegisterID src1, FPRegisterID src2, RegisterID dest, TrustedImm32 offset)
-+    {
-+        m_assembler.stp<64>(src1, src2, dest, offset.m_value);
-+    }
-+
-     void store32(RegisterID src, ImplicitAddress address)
-     {
-         if (tryStoreWithOffset<32>(src, address.base, address.offset))
-diff --git a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp
-index 247c79dcb428..dfe09b671470 100644
---- a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp
-+++ b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2012, 2016 Apple Inc. All rights reserved.
-+ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
-  *
-  * Redistribution and use in source and binary forms, with or without
-  * modification, are permitted provided that the following conditions
-@@ -72,6 +72,8 @@ static const OpcodeGroupInitializer opcodeGroupList[] = {
-     OPCODE_GROUP_ENTRY(0x0a, A64DOpcodeLogicalShiftedRegister),
-     OPCODE_GROUP_ENTRY(0x0b, A64DOpcodeAddSubtractExtendedRegister),
-     OPCODE_GROUP_ENTRY(0x0b, A64DOpcodeAddSubtractShiftedRegister),
-+    OPCODE_GROUP_ENTRY(0x0c, A64DOpcodeLoadStoreRegisterPair),
-+    OPCODE_GROUP_ENTRY(0x0d, A64DOpcodeLoadStoreRegisterPair),
-     OPCODE_GROUP_ENTRY(0x11, A64DOpcodeAddSubtractImmediate),
-     OPCODE_GROUP_ENTRY(0x12, A64DOpcodeMoveWide),
-     OPCODE_GROUP_ENTRY(0x12, A64DOpcodeLogicalImmediate),
-@@ -1363,9 +1365,9 @@ const char* A64DOpcodeLoadStoreRegisterPair::format()
-     appendInstructionName(thisOpName);
-     unsigned offsetShift;
-     if (vBit()) {
--        appendFPRegisterName(rt(), size());
-+        appendFPRegisterName(rt(), size() + 2);
-         appendSeparator();
--        appendFPRegisterName(rt2(), size());
-+        appendFPRegisterName(rt2(), size() + 2);
-         offsetShift = size() + 2;
-     } else {
-         if (!lBit())
-diff --git a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h
-index e071babb8e01..fd9db7cae58e 100644
---- a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h
-+++ b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2012-2019 Apple Inc. All rights reserved.
-+ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
-  *
-  * Redistribution and use in source and binary forms, with or without
-  * modification, are permitted provided that the following conditions
-@@ -787,7 +787,7 @@ public:
- 
- class A64DOpcodeLoadStoreRegisterPair : public A64DOpcodeLoadStore {
- public:
--    static constexpr uint32_t mask = 0x3a000000;
-+    static constexpr uint32_t mask = 0x38000000;
-     static constexpr uint32_t pattern = 0x28000000;
- 
-     DEFINE_STATIC_FORMAT(A64DOpcodeLoadStoreRegisterPair, thisObj);
--- 
-2.25.1
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 39bf8829d0..ff8bd1f30a 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,8 +1,7 @@
-
-# From https://wpewebkit.org/releases/wpewebkit-2.32.3.tar.xz.sums
-md5  1e34412c50fe8d1ff084738477ecad7e  wpewebkit-2.32.3.tar.xz
-sha1  157344d8febfc89d6731404c30857f122f220d6e  wpewebkit-2.32.3.tar.xz
-sha256  859bd1bbe51026aecfb2b6f5c8c024d88fb69ac6fcdc74c788c9fbe9499d740d  wpewebkit-2.32.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.32.4.tar.xz.sums
+md5  94ca1cc3f7b2de8b96c59d6e59cafcd0  wpewebkit-2.32.4.tar.xz
+sha1  19b8ebdbfef193ca50f7625703d871db87624f86  wpewebkit-2.32.4.tar.xz
+sha256  381f1422cbc319db1aa42dda48de39590ed90ac3bec6b81ec83f3f2cae5c3eeb  wpewebkit-2.32.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 01b1309ad6..5c5e6625f8 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.32.3
+WPEWEBKIT_VERSION = 2.32.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
