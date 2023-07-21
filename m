Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE47EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DA624185A;
	Fri, 21 Jul 2023 20:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA624185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emvUB_Eac0BA; Fri, 21 Jul 2023 20:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4922F4055E;
	Fri, 21 Jul 2023 20:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4922F4055E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 870031BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A3CB61012
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A3CB61012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ml5C2JFd30jC for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 20:55:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DB8960D88
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB8960D88
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C0FF40003;
 Fri, 21 Jul 2023 20:55:18 +0000 (UTC)
Date: Fri, 21 Jul 2023 22:55:16 +0200
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Message-ID: <20230721225516.06eb14e0@windsurf>
In-Reply-To: <20230721063755.315887-1-eagle.alexander923@gmail.com>
References: <20230721063755.315887-1-eagle.alexander923@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689972918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cm8osErO/JIrCEXPfTyWIt5AR6m0hXfAdyMcSmXbtg=;
 b=WHPhsfLoyQw5p/ePN+SpzIuHW6u386dkjwSHzFZwe4GfMhyNEW3gBbrXCBoEFkBc5YUIaX
 opiXEOf7COAb43RZK1NauMni2wKL8Z2VT7uejueNj3ceFjy0hEkr3Bk8uZH1bwiDsvZ7JZ
 Dpta8qnE5K6TZTontyBvOJa9mXbcLJ2DQYpte7LtnA2XlTJcoLOgatKBvQgVlCvUb7EwRi
 E0FGlaE4TYb36c38Sky8W0qEkP46kAa6oX4pAyimT7gs3nznYTpiYmMgijhTnJ2xYLLxqq
 JKe5gRwQG71CBpVgdrUFf79LS/24XLhBqoxviLbdh2GFWagxJiXD9ypVu82M1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WHPhsfLo
Subject: Re: [Buildroot] [PATCH] boot/barebox: Fix building of internal
 scripts
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

Hello Alexander,

On Fri, 21 Jul 2023 09:37:55 +0300
Alexander Shiyan <eagle.alexander923@gmail.com> wrote:

> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 3961c69c56..9a8291c944 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_TARGET_BAREBOX
>  	bool "Barebox"
> +	select BR2_PACKAGE_HOST_PKGCONF

Strictly speaking, this is not needed.

However, one issue with your patch is that you don't add host-pkgconf
in BAREBOX_DEPENDENCIES, so there is nothing that ensures host-pkgconf
will be built before barebox.

Another issue is that Barebox is looking for host OpenSSL, and you have
no guarantee that OpenSSL is installed system-wide on the build
machine. Therefore, a dependency on host-openssl is also needed. I
think this calls for an option like BR2_TARGET_UBOOT_NEEDS_OPENSSL, but
for Barebox.

> +# In order to compile some barebox target tools we need to use pkg-config,
> +# so lets always use CONFIGURATOR_MAKE_ENV wrapper.
> +	$$($(1)_CONFIGURATOR_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
>  	$$($(1)_BUILD_CUSTOM_ENV)
>  endef

I don't think <pkg>_CONFIGURATOR_MAKE_ENV is intended to be used here.
It is indeed to be used for the steps related to the configuration of
kconfig-package, to run make menuconfig, make xconfig, etc.

In U-Boot, we're doing this:

        $(TARGET_CONFIGURE_OPTS) \
                PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
                PKG_CONFIG_SYSROOT_DIR="/" \
                PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
                PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
                PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig" \
                $(UBOOT_MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) \
                $(UBOOT_MAKE_TARGET)

So probably we need something similar here.

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
