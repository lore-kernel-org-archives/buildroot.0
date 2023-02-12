Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388EFC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D371D815CC;
	Sun, 12 Feb 2023 20:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D371D815CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKB9mW1HwuFw; Sun, 12 Feb 2023 20:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21475813FB;
	Sun, 12 Feb 2023 20:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21475813FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B5441BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 723CA605A4
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 723CA605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdN3ZnxUEXhL for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:29:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C34605A0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62C34605A0
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:29:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E902F5FFA6;
 Sun, 12 Feb 2023 21:29:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:29:19 +0100
Date: Sun, 12 Feb 2023 21:29:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230212202919.GQ2796@scaer>
References: <20230212150920.1213398-1-fontaine.fabrice@gmail.com>
 <20230212150920.1213398-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212150920.1213398-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676233762;
 bh=lKurUyS3/tyLPMgRersfliixLqgcKuZ8pBpyGQcz4vE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+jsnm6WJvKzyC+W23o6PnwlSbJqYQolPW22GzVGNgAKmTRam5W0i9dPHPQrdAgtR
 8JvCw4uzJFxLroRpVE/1kZwXlj4lnEavCjjMKyRDmDL58H7Y7VravLfh8ol6rda8lH
 4ejIKQr2FDpM4Rf6Vt5CYGO8PxUKDBjCocgc7z+YMd0FOCogaBczxUf2GEvRA14gi0
 Tkz1+pAzAbWhoSVuT658LMbHEB7sKNe7t38Vqr1R1dUIBZb5fTVhYBg6tiZ4+IeMh1
 mV9EpzWZmf2zIF5Snn0QmIvnmVVoHq3BRzu8IWKodeRdr+wnJodYyobMrdp2x5rTWW
 kvR6tX7WVkRTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M+jsnm6W
Subject: Re: [Buildroot] [PATCH 2/2] package/zxing-cpp: needs wchar
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

On 2023-02-12 16:09 +0100, Fabrice Fontaine spake thusly:
> wchar is mandatory since switch to an active fork in commit
> 456a7398316655ad0b669635f580e4887c24a700:
> 
> In file included from /home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/Result.h:12,
>                  from /home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/GTIN.cpp:9:
> /home/autobuild/autobuild/instance-13/output-1/build/zxing-cpp-1.4.0/core/src/Content.h:40:14: error: 'wstring' in namespace 'std' does not name a type
>    40 |         std::wstring render(bool withECI) const;
>       |              ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4f97f1b291a99218f4706fce8b2934bd845755e1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
>  package/zxing-cpp/Config.in                   | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index d477924eec..d2ef450d74 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -741,11 +741,13 @@ comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_ZXING
>  	bool "zxing"
>  	depends on !BR2_STATIC_LIBS # zxing-cpp
> +	depends on BR2_USE_WCHAR # zxing-cpp
>  	depends on BR2_INSTALL_LIBSTDCPP # zxing-cpp
>  	select BR2_PACKAGE_ZXING_CPP
>  
> -comment "zxing plugin needs a toolchain w/ C++, dynamic library"
> -	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
> +comment "zxing plugin needs a toolchain w/ C++, wchar, dynamic library"
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
> +		!BR2_INSTALL_LIBSTDCPP
>  
>  endif
>  
> diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
> index 2550dcf023..0d8b79538d 100644
> --- a/package/zxing-cpp/Config.in
> +++ b/package/zxing-cpp/Config.in
> @@ -1,9 +1,11 @@
> -comment "zxing-cpp needs a toolchain w/ C++, dynamic library"
> -	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
> +comment "zxing-cpp needs a toolchain w/ C++, wchar, dynamic library"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_ZXING_CPP
>  	bool "zxing-cpp"
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_STB
>  	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
> -- 
> 2.39.0
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
