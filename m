Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77344C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 19:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D12C4056E;
	Sat,  1 Oct 2022 19:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D12C4056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9q37wNaofiX; Sat,  1 Oct 2022 19:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E80724023F;
	Sat,  1 Oct 2022 19:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E80724023F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6601BF3BA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 472B041604
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472B041604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIlJ3p3f7FZS for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 19:34:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696B8415F6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 696B8415F6
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 19:34:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8322378034D;
 Sat,  1 Oct 2022 21:34:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 21:34:14 +0200
Date: Sat, 1 Oct 2022 21:34:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kirill Kranke <kk@aibs.ru>
Message-ID: <20221001193414.GS30794@scaer>
References: <20220927142604.17035-1-kk@aibs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927142604.17035-1-kk@aibs.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664652857;
 bh=lTC6I0B/rC0t7wXXZeTmgQKB/42iuAJsSbFpkvzV5/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E/plGdp9Ad9Q1xj3x0gC8+pTBwd8HfJzkhdZOkSEH+cjN644XHUleZSQ7N8IXDdxz
 kaWtRdh0qbEtE9n0CkA1cPhXNTy9jN2GkfC9F/w8HYwqhMWpFQt+dLmC/yiKA8y+ru
 KYP763N5460Gf86e+F8KBTLxXIkjzO+pbIVcNwoEawXs/wseoNogLtbydtyojDgZy/
 LvYiNdbrkEAK+UdYhVc7LtjgsfbyjCRGJX23tyZto2wuWhY+3zEjkSVbsJobVkhyEY
 eWJTiZjpDWn0HkOZ2twfYSOsWbj3cnkvp06hpHEYf3WFFeL+MFDHYcqQrNSE8K+mEJ
 P38DTiuysdxtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E/plGdp9
Subject: Re: [Buildroot] [PATCH] package/sleef: add new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kirill, All,

On 2022-09-27 17:26 +0300, Kirill Kranke spake thusly:
> SLEEF is a library that implements vectorized versions
> of C standard math functions. This library also
> includes DFT subroutines.
> 
> https://sleef.org/
> Signed-off-by: Kirill Kranke <kk@aibs.ru>
> ---
[--SNIP--]
> diff --git a/package/sleef/Config.in b/package/sleef/Config.in
> new file mode 100644
> index 0000000000..85f93d384e
> --- /dev/null
> +++ b/package/sleef/Config.in
> @@ -0,0 +1,50 @@
> +config BR2_PACKAGE_SLEEF_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_arm
> +	default y if BR2_aarch64
> +	default y if BR2_i386
> +	default y if BR2_x86_64
> +	default y if BR2_powerpc64
> +
> +config BR2_PACKAGE_SLEEF
> +	bool "sleef"

You forgot to add the actual dependency on BR2_PACKAGE_SLEEF_ARCH_SUPPORTS
here.

> +	help
> +          SLEEF is a library that implements vectorized versions
> +          of C standard math functions. This library also
> +          includes DFT subroutines.
> +
> +          https://sleef.org/

If I understand correctly, by default, only the libm is built. This
should probably be specified in the help text for the main symbol.

> +if BR2_PACKAGE_SLEEF
> +
> +config BR2_PACKAGE_SLEEF_DFT
> +        bool "compile dft"
> +        default n

default n is the default, so it should npt be specified.

> +        help
> +          libsleefdft will be built

The helpe text does not provide much more information that the prompt,
so there is no need for the help text, unless we can come up with a
better help (see below)

So:

    config BR2_PACKAGE_SLEEF_LIBDFT
        bool "libsleefdft"
        help
          libsleefdft contains functions to perform DFT (discreet
          Fourrier transform).

Adapt as you see fit.

And so on for the other options.

> +config BR2_PACKAGE_SLEEF_QUAD
> +        bool "compile quad"
> +        default n
> +        help
> +          libsleefquad will be built
> +
> +config BR2_PACKAGE_SLEEF_GNUABI_LIBS
> +        bool "compile gnuabi"
> +        default y
> +        help
> +          libsleefgnuabi will be built
> +
> +config BR2_PACKAGE_SLEEF_SCALAR_LIB
> +        bool "compile scalar"
> +        default n
> +        help
> +          libsleefscalar will be built
> +
> +config BR2_PACKAGE_SLEEF_TESTS
> +        bool "compile tests"
> +        default n
> +        help
> +          Tests will be built
> +
> +endif
> diff --git a/package/sleef/sleef.hash b/package/sleef/sleef.hash
> new file mode 100644
> index 0000000000..51570a5176
> --- /dev/null
> +++ b/package/sleef/sleef.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
> +sha256  415ee9b1bcc5816989d3d4d92afd0cd3f9ee89cbd5a33eb008e69751e40438ab  sleef-3.5.1.tar.gz
> diff --git a/package/sleef/sleef.mk b/package/sleef/sleef.mk
> new file mode 100644
> index 0000000000..46bef69f5f
> --- /dev/null
> +++ b/package/sleef/sleef.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# sleef
> +#
> +################################################################################
> +
> +SLEEF_VERSION = 3.5.1
> +SLEEF_SITE = $(call github,shibatch,sleef,$(SLEEF_VERSION))
> +SLEEF_LICENSE = BSL-1.0
> +SLEEF_LICENSE_FILES = LICENSE.txt
> +SLEEF_SUPPORTS_IN_SOURCE_BUILD = NO
> +SLEEF_INSTALL_STAGING = YES
> +
> +# N.B. Need to use host sleef during cross compilation.
> +SLEEF_DEPENDENCIES = host-sleef
> +SLEEF_CONF_OPTS += -DNATIVE_BUILD_DIR=$(BUILD_DIR)/host-sleef-$(SLEEF_VERSION)/buildroot-build

You will have to explain in the commit log why you need to point to the
host-sleef build directory, and why you can't use the installed one, in
$(HOST_DIR).

Also, a package build directory is accessed with $(HOST_SLEEF_BUILDDIR)
and for cmake based packages, it already includes the /buildroot-build
sub-directory component:

    make show-vars |jq .HOST_SLEEF_BUILDDIR

Otherwise, it looks good. Except forthe missing explanations about the
use of the build directory of the host packag, I could have fixed the
rest when applying.

Can you elaborate on that part, fix the other minor issues and respin,
please?

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_SLEEF_DFT),y)
> +SLEEF_CONF_OPTS += -DBUILD_DFT=ON
> +else
> +SLEEF_CONF_OPTS += -DBUILD_DFT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SLEEF_QUAD),y)
> +SLEEF_CONF_OPTS += -DBUILD_QUAD=ON
> +else
> +SLEEF_CONF_OPTS += -DBUILD_QUAD=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SLEEF_GNUABI_LIBS),y)
> +SLEEF_CONF_OPTS += -DBUILD_GNUABI_LIBS=ON
> +else
> +SLEEF_CONF_OPTS += -DBUILD_GNUABI_LIBS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SLEEF_SCALAR_LIB),y)
> +SLEEF_CONF_OPTS += -DBUILD_SCALAR_LIB=ON
> +else
> +SLEEF_CONF_OPTS += -DBUILD_SCALAR_LIB=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SLEEF_TESTS),y)
> +SLEEF_CONF_OPTS += -DBUILD_TESTS=ON
> +else
> +SLEEF_CONF_OPTS += -DBUILD_TESTS=OFF
> +endif
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.20.1
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
