Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB07C7619A
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 20:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BFD840999;
	Sun, 26 Mar 2023 20:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BFD840999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeaQWuYcIykK; Sun, 26 Mar 2023 20:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 680354099F;
	Sun, 26 Mar 2023 20:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 680354099F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10CF11BF3DF
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE62C81E7C
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE62C81E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTBOvDDrphgW for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 20:05:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958C781DF3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 958C781DF3
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 20:05:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7503840002;
 Sun, 26 Mar 2023 20:05:44 +0000 (UTC)
Date: Sun, 26 Mar 2023 22:05:43 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230326220543.057f381d@windsurf>
In-Reply-To: <20230326140949.11262-1-neal.frager@amd.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679861144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+Wjn1fZIHPfLHr5k+vnFA2wLUr/pBe85TF90Gut3jI=;
 b=HkRBJPx0EtJPakn3EUbZR/x+PrWtiPCxj7eFWXh8gZeMY1NvqY+diaSKJS+mJm7E6TRV0G
 OzVtHdwizUIxgwkIkCvjc642G2HpiZnYhFBAk0YbROnaGdFNrtIAl0ZaD1r+ZLRbMURnfV
 XnHxj/V9zjqg0JUqpqL3CZJMDOrENC/aNirVbBKhBmLXFPOW6cEaLr2m4Ls2hB73zOGhOP
 5xbkDLPQTXvYvGhbNRtXLvGntlmUz1xvtAX1TQ+koBdIkoNgfwf+LTEsDKnu/T+rqfZZW4
 9n3AlaoRm827GsBgcolTXL+/MsC+QQ+tFeUO91txW4u/aPRQqvY5Sap5tFPQBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HkRBJPx0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Sun, 26 Mar 2023 15:09:48 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a new package to buildroot for building the zynqmp pmufw
> with the requirement that the user must provide an external microblaze
> toolchain.

This is not really nice :-/ Was this the conclusion of the discussion
we had on this topic?

> +config BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26
> +	bool "kria-k26"
> +	help
> +	  Adds additional CFLAGS for Kria K26 SOMs.

This doesn't look super extensible. Why are these CFLAGS needed in
particular for this platform? Is this a per-SoC or per-board
configuration? Do we expect more platforms to need custom CFLAGS?

> +ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION))
> +ZYNQMP_FIRMWARE_SOURCE = xilinx_$(ZYNQMP_FIRMWARE_VERSION).tar.gz
> +ZYNQMP_FIRMWARE_SITE = https://github.com/Xilinx/embeddedsw/archive/refs/tags

Use $(call github,...) instead

> +ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
> +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects -DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 \
> +		-DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL \
> +		-DCONNECT_PMU_GPO_2_VAL=0"

All these CFLAGS are really weird... why isn't this part of the
zynqmp-firmware build system itself?

> +else
> +ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects"
> +endif

In any case, this should be:

ZYNQMP_CFLAGS = -Os -flto -ffat-lto-objects

ifeq ($(BR2_PACKAGE_ZYNQMP_FIRMWARE_KRIA_K26),y)
ZYNQMP_CFLAGS += \
	-DBOARD_SHUTDOWN_PIN=2 \
	-DBOARD_SHUTDOWN_PIN_STATE=0 \
	-DENABLE_EM \
	-DENABLE_MOD_OVERTEMP \
	-DENABLE_DYNAMIC_MIO_CONFIG \
	-DENABLE_IOCTL \
	-DCONNECT_PMU_GPO_2_VAL=0
endif

> +
> +define ZYNQMP_FIRMWARE_BUILD_CMDS
> +	cd $(@D)/lib/sw_apps/zynqmp_pmufw/src && make \
> +		COMPILER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
> +		ARCHIVER=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc-ar \
> +		CC=$(ZYNQMP_FIRMWARE_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_TOOLCHAIN_PREFIX)gcc \
> +		CFLAGS=$(ZYNQMP_CFLAGS)

Please use:

	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
		...

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
