Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F701C7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0A0427D2;
	Thu,  4 May 2023 21:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0A0427D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id criE5UL2CoKp; Thu,  4 May 2023 21:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96882427AA;
	Thu,  4 May 2023 21:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96882427AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40D901BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1918983F1A
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1918983F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jne2pwzaurfF for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 21:02:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E6E83EB8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07E6E83EB8
 for <buildroot@buildroot.org>; Thu,  4 May 2023 21:02:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3f23:63cb:29e9:f8d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3213B1A9571;
 Thu,  4 May 2023 22:05:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 May 2023 22:05:00 +0200
Date: Thu, 4 May 2023 22:05:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230504200500.GK2696@scaer>
References: <20230501064734.16030-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230501064734.16030-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683230708;
 bh=fQ8BDoIz2ZH5LbTaGrOS8WkAUATxl31i1qpQN04iBgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bFqFlvtQZKHjt2Y8GSlNbiBUUfdLzoDmHyBCzCH8KzbGSXNHfK4e6UAMnxfHFphg+
 2Cxbb825b3j0RKe6JzqlEnzAtZTtAd1cgH+4JV9rO7dxr38tXW+icAKvGNofaTAOcw
 jy//ZrJuyRwfVh9WKdFS4EL0+5KPUJulAPrnMFsgsgvl+i/qu78ozBeHZ8+AdTtsGz
 WuWkHgnWtFY4eXgRuX4b7KBpUXmNj63hH4ULYkDmChcGJA+X/lh7N43Coq+oNz/TRI
 pmWkQB3+pp09uDGIaN15WdWMt6lZUz+Sl1VNHP154EMMD9AWVrBByY6HUdlu1NdbJS
 cQ30hbc0QXn+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bFqFlvtQ
Subject: Re: [Buildroot] [PATCH 1/1] linux: bump _KERNEL_LATEST_VERSION to
 6.3
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

Bernd, All,

On 2023-05-01 08:47 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I got a bit puzzled why the hash for 6.3 was not added. That;s because
it was added earlier, when support for header 6.3 was added.

So I've tweaked the commit log accordingly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 690ee9c339..f6b50a4b58 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -28,8 +28,8 @@ choice
>  	prompt "Kernel version"
>  
>  config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "Latest version (6.1)"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
> +	bool "Latest version (6.3)"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3 if BR2_KERNEL_HEADERS_AS_KERNEL
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	bool "Latest CIP SLTS version (5.10.162-cip24)"
> @@ -128,7 +128,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.1.26" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> -- 
> 2.39.2
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
