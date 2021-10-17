Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C9AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:22:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B489D60F25
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B489D60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 751FC4029D;
	Sun, 17 Oct 2021 20:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsodKa_UBZFF; Sun, 17 Oct 2021 20:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB7A40297;
	Sun, 17 Oct 2021 20:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8C581BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5A0380E62
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOvLCHmSKfzY for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B701780E56
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:22:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3FE677802E5;
 Sun, 17 Oct 2021 22:22:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634502130;
 bh=9V0pm0+LQRWdRtXQiZG11rQssyljvshvkzHGvoNiVzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e87lRRag6lBOyb+crfAgQ3ocnYQRfTgKqQZYpdHcc7laZiFhFWvHzDIv/yTcGF//X
 FhfvUBLOfojQ5040k3h34mAEJxitBKoox6ofByf37vnCCkPtPTxR3PHQfwzB87gpsj
 1RdlDGyEkHXoEu+MVDxyaau3CDQsJcwKBwN8kglkevTYLOpBgIHIX9LfZKAIeVhgUK
 Q0B+aAwkAWBUAngteMHiCtmk95BNibUwFlgNvEf08RMRcXFHrsYiPuwU73ccpWb4KE
 7Cb4pqXfgGuE2SUPDG06vzHKkRkPsSZwqQZjFR1sKRBShOZUygUBQOlvlspFJMFdAF
 NuEV8C3qz3FXQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 22:21:59 +0200
Date: Sun, 17 Oct 2021 22:21:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211017202159.GN2400@scaer>
References: <20210921202137.7092-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921202137.7092-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 1/6] package/rpi-firmware: rework
 boot/config file handling
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
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-09-21 22:21 +0200, Peter Seiderer spake thusly:
> Try to be less smart (focused on the one target/one use-case),
> instead reduce the rpi-firmware package to a selectable list
> of (verbatim) installed firmware files.
[--SNIP--]
> With this changes a better support for custom use-cases should
> be possible, specially multi-target SD cards as suggested by
> Stefan Agner ([1]).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-February/303318.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks for your persistence in working on this! :-)

[--SNIP--]
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 6a2bf05248..38a84100e9 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -10,6 +10,27 @@ RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
>  RPI_FIRMWARE_INSTALL_IMAGES = YES
>  
> +RPI_FIRMWARE_FILES = \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
> +
> +define RPI_FIRMWARE_INSTALL_BIN
> +	$(foreach f,$(RPI_FIRMWARE_FILES), \
> +		$(INSTALL) -D -m 0644 $(@D)/boot/$(f) $(BINARIES_DIR)/rpi-firmware/$(f)
> +	)
> +endef
> +
> +ifneq ($(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)

BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE is a kconfig string, so if the
string is empty, the variable will be "", i.e.e two double quotes, and
this is not empty for make.

I've fixed that by defining the usual qstripped variable.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +define RPI_FIRMWARE_INSTALL_CONFIG
> +	$(INSTALL) -D -m 0644 $(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE) $(BINARIES_DIR)/rpi-firmware/config.txt
> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
>  define RPI_FIRMWARE_INSTALL_DTB
>  	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
> @@ -41,19 +62,10 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
>  endef
>  endif # INSTALL_VCDBG
>  
> -ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
> -# bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
> -define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
> -	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
> -endef
> -endif
> -
>  define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
> -	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
>  	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
> -	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
> -	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
> -	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
> +	$(RPI_FIRMWARE_INSTALL_BIN)
> +	$(RPI_FIRMWARE_INSTALL_CONFIG)
>  	$(RPI_FIRMWARE_INSTALL_DTB)
>  	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
>  endef
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
