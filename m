Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4DDECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 07:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4AB60B75;
	Sun,  4 Sep 2022 07:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD4AB60B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oNP1Fe5SUiF; Sun,  4 Sep 2022 07:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F190D60B1D;
	Sun,  4 Sep 2022 07:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F190D60B1D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E95001BF2CC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDE61408A9
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDE61408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Clh75BAu970N for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 07:54:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74841402EA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74841402EA
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 07:54:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4ec6:5d03:99e:22c7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2EF0313F879;
 Sun,  4 Sep 2022 09:54:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Sep 2022 09:54:15 +0200
Date: Sun, 4 Sep 2022 09:54:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220904075415.GT68979@scaer>
References: <20220903083814.331325-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903083814.331325-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662278058;
 bh=GsYgtyjmQuIbLtuotTwiE9MK8Au4YYRgs4pYznWrOp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JuLMt8EoMUlqfZxtdRbejV70q0O3KOuyCNo4lM6Hu11cr+UL1pCn2AkoUJXwIhJsL
 0RQl5AWUhE6C41e/VSguN/suJnIrVtWdp4luSCXiviXmxy5AQe+SUFlfHQKnmBv+Yj
 TKEE516ZFahfhFmeF67UL/rg3Z852CPYVMXq31yP1FXpDcCMnaOhlhQ7p4/z5i5sp5
 /nI/rkBkF6l6V/Y6QcqiJqDtqQNsqgrVEQtFuVZ2jKEEePHieCTvnSvqwSqYn483gM
 4csSwh7aA0y/AFpOyY1fYxfJaUq809hfa99O3f/kQD2ZWRGq9+bYVv6gOM0D28Iz0g
 3tOm1vMyRLaJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JuLMt8Eo
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

Peter, All,

On 2022-09-03 10:38 +0200, Peter Korsgaard spake thusly:
> 5.17.x is EOL.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Those are all maintenance releases, so applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/linux.hash                     | 12 ++++++------
>  package/linux-headers/Config.in.host | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index c8707ac711..9c39e15332 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,12 +1,12 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  4a1c922a490eeabf5b44d4fde36de9ba5b71711b7352c6258716da41160db628  linux-5.17.15.tar.xz
> -sha256  f3aa717243051f3fcca90ebfe26fe5c3a596c2f6047846e8d1724ea90df77b07  linux-5.15.53.tar.xz
> -sha256  aae72f052b80858f77d40009faf9ccf09c38c8b33f56346d16c05f7e6a429cfe  linux-5.10.129.tar.xz
> -sha256  fdc1b10a19d85b37eb0957ddd81acec1d5484f36c496493d8cdad75278737a47  linux-5.4.204.tar.xz
> +sha256  c6a1d38c6fa3798341372d5cf0088ae806ccdc827e31ecbff8988e097ba5de50  linux-5.15.64.tar.xz
> +sha256  a4dfd8bddb94bd35e42002d85f04b51dcfe862228e5a975f12bd59c456ab6803  linux-5.10.140.tar.xz
> +sha256  bfb43241b72cd55797af68bea1cebe630d37664c0f9a99b6e9263a63a67e2dec  linux-5.4.211.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  621978d371b8f0a64e28e3b734af74d5a8d99b81298a99f336b17883e3a4e409  linux-4.9.322.tar.xz
> -sha256  78b5494c205d9839b1905b2553c22596dee57c87586a8124186415c8b8f8f616  linux-4.14.287.tar.xz
> -sha256  3787c8adccea6e35928dea855af0eb2e849966553505448972d6b3cf037acaf4  linux-4.19.251.tar.xz
> +sha256  2bf3c2ddc76f9754112e990b27241282a564a41615fd8cb7964b9569911a887b  linux-4.9.326.tar.xz
> +sha256  ec93b115e4748e4eead83656486f11e35b515cf5fa19d6d01be3d81f10350796  linux-4.14.291.tar.xz
> +sha256  67de95c6080b5730bf14227478cfc3e4db807941d8a881d9824c25059b3ff549  linux-4.19.256.tar.xz
>  # Locally computed
>  sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
>  sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index c2e872abfb..fd04f87928 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -376,12 +376,12 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "4.9.322"	if BR2_KERNEL_HEADERS_4_9
> -	default "4.14.287"	if BR2_KERNEL_HEADERS_4_14
> -	default "4.19.251"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.204"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.129"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.53"	if BR2_KERNEL_HEADERS_5_15
> +	default "4.9.326"	if BR2_KERNEL_HEADERS_4_9
> +	default "4.14.291"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.19.256"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.211"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.140"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.64"	if BR2_KERNEL_HEADERS_5_15
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
