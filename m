Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE4EC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7172A60E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7172A60E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4050B403C9;
	Sun, 25 Jul 2021 07:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IDN3Ir056kP; Sun, 25 Jul 2021 07:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289E4403CE;
	Sun, 25 Jul 2021 07:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2121BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C8B9403CE
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJaXm7ogs-hx for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:57:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FB7A403C9
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:57:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 34CFB7802D7;
 Sun, 25 Jul 2021 09:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627199852;
 bh=HlqUe8gP2JNUCdaaer1I3LtvfaxGWw2OgTBZWWLfneE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ku5EPP0pKqRKPYcZHh4O5OJWfidm1q8jOUWfBHJ5DgfmK4oSDVdigK3xGeXYG3ZH9
 3nSdo/seOdfY85ZSPphQDHVXqZ5ho3GmBWWJCtnpWhTxYFm9qnbt2qMH6ZT/GBXVql
 RUvzkkFr/RxKMbcrA8ptsLFvNeOKDviMGru4hUTD7PA3b9hBNRSovL+7CLOTRYkqpm
 Pu+ZuZEg4bxMQ93ewTHd+hRRdo3Idf+2uHcQvmjzekuFqrAslrs8LljnKu0W+H9FRK
 kdASzN75lfp8oXmtdUA9KhpZ7EBfQ5uf4tLhQQKQFWwgkNEJyVLKQzQsM7IXBaus2b
 EpjmvfFpnY/rQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jul 2021 09:57:25 +0200
Date: Sun, 25 Jul 2021 09:57:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210725075725.GP2382418@scaer>
References: <20210724214526.47637-1-arnout@mind.be>
 <20210724214526.47637-3-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724214526.47637-3-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 3/3] package/armadillo: allows to select
 between clapack, lapack or openblas
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All, 

On 2021-07-24 23:45 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> armadillo can use clapack, lapack or openblas as BLAS provider and
> clapack or lapack as LAPACK provider.
> 
> This patch
> - adds hidden variable to check dependencies/requirement for each of them
> - adds an option to use openblas as BLAS provider
> 
> The choice is required since applications may potentially need
> lapack/clapack.
> 
> Note that a choice between lapack and clapack is hard to do in Kconfig,
> because it inevitably leads to a circular dependency.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v3 -> v4: [Done by Arnout]
> - Split off lapack/clapack arch depends in separate patches
> - Simplify the comments (no need for the powerpc complexity)
> - Remove the choices because clapack/lapack choice doesn't work. Keep a
>   single config for openblas.
> Changes v2 -> v3:
> - drop all default statements for choice (Thomas)
> - add explicit -l since blas libary is called liblas for (c)lapack and
>   libopenblas for openblas (Thomas)
> - add a choice for lapack selection between lapack, clapack or none
> Changes v1 -> v2:
> - add openblas as blas provider
> ---
>  package/armadillo/Config.in    | 32 +++++++++++++++++++++++---------
>  package/armadillo/armadillo.mk | 28 +++++++++++++++++++++++++++-
>  2 files changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
> index b2b61a3233..710da0314f 100644
> --- a/package/armadillo/Config.in
> +++ b/package/armadillo/Config.in
> @@ -1,20 +1,34 @@
> +config BR2_PACKAGE_ARMADILLO_LAPACK_BLAS_SUPPORTS
> +	bool
> +	default y if BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
> +	default y if BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN
> +	default y if BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +
>  comment "armadillo needs a toolchain w/ C++"
> +	depends on BR2_PACKAGE_ARMADILLO_LAPACK_BLAS_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_powerpc
> -	depends on !BR2_m68k_cf
> -
> -comment "armadillo needs a glibc toolchain w/ C++"
> -	depends on BR2_powerpc
> -	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
>  
>  config BR2_PACKAGE_ARMADILLO
>  	bool "armadillo"
> +	depends on BR2_PACKAGE_ARMADILLO_LAPACK_BLAS_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
> -	depends on !BR2_m68k_cf # clapack
> -	select BR2_PACKAGE_CLAPACK
> +	select BR2_PACKAGE_CLAPACK if !BR2_PACKAGE_LAPACK && !BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS
>  	help
>  	  Armadillo: An Open Source C++ Linear Algebra Library for
>  	  Fast Prototyping and Computationally Intensive Experiments.
>  
>  	  http://arma.sourceforge.net/
> +
> +if BR2_PACKAGE_ARMADILLO
> +
> +config BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS

Note the option name here ^^^ [...]

> +	bool "use openblas"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	select BR2_PACKAGE_OPENBLAS
> +	help
> +	  Use OpenBLAS as BLAS library. Without this option, clapack or lapack
> +	  will be used.
> +
> +endchoice
> +
> +endif
> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
> index 624b842ef6..82df7602be 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -7,11 +7,37 @@
>  ARMADILLO_VERSION = 9.900.2
>  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
>  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
> -ARMADILLO_DEPENDENCIES = clapack
>  ARMADILLO_INSTALL_STAGING = YES
>  ARMADILLO_LICENSE = Apache-2.0
>  ARMADILLO_LICENSE_FILES = LICENSE.txt
>  
>  ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
>  
> +# blas support may be provided by lapack, clapack or openblas
> +# blas library from (c)lapack is libblas.a, libopenblas.a otherwise
> +ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
> +ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)

[...] so I guess you meant BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS here, no?

> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
> +ARMADILLO_DEPENDENCIES = openblas
> +else
> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
> +ifeq ($(BR2_PACKAGE_CLAPACK), y)

We don't usually add a space after the comma in an ifeq, especially in
cases like this simple test.

Why duplicate the dependency on lapack/clapack in the !openblas case,
when the same dependencies already exist, below?

I mean: in the !openblas case, we know that either lapack or clapack are
enabled, so we know will hit either case in the block [...]

> +ARMADILLO_DEPENDENCIES = clapack
> +else
> +ARMADILLO_DEPENDENCIES = lapack
> +endif
> +endif

[...] here:

> +# lapack support may be provided by lapack or clapack
> +# but not by openblas
> +ifeq ($(BR2_PACKAGE_CLAPACK),y)
> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
> +ARMADILLO_DEPENDENCIES += clapack
> +else ifeq ($(BR2_PACKAGE_LAPACK),y)
> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
> +ARMADILLO_DEPENDENCIES += lapack
> +else
> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=OFF
> +endif

Additionally, this block will be hit even in the openblas case. Is this
expected?

Regards,
Yann E. MORIN.

>  $(eval $(cmake-package))
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
