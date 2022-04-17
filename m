Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C92C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 06:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05EE9408C9;
	Sun, 17 Apr 2022 06:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YF_5maCRWeLg; Sun, 17 Apr 2022 06:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68EC1408BF;
	Sun, 17 Apr 2022 06:50:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 362A61BF3FC
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 06:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222A460E4B
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 06:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 849jLaqw6MkF for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 06:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ACA560A97
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 06:50:31 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso1306610fac.3
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 23:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYAFgMe1kuaTnHuCYNA5vQidyf9cWj4HbUjLD5Rkkq8=;
 b=H8v/AMSTZNtwFDBaEXmfFdAOy7NMqeUVRNGi7kHvdGXXD51sVOculGo8QFfw5skhIg
 RVXyjm4DPsdOHKLHkEVt55KSvicewwZvbSoPUf1i3MG10R7mfPxm2wTHbfzAcA/sKvXY
 e0rd/DVH3+uNEoGnhVCCdqND1mUQRYHGj0DPhdY2V8M9riLB7kIyDYqM7WRZvzbGpPF7
 aWAmlJi5GNZHBNiDAqKYt8APPb4b0OjwkkdwY5zA0CrTyPbQWChV/dvQfPWSECL2dNvF
 AB90YGKwVjDk9/8sK2tW+xsc4Ho8ujDyRCpd+UrCJPNVuW6xUWGBwz80p40F9w81ql14
 vJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYAFgMe1kuaTnHuCYNA5vQidyf9cWj4HbUjLD5Rkkq8=;
 b=Wm2N0LYhbi2haoh863mRobOX3yRha4Ad/771SKgqTX5W0oOZlElDb9UIm/bDvNYk29
 VjitmZX+QTnqukZ+Zcvq5Neg1SyO3tdr5wHpZ43bg3MZBP5JV/nBnYYALkXuB3PddTHj
 pNGFDDEvaYGysIfkUa8d1S+HL7xfG01omgjeu+2zA276PwR0c4AFgeLA3GEwtijJgiEa
 RMWlisabuv3u6YRh871F/H0uHcbLlD7lDhl/Iwx5Z2qUipMX2SRQLjIbXjFNF/zpdand
 yczh0HltulwvLqN8SnRA3rLYm7DUjAvk3yfUKzZzCH1sSBVBXwARyzGRI0XyVY4leSqT
 V9zw==
X-Gm-Message-State: AOAM533+bQckehlsbkX264GG6cqmcG2zji+X8WHxLN1HytpONgBQ6jA4
 fM9jbh/VU8yhX5pBzxnX8l+2OTqt+U/Qfn2L9hI=
X-Google-Smtp-Source: ABdhPJx1UoemHcAYOZ1C6jolcQej7ndrXMnhzfhjSeFWvjqi5kVwyIvhtRe5xHf2vjmtCrLh7/kcL6Dt0B/l/WtJa58=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr3869687oaa.200.1650178230040; Sat, 16
 Apr 2022 23:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220409020719.3126086-1-james.hilliard1@gmail.com>
 <20220413225147.48bd5442@windsurf>
In-Reply-To: <20220413225147.48bd5442@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 17 Apr 2022 00:50:19 -0600
Message-ID: <CADvTj4rHaz8pVx=mz2Cs4K72D_9ZoF3j6CBp4j=v0xbA5t_H8w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: disable 2.32 on
 unuspported FLAT platforms
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 13, 2022 at 2:51 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Fri,  8 Apr 2022 20:07:19 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > These architectures are unsupported in config.bfd:
> > https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/config.bfd;h=0e1ddb659c3ab7160aab0a7c173b85052f870e65;hb=a9d9a104dde6a749f40ce5c4576a0042a7d52d1f
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/332/33277d4687ca9a04dbfb02c50e5755ff9e55b0b4
> >  - http://autobuild.buildroot.net/results/5e3/5e34d11393e14fc36fd6e72b69679bc4fd1e3798
> >  - http://autobuild.buildroot.net/results/63d/63d01d33ae30f86b63b9f42a9fea116f2f3e9005
> >  - http://autobuild.buildroot.net/results/45b/45bc90fd2dde7bb201d7f999db1a8024cf889a06
> >  - http://autobuild.buildroot.net/results/d1b/d1b1dfe449f82944bd48215da3cdffd05797e2e9
> >  - http://autobuild.buildroot.net/results/a3e/a3eb1ff6bf6357242ec7993db63e57d4afeccc7b
> >  - http://autobuild.buildroot.net/results/f4d/f4d52cabee61ee0f234b03c1ec1bd02e85e7bb20
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/binutils/Config.in.host | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> > index ea1f020989..e1c59bfbd0 100644
> > --- a/package/binutils/Config.in.host
> > +++ b/package/binutils/Config.in.host
> > @@ -15,6 +15,13 @@ choice
> >  config BR2_BINUTILS_VERSION_2_32_X
> >       bool "binutils 2.32"
> >       depends on !BR2_csky
> > +     depends on !(BR2_aarch64 && BR2_BINFMT_FLAT)
> > +     depends on !(BR2_aarch64_be && BR2_BINFMT_FLAT)
> > +     depends on !(BR2_sh2a && BR2_BINFMT_FLAT)
> > +     depends on !(BR2_sh4 && BR2_BINFMT_FLAT)
> > +     depends on !(BR2_sh4a && BR2_BINFMT_FLAT)
> > +     depends on !(BR2_sh4aeb && BR2_BINFMT_FLAT)
> > +     depends on !(BR2_sh4eb && BR2_BINFMT_FLAT)
>
> I'm not sure that how we want to handle this. Indeed, even with newer
> binutils versions, I really doubt supporting aarch64 with the FLAT
> binary format makes a lot of sense.

