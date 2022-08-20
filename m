Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8CBC25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 12:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1057F4091C;
	Sat, 20 Aug 2022 12:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1057F4091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kjnGq8ccpTP; Sat, 20 Aug 2022 12:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C009405F7;
	Sat, 20 Aug 2022 12:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C009405F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 567761BF2B0
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 12:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3199B405F7
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 12:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3199B405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ky9cGjI63niz for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 12:42:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3285B4015A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3285B4015A
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 12:42:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 16F076013C;
 Sat, 20 Aug 2022 14:41:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 14:41:54 +0200
Date: Sat, 20 Aug 2022 14:41:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220820124154.GJ2167049@scaer>
References: <20220820121136.138738-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220820121136.138738-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660999318;
 bh=M/aO5wikSORLp33wpQNowkBTCRf33Y1OkqO+46uKIyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZYfqw3vT4Z0IxCMDZPblWPnai67lU6eRTasvjSV9MV9tCwFbXqgf9XRHRv3iWdf0S
 TYdAiS2m5bE6e7Zo0NNfVrDbOmjuNuRLAPjZhik/lW087W3Xz/ThWrmNdzp3gMcu2d
 CZ0R+NGG02MJXfz/cxy3/GtGSjMXH/87cl9Xf1WC0LJcVNhA85YN0a70Uh7TG+H1Lo
 Xfbe9nJZ1BBjTcxrXoZZ8+0ZUnopxRyLdYOcXxZKjKlf8dRtJe57Mc49QNWVfuCrWS
 oA0uwsUnw7c4Tw3zR0pTjqCE3G62wfFFzRTPm2YmDNgaFz5zUfBVaXCOu/sBkJ1cd7
 wUjAROp3Miomw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZYfqw3vT
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: needs gcc >= 8
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-20 14:11 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit fbff7d7289cc95db991184f890f4ca1fcf8a101e and
> https://github.com/USBGuard/usbguard/commit/4b4551023e3298a3639d2c52c559556dbe8d2d54:
> 
> checking whether we need to link to -lstdc++fs for PEGTL explicitly... ERROR
> configure: error: Link test failed both with and without -lstdc++fs; something is broken, please check file config.log for details.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/511c47802ce171caeeb9919371c58e6ad2d11a78
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/usbguard/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
> index 4c3dc7f2c2..59f8ddd305 100644
> --- a/package/usbguard/Config.in
> +++ b/package/usbguard/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_USBGUARD
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>  	depends on BR2_INSTALL_LIBSTDCPP # protobuf
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
>  	depends on !BR2_STATIC_LIBS # libqb, protobuf
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
>  	select BR2_PACKAGE_PROTOBUF
> @@ -18,9 +18,9 @@ config BR2_PACKAGE_USBGUARD
>  
>  	  https://usbguard.github.io/
>  
> -comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 7"
> +comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  comment "usbguard needs a toolchain not affected by GCC bug 64735"
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
