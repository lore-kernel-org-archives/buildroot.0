Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADDAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D75BD403A4;
	Fri, 13 May 2022 21:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rySeW7GI_aPW; Fri, 13 May 2022 21:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD7C40207;
	Fri, 13 May 2022 21:49:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA491BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BEAB40886
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46sQgIqjw3h5 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:49:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83C2040882
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:49:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DF27D13F814;
 Fri, 13 May 2022 23:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652478538;
 bh=+mjO2XRvG7hXdBtwJmo77W6F2i76OFCPuHfjGVXCF/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lau9Ao1qX5bVB9NGp5whlV1cWEwhvTBwt2RUlwjBXybeId9vL8mA0SMm7d/E4iYTl
 1xj8sdhkTGzzCbwYByM9xhSUaMdYZuvCL0RvO5u0sZllaO2KWDITtkLDL/4HL9jYiI
 dNh3TFDVNZDkPPl1mxXWsOZHsjkyT33Glv2HfK4jZkikVBfaE5+IjHIim+C90KIdrr
 fcXEq0m+jX0hpRIwVqFsMXGDYLN1EKH1iwVZzC6aq/+WdK30q8D6C0jOv0Ip8ucWgi
 qYmPGJtqGBLQsq66ENQxxbyKcGNjZLTRUrdRicxJ4Px4XvRHRlMK6aoPteyjc0mVZt
 RgyrF2JK/11VQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 23:48:55 +0200
Date: Fri, 13 May 2022 23:48:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220513214855.GW1597494@scaer>
References: <20220513175540.2647317-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513175540.2647317-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/2] package/linux-headers: drop 5.16.x
 option
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

Peter, All,

On 2022-05-13 19:55 +0200, Peter Korsgaard spake thusly:
> The 5.16.x series is now EOL upstream, so drop the linux-headers option and
> add legacy handling for it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                     | 7 +++++++
>  linux/linux.hash                     | 1 -
>  package/linux-headers/Config.in.host | 5 -----
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 806e995bd1..95b9d784d3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2022.05"
>  
> +config BR2_KERNEL_HEADERS_5_16
> +	bool "kernel headers version 5.16.x are no longer supported"
> +	select BR2_LEGACY
> +	help
> +	  Version 5.16.x of the Linux kernel headers are no longer
> +	  maintained upstream and are now removed.
> +
>  config BR2_KERNEL_HEADERS_4_4
>  	bool "kernel headers version 4.4.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 2a96eef8d3..3190813a0c 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,6 +1,5 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  22f67ef6b12ef6c0c0353be4b90b4bf4b9b18b858c16c346fa495b67ec718c99  linux-5.17.7.tar.xz
> -sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
>  sha256  888641634f9e0e38cd0efcfec92ea3c126d381b24a514740d3fe3dc9988fd7ad  linux-5.15.39.tar.xz
>  sha256  f5e417b32f89318b6d0a230109a592ffd68997817463dc4692fa49ec7fe42f71  linux-5.10.115.tar.xz
>  sha256  0d16d343956d311e3f4ab3f032fd626d8e6b67c0db94edd32f561407d374f2a0  linux-5.4.193.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 5ff616fb34..afe849772a 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -56,10 +56,6 @@ config BR2_KERNEL_HEADERS_5_15
>  	bool "Linux 5.15.x kernel headers"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
>  
> -config BR2_KERNEL_HEADERS_5_16
> -	bool "Linux 5.16.x kernel headers"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
> -
>  config BR2_KERNEL_HEADERS_5_17
>  	bool "Linux 5.17.x kernel headers"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
> @@ -389,7 +385,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.4.193"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
>  	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
> -	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
>  	default "5.17.7"	if BR2_KERNEL_HEADERS_5_17
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
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
