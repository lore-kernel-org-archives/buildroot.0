Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CA1C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A8341859;
	Mon,  5 Feb 2024 14:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14A8341859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQKo3eUjcsdD; Mon,  5 Feb 2024 14:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4840C41757;
	Mon,  5 Feb 2024 14:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4840C41757
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 582861BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E8384053F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E8384053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2TXmUf74Avw for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:44:13 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C040D404A8
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C040D404A8
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 89E9613F838;
 Mon,  5 Feb 2024 15:44:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 15:44:06 +0100
Date: Mon, 5 Feb 2024 15:44:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <ZcD0NsAx7_I_pNV3@landeda>
References: <20240115105827.3179346-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115105827.3179346-1-festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707144250;
 bh=hmUykBK2TB6nD1Zo5fcUn8AtJnHahBqiJk1Uhh5Ve9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmTHKCr4oo/0jQBzeEshufWjEwRmtzPE7PXt2Ig8Rvs8g9NU0RRx3qK1/m09sPUEy
 BBds07uLNwpasPdiUvQAcgDvfxEfrsrKAmJydq5igTkCYKHDgjVYom/ZNt5DOPXIAL
 3MZtrFhNScaWYkX7XKcsR9mFvd+Vmn/SNBaP4z48IZlUjbc6o8un/VRsRlN/zA4pXm
 yaJmfRaGmvhEeFzKlN09yvddnRBZUGoBCWFMCO4Ph35wSrfKXQsXPXSqIacE3EB6np
 226smb+OV8iZfEZ6A5cTodmVi/e6rupo5r6YWZQrGXq1yZQkOaBALb6Zwd7U1HjvzZ
 2zO1/u9JkTIeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jmTHKCr4
Subject: Re: [Buildroot] [PATCH] configs/imx8mpevk: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

Fabio, All,

On 2024-01-15 07:58 -0300, Fabio Estevam spake thusly:
> Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
> error:
> 
> include/image.h:1394:12: fatal error: openssl/evp.h: No such file or directory
>  1394 | #  include <openssl/evp.h>
>  
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180070
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/freescale_imx8mpevk_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
> index 82ed68c5a9f1..2aed04848265 100644
> --- a/configs/freescale_imx8mpevk_defconfig
> +++ b/configs/freescale_imx8mpevk_defconfig
> @@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
>  BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
>  BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
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
