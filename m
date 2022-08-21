Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C8C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 13:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E6754098D;
	Sun, 21 Aug 2022 13:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E6754098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fn8bZyriJ5fF; Sun, 21 Aug 2022 13:16:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B404097A;
	Sun, 21 Aug 2022 13:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B404097A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0EFA1BF30D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBE44818CD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 13:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBE44818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9hgL3duAzrS for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 13:16:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13671818C9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13671818C9
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 13:16:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 67E7213F86F;
 Sun, 21 Aug 2022 15:16:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 15:16:06 +0200
Date: Sun, 21 Aug 2022 15:16:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220821131606.GV2775145@scaer>
References: <20220821114343.10984-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821114343.10984-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661087768;
 bh=j5qq+j3ychFklO+iIntJAr51yW+xoIzVlIr2WDTPB5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zl9zB2hOV/wKpONGZ6LmAImAX2MpC8fWCNQWT73BHlSJaskZa1dNwHNfTSpFNsomV
 359Y+LRBhm0lnxSQYEnqkG0uqxHKHMKcEXW687ilUtNoA+MAYY7BYHrSPdj0lnAH27
 sYRs5IFMw1XK8oH0mAG6EaZeeL1yVkr/ObB22FyYkmmPrORIbWjuau+qY4d4vR94TJ
 XmXbta1DIDCc9raQH3jJ+MsH4ft3JO869WvdmFY8IGOL4L7PNUdW1lV4gCd37F6evP
 DtyKoc4mLgPGR2STogzLtWUyf+0ELazqd9VsJM7y0NKnJJqHxY3F99mDZJiKued3sy
 DC08/d1WGXqIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zl9zB2hO
Subject: Re: [Buildroot] [PATCH 1/1] package/zeek: needs C++17
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

On 2022-08-21 13:43 +0200, Fabrice Fontaine spake thusly:
> zeek needs C++17 since its addition in commit
> ea36681572255ec906167308c07adc42ed2ac9f9 resulting in the following
> build failure:
> 
> CMake Error at auxil/bifcl/cmake/RequireCXX17.cmake:46 (message):
>   GCC version must be at least 7.0 for C++17 support, detected: 6.3.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4d11e8bea1f7ed0b04cd7e123ed2f352e7a9e77f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zeek/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zeek/Config.in b/package/zeek/Config.in
> index f2a769621f..114ec4235d 100644
> --- a/package/zeek/Config.in
> +++ b/package/zeek/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_ZEEK
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # host-zeek
>  	select BR2_PACKAGE_LIBPCAP
>  	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_OPENSSL
> @@ -33,7 +35,9 @@ config BR2_PACKAGE_ZEEK_ZEEKCTL
>  
>  endif
>  
> -comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library"
> +comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 7"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_HOST_GCC_AT_LEAST_7
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
