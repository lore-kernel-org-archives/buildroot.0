Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027A9C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83B7B419B2;
	Fri, 16 May 2025 10:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCVuoyWS-P5O; Fri, 16 May 2025 10:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70BF441995
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BF441995;
	Fri, 16 May 2025 10:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D391AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7B0241995
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHnibqaensbL for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1B4E4178C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B4E4178C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1B4E4178C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA60F1C10F7; Fri, 16 May 2025 12:57:31 +0200 (CEST)
Message-ID: <69733bd8-03ce-435e-81fe-f057ebf035f8@rnout.be>
Date: Fri, 16 May 2025 12:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250507201428.1506040-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507201428.1506040-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393052; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+URrgmcroFd8xcv+UInVlUw0OpUbmSuwL82HH4lTleQ=;
 b=V7avqd/RNeDg687nP7/VAsD4RhsyNetiffjeYMyd0MH+Ap925kFh2jQKhH1RTcQ+og756n
 /TQDZv7x13HQo6iASgWBw8T092Vr4kap6FXhOLXZ/kxjP+t+W4ud1tGIcaZ+3pnlVbS28e
 UkNHnlNHQ3p4iIxcSqVMn+7wIeQpMZGfMdZspSAs3bHhd7fUeh54Lz/vflKSMIPvTXnBFI
 OBfugIkWAz7fHliSlRYuEGl0uWl5YUU8sqO1FQ82ee/ypz0Pi2OPU2x97pyDh9/LIHsnY4
 lwv1t8z8r55ICVCE20LEg+BjDAuHKGWFziBFt1UTw+Zidoz/VYLlouX122HzOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=V7avqd/R
