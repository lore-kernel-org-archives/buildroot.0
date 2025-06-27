Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF772C7EE2A
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 15:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B60C60DE4;
	Fri, 27 Jun 2025 15:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z54M-E9GOwmJ; Fri, 27 Jun 2025 15:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F5A661152
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5A661152;
	Fri, 27 Jun 2025 15:18:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB82011A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B17BF80B4A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8SVS9S2mRKj for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 15:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D917580B38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D917580B38
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D917580B38
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:17:58 +0000 (UTC)
Received: from [192.168.2.2] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id VApvuB8ZhzKH1VApwuOCLq; Fri, 27 Jun 2025 17:17:57 +0200
Message-ID: <ddeea70a-7c63-41cd-a653-32b3eadc2ab1@benettiengineering.com>
Date: Fri, 27 Jun 2025 17:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>
References: <20230920202452.655292-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230920202452.655292-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfNGQmr8vQgq/6BvEGAJ6HmCpJvbYYC72vz6+ttxdVNE2+mvlpoDzMaERTL1V+mnS2zneiAqtojOCaSkxbVZKC9rGzpqYZ4Fd+gCea/UC7VNiung8UdjK
 rzqUfLK8kv7RTLLoibQlLpBA2GyLf6AM2yLhQnQEiM8qGpmsh/VlNHmn8H/dJk7EygqGBGrG6rMsqf6gvvRfXhXXbZWMlIQf+zhNGZhZ157lIzlMYRjGKxlA
 FIi6FNZfAJuzTK2CxW5BAT2U/vxXgU8b2VYzVp4BW/p6+wp9Ogjhg1NSOR4qBXC+Y+YxQu22rQWhzIwj+Z3KxG8z56qgH15WCCeIiEI23dKlA2jhaXiEXIZC
 Rc6p62d7EOD1bQzoY2JK9imdspFpfUX3m8I02dV2wR3s8qNHXGs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751037477; bh=YOKP/ofsyE+m5JUT+ADk9419iZzUYbTXozrxTz6L+lU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=W2zTWMiZ/xqb4dVuAiknudxY/JR0r4jH+Ho6H71IvEfIDIpogVibUb1b/mQq6qve/
 sl4aWVfCy+OkZxeAkAniVVj+nn36yAn0VRwNSIJIdt4GTfBzEgdLt5gJbgHUfjLLaj
 Rs3oMEgx8dXNGZ5njdhAX+4W08+ykYZGlDnPRa786PeVXQ2Oc6gDSXDkTL92+vpiVB
 pdPWX5HTPpbYKR5yyBbHxSFiedNqPw422Es3pQVJCV0n1BNGl2MCpB+reTUlu9wUCl
 LSqKmr3ONhnckzkBlFkWbOxao6z7aylOUgy+oBzWDoPoaxGJfaNwmHRsrPvVDYXyoB
 YZnV4ofNFPwmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=W2zTWMiZ
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/dotnet6-runtime: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Same here,

I kindly ping since long time passed.

This patch builds .NET 6 while the other simply download and install
.NET 8. They require to be updated of course. I'd appreciate a feedback
for both patches.

Thanks in advance!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
https://www.linkedin.com/company/benetti-engineering-sas/
https://www.linkedin.com/in/giulio-benetti-79975951/

