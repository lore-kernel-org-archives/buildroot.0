Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E729BC432BE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 09:14:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD3460FD8
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 09:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DD3460FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25A8B400D5;
	Tue, 17 Aug 2021 09:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGqtRAHhbRaL; Tue, 17 Aug 2021 09:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52D16400FC;
	Tue, 17 Aug 2021 09:13:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23DE91BF27A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 09:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 111BF60682
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 09:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCQUNE0Olq97 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 09:13:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2F2A60755
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 09:13:52 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 21A8B1BF210;
 Tue, 17 Aug 2021 09:13:50 +0000 (UTC)
Date: Tue, 17 Aug 2021 11:13:49 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Message-ID: <20210817111349.4d218f13@kmaincent-XPS-13-7390>
In-Reply-To: <20210709094925.1605675-1-kory.maincent@bootlin.com>
References: <20210709094925.1605675-1-kory.maincent@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] boot/arm-trusted-firmware: Update FIP
 image generation with BL33_CFG option
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

I am just following up with these two patches, to make sure you did not forget
or miss it. Thanks.

Regards,

On Fri,  9 Jul 2021 11:49:24 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> Update the FIP image generation by adding the BL33_CFG parameter.
> This is needed for the ST version of ATF.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  boot/arm-trusted-firmware/Config.in               | 9 +++++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in
> b/boot/arm-trusted-firmware/Config.in index 7e46a10270..80f6161597 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -133,6 +133,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
>  	  Name of the U-Boot BL33 image to include in ATF, it must
>  	  have been installed to BINARIES_DIR by the U-Boot package.
>  
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE_CFG
> +	string "U-Boot BL33 image devicetree name"
> +	default ""
> +	help
> +	  Name of the U-Boot BL33 image devicetree to include in ATF.
> +	  It must have been installed to BINARIES_DIR by the U-Boot
> +	  package.
> +	  Needed for the stm32mp1 platform.
> +
>  endif
>  
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> b/boot/arm-trusted-firmware/arm-trusted-firmware.mk index
> 1f08f5dabb..9fc8b51a80 100644 ---
> a/boot/arm-trusted-firmware/arm-trusted-firmware.mk +++
> b/boot/arm-trusted-firmware/arm-trusted-firmware.mk @@ -92,6 +92,10 @@ endif
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
>  ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call
> qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
> ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
> +ARM_TRUSTED_FIRMWARE_UBOOT_BIN_CFG = $(call
> qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE_CFG)) +ifneq
> ($(ARM_TRUSTED_FIRMWARE_UBOOT_BIN_CFG),) +ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> BL33_CFG=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN_CFG) +endif
> ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot endif 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
