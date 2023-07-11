Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4910AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 17:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C895C41806;
	Tue, 11 Jul 2023 17:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C895C41806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMLyisDer4eF; Tue, 11 Jul 2023 17:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 697F341E35;
	Tue, 11 Jul 2023 17:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 697F341E35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAA021BF97C
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B42128376E
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B42128376E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6I72tw20Uj1 for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 17:20:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DB8837D3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59DB8837D3
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 17:20:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:be68:b46e:ab7b:a099])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 961DC13F8DB;
 Tue, 11 Jul 2023 19:20:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 11 Jul 2023 19:20:38 +0200
Date: Tue, 11 Jul 2023 19:20:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Lothar Felten <lothar.felten@gmail.com>
Message-ID: <20230711172038.GD188780@scaer>
References: <20230711094448.2482427-1-lothar.felten@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711094448.2482427-1-lothar.felten@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689096041;
 bh=oOW7uMoNsLA8eEFeyNH3D33tCdU+YuVcxXKXkHEobko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qF5vHCGU1dNlR79K+09+c8nuoJUIDcji0NCJRuI3qRLsDcQgw38co3xdFXTiLXHBA
 YhOc2xEQUztS9l+UynOovqPyst0AmFyYNCX8hCuk25TrRGORNxiYvKl3SX7Lf9eGVD
 rRSQfQyUHPc7M00UslH9WlIkqwmCdPSQnXmHDFmNlAWHsoqMhJh7V96PFUfrhdZZ1P
 fj/SpOalPplmxfaR0k+MmQ2zmoRsyWPBlupK9fe738GjuLboyvzPmYLTrMjmeo9NUt
 T/aF0cf7p98SWeorjbX0GtQO6h8cRYkDIVWg4k8LM9Q474WK3A46Rk3UQtoK/wL/RV
 GjtnRcGAA2tTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qF5vHCGU
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone_qt5_defconfig: build
 am335x-bonegreen-wireless
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

Lothar, All,

On 2023-07-11 11:44 +0200, Lothar Felten spake thusly:
>   Build the am335x-bonegreen-wireless.dtb device tree.
>   The genimage script which is shared between beaglebone and
>   beaglebone_qt5 was updated to support the bonegreen-wireless.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/beaglebone_qt5_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
> index ff03a05a8e..0038acfcfd 100644
> --- a/configs/beaglebone_qt5_defconfig
> +++ b/configs/beaglebone_qt5_defconfig
> @@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.7
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_PACKAGE_FBV=y
>  BR2_PACKAGE_QT5=y
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
