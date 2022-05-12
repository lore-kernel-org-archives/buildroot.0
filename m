Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361F9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB609416AC;
	Thu, 12 May 2022 20:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZwPWRZEt3VE; Thu, 12 May 2022 20:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93487416BF;
	Thu, 12 May 2022 20:54:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF0371BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE18C40351
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwLzEgHQaPGT for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:54:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9605E410C6
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:54:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0209A19F4EA;
 Thu, 12 May 2022 22:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652388848;
 bh=BzMMPWJzxxXAXUpX3PiqIi3fnbO8ZKanaHyyWUrEReI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ByeDI3KT11EBC9HpFwQ/fgdBA7ERrZOLvLAdAbgWTWsG47T3zMACapc6fjXRJmssF
 Qhe4WFMzlu4Pz+KwTc7gkaQHIYv0Pj4hSe6Nfaa7ieR4fKdpW3XkXEt2G3VI7uaksw
 tOHDZ3KqyKki/OL+RluKvXvbjG4a1xQO+BN8QfSPmR/D56eC3yet+pU/FGz6CrKLXe
 WEpw/aM/c0GR6lxUCNWdkukPK9vAFFz+i0gfftw8NNudzT1TzrgyeQQJ5a63leIII2
 1c2pUwRCsg22YKrr1xaeHqvVBbv7v2nCUGsJ/j3cBiCiUiBEK3tNBH1NOWp3EqH2ig
 /rqOE8R7AiWww==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:54:04 +0200
Date: Thu, 12 May 2022 22:54:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220512205404.GM1597494@scaer>
References: <20220512160116.2011627-1-arnout@mind.be>
 <20220512160116.2011627-4-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512160116.2011627-4-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 4/5] package/gnutls: add optional dependency
 on brotli, zlib, zstd
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-05-12 18:01 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Version 3.7.4 added compression options with brotli, zlib and zstd.
> These are automatically discovered, which makes their inclusion depend
> on the build order. Therefore, explicitly enable/disable them.
> 
> Note that the configure help text says "--without-brotli" and
> "--without-zstd", but the options are actually --without-libbrotli and
> --without-libzstd. --without-zlib is correct in the help text.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> NOT for stable since 3.7.3 didn't have these yet.
> ---
>  package/gnutls/gnutls.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 1d997781b0..0210d18597 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -46,6 +46,13 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
>  	gl_cv_func_gettimeofday_clobber=no
>  GNUTLS_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_BROTLI),y)
> +GNUTLS_CONF_OPTS += --with-libbrotli
> +GNUTLS_DEPENDENCIES += brotli
> +else
> +GNUTLS_CONF_OPTS += --without-libbrotli
> +endif
> +
>  ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
>  GNUTLS_CONF_OPTS += --enable-cryptodev
>  GNUTLS_DEPENDENCIES += cryptodev-linux
> @@ -71,6 +78,20 @@ else
>  GNUTLS_CONF_OPTS += --with-included-unistring
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +GNUTLS_CONF_OPTS += --with-zlib
> +GNUTLS_DEPENDENCIES += zlib
> +else
> +GNUTLS_CONF_OPTS += --without-zlib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +GNUTLS_CONF_OPTS += --with-libzstd
> +GNUTLS_DEPENDENCIES += zstd
> +else
> +GNUTLS_CONF_OPTS += --without-libzstd
> +endif
> +
>  # Provide a default CA cert location
>  ifeq ($(BR2_PACKAGE_P11_KIT),y)
>  GNUTLS_CONF_OPTS += --with-default-trust-store-pkcs11=pkcs11:model=p11-kit-trust
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
