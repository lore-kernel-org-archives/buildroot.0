Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD7CC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24DAC820ED;
	Tue,  8 Aug 2023 21:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24DAC820ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8r_jGJVD6BR3; Tue,  8 Aug 2023 21:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 631208179D;
	Tue,  8 Aug 2023 21:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 631208179D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2DD1BF25F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D52368179D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52368179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb3yHs8MtBA4 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:59:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 540DB81464
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 540DB81464
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA6E1E0002;
 Tue,  8 Aug 2023 21:59:20 +0000 (UTC)
Date: Tue, 8 Aug 2023 23:59:19 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20230808235919.0002f19d@windsurf>
In-Reply-To: <20230712125154.1361000-3-jamie.gibbons@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-3-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691531961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XG4n8Lgoa63lesbS67dwEEPd7xrtjDQMoZIfLXfsLgc=;
 b=Ecp5mHU4Aq+BUNQsXbCOIAHe6bNPUSs59gW/kpsBTLRK1sWUcTDxy2eWemsoLFDRKwZprZ
 Si9d3qkurogHuwK8NABSFe0cI4spHIvicqQJtStjNt2mA4nz0LXlczP8dUuZ1IoVVnZqz0
 MSCOyTCfnXp8Dqh2JbG/sJrcqouTLUk5hOby508mPl6VI3Ni5aLKKHddHOzbHZLf2zQRMp
 hKENTK004N5fPaMl170zs3RPW0eWngO/aS+1dbhrKHzCjTPol+pEAfhyewS4jo21zAjht3
 XGyl/qpw3GQGRar4MHyjltU/SHUojQ5yoYlzdtycrqxGb02y2ScVCpO6KzBCuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ecp5mHU4
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

I've applied your patch to our "next" branch, with some small changes
(see below), and also I have a few questions.

On Wed, 12 Jul 2023 13:51:54 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> +Creating a bootable SD card with genimage
> +=========================================
> +
> +By default Buildroot builds a SD card image for you. The first partition
> +of this image contains a U-Boot binary, embedded in a Hart Software
> +Services (HSS) payload. The second partition contains a FAT filesystem

Could you clarify what this "embedded in a Hart Software Services
payload" means? Does it mean that there is additional code running on
the target other than U-Boot, Linux and user-space? I don't see OpenSBI
being compiled in this defconfig.

I'd like to make sure we have properly captured all the code that ends
up running on the target, so that we are complete from a licensing
stand-point.


> diff --git a/board/microchip/mpfs_icicle/post-image.sh b/board/microchip/mpfs_icicle/post-image.sh
> new file mode 100755
> index 0000000000..54cc6d71f8
> --- /dev/null
> +++ b/board/microchip/mpfs_icicle/post-image.sh
> @@ -0,0 +1,13 @@
> +#!/usr/bin/env bash
> +
> +BASE_DIR=$(pwd)
> +HSS_PAYLOAD_GENERATOR=$HOST_DIR/bin/hss-payload-generator
> +MKIMAGE=$HOST_DIR/bin/mkimage
> +GENIMAGE=${BASE_DIR}/support/scripts/genimage.sh
> +GENIMAGE_CFG=${BASE_DIR}/$2
> +
> +cd "${BINARIES_DIR}" || exit
> +${HSS_PAYLOAD_GENERATOR} -c "${BASE_DIR}"/board/microchip/mpfs_icicle/config.yaml payload.bin
> +cp "${BASE_DIR}"/board/microchip/mpfs_icicle/mpfs_icicle.its ./
> +${MKIMAGE} -f mpfs_icicle.its mpfs_icicle.itb
> +${GENIMAGE} -c "${GENIMAGE_CFG}"

Simplified to:

+#!/bin/sh
+HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
+MKIMAGE=${HOST_DIR}/bin/mkimage
+
+${HSS_PAYLOAD_GENERATOR} -c board/microchip/mpfs_icicle/config.yaml ${BINARIES_DIR}/payload.bin
+cp board/microchip/mpfs_icicle/mpfs_icicle.its ${BINARIES_DIR}/mpfs_icicle.its
+(cd ${BINARIES_DIR} && ${MKIMAGE} -f mpfs_icicle.its mpfs_icicle.itb)
+support/scripts/genimage.sh -c board/microchip/mpfs_icicle/genimage.cfg


> diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
> new file mode 100644
> index 0000000000..9ad1bf66d8
> --- /dev/null
> +++ b/configs/microchip_mpfs_icicle_defconfig
> @@ -0,0 +1,34 @@
> +BR2_riscv=y
> +BR2_riscv_custom=y
> +BR2_RISCV_ISA_CUSTOM_RVM=y
> +BR2_RISCV_ISA_CUSTOM_RVF=y
> +BR2_RISCV_ISA_CUSTOM_RVD=y
> +BR2_RISCV_ISA_CUSTOM_RVC=y

So you're not a riscv_g core because you don't have the atomic extension?

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="board/microchip/mpfs_icicle/genimage.cfg"

Option dropped, because board/microchip/mpfs_icicle/post-image.sh now
hardcodes the genimage configuration filename.

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
