Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85730C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24D9640436;
	Thu, 12 May 2022 20:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7PaHWFEVqve; Thu, 12 May 2022 20:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A28140393;
	Thu, 12 May 2022 20:55:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70CB41BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ECCB41526
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXpjCc4mG3SL for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:55:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1942840351
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:55:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 787DC19F553;
 Thu, 12 May 2022 22:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652388914;
 bh=NaEZkQhauD0gB1fVTZ3Q9hRAIo51MT1hDDNKSCuBKYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PoJAjgNqPLYl/26/p+EppMl/K1pol8nwgEJzIjOEYQqWxwcrf7hnor9amiehD4R59
 AEaebAp4SszWEv1PhkyZA3QIRStxBY+9rvVJ2epR30PwO9UUWkvc9BvJ/j2EMyFi3P
 jeApBaznFDyOFdu/8We0OHnxe7zsvzNc67mmiIRO6On8XGluO1Y0uMKYsp6LAfRlp3
 Nh9vr319zbeQBqTWx6aHXk/SWILfrZazcgtSUcO7Rv849NY2CNwkZoJSpPMhKRlwWx
 rPYH5kxgrJ8nqz40nsr4omwzAMFnT9qetWG2BxgJUXuN86gaAwhXUZjHQFqkfGyysw
 A92b9WKX4j/Uw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:55:11 +0200
Date: Thu, 12 May 2022 22:55:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220512205511.GN1597494@scaer>
References: <20220512160116.2011627-1-arnout@mind.be>
 <20220512160116.2011627-5-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512160116.2011627-5-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 5/5] package/gnutls: libunistring is not
 optional
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
> Since the very beginning, libunistring was a mandatory dependency of
> gnutls. However, it would use its internal copy if libunistring was not
> selected. We never want that, so make libunistring an actual mandatory
> dependency.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/gnutls/Config.in | 5 ++---
>  package/gnutls/gnutls.mk | 9 ++-------
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 28982b15a1..b3f9f5420b 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -2,10 +2,9 @@ config BR2_PACKAGE_GNUTLS
>  	bool "gnutls"
>  	# https://gitlab.com/gnutls/gnutls/issues/203
>  	depends on !BR2_STATIC_LIBS
> -	# gnulib requires a library that implements wctomb().
> -	# This is noticed only when linking with libgnutls.so.
> -	depends on BR2_USE_WCHAR
> +	depends on BR2_USE_WCHAR # libunistring

In  fact, the wchar dependency is for gnutls itself; the source code is
littered with wchar_t everywhere, so I jsut dropped the comment.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_LIBTASN1
> +	select BR2_PACKAGE_LIBUNISTRING
>  	select BR2_PACKAGE_NETTLE
>  	help
>  	  GnuTLS is a secure communications library implementing the SSL
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 0210d18597..89ab9b9476 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -17,7 +17,7 @@ GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
>  GNUTLS_LICENSE_FILES += doc/COPYING
>  endif
>  
> -GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle
> +GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 libunistring nettle
>  GNUTLS_CPE_ID_VENDOR = gnu
>  GNUTLS_CONF_OPTS = \
>  	--disable-doc \
> @@ -25,6 +25,7 @@ GNUTLS_CONF_OPTS = \
>  	--disable-libdane \
>  	--disable-rpath \
>  	--disable-tests \
> +	--without-included-unistring \
>  	--without-libcrypto-prefix \
>  	--without-libdl-prefix \
>  	--without-libev-prefix \
> @@ -72,12 +73,6 @@ else
>  GNUTLS_CONF_OPTS += --without-p11-kit
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
> -GNUTLS_DEPENDENCIES += libunistring
> -else
> -GNUTLS_CONF_OPTS += --with-included-unistring
> -endif
> -
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  GNUTLS_CONF_OPTS += --with-zlib
>  GNUTLS_DEPENDENCIES += zlib
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
