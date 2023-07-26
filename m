Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC5EC001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9896E40BC2;
	Wed, 26 Jul 2023 21:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9896E40BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlAdMGl5uTdJ; Wed, 26 Jul 2023 21:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB06540609;
	Wed, 26 Jul 2023 21:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB06540609
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AFB31BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67866818CA
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67866818CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8XIwI4Pfvqj for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:09:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DFEF81764
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DFEF81764
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA341FF805;
 Wed, 26 Jul 2023 21:09:09 +0000 (UTC)
Date: Wed, 26 Jul 2023 23:09:08 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230726230908.73695bcf@windsurf>
In-Reply-To: <20230703160149.2302949-2-dario.binacchi@amarulasolutions.com>
References: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
 <20230703160149.2302949-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690405755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53zVksRrLOtfCX696vYgM9Y13ky69Uzi0naJLmdBZsk=;
 b=Rc43NK7q7VeVULetWRpYnbzSquCd8F4StLG5G5eCxyqwBLG3mxh/3p2kANxeXsD3x6rrU2
 0ky3Lx9fqA6109UzCdod2aKEi3/ZVuqb+g9NGGJRWR1sXvu+13Ovy7Vjc0733dEkuK97mg
 RLRBVA0P5e49WpB6RwjtwV7kEfjScbb9GY0h3NRqsC0sfTH62JJUvKCTftJ8xJsz1Ot+nE
 NP1sDb2wvMcM17Jc50SXpmdc2FWKWoUKdo9D/oqFX71HxnvdbUtjUi/1H/dwzLyYpGCLb9
 6womYkc3fSgK8C14fSm17hQ/qLCgu3+I4I5fn0Qx9uip5OH6Mw9+7QT1+PDhLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rc43NK7q
Subject: Re: [Buildroot] [PATCH 2/2] configs/stm32mp157*_dk*: bump U-Boot
 version to 2023.04
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Simon Doppler <dopsi@dopsi.ch>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  3 Jul 2023 18:01:49 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The u-boot.stm32 image is now created by binman tool, so the
> BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY configuration needs to be
> disabled.
> 
> Tested on stm32mp157f_dk2
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  configs/stm32mp157a_dk1_defconfig | 3 +--
>  configs/stm32mp157c_dk2_defconfig | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
> index 3b8fdea993ac..2ec063b51c61 100644
> --- a/configs/stm32mp157a_dk1_defconfig
> +++ b/configs/stm32mp157a_dk1_defconfig
> @@ -36,11 +36,10 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_STM32=y
> -BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"

This was not sufficient: as binman is now used, it needs pylibfdt, so
the option BR2_TARGET_UBOOT_NEEDS_PYLIBFDT had to be enabled as well. I
did that for both defconfigs, and verified that uboot was building fine
inside a minimal Docker container.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
