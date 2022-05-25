Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E871C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 07:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E33B640E43;
	Wed, 25 May 2022 07:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KhbczZYeiwr; Wed, 25 May 2022 07:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B783840DC2;
	Wed, 25 May 2022 07:37:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B75191BF418
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 07:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A001A409EF
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 07:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sn91d1nrHlfP for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 07:37:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A59F409DD
 for <buildroot@buildroot.org>; Wed, 25 May 2022 07:37:09 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id q8so24091129oif.13
 for <buildroot@buildroot.org>; Wed, 25 May 2022 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m2zMxc5pDIv8tbarPLvaKTQ2a2LpfVUoAB3D+n6FXoE=;
 b=Dy+92IFzVXM6CKhxyr3dbSDIxF4QNUr7fcHoTIQp1FNDIBzDqmQuTCOCR5tYuQ41Nf
 HzuywvDEZxZ5kbxnDIHP2saAN8fFGRZkZJEbpe7cuhWwJqrhC+qG7fivpg8qjsg87C4U
 04DvZ/lzto0m3yRGVFnGnTK/xsYyqA5V/M5yETYk3+sKdfgM88NY2IlfauAq+7a0bXYB
 TqvSYeqxtpRs0X6kC16J9/AxoASKFjvnK2BK3tHo2YHd1RYFIxdsmhcAWjmvHevfrHK/
 IyCWCeYAv33uhK9ZTOYN+s4P8QSh7owTCvVBN/OFa6QiA1WgzIj+7WJ90R56irX0NETx
 4w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m2zMxc5pDIv8tbarPLvaKTQ2a2LpfVUoAB3D+n6FXoE=;
 b=OuFuEXT8iRW6sOc+/ETNPntqjFmPh40EwQZOtYSLd1mLto2n4m+bsUkZkwaLPGSzuj
 ke9vKh5mx2wgn/SE7Dalj0SysCTABh7r+TcS5IQJttyfl6KtnPS6kYVeRSnma2TReRbT
 /uKad9jsf2pECNTEzGff4y0CtkcTcSSHCejnwR2xagh5OSmSblYuLHu8qryXGtEgfsgW
 NcVCbaXzEVB9rW5dhcGbve+H+D6gbDtZ2uMPTbQv48s54eMuv/szywOhLnhvv5Qp+ghA
 x/q58bHJ/MIa2cyZmWyiB55ZdHTt4KnYmx5Cqyu6IBsZU4KLEQUAgOlKf8PFuIyHmMTU
 Xz8Q==
X-Gm-Message-State: AOAM533CCtFUucoxZSMtr7GMRFgMjPwGm+Zx2A0Y+9hCgMUZfY+AluSU
 DPA+uU1gLE9fuDpMzoYV/l+5UjUk2cTQ7kw6FBm332ZS
X-Google-Smtp-Source: ABdhPJy2jR1trbhJAkK1KPI2ElDU4NZ6uoMfe+/fTzTGLMqY+DAuzArAW+P+/8inJj8eUcJ03HhKISbSk84whrvxR/M=
X-Received: by 2002:a05:6808:114f:b0:32b:1be0:2316 with SMTP id
 u15-20020a056808114f00b0032b1be02316mr4302015oiu.200.1653464228185; Wed, 25
 May 2022 00:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
 <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
 <87a6b6pwqf.fsf@tarshish>
 <CALtfCQZPYEJBT=2hx6XJ1FH=ESHhw2N_LaqYbd+xdGkXxT503g@mail.gmail.com>
 <875ylup27u.fsf@tarshish>
 <CADvTj4r=46JdJUPSzOXgmXVDBWYDM3v5wsFjymbzGF1xoyzO4Q@mail.gmail.com>
 <871qwiozwd.fsf@tarshish>
