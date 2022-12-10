Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E18C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122A9818C0;
	Sat, 10 Dec 2022 21:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 122A9818C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3cJUCobVfM7; Sat, 10 Dec 2022 21:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 438F9818B5;
	Sat, 10 Dec 2022 21:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438F9818B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 768701BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 560CD410A6
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560CD410A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 528B4MftUytE for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:13:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDC1410BB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEDC1410BB
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:13:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 788885FF96;
 Sat, 10 Dec 2022 22:13:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 22:13:06 +0100
Date: Sat, 10 Dec 2022 22:13:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221210211306.GG1044805@scaer>
References: <20221210210905.14201-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210210905.14201-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670706791;
 bh=QqNou+F+aFFcRKi1WUPuNH9U47ruFmCCpaVy9hSrSd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gNJY74RgiND2hLaAMs5+attRsf4UqxvxJ5YsDvCOkiUVZ4okq1ojgodCdqeaV4Xg/
 KvEfAKZIVgsAS4n5z5xwb6V+dpUU0GSwwL6j7U1+r+QW/upybPfkoIieoh13hamppL
 RbOmw62GVMeC9zHbSKoqsh+foyxqNSUZWNsm/yAAuN70nvgxJWNpJAhxEh/4GfvyAh
 gursSaJr31lXmtBhP8n3jMOSwz5f288nwdEwQWkvrIBrpUohwYs82VnoPKiPaSixOZ
 UERgnDwogSV43ZqCDpp2G0HWfcQa/+ao7zvC7+bz4aiPqgl6ILsL6fCH/uRk5Vw9sp
 T9SXUW4slQooQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gNJY74Rg
Subject: Re: [Buildroot] [PATCH 1/1] package/gqrx: fix dependencies
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-10 22:09 +0100, Fabrice Fontaine spake thusly:
> Commit 34cea39024bf8dedaa071bc5f2d903755501215c forgot to update
> gnuradio dependencies
> 
> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gqrx/Config.in | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
> index adcdbb0896..442b28e546 100644
> --- a/package/gqrx/Config.in
> +++ b/package/gqrx/Config.in
> @@ -1,15 +1,16 @@
> -comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
> +comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
>  	depends on BR2_USE_MMU # gnuradio
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_USE_WCHAR || BR2_STATIC_LIBS
> +		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  comment "gqrx needs qt5"
>  	depends on !BR2_PACKAGE_QT5
>  
> -comment "gqrx needs a toolchain not affected by GCC bug 43744 and 64735"
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744 || BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +comment "gqrx needs a toolchain not affected by GCC bug 43744"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
>  
>  config BR2_PACKAGE_GQRX
>  	bool "gqrx"
> @@ -21,8 +22,8 @@ config BR2_PACKAGE_GQRX
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_PACKAGE_QT5
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # gnuradio
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>  	select BR2_PACKAGE_BOOST_SYSTEM
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
