Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D7AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7CEB61039
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7CEB61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC0C80EFC;
	Wed, 10 Nov 2021 09:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4mEsAxkgVW6; Wed, 10 Nov 2021 09:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D985480EF3;
	Wed, 10 Nov 2021 09:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B164D1BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD6A04021B
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WG5y_A8O6oUi for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91E9A401FC
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:42:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8700A5FF9E;
 Wed, 10 Nov 2021 10:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636537352;
 bh=O9ZZ24ZytQP6RcYLWTKbZeY9Zu8L+BRVoH3kFmplKQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rc003pzayLfVLlfINDm4pqLMEWjrZVyWYZ71Dcfc41TErJsmcGwImAYcv0M8Qqv5c
 iR9lXzZ6A37yFJjpexYJPhj5rGWkNmgu1tuJaLt5YRAotmUL7eR6fwRKeHSaVoUmxi
 mbMNCgslwTM30OtqOWej8ngoa5v5OYk3woKRPQ7R2HWBf72B1MTpVPdaw3Xc4fy2cq
 qa61zku0ETE6IwIu1KykoTcpEoMSbQjNERpLSqguhKxdeesJUv9blgOExdSClV7bTI
 XWoxOnSnMrYZ4+fVhi918yofru719DQxmXMbZyMF7DccRYrVpusUTcCtz0h0m8ZFIG
 MD6M6cSQLlrNg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 10:42:24 +0100
Date: Wed, 10 Nov 2021 10:42:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110094224.GK2084998@scaer>
References: <20211109172120.457166-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109172120.457166-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpuwrap:
 don't override dependencies
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 18:21 +0100, Fabrice Fontaine spake thusly:
> Don't override IMX_VPUWRAP_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
> index fdad3a5f2b..b9a1717d28 100644
> --- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
> +++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
> @@ -8,15 +8,9 @@ IMX_VPUWRAP_VERSION = 4.3.5
>  IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
>  IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
>  IMX_VPUWRAP_INSTALL_STAGING = YES
> -
> -ifeq ($(BR2_PACKAGE_IMX_VPU),y)
> -IMX_VPUWRAP_DEPENDENCIES = imx-vpu
> -endif
> -
> -ifeq ($(BR2_PACKAGE_IMX_VPU_HANTRO),y)
> -IMX_VPUWRAP_DEPENDENCIES = imx-vpu-hantro
> -endif
> -
> +IMX_VPUWRAP_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_IMX_VPU),imx-vpu) \
> +	$(if $(BR2_PACKAGE_IMX_VPU_HANTRO),imx-vpu-hantro)

I've kept the multi-line conditonal blocks, and just used +=, then
applied to master, thanks.

Regards,
Yann E. MORIN.

>  IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
>  IMX_VPUWRAP_LICENSE_FILES = EULA COPYING
>  IMX_VPUWRAP_REDISTRIBUTE = NO
> -- 
> 2.33.0
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
