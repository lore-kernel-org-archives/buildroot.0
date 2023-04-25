Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A7CC77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 09:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE0160BCE;
	Tue, 25 Apr 2023 09:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BE0160BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_InQ38y0X5q; Tue, 25 Apr 2023 09:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 407DA60B0F;
	Tue, 25 Apr 2023 09:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 407DA60B0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26B6B1BF2CB
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 09:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBAC860B0F
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 09:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBAC860B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIPJN1mTEvy5 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 09:44:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03F50607A1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03F50607A1
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 09:44:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21F4AFF808;
 Tue, 25 Apr 2023 09:44:32 +0000 (UTC)
Date: Tue, 25 Apr 2023 11:44:31 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20230425114431.5461f144@windsurf>
In-Reply-To: <20230425081444.1441521-2-jamie.gibbons@microchip.com>
References: <20230425081444.1441521-1-jamie.gibbons@microchip.com>
 <20230425081444.1441521-2-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1682415874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tABeJouDbX9HxVOg3mloN/ME2VGuc+xbvl8u0fYL0RY=;
 b=A+uwI4qE8v9ZdVBj2Lpq+BJx2xVdNukH6D6bhwIrKBkLHFtoWM8Q37MyHTIjP4AEK+VP9t
 z5wMQVGEPWsmz7hKeome10XOiso6F0U0przQH7BHKIp1rz9DhjCaI3o4RI3DM2NwcxpJY2
 SJbrU5OHhArZew9akxsbluz4cMzgS7Tk58B3QHKEOL2iSMMZv//++5qgl5w/PnUhvUANeh
 R61/Kx/wYxctuUkaF6elj3Z6/rwIUUccnipK912fdp0dQepYFTnxXr/4Mruq8SltBj3zQf
 qD1Xo5Fp6JXMogYuNbLgRVGYfkFX0aIp9T8KYr+rVwyPRmCbW85XXpnIfEm9uA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A+uwI4qE
Subject: Re: [Buildroot] [PATCH 1/2]
 package/microchip-hss-payload-generator: add host package
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
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

Thanks for your patch. Here are a few comments below.

On Tue, 25 Apr 2023 09:14:43 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

>  package/Config.in.host                        |  1 +
>  .../Config.in.host                            |  8 +++++++
>  .../microchip-hss-payload-generator.mk        | 22 +++++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 package/microchip-hss-payload-generator/Config.in.host
>  create mode 100644 package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk

We need the DEVELOPERS file to be updated with a new entry for this
package.

> diff --git a/package/microchip-hss-payload-generator/Config.in.host b/package/microchip-hss-payload-generator/Config.in.host
> new file mode 100644
> index 0000000000..7e0bbad719
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR
> +	bool "HSS Payload Generator"
> +	help
> +	  Microchip PolarFire SoC Payload Generator. This tool creates a formatted
> +	  payload image for the HSS zero-stage bootloader on PolarFire SoC, given a
> +	  configuration file and a set of ELF binaries. The configuration file is
> +	  used to map the ELF binaries or binary blobs to the individual application
> +	  harts (U54s).

At the end of the help text, we need an empty line, followed by the
homepage of the project web site (Github repo homepage will work fine).

> diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> new file mode 100644
> index 0000000000..ca5f59e0f1
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> + #
> + # Microchip Hart Software Services
> + #
> +################################################################################

The formatting of this header is not correct: no spaces before # signs.
Also the string should be just the package name:
"microchip-hss-payload-generator".

> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = v2023.02
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))

Please put the "v" in the _SITE variable, but not version:

HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.02
HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))

This way if ever release-monitoring.org is used to detect new versions
of this package, it will work correctly.

> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_STAGING = NO
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_TARGET = YES

Both of these lines are not needed: you are doing a host package.

> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = LICENSE.md
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_DEPENDENCIES = host-elfutils host-libyaml
> +
> +define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_BUILD_CMDS
> +        $(MAKE) -C $(@D)/tools/hss-payload-generator HOST_INCLUDES=-I$(HOST_DIR)/include/ LDFLAGS="$(HOST_LDFLAGS) -Wl,-rpath,$(HOST_DIR)/lib -L$(HOST_DIR)/lib"

Indentation should be one tab.

Why do you need to pass -Wl,-rpath and -L in addition to HOST_LDFLAGS?
HOST_LDFLAGS is already defined as:

HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib

Overall, this should look like this:

	$(MAKE) -C $(@D)/tools/hss-payload-generator \
		HOST_INCLUDES="$(HOST_CPPFLAGS)" \
		LDFLAGS="$(HOST_LDFLAGS)"

> +endef
> +
> +define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_CMDS
> +		$(INSTALL) -D -m 755 $(@D)/tools/hss-payload-generator/hss-payload-generator $(HOST_DIR)/bin/hss-payload-generator

Indentation should be one tab. Please split the long line with a \
somewhere (between source and destination paths, probably).

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
