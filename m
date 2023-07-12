Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84A2C001B0
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 11:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34AB68232C;
	Wed, 12 Jul 2023 11:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34AB68232C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-DhmZNAHIjo; Wed, 12 Jul 2023 11:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B42822F1;
	Wed, 12 Jul 2023 11:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B42822F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21F861BF3C2
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 11:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07E0E405E1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 11:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07E0E405E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKdHdMmR_1tr for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 11:49:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9755440316
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9755440316
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 11:49:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4179660004;
 Wed, 12 Jul 2023 11:49:35 +0000 (UTC)
Date: Wed, 12 Jul 2023 13:49:33 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20230712134933.58ec91c8@windsurf>
In-Reply-To: <20230712083455.2349333-2-jamie.gibbons@microchip.com>
References: <20230712083455.2349333-1-jamie.gibbons@microchip.com>
 <20230712083455.2349333-2-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689162576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJ9xksLtGmOw/3CgjSuISGhAZ+C+HIBL9qDVwJsl2vA=;
 b=dp2UOBr4cuJm1y5TqIS+t1q2rD4lCh7uvjeVGSRhZ/vt7VX4K9N6gx1rjVJpTdqMn6Ft2I
 98GXvK3hfsM8cN8pM6GFDHudOa7UArhxwrc7drH52iTMLPhL0KZiZbYe9VHFA5uNwDrFeT
 I0lvnCk7OQp6SMeBJQnH+BgMoVVHN5yKGLV6RBbTVkbUyzwNzpfphc6M/9NeA0smTJD0S4
 oR3R6HFcEYR4E1UyUrejRx/4uKuMwHRX7rEfs621WgBDe4uyRws2G9Zi8VGcM/aIvU4dCz
 mz+F1H6gixo7kp+L7U7Alj8tKH4YCIoIpwO3+1178xtdIfJYnfJH3XysKeXonQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dp2UOBr4
Subject: Re: [Buildroot] [PATCH v2 1/2]
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
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

So very minor nits below.

On Wed, 12 Jul 2023 09:34:54 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/microchip-hss-payload-generator/Config.in.host b/package/microchip-hss-payload-generator/Config.in.host
> new file mode 100644
> index 0000000000..1e21fbbb5d
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR
> +	bool "HSS Payload Generator"

Should be:

	bool "host microchip-hss-payload-generator"

> +	help
> +	  Microchip PolarFire SoC Payload Generator. This tool creates a formatted
> +	  payload image for the HSS zero-stage bootloader on PolarFire SoC, given a
> +	  configuration file and a set of ELF binaries. The configuration file is
> +	  used to map the ELF binaries or binary blobs to the individual application
> +	  harts (U54s).

Is "make check-package" running fine? These lines look a bit long to
me, but "make check-package" will tell for sure.

> diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> new file mode 100644
> index 0000000000..7344d208c1
> --- /dev/null
> +++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# microchip-hss-payload-generator
> +#
> +################################################################################

Missing empty line between the silly comment header above and the first
variable definition.

> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = LICENSE.md
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_DEPENDENCIES = host-elfutils host-libyaml

No other comments, the rest looks fine to me, of course except the
host-openssl missing dependency pointed out by Giulio.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
