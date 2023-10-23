Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116BFC25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6694226E;
	Mon, 23 Oct 2023 17:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB6694226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDjYHreAwiDk; Mon, 23 Oct 2023 17:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D100F42254;
	Mon, 23 Oct 2023 17:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D100F42254
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 992EB1BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F03E8347D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F03E8347D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwpu6xNB_uIk for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:25:53 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31F39830A7
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F39830A7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:8ed0:8cf1:4440:5c7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 729002003F3;
 Mon, 23 Oct 2023 19:25:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Oct 2023 19:25:48 +0200
Date: Mon, 23 Oct 2023 19:25:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231023172548.GZ2607@scaer>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
 <20231023092501.481436-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023092501.481436-3-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698081951;
 bh=uZx4Tv8exVVLf/AwkOW5Sp5xI0nuzyYpjpBnRi1N39o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YdEOi8zpkxEsfOOdyC90+2UbIXuJk3q76X/LoaI5WuHG5oXsw/dL67FfTqaV9lusd
 8SP0UovYlqj3q+m7gk8aVB0q8NZh3QKjmExJkYGCpNQ2h5HKOdkKnLwnwLJCy1UfeH
 qlG+syYN2TeVQ/OQMCPVhvE1GDuSUC4VUGnlfi3CFM16f1QO4/reebVCltNeDBCIKw
 DEGZAxnl4vPN0ZKHOtG2PirPxp2DWiPyArJNpuyIIc7k8XJfUh33De9VQ3RHyLYzXi
 ZMsQNkWi7TFqsAJyzQtScWniNEBo/jM7+t2iFjgxbHflfcLNadXVZCOTFKZK8+vK2a
 XGAoMiJSNZQgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YdEOi8zp
Subject: Re: [Buildroot] [PATCH 3/8] package/opkg: add zstd support
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-23 11:24 +0200, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/opkg/Config.in | 8 ++++++++
>  package/opkg/opkg.mk   | 9 ++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/opkg/Config.in b/package/opkg/Config.in
> index 1f6a39343f..c3c2463393 100644
> --- a/package/opkg/Config.in
> +++ b/package/opkg/Config.in
> @@ -30,4 +30,12 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
>  	  Enable opkg package signature checking support using
>  	  gnupg/libgpgme.
>  
> +comment "compression support"
> +
> +config BR2_PACKAGE_OPKG_ZSTD
> +	bool "zstd support"
> +	select BR2_PACKAGE_ZSTD
> +	help
> +	  Enable zstd compressor support.

The usual way if a library is optional, is to rely on that library being
enabled by the user, not by adding options for each.

So I dropped the option, and...

>  endif
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index 9b1ffb3c74..605d4de82f 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -10,7 +10,7 @@ OPKG_DEPENDENCIES = host-pkgconf libarchive
>  OPKG_LICENSE = GPL-2.0+
>  OPKG_LICENSE_FILES = COPYING
>  OPKG_INSTALL_STAGING = YES
> -OPKG_CONF_OPTS = --disable-curl --disable-zstd
> +OPKG_CONF_OPTS = --disable-curl
>  
>  # Ensure directory for lockfile exists
>  define OPKG_CREATE_LOCKDIR
> @@ -27,6 +27,13 @@ else
>  OPKG_CONF_OPTS += --disable-gpg
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPKG_ZSTD),y)

... changed this to directly depend on the zstd libray to be enabled.

I see that you tried and did like the gpg support, but that was added 10
years ago now [0], and we may have been a little bit less trict then.
Now, let's try to be more consistent.

I've done so for all the other compression support and for libcurl, so I
will not reply to each individually to repeat the same thing; consider
they have been handled like this patch.

Applied to master, thanks.

[0] and that was even the commit that separated the hook macro and the
hook assignemnt further apart; I've fixed that now.

Regards,
Yann E. MORIN.

> +OPKG_DEPENDENCIES += zstd
> +OPKG_CONF_OPTS += --enable-zstd
> +else
> +OPKG_CONF_OPTS += --disable-zstd
> +endif
> +
>  OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
>  
>  $(eval $(autotools-package))
> -- 
> 2.41.0
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
