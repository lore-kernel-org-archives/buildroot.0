Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3030AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:44:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D29760EDF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 18:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D29760EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27358176E;
	Mon, 20 Sep 2021 18:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3uBmPqss4xa; Mon, 20 Sep 2021 18:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A788177A;
	Mon, 20 Sep 2021 18:44:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13FB61BF23C
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 111308176E
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 18:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBp5lzHct4MJ for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 18:43:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C8D980F05
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=drl7aJBA7XPtvyctZs6ta+j4Rm74rY+mbH6l4123pOU=; 
 b=TvbCXGDWIo8o24liYoU14EDt6tI58Y6+TDeH1ynxVazv68Y9HyLibsOEu2sIyKLl9TUqeSCL7QF8LjBXSf3Po9reQ6c75Jj5JOYeu1kUMC/1kvobBPaI82Sk8UsSJ+GsN9AuO6YscAwqDeqYOtlYmsNPS9N88/nqeNOprdhD3lAXGiYQCofL/RjT94NRB0Fw5WCgB4tlJ2tumOCZ+QrDB0LqAqnFXpQBDpZp3Z9g6CflXYUYC9pd1/kq0Xls3J8AjxAYQQQI2M/jJb8NjZnYRID4Xsl63g6YVbATL0y35KOJ9nFMhYcAvt2b++YGgp3HujF2H8xWxaH5gHSZhhdqtQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mSOGf-0006zI-6O; Mon, 20 Sep 2021 20:43:53 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 86e9d97c;
 Mon, 20 Sep 2021 18:43:41 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 21:43:41 +0300
Message-Id: <20210920184341.641935-1-aperez@igalia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.32.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This is a minor release which provides fixes for CVE-2021-30858 and
a number of other potential security issues without an associated CVE.
Patch "0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch"
is deleted as it has been included in this release.

Full release notes can be found at:

  https://webkitgtk.org/2021/09/17/webkitgtk2.32.4-released.html

An accompanying security advisory has been published at:

  https://webkitgtk.org/security/WSA-2021-0005.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...support-for-FP-registers-plus-some-b.patch | 382 ------------------
 package/webkitgtk/webkitgtk.hash              |   8 +-
 package/webkitgtk/webkitgtk.mk                |   2 +-
 3 files changed, 5 insertions(+), 387 deletions(-)
 delete mode 100644 package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch

diff --git a/package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch b/package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch
deleted file mode 100644
index c8b8501bdb..0000000000
--- a/package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch
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
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 1208dfce6c..7cb6c90b21 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.32.3.tar.xz.sums
-md5  f31b802de421865ea9f1391ec8190519  webkitgtk-2.32.3.tar.xz
-sha1  9c9b2cb2638ea40706765768dd5cb3c95ab46dcb  webkitgtk-2.32.3.tar.xz
-sha256  c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc  webkitgtk-2.32.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.32.4.tar.xz.sums
+md5  51a167e5d03bacf30c5c588e6aa23143  webkitgtk-2.32.4.tar.xz
+sha1  f7255ffb488e727e9e250e0dae9f192266f50f01  webkitgtk-2.32.4.tar.xz
+sha256  00ce2d3f798d7bc5e9039d9059f0c3c974d51de38c8b716f00e94452a177d3fd  webkitgtk-2.32.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 00972744c7..708884fbf6 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.32.3
+WEBKITGTK_VERSION = 2.32.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
