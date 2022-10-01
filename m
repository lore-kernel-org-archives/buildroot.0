Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DA2C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 18:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3FF740BDE;
	Sat,  1 Oct 2022 18:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3FF740BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlWTjgRrZJOl; Sat,  1 Oct 2022 18:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C286240BC2;
	Sat,  1 Oct 2022 18:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C286240BC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2A21BF2E4
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 18:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C4B83143
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 18:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C4B83143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UzUnHCPP2Tv for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 18:19:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C34182CCB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C34182CCB
 for <buildroot@busybox.net>; Sat,  1 Oct 2022 18:19:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7AE2C780368;
 Sat,  1 Oct 2022 20:19:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 20:19:38 +0200
Date: Sat, 1 Oct 2022 20:19:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20221001181938.GO30794@scaer>
References: <20220928193437.13407-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220928193437.13407-1-guillaume.bressaix@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664648381;
 bh=NhhycTvJ3lnOrqxn217Sbdq8FK0H9KrKaJHkT45OIsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A/Sru48JEBGrgZzKDwcH0wicTQ793hGCqJuGGNiK9e6l24q3WJf6MQdMtzhoEiHFt
 viF6U6KNRATv+livrtUSFRh8uBcIe32j+2tHgE8suix4mYwH6UbCr6EZGT1GbeFKfi
 9NqFPnWixeUpGAicKMTpXSn2B3CPtfO2N64s/ftajMPNRb/7doSo89mcBM0+M3d5S4
 H1MqE21qxmOfx600KY04m7edPR3pNmLXuwkuSqS2UjOhxP5gd8tYfLgfheerCa+/+J
 aYPk3iBHR/b71t9pLrBwBRQka3DhMynitfpcaHVDOapa8I9nZ+OxfdCKzCGr3gd9eY
 tQEeGHiTaH7zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A/Sru48J
Subject: Re: [Buildroot] [RESEND v1 1/1] package/python-scipy: bump version
 to 1.9.1
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
Cc: buildroot@busybox.net, Ralf Gommers <ralf.gommers@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillaume, All,

On 2022-09-28 21:34 +0200, Guillaume W. Bres spake thusly:
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---

All that is below the triple-dash line will be dropped by git when we
apply the patch. However, you provided interesting information in that
post-commit-log message...

> Scipy is expected to move to a meson build infrastructure
> by the next release
> 
> scipy-.tar.xz is no longer released.

This should be part of the commit log proper, to explain why you
switched to the .tar.gz archive.

> For some reason, a new "Python.h" missing header
> build time failure arised. I solve it with a -Ipython include.

This should also be part of the commit log 

> Then test script failed, with linker/runtime missing symbols error,
> all related to the linear algebra portion (which we do test).
> Errors like "undefined reference to __atomic_compare_exchange 8"
> regarding
> "site-/scipy/optimize/_highs/_highs_wrapper.cpython-310-arm-linux-gnueabi.so"
> to be specific. I solved it with a -latomic flag.

I see you pass it via CFLAGS; that's not correct, it should be passed
via LDFLAGS. If that doesnt work, it should be explained why.

Also, we can't arbitrary link agains -latomic, because not all
toolchains have it. See cairo.mk for how it should be conditionally
used.

Regards,
Yann E. MORIN.

> Once 1.9.2 is out, we know we already have my V3-1.9.1 patch
> serie that builds "fine" with meson, it involved a minor tweak
> (hopefuly solved by this time). The test script no longer did pass though,
> this serie is not 100% ready to go
> ---
>  package/python-scipy/python-scipy.hash | 2 +-
>  package/python-scipy/python-scipy.mk   | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
> index 0274679c43..1ba239aabf 100644
> --- a/package/python-scipy/python-scipy.hash
> +++ b/package/python-scipy/python-scipy.hash
> @@ -1,5 +1,5 @@
>  # Locally generated
> -sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
> +sha256  26d28c468900e6d5fdb37d2812ab46db0ccd22c63baa095057871faa3a498bc9  scipy-1.9.1.tar.gz
>  sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
>  sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
>  sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
> diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
> index a8c23c6c88..1619b9f40a 100644
> --- a/package/python-scipy/python-scipy.mk
> +++ b/package/python-scipy/python-scipy.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_SCIPY_VERSION = 1.8.1
> -PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
> +PYTHON_SCIPY_VERSION = 1.9.1
> +PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
>  PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
>  PYTHON_SCIPY_LICENSE = \
>  	BSD-3-Clause, \
> @@ -36,6 +36,8 @@ PYTHON_SCIPY_INSTALL_STAGING = YES
>  PYTHON_SCIPY_SETUP_TYPE = setuptools
>  PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
>  
> +PYTHON_SCIPY_CFLAGS = \
> +	-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
>  PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
>  	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
>  # -lnpyrandom localization
> @@ -44,6 +46,7 @@ PYTHON_SCIPY_LDFLAGS += \
>  
>  PYTHON_SCIPY_ENV = \
>  	F90=$(TARGET_FC) \
> +	CFLAGS="$(PYTHON_SCIPY_CFLAGS) -latomic" \
>  	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
>  
>  # Provide system configuration options to numpy distutils extensions, telling
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
