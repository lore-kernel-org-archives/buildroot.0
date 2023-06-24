Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BBDEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 20:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A18C140A93;
	Sat, 24 Jun 2023 20:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A18C140A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4c_bqUsNhzmT; Sat, 24 Jun 2023 20:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD54C40A8A;
	Sat, 24 Jun 2023 20:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD54C40A8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36ADC1BF3D8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FA2460773
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA2460773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dHOGH71glTj for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 20:44:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB83260745
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB83260745
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 20:44:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 26BD5B0054C;
 Sat, 24 Jun 2023 22:44:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 22:44:09 +0200
Date: Sat, 24 Jun 2023 22:44:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230624204409.GB24952@scaer>
References: <20230622172445.1854863-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622172445.1854863-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687639452;
 bh=hae+mXn62vGlWeBxoh4HOSc1upvjdXomk10X+OX97oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IRYl6xRt5BCHj7ZeEFhjdHFr9nuGFpG8U2BtFmTpdnIltP4vkobfDkPSCSQiNARhN
 Q1JmozgYf5XJXZcxGNQwjcMcHn9NenULXmqTs9b/HbKvVEWokilQC6DBg6AILpJHvd
 wf1oCKNEZTrK37ObOg2cQhDj0C6pAXZ+wowj3YSt0Y11Ht4zAZYIp8jzg8NQ8v408E
 bdreIcbV5xiFPeypgK+rdwRvxnLfkrCqI5Omjh/eyDwiOUPZWbCIdlNTpIu0TloDx4
 n8K6AJAZaQgLI3sKviP7uCGdLXpa2U5fTSp0aMXJGTfFcjllLdIblwFl38XBTS/bry
 Tq3Z0t6ISeEkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IRYl6xRt
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 3}.x series
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

On 2023-06-22 19:24 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

No misnamed hash lines this time? ;-)

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
> index 70591f4a25..315af971db 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -128,7 +128,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.3.8" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.3.9" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index d90f6cb2a3..f49ab52afb 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,13 +1,13 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  4323d421250e2e444c35d36f4aa8ddb56591dedc25c68d359d19c4ef9dd20955  linux-6.3.8.tar.xz
> -sha256  b26f7cbcbf8031efc49f11f236f372fc34a4fd5fc6ad3151b893d1aa038ed603  linux-6.1.34.tar.xz
> +sha256  41ecf21399b17ab85163750ba22347d09b54fa099b80b63d0e2ef0066129b13e  linux-6.3.9.tar.xz
> +sha256  be368143bc5d0dc73dd3e8c6191630c1620520379baf6f47c16116b2c0bc26ac  linux-6.1.35.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  a9a8331f3c0e004b40a41f30d688b53bf85405597ac41c2c89be7f4fbcf7239f  linux-5.15.117.tar.xz
> -sha256  77a9bebc1d1fa057212a3ac62c2a0784aafcdef149032df8898ebc9ed3c62908  linux-5.10.184.tar.xz
> -sha256  33010d4f02314dd4eb51ab5d09f49ce970f2cfefe9f2133a2e085cac5dfffed7  linux-5.4.247.tar.xz
> +sha256  4e6bf4dadb04d5d11d1d4cc37c0eabcf33bc333b7dd3dc2143c3099a823eb5b3  linux-5.15.118.tar.xz
> +sha256  280662ec8dc8738cf947ad66e748141abd58cbe3b5ed66b7f2b153222b7c7090  linux-5.10.185.tar.xz
> +sha256  3abed132e76c6575733acba39eaa54f6d8f4b1dc951b0e601a33959743b13e35  linux-5.4.248.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  47841504f334b24fe411270954423202ed84e21251edf5a61d40bde59051089d  linux-4.19.286.tar.xz
> -sha256  c63a327e799b8a30ca96167f66100d4d7788338ac0a8cf5fc492c97e303211bc  linux-4.14.318.tar.xz
> +sha256  286a9b8c75bff7bdf66985e12a3a650b2bd638a776a5a6e93415930855662a73  linux-4.19.287.tar.xz
> +sha256  aca4750f02f4090b753c1445db44dfa90de535eca73a7b0a7aa4453f65ba1ff9  linux-4.14.319.tar.xz
>  # Locally computed
>  sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
>  sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 5b16e659df..10e33a7306 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -396,13 +396,13 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "4.14.318"	if BR2_KERNEL_HEADERS_4_14
> -	default "4.19.286"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.247"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.184"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.117"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.34"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.3.8"		if BR2_KERNEL_HEADERS_6_3
> +	default "4.14.319"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.19.287"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.248"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.185"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.118"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.35"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.3.9"		if BR2_KERNEL_HEADERS_6_3
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
