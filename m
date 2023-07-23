Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11D1C001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F49C410C3;
	Sun, 23 Jul 2023 17:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F49C410C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYE5-A3y-1j7; Sun, 23 Jul 2023 17:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9FB410C0;
	Sun, 23 Jul 2023 17:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F9FB410C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3FD31BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D8CF40168
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D8CF40168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3d6BI16ZskI for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:22:55 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 221B740111
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 17:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 221B740111
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:22c7:ca40:1a2e:1362])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 498505FF67;
 Sun, 23 Jul 2023 19:22:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 19:22:49 +0200
Date: Sun, 23 Jul 2023 19:22:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723172249.GL2503916@scaer>
References: <20230723171603.1123429-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723171603.1123429-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690132972;
 bh=ict676RaObKgV0m85nXGKb+LC0zc4+JMuZz1EO5KTCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oeq0WWGR6nyPJxXEHJB2gBqsjS7OCTa7btng5nlfne29BxmlXym2QLscHOmDYHURF
 qyGyx2dqqYSlKL9HfFdHVAYgRl5eBMtMJOOsxzZoL+0cawU8TedPdwcblgSrgcivd6
 VBMUKVxyg753REtP7gsp2WVrm0AYHr4GITaSiqrPtjRjzwW5SCr4qFHks/cffzgNSN
 aPj0dJrtC2eiORPwvaO8PKGFiYQtVVniDRbQ7sQO1j7yNtvBlkeN5sdsaauHygeYPz
 FEXrdihFmIesSVUTOeLedqbxIw2gIUYE5aJVr+B4TDO+aEX5FdZmAlCxV9QhqGf/DJ
 1zqA3CGW0cy+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oeq0WWGR
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 4}.x series
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

On 2023-07-23 19:16 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 6 +++---
>  package/linux-headers/Config.in.host | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 1ab65cf266..87d1a81915 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -128,7 +128,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.4.4" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.4.5" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 7541ae9123..c80fcf5eff 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,8 +1,8 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  9cbc4a2be714a4d154e1312c9f33ded91174907c8b15ee936ad27002ac75ff2a  linux-6.4.4.tar.xz
> -sha256  4cddee22fdf657138a06af653492f67cd3a4762c04a34725534bd200d99085b8  linux-6.1.39.tar.xz
> +sha256  374e2c07463c51dfd71204b7fac3b73c7f973550ae019b74e9f2b815b28de9b7  linux-6.4.5.tar.xz
> +sha256  43eafc2197a07dcdcff7a7ef79ac7502061f7c564744e51626bf5fa2e22587f0  linux-6.1.40.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
> +sha256  07e0cebdb00d25459683e9c330a0576349b8c5e5f2abf053b864f9909151c31d  linux-5.15.121.tar.xz
>  sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
>  sha256  dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d  linux-5.4.249.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 6eb7b3577b..ca841d6114 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -404,9 +404,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "4.19.288"	if BR2_KERNEL_HEADERS_4_19
>  	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.39"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.4.4"		if BR2_KERNEL_HEADERS_6_4
> +	default "5.15.121"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.40"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.4.5"		if BR2_KERNEL_HEADERS_6_4
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
