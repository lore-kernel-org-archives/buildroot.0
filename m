Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1960A2608
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i5sR/bEL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74AA781661;
	Fri, 23 Oct 2026 12:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id SIHpRWRXLvUk; Fri, 23 Oct 2026 12:32:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B5A781546
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758743;
	b=OqebX7UodwjB5Tv1JeZZQmJhePKN3ZrT1GbD1aLgDLYJsv4o1mH6f2hIJui3fy/pmkCu
	 i/vc0IsrRZBcXFTZvIo9gq0zsOs6P01cq9mQQ4NAYg50Hbd+PLInMzgVY1AA93kdwL45U
	 KmZl7yelLCs1aNxIRfaxnCFoqiSAVSnhKDFVCuVoCLCRLPeE8eY7f9NNUR6u9bqdeA5cG
	 4J3EIFa+2wZP81JBwVymr1mq/ijdMsCVveB28ViDi8tkO/Jma7pa3FDrPSN+lxJ07Xn9t
	 fyFALn+LPe+9gSKP8aOYeFaf9OKsn2uwEJMKmI6JMlDK+Qm9wIhLDtvSexuh3Y7V+Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0XZMbWfH1MhvDEbg5u5qAhDMU80VadplmTGz9x60azg=;
	b=YHgKMrIcvPm5Xodu8Jrpb4qXTs9SccbEQATASAlLrH869K7+4F6RjZkmknW6V7l/YXzf
	 L8rm6MQ9cfDNEHqCkpTKVLZQhm5+sYz/ZO+8rS8/g77Kufzhwu0vR/UFNVBIYk366TN6h
	 qJ5pr9+1ql5/J+y40sLVDO2tgo6EYWJP/B/t7z8OgQnb+1VmDbGeRnPg+lK7DmSRSvAgG
	 bQ057cs0+NWSc0XbgHHRmhX7uYjyk5zlNnVpgsKXevM4+d3/0f5FDI0aYw0cEMLNLNHVp
	 /O5fMAdcz5rIxzDtdC2wvmng/PalEzCWyj93BUeLQsU1qEPj/dAodsJJDBoj64enjrg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758743;
	bh=0XZMbWfH1MhvDEbg5u5qAhDMU80VadplmTGz9x60azg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i5sR/bELWRP5neigvAPOM2LwP/lcFUmASK6aZi9z3HgWaHyqrRXms9nvA7/8bTx+V
	 pPJVKfT0D0uJs7EUAg27Jczd+4dfEKYeZeNVPnlKQFpiwtCY9q2kCfB4+iPzpdskC+
	 2p4ZkKZCGUrCE3ErAMn/tWAPenmLNUsSR2JGr3WDVRs39R/J09492JXRAguZ/4jgC9
	 yRO3IyQfK3S296D9+54svpaz2DMV0xsFDx3soI6akMnMflxI30KwbBda/SHU+aOC8o
	 ENVudUz3ERiDHT0YEnxzL9t2MPntF4au6ygJ4DI4Vdja/NAth94heFfGAC7rDSm32U
	 ZNeBXmWQitdcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5A781546;
	Fri, 23 Oct 2026 12:32:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A47F49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F880401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjnpZvXmp1aL for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2B8CC40119
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=eDgUJ3QamObe99JLEvDOu/zWpSHkxnAMJ/vwa0yB9/1mgepBaErmkvmsY9pJu1cyE/kG
 xu1Pl5qp8EbEIerkso/Q7YAqsuvZLcgPH/+zG0FgYz1Xy7K4dye9uJCTXYD+/56eATJT9
 wk7fpuwuaUTrRKUHDGQndFyxBaifFWleqz5frKvwH4A5C83jxVQFB8HVEyixUU07ybwju
 FoZ8qU80ZhD8QUeCl22M02MbhJp+MwJVEwnK8MkgJ5qG3bNaz/A4PgMxnvKw6PXtb22EU
 szepYQmiJAZAqMBZHREvEEG94dVT0LGF45KMNZQJK30CIX2xVHcnl873LRmJ4lUbttA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4CqcycD7tJGkybVYyEvuTmybkvOFAskY5CU8l0/FwGg=;
 b=UevnFGisw/lX3QKMOVFrIj7WYzI0qQgCHTevJWbbbH6W81FCSeUKSriARurmkBWJR1Jo
 LjPsFXZESOO9pdnf6tVG+qME9N2f4QNBmIAj2E/mDaNJUVMsm3V9PeMB/s6tqhiD1lJ7i
 jtIobYuONjD1ZVtnm9GS13oBWHw61yDELlX70IzSyViFQh/xuAQJNgmNrkrU22cQv90hA
 9rfHs5SnsEJROyt5ZYce6HIA1ee9WdZDsGRN+7+dxABmQC9wjfgQCBMWHbiaN0vWUQuOZ
 XhO1tsJPFvWeRhAJHXO3JeCRqNDJVGqMm5osw252x6kMmwCigWub24qm3LkArEozByg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B8CC40119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B05029C66A; Fri, 23 Oct 2026 12:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:24 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1380aa119bc92e7f91f1528860b04fef4c7dc093
