Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7F0C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3B460DDF;
	Thu,  4 Jan 2024 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3B460DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I40uJNwao6Lh; Thu,  4 Jan 2024 21:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E886F4B5;
	Thu,  4 Jan 2024 21:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E886F4B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30E5B1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171C642D72
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171C642D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_NXoHlPrQ0u for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:29:56 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E40CD42D71
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E40CD42D71
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F0E6CB0054E;
 Thu,  4 Jan 2024 22:29:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 Jan 2024 22:29:50 +0100
Date: Thu, 4 Jan 2024 22:29:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZZcjToDLWoqhDNai@landeda>
References: <20240103172619.1156235-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103172619.1156235-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704403793;
 bh=YMl7Rrn+BsBhff/JywPQi6FNT4utr+eFG6Z0LquAGQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rvlpejeb/AxOKHy3ousrjuq4JwpPM1bTIKT+AWckZGC5nJOxgrUqnSNFdKus5Josc
 3v+uGr1VYd2YVMRXKm+RCFNgomrLWTDNOuxuqKlyVUC8rheQLB2ZX0KcaXQtZJnJpr
 Nbh4HXPhsSk3mIgMGg7kXHQMScNqKBFrPPmXeqJ6LelrtQioQ5AVugW5HgXYy+H992
 QTVdmoq7rpw1/aB74p2sFRufJL5zZTIzFOxoChh3pGPAlSWnmQYZ8LNAQSvMcHZo0B
 fLXU7PQ44+t9IT9CLjFG5/dfSYDDnvWLD/HchTuLsGWX26cXBaVddXzGcp2DWcgYwk
 nb9ZUETW4E7vA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rvlpejeb
Subject: Re: [Buildroot] [PATCH 1/1] package/fcft: disable uClibc support
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

Thanks for this patch.

On 2024-01-03 10:26 -0700, Adam Duskett spake thusly:
> uClibc support does not include the threads.h header file that fcft.c includes
> on line 8.

As the actual issue has now been understood, I've amended the commit log
with the explanation.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Musl and GlibC, however, do include the threads header file. As such, it is
> only necessary to turn off support for uClibc. Furthermore, the only package
> that currently selects  BR2_PACKAGE_FCFT is BR2_PACKAGE_FOOT. This patch also
> updates the "foot" package to match the dependencies of BR2_PACKAGE_FCFT.
> 
> Also, update the comment for BR2_PACKAGE_FCFT and BR2_PACKAGE_FOOT to mention
> that a glibc of the musl toolchain is needed. The wording of the message
> borrows from the liquid-dsp package, with the word "required" being substituted
> for the word "needs" as the word "needs" already existed for the fifth and foot
> packages.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1b2dda32a90d7db8117eede09f46d44cffe60993
> http://autobuild.buildroot.net/results/5f03bb5c0c107a2b908be974421ae0a032d4dd89
> http://autobuild.buildroot.net/results/31a1f022414a8a1888cac4a5cd1761257d0f2196
> http://autobuild.buildroot.net/results/4522781e0448b325b54e93bbfb20f8295ea7061d
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/fcft/Config.in | 4 +++-
>  package/foot/Config.in | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fcft/Config.in b/package/fcft/Config.in
> index b65515a3f1..d6da101d51 100644
> --- a/package/fcft/Config.in
> +++ b/package/fcft/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_FCFT
>  	bool "fcft"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # threads.h
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_FREETYPE
> @@ -48,5 +49,6 @@ config BR2_PACKAGE_FCFT_SVG_SUPPORT
>  
>  endif # BR2_PACKAGE_FCFT
>  
> -comment "fcft needs a toolchain w/ threads"
> +comment "fcft needs a glibc or musl toolchain w/ threads"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/foot/Config.in b/package/foot/Config.in
> index 24b3f78821..a88766fca6 100644
> --- a/package/foot/Config.in
> +++ b/package/foot/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_FOOT
>  	bool "foot"
>  	depends on !BR2_STATIC_LIBS # wayland
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # fcft
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # fcft, wayland
>  	select BR2_PACKAGE_FCFT
>  	select BR2_PACKAGE_FONTCONFIG
> @@ -32,5 +33,6 @@ config BR2_PACKAGE_FOOT_THEMES
>  
>  endif # BR2_PACKAGE_FOOT
>  
> -comment "foot needs a toolchain w/ dynamic library, threads"
> +comment "foot needs a glibc or musl toolchain w/ dynamic library, threads"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> -- 
> 2.43.0
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
