Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7102CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 345476109D
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 345476109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C8B80F00;
	Wed, 10 Nov 2021 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6cGAu99SeFHN; Wed, 10 Nov 2021 09:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 542448176D;
	Wed, 10 Nov 2021 09:42:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0131BF9B4
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F24F24041C
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNsntLQt_Xvi for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:41:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 331CD40413
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:41:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9EE415FFA2;
 Wed, 10 Nov 2021 10:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636537270;
 bh=L96t8AhOusDf0kbDeSIilDHHJM2/g81SgNV8yElMarE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hn/vTXAcDwZLFdS/ZsQI0hvrNuinpILSZs9GeE6zp0KphSDPkQ2/2W2PQox+fzmPN
 FcluDVDJcducuiUTveyWTTaEnOrnzmY8yDAySVKA0VSW+DsTtrFMVAgDTCisDzsKrE
 XM8LrMh3UmQGBxKe/nvapDbrKm5hQSPY4l/Vje0pIRiqyWpXw520l+8lkFBp7m3AJe
 KOavF+I/3s3BlXJqMVQ/X7uOcZM2cq9fWFPpyw5L289WvkER0j/eyDmDIZ452jZMe5
 9+A95sx5XFkzaBxInhdR9xDoX7o+2m5ZP+AzMy+EL6KZdCxpizgP8kPMtHkFQwSdRm
 LceqZCS4W19fg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 10:41:06 +0100
Date: Wed, 10 Nov 2021 10:41:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110094106.GH2084998@scaer>
References: <20211109171907.456986-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109171907.456986-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: don't override dependencies
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

Fabrice, All,

On 2021-11-09 18:19 +0100, Fabrice Fontaine spake thusly:
> Don't override UBOOT_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2eb1792de9..a10e224501 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -525,7 +525,7 @@ UBOOT_DEPENDENCIES += \
>  $(eval $(generic-package))
>  else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
>  UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
> -UBOOT_KCONFIG_DEPENDENCIES = \
> +UBOOT_KCONFIG_DEPENDENCIES += \
>  	$(BR2_MAKE_HOST_DEPENDENCY) \
>  	$(BR2_BISON_HOST_DEPENDENCY) \
>  	$(BR2_FLEX_HOST_DEPENDENCY)
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
