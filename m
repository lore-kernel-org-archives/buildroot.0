Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4C7C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 12:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1562160AF0;
	Sat, 11 Feb 2023 12:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1562160AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjbobQumyVUM; Sat, 11 Feb 2023 12:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDEB60ACD;
	Sat, 11 Feb 2023 12:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FDEB60ACD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E39881BF83C
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 12:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD88181F88
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 12:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD88181F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XQlQMDwSDTV for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 12:19:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9106C81F81
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9106C81F81
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 12:19:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5F86F5FF95;
 Sat, 11 Feb 2023 13:19:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Feb 2023 13:19:21 +0100
Date: Sat, 11 Feb 2023 13:19:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230211121921.GF2796@scaer>
References: <20230211114108.353855-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211114108.353855-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676117965;
 bh=Qfrk53BaHafWbxOa5pqC7YcR2a9KC4lkfFEdVsIyOxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PymzzCA4Oswz63YOWzNxROCUWjwK1ODi6hiyx/fOArN6lRGZIE4RM2+zUfztMTQXV
 kUFiMpxm+W2mWTfF8Ssd7OGCmGcJ+uRXdhC6JyBmsmy2BXNambtkuucCDWFflk8G/4
 lBqPAkLah69yeI+GkYTkcZa4ckRtl0dC/+1dO7Re4SBAcrXBDNFdrnF2Ym3ge9PsCZ
 TcTIFZetmWOW8k5j3gThEalQNMOC0HWBmhwkBwkuBFmZY0N57C/eQO53yJo4giyn3y
 v2Plgxgug7NZ0UesfvfH8Ohj3FTj5X0o14PAsHY9G01C01Pxg2KmLz1c0+pwZI+xvN
 5D634WoX3c6UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PymzzCA4
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_xip_defconfig: bump
 Linux version to 6.1.10
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
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-02-11 12:41 +0100, Dario Binacchi spake thusly:
> The size of xipImage has grown by 84KB but there are still 278KB left
> before running out of 2MB of flash memory.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

(there's 6.1.11 now, btw! ;-) )

Regards,
Yann E. MORIN.

> ---
>  configs/stm32f429_disco_xip_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
> index f9b3270ecd95..872e4b6a306c 100644
> --- a/configs/stm32f429_disco_xip_defconfig
> +++ b/configs/stm32f429_disco_xip_defconfig
> @@ -1,12 +1,12 @@
>  BR2_arm=y
>  BR2_cortex_m4=y
> -BR2_KERNEL_HEADERS_5_15=y
> +BR2_KERNEL_HEADERS_6_1=y
>  # BR2_UCLIBC_INSTALL_UTILS is not set
>  BR2_ENABLE_LTO=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.10"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
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
