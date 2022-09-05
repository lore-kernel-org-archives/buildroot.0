Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F465ECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 15:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F11F40A07;
	Mon,  5 Sep 2022 15:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F11F40A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGWYwHjvawjW; Mon,  5 Sep 2022 15:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC590408AC;
	Mon,  5 Sep 2022 15:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC590408AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D9091BF293
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 15:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 337214097E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 15:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 337214097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vewYwj_z3-dx for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 15:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 517EA404EC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 517EA404EC
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 15:20:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5dc:9bd4:48b0:8ef0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E533CB0058A;
 Mon,  5 Sep 2022 17:19:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 17:19:58 +0200
Date: Mon, 5 Sep 2022 17:19:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alex Roberts <alex.roberts109@outlook.com>
Message-ID: <20220905151958.GF1490660@scaer>
References: <CH2PR22MB1879D831102DE31542D924D7B57F9@CH2PR22MB1879.namprd22.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR22MB1879D831102DE31542D924D7B57F9@CH2PR22MB1879.namprd22.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662391202;
 bh=3hdMS/mKKWDTcd6jOOqcZ961NjP9xX5o27qKFFRNWe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XhcTV4q64mQXaazb7ym5dg1acZWgQDVunlNOSuwnN3LGCUxeJDHwZRJz8rtkyXWWP
 w+V2JSA/wnRIzO76TgZAoA2/v5eOsC+48eSoIya5StNp7gTNi4y2MvtE9aV5lkTZGK
 hx7Ai37TGZm0TAGbOZcKI8ie3yTG+PoWdHK5ubllKAh/dxRzksnXXtUvGshQ+h00sW
 oRR32MOsgNIID0Bt/30r2zngx/4Cx1iYOj/v6HdLRChlhvrZM9PyUJoKktv9phGsC1
 W+WPeKwsjGcnAo7f6Y/RaaF50UJi6K861Ci5Tsm0qTm6w4da/2tikMNgIQ2XkD9E4k
 AnNWaJFq1R21g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XhcTV4q6
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add config support for
 ulibc-ng and musl
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
Cc: "ju.o@free.fr" <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alex, All,

On 2022-09-05 01:21 +0000, Alex Roberts spake thusly:
> From e00afef7a1811db5cd0a26e702ade0af1cdcca23 Mon Sep 17 00:00:00 2001
> From: Alex Roberts <alex.roberts109@outlook.com>
> Date: Sun, 4 Sep 2022 17:43:18 -0500
> Subject: [Buildroot] [PATCH 1/1] package/octave: add config support for ulibc-ng and musl
>  toolchains

This is weird that your mail contains the git metadata. Normally, this
is not present when sent with "git send-email".

Also, your commit title states 'for ulibc-ng and musl', but all the
explanations seems to indicate that only uClibc-NG is concerned (since
locales are always available with musl).

> Modified Config.in to allow Octave package to be built with Buildroot internal toolchains. This adds support
> for both uClib-ng and musl based toolchain.

Please, wrap your commit log to ~72 chars.

Also, do not describe what you did ("Modified Config.in to ..."), but
explain what you did.

> Octave requires locale support, this can be provided by the toolchain (default for musl and glibc). Locale support in
> uClibc-ng is optional. If not enabled, locale support can be provided for Octave by libiconv (BR2_PACKAGE_LIBICONV).

This is a good intrductory blurb: it explains the context; the commit
log should start with that.

> octave.mk is modified to check if BR2_PACKAGE_LIBICONV is being used and will include libiconv as a build dependency.

Again, do not describe ("octave.mk is modified to..."), but explain.

> This was tested with on arm32 and arm64 (aarch) targets with qemu_arm_versatile_defconfig and aarch64_virt_defconfig.
> 
> octave-cli --eval 'oruntests general'
> 
> All tests passed. uClibc-ng has issues on aarch64 and segfaults on program termination.

