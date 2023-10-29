Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCD5C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74A4A43108;
	Sun, 29 Oct 2023 08:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74A4A43108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogQ4fDlKzXgI; Sun, 29 Oct 2023 08:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B5D24311E;
	Sun, 29 Oct 2023 08:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B5D24311E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DADCA1BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF3B64ECE0
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3B64ECE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHEz_27LVKHp for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:46:25 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97D7C4ECDC
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D7C4ECDC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DAA5F2003CC;
 Sun, 29 Oct 2023 09:46:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:46:21 +0100
Date: Sun, 29 Oct 2023 09:46:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231029084621.GQ687180@scaer>
References: <20231026173836.4149430-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026173836.4149430-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698569184;
 bh=k4SRC8uQW7lqdhec+ZP0Jgtu14GflWX0xVtBTZ4iEBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FlVE/dd0PCJ29PT5NyAICkplfgHSWxcYn7zkOEarobgIxuzCbU2IULQujA6zYCTSL
 2D9/MHZB5SkfKnZ9cxA+1wUOmv3b9/XcmLTykMrSb2wib7SOzufzJwzhoTIr58POWp
 7+Zi+fNBWOEDVDjDVwSzr5df+KRSSUrY/sDel/McpECvnPHL3fP8diG3v0XtfOMwNs
 u9rXiz5PHwiSScq7sD+6JDEO0Gn+fRyq7BzRBM4FCmquRBXZuFKyjUpFHkdJ/em591
 rqnL0YdBKHPl4iFRVs8SYJrhob+m7eP2NoHouHlscfpWnGuiTehXulbcA5YL5R7V3J
 TNGrUXMnckb/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FlVE/dd0
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 5}.x series
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

On 2023-10-26 19:38 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 14 +++++++-------
>  package/linux-headers/Config.in.host | 14 +++++++-------
>  3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 21313ded51..195b0dc00e 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -128,7 +128,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.5.8" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 720598252b..78d1395e66 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,13 +1,13 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  299cca897d90deaa176eebec42f0a80eeb7516afed330a45c14da9de086cf717  linux-6.5.8.tar.xz
> -sha256  627f7724c675036639290fb5c39e3fdeb3d566b80b192c45f4a808ab54c8c0a0  linux-6.1.59.tar.xz
> +sha256  c6662f64713f56bf30e009c32eac15536fad5fd1c02e8a3daf62a0dc2f058fd5  linux-6.5.9.tar.xz
> +sha256  58520e7ae5a6af254ddf7ddbfc42e4373b0d36c67d467f6e35a3bd1672f5fb0a  linux-6.1.60.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  c624b9fe7ee4708d34cfd0b7ebc58037afac7463338cc498641ea31c55eeacb8  linux-5.15.136.tar.xz
> -sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
> -sha256  39701815a7a1b5ea4253db18e9327a45926a944499628d032da63c1bb6ea623e  linux-5.4.258.tar.xz
> +sha256  9749b21609f9e7ad9c46160c2c107db823b99cef77fa6cb080b6c2dc685fb2f7  linux-5.15.137.tar.xz
> +sha256  a0ea77a1f5eeb1387d62e7a8df585ffc53758e4da153d98224ccd833bd2624c1  linux-5.10.199.tar.xz
> +sha256  ffe6e4fa1266d5480e529fc8659f572c57030040c548face30f56fd5a223bba4  linux-5.4.259.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  636166769dc232d18f399f40c22107c289aab8702e752301588e64ab582860ae  linux-4.19.296.tar.xz
> -sha256  bff085d8832dd5c3d717beeebdff78a0b678f0a2307f83acf22764dabdcb0a5a  linux-4.14.327.tar.xz
> +sha256  9d89e0bc6503c0d61178fd1605f6ed04b016873b9f370372866644b11fee3d31  linux-4.19.297.tar.xz
> +sha256  1db5926e02dc29b30d77f731228d3bd31402e2feba3aa59bfb2c730eedbeecc5  linux-4.14.328.tar.xz
>  # Locally computed
>  sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
>  sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index d48cfa3787..bb624147ec 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -404,13 +404,13 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "4.14.327"	if BR2_KERNEL_HEADERS_4_14
> -	default "4.19.296"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.136"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.59"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.5.8"		if BR2_KERNEL_HEADERS_6_5
> +	default "4.14.328"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.19.297"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.259"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.199"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.137"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.60"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.5.9"		if BR2_KERNEL_HEADERS_6_5
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