On 9/20/23 22:24, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Add .NET 6 runtime to enable C# console applications to run on embedded
> Linux. At the moment the package can only be built for arm and aarch64.
> 
> https://dotnet.microsoft.com/en-us/download/dotnet/6.0
> 
> Cc: Jim Reinhart <jimr@tekvox.com>
> Cc: James Autry <jautry@tekvox.com>
> Cc: Matthew Maron <matthewm@tekvox.com>
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   ...rm-asmhelpers.S-fix-building-with-GN.patch | 36 +++++++++
>   ...rm-pinvokestubs.S-fix-building-with-.patch | 64 +++++++++++++++
>   ...ipcrossarchnative-option-to-build.sh.patch | 44 +++++++++++
>   ...-when-verbosity-is-passed-as-option-.patch | 45 +++++++++++
>   package/dotnet6-runtime/Config.in             | 31 ++++++++
>   package/dotnet6-runtime/dotnet6-runtime.hash  |  3 +
>   package/dotnet6-runtime/dotnet6-runtime.mk    | 77 +++++++++++++++++++
>   package/dotnet6-runtime/dotnet6-runtime.sh    |  2 +
>   10 files changed, 304 insertions(+)
>   create mode 100644 package/dotnet6-runtime/0001-src-coreclr-vm-arm-asmhelpers.S-fix-building-with-GN.patch
>   create mode 100644 package/dotnet6-runtime/0002-src-coreclr-vm-arm-pinvokestubs.S-fix-building-with-.patch
>   create mode 100644 package/dotnet6-runtime/0003-Add-skipcrossarchnative-option-to-build.sh.patch
>   create mode 100644 package/dotnet6-runtime/0004-Add-Verbose-true-when-verbosity-is-passed-as-option-.patch
>   create mode 100644 package/dotnet6-runtime/Config.in
>   create mode 100644 package/dotnet6-runtime/dotnet6-runtime.hash
>   create mode 100644 package/dotnet6-runtime/dotnet6-runtime.mk
>   create mode 100644 package/dotnet6-runtime/dotnet6-runtime.sh
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ca370dc373..1ed5285961 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1199,6 +1199,7 @@ F:	configs/olimex_a*
>   F:	package/at/
>   F:	package/binutils/
>   F:	package/cryptsetup/
> +F:	package/dotnet6-runtime/
>   F:	package/erlang-jiffy/
>   F:	package/esp-hosted/
>   F:	package/gcc/
> diff --git a/package/Config.in b/package/Config.in
> index e8dbadadf3..cc99be39fb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -650,6 +650,7 @@ endmenu
>   
>   menu "Interpreter languages and scripting"
>   	source "package/4th/Config.in"
> +	source "package/dotnet6-runtime/Config.in"
>   	source "package/enscript/Config.in"
>   	source "package/erlang/Config.in"
>   if BR2_PACKAGE_ERLANG
> diff --git a/package/dotnet6-runtime/0001-src-coreclr-vm-arm-asmhelpers.S-fix-building-with-GN.patch b/package/dotnet6-runtime/0001-src-coreclr-vm-arm-asmhelpers.S-fix-building-with-GN.patch
> new file mode 100644
> index 0000000000..d537214b8b
> --- /dev/null
> +++ b/package/dotnet6-runtime/0001-src-coreclr-vm-arm-asmhelpers.S-fix-building-with-GN.patch
> @@ -0,0 +1,36 @@
> +From b2d03d48e2a24b68835a1863956d70af96180ea2 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +Date: Wed, 16 Aug 2023 00:09:59 +0200
> +Subject: [PATCH] src/coreclr/vm/arm/asmhelpers.S: fix building with GNU AS
> +
> +GNU AS doesn't support label subtraction when assigning to a register so
> +let's load absolute function address to R2 when building with GNU AS.
> +
> +Upstream: https://github.com/dotnet/runtime/pull/86692
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +---
> + src/coreclr/vm/arm/asmhelpers.S | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/coreclr/vm/arm/asmhelpers.S b/src/coreclr/vm/arm/asmhelpers.S
> +index 2780f95912f..d5e2f1ba2de 100644
> +--- a/src/coreclr/vm/arm/asmhelpers.S
> ++++ b/src/coreclr/vm/arm/asmhelpers.S
> +@@ -984,9 +984,13 @@ g_rgWriteBarrierDescriptors:
> +     LEAF_ENTRY JIT_WriteBarrier_Callable
> +
> +     // Branch to the write barrier
> ++#if defined(__clang__)
> +     ldr     r2, =JIT_WriteBarrier_Loc-(1f+4) // or R3? See targetarm.h
> + 1:
> +     add     r2, pc
> ++#else
> ++    ldr     r2, =JIT_WriteBarrier_Loc
> ++#endif
> +     ldr     pc, [r2]
> +
> +     LEAF_END JIT_WriteBarrier_Callable
> +--
> +2.34.1
> +
> diff --git a/package/dotnet6-runtime/0002-src-coreclr-vm-arm-pinvokestubs.S-fix-building-with-.patch b/package/dotnet6-runtime/0002-src-coreclr-vm-arm-pinvokestubs.S-fix-building-with-.patch
> new file mode 100644
> index 0000000000..1837b68292
> --- /dev/null
> +++ b/package/dotnet6-runtime/0002-src-coreclr-vm-arm-pinvokestubs.S-fix-building-with-.patch
> @@ -0,0 +1,64 @@
> +From 5e6bd486cb9a6b9713dee10160c5798bc8e6dec0 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +Date: Wed, 16 Aug 2023 00:10:40 +0200
> +Subject: [PATCH] src/coreclr/vm/arm/pinvokestubs.S: fix building with GNU AS
> +
> +GNU AS doesn't support label subtraction when assigning to a register so
> +let's load absolute function address to R1/R2 when building with GNU AS.
> +
> +Upstream: https://github.com/dotnet/runtime/pull/86692
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +---
> + src/coreclr/vm/arm/pinvokestubs.S | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/src/coreclr/vm/arm/pinvokestubs.S b/src/coreclr/vm/arm/pinvokestubs.S
> +index cd4928003b5..737feec0310 100644
> +--- a/src/coreclr/vm/arm/pinvokestubs.S
> ++++ b/src/coreclr/vm/arm/pinvokestubs.S
> +@@ -84,9 +84,13 @@
> +
> +         PROLOG_PUSH  "{r4, lr}"
> +
> ++#if defined(__clang__)
> +         ldr     r1, =s_gsCookie-(1f+4)
> + 1:
> +         add     r1, pc
> ++#else
> ++        ldr     r1, =s_gsCookie
> ++#endif
> +         ldr     r1, [r1]
> +         str     r1, [r0]
> +         add     r4, r0, SIZEOF__GSCookie
> +@@ -94,9 +98,13 @@
> +         // r4 = pFrame
> +
> +         // set first slot to the value of InlinedCallFrame::`vftable' (checked by runtime code)
> ++#if defined(__clang__)
> +         ldr     r1, =_ZTV16InlinedCallFrame+8-(2f+4)
> + 2:
> +         add     r1, pc
> ++#else
> ++        ldr     r1, =_ZTV16InlinedCallFrame+8
> ++#endif
> +         str     r1, [r4]
> +
> +         mov     r1, 0
> +@@ -146,9 +154,13 @@
> +         str     r2, [r1, #Thread_m_fPreemptiveGCDisabled]
> +
> +         // Check return trap
> ++#if defined(__clang__)
> +         ldr     r2, =g_TrapReturningThreads-(1f+4)
> + 1:
> +         add     r2, pc
> ++#else
> ++        ldr     r2, =g_TrapReturningThreads
> ++#endif
> +         ldr     r2, [r2]
> +         cbnz    r2, LOCAL_LABEL(RarePath)
> +
> +--
> +2.34.1
> +
> diff --git a/package/dotnet6-runtime/0003-Add-skipcrossarchnative-option-to-build.sh.patch b/package/dotnet6-runtime/0003-Add-skipcrossarchnative-option-to-build.sh.patch
> new file mode 100644
> index 0000000000..73c09afc00
> --- /dev/null
> +++ b/package/dotnet6-runtime/0003-Add-skipcrossarchnative-option-to-build.sh.patch
> @@ -0,0 +1,44 @@
> +From 62f78aa8133fa4e926279a00584f31f512f276df Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +Date: Wed, 7 Jun 2023 16:58:34 +0200
> +Subject: [PATCH] Add -skipcrossarchnative option to build.sh
> +
> +Upstream: https://github.com/dotnet/runtime/pull/90554
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +---
> + eng/build.sh             | 5 +++++
> + src/coreclr/runtime.proj | 1 +
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/eng/build.sh b/eng/build.sh
> +index ea6be90af61..6c21f316832 100755
> +--- a/eng/build.sh
> ++++ b/eng/build.sh
> +@@ -460,6 +460,11 @@ while [[ $# > 0 ]]; do
> +       shift 1
> +       ;;
> +
> ++      -skipcrossarchnative)
> ++      arguments="$arguments /p:SkipCrossArchNative=true"
> ++      shift 1
> ++      ;;
> ++
> +       *)
> +       extraargs="$extraargs $1"
> +       shift 1
> +diff --git a/src/coreclr/runtime.proj b/src/coreclr/runtime.proj
> +index 3d4705a92f6..42ab2e70d65 100644
> +--- a/src/coreclr/runtime.proj
> ++++ b/src/coreclr/runtime.proj
> +@@ -13,6 +13,7 @@
> +       <_CoreClrBuildArg Condition="'$(PortableBuild)' != 'true'" Include="-portablebuild=false" />
> +       <_CoreClrBuildArg Condition="'$(KeepNativeSymbols)' != 'false'" Include="-keepnativesymbols" />
> +       <_CoreClrBuildArg Condition="!$([MSBuild]::IsOsPlatform(Windows))" Include="-os $(TargetOS)" />
> ++      <_CoreClrBuildArg Condition="'$(SkipCrossArchNative)' == 'true'" Include="-skipcrossarchnative" />
> +
> +       <_CoreClrBuildArg Condition="$([MSBuild]::IsOsPlatform(Windows)) and
> +                                    ('$(TargetArchitecture)' == 'x86' or '$(TargetArchitecture)' == 'x64') and
> +--
> +2.34.1
> +
> diff --git a/package/dotnet6-runtime/0004-Add-Verbose-true-when-verbosity-is-passed-as-option-.patch b/package/dotnet6-runtime/0004-Add-Verbose-true-when-verbosity-is-passed-as-option-.patch
> new file mode 100644
> index 0000000000..afb332fc52
> --- /dev/null
> +++ b/package/dotnet6-runtime/0004-Add-Verbose-true-when-verbosity-is-passed-as-option-.patch
> @@ -0,0 +1,45 @@
> +From 0b999da7b88000e628bb4423af4c01ad2c93c257 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +Date: Wed, 7 Jun 2023 18:50:08 +0200
> +Subject: [PATCH] Add Verbose=true when --verbosity is passed as option to
> + build.sh
> +
> +Upstream: https://github.com/dotnet/runtime/pull/90554
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> +---
> + eng/build.sh             | 5 +++++
> + src/coreclr/runtime.proj | 1 +
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/eng/build.sh b/eng/build.sh
> +index 6c21f316832..76e604446fb 100755
> +--- a/eng/build.sh
> ++++ b/eng/build.sh
> +@@ -465,6 +465,11 @@ while [[ $# > 0 ]]; do
> +       shift 1
> +       ;;
> +
> ++      -verbosity)
> ++      arguments="$arguments /p:Verbose=true"
> ++      shift 2
> ++      ;;
> ++
> +       *)
> +       extraargs="$extraargs $1"
> +       shift 1
> +diff --git a/src/coreclr/runtime.proj b/src/coreclr/runtime.proj
> +index 42ab2e70d65..9acf6436ff3 100644
> +--- a/src/coreclr/runtime.proj
> ++++ b/src/coreclr/runtime.proj
> +@@ -14,6 +14,7 @@
> +       <_CoreClrBuildArg Condition="'$(KeepNativeSymbols)' != 'false'" Include="-keepnativesymbols" />
> +       <_CoreClrBuildArg Condition="!$([MSBuild]::IsOsPlatform(Windows))" Include="-os $(TargetOS)" />
> +       <_CoreClrBuildArg Condition="'$(SkipCrossArchNative)' == 'true'" Include="-skipcrossarchnative" />
> ++      <_CoreClrBuildArg Condition="'$(Verbose)' == 'true'" Include="-verbose" />
> +
> +       <_CoreClrBuildArg Condition="$([MSBuild]::IsOsPlatform(Windows)) and
> +                                    ('$(TargetArchitecture)' == 'x86' or '$(TargetArchitecture)' == 'x64') and
> +--
> +2.34.1
> +
> diff --git a/package/dotnet6-runtime/Config.in b/package/dotnet6-runtime/Config.in
> new file mode 100644
> index 0000000000..71e22da422
> --- /dev/null
> +++ b/package/dotnet6-runtime/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_DOTNET6_RUNTIME_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	# On ARM CoreCLR JIT requires 16 64-bit or 32 32-bit FPU registers
> +	default y if BR2_arm && (BR2_ARM_FPU_VFPV3 || BR2_ARM_FPU_VFPV3D16 || \
> +				 BR2_ARM_FPU_VFPV4 || BR2_ARM_FPU_VFPV4D16)
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # aarch64 fpu assembly registers build failure
> +
> +config BR2_PACKAGE_DOTNET6_RUNTIME
> +	bool "dotnet6-runtime"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_DOTNET6_RUNTIME_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_CMAKE
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBKRB5
> +	select BR2_PACKAGE_LIBZLIB
> +	select BR2_PACKAGE_LTTNG_LIBUST
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  .NET Core 6 Runtime
> +
> +	  https://dotnet.microsoft.com/download/dotnet-core/6.0
> +
> +comment "dotnet-runtime needs a toolchain w/ glibc or musl and threads"
> +	depends on BR2_PACKAGE_DOTNET6_RUNTIME_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/dotnet6-runtime/dotnet6-runtime.hash b/package/dotnet6-runtime/dotnet6-runtime.hash
> new file mode 100644
> index 0000000000..9adddfd138
> --- /dev/null
> +++ b/package/dotnet6-runtime/dotnet6-runtime.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  a674c44736bf4f4dfafa800899577ef92cb626b9118b5fbdd0182f8c05b5c2e1  dotnet6-runtime-6.0.22.tar.gz
> +sha256  cfc21f5e8bd655ae997eec916138b707b1d290b83272c02a95c9f821b8c87310  LICENSE.TXT
> diff --git a/package/dotnet6-runtime/dotnet6-runtime.mk b/package/dotnet6-runtime/dotnet6-runtime.mk
> new file mode 100644
> index 0000000000..ac1cb3815c
> --- /dev/null
> +++ b/package/dotnet6-runtime/dotnet6-runtime.mk
> @@ -0,0 +1,77 @@
> +################################################################################
> +#
> +# dotnet6-runtime
> +#
> +################################################################################
> +
> +DOTNET6_RUNTIME_VERSION = 6.0.22
> +DOTNET6_RUNTIME_SITE = $(call github,dotnet,runtime,v$(DOTNET6_RUNTIME_VERSION))
> +DOTNET6_RUNTIME_LICENSE = MIT
> +DOTNET6_RUNTIME_LICENSE_FILES = LICENSE.TXT
> +DOTNET6_RUNTIME_DEPENDENCIES = host-cmake libzlib openssl libcurl icu libkrb5 lttng-libust
> +
> +ifeq ($(BR2_aarch64),y)
> +DOTNET6_RUNTIME_ARCH = arm64
> +else ifeq ($(BR2_arm),y)
> +DOTNET6_RUNTIME_ARCH = arm
> +# Set FPU type
> +DOTNET6_RUNTIME_ARM_FPU_TYPE = $(BR2_GCC_TARGET_FPU)
> +ifeq ($(BR2_ARM_FPU_VFPV3)$(BR2_ARM_FPU_VFPV4),y)
> +# Set 0x07 if 32 fpu registers are used
> +DOTNET6_RUNTIME_ARM_FPU_CAPABILITY = 0x07
> +else ifeq ($(BR2_ARM_FPU_VFPV3D16)$(BR2_ARM_FPU_VFPV4D16),y)
> +# Set 0x03 if 32 fpu registers are used
> +DOTNET6_RUNTIME_ARM_FPU_CAPABILITY = 0x03
> +endif
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> +DOTNET6_RUNTIME_TOOLCHAIN_PREFIX = $(GNU_TARGET_NAME)
> +else
> +DOTNET6_RUNTIME_TOOLCHAIN_PREFIX = $(TOOLCHAIN_EXTERNAL_PREFIX)
> +endif
> +
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +DOTNET6_RUNTIME_BUILD_CONFIGURATION = Debug
> +else
> +DOTNET6_RUNTIME_BUILD_CONFIGURATION = Release
> +endif
> +
> +DOTNET6_RUNTIME_CMAKEARGS = --cmakeargs "-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake"" \
> +		--cmakeargs "-DCMAKE_INSTALL_RUNSTATEDIR="/run"" \
> +		--cmakeargs "-DCMAKE_CXX_COMPILER_TARGET=$(DOTNET6_RUNTIME_TOOLCHAIN_PREFIX)" \
> +		--cmakeargs "-DTOOLCHAIN=$(DOTNET6_RUNTIME_TOOLCHAIN_PREFIX)"
> +
> +# Append FPU specific defines
> +ifeq ($(BR2_arm),y)
> +		DOTNET6_RUNTIME_CMAKEARGS += \
> +		--cmakeargs "-DCLR_ARM_FPU_TYPE=$(DOTNET6_RUNTIME_ARM_FPU_TYPE)" \
> +		--cmakeargs "-DCLR_ARM_FPU_CAPABILITY=$(DOTNET6_RUNTIME_ARM_FPU_CAPABILITY)"
> +endif
> +
> +define DOTNET6_RUNTIME_BUILD_CMDS
> +	cd $(@D) && PATH=$(BR_PATH) ROOTFS_DIR=$(HOST_DIR) \
> +		$(SHELL) ./build.sh --subset clr.jit+clr.runtime+libs --verbosity diag \
> +		--arch $(DOTNET6_RUNTIME_ARCH) --gcc --cross --skipcrossarchnative \
> +		--configuration $(DOTNET6_RUNTIME_BUILD_CONFIGURATION) \
> +		$(DOTNET6_RUNTIME_CMAKEARGS)
> +endef
> +
> +define DOTNET6_RUNTIME_INSTALL_TARGET_CMDS
> +	# Copy all .dll libraries to target directory
> +	cp -Rf $(@D)/artifacts/bin/testhost/net6.0-Linux-$(DOTNET6_RUNTIME_BUILD_CONFIGURATION)-$(DOTNET6_RUNTIME_ARCH)/. \
> +		$(TARGET_DIR)/usr/share/dotnet
> +	# Remove all .dbg, .pdb, .h, .a, .xml files from target
> +	find $(TARGET_DIR)/usr/share/dotnet/ \
> +		-type f \( -name "*.dbg" -o -name "*.pdb" -o -name "*.h" \
> +		-o -name "*.a" -o -name "*.xml" \) -delete
> +
> +	# Create /etc/dotnet/install_location file to point to dotnet
> +	mkdir -p $(TARGET_DIR)/etc/dotnet
> +	echo /usr/share/dotnet > $(TARGET_DIR)/etc/dotnet/install_location
> +	# Export dotnet to PATH and libraries to LD_LIBRARY_PATH
> +	$(INSTALL) -m 0755 -D $(DOTNET6_RUNTIME_PKGDIR)/dotnet6-runtime.sh \
> +		$(TARGET_DIR)/etc/profile.d/dotnet6-runtime.sh
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/dotnet6-runtime/dotnet6-runtime.sh b/package/dotnet6-runtime/dotnet6-runtime.sh
> new file mode 100644
> index 0000000000..31dbe9a410
> --- /dev/null
> +++ b/package/dotnet6-runtime/dotnet6-runtime.sh
> @@ -0,0 +1,2 @@
> +export PATH=$PATH:/usr/share/dotnet
> +export LD_LIBRARY_PATH=/usr/share/dotnet/shared/Microsoft.NETCore.App/6.0.16


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
