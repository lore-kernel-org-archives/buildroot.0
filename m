Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4686C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31212843F8;
	Sat, 17 Sep 2022 20:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31212843F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLaI1E5m_7j8; Sat, 17 Sep 2022 20:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43AB983417;
	Sat, 17 Sep 2022 20:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43AB983417
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 325511BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D7FF83417
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7FF83417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUk1BOSYFZ16 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:26:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F3A832B0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79F3A832B0
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:26:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 13B4AE0002;
 Sat, 17 Sep 2022 20:26:26 +0000 (UTC)
Date: Sat, 17 Sep 2022 22:26:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220917222625.5ae2244f@windsurf>
In-Reply-To: <20220824192604.2549356-14-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-14-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663446387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQTZpzE85hOFLpXU8KA6trQmn2qEaHUQMrN5Mq5NlNA=;
 b=LSTD5MTDnW8SxjeDWA0JCRdX43xneYF2WB3hfhTSqx9uE+5aD280rWdYyNO7ClIoJjeLIo
 fMk2NurmTfzVcLZ1akrn/IYynyXbcB4yl6TS+RabCjZZc4eCcO5Xdz8/yoEZUPyaAVFDBC
 GMsMplZNx66uSnocZU/4zH+uVZhDsRzqYUStU0hXxMj0qkjE0kkvhQGU0Y0VepO1gQrQPN
 6oCxS569I80/IJSnG5CDWs0w24xEqz9mDVq+qVQCew1nkBebVz7Gi+kzLjIKFajtG2iypc
 SQjWTVYBhhZVwEq+24L/gZAZt6fs3Sue65eYmUaSh6Cd7kFqgq/gBDZ1MTdUXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LSTD5MTD
Subject: Re: [Buildroot] [PATCH 7/7]
 package/freescale-imx/imx-vpu-hantro-daemon: add package
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
Cc: Gary Bisson <bisson.gary@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

The commit title should be:

	package/freescale-imx/imx-vpu-hantro-daemon: new package

On Wed, 24 Aug 2022 12:26:04 -0700
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

>  package/freescale-imx/Config.in               |  1 +
>  .../imx-vpu-hantro-daemon/Config.in           | 20 +++++++++++
>  .../imx-vpu-hantro-daemon.hash                |  4 +++
>  .../imx-vpu-hantro-daemon.mk                  | 36 +++++++++++++++++++
>  4 files changed, 61 insertions(+)

You also need to change the DEVELOPERS file, to add an entry for this
new package.

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 4a4237fb42..13d611b696 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -115,6 +115,7 @@ source "package/freescale-imx/imx-vpuwrap/Config.in"
>  source "package/freescale-imx/firmware-imx/Config.in"
>  source "package/freescale-imx/imx-sc-firmware/Config.in"
>  source "package/freescale-imx/imx-seco/Config.in"
> +source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
>  source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"

Hm, the alphabetic ordering in this file is not great, but oh well, not
your fault.

> diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/Config.in b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> new file mode 100644
> index 0000000000..2ab9f97081
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
> @@ -0,0 +1,20 @@
> +comment "imx-vpu-hantro-daemon needs an i.MX-specific Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL

I think this would need a:

	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO

> +comment "imx-vpu-hantro needs an i.MX platform with Hantro VPU"
> +	depends on BR2_LINUX_KERNEL
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO

I know some other packages have that, but does that really make sense?

> +config BR2_PACKAGE_IMX_VPU_HANTRO_DAEMON
> +	bool "imx-vpu-hantro"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
> +	select BR2_PACKAGE_IMX_VPU_HANTRO
> +	select BR2_PACKAGE_IMX_VPU_HANTRO_VC if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
> +	help
> +	  i.MX Hantro V4L2 Daemon specific for the NXP i.MX SoC
> +	  integrating a Hantro Video Processing Unit (VPU) such as the
> +	  i.MX8MQ/i.MX8MM/i.MX8MP.
> +
> +	  This library is provided by NXP as-is and doesn't have an

This package does not provide a library.

> +	  upstream.
> diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> new file mode 100644
> index 0000000000..811f8b21a3
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
> @@ -0,0 +1,4 @@
> +# Locally computed:
> +sha256  77e25ad1e1860f0a3983f07d6beb9a04ff32763bacf26db9aefd16559e6eea9b  imx-vpu-hantro-daemon-1.1.2.tar.gz
> +sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
> +sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  EULA

I'm pretty sure the hash of the EULA file is going to be wrong (though
I haven't tested it), because it's exactly the same as the COPYING
file, which looks suspicious.

> diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
> new file mode 100644
> index 0000000000..e9d628bef4
> --- /dev/null
> +++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# imx-vpu-hantro-daemon
> +#
> +################################################################################
> +
> +IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.2
> +IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
> +IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION).tar.gz
> +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES = linux
> +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro

Just one line:

IMX_VPU_HANTRO_DAEMON_DEPENDENCIES = imx-vpu-hantro linux

> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
> +IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro-vc
> +endif
> +
> +IMX_VPU_HANTRO_DAEMON_MAKE_ENV = \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	SDKTARGETSYSROOT=$(STAGING_DIR) \
> +	LINUX_KERNEL_ROOT=$(LINUX_DIR) \
> +	CTRLSW_HDRPATH="$(STAGING_DIR)/usr/include" \
> +	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
> +
> +IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
> +IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = EULA COPYING
> +IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE = NO

These 3 lignes should go earlier, probably before the _DEPENDENCIES
variable.

> +define IMX_VPU_HANTRO_DAEMON_BUILD_CMDS
> +	$(MAKE1) -C $(@D) $(IMX_VPU_HANTRO_DAEMON_MAKE_ENV)
> +endef
> +
> +define IMX_VPU_HANTRO_DAEMON_INSTALL_TARGET_CMDS
> +	$(IMX_VPU_HANTRO_DAEMON_MAKE_ENV) $(MAKE1) -C $(@D) \
> +		DEST_DIR=$(TARGET_DIR) libdir=/usr/lib install
> +endef

Use $(TARGET_MAKE_ENV). Also, do you use $(MAKE1) because you
identified a parallel build issue?

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