Sorry, I don't understand... If "uClibc-ng has issues on aarch64 and
segfaults on program termination", then how can you conclude that "All
tests passed"?

It would also be very interesting to update the existing runtime test,
to include testing with uClibc-NG:

    support/testing/tests/package/test_octave.py

> Signed-off-by: Alex Roberts <alex.roberts109@outlook.com>
> --- a/package/octave/Config.in
> +++ b/package/octave/Config.in
> @@ -4,6 +4,10 @@ config BR2_PACKAGE_OCTAVE
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	depends on BR2_TOOLCHAIN_HAS_FORTRAN
> +	depends on BR2_TOOLCHAIN_HAS_OPENMP

How is OpenMP related to the locale issue you explained in the commit
log? If OpenMP really is needed unconditionally, then this needs to be
changed in a separate patch.

There is --disable-openmp, so I guess this is actually not re
quired, in fact. But having it explicitly set would be nice (as a
separate patch; of course):

    ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
    OCTAVE_CONF_OPTS += --enable-openmp
    else
    OCTAVE_CONF_OPTS += --disable-openmp
    endif

> +	depends on BR2_USE_WCHAR
> +	depends on (BR2_ENABLE_LOCALE || BR2_PACKAGE_LIBICONV)

We have quite some packages that do:

    select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

> +

spurious empty line.

>  	# Some Bootlin x86_64 toolchains (like version
>  	# bleeding-edge-2021.11-1) has a file
>  	# "x86_64-buildroot-linux-gnu/lib64/libgfortran.la" including
> @@ -11,10 +15,12 @@ config BR2_PACKAGE_OCTAVE
>  	# to linquadmath.la on the bootlin build host. This breaks
>  	# builds using libtool with libgfortran. Those toolchains are
>  	# used by the "utils/test-pkg" script.
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BOOTLIN || !BR2_x86_64
> +	depends on !BR2_x86_64

Why did you drop the dependency on the Bootlin toolchains? If the issue
is no longer present, then the comment above would no longer be
applicable, so that would have to be modified.

Also, this mens that octave is no longer available for x86_64 at all,
even when using toolchains other than the Bootlin ones. Previously, it
was possible to use an internal toolchain, or any custom external
toolchain.

In any case, that would have to be a separate patch.

>  	select BR2_PACKAGE_OPENBLAS
>  	select BR2_PACKAGE_PCRE
>  	select BR2_PACKAGE_PCRE_UTF
> +

Spurious empty line.

>  	help
>  	  GNU Octave is a high-level language, primarily intended for
>  	  numerical computations. It provides a convenient command
> @@ -33,7 +39,12 @@ config BR2_PACKAGE_OCTAVE
>  
>  	  https://www.octave.org/
>  
> -comment "octave needs a toolchain w/ C++ and fortran, gcc >= 4.8"
> +comment "octave needs a toolchain w/ wchar, C++, Fortran, OpenMP, gcc >= 4.8"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> -		!BR2_TOOLCHAIN_HAS_FORTRAN
> +		!BR2_TOOLCHAIN_HAS_FORTRAN || \
> +		!BR2_TOOLCHAIN_HAS_OPENMP || \
> +		!BR2_USE_WCHAR 
> +
> +comment "octave needs locale support via toolchain or libiconv"
> +	depends on !(BR2_ENABLE_LOCALE || BR2_PACKAGE_LIBICONV)

If you use the select as I suggested above, this coment is no longer
needed.

> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> index b28617438a..65552c1f78 100644
> --- a/package/octave/octave.mk
> +++ b/package/octave/octave.mk
> @@ -25,4 +25,8 @@ else
>  OCTAVE_CONF_OPTS += --disable-readline
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +OCTAVE_DEPENDENCIES += libiconv

Don't we also need to pass --with-libiconv-prefix?

And since there is --without-libiconv-prefix, can't we use that to
disable use of libiconv?

Regards,
Yann E. MORIN.

> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
