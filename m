Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E269CCE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 08:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBAE81F3F;
	Sun, 24 Sep 2023 08:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CBAE81F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ngik3N1gZOwH; Sun, 24 Sep 2023 08:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993CF81F91;
	Sun, 24 Sep 2023 08:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993CF81F91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD8FC1BF408
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 08:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6AA960B9A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 08:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AA960B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yITIvCDbFEJk for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 08:43:35 +0000 (UTC)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EB6B60B1C
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 08:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB6B60B1C
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 38O8hSmN086483;
 Sun, 24 Sep 2023 16:43:28 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Sun, 24 Sep 2023 16:43:25 +0800
Date: Sun, 24 Sep 2023 16:43:20 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZQ_2qDPzM5Rtdc18@APC323>
References: <20230923153522.1903628-1-peterlin@andestech.com>
 <27236247f795d4836c8c041835c6899e@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27236247f795d4836c8c041835c6899e@free.fr>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38O8hSmN086483
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sat, Sep 23, 2023 at 09:27:34PM +0200, Julien Olivain wrote:
> Hi Yu,
> 
> Thanks for the patch!
> 
> On 23/09/2023 17:35, Yu Chien Peter Lin wrote:
> > The current version of OpenBLAS (v0.3.24) supports the
> > RV64 architecture. With this update, we can install
> > the library and packages such as GNU Octave on RISC-V
> > platforms.
> 
> I think it would be better to record in the commit log when the RISC-V
> support was added. For example:
> 
> OpenBLAS RISC-V 64bit support was added in [1] and was renamed to
> "RISCV64_GENERIC" in [2]. Those commits were first included in
> OpenBLAS release v0.3.13. This support can now be enabled. With this
> commit, we can install the library and packages such as GNU Octave on
> RISC-V platforms.
> 
> [1] https://github.com/OpenMathLib/OpenBLAS/commit/c167a3d6f41ed2f5680c2a72846b4c9b5d416543
> [2] https://github.com/OpenMathLib/OpenBLAS/commit/265ab484c89d10dfff2d5df678221918d7a880e3
> 
> If you can, please send a v2 updated patch.

Sure, no problem. Thank you for locating the commits for me.

Best regards,
Peter Lin

