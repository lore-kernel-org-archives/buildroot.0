Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7373AC5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 13:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 150A740482;
	Sat, 18 Nov 2023 13:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150A740482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uk85Xk3wz0Pg; Sat, 18 Nov 2023 13:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 116D340407;
	Sat, 18 Nov 2023 13:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 116D340407
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1A01BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4691B40438
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4691B40438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FC5G166lrfrL for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 13:28:08 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A909400DD
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 13:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A909400DD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id ECE4E780375;
 Sat, 18 Nov 2023 14:28:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 14:28:02 +0100
Date: Sat, 18 Nov 2023 14:28:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231118132802.GN996011@scaer>
References: <20231118115314.3210726-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231118115314.3210726-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700314086;
 bh=tb/t/Z1kp8zl33Eme7ymbvXijsCVNnylxmbIjgbJVxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bZw+Kwo50HJ2UEaorZ1rF2maFqd5aXo5ZULKgUUN2OYprfPbdDBG1i8e7KL1MiVKQ
 pBburt1kzV8rnFkzv7wzT6E5BNx7F+awT8Fp7/U/+Q0KyWRFTUdteBdfBrT4nEhqWC
 fG2rBSVoajGnK7IUqSmr4qcMG+NrbvJJKxF9ZzjxWSc8HGY1xF3ggZBuS6AaCuK9OV
 eeqC/OQdhTW69RGT+zdoSBI4IWWx8YZGwiPJRGvA/tVQx0Umn/QRd6PSWsgANJBrFr
 b1Ao/RK9NC8pQylhh3i6QEZxVu2lECvyRuQhOEA2fGvvsTlzeW0NxxHF83Sv0mJF3i
 CF+ziTd87F1Vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bZw+Kwo5
Subject: Re: [Buildroot] [PATCH] configs/rockpro64_defconfig: fix build
 failure due to missing uboot dependencies and rootfs size
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

giulio, All,

On 2023-11-18 12:53 +0100, Giulio Benetti spake thusly:
> U-Boot requires pylibfdt, pyelftools and openssl so let's enable U-Boot
> corresponding BR2_TARGET_UBOOT_NEEDS_*. Rootfs instead is not big enough
> because of Linux modules size so let's extend it to 120MB.

I slightly reworded the commit title and log.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322041
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  configs/rockpro64_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
> index 4704ac7206..472b9aded2 100644
> --- a/configs/rockpro64_defconfig
> +++ b/configs/rockpro64_defconfig
> @@ -22,6 +22,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> @@ -43,6 +46,7 @@ BR2_TARGET_GENERIC_HOSTNAME="rockpro64"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPRO64"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
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
