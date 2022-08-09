Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3BFC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0523A60BBE;
	Tue,  9 Aug 2022 08:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0523A60BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywT2VMsvwsqv; Tue,  9 Aug 2022 08:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29D5060A9F;
	Tue,  9 Aug 2022 08:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29D5060A9F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBD71BF5F5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BABA8403AC
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BABA8403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tz3AhAtQ44nH for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 08:06:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62CC2401A3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62CC2401A3
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 08:06:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ECF15240008;
 Tue,  9 Aug 2022 08:06:03 +0000 (UTC)
Date: Tue, 9 Aug 2022 10:06:02 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220809100602.2fb39e1c@windsurf>
In-Reply-To: <CAEyMn7Y+2=+2ruq-4+kvHqX2YXVNoGYLskYrYpjKfAxPfY2XOw@mail.gmail.com>
References: <20220807210317.9415-1-heiko.thiery@gmail.com>
 <20220808104133.6479c0a5@windsurf>
 <CAEyMn7Y+2=+2ruq-4+kvHqX2YXVNoGYLskYrYpjKfAxPfY2XOw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660032364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p53oo7daisiox+UX/aOhS7o4qnwoEMtdd4kbLKOMXkY=;
 b=FVyqeYMcMC6cUkmkgvNdm7wHQOCEJA1fvcAWVjBgRpvHm7N1p9iBdWdDos58jQSBnIdvd9
 PGAapF0f+THvExpEYt6E+gAqiS+NWUz5DhYvxUSNE/ZTC0xlgBukeeuCRShafGUDMG23uU
 bg32QB+gLkklkxqFCb0tR0H1LH4023ORpOUo8OTSxbdkaRrDz/kp0ksxV5BdjbCikR2jVf
 THv4aklcX/nJ5NguG6upJdjAZX7mlW/kFWT5kwghivkDQCiZIF41oYuwwC95XykQQluLSi
 eaiD+6VXbXwY5iWseVptXawEDt1UR1kxDR2RzU9MIXFYtV5E2DNdUK38ZCOEsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FVyqeYMc
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: fix
 build failure with u-boot 2022.04
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Tue, 9 Aug 2022 08:45:09 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Without the patch:
> --- 8< ---
>   /usr/bin/gcc -O2 -isystem
> /home/hthiery/sources/mainline/buildroot/output/host/include
> -Wp,-MD,tools/.mkeficapsule.d -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer   -std=gnu11   -DCONFIG_FIT_SIGNATURE
> -DCONFIG_FIT_SIGNATURE_MAX_SIZE=0xffffffff -DCONFIG_FIT_CIPHER
> -include ./include/compiler.h -idirafterinclude
> -idirafter./arch/arm/include -I./scripts/dtc/libfdt -I./tools
> -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -o
> tools/mkeficapsule tools/mkeficapsule.c   -lgnutls -luuid
> --- 8< ---
> 
> With the patch:
> --- 8< ---
>   /usr/bin/gcc -O2 -isystem
> /home/hthiery/sources/mainline/buildroot/output/host/include
> -Wp,-MD,tools/.mkeficapsule.d -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer   -std=gnu11   -DCONFIG_FIT_SIGNATURE
> -DCONFIG_FIT_SIGNATURE_MAX_SIZE=0xffffffff -DCONFIG_FIT_CIPHER
> -include ./include/compiler.h -idirafterinclude
> -idirafter./arch/arm/include -I./scripts/dtc/libfdt -I./tools
> -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -o
> tools/mkeficapsule tools/mkeficapsule.c
> -L/home/hthiery/sources/mainline/buildroot/output/host/lib -lgnutls
> -luuid
> --- 8< ---
> 
> The -lgnuts and -luuid seems not to be sufficient. Using pkg-config
> will also add the -L<PATH-TO-LIBS>.

But this is not normal, because:

UBOOT_MAKE_OPTS += \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        ARCH=$(UBOOT_ARCH) \
        HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
        HOSTLDFLAGS="$(HOST_LDFLAGS)" \
        $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))

see we're passing HOSTLDFLAGS here? It contains -L$(HOST_DIR)/lib. So
it means there is also something wrong in U-Boot in that it doesn't use
$(HOSTLDFLAGS).

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
