Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8022BC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1A660F5C;
	Thu, 11 Aug 2022 20:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1A660F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpBk0nFJ92rm; Thu, 11 Aug 2022 20:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 313D060EA1;
	Thu, 11 Aug 2022 20:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 313D060EA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA9791BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4080417FA
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4080417FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmN61TfjL6bR for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1147741748
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1147741748
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:41:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BDB49240003;
 Thu, 11 Aug 2022 20:41:45 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:41:44 +0200
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Message-ID: <20220811224144.78b1581a@windsurf>
In-Reply-To: <20220811122011.716045-1-bram.vlerick@openpixelsystems.org>
References: <20220811122011.716045-1-bram.vlerick@openpixelsystems.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660250506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5FdvuQ6+CcydNI6oM8DLgsxcmOb/1dbtY6wW3ommkQ=;
 b=hca0Q/amAOpqK03+ajSefJ9QQiObIAa77cuK1dNzWmoRkL+jDeSofqdwWbMQopLdtcyui2
 1jZ5A4JY/0Naf+u0xqrkF6NsJyVUrDZNEU4FULpa8lCclZRCeZ6T1hpZH0w9I9AF3TTh94
 toszdwJwpFnFTVIWvHukF6naCFJoUUFTXI9sHQTIa5Yyks7xrILh7hBOMrE93yv3OLCXNF
 sQSJC8SmY2cjDAsOdNrBG9hUBT7o24he0N8vA0sHINymPqNqmo/ZCyjIGMqaA80K8Dqczd
 jFZTF/lxsheNn3Atr2ZH1l8lM4jXHaKy0NyS8zqHFh5EI7pmHxN5am0JRYVxZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hca0Q/am
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: allow
 lpddr4 firmware version override
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Blam,

On Thu, 11 Aug 2022 14:20:11 +0200
Bram Vlerick <bram.vlerick@openpixelsystems.org> wrote:

> Add support for selecting a specific version of the LPDDR4 firmware
> version. Variscite's imx8mp-var-dart SOM requires the "_202006" version
> of the lpddr4_pmu_train_* binaries.
> 
> Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>

Thanks a lot for your patch. Looks good overall. A few comments below,
though.

>  package/freescale-imx/firmware-imx/Config.in       | 10 ++++++++++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index 06c4d8036c..f894d87250 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -82,6 +82,16 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR3
>  
>  endchoice # DDR training FW
>  
> +if BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
> +
> +config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4_VERSION
> +	string "LPDDR4 Version"
> +	help
> +	  Use a specific version of the lpddr4_pmu_train_* binaries such
> +	  as "202006".
> +
> +endif # BR2_PACKAGE_FIRMWARE_IMX_LPDDR4

Looking at the list of firmware files:

ddr3_dmem_1d_201810.bin
ddr3_dmem_1d.bin
ddr3_imem_1d_201810.bin
ddr3_imem_1d.bin
ddr4_dmem_1d_201810.bin
ddr4_dmem_1d_202006.bin
ddr4_dmem_1d.bin
ddr4_dmem_2d_201810.bin
ddr4_dmem_2d_202006.bin
ddr4_dmem_2d.bin
ddr4_imem_1d_201810.bin
ddr4_imem_1d_202006.bin
ddr4_imem_1d.bin
ddr4_imem_2d_201810.bin
ddr4_imem_2d_202006.bin
ddr4_imem_2d.bin
lpddr4_pmu_train_1d_dmem_201904.bin
lpddr4_pmu_train_1d_dmem_202006.bin
lpddr4_pmu_train_1d_dmem.bin
lpddr4_pmu_train_1d_imem_201904.bin
lpddr4_pmu_train_1d_imem_202006.bin
lpddr4_pmu_train_1d_imem.bin
lpddr4_pmu_train_2d_dmem_201904.bin
lpddr4_pmu_train_2d_dmem_202006.bin
lpddr4_pmu_train_2d_dmem.bin
lpddr4_pmu_train_2d_imem_201904.bin
lpddr4_pmu_train_2d_imem_202006.bin
lpddr4_pmu_train_2d_imem.bin

it's not only LPDDR4 firmware files that can have versions, but also
DDR3 and DDR4 ones.

So can we instead have:

config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
	string "DDR3/DDR4/LPDDR4 firmware version"
	help
	  ...

In the help text, perhaps state "leave empty for the default version",
or something like that.

> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 47c21585aa..40aa84e162 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -38,15 +38,23 @@ endef
>  
>  ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
>  FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
> +ifneq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4_VERSION), "")
> +	FIRMWARE_IMX_LPDDR4_FW_VERSION = _$(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4_VERSION)

Use qstrip, and don't indent variables, so:

FIRMWARE_IMX_DDR_VERSION = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION))
ifneq ($(FIRMWARE_IMX_DDR_VERSION),)
FIRMWARE_IMX_DDR_VERSION_SUFFIX = _$(FIRMWARE_IMX_DDR_VERSION)
endif

and use $(FIRMWARE_IMX_DDR_VERSION_SUFFIX)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
