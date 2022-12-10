Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66A1C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4462160A65;
	Sat, 10 Dec 2022 17:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4462160A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuVdmrci5K9d; Sat, 10 Dec 2022 17:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6236E60806;
	Sat, 10 Dec 2022 17:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6236E60806
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6ED91BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEE3A81589
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEE3A81589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MNWVcpA9jP2 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:16:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49900814B8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49900814B8
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:16:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C8C9C5FFAF;
 Sat, 10 Dec 2022 18:16:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 18:16:07 +0100
Date: Sat, 10 Dec 2022 18:16:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221210171607.GD1044805@scaer>
References: <20221210162627.10466-1-gwenj@trabucayre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210162627.10466-1-gwenj@trabucayre.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670692572;
 bh=tEXfhlDGjeI0z4Kjc2WnNAW9Mefb/3De+8epIVjE3eY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgOsHZpEnyvqxdN649VATGzmSFEL0f8qkFl11eSpzakLdBzNYimlayRngUu2c1ZPo
 xauFBhstGbF5FGAw5a7FIDYmeEK24d47/5TuWaaIbRG5RqtSKhHKCV2HvPH0gXz0a8
 MbwBez0i4mkSKpSuYa4/mL3eNjvT4r/SaT6UtcfCwLkDyxNVrmzTxXoCWbKoAwrymC
 09cC+CIDZdyYhNuE11tgT2yqFojFESvv+vQk+a6tLCjQy/g5HcypmQ+82LX5KhMaRH
 ts5RAIZyK1uMZTjSjOEBfh8WQE9w/7//LbY/zgx+pCE7OAixAHXEryo7IiOxZhqXtK
 Kis5i9N17sCNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VgOsHZpE
Subject: Re: [Buildroot] [PATCH v3] package/gnuradio: restrict gcc to >= 8
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-12-10 17:26 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> With gnuradio 3.10 boost/filesystem was replaced by std::filesystem. This
> feature was introduces with gcc 8 (requirering -lstdc++fs (with
> gcc 9 explicit -lstdc++fs is no more explicitely required)).
> 
> With gcc < 8 build fails with error:
> 
> In file included from /home/br-user/work/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/boost/dll/runtime_symbol_info.hpp:11:0,
>                  from /home/br-user/work/instance-0/output-1/build/gnuradio-3.10.4.0/buildroot-build/gnuradio-runtime/lib/constants.cc:16:
> /home/br-user/work/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/boost/dll/config.hpp:42:10: fatal error: filesystem: No such file or directory
>  #include <filesystem>
>           ^~~~~~~~~~~~
> compilation terminated.
> 
> This patch add the dependency to gcc >= 8 and removes BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> dependency because it is only required for gcc < 7.

I reword that slightly.

> Also gcc restriction is required because volk needs a toolchain with a gcc > 7.

I also reword that slightly, as it was not explicit enough. (punt)

> Tested with bootlin toolchain 2020.02-2 (gcc 8.3.0)
> 
> fix:
> - http://autobuild.buildroot.net/results/6a82605c58f9ef9eb6c14603777dd8523dd00aa5/
> - http://autobuild.buildroot.net/results/c7c4ae76954e388ab639b39fd521d90acfe4edc9/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v2 -> v333

I was about to actually wait for v333, but decided we need the fix
now... ;-)

> - rewrite commit message
> - add dependency to gcc 8 (std::filesystem) instead of 9.3.0 (ubuntu 20.04 LTS)
> Changes v1 -> v2:
> - remove depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> - move gcc dependency to main comment
> ---
>  package/gnuradio/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index de19732cfb..b756f61ea3 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -1,12 +1,12 @@
> -comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
> +comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library gcc >= 8"

Missing comma between "dynamic library" and "gcc >= 8"

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
> -comment "gnuradio needs a toolchain not affected by GCC bug 43744 and 64735"
> +comment "gnuradio needs a toolchain not affected by GCC bug 43744"
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>  
>  config BR2_PACKAGE_GNURADIO
>  	bool "gnuradio"
> @@ -16,8 +16,8 @@ config BR2_PACKAGE_GNURADIO
>  	depends on BR2_USE_MMU # use fork()
>  	depends on BR2_USE_WCHAR # boost
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-thread
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_ATOMIC
>  	select BR2_PACKAGE_BOOST_DATE_TIME
> -- 
> 2.30.2
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