In-Reply-To: <871qwiozwd.fsf@tarshish>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 May 2022 01:36:56 -0600
Message-ID: <CADvTj4rcNYCZv_xjPuCmKvXVqjkSr2xzj3nPirW+LEG_fB4LzA@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
Cc: Oscar Gomez Fuente <oscargomezf@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 25, 2022 at 1:05 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi James,
>
> On Wed, May 25 2022, James Hilliard wrote:
> > On Wed, May 25, 2022 at 12:15 AM Baruch Siach <baruch@tkos.co.il> wrote:
> >> On Wed, May 25 2022, Oscar Gomez Fuente wrote:
> >> >> So now when you lookup BR2_PACKAGE_PYTHON_CRYPTOGRAPHY in menuconfig
> >> >> search do you still see 'BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]'?
> >> >
> >> > YES
> >> >
> >> >> Please send your .config file.
> >> >
> >> > OK
> >>
> >> I see the problem now. Your target platform is BR2_arm (32 bit), but
> >> your CPU selection is BR2_ARM_CPU_ARMV8A (64 bit capable). This
> >> combination is not supported in current
> >> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS or
> >> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS. This patch should make
> >> BR2_PACKAGE_PYTHON_CRYPTOGRAPHY selectable, but I'm not sure it's
> >> correct:
> >>
> >> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> >> index a86d95236d90..64b135f86f27 100644
> >> --- a/package/rustc/Config.in.host
> >> +++ b/package/rustc/Config.in.host
> >> @@ -42,6 +42,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
> >>         default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> >>         # armv7-unknown-linux-gnueabihf
> >>         default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> >> +       # armv8-unknown-linux-gnueabihf
> >> +       default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> >>         # mips-unknown-linux-gnu
> >>         default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
> >>         # mips64-unknown-linux-gnuabi64
> >> @@ -86,6 +88,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
> >>         default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI && BR2_TOOLCHAIN_USES_MUSL
> >>         # armv7-unknown-linux-musleabihf
> >>         default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
> >> +       # armv8-unknown-linux-musleabihf
> >> +       default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
> >>         # i586-unknown-linux-gnu
> >>         default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
> >>         # i586-unknown-linux-musl
> >>
> >> Adding James and Thomas to Cc since they showed interest in rustc over
> >> the last year.
> >>
> >> Is that the right solution?
> >
> > Probably needs mappings for the toolchain which don't seem to follow the same
> > scheme as our currently supported architectures, see here:
> > https://doc.rust-lang.org/rustc/platform-support.html#tier-2
> >
> > For armv8 I see:
> > thumbv8m.base-none-eabi*ARMv8-M Baseline
> > thumbv8m.main-none-eabi*ARMv8-M Mainline
> > thumbv8m.main-none-eabihf*ARMv8-M Mainline, hardfloat
> >
> > Although not really sure those will work correctly with musl.
>
> The '*' in the table indicates no_std, that is, bare metal. That's most
> likely not what we want for Buildroot. Can we map BR2_ARM_CPU_ARMV8A to
> armv7 line the following:

Ah, yeah, that would probably work.

>
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index a86d95236d90..6aac703b2a4f 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -42,6 +42,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>         default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>         # armv7-unknown-linux-gnueabihf
>         default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> +       # armv8-unknown-linux-gnueabihf
> +       default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>         # mips-unknown-linux-gnu
>         default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
>         # mips64-unknown-linux-gnuabi64
> @@ -86,6 +88,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>         default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI && BR2_TOOLCHAIN_USES_MUSL
>         # armv7-unknown-linux-musleabihf
>         default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
> +       # armv8-unknown-linux-musleabihf
> +       default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
>         # i586-unknown-linux-gnu
>         default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
>         # i586-unknown-linux-musl
> @@ -114,7 +118,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  config BR2_PACKAGE_HOST_RUSTC_ARCH
>         string
>         default "armv5te" if BR2_ARM_CPU_ARMV5
> -       default "armv7"  if BR2_ARM_CPU_ARMV7A
> +       default "armv7"  if BR2_ARM_CPU_ARMV7A || (BR2_arm && BR2_ARM_CPU_ARMV8A)
>         default "riscv64gc" if BR2_RISCV_64
>         default BR2_ARCH
>
> baruch
>
> --
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
