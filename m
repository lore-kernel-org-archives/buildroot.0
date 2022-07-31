Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8C5C19F28
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 01:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C68358346C;
	Sun, 31 Jul 2022 01:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C68358346C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZGtV8ULuTl2; Sun, 31 Jul 2022 01:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B04BB83419;
	Sun, 31 Jul 2022 01:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B04BB83419
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9AA71BF3AE
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 01:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE55083419
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 01:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE55083419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbjsz084P8t7 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 01:04:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D5C833DB
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D5C833DB
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 01:04:30 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HxNcoX8Sb9RZ3HxNdoeuAd; Sun, 31 Jul 2022 03:04:29 +0200
Message-ID: <3a3b2627-666f-a41b-a400-5e6d2671ff9c@benettiengineering.com>
Date: Sun, 31 Jul 2022 03:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-4-x-shi@ti.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220728164006.16652-4-x-shi@ti.com>
X-CMAE-Envelope: MS4xfNI039D6tsrHX0KrWHfdYCWr94k2jBWr4ICsrbTGNrzvjdLC+IjnOjJkP62AA8g6hFZAIu7hA9o75s+9s6RAG0YDn+WjJ1YmjDfm+1BzKNR4YMsBJxJZ
 dxHsmL/p9r0ONbmarImN7Ean70jACGkBopPGaarvomH+8A5cpCr13ELm3cwY0ixxrCwpeDK4xFgC4I8KkBLp+8MQa6X3PJJnxmvCBllQXOOcDfa+D+ZX5ScX
 O7GEtiCq0JL/ipYmGRart6yPnkT6dNmrdy8o9gxz9Nv2V+h/aGHfItiegqh/4Awuw91c2IlLCuQo+UnkkWqWNYFRsH4f3BbTnl0B/KM0MVFYokEnEtQ8KYI0
 h92FJAce
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659229469; bh=VsDV++c96OhltEPtXA/WDxLRHca9iMspr1bRG1wpN4I=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=aOGI8Qf6QDTp5SoZLe5/YyX3VIhjU0YwVInyJq7mTq712tW+k15nFL47ZOsfd4G8b
 idl8yhND1ZHcTqhBhgOYy+BUKgt74JHqZHxXv7Wp/I2Yv+/lfnQZlb6MLD2vtOHbM1
 DsvJ4EMW0788beQC4pZYGcwagiMYQQ5eVuW2QJb2BAuTST9fttEnFMfV/q1Ja7Dpgx
 QH1IDiqo1dNgwKAw6Y6tqIWyL0HKKF/a7AddwxiYkPx/U9yZX+RD85xzHoABv3xyco
 7ivrI67Jdwo38bfj8U/I+riM1PZCN+1jP5BkHVc8H1jSSaHARmux56536Jzy6HP2C2
 JWgNhGVE+VBCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aOGI8Qf6
Subject: Re: [Buildroot] [PATCH v2 3/4] boot/ti-k3-image-gen: add new package
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Xuanhao,

On 28/07/22 18:40, Xuanhao Shi wrote:
> This is the image generator that builds the full boot binary,
> tiboot3.bin, for the R5 core on TI's k3 devices.
> This requires the R5 spl output from the ti-k3-r5-loader package.
> 
> https://git.ti.com/cgit/k3-image-gen/k3-image-gen
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>   boot/Config.in                            |  1 +
>   boot/ti-k3-image-gen/Config.in            | 24 +++++++++++++++++
>   boot/ti-k3-image-gen/ti-k3-image-gen.hash |  2 ++
>   boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 33 +++++++++++++++++++++++
>   4 files changed, 60 insertions(+)
>   create mode 100644 boot/ti-k3-image-gen/Config.in
>   create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
>   create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
> 
> diff --git a/boot/Config.in b/boot/Config.in
> index ce17b2df6b..1b25bacfee 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -22,6 +22,7 @@ source "boot/s500-bootloader/Config.in"
>   source "boot/shim/Config.in"
>   source "boot/sun20i-d1-spl/Config.in"
>   source "boot/syslinux/Config.in"
> +source "boot/ti-k3-image-gen/Config.in"
>   source "boot/ti-k3-r5-loader/Config.in"
>   source "boot/uboot/Config.in"
>   source "boot/vexpress-firmware/Config.in"
> diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
> new file mode 100644
> index 0000000000..0b66e1c8a5
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_TARGET_TI_K3_IMAGE_GEN
> +	bool "ti-k3-image-gen"
> +	select BR2_TARGET_TI_K3_R5_LOADER
> +	help
> +	  Using TI's k3-image-gen to build a separate bare metal

s/Using/Use

> +	  boot binary from a separate spl. Currently supports
> +	  version 08.04.00.005 as default.
> +
> +	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
> +	string "SOC type for image gen"
> +	depends on BR2_TARGET_TI_K3_IMAGE_GEN
> +	help
> +	  The target SoC option for image gen.
> +	  For example, "am64x" for AM64X boards.

As in previous patch I would add a "choice" instead of a "config"

> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG
> +	string "CONFIG type for image gen"
> +	depends on BR2_TARGET_TI_K3_IMAGE_GEN
> +	help
> +	  The board config option for image gen.
> +	  Usually "sk" or "evm".

Ditto

> +
> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> new file mode 100644
> index 0000000000..e307a02a67
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  e585dc868ada21ef3389159541d669b88bc406b453470e92da85d9222d271c96  k3-image-gen-08.04.00.005.tar.gz
> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> new file mode 100644
> index 0000000000..4892016fe1
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# ti-k3-image-gen
> +#
> +################################################################################
> +
> +TI_K3_IMAGE_GEN_VERSION = 08.04.00.005
> +TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
> +TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
> +TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
> +TI_K3_IMAGE_GEN_LICENSE_FILES = system-firmware-image-gen-1.0-manifest.html
> +TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
> +TI_K3_IMAGE_GEN_DEPENDENCIES = host-arm-gnu-toolchain ti-k3-r5-loader

host-arm-gnu-toolchain is already a dependency of ti-k3-r5-loader so
it should be already built a this point

> +TI_K3_IMAGE_GEN_MAKE = $(BR2_MAKE)

Use $(BR2_MAKE) directly

> +TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
> +TI_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG))
> +TI_K3_IMAGE_GEN_MAKE_OPTS = \
> +	SOC=$(TI_K3_IMAGE_GEN_SOC) \
> +	CONFIG=$(TI_K3_IMAGE_GEN_CONFIG) \
> +	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
> +	SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
> +	O=$(BINARIES_DIR) \
> +	BIN_DIR=$(BINARIES_DIR)
> +
> +define TI_K3_IMAGE_GEN_BUILD_CMDS
> +	$(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GEN_MAKE_OPTS)
> +endef
> +
> +define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
> +	cp $(@D)/tiboot3.bin $(BINARIES_DIR)
> +endef
> +
> +$(eval $(generic-package))

I didn't give a build to these patches so I'll give you more feedback
but it would be very helpful if you already answer me to my various
questions.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
