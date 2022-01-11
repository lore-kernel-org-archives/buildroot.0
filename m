Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C354C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 18:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390BA812C8;
	Tue, 11 Jan 2022 18:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksB4bUKFB91O; Tue, 11 Jan 2022 18:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCE381299;
	Tue, 11 Jan 2022 18:31:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48B9C1BF365
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 18:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36DA280024
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 18:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxOR2jGR2JgK for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 18:31:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1367A82A3B
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 18:31:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4de3:3dd8:1079:d363])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6A98878035B;
 Tue, 11 Jan 2022 19:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641925881;
 bh=nBhIhErX4a60ZsVTEXs9IlT5S70FRBEK+NLR889uWqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kSol6P5KdnH1AP0sfs0+aBonKJ5oOygsMOGKxx1cC/nsC1CpAgKsXzwDOlJ+2ch5F
 +wNoWNHlZJuBQ87MFnYAOSWIhCFHUpfAdp9A3Qthozm1cjYMppN7M4XsyVwCqOIeVC
 K2DJIBBGpfl8ItgHXppSoqbaX/amamTlxuV0yvde75jA+fEJV0B8Seisw2A2OZm8jr
 BO3ZvxkEoawh61cf2UfG3oHzowN0lxFwHp5IOQ/LubUMRyvjQHZTuAZbFhyBRiUY4K
 KQLpquXXxXRylnupme7RL07yl2TAi+A3wKX8fSNMJZY8U/6S2lQyVDW79xI5Cpsqun
 nmvpqWp4nWR3Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 11 Jan 2022 19:31:19 +0100
Date: Tue, 11 Jan 2022 19:31:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220111183119.GW1477939@scaer>
References: <20220110231303.31275-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110231303.31275-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: drop 5.14.x
 headers
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

On 2022-01-11 00:13 +0100, Peter Korsgaard spake thusly:
> The 5.14.x series is now EOL, so drop it.

You forgot to remove it from the choice list, so I did.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy                     | 7 +++++++
>  linux/linux.hash                     | 1 -
>  package/linux-headers/Config.in.host | 1 -
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d36eac3302..b3e8d5a6d8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2022.02"
>  
> +config BR2_KERNEL_HEADERS_5_14
> +	bool "kernel headers version 5.14.x are no longer supported"
> +	select BR2_LEGACY
> +	help
> +	  Version 5.14.x of the Linux kernel headers are no longer
> +	  maintained upstream and are now removed.
> +
>  config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
>  	bool "python-backports-functools-lru-cache package removed"
>  	select BR2_LEGACY
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 86dc8d7af9..c40c26c1b2 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,7 +1,6 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb  linux-5.16.tar.xz
>  sha256  b3e9ba06a299a3e2ead4a15753bc46a3e0c90d3b92ffeed1034ccc9f13a717f0  linux-5.15.6.tar.xz
> -sha256  f41a259cb2002dd2e3286524b2bb4e803f4f982992d092706ecea613584023b3  linux-5.14.21.tar.xz
>  sha256  ef259a43f33ddb56001283f4f4e50af29b8a48fa066aed7371a90ebf38c29b70  linux-5.10.83.tar.xz
>  sha256  6246fe1776d83039d71f74eb839f38ebdec23e1b37a7bf76f3bce13cbf0290be  linux-5.4.163.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 8ee86e09af..115ff0d3f9 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -388,7 +388,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "4.19.219"	if BR2_KERNEL_HEADERS_4_19
>  	default "5.4.163"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.10.83"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.14.21"	if BR2_KERNEL_HEADERS_5_14
>  	default "5.15.6"	if BR2_KERNEL_HEADERS_5_15
>  	default "5.16"		if BR2_KERNEL_HEADERS_5_16
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
> -- 
> 2.20.1
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
