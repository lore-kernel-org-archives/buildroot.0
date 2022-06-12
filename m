Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36133C43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 15:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBA183E77;
	Sun, 12 Jun 2022 15:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctHCt7pFHoTf; Sun, 12 Jun 2022 15:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E837C83E3B;
	Sun, 12 Jun 2022 15:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 225B91BF968
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1101C60BBD
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 15:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TllIWPTCJDw for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 15:19:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B18E607FE
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:19:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5E116780344;
 Sun, 12 Jun 2022 17:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655047147;
 bh=ewWV0i7FDTEdE6+LTjWebcYcHJqIo0ia0plQJ43qyII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p3KelHNvBBaYtyuqZmgFfTkgHgnLTImyqFOEJMeQ+0I090ayQ5MDYZ66cCyq1SLIl
 jgALtlD+sOwHopY0T26GDhk07d0TwWMTWNrO7PCcp1WC5hAc7t0Y0hNcML2dn1Cuqv
 zfh214jbHJCak1U5GYRunYbGTelLCkUIpve0DFYECHPmTN0IP8NE+onf2X0YXPBvqA
 O5p1nPUQe7weSsC/L/A54dcFqFx0Y9Kp5utkSzdNqgG7RVT21MP0XzrgXBzpKvH5QC
 bXDlHRFeLusyZ4Q49Eh2AJbmxRCO6tZSYQjocw6xnC/GNIA7Cq058fQ4NsI5GCiK+f
 ftfNx0yJ6524w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 17:19:04 +0200
Date: Sun, 12 Jun 2022 17:19:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612151904.GF427639@scaer>
References: <20220612084538.1873673-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220612084538.1873673-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,1/2] package/wolftpm: fix dependencies
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
Cc: Dimitar Tomov <dimi@tpm.dev>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-12 10:45 +0200, Fabrice Fontaine spake thusly:
> pkg-config is not used by wolftpm and wolfssl dependency is missing (and
> optional but highly recommended) resulting in the following build failure
> since the addition of the package in commit
> 4bb884a3c61c6b71e33f69453a90eb2a367f64b7:
> 
> configure: error: WolfSSL library not found. You can get it from http://www.wolfssl.com/download.html
>         If it's already installed, specify its path using --with-wolfcrypt=/dir or --prefix=/dir
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/77a93521b909e701ef4e86f18524258b9242c721
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Dimi Tomov):
>  - Add a wolfcrypt option which is enabled by default
> 
>  package/wolftpm/Config.in  | 23 ++++++++++++++++++-----
>  package/wolftpm/wolftpm.mk | 13 ++++++++++---
>  2 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
> index 0fe094f277..0b964c3d7e 100644
> --- a/package/wolftpm/Config.in
> +++ b/package/wolftpm/Config.in
> @@ -1,9 +1,5 @@
>  config BR2_PACKAGE_WOLFTPM
>  	bool "wolftpm"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_WOLFSSL
> -	select BR2_PACKAGE_WOLFSSL_ALL
>  	help
>  	  wolfTPM is a portable, open-source TPM 2.0 stack with
>  	  backward API compatibility, designed for embedded use.
> @@ -12,5 +8,22 @@ config BR2_PACKAGE_WOLFTPM
>  
>  	  https://www.wolfssl.com/
>  
> -comment "wolftpm needs a toolchain w/ threads, dynamic library"
> +if BR2_PACKAGE_WOLFTPM
> +
> +config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
> +	bool "wolfCrypt hooks"
> +	default y
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wolfssl
> +	depends on !BR2_STATIC_LIBS # wolfssl-all
> +	select BR2_PACKAGE_WOLFSSL
> +	# not mandatory, but needed to get all features
> +	select BR2_PACKAGE_WOLFSSL_ALL
> +	help
> +	  Enable wolfCrypt hooks for RNG, Auth Sessions and Parameter
> +	  encryption. Disabling this option is not recommended as it
> +	  could create a security breach in most environments.
> +
> +comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +endif
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index ea01eaad6b..760656e134 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -10,7 +10,6 @@ WOLFTPM_INSTALL_STAGING = YES
>  WOLFTPM_LICENSE = GPL-2.0+
>  WOLFTPM_LICENSE_FILES = LICENSE
>  WOLFTPM_CPE_ID_VENDOR = wolfssl
> -WOLFTPM_DEPENDENCIES = host-pkgconf
>  WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
>  
>  # wolfTPM's source code is released without a configure script,
> @@ -19,8 +18,7 @@ WOLFTPM_AUTORECONF = YES
>  
>  WOLFTPM_CONF_OPTS = \
>  	--disable-examples \
> -	--enable-devtpm \
> -	--with-wolfcrypt=$(STAGING_DIR)/usr
> +	--enable-devtpm
>  
>  # Fix for missing config.rpath in the codebase
>  define WOLFTPM_TOUCH_CONFIG_RPATH
> @@ -29,4 +27,13 @@ define WOLFTPM_TOUCH_CONFIG_RPATH
>  endef
>  WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_TOUCH_CONFIG_RPATH
>  
> +ifeq ($(BR2_PACKAGE_WOLFTPM_WOLFCRYPT),y)
> +WOLFTPM_CONF_OPTS += \
> +	--enable-wolfcrypt \
> +	--with-wolfcrypt=$(STAGING_DIR)/usr
> +WOLFTPM_DEPENDENCIES += wolfssl
> +else
> +WOLFTPM_CONF_OPTS += --disable-wolfcrypt
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.35.1
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
