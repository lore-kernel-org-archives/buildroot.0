Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A06C7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D8861510;
	Thu,  4 May 2023 20:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D8861510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RF156tEWBtzv; Thu,  4 May 2023 20:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7FC60E87;
	Thu,  4 May 2023 20:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7FC60E87
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 695681BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C2B040469
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2B040469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1i438s8D6R2M for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDDFF40025
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDDFF40025
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:06:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3f23:63cb:29e9:f8d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AE0111A94F1;
 Thu,  4 May 2023 22:03:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 May 2023 22:03:44 +0200
Date: Thu, 4 May 2023 22:03:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230504200344.GJ2696@scaer>
References: <20230504164052.17629-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504164052.17629-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683230626;
 bh=PfHj/8kf4PETgBtNHoVSNNHDXjXRUXfQF0P6AH/rfCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vZHnKOZN/B2LTAfhkugjy493g8z1XuaVohXeEr4+bNTvKOZUcm/99hLnXprJys+aC
 uCsqKqYnhRouR04Wap8OPjz7wl1wUkzgip2dlAQsr3ZaAx/yZJMSzJqSS82qkoo2Ps
 Nds78R5xJl1S7238zjxAx5W3JB5qnCF0xCvXcNjlZFyg+XJlI2PTFtexpPu/ZtgEn0
 xp3Tg9xxjUKlqpA0bsyHhvYwJ8/QE09yfsJ6FYP/mnILBLtrAi4MmGzb0EoRFrEVqh
 7DoQN0gqw5CsERnE11CkMONSWXAqS83o4lhm6NL8TEby0FJmXKrzQONNaUzZ2LQRIZ
 sUqya1dhu9h7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vZHnKOZN
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: 5.15.x / 6.{1, 2,
 3}.x series
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

On 2023-05-04 18:40 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 8 ++++----
>  package/linux-headers/Config.in.host | 8 ++++----
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index f6b50a4b58..65d3dc53c6 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -128,7 +128,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION

Not sure what tree you based this on, but we still do not have 6.3
applied (your patch is still pending on patchwork).

So, if you want to update a patch, just resend an update, otherwise it
is a bit puzzling why the patch does not apply.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index e3047886c5..75158437c7 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,9 +1,9 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  ba3491f5ed6bd270a370c440434e3d69085fcdd528922fa01e73d7657db73b1e  linux-6.3.tar.xz
> -sha256  c7dded14e368834b18bb2ad64af65560d8bcb9d2d6597e0f6ef151fded01e577  linux-6.2.13.tar.xz
> -sha256  dfdcc143a879d64a5ee99213b2b4b05b5dccd566c144df93bca1e204df64c110  linux-6.1.26.tar.xz
> +sha256  78620fb4a7d5e0db1d4eb8d5b1c6e207ba5d19564efa63967a59b6daf89b3f2a  linux-6.3.1.tar.xz
> +sha256  0ebc9fa309d496d474b06682578c5f7b42f0cf330365102b2feaab65ba296729  linux-6.2.14.tar.xz
> +sha256  c2b74b96dd3d0cc9f300914ef7c4eef76d5fac9de6047961f49e69447ce9f905  linux-6.1.27.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  066c4bbcbe3c480068a2e302f52b1708f340ecaaf633ec43d7f791bbeac5771a  linux-5.15.109.tar.xz
> +sha256  9829fcc77b9978dce97a26980dec445caf2410024696625dbb2314ead4830b5b  linux-5.15.110.tar.xz
>  sha256  1bbd445c154b053eea46acc883be548a98179988a9ed3a0b81bddfbf30a37e29  linux-5.10.179.tar.xz
>  sha256  142f9aed1c9f2e409dd72c5c490ad824dddf31f955ed2097d5989c4b5074fc28  linux-5.4.242.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 4a4f1308cb..e2934b0f64 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -404,10 +404,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "4.19.282"	if BR2_KERNEL_HEADERS_4_19
>  	default "5.4.242"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.10.179"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.109"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.26"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.2.13"	if BR2_KERNEL_HEADERS_6_2
> -	default "6.3"		if BR2_KERNEL_HEADERS_6_3
> +	default "5.15.110"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.27"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.2.14"	if BR2_KERNEL_HEADERS_6_2
> +	default "6.3.1"		if BR2_KERNEL_HEADERS_6_3
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>  	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
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
