Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A19CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9AE280E75;
	Sat, 23 Sep 2023 19:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9AE280E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PR3Ee6CBW9zM; Sat, 23 Sep 2023 19:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E032381518;
	Sat, 23 Sep 2023 19:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E032381518
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44EDE1BF35C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 19:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25AF041898
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 19:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25AF041898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvhXKWttRnIl for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 19:27:39 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B4C3417D2
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 19:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4C3417D2
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6E91A5FFA3;
 Sat, 23 Sep 2023 21:27:34 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55568])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Sep 2023 21:27:34 +0200
MIME-Version: 1.0
Date: Sat, 23 Sep 2023 21:27:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Yu Chien Peter Lin <peterlin@andestech.com>
In-Reply-To: <20230923153522.1903628-1-peterlin@andestech.com>
References: <20230923153522.1903628-1-peterlin@andestech.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <27236247f795d4836c8c041835c6899e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695497255;
 bh=R0rfXA2YcEIxydWjwcAltTMsnlQU4Sq4cwUtZSFllDg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=piR7o5HyYI+6gba+812wtVnmDx6haHH4D1WYAQqVfwcNoGIMgrTY5fr42bSx3d1C7
 NHJidYXIu7Hp0h7QLcoaozJp2C4M7+mi1TY8Vip634H8LijluxEMOZIZ5/0i1Ohh+R
 BQkKtWMg1pQoCCaofSRkRulh+N/SSOooEP4lb/+9YrqtNKV8HMgXQiIxd5d2fttnoa
 OmynSZX+butLvJHldgLXhr1j8jrhStRO0rfeaXV7KTuWFnp+akfhRNa9VAoYkr547C
 LWSdjvsU2L9AX/TrB0VTErWvchORR9NxPjuHa1jha6kcor3PhqfThhBRE5mWzL3gcF
 qXFvYAa30KQpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=piR7o5Hy
Subject: Re: [Buildroot] [PATCH] package/openblas: Add support for RISC-V
 architecture
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yu,

Thanks for the patch!

On 23/09/2023 17:35, Yu Chien Peter Lin wrote:
> The current version of OpenBLAS (v0.3.24) supports the
> RV64 architecture. With this update, we can install
> the library and packages such as GNU Octave on RISC-V
> platforms.

I think it would be better to record in the commit log when the RISC-V
support was added. For example:

OpenBLAS RISC-V 64bit support was added in [1] and was renamed to
"RISCV64_GENERIC" in [2]. Those commits were first included in
OpenBLAS release v0.3.13. This support can now be enabled. With this
commit, we can install the library and packages such as GNU Octave on
RISC-V platforms.

[1] 
https://github.com/OpenMathLib/OpenBLAS/commit/c167a3d6f41ed2f5680c2a72846b4c9b5d416543
[2] 
https://github.com/OpenMathLib/OpenBLAS/commit/265ab484c89d10dfff2d5df678221918d7a880e3

If you can, please send a v2 updated patch.

> This patch also adjusts the alignment for adding
> "RISCV64_GENERIC" in Config.in.

