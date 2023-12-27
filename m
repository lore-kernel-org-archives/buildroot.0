Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8228CC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149008329E;
	Wed, 27 Dec 2023 22:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 149008329E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id htMLUvZ7wxbS; Wed, 27 Dec 2023 22:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 637F4832BF;
	Wed, 27 Dec 2023 22:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 637F4832BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA6C1BF375
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 248FD419E9
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 248FD419E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AImTFIbmuh_O for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:01:23 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9321419E3
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9321419E3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 152FFB00571;
 Wed, 27 Dec 2023 23:01:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:01:17 +0100
Date: Wed, 27 Dec 2023 23:01:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZYyerZuZJFLXJx0x@landeda>
References: <20231227105607.1010960-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227105607.1010960-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703714481;
 bh=RJPSmq14I0upJdssZEQlLZvHGwaRS/zvQbS1yv6J2kU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jqfb2YjeYu3NbL264l0WL4RSO120WxojTy9oI+tWF9cIuGfGOeRezbRd5RMT3m20Z
 Df6i0HUeUjR7+2zttMiMXE3RRJNNoFCLRaS6yD5L049WODjrFKsBmfnelHoPSisoh/
 ln8l1ldPK21ohrY9g2v357C8iCr35X2NIQ4TBmv3ycGVgbzMtdNQto/ID3qHQIPh6l
 S3QWi2EfocyPPhtQr+NkvBT1Y9EdikItIwEKBQDYgyYGPUi9VDl2/fuYT25+ELGOQ6
 DRxYSCtHA0x+ANFsTc3KrVatLFYhoEayI2Fc3K0omWVFonuulJEFLGdTd6tY1FvPM9
 aIPpgA7bGmXhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jqfb2Yje
Subject: Re: [Buildroot] [PATCH 1/1] package/libostree: switch to libsoup3
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-12-27 11:56 +0100, Fabrice Fontaine spake thusly:
> libsoup3 is supported since bump to version 2023.3 in commit
> 618eb375a046cc4ff007758510c883788e6ff690 and
> https://github.com/ostreedev/ostree/commit/d0ea2db4300eb7871b59d0b997a7f06869120297
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libostree/libostree.mk | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index d13f484041..a737dc047f 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -17,6 +17,7 @@ LIBOSTREE_CONF_ENV = \
>  	GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
>  LIBOSTREE_CONF_OPTS += \
>  	--with-gpgme-prefix=$(STAGING_DIR)/usr \
> +	--without-soup \

AFAICS, upstream still supports libsoup2, and the commit you reference
even mentions it is still the default. But seeing the code in that
commit, if both are enabled, libsoup3 is still the preferred option.

However, what your patch does, is to really switch over to libsoup3, and
no longer use libsoup2 as a falback at all.

That's fine, but that should be explained and motivated in the commit
log.

CCan you expand on that and respin, pleasE?

Regards,
Yann E. MORIN.

>  	--disable-gtk-doc \
>  	--disable-gtk-doc-html \
>  	--disable-gtk-doc-pdf \
> @@ -44,10 +45,10 @@ else
>  LIBOSTREE_CONF_OPTS += --without-avahi
>  endif
>  
> -#cURL support depends on libsoup
> -ifeq ($(BR2_PACKAGE_LIBSOUP),y)
> -LIBOSTREE_CONF_OPTS += --with-soup
> -LIBOSTREE_DEPENDENCIES += libsoup
> +# cURL support depends on libsoup3
> +ifeq ($(BR2_PACKAGE_LIBSOUP3),y)
> +LIBOSTREE_CONF_OPTS += --with-soup3
> +LIBOSTREE_DEPENDENCIES += libsoup3
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  LIBOSTREE_CONF_OPTS += --with-curl
>  LIBOSTREE_DEPENDENCIES += libcurl
> @@ -55,7 +56,7 @@ else
>  LIBOSTREE_CONF_OPTS += --without-curl
>  endif
>  else
> -LIBOSTREE_CONF_OPTS += --without-soup --without-curl
> +LIBOSTREE_CONF_OPTS += --without-soup3 --without-curl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
> -- 
> 2.43.0
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
