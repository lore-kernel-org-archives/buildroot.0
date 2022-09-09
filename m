Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A6FC6FA8B
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 19:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CB1844FF;
	Fri,  9 Sep 2022 19:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2CB1844FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5Rt7oWzdrwZ; Fri,  9 Sep 2022 19:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA293844D2;
	Fri,  9 Sep 2022 19:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA293844D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A23C51BF384
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AD5E41716
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD5E41716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ouzt_04j-ic for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 19:51:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23C5C41705
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23C5C41705
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 19:51:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d2dc:af53:61e0:beab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B536919F5AB;
 Fri,  9 Sep 2022 21:50:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 09 Sep 2022 21:50:57 +0200
Date: Fri, 9 Sep 2022 21:50:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220909195057.GC264214@scaer>
References: <20220909161927.4190652-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909161927.4190652-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662753059;
 bh=0pjQ72UhmNqCHm0kzeblCbFhFTs9aS+slB+72MkoeeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5w2SkJRj8iOdlpg9+DVqHUbCnXQGjellAdbkAKS3g/3lXvvftklFAAoBdgYqLS0m
 DBIF2oN5BpR7Teu3ForxRn3ozdSegecfTeHTD1DNYAJdSO/PeRv9lpboJnNYL2GkH5
 qm+zdna8jJFx6F13HINThzs9NkvT6Y+yXAVvt0CLrgPgl1y/uwYpsALzSka4x5ZVeW
 2SwimGYScul1yHMgJ4nVKU5YUW4xqJmmQA4BdHUR9K+PWYyVsV3dL6p9pgxrzDETe5
 8J+tekU5GgM5/RHFvkcjXGtcLbRVAy0sIDDyXK03Pq+sp6eyszQJqBHZk4MnlQoVqW
 SaK7CPCslS8QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P5w2SkJR
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
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

Petr, All,

On 2022-09-09 18:19 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/linux.hash                     | 12 ++++++------
>  package/linux-headers/Config.in.host | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 9c39e15332..a1b7984489 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,12 +1,12 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
> -sha256  c6a1d38c6fa3798341372d5cf0088ae806ccdc827e31ecbff8988e097ba5de50  linux-5.15.64.tar.xz
> -sha256  a4dfd8bddb94bd35e42002d85f04b51dcfe862228e5a975f12bd59c456ab6803  linux-5.10.140.tar.xz
> -sha256  bfb43241b72cd55797af68bea1cebe630d37664c0f9a99b6e9263a63a67e2dec  linux-5.4.211.tar.xz
> +sha256  da47d9a80b694548835ccb553b6eb1a1f3f5d5cddd9e2bd6f4886b99ca14f940  linux-5.15.67.tar.xz
> +sha256  3f47ebdb9afe152a0c32c1157336ef13fa5cc08ac6d884dfc1f6ddc2b7dba268  linux-5.10.142.tar.xz
> +sha256  09c72e3dd85df773eb52e53e25c556d132958bd775b0ed6985a6b1ac21c9cfc2  linux-5.4.212.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  2bf3c2ddc76f9754112e990b27241282a564a41615fd8cb7964b9569911a887b  linux-4.9.326.tar.xz
> -sha256  ec93b115e4748e4eead83656486f11e35b515cf5fa19d6d01be3d81f10350796  linux-4.14.291.tar.xz
> -sha256  67de95c6080b5730bf14227478cfc3e4db807941d8a881d9824c25059b3ff549  linux-4.19.256.tar.xz
> +sha256  2283c1af5373c43e79adca6987174d932989a8b2551405e83e2e39ebe31e06d2  linux-4.9.327.tar.xz
> +sha256  70f4df21901a654632ebbb533884ccaf117a29b14e6f2b672f0c36613c3e897d  linux-4.14.292.tar.xz
> +sha256  eadd13aa70f37cdf50eef45c5964bd7146d353b61a1fd026d4fa0b2a68a3ea47  linux-4.19.257.tar.xz
>  # Locally computed
>  sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
>  sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index fd04f87928..ab59bdd368 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -376,12 +376,12 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "4.9.326"	if BR2_KERNEL_HEADERS_4_9
> -	default "4.14.291"	if BR2_KERNEL_HEADERS_4_14
> -	default "4.19.256"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.211"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.140"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.64"	if BR2_KERNEL_HEADERS_5_15
> +	default "4.9.327"	if BR2_KERNEL_HEADERS_4_9
> +	default "4.14.292"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.19.257"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.212"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.142"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.67"	if BR2_KERNEL_HEADERS_5_15
>  	default "5.17.15"	if BR2_KERNEL_HEADERS_5_17
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