X-Git-Newrev: 57968f8678452280c038dd84e3fb0dfe7309782c
X-Patchwork-Hint: ignore
Message-Id: <20261023123041.B05029C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gcc: add
 microblaze frame unwinding fix to v14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4428163460375905168=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4428163460375905168==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/57968f8678452280c038dd84e3fb0dfe7309782c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Add microblaze signal-frame unwinding fix back port to gcc 14.4.0.

Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0e61ae3b5afa6c10179761bb8874379a41ea0b06)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-add-Linux-signal-frame-unwinding-support.patch | 196 +++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
new file mode 100644
index 0000000000..762a1e09bb
--- /dev/null
+++ b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
@@ -0,0 +1,196 @@
+From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
+From: Ramin Moussavi <lordrasmus@gmail.com>
+Date: Wed, 3 Jun 2026 00:00:00 +0200
+Subject: [PATCH] microblaze: add Linux signal frame unwinding support
+
+libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
+DWARF unwinder cannot step through signal frames at all.  Anything that
+unwinds out of a signal handler -- most prominently NPTL asynchronous
+pthread cancellation (SIGCANCEL) -- either stops early with
+_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
+misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
+
+Add the standard fallback: recognize the two-instruction trampoline the
+kernel writes into struct rt_sigframe on the stack
+
+	addik r12, r0, __NR_rt_sigreturn
+	brki  r14, 0x8
+
+and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
+is anchored relative to the trampoline (its last member) rather than to
+the CFA, so the layout of the frame head does not matter.
+
+The interrupted PC is recorded in DWARF column 36, one past the hard
+registers, because column 15 must keep the interrupted r15 (unrelated to
+the resume address of a signal frame).  Declaring it as
+DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
+column; without that _Unwind_GetGR reads a zero size and aborts.
+
+Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
+git, running its NPTL test suite under qemu-system-microblazeel -M
+petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
+9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
+hanging in the unwinder; with it all 17 pass and the rest of the suite
+is unchanged.  The implementation follows the mips/aarch64
+linux-unwind.h pattern.
+
+gcc/ChangeLog:
+
+	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
+	Define.
+
+libgcc/ChangeLog:
+
+	* config.host (microblaze*-linux*): Set md_unwind_header.
+	* config/microblaze/linux-unwind.h: New file.
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
+
+Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ gcc/config/microblaze/microblaze.h      |   8 ++
+ libgcc/config.host                      |   1 +
+ libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
+ 3 files changed, 111 insertions(+)
+ create mode 100644 libgcc/config/microblaze/linux-unwind.h
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2b5bd52040f7f..fc8c4b8717545 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
+ #define DWARF_FRAME_RETURN_COLUMN \
+ 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
+ 
++/* Signal frames (config/microblaze/linux-unwind.h) record the
++   interrupted PC in DWARF column 36, one past the hard registers,
++   because column 15 must keep the interrupted r15.  Declaring it as
++   the alternate return column makes init_dwarf_reg_size_table size
++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
++   frame, such as during pthread cancellation.  */
++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
++
+ /* Initial state of return address on entry to func = R15.
+    Actually, the RA is at R15+8, but gcc doesn't know how 
+    to generate this. 
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 046156fa5e786..a685d5da7a107 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1050,6 +1050,7 @@ mcore-*-elf)
+ 	;;
+ microblaze*-linux*)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
++	md_unwind_header=microblaze/linux-unwind.h
+ 	;;
+ microblaze*-*-elf)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
+diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
+new file mode 100644
+index 0000000000000..b54704a065198
+--- /dev/null
++++ b/libgcc/config/microblaze/linux-unwind.h
+@@ -0,0 +1,102 @@
++/* DWARF2 EH unwinding support for MicroBlaze Linux.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3, or (at your option)
++   any later version.
++
++   GCC is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   Under Section 7 of GPL version 3, you are granted additional
++   permissions described in the GCC Runtime Library Exception, version
++   3.1, as published by the Free Software Foundation.
++
++   You should have received a copy of the GNU General Public License and
++   a copy of the GCC Runtime Library Exception along with this program;
++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef inhibit_libc
++
++/* Do code reading to identify a signal frame, and set the frame state
++   data appropriately.  See unwind-dw2.c for the structs.  */
++
++#include <signal.h>
++#include <sys/ucontext.h>
++#include <asm/unistd.h>
++
++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
++
++static _Unwind_Reason_Code
++microblaze_fallback_frame_state (struct _Unwind_Context *context,
++				 _Unwind_FrameState *fs)
++{
++  const unsigned int *pc = (const unsigned int *) context->ra;
++  struct sigcontext *sc;
++  _Unwind_Ptr new_cfa;
++  int i;
++
++  /* The outermost frame of a thread may leave a null or near-null
++     return address; do not dereference it looking for the
++     trampoline.  */
++  if ((unsigned long) pc < 4096)
++    return _URC_END_OF_STACK;
++
++  /* The kernel writes the signal trampoline onto the stack
++     (struct rt_sigframe.tramp):
++
++	addik r12, r0, __NR_rt_sigreturn
++	brki  r14, 0x8
++
++     and sets the saved r15 to the trampoline address minus 8 (the
++     handler returns with "rtsd r15, 8"), so the unwound return
++     address points 8 bytes before the trampoline.  */
++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
++    ;
++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
++    pc += 2;
++  else
++    return _URC_END_OF_STACK;
++
++  /* The trampoline is the last member of the kernel's rt_sigframe and
++     the ucontext sits directly in front of it.  Anchor there rather
++     than at the CFA so the layout of the frame head does not matter
++     (the kernel may insert an ABI argument-home gap at the front).
++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
++
++  sc = (struct sigcontext *) &uc->uc_mcontext;
++
++  new_cfa = sc->regs.r1;
++  fs->regs.cfa_how = CFA_REG_OFFSET;
++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
++
++  /* pt_regs holds r0..r31 consecutively.  */
++  for (i = 0; i < 32; i++)
++    {
++      fs->regs.how[i] = REG_SAVED_OFFSET;
++      fs->regs.reg[i].loc.offset
++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
++    }
++
++  /* The interrupted PC goes into the alternate return column
++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
++     gcc/config/microblaze/microblaze.h), one past the hard registers;
++     column 15 above keeps the interrupted r15.  */
++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
++  fs->signal_frame = 1;
++
++  return _URC_NO_REASON;
++}
++
++#endif

--===============4428163460375905168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4428163460375905168==--
