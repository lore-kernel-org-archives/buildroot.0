Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C8FC43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 21:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1468832AA;
	Mon, 18 Jul 2022 21:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1468832AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52lPuLl6yJ-D; Mon, 18 Jul 2022 21:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D73A83298;
	Mon, 18 Jul 2022 21:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D73A83298
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7883B1BF3C1
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B71683298
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 21:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B71683298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Op5PNXq7c2hM for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 21:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD5383295
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDD5383295
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 21:30:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7E98913F880;
 Mon, 18 Jul 2022 23:30:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Jul 2022 23:30:38 +0200
Date: Mon, 18 Jul 2022 23:30:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <20220718213038.GF2249625@scaer>
References: <20220718114540.257654-1-aleksandr.o.makarov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718114540.257654-1-aleksandr.o.makarov@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658179840;
 bh=fzF84WCLeFVO8YpiNnS+dB/IzzFq4S3qbvTBwojSdGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HqO3OG9Qy9EkU1TMMOpeArKCHnl5A589BXIShT71rra8nbzciR/K2rI/z0Ua4hRtb
 dF8tT0+/dXmaCL3HllbRmja4ABroQoGjCRmu2MbzJ8jl1qrTnV38HNZNKXm1p8zOH6
 t0cZqpffSGrNy5JBqLYkSwXqDWG1ESVw732zq60u5gRSqo0wNN/Bl9fzidlQqs62ln
 aQBwOcG8PZMgvW6toxzBHgLXCx2frUeax750gbpiodJ9RoVZ1tPvwhhiZH7sP0lNd/
 d/8eR6PiZUifwaEOCCLKboDEUv8RyoPbO1xXufgTLpTpf+sr6xrLhFpV6HF5trut81
 xYtmL7WsEYBAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HqO3OG9Q
Subject: Re: [Buildroot] [PATCH 1/1] package/libest: bump version
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Aleksandr, All,

On 2022-07-18 14:45 +0300, Aleksandr Makarov spake thusly:
> Remove upstream patches
> 
> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/libest/0001-Fix-.-configure-without-system-libsafec-mistakenly-u.patch b/package/libest/0001-Fix-.-configure-without-system-libsafec-mistakenly-u.patch
> new file mode 100644
> index 0000000000..a16cd4ba77
> --- /dev/null
> +++ b/package/libest/0001-Fix-.-configure-without-system-libsafec-mistakenly-u.patch
> @@ -0,0 +1,27 @@
> +From 353df199bbcdae487f3476b65f35ab0383f6ba6b Mon Sep 17 00:00:00 2001
> +From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> +Date: Mon, 18 Jul 2022 12:43:43 +0300
> +Subject: [PATCH] Fix './configure --without-system-libsafec' mistakenly using
> + system-installed libsafec

I'd extend the commit message for this patch with something like:

    The third argument to AC_ARG_WITH() is executed when either
    --with-OPT *or* --without-OPT is specified. That means that,
    when calling ./configure --without-libsafec, the current
    code actually enables it instead of diabling it.

    Just provide an empty argument to keep the proper value.

> +Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>

You should also send ths patch upstream and add a reference to the
correponding pull request.

[--SNIP--]
> diff --git a/package/libest/libest.mk b/package/libest/libest.mk
> index d9f3cf87bc..243cd61099 100644
> --- a/package/libest/libest.mk
> +++ b/package/libest/libest.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBEST_VERSION = 3.2.0
> -LIBEST_SITE = $(call github,cisco,libest,r$(LIBEST_VERSION))
> +LIBEST_VERSION = f8a6e5b53a5f70e72fe4029981df0693b17cbb32
> +LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
>  # We don't build examples, so we're not affected by the OpenSSL
>  # license
>  LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
> @@ -60,6 +60,8 @@ LIBEST_CONF_OPTS += --with-system-libsafec
>  LIBEST_DEPENDENCIES += safeclib
>  else
>  LIBEST_CONF_OPTS += --without-system-libsafec
> +# Falling back to built-in libsafec with --disable-safec

Wait, do you mean that --disable-safec will make libest use its bundled
opy and there is no wau to saible it? If so, then we don;t want to make
the dependency on safeclib optional, but mandatory.

Otherwise, did you mean:
    # Use --disable-safec to prevent use of bundled safec

> +LIBEST_CONF_OPTS += --disable-safec

You should just wirte it with a single assignment:

    # Use --disable-safec to prevent use of bundled safec
    LIBEST_CONF_OPTS += --without-system-libsafec --disable-safec

Regards,
Yann E. MORIN.

>  endif
>  
>  define LIBEST_INSTALL_PC
> -- 
> 2.36.1
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
