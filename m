Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 17:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2058441E3F;
	Tue, 11 Jul 2023 17:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2058441E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ity2WtMw6HPm; Tue, 11 Jul 2023 17:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F062941E2E;
	Tue, 11 Jul 2023 17:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F062941E2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 623B91BF3E5
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36F7341E30
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36F7341E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUm5Bf5QZYMs for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 17:20:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D54804183B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D54804183B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 17:20:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:be68:b46e:ab7b:a099])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D4D4713F87C;
 Tue, 11 Jul 2023 19:20:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 11 Jul 2023 19:20:51 +0200
Date: Tue, 11 Jul 2023 19:20:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Lothar Felten <lothar.felten@gmail.com>
Message-ID: <20230711172051.GE188780@scaer>
References: <20230711094523.2482710-1-lothar.felten@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711094523.2482710-1-lothar.felten@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689096053;
 bh=K4/raCTciHYoM2NgPqc6lY2YodwjOpG7amIa/12MygQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZsZyEE/y3BNFkzp0RTIlSK74BAv6KLWbkzX3HJUHgBQSe8G2Uwuo3rnopwpwcLcpY
 IuEXf9JXXcfttFps9d/70aFswGdNgmVjA9i2blPhaOZxT0InIrlezRzEFgAQUM1nBT
 fJHzJBwn6bMhetbFINQyJNGD9VaTUT70J6fSLyd4cL7rtNvHiRCr+NTWZY9FefrDtU
 6ZIXgANGj8mF5eRrULmLpQP/olZk/FfxZUbupkBVmeEgC1dtetNFWSXzu2k/5lSYK2
 2p3UWnSF14wIbEtD/S6Eq+q9AcgLbW5xzEcg1lYJ4AqS2sCPaE45eKejOh4e6P9iUg
 gL+rE2cAjlG7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZsZyEE/y
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: uboot needs OpenSSL
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

On 2023-07-11 11:45 +0200, Lothar Felten spake thusly:
>   Regression builds failed to build uboot due to missing OpenSSL
>   library.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/beaglebone_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 3e7ad8d402..7e006e7a85 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -37,6 +37,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
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
