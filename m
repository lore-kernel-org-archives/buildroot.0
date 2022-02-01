Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04ACC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8820582716;
	Tue,  1 Feb 2022 17:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1GKvJKVE7yF; Tue,  1 Feb 2022 17:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED60826E7;
	Tue,  1 Feb 2022 17:14:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71DA71BF4E2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BF5940302
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGxDol5BA3KT for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:14:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E43E402D4
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:14:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1171:7d10:f9ea:da54])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 40EDFB00515;
 Tue,  1 Feb 2022 18:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643735686;
 bh=T1e1fX5sdYB94rYLPBGdlZgsJnbOWOEBptaJVKNnNu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DkKUPvV9NwVbglILfRTLBGgoIJQkprn6+BjOEHwscEsw3PAf0Y9Yqy+z2/dnlkyWs
 P6tqKy0zYASYatJgjnK5h5Ro/Bd4fXQ3rqZwVcgnvvms4e6U3BAtoJZCCQvTPvxnqn
 kmP3wrHfLeUjmm4aHH0I18tdRwXIH7qYsnd3rJLKwx1N134JRLa9uV+hQ3ZqoCBf00
 b5kaGPOmWYA6CqGII5CwowHvjcFf5TTtVWKQ9stzTSO5fo3KUe+ofJbuHBkoQ9LdIA
 EUhZ7DxtbmsdkkqrcrDyuGFFq1qGMFd9dKSDtiVNboamhYj8JVW15H3o3n2pjuvuvt
 u5sCq12OqSB6A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Feb 2022 18:14:41 +0100
Date: Tue, 1 Feb 2022 18:14:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <20220201171441.GV457876@scaer>
References: <20220201091342.143010-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201091342.143010-1-michael@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/uboot: add support for bundling TEE in
 BIN format into U-Boot
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-02-01 10:13 +0100, Michael Trimarchi spake thusly:
> Some U-Boot platforms (e.g. nxp) can bundle OPTEE's tee.bin
> into the U-Boot image using binman. This patch brings the necessary changes to
> enable this feature.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  boot/uboot/Config.in | 12 ++++++++++++
>  boot/uboot/uboot.mk  | 12 ++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index c630fc6552..117bbd3faf 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -237,6 +237,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
>  	  U-Boot. This option makes sure optee-os gets built prior to
>  	  U-Boot, and that the TEE variable pointing to OPTEE's
>  	  tee.elf, is passed during the Buildroot build.

Missing empty line here.

> +choice
> +	prompt "U-Boot OPTEE BL32 format"
> +	default BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
> +	depends on BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
> +
> +config BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
> +	bool "tee.bin"
> +
> +config BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF
> +	bool "tee.elf"
> +
> +endchoice
>  
>  config BR2_TARGET_UBOOT_NEEDS_OPENSBI
>  	bool "U-Boot needs OpenSBI"
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 574fc7089a..210fa219ed 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -177,7 +177,19 @@ endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
>  UBOOT_DEPENDENCIES += optee-os
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF),y)
>  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> +define UBOOT_COPY_TEE_FIRMWARE
> +	cp $(BINARIES_DIR)/tee.elf $(@D)/

Why do you need to copy it, when TEE is pointing to the original in
$(BINARIESD_DIR), just above, and that has worked well so far?

> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> +else
> +UBOOT_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee.bin
> +define UBOOT_COPY_TEE_FIRMWARE
> +	cp $(BINARIES_DIR)/tee-raw.bin $(@D)/tee.bin

Ditto: why do you need to copy it, when TEE, just above, also points to
the original in $(BINARIES_DIR) ?

Regards,
Yann E. MORIN.

> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> +endif
>  endif
>  
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
> -- 
> 2.25.1
> 

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
