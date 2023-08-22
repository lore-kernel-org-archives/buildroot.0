Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CEEE49B2
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE42981F23;
	Tue, 22 Aug 2023 10:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE42981F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaIwcOpLzDLq; Tue, 22 Aug 2023 10:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A72C81E84;
	Tue, 22 Aug 2023 10:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A72C81E84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 964421BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C02F81E84
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C02F81E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wxn2OmJBEWyd for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:31:09 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CE1381E6F
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE1381E6F
Received: by mail.gandi.net (Postfix) with ESMTPSA id E80EE20008;
 Tue, 22 Aug 2023 10:31:05 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:31:04 +0200
To: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Message-ID: <20230822123104.5a1c248e@windsurf>
In-Reply-To: <20230616002359.4139814-4-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-4-dannenberg@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692700266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Q1fwXxkNRSqHeMsrXdF1gl+94fJecZfgGhRoSc2IgE=;
 b=Tr5GocX+xy/vsm5DzsiAh+UtX33vgqlt1K7Z5aVIHUrQXId5SporQ9oeU3wLF22Sa2asr7
 jEE148vRpMzjHe+Q2W2Z6G0sWZ4fTi1r+QUWFcs+epKwqx5eD0JZwgBJTyFk4utT6vu+Hx
 SOQEbfvqlRr3fTjgppdmXolB8b7ftYokJq/F9XXMjDcbHZEfQ3CzuKmbwN+qEGi9ISlhRp
 BiRAu7CVIJTArwAxZca3A6Yrz9V3LNH/5CNPxeDJfFok3RghILDgeVdYytZBA0QJ+9mhSq
 wJr9rrKYyfOiPx2rvrG0LlaSlwv2TZ3Cf1oqxVICnFLf7VM3kiSh2n+tAFbu1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tr5GocX+
Subject: Re: [Buildroot] [PATCH v8 03/10] boot/uboot: add support for
 building the TI K3 DM into U-Boot
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Thu, 15 Jun 2023 19:23:52 -0500
Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:

> Certain TI K3 devices such as AM62x and AM62Ax require a Device Manager
> (DM) firmnware to be made available to the U-Boot build, which will get
> packaged into the "tispl.bin" image tree blob during A53 SPL build.
> Without that DM firmware U-Boot will not be functional. To support this,
> add a config option called BR2_TARGET_UBOOT_NEEDS_TI_K3_DM to enable
> this feature, and another option BR2_TARGET_UBOOT_TI_K3_DM_SOC to allow
> setting the name of the SOC which needs to match the corresponding
> folder name in the ti-linux-firmware Git repository.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>

I've also applied this patch to our next branch, with some changes. The
main one being that the U-Boot package is no longer responsible for
downloading the ti-dm firmware, it is now done by the separate
ti-k3-boot-firmware package.

> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 085397d03d..7e1dd44196 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -240,6 +240,23 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
>  	  U-Boot, and that the TEE variable pointing to OPTEE's
>  	  tee.elf, is passed during the Buildroot build.
>  
> +config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> +	bool "U-Boot needs TI K3 Device Manager (DM)"
> +	help
> +	  Some TI K3 devices need the Device Manager (DM) firmware
> +	  to be available for the U-Boot build. Currently supports FW
> +	  from Git tag 08.06.00.006 by default.
> +
> +	  https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-dm?h=ti-linux-firmware
> +
> +config BR2_TARGET_UBOOT_TI_K3_DM_SOC
> +	string "TI K3 Device Manager (DM) SOC Type"
> +	depends on BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> +	help
> +	  Name of the TI K3 Device Manager (DM) SOC. This needs to
> +	  match one of the SOC-specific folders in within the ti-dm
> +	  folder of the ti-linux-firmware Git repository.

Changed to:

+config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+       bool "U-Boot needs TI K3 Device Manager (DM)"
+       # We use the SoC selection defined for the ti-k3-image-gen
+       # package
+       depends on BR2_TARGET_TI_K3_IMAGE_GEN
+       depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+       help
+         Some TI K3 devices need the Device Manager (DM) firmware to
+         be available for the U-Boot build.
+
+if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+
+config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
+       string
+       default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+       default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+
+endif

Basically my idea here is to avoid replicating the selection of SoC,
which we have already defined in the ti-k3-image-gen configuration. So
we piggy-back on the options of this package to determine the SoC we're
working with.

> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c3..48af69bd26 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -184,6 +184,22 @@ UBOOT_DEPENDENCIES += optee-os
>  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
> +# Currently supports the FW from Git tag 08.06.00.006 by default
> +TI_K3_DM_VERSION = 340194800a581baf976360386dfc7b5acab8d948
> +TI_K3_DM_SITE = https://git.ti.com/processor-firmware/ti-linux-firmware/blobs/raw/$(TI_K3_DM_VERSION)/ti-dm/$(BR2_TARGET_UBOOT_TI_K3_DM_SOC)
> +TI_K3_DM_SOURCE = ipc_echo_testb_mcu1_0_release_strip.xer5f
> +# This is not really nice but disable the hash check for the DM FW file. Main
> +# reason is all those DM FW files for different SoCs have the same(!) name in
> +# the Git repository they reside in, so it would be more difficult to distinguish
> +# between them for hash checking purposes. To work around this let's just
> +# rely and trust the official Git repo at ti.com is known-good which is also
> +# accessed through a secure transport.
> +BR_NO_CHECK_HASH_FOR += $(TI_K3_DM_SOURCE)
> +UBOOT_EXTRA_DOWNLOADS = $(TI_K3_DM_SITE)/$(TI_K3_DM_SOURCE)
> +UBOOT_MAKE_OPTS += DM=$(UBOOT_DL_DIR)/$(TI_K3_DM_SOURCE)
> +endif

Simplified to:

+ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
+UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
+UBOOT_DEPENDENCIES += ti-k3-boot-firmware
+UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
+endif

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
