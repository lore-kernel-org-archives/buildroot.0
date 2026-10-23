Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86415606A321
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a+Xp1RcJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608E6606F1;
	Fri, 23 Oct 2026 13:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s72ost_0v_qj; Fri, 23 Oct 2026 13:20:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2838060711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761605;
	b=jpIoJ5HibK6lhJ02aM7rHjqfYXBj6LF8SrOKRbAUAGjDJeZ6bpC2aky9A0PfYtl/1RVJ
	 0g5gP3GSBfFWm+hmvWyOm3vvW3mQyefpid0nHVRTBC5YR6PItu93znPyIUibHHYW1Y1n0
	 fA3Y7/HXVJDISxGwe4nhWYkJpR2et+9VCviO3YKVCg/PsAR927ijZTxYdbhWGdU0l93fV
	 UvFThkotL6kboYGVtHW+vYYw54mA1Wtkqk2aes0vmTBvYpDZI/iZPUzIPoBsMREJiKxp/
	 phm8ya/+gXbW1H1c67cUt9J++h6w0uqNzG1AXhCiGVnhx1Fd1/nrglgFe+DW4jMP0PA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761605;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TMSnyNr46f4FB0wNXtOa1QYcVyRVm7PFTE4Pese8TUM=;
	b=e72WmZQ/khCmIu1lA+2iflwkz+1wg20dZjNbspv45AT4ksCem/gGu5L4mqdaGvzHpxrp
	 Lddb35CKw0xJvc8BETjblWRj0A4UXn105SBnK9eezzsAxQhcyWrmFo8zv522jtkJPvW6F
	 JfcEH/e/tWId9o3ALzeRyZhRjAibqMRz79Mj9AYWmKkS+Ol4ojIRs6/gmfJL2hst9eyUP
	 waNwK9d3aUlYOSjipaj6FcIkCEatFAfDRicqqQVHTYU+d+nL3oyKKr7bPil9C2GtNe/Pi
	 /qCnCKT/N3CYOCrr/PD/srIHzB6xMB4qbpWO6G8+AbRyHwMsR1MZbQO7loDLOWUDIWQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761605;
	bh=TMSnyNr46f4FB0wNXtOa1QYcVyRVm7PFTE4Pese8TUM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a+Xp1RcJpAAKTp58TSulohS77tWivajI6Fcvt17bjYpZz8xnyRz306S7y6xbcsO6s
	 TGHdsF7hgdqCHoRYEdhUT+eGbqXwL1rp0zJSX7rzUXLV0nLG1XiaGRQwUD/YVFAbPz
	 ssWeQcViyxT4gvAG4BNhJRWs9LKfGFPxLjpuQBsApSoXk+qPuE83vY8KN5z9EH+YMw
	 wwxS/oP1lk3R3bnfzPczbw+BTdrbO7VpPn7VMOLNUaqfeepn7xghGLOk5T3wzmCLf6
	 J0A4rXLL4/NBcCGDhPoELnoiBHHbUAd+w+6KBedrGzRQ8ORjMGmQo8Mgqobdca/r5s
	 rUlsdqUk7/rLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2838060711;
	Fri, 23 Oct 2026 13:20:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 430A9356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34838608CD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDyLWoGXvToP for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:19:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9083260711
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761598;
 b=CTifrBO64svtuMr9kr5tbs8Q3hGw4l40IajAxg67bpcQSo2QHl90DrT6MXlzbEgFT3La
 MwB0ut/pU7z6gVJkyOt6KGL+qTp0XFCnwgGI5NbuTcQgc2PwNTdBNICsDQtpPjkfDoJ5S
 qfNgyMaMSALoRa6zebw+u0YFO5a+jWBIrAT+cZI2t/UIfvrKMImmWIeDtkqxLXL3HE+AU
 gruYgBoYmr7kw7mmTsyHLRWoEXRhQPm8qYzwIC0YALoxnPgzLrG9vq+yFRTECcMIRwW02
 Vdjemlc2qa/MYQKJJQv9FfjwmsDmivvT0j5cts2/k2lgt0Y7TUBUg2etYltJ/0rnxRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761598;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=aFB7vYtGC44i/7PnJSt/oo/fvFdOdcHMzYD8TGo04EQ=;
 b=eNjMSInBbQ5/CBf+/o0dAkwBxzVIcUIWq5Csj/bCbEWpwUdNf29TXKzxzgLOnqo7qMD4
 +alyGhVPXlpRTT/cnOVo8dIcyb8iWkDcg4MRxTAcHDO7IVOdBwgQSLJL4zm2I8vTxwO9E
 HLpNhdfb4yL/MXfjXX4j7+tZ260eQAgCW5aVYU2fNuIroAfALe5NvWfQOO8oi+V3hYgdA
 dklvOxy+4c24u0MelpMIEyIaZXkNKYA+Z3zYRO0AoXx3uVI1ozJ6VHH0Y59Dzr58IYneC
 ic/RpnnrNBdRXGLUqvVVYiEuP7TL9xEJ3BFLR6MavNN753aB5KXfSh2x4xIMVsrFcgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZSbjMwgg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9083260711
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1ec92f655so9003235e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761595; x=1793366395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aFB7vYtGC44i/7PnJSt/oo/fvFdOdcHMzYD8TGo04EQ=;
 b=GlDlEMMBhqs7L7iJsT6WWVWI0lyoVOMre+dAG9Ah7ZCspIn+DnHv94zlAYA3z0JVlV
 VHLtcpm3f+poAsgVk6nlsGsG9Tef0NUJUxP/j6q08P3IeY75fAn/FFJ+PcHPv45VjLB/
 ENygvt82IZ1K2+TT14btRbGrk9i1gdxFoqlxTed24A9lSqi2EDddPRkyN2DP4Nnz9maM
 6a3f1k4ag+LcpJJOXMIFUDxzWrwkixHbHJ209wecaf/2d+vgWPrpjoDUeIgnYXjCAv95
 LTiLinDOA2CHI5E5T2njEYhsocHaGllGXG8fEqndr4XcYED044e9Kqz/uGI9RhWNBCoQ
 AtSg==
