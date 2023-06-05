Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F47C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 08:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 530B8820AF;
	Mon,  5 Jun 2023 08:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 530B8820AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhmEVifTtUjf; Mon,  5 Jun 2023 08:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2EC8200D;
	Mon,  5 Jun 2023 08:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2EC8200D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 950771BF4E7
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DAD8200D
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DAD8200D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIb2x_10evHS for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 08:34:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCF381F97
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FCF381F97
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 08:34:15 +0000 (UTC)
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABE1440004;
 Mon,  5 Jun 2023 08:34:10 +0000 (UTC)
Date: Mon, 5 Jun 2023 10:34:09 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230605103409.129d9ea9@booty>
In-Reply-To: <20230531111602.1623985-1-neal.frager@amd.com>
References: <20230531111602.1623985-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1685954051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2YZ+MYXpW4rH7w6UIQ4jnO+CzWjU40oOMWuVVwsy70=;
 b=pHIZAN5ndsDQDhIExcrZEDPWolPH9pobu3ZbyB8cgK9PlheKw7ntz1js/18dvUoxBdpyEG
 /sXYhkyRa2sfrcrg8PHX4AZ2yWIqy9qWalP/y6WLGo95ih3qCUMzEA5DdqsnhqiB9gciWc
 f0URUvPW1C1ZCPdh89O+pk2G7eh+TwEwZyD7D92bW9nP3zV8PyxF4EMi7gh1rMCpXUEV2/
 KQ25Jl1xRW/HDYOh/IMayvp91zlO/DmQg8R/J0PBx3XaTKgWIlwU7kEj594lIDS/2iydwT
 NerG0mUDorM3S604ANqqSWsjfXn8AcH3QHSawlCxpxZhRy4bhL8HXVCjl7mchQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pHIZAN5n
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Bradley.Gamble@entrust.com, ibai.erkiaga-elorza@amd.com,
 kris.chaplin@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 david.evans@ebv.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Wed, 31 May 2023 12:16:02 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key
> boot config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus
> hard configured for QSPI flash. A pre-programmed boot.bin comes
> with every Starter Kit. U-Boot can then find the Linux kernel and
> file system on the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash
> can be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this
> reason, Kria Starter Kits will use a separate extlinux.conf file
> from other ZynqMP evaluation boards.
> 
> 3. The KR260 has a USB to SD card bridge, so the Linux kernel
> and file system are found on /dev/sda1 and /dev/sda2.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  DEVELOPERS                                    |   3 +-
>  board/zynqmp/kria/kr260/kr260.sh              |  12 +
>  ...inctrl-zynqmp-add-tri-state-controls.patch |  90 ++++
>  board/zynqmp/kria/kr260/pm_cfg_obj.c          | 496 ++++++++++++++++++
>  board/zynqmp/kria/readme.txt                  |  29 +-
>  configs/zynqmp_kria_kr260_defconfig           |  42 ++
>  6 files changed, 665 insertions(+), 7 deletions(-)
>  create mode 100755 board/zynqmp/kria/kr260/kr260.sh
>  create mode 100644 board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch
>  create mode 100644 board/zynqmp/kria/kr260/pm_cfg_obj.c
>  create mode 100644 configs/zynqmp_kria_kr260_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e76717e845..26bcf93b0a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2152,9 +2152,10 @@ F:	board/zynqmp/
>  F:	board/zynqmp/kria/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc706_defconfig
> +F:	configs/zynqmp_kria_kr260_defconfig
> +F:	configs/zynqmp_kria_kv260_defconfig
>  F:	configs/zynqmp_zcu102_defconfig
>  F:	configs/zynqmp_zcu106_defconfig
> -F:	configs/zynqmp_kria_kv260_defconfig
>  F:	package/bootgen/
>  F:	package/versal-firmware/
>  
> diff --git a/board/zynqmp/kria/kr260/kr260.sh b/board/zynqmp/kria/kr260/kr260.sh
> new file mode 100755
> index 0000000000..df8b0ccde5
> --- /dev/null
> +++ b/board/zynqmp/kria/kr260/kr260.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +# This is a temporary work around for generating kr260 u-boot.itb.
> +# The problem is there is no way to currently configure u-boot to apply
> +# the carrier board dtb overlay during build, so all kr260 carrier board
> +# drivers are missing.
> +# This will be removed when u-boot can build the kr260 u-boot.itb natively.
> +
> +UBOOT_DIR=$4
> +
> +fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kr-g-revB.dtbo
> +${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
> diff --git a/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch

I know we have a similar script for the KV260 carrier, but I wonder
whether U-Boot would be able to load the base dtb and then apply the
overlay at runtime before loading Linux.

Another question is of course: is there any effort ongoing to fix this
upstream?

> new file mode 100644
> index 0000000000..422a5d091c
> --- /dev/null
> +++ b/board/zynqmp/kria/kr260/patches/uboot/v1-0001-drivers-pinctrl-zynqmp-add-tri-state-controls.patch
> @@ -0,0 +1,90 @@
> +From 560b2e0b6de66c4c9f4b261308263dd091c6002a Mon Sep 17 00:00:00 2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Tue, 28 Mar 2023 14:42:59 +0100
> +Subject: [PATCH v1 1/1] drivers: pinctrl-zynqmp: add tri-state controls
> +
> +This patch enables u-boot pinctrl of the tri-state registers.  As it does not
> +check pmufw version, it assumes version 2 of the pmufw pinctrl driver which
> +comes only in pmufw 2023.1 or newer.

Why is this needed? Since you are using a vendor U-Boot, it feels
strange that you need further patches on top.

Is this patch being upstreamed?

As a general rule, every commit message should always explain _why_ the
patch is needed. Explaining _what_ the patch changes is often evident
from the diff and thus useless in the commit message.

Otherwise looks good.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
