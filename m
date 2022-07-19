Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321ACC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 03:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C9640529;
	Tue, 19 Jul 2022 03:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C9640529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKWjWW5pDVgb; Tue, 19 Jul 2022 03:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CE6D401B1;
	Tue, 19 Jul 2022 03:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE6D401B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8AE1BF418
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 03:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 218D283E24
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 03:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 218D283E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wn0Q4PRufPy7 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 03:37:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26EF283E1C
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26EF283E1C
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 03:37:47 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 962DF4407B7;
 Tue, 19 Jul 2022 06:37:19 +0300 (IDT)
References: <20220718203847.2646609-1-yann.morin.1998@free.fr>
User-agent: mu4e 1.8.5; emacs 27.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue, 19 Jul 2022 06:29:53 +0300
In-reply-to: <20220718203847.2646609-1-yann.morin.1998@free.fr>
Message-ID: <87a695ydq0.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658201839;
 bh=OMH1jlu3CnxW4rfyi1z1KlhTorvg3heeBy+vEJ/qK3s=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=ekACBWEewe6VE4vnjJjwYHLIN0MYAgGGyrsDgqjOqC3rDi84N8/DIbGkblmudgki7
 QhBahgDo5zBVd9u8cTWIRo0E+uPWUOuqTmTHgaS1PNW1JdQHCQ7u0BZ/uDahCXuk9V
 o6WzMU1/H0es3CAx9RCIqktGNzdtj2dgnYNJyFCHqiH3UaPe/IwGqEfTq+zjCAcrSr
 GlakJO3m7vojvjVTkZv1N6n62M5hJSJK9Dq7txL4nrQyYY91hbdhOOGWaTpUkjCGSj
 C4OLAzMhtz28t8En1rNj2PxVTl6eSe4V4LGE0GlbEX9x4572nDvGj+ZlAEbu7BJ4UL
 sssYwEeFor+tQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=ekACBWEe
Subject: Re: [Buildroot] [PATCHv5] package/uacme: requires TLS support in
 libcurl
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Mon, Jul 18 2022, Yann E. MORIN wrote:
> From: Baruch Siach <baruch@tkos.co.il>
>
> uacme configure script fails when libcurl does not support TLS. This
> means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.
>
> Add a kconfig knob to libcurl, BR2_PACKAGE_LIBCURL_FORCE_TLS, so that
> _TLS_NONE is not an option. Select that from uacme.
>
> Note that, beside selecting BR2_PACKAGE_LIBCURL_FORCE_TLS, packages will
> have to also select a package that can be used as a crypto backend by
> libcurl. Use of BR2_PACKAGE_LIBCURL_FORCE_TLS is unlikely to become very
> common in the foreseeable future, so we don't need to optimize for this
> corner case.

This sentence is not clear without its original email discussion
context. So I'd add in its end: "... with automatic selection of crypto
backend".

>
> uacme already needs a crypto package for itself, so the above
> requirement is naturally met for uacme.
>
> Fixes:
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
> http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
>
> Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> [yann.morin.1998@free.fr:
>   - keep the current forward select
>   - add the kconfig knob
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

LGTM. Not this is the right tag since I'm technically the patch
author. But FWIW here it is anyway.

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
> v5 (Yann E. MORIN):
>   Rename knob to _FORCE_TLS (Baruch)
>   _FORCE_TLS needs a crypto package to be selected (Baruch)
>   Expand commit log to explain that (Baruch)
>
> v4 (Yann E. MORIN):
>   Restore forward select
>   Add the _FORCE_SSL_TLS kconfig knob; use it from uacme
>
> v3:
>   Move comments up to fix suboption indentation (Yann)
>   Add missing MMU comment dependency (Yann)
>
> v2:
>   Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
> ---
>  package/libcurl/Config.in | 7 +++++++
>  package/uacme/Config.in   | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index 3381decca8..bc2f8f47f2 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -45,6 +45,12 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
>  	  - DICT
>  	  - Gopher
>  
> +# Packages must select that if they require a SSL/TLS-enabled libcurl.
> +# Those packages must also select one crypto package that can be used
> +# as a backend below.
> +config BR2_PACKAGE_LIBCURL_FORCE_TLS
> +	bool
> +
>  choice
>  	prompt "SSL/TLS library to use"
>  
> @@ -77,6 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
>  
>  config BR2_PACKAGE_LIBCURL_TLS_NONE
>  	bool "None"
> +	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
>  
>  endchoice
>  
> diff --git a/package/uacme/Config.in b/package/uacme/Config.in
> index 58b7c534e7..796f54754e 100644
> --- a/package/uacme/Config.in
> +++ b/package/uacme/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>  	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBCURL_FORCE_TLS
>  	help
>  	  uacme is a client for the ACMEv2 protocol described in
>  	  RFC8555, written in plain C with minimal dependencies


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
