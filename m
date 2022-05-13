Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D28C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 705C160ED4;
	Fri, 13 May 2022 16:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVzhnJNMESKY; Fri, 13 May 2022 16:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF9B60B45;
	Fri, 13 May 2022 16:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4602C1BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4249E40AAB
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-LsFWDy_jpr for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:32:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C85604016F
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:32:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 924D013F8BC;
 Fri, 13 May 2022 18:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652459546;
 bh=/cy+ydGKzIKhuN7rQ0ZBDT7FEdlbEsBK//Gpd6bIbWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=khszRmtMxxAey7JgPhvOKwhmD9cL84xS1+4OELoiafAzAqTk6m3UTwEAUr965tuAn
 P3I7nrrSqkHGjyz6MU4gW4TNO/iMl/qizeAs3CZ8uS4bZPPNxN7nO88Fq0RQWVwIJW
 LQRdzXKoasbhWGinl1iOvmDmCrk53B9E4nEMcVvIKDzJdV7ZpIguK90djSx8NTKDmy
 20A3MZTa9svKl2U+3TnBL9W9l8JzhnJJD40n5cAQh4MKdABttoqSd4TDIE8b72avPr
 hbqsXh82pWN3/ner+w/NRnNfDHZlz6jnfmZcXdftw3IokMFvL0kPmL4jBji7vmJVBr
 hXkB6Ydj426tA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 18:32:24 +0200
Date: Fri, 13 May 2022 18:32:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220513163224.GO1597494@scaer>
References: <20220513144215.2598981-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513144215.2598981-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{4, 10, 15}.x series
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

On 2022-05-13 16:42 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 12 ++++++------
>  package/linux-headers/Config.in.host | 12 ++++++------
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index c37b4cd422..24655a2962 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -128,7 +128,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "5.15.37" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "5.15.39" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 7a3308546f..e6ac7af19d 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,12 +1,12 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
> -sha256  18bf091a2157faa8d92a1aba2ecb66b5124bb0e033fc7797343984e069a2c026  linux-5.15.37.tar.xz
> -sha256  82516a02bb52456f6e8057217dde6e02b78003b1e058117557c2ae9661696dfc  linux-5.10.113.tar.xz
> -sha256  288ca85fcdad18e950ccbe3d640594ee36d5aac226321ed935076fadb0cc0a3a  linux-5.4.191.tar.xz
> +sha256  888641634f9e0e38cd0efcfec92ea3c126d381b24a514740d3fe3dc9988fd7ad  linux-5.15.39.tar.xz
> +sha256  f5e417b32f89318b6d0a230109a592ffd68997817463dc4692fa49ec7fe42f71  linux-5.10.115.tar.xz
> +sha256  0d16d343956d311e3f4ab3f032fd626d8e6b67c0db94edd32f561407d374f2a0  linux-5.4.193.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  fa2fb1fb5ba2e6ed99603063474804bd5fddeb8a5ad769d47786f82109e5c627  linux-4.9.312.tar.xz
> -sha256  e3dcacc2459c91586ae94121f54eb54a7cae9c424766fe20498169f682fd1b15  linux-4.14.277.tar.xz
> -sha256  4c6269d3c14e593151b035a55227110e632642d848032ef6992135c18488fe13  linux-4.19.241.tar.xz
> +sha256  e03b777861fae559cb7ed635500cde305bc2ca34dee4dc2fe806de0060c87bdc  linux-4.9.313.tar.xz
> +sha256  3cd6d4eeb3a5d1c906b35c08f0d602f329410c291233bee1a7a2b168c7378bbe  linux-4.14.278.tar.xz
> +sha256  59bcfd094ec26b03ca506199224cff53c13325e62d22bd4e31ef4ccafe7265a2  linux-4.19.242.tar.xz
>  # Locally computed
>  sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
>  sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index b030996dff..36af5d0a20 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -375,12 +375,12 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "4.9.312"	if BR2_KERNEL_HEADERS_4_9
> -	default "4.14.277"	if BR2_KERNEL_HEADERS_4_14
> -	default "4.19.241"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.191"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.113"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.37"	if BR2_KERNEL_HEADERS_5_15
> +	default "4.9.313"	if BR2_KERNEL_HEADERS_4_9
> +	default "4.14.278"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.19.242"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.193"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
>  	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
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
