Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966CFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 06:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E9FD84066;
	Wed, 25 May 2022 06:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvP64UQGUHmZ; Wed, 25 May 2022 06:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BDFA84062;
	Wed, 25 May 2022 06:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA7B1BF319
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9018341731
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYUX6c8Rww1c for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 06:28:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56B3A41716
 for <buildroot@buildroot.org>; Wed, 25 May 2022 06:28:51 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id y66so17951061oia.1
 for <buildroot@buildroot.org>; Tue, 24 May 2022 23:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hrbdVkpssQO5UHrr15SgQnI0TC484xkJ/9QVuRKFMPg=;
 b=N2vfcp7rfNq9ezbLWXV6bNGacB+9DB4vml1YtbgfkvIHiFyrcj1hvaPOPyVJHy3fhB
 C8H4s1thuo8/FGblUB6lr0SeBcHJF9NJoSZF2ddaMpIqRe+ZTze64kd6VD08oEZND2oY
 ohEpclbfoDFNHwtlCFv1bCnqDH9etJSQzv5f3ku4NM2XQMLPfKw7SQxXz6/Y12lgdCbb
 z70C2VcXaDbGy30XiOOwsdNUI3d90kb2GeKhn8rkBkmL+wXYDRCYGYVVeutPMewh++Xi
 kI3K1f7ok/K68jCfsDj+ybNlUWn4g6/UxhFmUPbdBJwwSXzgsMFwgTPAB2REjY9WatMw
 WUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hrbdVkpssQO5UHrr15SgQnI0TC484xkJ/9QVuRKFMPg=;
 b=evxTdVeZzy9i8pA4WvcGAJIOP+NPl4NxLyvPYs9Jfy/vUDXf9X6wGxN7N9PhUDiuLc
 C1JneojowGf1SbGKJh2xIQMpeXXeeAbwcKY5zcYSnXMX1rd8K2daD1BVRb7LJnTGbiPy
 mzd1pHf0m8XkfcRqyHShEvxcaycpXcPyCJpRrx4qXLRytj+JLRckMf+XiGlkEhv1ALtP
 wclhalDoH29ZqfnvJcNTru80FMCN3xufIdLHG5kl3ePxb+ZzQLZvOf2hTTJ/xhL4xBbb
 7FetcYa8Zm80i9L4jBw/ScXIZXYcsEPsk+2jo0Zvgy6+HfdKLQ3FWEO3qE/xAcn9FX9h
 lenA==
X-Gm-Message-State: AOAM532/YThfzNaGOtw+vCFIm/yBh88tHVjxe10z5MGMoeyhGYupfHQi
 IbvEdH8nGGJtwF7qlSu0n3I9pqF+fnirFhpGcJw=
X-Google-Smtp-Source: ABdhPJzmChlkDav4Mv960MNFnn9XaEfnx2kY1jZAluNRfRA4hgnlar2XwKrFbV/WDlx7Js8K8pAhBImUwVzGVrq6zjU=
X-Received: by 2002:a05:6808:2014:b0:32b:1806:8ed5 with SMTP id
 q20-20020a056808201400b0032b18068ed5mr4435937oiw.99.1653460130175; Tue, 24
 May 2022 23:28:50 -0700 (PDT)
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
In-Reply-To: <875ylup27u.fsf@tarshish>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 May 2022 00:28:39 -0600
Message-ID: <CADvTj4r=46JdJUPSzOXgmXVDBWYDM3v5wsFjymbzGF1xoyzO4Q@mail.gmail.com>
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

On Wed, May 25, 2022 at 12:15 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Oscar,
>
> On Wed, May 25 2022, Oscar Gomez Fuente wrote:
> >> So now when you lookup BR2_PACKAGE_PYTHON_CRYPTOGRAPHY in menuconfig
> >> search do you still see 'BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]'?
> >
> > YES
> >
> >> Please send your .config file.
> >
> > OK
>
> I see the problem now. Your target platform is BR2_arm (32 bit), but
> your CPU selection is BR2_ARM_CPU_ARMV8A (64 bit capable). This
> combination is not supported in current
> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS or
> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS. This patch should make
> BR2_PACKAGE_PYTHON_CRYPTOGRAPHY selectable, but I'm not sure it's
> correct:
>
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index a86d95236d90..64b135f86f27 100644
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
>
> Adding James and Thomas to Cc since they showed interest in rustc over
> the last year.
>
> Is that the right solution?

Probably needs mappings for the toolchain which don't seem to follow the same
scheme as our currently supported architectures, see here:
https://doc.rust-lang.org/rustc/platform-support.html#tier-2

For armv8 I see:
thumbv8m.base-none-eabi*ARMv8-M Baseline
thumbv8m.main-none-eabi*ARMv8-M Mainline
thumbv8m.main-none-eabihf*ARMv8-M Mainline, hardfloat

Although not really sure those will work correctly with musl.

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