X-Gm-Message-State: AFq9FYLF9YUCGtbHHJkiDkf+knFoUAUXhIklJA9SZBlRXjJj+1DnETrx
 jpJ9L8f549pwqWnJfsp/0oFweu3ygP6i2X4ga9f3cbZLJEwlKw7hWdyq4/zOykZQYZgYl7De3aL
 J2cyZP0Q=
X-Gm-Gg: AYBFou2fs4L7xOuE+JZ5l+ATzLxD3Akcb5tqDEKNRH8tTtgFvzNZ8zIMHv6ZMYvQuYC
 EP5VrPJ14XXAdFhMGk+5lznz/RnupYXItt27oL8sV+T0zC1vJ2T47MjHmvWyDBxTaNIyh4hmKRv
 GOkM44af3ALMCWqCPDLwQl82WwcSnlBE0jxeYxGRvaVtZAYxwGtFxBGWhobJxVd6n4sQBx+pUAZ
 fheXKlHwiQb1Kh4+JzCdzJ2UW12MtThkEASaroGbzrhUN2GaBRbhBmufpenIHoov69HNSk5khPT
 /TZd7kkCu7jt93qDVXoFqiVGVH8p5NkDZUK75qNqbLMlwOITJl4hIKuI/d+dpeJWksTvzVHb4vP
 zeQ+zwbbxnkfyeSoRnPhuxYdvX7yIFHbGUNYTSuAQR194p2+Ecis0j+2a9p6gi2bqn+g6+IpMkW
 cZ51wcFqsqaeMAG03gtuxJlYZ7DcKl79JcWjR1wBEvkO+xB6Oz4O1ucKprqolQ3CjKaBN/UcBcS
 pvvF4cbnZg6jusVx8gA/wR15H5rcQjs4jDy4pgR3ylT2wFrPHMOOXb52w==
