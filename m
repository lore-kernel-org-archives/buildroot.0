Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF802C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 21:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2490760A94;
	Sat, 18 Nov 2023 21:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2490760A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MAfjeeMo9F6; Sat, 18 Nov 2023 21:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E00360AE8;
	Sat, 18 Nov 2023 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E00360AE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 350A01BF836
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AFD74161A
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 21:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFD74161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFcvLyANals1 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 21:46:36 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1A48415A9
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 21:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A48415A9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0064B780331;
 Sat, 18 Nov 2023 22:46:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 22:46:30 +0100
Date: Sat, 18 Nov 2023 22:46:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231118214630.GL996011@scaer>
References: <20231118194526.467059-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231118194526.467059-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700343993;
 bh=KykdmiY65NKxIdhgG+lHkqZ1UJqGrL7k3MvxlW5SAOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q0CVmgRBWluJrh7bBlXDNp5pCxVvpNB0lfuEmBSUs1IZfM90XbsA7hqpexhL+pAf0
 7cONc8qnnHpHrLKfplT6KU5tfFPzn7rUD2kUSs/vlxmriPSGA0smJbOSSE9zSb17VK
 tEzE5Z9lm1ZEWeA4m0zywdiNEoBXt6P64Ij5ffo+UQ8IdIvOPSsGo+VFZqDREhBqWf
 zIgK50K02giEzCD1oy9SQmpmn/8NyuoOKi/K9D1hnXEyeR374IP+ZXWRP0uq+6BqE4
 eElwxqZJzbS1oxQNy3+r+WrvDah/GxkQk2H3Z5puzqBs1IFIYGAlJ6zh7PVxi7jJ8F
 Qnq0gtEQraYVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q0CVmgRB
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: downgrade GCC version
 requirements to 10
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

Adam, All,

On 2023-11-18 12:45 -0700, Adam Duskett spake thusly:
> NodeJS requires GCC 10.1. However, GCC 10.1 is the first GCC release.

That last part was confusing: "GCC 10.1 is the first GCC release";
surely there have been many GCC releases before 10.1! ;-)

I've rewrittent this part to make it explicit it was that "GCC 10.1 is
the first release of the GCC 10.x series".

> As such, we can safely downgrade the GCC version requirements to 10.
> 
> Tested with: run-tests tests.package.test_nodejs using Debian 11 and
> gcc 10.2.1.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 72770095d0..50d1360715 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -7,19 +7,19 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  
> -comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 11, wchar, host gcc >= 11"
> +comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 10, wchar, host gcc >= 10"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> -		!BR2_HOST_GCC_AT_LEAST_11 || !BR2_TOOLCHAIN_GCC_AT_LEAST_11 || !BR2_USE_WCHAR
> +		!BR2_HOST_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_NODEJS
>  	bool "nodejs"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
> -	depends on BR2_HOST_GCC_AT_LEAST_11
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	depends on BR2_HOST_GCC_AT_LEAST_10
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	depends on BR2_USE_WCHAR
>  	# uses fork()
>  	depends on BR2_USE_MMU
> -- 
> 2.42.0
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
