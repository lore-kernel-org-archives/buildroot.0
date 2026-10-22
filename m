Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD5D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AocrgLIJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74E5E81361;
	Fri, 23 Oct 2026 12:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19Z9Ybp-f6JY; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 048CD81423
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758270;
	b=JvcRkqZz1j/SGy0fLfqkGZeHY3U4RuBsrQBlRCHaHg5F2Kxp9JcLagOlHHQVQwXITeYM
	 u/vQ1FpRMTD4ZqKez/KTcOnoe8ZJRQvKt0MOIx6iPZeWib4iHzyaA6nrRqHTaMUaAZ3a3
	 HEXpOxsByGSNV/8jPTKcz3O2YYsV5C1IKtScZRXkpwPaF0QCjY+GFK+d6Ei5ez/rCkQNl
	 DtBIu0+JQbVAPXxHf0LVm1jSji8Wo5jyeQUxj66wL+XT0ZUkyRIZCVPEDXxGkZDq64J3U
	 fdsA4CrlTOAujhUQ+Fm5XrmvCf2VihhGGnZNMKHEEY3bpzChKaYtpee/ePA/PIos0ZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fxpNKkSN7cssBWMiinvr7LgAZ20W4lvO7tS8ZES4ZPg=;
	b=ZE7kHFVOhTFrvuHOfkhEWx6ZekYz45Vgc43//ehXmwUI1ffn4psx2vPZCvpIaMfSnFV0
	 p4KwNSNAjRUByvojsv7VlGDZm+bKmr8mxL8vlbSNCFbJ6IWO6mKSvctQmJsZXdTHrW9Uj
	 X5CDuGbagvI2ivLX0RGwYMGwQmKkqWve0xo3xIM6CGwla0k59fgk2SHtkekDCFz/2gIHr
	 jRS9MGCr5qwQDJGJAPKWpkQUhSy7X+zJSRHsfM6sk3pj569PTixIqSHchWVqtuvD/MWlB
	 RILnQLfUyW7JGoLI94wBYpmieQFr8wmrplbGtlzWQ1dH7go+FhtTGqRXnzh+WY4XeBQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758270;
	bh=fxpNKkSN7cssBWMiinvr7LgAZ20W4lvO7tS8ZES4ZPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AocrgLIJKlNJb6emptGtKL3ThuGwVDEsuug7v6HVyeOcdeI2ne9ttvYIepNNjnb8i
	 plm+arc/9CiEPgPkQHg80VOsHZWzb1W90lmTPcK/wkpkYLQ+HhCKjv6VUHQsbixpVd
	 iwZRQV2Ru1agnjkWbua2ejdepbbIg0799PkHi/Q1CIwmc4LJSn3lDqV3iRIyYxPN2d
	 LNv4yqR8tv6K9r2RZQZkzhqpZed66gLIC5Vpl64xSa4Van4/Vhw1f+Wh44p6QpCAn/
	 NR2H3qEIpwk6txQvYlaKI/gaVdNVVXvfL8b6gT+PeRozfftkjm7eSBvyWF8CpWZwwL
	 gOyHIPdMzrokA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 048CD81423;
	Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6201AB02
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47A4440782
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lH9R9rtliOJF for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B1284072E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758264;
 b=fPvV8TkIcCdSybtJIAuOyI38cjFatvwqUY8ldUNbMqYXXJ3T0Ms/AguqwAj9p72+7tZL
 Ju+S9JLLA9xSWbcE7RzSEF8TOxxS5j+ChPRDXxGNi4hEPV6Y9O3PSak0qoiJ7Ha6DpW4i
 sYRw/r4os3o6yU7Fv30QjlL4Z9WEoyOBCKS1nUMHTUbX8fQYMOenAOBiH6xGWFcI/y0ad
 m4svq/fdn5EKdS6EzzPsYTCspG/FdhdGH9ApWnIcMYPkoXk9jf0zM7boumytsB6CwtDmB
 G4Y2BysrzFqsVIAql6of+303jJfc8j3OT6T6kasnXZjZkKwBK5J/F9ylN9ut4HA9G+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758264;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3UfrgvWnkolmA03phAOGBBiKlK8G9lJjcsPx55hYrAM=;
 b=qr6p+ko+j3T0XCDaeC9zLOQ26q7okxIOYQ4x7JzGiT7uAjalRzPHTx/2BxvZXsbL0i70
 A/Jub8Cz+LPrTwPfRuG7zJm1HdMUXRx2qISZ0vnAP+oNZ9ieDmmTuKNaoMGK1IetIex+9
 WCJW8gn8YaH1S11CfoHo2ylWCOxrY7InDqNT+Z68q8NuHswitXDYFGhQ35Cj0bwQV1VO9
 4HoPnXoAfvrUzn8z2IXsoKmsURfqIIzdP4v9E4Tt1q8SkW9OR1RoVrFHnqAqgf1LYsAKO
 MczJ1iuKvdRUkjNc9f2OHVpD+LMN8IRYBQdpjZDpH3gnsUf6tnh75GiwCfFW7LhwxIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B1284072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5C349B9AA; Fri, 23 Oct 2026 12:22:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89a1dcbe463b15d55d0561b8df2dbb75ec1de667
X-Git-Newrev: cdfe52550d53c6cd6b5f075ea824ba051f19b414
X-Patchwork-Hint: ignore
Message-Id: <20261023122259.C5C349B9AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc: add
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
Content-Type: multipart/mixed; boundary="===============5150973421111419687=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5150973421111419687==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cdfe52550d53c6cd6b5f075ea824ba051f19b414
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============5150973421111419687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5150973421111419687==--