X-Received: by 2002:a05:600c:4513:b0:49f:c5aa:9ef4 with SMTP id
 5b1f17b1804b1-4a211c65b12mr35604795e9.8.1792761594981; 
 Fri, 23 Oct 2026 06:19:54 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2b065950dsm3101565e9.12.2026.10.23.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:54 -0700 (PDT)
To: buildroot@buildroot.org,
	Neal Frager <neal.frager@amd.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:51 +0200
Message-ID: <20261023131953.1606501-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014074908.3176317-1-neal.frager@amd.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze frame
 unwinding fix to v14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Add microblaze signal-frame unwinding fix back port to gcc 14.4.0.
> 
> Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...Linux-signal-frame-unwinding-support.patch | 196 ++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
> 
> diff --git a/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
> new file mode 100644
> index 0000000000..762a1e09bb
> --- /dev/null
> +++ b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
> @@ -0,0 +1,196 @@
> +From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
> +From: Ramin Moussavi <lordrasmus@gmail.com>
> +Date: Wed, 3 Jun 2026 00:00:00 +0200
> +Subject: [PATCH] microblaze: add Linux signal frame unwinding support
> +
> +libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
> +DWARF unwinder cannot step through signal frames at all.  Anything that
> +unwinds out of a signal handler -- most prominently NPTL asynchronous
> +pthread cancellation (SIGCANCEL) -- either stops early with
> +_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
> +misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
> +
> +Add the standard fallback: recognize the two-instruction trampoline the
> +kernel writes into struct rt_sigframe on the stack
> +
> +	addik r12, r0, __NR_rt_sigreturn
> +	brki  r14, 0x8
> +
> +and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
> +is anchored relative to the trampoline (its last member) rather than to
> +the CFA, so the layout of the frame head does not matter.
> +
> +The interrupted PC is recorded in DWARF column 36, one past the hard
> +registers, because column 15 must keep the interrupted r15 (unrelated to
> +the resume address of a signal frame).  Declaring it as
> +DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
> +column; without that _Unwind_GetGR reads a zero size and aborts.
> +
> +Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
> +git, running its NPTL test suite under qemu-system-microblazeel -M
> +petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
> +9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
> +hanging in the unwinder; with it all 17 pass and the rest of the suite
> +is unchanged.  The implementation follows the mips/aarch64
> +linux-unwind.h pattern.
> +
> +gcc/ChangeLog:
> +
> +	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
> +	Define.
> +
> +libgcc/ChangeLog:
> +
> +	* config.host (microblaze*-linux*): Set md_unwind_header.
> +	* config/microblaze/linux-unwind.h: New file.
> +
> +Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
> +
> +Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
> +Signed-off-by: Neal Frager <neal.frager@amd.com>
> +---
> + gcc/config/microblaze/microblaze.h      |   8 ++
> + libgcc/config.host                      |   1 +
> + libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
> + 3 files changed, 111 insertions(+)
> + create mode 100644 libgcc/config/microblaze/linux-unwind.h
> +
> +diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
> +index 2b5bd52040f7f..fc8c4b8717545 100644
> +--- a/gcc/config/microblaze/microblaze.h
> ++++ b/gcc/config/microblaze/microblaze.h
> +@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
> + #define DWARF_FRAME_RETURN_COLUMN \
> + 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
> + 
> ++/* Signal frames (config/microblaze/linux-unwind.h) record the
> ++   interrupted PC in DWARF column 36, one past the hard registers,
> ++   because column 15 must keep the interrupted r15.  Declaring it as
> ++   the alternate return column makes init_dwarf_reg_size_table size
> ++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
> ++   frame, such as during pthread cancellation.  */
> ++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
> ++
> + /* Initial state of return address on entry to func = R15.
> +    Actually, the RA is at R15+8, but gcc doesn't know how 
> +    to generate this. 
> +diff --git a/libgcc/config.host b/libgcc/config.host
> +index 046156fa5e786..a685d5da7a107 100644
> +--- a/libgcc/config.host
> ++++ b/libgcc/config.host
> +@@ -1050,6 +1050,7 @@ mcore-*-elf)
> + 	;;
> + microblaze*-linux*)
> + 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
> ++	md_unwind_header=microblaze/linux-unwind.h
> + 	;;
> + microblaze*-*-elf)
> + 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
> +diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
> +new file mode 100644
> +index 0000000000000..b54704a065198
> +--- /dev/null
> ++++ b/libgcc/config/microblaze/linux-unwind.h
> +@@ -0,0 +1,102 @@
> ++/* DWARF2 EH unwinding support for MicroBlaze Linux.
> ++   Copyright (C) 2026 Free Software Foundation, Inc.
> ++
> ++   This file is part of GCC.
> ++
> ++   GCC is free software; you can redistribute it and/or modify
> ++   it under the terms of the GNU General Public License as published by
> ++   the Free Software Foundation; either version 3, or (at your option)
> ++   any later version.
> ++
> ++   GCC is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++   GNU General Public License for more details.
> ++
> ++   Under Section 7 of GPL version 3, you are granted additional
> ++   permissions described in the GCC Runtime Library Exception, version
> ++   3.1, as published by the Free Software Foundation.
> ++
> ++   You should have received a copy of the GNU General Public License and
> ++   a copy of the GCC Runtime Library Exception along with this program;
> ++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifndef inhibit_libc
> ++
> ++/* Do code reading to identify a signal frame, and set the frame state
> ++   data appropriately.  See unwind-dw2.c for the structs.  */
> ++
> ++#include <signal.h>
> ++#include <sys/ucontext.h>
> ++#include <asm/unistd.h>
> ++
> ++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
> ++
> ++static _Unwind_Reason_Code
> ++microblaze_fallback_frame_state (struct _Unwind_Context *context,
> ++				 _Unwind_FrameState *fs)
> ++{
> ++  const unsigned int *pc = (const unsigned int *) context->ra;
> ++  struct sigcontext *sc;
> ++  _Unwind_Ptr new_cfa;
> ++  int i;
> ++
> ++  /* The outermost frame of a thread may leave a null or near-null
> ++     return address; do not dereference it looking for the
> ++     trampoline.  */
> ++  if ((unsigned long) pc < 4096)
> ++    return _URC_END_OF_STACK;
> ++
> ++  /* The kernel writes the signal trampoline onto the stack
> ++     (struct rt_sigframe.tramp):
> ++
> ++	addik r12, r0, __NR_rt_sigreturn
> ++	brki  r14, 0x8
> ++
> ++     and sets the saved r15 to the trampoline address minus 8 (the
> ++     handler returns with "rtsd r15, 8"), so the unwound return
> ++     address points 8 bytes before the trampoline.  */
> ++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
> ++    ;
> ++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
> ++    pc += 2;
> ++  else
> ++    return _URC_END_OF_STACK;
> ++
> ++  /* The trampoline is the last member of the kernel's rt_sigframe and
> ++     the ucontext sits directly in front of it.  Anchor there rather
> ++     than at the CFA so the layout of the frame head does not matter
> ++     (the kernel may insert an ABI argument-home gap at the front).
> ++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
> ++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
> ++
> ++  sc = (struct sigcontext *) &uc->uc_mcontext;
> ++
> ++  new_cfa = sc->regs.r1;
> ++  fs->regs.cfa_how = CFA_REG_OFFSET;
> ++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
> ++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
> ++
> ++  /* pt_regs holds r0..r31 consecutively.  */
> ++  for (i = 0; i < 32; i++)
> ++    {
> ++      fs->regs.how[i] = REG_SAVED_OFFSET;
> ++      fs->regs.reg[i].loc.offset
> ++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
> ++    }
> ++
> ++  /* The interrupted PC goes into the alternate return column
> ++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
> ++     gcc/config/microblaze/microblaze.h), one past the hard registers;
> ++     column 15 above keeps the interrupted r15.  */
> ++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
> ++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
> ++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
> ++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
> ++  fs->signal_frame = 1;
> ++
> ++  return _URC_NO_REASON;
> ++}
> ++
> ++#endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
