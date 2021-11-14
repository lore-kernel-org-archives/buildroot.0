Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD71C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:27:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7316061004
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7316061004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 216AB606A8;
	Sun, 14 Nov 2021 15:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13hB0KDP7w3d; Sun, 14 Nov 2021 15:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC966069F;
	Sun, 14 Nov 2021 15:27:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D940E1BF964
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA00880D9D
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbZx1BN5fBYs for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 15:27:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7885480D80
 for <buildroot@busybox.net>; Sun, 14 Nov 2021 15:27:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3905A240004;
 Sun, 14 Nov 2021 15:26:59 +0000 (UTC)
Date: Sun, 14 Nov 2021 16:26:58 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211114162658.7ac403eb@windsurf>
In-Reply-To: <20211025170520.1086081-1-francois.perrad@gadz.org>
References: <20211025170520.1086081-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2]
 board/stmicroelectronics/stm32mp157*-dk*: cleanup linux.config
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

It is not clear what you are "cleaning up" here. Could you clarify? Is
about removing options that are useless?

On Mon, 25 Oct 2021 19:05:20 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> note:
> - AFAIK, the HDMI ouput never works on DK1 & DK2

At least with the vendor kernel, HDMI does work.

> - AFAIK, the status of BT & Wifi on DK2 is unknown

Also with the vendor kernel, I know they work. It would be good to make
sure they also work with the Buildroot defconfigs, that use the
upstream kernel.


> -CONFIG_USB_DWC2=y
> -CONFIG_USB_CHIPIDEA=y
> -CONFIG_USB_CHIPIDEA_HOST=y
> -CONFIG_USB_ISP1760=y
> -CONFIG_USB_HSIC_USB3503=y
> -CONFIG_USB_GPIO_VBUS=y
> -CONFIG_USB_ISP1301=y
> -CONFIG_USB_ULPI=y

I don't remember which USB controller is used, but I'm surprised by the
removal of CONFIG_USB_DWC2 as I thought it was the one used for the OTG
controller.

>  CONFIG_TYPEC=y
> -CONFIG_TYPEC_STUSB=y
> +CONFIG_TYPEC_STUSB160X=y

Why?

>  CONFIG_STM32_RPROC=y
> -CONFIG_RPMSG_VIRTIO=y
> -CONFIG_RPMSG_TTY=y

This is potentially useful to communicate with the Cortrex-M4.

>  CONFIG_IIO=y
>  CONFIG_IIO_SW_TRIGGER=y
>  CONFIG_SD_ADC_MODULATOR=y
>  CONFIG_STM32_ADC_CORE=y
>  CONFIG_STM32_ADC=y
> -CONFIG_STM32_ADC_TEMP=y

Why?

>  CONFIG_STM32_DFSDM_ADC=y
> -CONFIG_STM32_LPTIMER_CNT=y

Why?

>  CONFIG_STM32_DAC=y
>  CONFIG_IIO_HRTIMER_TRIGGER=y
>  CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
> @@ -175,7 +108,7 @@ CONFIG_PWM_STM32_LP=y
>  CONFIG_PHY_STM32_USBPHYC=y
>  CONFIG_NVMEM_STM32_ROMEM=y
>  CONFIG_EXT4_FS=y
> -CONFIG_MSDOS_FS=y
> +CONFIG_EXT4_FS_POSIX_ACL=y

Why?

(The same question applied to the DK2 configuration, of course).

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