I also successfully tested this patch on branch master at
commit 20c023a, by adding in qemu_riscv64_virt_defconfig a Bootlin
toolchain and OpenBLAS with its tests. So you can also add:

Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  package/openblas/Config.in | 73 +++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 36 deletions(-)
> 
> diff --git a/package/openblas/Config.in b/package/openblas/Config.in
> index 58976e657a..26a76d29fb 100644
> --- a/package/openblas/Config.in
> +++ b/package/openblas/Config.in
> @@ -1,55 +1,56 @@
>  config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
>  	string
> -	default "P2"           if BR2_x86_pentium2
> -	default "KATMAI"       if BR2_x86_pentium3
> -	default "NORTHWOOD"    if BR2_x86_pentium4
> -	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
> -	default "BANIAS"       if BR2_x86_pentium_m
> -	default "CORE2"        if BR2_x86_core2
> -	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont || 
> BR2_x86_westmere
> -	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
> -	default "HASWELL"      if BR2_x86_core_avx2
> -	default "ATOM"         if BR2_x86_atom
> -	default "ATHLON"       if BR2_x86_athlon || BR2_x86_athlon_4
> -	default "OPTERON"      if BR2_x86_opteron
> -	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
> -	default "BARCELONA"    if BR2_x86_barcelona
> -	default "BOBCAT"       if BR2_x86_jaguar
> -	default "STEAMROLLER"  if BR2_x86_steamroller
> -	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
> -	default "POWER4"       if BR2_powerpc_power4
> -	default "POWER5"       if BR2_powerpc_power5
> -	default "POWER6"       if BR2_powerpc_power6
> -	default "POWER7"       if BR2_powerpc_power7
> -	default "POWER8"       if BR2_powerpc_power8
> -	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
> -	default "PPC970"       if BR2_powerpc_970
> -	default "PPC440"       if BR2_powerpc_440
> -	default "PPC440FP2"    if BR2_powerpc_440fp
> +	default "P2"              if BR2_x86_pentium2
> +	default "KATMAI"          if BR2_x86_pentium3
> +	default "NORTHWOOD"       if BR2_x86_pentium4
> +	default "PRESCOTT"        if BR2_x86_prescott || BR2_x86_nocona
> +	default "BANIAS"          if BR2_x86_pentium_m
> +	default "CORE2"           if BR2_x86_core2
> +	default "NEHALEM"         if BR2_x86_corei7 || BR2_x86_silvermont || 
> BR2_x86_westmere
> +	default "SANDYBRIDGE"     if BR2_x86_corei7_avx
> +	default "HASWELL"         if BR2_x86_core_avx2
> +	default "ATOM"            if BR2_x86_atom
> +	default "ATHLON"          if BR2_x86_athlon || BR2_x86_athlon_4
> +	default "OPTERON"         if BR2_x86_opteron
> +	default "OPTERON_SSE3"    if BR2_x86_opteron_sse3
> +	default "BARCELONA"       if BR2_x86_barcelona
> +	default "BOBCAT"          if BR2_x86_jaguar
> +	default "STEAMROLLER"     if BR2_x86_steamroller
> +	default "VIAC3"           if BR2_x86_c3 || BR2_x86_c32
> +	default "POWER4"          if BR2_powerpc_power4
> +	default "POWER5"          if BR2_powerpc_power5
> +	default "POWER6"          if BR2_powerpc_power6
> +	default "POWER7"          if BR2_powerpc_power7
> +	default "POWER8"          if BR2_powerpc_power8
> +	default "PPCG4"           if BR2_powerpc_7400 || BR2_powerpc_7450
> +	default "PPC970"          if BR2_powerpc_970
> +	default "PPC440"          if BR2_powerpc_440
> +	default "PPC440FP2"       if BR2_powerpc_440fp
>  	# P5600 is built with MSA support which is only available in 
> Codescape toolchains
> -	default "P5600"        if BR2_mips_p5600 && 
> BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
> -	default "SICORTEX"     if BR2_MIPS_CPU_MIPS64
> +	default "P5600"           if BR2_mips_p5600 && 
> BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
> +	default "SICORTEX"        if BR2_MIPS_CPU_MIPS64
>  	# I6400 is built with MSA support which is only available in 
> Codescape toolchains
> -	default "I6400"        if BR2_mips_i6400 && 
> BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
> +	default "I6400"           if BR2_mips_i6400 && 
> BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
>  	# OpenBLAS assumes SPARC=Sparc v9
> -	default "SPARC"        if BR2_sparc_v9
> +	default "SPARC"           if BR2_sparc_v9
>  	# Cortex-A15 always have a VFPv4
> -	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
> +	default "CORTEXA15"       if (BR2_cortex_a15 && BR2_ARM_EABIHF)
>  	# Cortex-A9 have an optional VFPv3, so we need to make sure it
>  	# is available
> -	default "CORTEXA9"     if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
> +	default "CORTEXA9"        if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
>  				   BR2_ARM_CPU_HAS_VFPV3)
> -	default "ARMV5"        if BR2_ARM_CPU_ARMV5
> +	default "ARMV5"           if BR2_ARM_CPU_ARMV5
>  	# On ARMv6, OpenBLAS assumes that a VFP is available, and
>  	# EABIhf is used
> -	default "ARMV6"        if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
> +	default "ARMV6"           if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && 
> \
>  				   BR2_ARM_CPU_HAS_VFPV2)
>  	# On ARMv7, OpenBLAS assumes that a full VFPv3+ is available
>  	# (and not the more limited D16 variant), and that EABIhf is
>  	# used.
> -	default "ARMV7"        if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && \
> +	default "ARMV7"           if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && 
> \
>  				   BR2_ARM_CPU_HAS_VFPV3)
> -	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
> +	default "ARMV8"           if BR2_aarch64 || BR2_aarch64_be
> +	default "RISCV64_GENERIC" if BR2_RISCV_64
>  	help
>  	  OpenBLAS target CPU. See TargetList.txt in the source tree for
>  	  the possible target strings. A possible value is set

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