Well our newer binutils versions do already have FLAT disabled
entirely by setting:
depends on !BR2_BINFMT_FLAT

>
> As far as I'm aware, there's currently no practical use-case for Linux
> noMMU on aarch64 and SH4, so I would simply disallow that. So on ARM, I
> would only allow the MMU to be disabled on ARMv7-M, and on SuperH, for
> SH2A. I.e something like the below patch.
>
> Of course, that leaves the case of BR2_sh2a. But if binutils
> 2.35/2.36/2.37 are broken for the FLAT format (which is why they are
> disabled), and 2.32 is disabled for SH2A/FLAT, then there's nothing
> left available for SH2A/FLAT

Hmm, my assumption was that even though FLAT may not be supported
by the buildroot toolchain it may be possible some external toolchains
could have support for them, so I figured best just disable known invalid
options here for buildroot toolchain binutils.

> Except that
> package/binutils/Config.in.host is wrong in disabling 2.35/2.36/2.37
> for all FLAT configs: the bug is only related to ARM.

Hmm, so maybe this set of depends plus an arm exclusion is needed
for newer binutils?

>
> However, I feel strange that sh2a/FLAT was not supported back in
> binutils 2.32. sh2a/FLAT has been around for a very long time. In fact
> what happens is that we have a patch to allow sh2a as an architecture
> name: package/binutils/2.32/0001-sh-conf.patch. But that patch is
> probably no longer sufficient, and some adjustements are also needed in
> bfd/config.bfd.

So, that patch doesn't seem to add uclinux as a supported target,
which seems to be required for BR2_BINFMT_FLAT builds based on:
https://github.com/buildroot/buildroot/blob/2022.02.1/package/Makefile.in#L44-L45
https://github.com/buildroot/buildroot/blob/2022.02.1/package/Makefile.in#L40
https://github.com/buildroot/buildroot/blob/2022.02.1/package/binutils/binutils.mk#L83
https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/config.bfd;h=0e1ddb659c3ab7160aab0a7c173b85052f870e65;hb=a9d9a104dde6a749f40ce5c4576a0042a7d52d1f#l1243

The failures from what I can tell here are due to the lack of a uclinux
target for sh2a in bfd/config.bfd.

>
> Bottom line: there is more work than just this proposal, which simply
> papers over the problem without really fixing it.

Yeah, that's probably a bit outside my area of expertise, I was just
adding these dependencies by tracing the configure failure conditions.

I'm not really familiar with no-mmu builds in general so wouldn't really
know what's correct for the architecture mmu settings.

