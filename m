Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6DCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 18:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3876081303;
	Tue, 11 Jan 2022 18:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hL2AuHyBOIKI; Tue, 11 Jan 2022 18:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A388138F;
	Tue, 11 Jan 2022 18:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA62F1BF365
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 18:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7B2C401DD
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 18:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tQBuRx1eF-sZ for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 18:31:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44C49400D1
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 18:31:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4de3:3dd8:1079:d363])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6FD16780380;
 Tue, 11 Jan 2022 19:31:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641925895;
 bh=Tblpga5k78PbMeNQBFG5N8LW1wVAfck7Jix7pI1lAb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVuEsLqostPPgxs9fN3WZ7CowN0rijMWUTIVyWoX2IiwfvIxbRTS1/bic4btqNLdC
 /9hvRzkvwRUhQGSA51oBxp68r/SkQ0vTYdLN+V3KoZnMHMBv4SeyWaoOzpRQtnZwkk
 mq9tbLMnAuaioVH8iF8ObEutmOadeB/e9zyjVEcLLsn43gd3uVAXzJ5r7jeCfJZhln
 zHE7VJ3fv6/IuuR3gOxIYeiNuZ3ROxQnfhb9jrmrvv9uWAzkA4ZyaVuMUOadpsI+XA
 JqtRtYopJxj751VUYh8J2vrEUaOqdi375q6WbKwL4wrpfyXVOuUKJuoAm5RsdKR/sx
 vnON9xSZHwuaw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 11 Jan 2022 19:31:33 +0100
Date: Tue, 11 Jan 2022 19:31:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220111183133.GX1477939@scaer>
References: <20220110231303.31275-1-peter@korsgaard.com>
 <20220110231303.31275-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110231303.31275-2-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] {linux, linux-headers}: bump 4.{4, 9, 14,
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

On 2022-01-11 00:13 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

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
> index 6c30100921..891e2cdcb6 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -125,7 +125,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "5.15.13" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.83-cip1-rt1" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index c40c26c1b2..d0813e5db4 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,13 +1,13 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb  linux-5.16.tar.xz
> -sha256  b3e9ba06a299a3e2ead4a15753bc46a3e0c90d3b92ffeed1034ccc9f13a717f0  linux-5.15.6.tar.xz
> -sha256  ef259a43f33ddb56001283f4f4e50af29b8a48fa066aed7371a90ebf38c29b70  linux-5.10.83.tar.xz
> -sha256  6246fe1776d83039d71f74eb839f38ebdec23e1b37a7bf76f3bce13cbf0290be  linux-5.4.163.tar.xz
> +sha256  0a131b6a2f9f5ee37ecb332b5459ab35a87f0bf2d4ec923988d0663646cf156a  linux-5.15.13.tar.xz
> +sha256  945e4264c014a3d9dfc0a4639309dd1ec2fb545416556421f931b95da78c2725  linux-5.10.90.tar.xz
> +sha256  b09f74e0cf5fc7cf5de6aa932fe654c962cb10118bdbbdddb397022c6e6d382c  linux-5.4.170.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  6d2f83619493e656276dbf22afcdb80f42320e697570419380773bb4916130fd  linux-4.4.293.tar.xz
> -sha256  b55d77774ed631f57f736bcdab021f68167455c9daede7e9e4161b4d564d8b53  linux-4.9.291.tar.xz
> -sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-4.14.256.tar.xz
> -sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
> +sha256  86c9ed59b120fad14d207470446086ac46099cd7bb9e58682e368e721164a6e0  linux-4.4.298.tar.xz
> +sha256  fd4bdbc8be3472d6324fa0f5f57a17f5c3f509d5f5b4fa4f1a9797d982d0bca8  linux-4.9.296.tar.xz
> +sha256  bffaaa4c93ab4ed1de61f804c26c92b82dd80f92793e20194b62497d7b8b4723  linux-4.14.261.tar.xz
> +sha256  01ccfc3413c3bb305653ceb0aa528aba0caa61b326e43709bf1f8b624f211031  linux-4.19.224.tar.xz
>  # Locally computed
>  sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
>  sha256  2395443c5f960e5c6343f70480209d2530da27aa6f0299412e0f4b7128fccb7c  linux-cip-5.10.83-cip1-rt1.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 115ff0d3f9..1c24afed97 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -382,13 +382,13 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "4.4.293"	if BR2_KERNEL_HEADERS_4_4
> -	default "4.9.291"	if BR2_KERNEL_HEADERS_4_9
> -	default "4.14.256"	if BR2_KERNEL_HEADERS_4_14
> -	default "4.19.219"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.163"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.83"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.6"	if BR2_KERNEL_HEADERS_5_15
> +	default "4.4.298"	if BR2_KERNEL_HEADERS_4_4
> +	default "4.9.296"	if BR2_KERNEL_HEADERS_4_9
> +	default "4.14.261"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.19.224"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.170"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.90"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.13"	if BR2_KERNEL_HEADERS_5_15
>  	default "5.16"		if BR2_KERNEL_HEADERS_5_16
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
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