> > This patch also adjusts the alignment for adding
> > "RISCV64_GENERIC" in Config.in.
> 
> I also successfully tested this patch on branch master at
> commit 20c023a, by adding in qemu_riscv64_virt_defconfig a Bootlin
> toolchain and OpenBLAS with its tests. So you can also add:
> 
> Reviewed-by: Julien Olivain <ju.o@free.fr>
> Tested-by: Julien Olivain <ju.o@free.fr>
> 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> >  package/openblas/Config.in | 73 +++++++++++++++++++-------------------
> >  1 file changed, 37 insertions(+), 36 deletions(-)
> > 
> > diff --git a/package/openblas/Config.in b/package/openblas/Config.in
> > index 58976e657a..26a76d29fb 100644
> > --- a/package/openblas/Config.in
> > +++ b/package/openblas/Config.in
> > @@ -1,55 +1,56 @@
> >  config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
> >  	string
> > -	default "P2"           if BR2_x86_pentium2
> > -	default "KATMAI"       if BR2_x86_pentium3
> > -	default "NORTHWOOD"    if BR2_x86_pentium4
> > -	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
> > -	default "BANIAS"       if BR2_x86_pentium_m
> > -	default "CORE2"        if BR2_x86_core2
> > -	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont ||
> > BR2_x86_westmere
> > -	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
> > -	default "HASWELL"      if BR2_x86_core_avx2
> > -	default "ATOM"         if BR2_x86_atom
> > -	default "ATHLON"       if BR2_x86_athlon || BR2_x86_athlon_4
> > -	default "OPTERON"      if BR2_x86_opteron
> > -	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
> > -	default "BARCELONA"    if BR2_x86_barcelona
> > -	default "BOBCAT"       if BR2_x86_jaguar
> > -	default "STEAMROLLER"  if BR2_x86_steamroller
> > -	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
> > -	default "POWER4"       if BR2_powerpc_power4
> > -	default "POWER5"       if BR2_powerpc_power5
> > -	default "POWER6"       if BR2_powerpc_power6
> > -	default "POWER7"       if BR2_powerpc_power7
> > -	default "POWER8"       if BR2_powerpc_power8
> > -	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
> > -	default "PPC970"       if BR2_powerpc_970
> > -	default "PPC440"       if BR2_powerpc_440
> > -	default "PPC440FP2"    if BR2_powerpc_440fp
> > +	default "P2"              if BR2_x86_pentium2
> > +	default "KATMAI"          if BR2_x86_pentium3
> > +	default "NORTHWOOD"       if BR2_x86_pentium4
> > +	default "PRESCOTT"        if BR2_x86_prescott || BR2_x86_nocona
> > +	default "BANIAS"          if BR2_x86_pentium_m
> > +	default "CORE2"           if BR2_x86_core2
> > +	default "NEHALEM"         if BR2_x86_corei7 || BR2_x86_silvermont ||
> > BR2_x86_westmere
> > +	default "SANDYBRIDGE"     if BR2_x86_corei7_avx
> > +	default "HASWELL"         if BR2_x86_core_avx2
> > +	default "ATOM"            if BR2_x86_atom
> > +	default "ATHLON"          if BR2_x86_athlon || BR2_x86_athlon_4
> > +	default "OPTERON"         if BR2_x86_opteron
> > +	default "OPTERON_SSE3"    if BR2_x86_opteron_sse3
> > +	default "BARCELONA"       if BR2_x86_barcelona
> > +	default "BOBCAT"          if BR2_x86_jaguar
> > +	default "STEAMROLLER"     if BR2_x86_steamroller
> > +	default "VIAC3"           if BR2_x86_c3 || BR2_x86_c32
> > +	default "POWER4"          if BR2_powerpc_power4
> > +	default "POWER5"          if BR2_powerpc_power5
> > +	default "POWER6"          if BR2_powerpc_power6
> > +	default "POWER7"          if BR2_powerpc_power7
> > +	default "POWER8"          if BR2_powerpc_power8
> > +	default "PPCG4"           if BR2_powerpc_7400 || BR2_powerpc_7450
> > +	default "PPC970"          if BR2_powerpc_970
> > +	default "PPC440"          if BR2_powerpc_440
> > +	default "PPC440FP2"       if BR2_powerpc_440fp
> >  	# P5600 is built with MSA support which is only available in Codescape
> > toolchains
> > -	default "P5600"        if BR2_mips_p5600 &&
> > BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
> > -	default "SICORTEX"     if BR2_MIPS_CPU_MIPS64
> > +	default "P5600"           if BR2_mips_p5600 &&
> > BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
> > +	default "SICORTEX"        if BR2_MIPS_CPU_MIPS64
> >  	# I6400 is built with MSA support which is only available in Codescape
> > toolchains
> > -	default "I6400"        if BR2_mips_i6400 &&
> > BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
> > +	default "I6400"           if BR2_mips_i6400 &&
> > BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
> >  	# OpenBLAS assumes SPARC=Sparc v9
> > -	default "SPARC"        if BR2_sparc_v9
> > +	default "SPARC"           if BR2_sparc_v9
> >  	# Cortex-A15 always have a VFPv4
> > -	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
> > +	default "CORTEXA15"       if (BR2_cortex_a15 && BR2_ARM_EABIHF)
> >  	# Cortex-A9 have an optional VFPv3, so we need to make sure it
> >  	# is available
> > -	default "CORTEXA9"     if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
> > +	default "CORTEXA9"        if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
> >  				   BR2_ARM_CPU_HAS_VFPV3)
> > -	default "ARMV5"        if BR2_ARM_CPU_ARMV5
> > +	default "ARMV5"           if BR2_ARM_CPU_ARMV5
> >  	# On ARMv6, OpenBLAS assumes that a VFP is available, and
> >  	# EABIhf is used
> > -	default "ARMV6"        if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
> > +	default "ARMV6"           if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
> >  				   BR2_ARM_CPU_HAS_VFPV2)
> >  	# On ARMv7, OpenBLAS assumes that a full VFPv3+ is available
> >  	# (and not the more limited D16 variant), and that EABIhf is
> >  	# used.
> > -	default "ARMV7"        if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && \
> > +	default "ARMV7"           if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF &&
> > \
> >  				   BR2_ARM_CPU_HAS_VFPV3)
> > -	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
> > +	default "ARMV8"           if BR2_aarch64 || BR2_aarch64_be
> > +	default "RISCV64_GENERIC" if BR2_RISCV_64
> >  	help
> >  	  OpenBLAS target CPU. See TargetList.txt in the source tree for
> >  	  the possible target strings. A possible value is set
> 
> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
