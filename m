Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8A4CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A14F341554;
	Mon, 16 Oct 2023 10:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14F341554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Us6Di3PrcBKO; Mon, 16 Oct 2023 10:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D25416BD;
	Mon, 16 Oct 2023 10:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94D25416BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 149D31BF327
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E165860DF9
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E165860DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSQYQ0kQAiYR for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:12:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 973FA600CC
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 973FA600CC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 259321C0004;
 Mon, 16 Oct 2023 10:12:26 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:12:25 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121225.38f28920@booty>
In-Reply-To: <20230924151205.2099293-8-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-8-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7E1WDgNuur5zHagICuRNYqPaF7uDKrIV3ldNWrOcA0=;
 b=SfwOBFdJfFJnYrFyhj3d28YI3wZQO4JgAzirbOI2IHrfQ7P6zHVbKzUmd/oqc943rmcBnB
 03ferE935SX20fdg6s5UmvVX9GcMPqKDqNa0WXjbpaNc/SX8tVFdvgu0alqu3gbSoRvbeQ
 dMhc0nwJ93/W+nIQgWpExP9jlpP4iyEgRDZvcooVBhBdcdZx+aHNFOHv06jp4iXBhpRKBf
 6/gYepySdm0AAcbH5TqwYK11D0W8Qm+npIMTftgBVo7KScvOswTE9nfms7iQoNqg980ceX
 LbCFJe13wJ4DbToK0nWayRgA6w1L3KQYtVlNMTUS9lGSy8CgSOeSWJckCKR9Eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SfwOBFdJ
Subject: Re: [Buildroot] [PATCH v4 08/10] boot/versal-firmware: new boot
 firmware
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
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Sep 2023 16:12:03 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot firmware to buildroot for building the versal plm
> and psmfw.  It requires the toolchain-bare-metal package that includes a
> bare-metal binutils, gcc and newlib which can be built for the microblaze
> architecture.
> 
> A patch is required to enable parallel building of the versal plm and psmfw
> applications.  These two patches have been submitted upstream internally at
> AMD / Xilinx and will be included with the 2023.2 release of the embeddedsw
> repository.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  DEVELOPERS                                    |   1 +
>  boot/Config.in                                |   1 +
>  boot/versal-firmware/Config.in                |  34 ++++
>  boot/versal-firmware/versal-firmware.hash     |   2 +
>  boot/versal-firmware/versal-firmware.mk       |  47 ++++++
>  ...al_plm-add-support-of-parallel-build.patch | 157 ++++++++++++++++++
>  ..._psmfw-add-support-of-parallel-build.patch |  48 ++++++
>  7 files changed, 290 insertions(+)
>  create mode 100644 boot/versal-firmware/Config.in
>  create mode 100644 boot/versal-firmware/versal-firmware.hash
>  create mode 100644 boot/versal-firmware/versal-firmware.mk
>  create mode 100644 boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
>  create mode 100644 boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c9e87818d4..1c66659b19 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2179,6 +2179,7 @@ N:	Neal Frager <neal.frager@amd.com>
>  F:	board/versal/
>  F:	board/zynq/
>  F:	board/zynqmp/
> +F:	boot/versal-firmware/
>  F:	boot/zynqmp-firmware/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/boot/Config.in b/boot/Config.in
> index c7478fef2e..da5ccb6b9c 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -23,6 +23,7 @@ source "boot/ti-k3-boot-firmware/Config.in"
>  source "boot/ti-k3-image-gen/Config.in"
>  source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
> +source "boot/versal-firmware/Config.in"
>  source "boot/vexpress-firmware/Config.in"
>  source "boot/zynqmp-firmware/Config.in"
>  
> diff --git a/boot/versal-firmware/Config.in b/boot/versal-firmware/Config.in
> new file mode 100644
> index 0000000000..34279f84b8
> --- /dev/null
> +++ b/boot/versal-firmware/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_TARGET_VERSAL_FIRMWARE
> +	bool "versal-firmware"
> +	select BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
> +	help
> +	  This package builds the boot firmware apps for Xilinx versal
> +	  boards, so that they can boot u-boot and Linux.
> +
> +if BR2_TARGET_VERSAL_FIRMWARE
> +
> +config BR2_TARGET_VERSAL_FIRMWARE_VERSION
> +	string "firmware version"
> +	default "xilinx_v2023.1"
> +	help
> +	  Release version of versal firmware.
> +	  Only versions xilinx_v2023.1 and newer are supported.
> +	  
> +config BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS
> +	string "custom cflags"
> +	help
> +	  Adds additional CFLAGS for building versal firmware.
> +
> +config BR2_TARGET_VERSAL_FIRMWARE_PDI
> +	string "pdi file location"
> +	default "https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/vck190-versal/vpl_gen_fixed.pdi"
> +	help
> +	  The PDI file defines everything which is board specific for versal.
> +	  It gets parsed by the plm.elf during boot.  To boot a custom target
> +	  based on versal, this should be configured to point to your Vivado
> +	  generated PDI file.
> +	  
> +	  This config should never be undefined, so default configuration is
> +	  for the vck190 evaluation board.

The help text should mention that this can be a URL for download or a
local file.

Looks good otherwise.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
