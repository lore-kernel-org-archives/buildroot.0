Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12780C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:05:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7210D6069E
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 16:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7210D6069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trabucayre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31580831CB;
	Sun, 25 Jul 2021 16:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3D8U8nyfBNbS; Sun, 25 Jul 2021 16:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ECA183046;
	Sun, 25 Jul 2021 16:05:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45DF31BF2B4
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DA7D83046
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 16:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUaw2IX2545u for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 16:05:01 +0000 (UTC)
X-Greylist: delayed 00:06:35 by SQLgrey-1.8.0
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D280B82F92
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 16:05:00 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 16PFwMR2009984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 17:58:23 +0200
Date: Sun, 25 Jul 2021 17:57:09 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@busybox.net
Message-ID: <20210725175709.7338b4a5@x230_1.trabucayre.com>
In-Reply-To: <20210725111231.359830-3-arnout@mind.be>
References: <20210725111231.359830-1-arnout@mind.be>
 <20210725111231.359830-3-arnout@mind.be>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v5 3/3] package/armadillo: allow to select
 between lapack or openblas
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, all,

On Sun, 25 Jul 2021 13:12:31 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> armadillo can use lapack or openblas as BLAS provider. LAPACK support is
> optional.
> 
> This patch
> - adds an _ARCH_SUPPORTS variable to check if one is available
> - adds an option to choose lapack or openblas as BLAS provider
> 
> The choice is required since applications may potentially need lapack.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v4 -> v5: [Done by Arnout]
> - Consistent naming of BR2_PACKAGE_ARMADILLO_OPENBLAS (Yann E. Morin)
> - Remove double dependency on lapack/clapack (Yann E. Morin)
> - Remove stray 'endchoice'
> - "Solve" circular dependency by removing clapack
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
>  package/armadillo/Config.in    | 34 ++++++++++++++++++++++++++--------
>  package/armadillo/armadillo.mk | 18 +++++++++++++++++-
>  2 files changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
> index b2b61a3233..7aed4fd02f 100644
> --- a/package/armadillo/Config.in
> +++ b/package/armadillo/Config.in
> @@ -1,20 +1,38 @@
>  comment "armadillo needs a toolchain w/ C++"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
blas may be provided by lapack too: maybe it's required to add the same condition
as armadillo itself ?
>  	depends on !BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_powerpc
> -	depends on !BR2_m68k_cf
>  
> -comment "armadillo needs a glibc toolchain w/ C++"
> -	depends on BR2_powerpc
> -	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
> +comment "armadillo needs a toolchain w/ fortran, C++"
fortran is only required if lapack has to be used: if lapack is said as optional this is
maybe not required ?
> +	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
> +	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
>  
>  config BR2_PACKAGE_ARMADILLO
>  	bool "armadillo"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
> +		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
> -	depends on !BR2_m68k_cf # clapack
> -	select BR2_PACKAGE_CLAPACK
>  	help
>  	  Armadillo: An Open Source C++ Linear Algebra Library for
>  	  Fast Prototyping and Computationally Intensive Experiments.
>  
>  	  http://arma.sourceforge.net/
> +
> +if BR2_PACKAGE_ARMADILLO
> +
> +choice
> +	prompt "BLAS implementation"
> +
> +config BR2_PACKAGE_ARMADILLO_OPENBLAS
> +	bool "openblas"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	select BR2_PACKAGE_OPENBLAS
> +
> +config BR2_PACKAGE_ARMADILLO_LAPACK
> +	bool "lapack"
> +	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN
> +	select BR2_PACKAGE_LAPACK
> +
> +endchoice
> +
> +endif
> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
> index 624b842ef6..dcac2bf8cd 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -7,11 +7,27 @@
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
> +# blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
> +ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
> +ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
> +ARMADILLO_DEPENDENCIES = openblas
> +else
> +# Since BR2_PACKAGE_LAPACK is selected in this case, the dependency on it is
> +# added below.
> +ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
> +endif
> +
> +# lapack support is optional and can only be provided by lapack, not openblas
> +ifeq ($(BR2_PACKAGE_LAPACK),y)
> +ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
> +ARMADILLO_DEPENDENCIES += lapack
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.31.1
> 
It's an open question:
until now armadillo was always built with blas and lapack support provided by
clapack. To avoid breaking current behaviour (lapack support) why not
considering selecting lapack package unconditionaly and let user choise for
blas support? I know the main issue is the dependency to fortran...

Thanks
Gwen
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