>
> diff --git a/arch/Config.in b/arch/Config.in
> index 98b0e40d51..e51ef60f40 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -228,7 +228,6 @@ config BR2_s390x
>
>  config BR2_sh
>         bool "SuperH"
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         help
>           SuperH (or SH) is a 32-bit reduced instruction set computer
>           (RISC) instruction set architecture (ISA) developed by
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 85040ac89f..16f053fba3 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -73,21 +73,27 @@ config BR2_ARM_CPU_HAS_THUMB2
>
>  config BR2_ARM_CPU_ARMV4
>         bool
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>
>  config BR2_ARM_CPU_ARMV5
>         bool
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>
>  config BR2_ARM_CPU_ARMV6
>         bool
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>
>  config BR2_ARM_CPU_ARMV7A
>         bool
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>
>  config BR2_ARM_CPU_ARMV7M
>         bool
> +       select BR2_ARCH_HAS_MMU_OPTIONAL
>
>  config BR2_ARM_CPU_ARMV8A
>         bool
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>
>  choice
>         prompt "Target Architecture Variant"
> @@ -103,23 +109,19 @@ config BR2_arm920t
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV4
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_arm922t
>         bool "arm922t"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV4
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_fa526
>         bool "fa526/626"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_ARMV4
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_strongarm
>         bool "strongarm sa110/sa1100"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_ARMV4
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>
>  comment "armv5 cores"
>  config BR2_arm926t
> @@ -128,18 +130,15 @@ config BR2_arm926t
>         select BR2_ARM_CPU_MAYBE_HAS_VFPV2
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV5
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_iwmmxt
>         bool "iwmmxt"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_ARMV5
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_xscale
>         bool "xscale"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV5
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>
>  comment "armv6 cores"
>  config BR2_arm1136j_s
> @@ -147,34 +146,29 @@ config BR2_arm1136j_s
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV6
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_arm1136jf_s
>         bool "arm1136jf-s"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_VFPV2
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV6
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_arm1176jz_s
>         bool "arm1176jz-s"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV6
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_arm1176jzf_s
>         bool "arm1176jzf-s"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_VFPV2
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV6
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_arm11mpcore
>         bool "mpcore"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_MAYBE_HAS_VFPV2
>         select BR2_ARM_CPU_HAS_THUMB
>         select BR2_ARM_CPU_ARMV6
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>
>  comment "armv7a cores"
>  config BR2_cortex_a5
> @@ -184,7 +178,6 @@ config BR2_cortex_a5
>         select BR2_ARM_CPU_MAYBE_HAS_VFPV4
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a7
>         bool "cortex-A7"
>         select BR2_ARM_CPU_HAS_ARM
> @@ -192,7 +185,6 @@ config BR2_cortex_a7
>         select BR2_ARM_CPU_HAS_VFPV4
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a8
>         bool "cortex-A8"
>         select BR2_ARM_CPU_HAS_ARM
> @@ -200,7 +192,6 @@ config BR2_cortex_a8
>         select BR2_ARM_CPU_HAS_VFPV3
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a9
>         bool "cortex-A9"
>         select BR2_ARM_CPU_HAS_ARM
> @@ -208,7 +199,6 @@ config BR2_cortex_a9
>         select BR2_ARM_CPU_MAYBE_HAS_VFPV3
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a12
>         bool "cortex-A12"
>         select BR2_ARM_CPU_HAS_ARM
> @@ -216,7 +206,6 @@ config BR2_cortex_a12
>         select BR2_ARM_CPU_HAS_VFPV4
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a15
>         bool "cortex-A15"
>         select BR2_ARM_CPU_HAS_ARM
> @@ -224,7 +213,6 @@ config BR2_cortex_a15
>         select BR2_ARM_CPU_HAS_VFPV4
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a15_a7
>         bool "cortex-A15/A7 big.LITTLE"
>         select BR2_ARM_CPU_HAS_ARM
> @@ -232,7 +220,6 @@ config BR2_cortex_a15_a7
>         select BR2_ARM_CPU_HAS_VFPV4
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
>  config BR2_cortex_a17
>         bool "cortex-A17"
> @@ -241,7 +228,6 @@ config BR2_cortex_a17
>         select BR2_ARM_CPU_HAS_VFPV4
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  config BR2_cortex_a17_a7
>         bool "cortex-A17/A7 big.LITTLE"
> @@ -250,14 +236,12 @@ config BR2_cortex_a17_a7
>         select BR2_ARM_CPU_HAS_VFPV4
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  config BR2_pj4
>         bool "pj4"
>         select BR2_ARM_CPU_HAS_ARM
>         select BR2_ARM_CPU_HAS_VFPV3
>         select BR2_ARM_CPU_ARMV7A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>
>  comment "armv7m cores"
>  config BR2_cortex_m3
> @@ -286,7 +270,6 @@ config BR2_cortex_a32
>         select BR2_ARM_CPU_HAS_THUMB2
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  config BR2_cortex_a35
>         bool "cortex-A35"
> @@ -295,7 +278,6 @@ config BR2_cortex_a35
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  config BR2_cortex_a53
>         bool "cortex-A53"
> @@ -304,7 +286,6 @@ config BR2_cortex_a53
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a57
>         bool "cortex-A57"
>         select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
> @@ -312,7 +293,6 @@ config BR2_cortex_a57
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_cortex_a57_a53
>         bool "cortex-A57/A53 big.LITTLE"
>         select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
> @@ -320,7 +300,6 @@ config BR2_cortex_a57_a53
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  config BR2_cortex_a72
>         bool "cortex-A72"
> @@ -329,7 +308,6 @@ config BR2_cortex_a72
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  config BR2_cortex_a72_a53
>         bool "cortex-A72/A53 big.LITTLE"
> @@ -338,7 +316,6 @@ config BR2_cortex_a72_a53
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  config BR2_cortex_a73
>         bool "cortex-A73"
> @@ -347,7 +324,6 @@ config BR2_cortex_a73
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_cortex_a73_a35
>         bool "cortex-A73/A35 big.LITTLE"
> @@ -356,7 +332,6 @@ config BR2_cortex_a73_a35
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_cortex_a73_a53
>         bool "cortex-A73/A53 big.LITTLE"
> @@ -365,14 +340,12 @@ config BR2_cortex_a73_a53
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_emag
>         bool "emag"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>  config BR2_exynos_m1
>         bool "exynos-m1"
> @@ -381,63 +354,54 @@ config BR2_exynos_m1
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  config BR2_falkor
>         bool "falkor"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_phecda
>         bool "phecda"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>  config BR2_qdf24xx
>         bool "qdf24xx"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  config BR2_thunderx
>         bool "thunderx (aka octeontx)"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  config BR2_thunderxt81
>         bool "thunderxt81 (aka octeontx81)"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_thunderxt83
>         bool "thunderxt83 (aka octeontx83)"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_thunderxt88
>         bool "thunderxt88"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_thunderxt88p1
>         bool "thunderxt88p1"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_xgene1
>         bool "xgene1"
> @@ -446,7 +410,6 @@ config BR2_xgene1
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>
>  comment "armv8.1a cores"
> @@ -455,21 +418,18 @@ config BR2_thunderx2t99
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_thunderx2t99p1
>         bool "thunderx2t99p1"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  config BR2_vulcan
>         bool "vulcan"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>
>  comment "armv8.2a cores"
> @@ -478,21 +438,18 @@ config BR2_cortex_a55
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  config BR2_cortex_a75
>         bool "cortex-A75"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  config BR2_cortex_a75_a55
>         bool "cortex-A75/A55 big.LITTLE"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  config BR2_cortex_a76
>         bool "cortex-A76"
> @@ -501,7 +458,6 @@ config BR2_cortex_a76
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>  config BR2_cortex_a76_a55
>         bool "cortex-A76/A55 big.LITTLE"
> @@ -510,7 +466,6 @@ config BR2_cortex_a76_a55
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>  config BR2_neoverse_n1
>         bool "neoverse-N1 (aka ares)"
> @@ -519,14 +474,12 @@ config BR2_neoverse_n1
>         select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>  config BR2_tsv110
>         bool "tsv110"
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
>
>  comment "armv8.4a cores"
> @@ -535,7 +488,6 @@ config BR2_saphira
>         depends on BR2_ARCH_IS_64
>         select BR2_ARM_CPU_HAS_FP_ARMV8
>         select BR2_ARM_CPU_ARMV8A
> -       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
>  endchoice
>
> diff --git a/arch/Config.in.sh b/arch/Config.in.sh
> index c1ba449dd5..94b034c158 100644
> --- a/arch/Config.in.sh
> +++ b/arch/Config.in.sh
> @@ -7,14 +7,19 @@ choice
>
>  config BR2_sh2a
>         bool "sh2a (SH2A big endian)"
> +       select BR2_ARCH_HAS_MMU_OPTIONAL
>  config BR2_sh4
>         bool "sh4 (SH4 little endian)"
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>  config BR2_sh4eb
>         bool "sh4eb (SH4 big endian)"
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>  config BR2_sh4a
>         bool "sh4a (SH4A little endian)"
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>  config BR2_sh4aeb
>         bool "sh4aeb (SH4A big endian)"
> +       select BR2_ARCH_HAS_MMU_MANDATORY
>  endchoice
>
>  config BR2_ARCH
>
>
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
