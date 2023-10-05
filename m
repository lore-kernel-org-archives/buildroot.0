Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66885E92734
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 20:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FFCB42491;
	Thu,  5 Oct 2023 20:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FFCB42491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3BaWXXKyQlh; Thu,  5 Oct 2023 20:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBF2542886;
	Thu,  5 Oct 2023 20:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBF2542886
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1A351BF40E
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 20:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A733D40280
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 20:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A733D40280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jn7y46Iv3Vb for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 20:00:17 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A99BC400C6
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 20:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A99BC400C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c5c9:a1ea:cbf9:9051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DA70319F54D;
 Thu,  5 Oct 2023 22:00:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Oct 2023 22:00:12 +0200
Date: Thu, 5 Oct 2023 22:00:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <20231005200012.GC2552@scaer>
References: <20231005144250.43169-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231005144250.43169-1-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696536016;
 bh=gw8Ckfw0Zq0y6yDi+dSXqBwP7Zg8NA2iivoBLzjparM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AT2QARds76TZGcrsVMCj1vEw+pJsKgklPfS589K+1XUFRSyFVkUE18HlmDEbefRhu
 HpHuUabyhPrdxU8U3V2ltX0uAeNKN4yQuDXttgK4iifomOsoc1i9lAE1pmh/X9YYH1
 X8sgtrB015AcccwaaPxPzOAAvIklek3kX4QehxM0o4qR9udZrhOQKc46fWSj5pkzoG
 kmEVnZXuaWTYwmb5KgTcC0xM6BqO712M+KcPgQ5HLU7IhN/c+MIMZwoiiah4zKi3qj
 bxhtp8LAl2TjPgt2mjBqp3OenVZOrkGfrXLw4qAZxmVmo2msTGLTviasTzB5+69JLN
 NHMZSCKmy0fig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AT2QARds
Subject: Re: [Buildroot] [PATCH 1/1] package/rwmem: bumb to latest version
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tomi, All,

On 2023-10-05 17:42 +0300, Tomi Valkeinen spake thusly:
> Bumb rwmem to the latest version. The main reason to bumb is to get a
> fix for a compilation issue present when compiling with gcc-13 (need to
> include <cstdint>).
> 
> As the project has moved to C++20, we need to adjust the Config.in
> accordingly.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rwmem/Config.in  | 6 +++---
>  package/rwmem/rwmem.hash | 2 +-
>  package/rwmem/rwmem.mk   | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
> index cd9a7f78f1..690b034070 100644
> --- a/package/rwmem/Config.in
> +++ b/package/rwmem/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_RWMEM
>  	bool "rwmem"
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR # fmt
>  	select BR2_PACKAGE_FMT
> @@ -10,6 +10,6 @@ config BR2_PACKAGE_RWMEM
>  
>  	  https://github.com/tomba/rwmem
>  
> -comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 5"
> +comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 10"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
> diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
> index 9becbc5b21..da74002cb4 100644
> --- a/package/rwmem/rwmem.hash
> +++ b/package/rwmem/rwmem.hash
> @@ -1,2 +1,2 @@
> -sha256  55d28f029c0cd5c21d3e1c89371e2905d5217f571ef5389ed0fce163804d1c4a  rwmem-c8291705c82bb0686be9adf6a427a2b72114719a.tar.gz
> +sha256  e6cb76b77869aef9ec4a2c31d0d80af0182a5f9c9c3ae06225c8fb2f8266379f  rwmem-c89bc9ad9a8f2359f358c510db57b7678eb156d1.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
> index 24c4e92efc..d6ef05193b 100644
> --- a/package/rwmem/rwmem.mk
> +++ b/package/rwmem/rwmem.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RWMEM_VERSION = c8291705c82bb0686be9adf6a427a2b72114719a
> +RWMEM_VERSION = c89bc9ad9a8f2359f358c510db57b7678eb156d1
>  RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
>  RWMEM_LICENSE = GPL-2.0
>  RWMEM_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
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
