Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D29C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08B474018E;
	Sat, 18 Dec 2021 21:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33GzOGCbBRt1; Sat, 18 Dec 2021 21:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E51BE40157;
	Sat, 18 Dec 2021 21:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C0591BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38EC640157
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r52a4bBwtYkK for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:43:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 014F8400AF
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:43:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 83D275FF6C;
 Sat, 18 Dec 2021 22:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639863792;
 bh=WrEVuK4OAbkppGLI2g5JG3QsjxOgaY27q/Y+aj27O8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BHGFoPOvNYgLxyGOeVCwlvVg7m+bJUBkpOj/b0DHfNSpnp7s65xHZIVAOYl/hyGKd
 PRZ8hVfAch079S1OfNcq8IkC/CbGKd/FUY9IHWmDop6t1UYFfNH7Z0ENdsRCgioHxe
 tcmbyS/JFmB8Nd3GOi+E4VwhmhvUlAJ3siwhCfqvRjKC9uIY3/cTVzrAG8zkrv+Pd1
 8QlX0txqaNyOZm+5lyOfORIi2Vcrpxs1Q6qLX+SFnNYLeae4tyTGj3V4yhpIRfQw1x
 ZOvbUSJ2NYkpbK7z2Cq5j5h0cGGRkYIjTkOzVSU2ccPYsa7TgEVK3W99+PCTqp8J6Z
 sjzSuRiKy9Frg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:43:08 +0100
Date: Sat, 18 Dec 2021 22:43:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218214308.GP2603@scaer>
References: <20211217225416.107885-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217225416.107885-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cups-pk-helper: fix dependencies
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

Fabrice, All,

On 2021-12-17 23:54 +0100, Fabrice Fontaine spake thusly:
> Fix dependencies which are wrong since the addition of the package in
> commit e13c9ccf436cf13b53bec6933e5be4bb071cfad9 resulting in the
> following build failure:
> 
> Makefile:587: *** duktape is in the dependency chain of polkit that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/706a09b245880e99109a4cc99faffe83f458afc4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cups-pk-helper/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
> index 63a0d3acd8..113f433795 100644
> --- a/package/cups-pk-helper/Config.in
> +++ b/package/cups-pk-helper/Config.in
> @@ -1,8 +1,10 @@
>  config BR2_PACKAGE_CUPS_PK_HELPER
>  	bool "cups-pk-helper"
> +	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
>  	depends on BR2_USE_WCHAR # libglib2
> +	depends on !BR2_STATIC_LIBS # polkit -> duktape
>  	depends on BR2_PACKAGE_CUPS
>  	select BR2_PACKAGE_POLKIT
>  	help
> @@ -11,7 +13,7 @@ config BR2_PACKAGE_CUPS_PK_HELPER
>  
>  	  https://wiki.freedesktop.org/www/Software/cups-pk-helper/
>  
> -comment "cups-pk-helper support needs a toolchain with threads, wchar, gcc >= 7"
> +comment "cups-pk-helper support needs a toolchain with threads, wchar, dynamic library, gcc >= 7"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> -- 
> 2.33.0
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
