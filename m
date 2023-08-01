Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563B6EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 07:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA0A80BF2;
	Tue,  1 Aug 2023 07:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCA0A80BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbgS88xoRRH8; Tue,  1 Aug 2023 07:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA33E81313;
	Tue,  1 Aug 2023 07:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA33E81313
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44CEE1BF308
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 07:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DA0C40377
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 07:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DA0C40377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUHGZf01OCem for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 07:18:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 297FC40134
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 07:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297FC40134
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EE2360006;
 Tue,  1 Aug 2023 07:18:05 +0000 (UTC)
Date: Tue, 1 Aug 2023 09:18:04 +0200
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Message-ID: <20230801091804.7b9e2ab9@windsurf>
In-Reply-To: <20230801050825.1819-1-eagle.alexander923@gmail.com>
References: <20230801050825.1819-1-eagle.alexander923@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690874285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIDbeOPnIR5OU4HvzhIfSyr7rEGRdnJXwuXKtl1cxIQ=;
 b=c6Qwx9eOP4JvxstJuEi7bmGONVsOTmgYePzKynkmBlCCjDDYC4KsOEsuR6S/T1c25H5Guh
 88cLzrdEQVPPhJU7ftk05rg0LVHX5OQ9sqM4f7tkquHMJXj78AAVWx6vkYYQ3AivDVIl81
 OI5tUtuSkGoTNlqEshJnFaMWKLxR3GvXR0srvaf1bLK73/20eR77sdaAt8D9DkWmQPiCHt
 Ibx9NcxEMuuFb4k0hWrbIsiRJl0MyIE0OTcu4oplCsiecvXVPHCBWrfDQ9KBOm0yVznJjN
 oE2ig+pZ++gAW4FgfWNRmLOpRUK6Xi6fHaWUIclMvbOfWPYyc/d29F0UslC8LQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c6Qwx9eO
Subject: Re: [Buildroot] [PATCH RESEND v2] boot/barebox: Fix building of
 internal scripts
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

Thanks for the resend, but why are you resending?

I have already applied your patch at
https://gitlab.com/buildroot.org/buildroot/-/commit/624d50b20cf4bf4a67ad6274263f85927660f8c4,
and I did reply to your PATCHv2 to say that it has been applied (mail
from July 28).

Is there something missing?

Best regards,

Thomas

On Tue,  1 Aug 2023 08:08:25 +0300
Alexander Shiyan <eagle.alexander923@gmail.com> wrote:

> Some barebox targets need to use internal scripts, for example rockchip64
> uses scripts/rkimage which requires the pkg-config package to look up the
> openssl options. Because buildroot hides the host pkg-config tool, the
> scripts cannot be built correctly.
> To solve this problem, let's use the pkg-config host environment and add
> BR2_TARGET_BAREBOX_NEEDS_OPENSSL and BR2_TARGET_BAREBOX_NEEDS_LIBUSB options
> if barebox scripts should use the openssl or libusb host libraries.
> 
>   HOSTCC  scripts/rkimage
> Package openssl was not found in the pkg-config search path.
> Perhaps you should add the directory containing `openssl.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'openssl', required by 'virtual:world', not found
> /usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: /tmp/ccN8Xyaj.o: in function `main':
> rkimage.c:(.text.startup+0x218): undefined reference to `SHA256_Init'
> /usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x22b): undefined reference to `SHA256_Update'
> /usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x23e): undefined reference to `SHA256_Final'
> /usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x253): undefined reference to `SHA256_Init'
> /usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x265): undefined reference to `SHA256_Update'
> /usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x275): undefined reference to `SHA256_Final'
> collect2: error: ld returned 1 exit status
> make[2]: *** [scripts/Makefile.host:107: scripts/rkimage] Error 1
> make[1]: *** [Makefile:976: scripts] Error 2
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  boot/barebox/Config.in  | 12 ++++++++++++
>  boot/barebox/barebox.mk | 14 ++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 3961c69c56..dba4a1a8d6 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -54,6 +54,18 @@ config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
>  
>  	  Most users may leave this empty
>  
> +config BR2_TARGET_BAREBOX_NEEDS_OPENSSL
> +	bool "Barebox needs OpenSSL"
> +	help
> +	  Select this option if your Barebox board configuration
> +	  requires OpenSSL to be available on the host.
> +
> +config BR2_TARGET_BAREBOX_NEEDS_LIBUSB
> +	bool "Barebox needs LibUSB"
> +	help
> +	  Select this option if your Barebox board configuration
> +	  requires libUSB to be available on the host.
> +
>  if BR2_TARGET_BAREBOX_CUSTOM_GIT
>  
>  config BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index d7bcafe436..ead159a0f9 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -43,6 +43,14 @@ ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
>  $(1)_LICENSE_FILES = COPYING
>  endif
>  
> +ifeq ($(BR2_TARGET_BAREBOX_NEEDS_OPENSSL),y)
> +BAREBOX_DEPENDENCIES += host-openssl
> +endif
> +
> +ifeq ($(BR2_TARGET_BAREBOX_NEEDS_LIBUSB),y)
> +BAREBOX_DEPENDENCIES += host-libusb
> +endif
> +
>  $(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))
>  
>  ifneq ($$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
> @@ -73,6 +81,12 @@ endif
>  
>  $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
>  $(1)_MAKE_ENV = $$(TARGET_MAKE_ENV)
> +$(1)_MAKE_ENV += \
> +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +	PKG_CONFIG_SYSROOT_DIR="/" \
> +	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> +	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> +	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
>  
>  ifeq ($$(BR2_REPRODUCIBLE),y)
>  $(1)_MAKE_ENV += \



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
