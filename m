Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D378C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 17:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B89AD42929;
	Sat, 13 May 2023 17:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89AD42929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SlCyVMEaw81; Sat, 13 May 2023 17:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC05C428E6;
	Sat, 13 May 2023 17:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC05C428E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 859541BF21A
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F8C383D12
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8C383D12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 814dhNDgquWQ for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 17:59:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A7F683D11
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A7F683D11
 for <buildroot@buildroot.org>; Sat, 13 May 2023 17:59:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B225219F5C3;
 Sat, 13 May 2023 19:59:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 19:59:30 +0200
Date: Sat, 13 May 2023 19:59:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230513175930.GX2582048@scaer>
References: <20230422133834.608978-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422133834.608978-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684000773;
 bh=Eiofeqh5xoECQCl1XA+cPUYrwLXg5EEGW8/1b1tz4Cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ERPw+3ExliSO8jMUOvLPCLCZSSn4PYw4PJDNV6oWIymVpclRxiTHi1t+hsg4UCg57
 9UCM8BZ2LcIJuKnU/0lqJt0rMlrwgsFbEEjFR/qddjcVwxDOn67ueqIhYBgz4qnU90
 uQrJ6k9fAH44XuivFhFXVUBH67jcXqXWZWy4dmCL5dvi8+3zmVZXj117tZ41+w2Vq1
 JTWvCj4jeKmw1o3+QM0U95ndMbWHo7B3oLdOaK/Ma9iN3s+Fe/hE25CJ5bAz204BQv
 VRf6wqEPZE7pAVXLTvQQdiobVkYzWHtp45WrJuob6Qc2lgpo1dEGxDx/wcHNdvqNQA
 QN4EiDbUtSVkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ERPw+3Ex
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_sd_defconfig:
 bump U-Boot version to 2023.04
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-04-22 15:38 +0200, Dario Binacchi spake thusly:
> Bump U-Boot to version 2023.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/stm32f469_disco_sd_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
> index dc00a47e1da2..4ec873b3bbe8 100644
> --- a/configs/stm32f469_disco_sd_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> -- 
> 2.32.0
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
