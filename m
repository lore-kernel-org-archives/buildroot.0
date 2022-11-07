Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2119C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 20:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8847B40338;
	Mon,  7 Nov 2022 20:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8847B40338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EB2DQw9Q5c2t; Mon,  7 Nov 2022 20:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B61F24026E;
	Mon,  7 Nov 2022 20:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B61F24026E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5A7F1BF27C
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C128C812B2
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 20:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C128C812B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3IVGmsAjoUc for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 20:20:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4455C8128D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4455C8128D
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 20:20:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1dd2:f7fa:6fba:b565])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2B90819F5AC;
 Mon,  7 Nov 2022 21:20:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:20:44 +0100
Date: Mon, 7 Nov 2022 21:20:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221107202044.GK3918838@scaer>
References: <20221106102046.13138-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106102046.13138-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667852447;
 bh=7tYgzwYo4BbY6fLdX9aUKrg3LzfI25UcX/UG1PpjsWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iZtvl17U0JunN1tgrNJC/196OkzxKtqUHE/iScGA0hSk652s0CRjrT9o1cPGdgn1F
 iVQzmMjvBytFDpusrptb+NVO8SLvYteXhUny4jfKL/837t2jrBbuLOcp6NcYBsXpfQ
 pQRUoAXfQCguQHrqecjLuL/3Dq7ie0+RvPtXK0GoX8IanIpOSWJyMNd9d+2iHxgDVo
 +kzVsamENXTGnQqWaHiccVFs1GtNLR+YDuqHxKUENUgZOutgu5DMEQvBBRvg87V9VW
 gUZVTzmqMmvc/QWyLA2nFUHXuETudx4tpyt+dwWfiPAr7TK4W/YgwJGPdQ18SZQ7kQ
 KCe/TBc99kZEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iZtvl17U
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: bump
 U-boot to 2022.10
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

Heiko, All,

On 2022-11-06 11:20 +0100, Heiko Thiery spake thusly:
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233833
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  configs/kontron_bl_imx8mm_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
> index ff376662e9..240cb52245 100644
> --- a/configs/kontron_bl_imx8mm_defconfig
> +++ b/configs/kontron_bl_imx8mm_defconfig
> @@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"

As far as I can see, the linked build failure is about missing -luuid
and -lgnutls

I see you added BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y, below, but did you
forget to add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y too?

Also, is the version bump really required to fix the build issue? If so,
it should be explained in the commit log, plese.

Regards,
Yann E. MORIN.

>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> @@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
>  BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
> +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
>  BR2_TARGET_UBOOT_SPL=y
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