Subject: Re: [Buildroot] [PATCH] package/gdb: bump 15.x series to 15.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2025 22:14, Thomas Petazzoni via buildroot wrote:
> Changes:
> 
>   Set GDB version number to 15.2.
>   [gdb/python] Make sure python sys.exit makes gdb exit
>   [gdb/symtab] Revert "Change handling of DW_TAG_enumeration_type in DWARF scanner"
>   [gdb/testsuite] Add regression test for PR32158
>   [gdb/testsuite] Add gdb.dwarf2/enum-type-c++.exp, regression test for PR31900.
>   gdb-15-branch: Clear the X86_XSTATE_MPX bit in XCRO for x32
>   Recognize -2 as a tombstone value in .debug_line
>   [gdb] Handle ^C during disassembly
>   Mark unavailable bytes of limited-length arrays when allocating contents
>   gdb/solib-frv: move lm_info object to solib
>   Fix loading a saved recording
>   Bump GDB's version number to 15.1.90.DATE-git.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                            | 18 +++++++++---------
>   ...ne-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  0
>   ...e-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  0
>   .../0003-use-asm-sgidefs.h.patch               |  0
>   .../0004-gdbserver-fix-build-for-m68k.patch    |  0
>   ...-fork-inferior-include-linux-ptrace.h.patch |  0
>   ...-getrandom-compile-for-uclibc-v1.0.35.patch |  0
>   .../0007-fix-musl-build-on-riscv.patch         |  0
>   ...8-gdbserver-Makefile.in-fix-NLS-build.patch |  0
>   .../0009-gdb-Fix-native-build-on-xtensa.patch  |  0
>   package/gdb/Config.in.host                     |  2 +-
>   package/gdb/gdb.hash                           |  2 +-
>   12 files changed, 11 insertions(+), 11 deletions(-)
>   rename package/gdb/{15.1 => 15.2}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0003-use-asm-sgidefs.h.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0004-gdbserver-fix-build-for-m68k.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0007-fix-musl-build-on-riscv.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0008-gdbserver-Makefile.in-fix-NLS-build.patch (100%)
>   rename package/gdb/{15.1 => 15.2}/0009-gdb-Fix-native-build-on-xtensa.patch (100%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 27b1b2be68..2e0f07617a 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -493,15 +493,15 @@ package/gdb/14.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
>   package/gdb/14.2/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
>   package/gdb/14.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
>   package/gdb/14.2/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
> -package/gdb/15.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
> -package/gdb/15.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
> -package/gdb/15.1/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
> -package/gdb/15.1/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
> -package/gdb/15.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
> -package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
> -package/gdb/15.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
> -package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
> -package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
> +package/gdb/15.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
> +package/gdb/15.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
> +package/gdb/15.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
> +package/gdb/15.2/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
> +package/gdb/15.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
> +package/gdb/15.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
> +package/gdb/15.2/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
> +package/gdb/15.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
> +package/gdb/15.2/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
>   package/gdb/16.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
>   package/gdb/16.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
>   package/gdb/16.3/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
> diff --git a/package/gdb/15.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/15.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> similarity index 100%
> rename from package/gdb/15.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> rename to package/gdb/15.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> diff --git a/package/gdb/15.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/15.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
> similarity index 100%
> rename from package/gdb/15.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
> rename to package/gdb/15.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
> diff --git a/package/gdb/15.1/0003-use-asm-sgidefs.h.patch b/package/gdb/15.2/0003-use-asm-sgidefs.h.patch
> similarity index 100%
> rename from package/gdb/15.1/0003-use-asm-sgidefs.h.patch
> rename to package/gdb/15.2/0003-use-asm-sgidefs.h.patch
> diff --git a/package/gdb/15.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/15.2/0004-gdbserver-fix-build-for-m68k.patch
> similarity index 100%
> rename from package/gdb/15.1/0004-gdbserver-fix-build-for-m68k.patch
> rename to package/gdb/15.2/0004-gdbserver-fix-build-for-m68k.patch
> diff --git a/package/gdb/15.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/15.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
> similarity index 100%
> rename from package/gdb/15.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
> rename to package/gdb/15.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
> diff --git a/package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/15.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
> similarity index 100%
> rename from package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
> rename to package/gdb/15.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
> diff --git a/package/gdb/15.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/15.2/0007-fix-musl-build-on-riscv.patch
> similarity index 100%
> rename from package/gdb/15.1/0007-fix-musl-build-on-riscv.patch
> rename to package/gdb/15.2/0007-fix-musl-build-on-riscv.patch
> diff --git a/package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/15.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
> similarity index 100%
> rename from package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
> rename to package/gdb/15.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
> diff --git a/package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/15.2/0009-gdb-Fix-native-build-on-xtensa.patch
> similarity index 100%
> rename from package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch
> rename to package/gdb/15.2/0009-gdb-Fix-native-build-on-xtensa.patch
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 40fe4cf6d2..54247ad642 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -70,6 +70,6 @@ config BR2_GDB_VERSION
>   	string
>   	default "arc-2023.09-release" if BR2_arc
>   	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
> -	default "15.1"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
> +	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
>   	default "16.3"	   if BR2_GDB_VERSION_16
>   	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index 3e2d5a9655..8bef9cd374 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -1,6 +1,6 @@
>   # From https://gcc.gnu.org/pub/gdb/releases/sha512.sum
>   sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
> -sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c390d8d5d5550cc515c16519de1071d8eef96aa58e38056c7e37da1d8b  gdb-15.1.tar.xz
> +sha512  624007deceb5b15ba89c0725883d1a699fa46714ef30887f3d0165e17c5d65d634671740a135aa69e437d916218abb08cfa2a38ed309ff19d48f51da56b2a8ba  gdb-15.2.tar.xz
>   sha512  fffd6689c3405466a179670b04720dc825e4f210a761f63dd2b33027432f8cd5d1c059c431a5ec9e165eedd1901220b5329d73c522f9a444788888c731b29e9c  gdb-16.3.tar.xz
>   
>   # Locally calculated (fetched from Github)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
