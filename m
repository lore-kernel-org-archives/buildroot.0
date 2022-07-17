Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B19C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 09:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C797813F2;
	Sun, 17 Jul 2022 09:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C797813F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vVROuVauwS7c; Sun, 17 Jul 2022 09:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41396813ED;
	Sun, 17 Jul 2022 09:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41396813ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 429FD1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D45F813E5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 09:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D45F813E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18Ax4t8QDPPu for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 09:07:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68B5813C1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D68B5813C1
 for <buildroot@busybox.net>; Sun, 17 Jul 2022 09:07:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 608A9780505;
 Sun, 17 Jul 2022 11:07:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 11:07:19 +0200
Date: Sun, 17 Jul 2022 11:07:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220717090719.GE2543@scaer>
References: <55f81de26c9b74283245f427bc7dd7ff4db09c06.1657777745.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55f81de26c9b74283245f427bc7dd7ff4db09c06.1657777745.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658048843;
 bh=IlAIqNF46QztN7f2vwfQV2bYeNbZfww2oGHBKQJRwKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EajpUTBW11bMp4KuD0wQgsBNjF8zLOwJRr6RXxhkXo/WE3+5mg4owdnjNMA5Zvi2L
 6utnNHIzYr5A+5QibLAyMX/jykcu8U3ts0uT0hmJSldr+TBjQ1g93Rkt/HdXptO3Ig
 EqznbP3+B422D9rBsw8YN37dXCEUDkb8H6VV4wxpa9VeNN75f94KtiWjsHpoJ2t/CX
 piKc+A1GToUGcgdIvZGlPoEwH8MCIp0zi47AI7tjrG4fzZk/AglbkI1/Mh48ZnpZZ1
 raiChlYTyCOIFzjEURZK6SKgMgd2DnFeYTaFtdFaKBf+QDtSDPDleyv7Y7iziRSbsn
 7jYfHcG7ns4Vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EajpUTBW
Subject: Re: [Buildroot] [RFC PATCH v2] package/uacme: requires TLS support
 in libcurl
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
Cc: buildroot@busybox.net, Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, Nicola, All,

On 2022-07-14 08:49 +0300, Baruch Siach via buildroot spake thusly:
> uacme configure script fails when libcurl does not support TLS. This
> means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme. But
> there is no way to change the choice to something other than
> BR2_PACKAGE_LIBCURL_TLS_NONE. So instead make uacme depend on libcurl
> and !BR2_PACKAGE_LIBCURL_TLS_NONE.
> 
> As a result we can no longer select BR2_PACKAGE_OPENSSL since it causes
> recursive dependency. Use 'depend on' instead, and add a comment to
> explain this uncommon choice.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
> 
> Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>   Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
> ---
>  package/uacme/Config.in | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index 58b7c534e73d..815ab5da7d61 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -1,8 +1,9 @@
>  config BR2_PACKAGE_UACME
>  	bool "uacme"
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
> -	select BR2_PACKAGE_LIBCURL
> +	# We can not use select here as it causes recursive dependency
> +	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS
> +	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE

I don't think this is correct. Indeed, even with one of those packages
enabled, there is nothing that prevents libcurl to be linked with
another TLS provider, as that is decided with the choice entries, not
with the packages being enabled.

Instead, what about:

    depends on BR2_PACKAGE_LIBCURL_OPENSSL \
            || BR2_PACKAGE_LIBCURL_GNUTLS \
            || BR2_PACKAGE_LIBCURL_MBEDTLS

That way, it encodes both the fact that libcurl is enabled, *and* that
is has the proper TLS support enabled.

>  	help
>  	  uacme is a client for the ACMEv2 protocol described in
>  	  RFC8555, written in plain C with minimal dependencies
> @@ -14,6 +15,13 @@ config BR2_PACKAGE_UACME
>  
>  	  https://github.com/ndilieto/uacme
>  
> +comment "uacme needs one of openssl, gnutls or mbedtls"
> +	depends on !BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_MBEDTLS

That's not correct. It would be better to phrase it, as Nicola suggested
in their review of v1:

    comment "uacme needs libcurl with openssl, gnutls or mbedtls"
            depends on BR2_USE_MMU
            depends on !BR2_PACKAGE_LIBCURL_OPENSSL \
                    && !BR2_PACKAGE_LIBCURL_GNUTLS \
                    && !BR2_PACKAGE_LIBCURL_MBEDTLS

> +comment "uacme needs libcurl with TLS support"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_PACKAGE_LIBCURL || BR2_PACKAGE_LIBCURL_TLS_NONE

... then this comment is no longer needed.

Also, comments about packages being not available should go either
before the main symbol, or after the conditional options. Otherwise, the
sub-options are not indented below the main symbol. With your code:

    [*] uacme
    [ ] enable ualpn

while we want:

    [*] uacme
    [ ]   enable ualpn

I'd have fixed that when applying, but I prefer to get some feedback
about my proposal on the dependendcy condition.

Regards,
Yann E. MORIN.

>  if BR2_PACKAGE_UACME
>  
>  config BR2_PACKAGE_UACME_UALPN
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
