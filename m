Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7472DC001DF
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 19:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0644E83FBF;
	Thu,  3 Aug 2023 19:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0644E83FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwwTVLtCx8-R; Thu,  3 Aug 2023 19:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1497C80BF9;
	Thu,  3 Aug 2023 19:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1497C80BF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE201BF33E
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3957460AD4
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3957460AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPoWDCBVHhdt for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 19:41:47 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ADAE60A8D
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 19:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ADAE60A8D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:220a:a3fc:7608:6165])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C2B0E78036C;
 Thu,  3 Aug 2023 21:41:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 03 Aug 2023 21:41:40 +0200
Date: Thu, 3 Aug 2023 21:41:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230803194140.GP421096@scaer>
References: <20230803121003.160501-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803121003.160501-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691091704;
 bh=5mdxB41P3yuMPjKK0qyN03CwZg+yrJC8hSKgvo+HhkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JiJzNrwT0HyvENURzL9ABsLvRH6vpAVqFaiTkONBgzrjgES9TfvJM8oVNetJGhtzT
 LItqYRz5ngWUG3AeIZqHbLKhA13QrlDFSgmeRN1TTQpkL8jkWDsUVuB3zSXwurz63L
 hiuoDx3AIkVi1yq9NSy/vKnmwXMtjz/ym8tmm9pMexJq5LltsUs8vgbf6mk3cCDoCo
 s2VKkFdD7tdAF3qqjWofb4dyDDw8X5QDLQs9TGZcDGHgM6mI9O0gib1qrC21tBEvhd
 mwH3oWF8ZZ0z4wE5RPwboBJnjnJpnn9PB5muAdX2kh6yd154Q0DpH6Bhav6CncxM0w
 ErP9jT4qhoyig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JiJzNrwT
Subject: Re: [Buildroot] [RFC v2] boot/uboot: add option to install custom
 environment file
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
Cc: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2023-08-03 14:10 +0200, Heiko Thiery spake thusly:
> U-Boot has the capability to set the environment variables via a text file.
> The text file has to be located in the U-Boot board source directory and
> selected via the CONFIG_ENV_SOURCE_FILE option. The CONFIG_ENV_SOURCE_FILE
> must only contain the filename without the '.env' suffix.
> 
> Thus the buildroot option BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT is added
> that needs the information about the source of the file in the buildroot
> environment (BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE).
> 
> Since the environment file must be located in the U-Boot board source
> directory. This directory is <SRC>/board/<VENDOR>/<BOARDNAME>.
> 
> Thes information about vendor name and board name are available in the
> U-Boot .config file and can be extracted from there to determine the
> destination directoy.
> 
> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
[--SNIP--]
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8b726eaa57..894a0bd3b2 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -607,6 +607,22 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
>  
>  endif
>  
> +config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
> +	bool "custom environment"
> +	help
> +	  Provide a custom u-boot environment file. This will be
> +	  copied to the U-Boot source path and enabled via the
> +	  U-Boot config option CONFIG_ENV_SOURCE_FILE. The target
> +	  path will be determined based on the U-Boot configuration.
> +
> +if BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT
> +config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE
> +	string "Custom environment source file"
> +	help
> +	  Path to U-Boot custom environment file.
> +
> +endif

We don't really need a boolean option to guard a single string option. I
know we tend to do that a lot, but I find that to be an anti-pattern.

In this case, the empty string is as good as saying "no" to the boolean
option, so we can just live with the sting option, and then (see below)...

(of course, if the empty string _has_ a special meaning, then we'd need
a boolean, but that's usually not the case in such situations).

>  config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
>  	string "Custom make options"
>  	help
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index b3d26b16fe..35e26ade2d 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -181,6 +181,26 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
>  endif
>  endif
>  
> +#
> +# Prepare for custom environment
> +#
> +ifeq ($(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE)),)
> +$(error No custom environment source file specified, check your BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE setting)
> +endif

... we don't need to check the sanity of the settings: empty means don't
use a custom env file, set means use that file as custom env file.

> +define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
> +	cp -f $(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE) $(@D)/board/$(shell grep CONFIG_SYS_VENDOR $(@D)/.config | sed 's/.*=//' | sed 's/"//g')/$(shell grep CONFIG_SYS_BOARD $(@D)/.config | sed 's/.*=//' | sed 's/"//g')/

Please split this line into easier-to-parse construct, see below...

> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE

Is it a pre-build or a post-configure hook? I would think it should be a
post-configure one...

> +
> +
> +UBOOT_ENV_FILE_NAME=$(subst .env,,$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE))))

$(patsubst %.env,%,$(notdir $(UBOOT_CUSTOM_ENVIRONMENT_SOURCE)))

> +define UBOOT_KCONFIG_CUSTOM_ENV_SOURCE
> +	$(call KCONFIG_SET_OPT,CONFIG_ENV_SOURCE_FILE,"$(UBOOT_ENV_FILE_NAME)")
> +endef
> +endif

So, the .mk code would look like;

    UBOOT_CUSTOM_ENVIRONMENT_SOURCE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_SOURCE)))
    UBOOT_ENV_FILE_NAME=$(patsubst %.env,%,$(notdir $(UBOOT_CUSTOM_ENVIRONMENT_SOURCE)))
    ifneq ($(UBOOT_CUSTOM_ENVIRONMENT_SOURCE),)
    define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
        sys_config=$( ./utils/config --file $(@D)/.config -s CONFIG_SYS_VENDOR ); \
        sys_board=$( ./utils/config --file $(@D)/.config -s CONFIG_SYS_BOARD ); \
        cp -f $(UBOOT_CUSTOM_ENVIRONMENT_SOURCE) $(@D)/board/$${sys_config}/$${sys_board}
    endef
    UBOOT_POST_CONFIGURE_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE

    define UBOOT_KCONFIG_CUSTOM_ENV_SOURCE
        $(call KCONFIG_SET_OPT,CONFIG_ENV_SOURCE_FILE,"$(UBOOT_ENV_FILE_NAME)")
    endef
    endif  # UBOOT_CUSTOM_ENVIRONMENT_SOURCE != ""

Regards,
Yann E. MORIN.

> +
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
>  UBOOT_DEPENDENCIES += optee-os
>  UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> @@ -497,6 +517,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
>  	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
>  	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
>  	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
> +	$(UBOOT_KCONFIG_CUSTOM_ENV_SOURCE)
>  endef
>  
>  ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
