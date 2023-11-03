Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0284C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7DF82247;
	Fri,  3 Nov 2023 22:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7DF82247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lzpzOlZ3afY; Fri,  3 Nov 2023 22:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC04820A4;
	Fri,  3 Nov 2023 22:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DC04820A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03A321BF5F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D11FB416C7
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11FB416C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLeH58aayh4d for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:15:17 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5AD2416C2
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5AD2416C2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:207e:5629:5034:6d7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1EC02B00539;
 Fri,  3 Nov 2023 23:15:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Nov 2023 23:15:12 +0100
Date: Fri, 3 Nov 2023 23:15:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231103221512.GD2875@scaer>
References: <20231103201417.81191-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103201417.81191-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699049715;
 bh=SJpHRVdh/r3cCtfw03vwKFQDLM72CmXNlincznO8vfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KtnuRpnrxCyKL3JT4NLPF2hJzlm+aK29hInC2ZFpKzIMVVuBUgIMaQCs9rdgBO0io
 6+CJkM0ACiA3G79sqxFHcfU3pPSgT0KvuVOBCuKseh3A5gUCk/Apmz8ZBxSPK/TAZo
 xWdFaHHewGAAUKc7DV6odHCr0X1Ha92614uuo8scPpCRVk4H5ZJC/LrbMJ/YvYTEfc
 9slu8MfAAjFo/14NAWYRkfeha1j0B+hMc2hLH01IPnzPtr/pWVXowGK2NSEk4Zk/oY
 XAa9XGycf9X5vwKKzUs4CHtPPf12Ra8BUUopVk/+aWwhECP2E7OApyY4Vt9SStaBQ+
 Oo9tSlKPbYXXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KtnuRpnr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1,
 5}.x series
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

On 2023-11-03 21:14 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/linux.hash                     | 4 ++--
>  package/linux-headers/Config.in.host | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 7b56d19cb5..9159f7294a 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,7 +1,7 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
>  sha256  d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0  linux-6.6.tar.xz
> -sha256  c6662f64713f56bf30e009c32eac15536fad5fd1c02e8a3daf62a0dc2f058fd5  linux-6.5.9.tar.xz
> -sha256  58520e7ae5a6af254ddf7ddbfc42e4373b0d36c67d467f6e35a3bd1672f5fb0a  linux-6.1.60.tar.xz
> +sha256  a15f498604adf8f6ac842f1733a694083f23e578b48c8e97d94b6d8968e55a8b  linux-6.5.10.tar.xz
> +sha256  ad2c9d12fc36e2dde4796a3eec8f4ddca2e278098f4e555b6e6f5f03ef6964ce  linux-6.1.61.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  9749b21609f9e7ad9c46160c2c107db823b99cef77fa6cb080b6c2dc685fb2f7  linux-5.15.137.tar.xz
>  sha256  a0ea77a1f5eeb1387d62e7a8df585ffc53758e4da153d98224ccd833bd2624c1  linux-5.10.199.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 74d445ff27..236f6f5d62 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -417,8 +417,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.4.259"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.10.199"	if BR2_KERNEL_HEADERS_5_10
>  	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.60"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.5.9"		if BR2_KERNEL_HEADERS_6_5
> +	default "6.1.61"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.5.10"	if BR2_KERNEL_HEADERS_6_5
>  	default "6.6"		if BR2_KERNEL_HEADERS_6_6
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
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
