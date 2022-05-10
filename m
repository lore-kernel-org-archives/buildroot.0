Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55C9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56D9140390;
	Tue, 10 May 2022 19:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRqMJdfZTrMm; Tue, 10 May 2022 19:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F44C40236;
	Tue, 10 May 2022 19:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AA0F1BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CB3C4171C
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFlWMobxARmc for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:56:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A712441716
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:56:02 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so267308fac.9
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8IRazDByO1Ibm+6nOyFSCi+4VvyJBFs/gPNrI/xr3Oo=;
 b=jwyxpiZph8CEfNAhSgFYiCXVJ5ayy4tP6CqH0+5h5BhcDLCePF8ZjChj2fPpkzqgW8
 97KIV4fUcmjHMosYN7zXYCUIKxFB1ZWNVugPgS5Z2igD1ZfOkzLp/Fe65OYmWLYFREwZ
 Wcvp2F2fI1bnWhyBjZ9QCLRwHhaQelvfyFt//oitjYPOT1bTk/69PmdmxXTIiddyt9zf
 6eH2Atgy+pr0Sl0VVujS2J6VHklUBhZrdHmmutip6mVcgbELyC4zF/2jkbYQRhsHuPc3
 glTusmvfQgWYnQMs1eferSUlmBrMIV6TfkS2SO50bOiT2x0Ta6vHflGFcU1nnR4qINMr
 8LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8IRazDByO1Ibm+6nOyFSCi+4VvyJBFs/gPNrI/xr3Oo=;
 b=h38HtKR3DVtZFATx+EIO0EUCP6w8okLbIfwrF/KKlRThzuJJbp6lzpLLONMLybisqb
 T3Y03fHU3uIgRoKim7XIWZ4UjCuWeY5W1rIx9bNNKs853Vv7bZBn9+94a7m2gWxAUP9i
 3Z8ygTnDQEjJTjRGYzbo9fHwilvSJzaaM+hY3LLWGh8ACsW6bbYQGvD6qG9VTHBN1xm8
 QKxsr0lMWwz0bItIYnp5uLgydN7bT81a4brO9KDLrunl0W5SCFp0B0YM6OVlB4mKqUmL
 bB+P635aErqTZy8+0zz+tMNg5xArBqihW5xAZwL8wsvCFLCPWrlJ8Tpci1bgykSMt1cg
 C/4g==
X-Gm-Message-State: AOAM532G8sQtQj+AxLO6tYdCpPmUfwLsNYnKwrhuz5aVhutAJMyf3Nza
 8uWWAkpcDhtXsX9knW/rybZBZW08k03CrGtUsE/yxfL8ydU=
X-Google-Smtp-Source: ABdhPJzSbpTbvcsWdYaOgkHXSO9hzMKIWMCJfHqhy9QrvPEZTKNqg5NmcO9A32WD0QkfhaGJHg+ukG3Jv4QSv8u8y3o=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr978928oaa.200.1652212561616; Tue, 10
 May 2022 12:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220506054651.2853406-1-james.hilliard1@gmail.com>
 <daca77a5-b780-3675-e43f-820f03bc9cda@mind.be>
In-Reply-To: <daca77a5-b780-3675-e43f-820f03bc9cda@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 May 2022 13:55:50 -0600
Message-ID: <CADvTj4ois8m4-w4=1AK0+5934R4BFhj=3=u8TUtWa_uRu+U=dg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] toolchain-buildroot: only allow
 BR2_STATIC_LIBS on supported archs
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 10, 2022 at 1:32 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 06/05/2022 07:46, James Hilliard wrote:
> > It is currently possible to select BR2_STATIC_LIBS while
> > BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
> > toolchains that support BR2_STATIC_LIBS for the selected architecture.
>
>   Good catch!
>
> >
> > Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS so that we can
> > disable the selection of BR2_STATIC_LIBS when using an unsupported
> > architecture.
> >
> > Fixes:
> >   - http://autobuild.buildroot.net/results/4da/4da59af8193376ec893321c4c2aaf1d25598502d
> >   - http://autobuild.buildroot.net/results/195/1950348218a4f097f078d158977c13f8b0a97d6e
> >   - http://autobuild.buildroot.net/results/2f0/2f03f2be32ad9898a990f6f0264d8c8d51991eb1
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   Config.in                               |   2 +
> >   toolchain/toolchain-buildroot/Config.in | 119 ++++++++++++++++++------
> >   2 files changed, 90 insertions(+), 31 deletions(-)
> >
> > diff --git a/Config.in b/Config.in
> > index f0cd6f48ed..5daca3adce 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -601,6 +601,8 @@ choice
> >
> >   config BR2_STATIC_LIBS
> >       bool "static only"
> > +     depends on !BR2_TOOLCHAIN_BUILDROOT || \
> > +             BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS
>
>   However, I don't think this is the right approach.
>
>   Instead, I think there should be a blind option
> BR2_TOOLCHAIN_STATIC_LIBS_SUPPORTS that gets selected by toolchain that do
> support static libs (i.e. using uClibc or musl), and remove all the 'depends on
> !STATIC' from the toolchain options.

I'm not sure that's the best way to handle this, I think normally
users will want to
first select their build type(ie BR2_STATIC_LIBS) and then select the toolchain
out of the ones that support their build type, this is just needed for
preventing
users from selecting a build type that does not have a valid toolchain for some
architectures.

In menuconfig "build options" is above toolchain selection and the
BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS option
is mostly determined by the "target options" which is above "build options".

I was trying to avoid disabling BR2_STATIC_LIBS purely based on the specific
toolchain selected.

