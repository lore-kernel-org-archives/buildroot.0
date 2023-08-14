Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C27C001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 12:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB0061058;
	Mon, 14 Aug 2023 12:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BB0061058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xUgnDakfyaU; Mon, 14 Aug 2023 12:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56BC61052;
	Mon, 14 Aug 2023 12:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56BC61052
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A02641BF39C
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 12:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8651381447
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 12:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8651381447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EZhRFqDIpu9 for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 12:14:14 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 990D181444
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 12:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990D181444
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7642:bfa0:cf62:9177])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 31786B00716;
 Mon, 14 Aug 2023 14:14:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Aug 2023 14:14:05 +0200
Date: Mon, 14 Aug 2023 14:14:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20230814121405.GE421096@scaer>
References: <20230814024834.11369-1-peterlin@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814024834.11369-1-peterlin@andestech.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692015251;
 bh=4nD0rWo5z3giXNfALolSF8Xrlm82///Udd5QTfn/MGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vYk43i5QRSLS8A0Xve+2w2xDHSJ2I911P5aXD8WbvofCd6Dtt1kfz5QCmDlXIJ7Vf
 pa/sk48x8XiwrWhgV23TJYRDPBZvI5Ew01saGND9plDlct5ISNR+gyDLP5IZz1URk7
 MbmZtl8fcHBRPfh9l98E7u83/CJs96NLwc/cuooKm2+u+iLD3N3JHjd+ZrIU31Umlb
 nEdjCq/QXZWf6FycJ8GfOgK9dpe3e7P7gdS/STK7sw2EOkoxRALGiB1Zli+7mpB8ZC
 0zUjn4y+bmunZEj3AxqKP728qwhUWvi0sP0nCXW1exft9cOUNpS4Y1hzR8w9xlPuvc
 yWnUy/zRrUQvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vYk43i5Q
Subject: Re: [Buildroot] [PATCH 1/2] configs/andes_ae350_45: Fix build
 failure caused by Zicsr and Zifencei
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
Cc: ycliang@andestech.com, kilian.zinnecker@mail.de,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yu Chien Peter Lin, All,

On 2023-08-14 10:48 +0800, Yu Chien Peter Lin spake thusly:
> Don't specify the ARCH_FLAGS of U-Boot, so both extensions can be
> appended to -march when building w/ gcc-12.
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/4839059655
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/andes_ae350_45_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
> index 998276635b..ef29ab6454 100644
> --- a/configs/andes_ae350_45_defconfig
> +++ b/configs/andes_ae350_45_defconfig
> @@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>  BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.34.1
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