>
>   Regards,
>   Arnout
>
>
> >       help
> >         Build and use only static libraries. No shared libraries will
> >         be installed on the target. This potentially increases your
> > diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> > index be89f68ab5..287253b11f 100644
> > --- a/toolchain/toolchain-buildroot/Config.in
> > +++ b/toolchain/toolchain-buildroot/Config.in
> > @@ -20,6 +20,91 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
> >
> >         If you're not sure, just leave the default "buildroot" value.
> >
> > +config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
> > +     bool
> > +     default y if BR2_aarch64
> > +     default y if BR2_aarch64_be
> > +     default y if BR2_arcle
> > +     default y if BR2_arceb
> > +     default y if BR2_arm
> > +     default y if BR2_armeb
> > +     default y if BR2_i386
> > +     default y if BR2_m68k
> > +     default y if BR2_microblaze
> > +     default y if BR2_mips
> > +     default y if BR2_mipsel
> > +     default y if BR2_mips64
> > +     default y if BR2_mips64el
> > +     default y if BR2_or1k
> > +     default y if BR2_powerpc
> > +     default y if BR2_RISCV_64
> > +     default y if BR2_sh4
> > +     default y if BR2_sh4eb
> > +     default y if BR2_sparc
> > +     default y if BR2_xtensa
> > +     default y if BR2_x86_64
> > +
> > +config BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
> > +     bool
> > +     default y if BR2_arm
> > +     default y if BR2_armeb
> > +     default y if BR2_aarch64
> > +     default y if BR2_aarch64_be
> > +     default y if BR2_i386
> > +     default y if BR2_mips
> > +     default y if BR2_mipsel
> > +     default y if BR2_mips64
> > +     default y if BR2_mips64el
> > +     default y if BR2_powerpc
> > +     default y if BR2_powerpc64
> > +     default y if BR2_powerpc64le
> > +     default y if BR2_riscv
> > +     default y if BR2_s390x
> > +     default y if BR2_sh
> > +     default y if BR2_sparc64
> > +     default y if BR2_x86_64
> > +     default y if BR2_microblaze
> > +     default y if BR2_nios2
> > +     default y if BR2_arc && BR2_ARC_ATOMIC_EXT
> > +     default y if BR2_csky
> > +     depends on BR2_USE_MMU
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
> > +     depends on !BR2_powerpc_SPE
> > +     depends on BR2_RISCV_ISA_RVA || !BR2_riscv
> > +
> > +config BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
> > +     bool
> > +     default y if BR2_aarch64
> > +     default y if BR2_arm
> > +     default y if BR2_armeb
> > +     default y if BR2_i386
> > +     default y if BR2_microblaze
> > +     default y if BR2_mips
> > +     default y if BR2_mipsel
> > +     default y if BR2_mips64
> > +     default y if BR2_mips64el
> > +     default y if BR2_or1k
> > +     default y if BR2_powerpc
> > +     default y if BR2_powerpc64
> > +     default y if BR2_powerpc64le
> > +     default y if BR2_RISCV_64
> > +     default y if BR2_sh
> > +     default y if BR2_x86_64
> > +     depends on !BR2_powerpc_SPE # not supported, build breaks
> > +     depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
> > +     # sh2 nommu is supported by musl, but we don't have support
> > +     # for it in Buildroot.
> > +     depends on BR2_USE_MMU
> > +
> > +config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_ARCH_SUPPORTS
> > +     bool
> > +     default y if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
> > +     default y if BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
> > +
> >   choice
> >       prompt "C library"
> >       default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> > @@ -27,13 +112,7 @@ choice
> >
> >   config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> >       bool "uClibc-ng"
> > -     depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
> > -                BR2_arm     || BR2_armeb    || \
> > -                BR2_i386    || BR2_m68k   || BR2_microblaze || \
> > -                BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> > -                BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
> > -                BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
> > -                BR2_x86_64
> > +     depends on BR2_TOOLCHAIN_BUILDROOT_UCLIBC_ARCH_SUPPORTS
> >       select BR2_TOOLCHAIN_USES_UCLIBC
> >       help
> >         This option selects uClibc-ng as the C library for the
> > @@ -43,22 +122,8 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> >
> >   config BR2_TOOLCHAIN_BUILDROOT_GLIBC
> >       bool "glibc"
> > -     depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
> > -                BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
> > -                BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
> > -                BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
> > -                BR2_riscv       || BR2_s390x      || BR2_sh          || \
> > -                BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
> > -                BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
> > -     depends on BR2_USE_MMU
> > +     depends on BR2_TOOLCHAIN_BUILDROOT_GLIBC_ARCH_SUPPORTS
> >       depends on !BR2_STATIC_LIBS
> > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
> > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
> > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
> > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
> > -     depends on !BR2_powerpc_SPE
> > -     depends on BR2_RISCV_ISA_RVA || !BR2_riscv
> >       select BR2_TOOLCHAIN_USES_GLIBC
> >       help
> >         This option selects glibc as the C library for the
> > @@ -82,15 +147,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
> >
> >   config BR2_TOOLCHAIN_BUILDROOT_MUSL
> >       bool "musl"
> > -     depends on BR2_aarch64     || BR2_arm   || BR2_armeb   || BR2_i386 || \
> > -                BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
> > -                BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
> > -                BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
> > -     depends on !BR2_powerpc_SPE # not supported, build breaks
> > -     depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
> > -     # sh2 nommu is supported by musl, but we don't have support
> > -     # for it in Buildroot.
> > -     depends on BR2_USE_MMU
> > +     depends on BR2_TOOLCHAIN_BUILDROOT_MUSL_ARCH_SUPPORTS
> >       select BR2_TOOLCHAIN_USES_MUSL
> >       help
> >         This option selects musl as the C library for the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
