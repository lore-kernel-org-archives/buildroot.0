Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10641EE49A5
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5504151A;
	Sat, 19 Aug 2023 13:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F5504151A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oP5VVxWI_iJc; Sat, 19 Aug 2023 13:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BACD41DF6;
	Sat, 19 Aug 2023 13:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BACD41DF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C596B1BF476
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 13:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F18F60F69
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 13:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F18F60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jl-LbHWw9SPn for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 13:42:48 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6055560B65
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 13:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6055560B65
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DF846200385;
 Sat, 19 Aug 2023 15:42:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Aug 2023 15:42:38 +0200
Date: Sat, 19 Aug 2023 15:42:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Romanov <avromanov@sberdevices.ru>
Message-ID: <20230819134039.GA1777680@scaer>
References: <20230818101754.73199-1-avromanov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818101754.73199-1-avromanov@sberdevices.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692452565;
 bh=gXXm/xptN8SrplvEfId6UG3SKyE8rGefEWmZmuXbs6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rpT8N7ss34nWd5UNH+ImEpXvF9aXv9IsWnd+AsjHyvvvUeUbjm2UWdHMeGFdu+ZpE
 yQjhAm7xlt6qDlJpWMdBEpUvj5Jmb2i9w5HJoUJwTXRzTBwICGDY6+DVSEpxkSBOFl
 VdtEi5XRN1/nTLpcXypBClLWgwR7qUr+KPSUL2rFTm18Ol5wnwX1xV9Rlpa2AsLhHI
 eAfGhnnctGs+44TNa+Z0S8Bn8q2aGAItSDYa2Hc82TIc0e8EArv59qypn6W56Hd4eG
 3LJGAdh75pSmZMb/AyyuaF6VlnaPGnGaEuFBlaF/zx94/QZTbNCwsycpxx+H+BK6Vm
 DNPhq4KRfXs/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rpT8N7ss
Subject: Re: [Buildroot] [PATCH v1] pkg-config.mk: introduce savefragment
 subcommand
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
Cc: patrickdepinguin@gmail.com, kernel@sberdevices.ru,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexey, All,

On 2023-08-18 13:17 +0300, Alexey Romanov via buildroot spake thusly:
> Useful subcommand designed for run savedefconfig with fragment files.
> Simple example of usage:
> 
> m linux-savefragment fragment=radio1_a_debug.fragment

Generating a new fragment is not usually that useful; indeed, whether a
configuration item changed (enabled, disabled, set to something) is
important, and only a human can decide what part of the configuration
files such change in setting should go: main configuration file, or one
of the following fragments.

To help achioeve this, there is already a command to generate a diff of
the current configuration against the "configured-known" one:

    $ make linux-diff-config

Then the user can decide to update the existing main configuration file,
update an existing fragment, or create a new fragment.

This is however not documented, and if we need something, it is
documentation for that existing command rather than a new one;
see lines 100-onward.

Can you look into that instead, please?

Regards,
Yann E. MORIN.

> The saved fragment for such fragment will be in:
> 
> out/$(target)/build/linux-custom/arch/$(arch)/configs/$(target).fragment
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  package/pkg-kconfig.mk | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 32dcfea0bc..7e5c7d88a1 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -37,6 +37,40 @@ define kconfig-package-savedefconfig
>  		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) savedefconfig
>  endef
>  
> +FRAGMENT_CONFIG_PATH=arch/$(KERNEL_ARCH)/configs
> +
> +# Macro to save the fragment file
> +# $(1): the name of the package in upper-case letters
> +# $(2): the fragment name
> +define kconfig-package-savefragment
> +	$(eval ORIG_CONFIG=$(shell mktemp))
> +	$(eval CHANGED_CONFIG=$(shell mktemp))
> +	$(eval DIFF_CONFIG=$(shell mktemp))
> +	$(eval NEW_FRAGMENT=$(shell mktemp))
> +
> +	$(Q) cp $($(1)_DIR)/.config $(CHANGED_CONFIG)
> +
> +	$($(1)_MAKE_ENV) $($(1)_MAKE) -C $($(1)_DIR) \
> +		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) \
> +		$($(1)_KCONFIG_DEFCONFIG)
> +
> +	$(Q) cp $($(1)_DIR)/.config $(ORIG_CONFIG)
> +
> +	$(Q) $($(1)_DIR)/scripts/diffconfig -m $(ORIG_CONFIG) \
> +		$(CHANGED_CONFIG) > $(DIFF_CONFIG)
> +	$(Q) KCONFIG_CONFIG=$(NEW_FRAGMENT) \
> +		$($(1)_DIR)/scripts/kconfig/merge_config.sh \
> +		-m $($(1)_DIR)/$(FRAGMENT_CONFIG_PATH)/$(2) $(DIFF_CONFIG)
> +	$(Q) sed -E -e 's/.*(CONFIG_[^ =]+).*/\1 \0/' $(NEW_FRAGMENT) \
> +		| sort -k1 |  cut -d " " -f 2- > \
> +		$($(1)_DIR)/$(FRAGMENT_CONFIG_PATH)/$(2)
> +
> +	$(Q) cp $(CHANGED_CONFIG) $($(1)_DIR)/.config
> +
> +	$(Q) rm -f $(ORIG_CONFIG) $(CHANGED_CONFIG) \
> +		$(DIFF_CONFIG) $(NEW_FRAGMENT)
> +endef
> +
>  # The correct way to regenerate a .config file is to use 'make olddefconfig'.
>  # For historical reasons, the target name is 'oldnoconfig' between Linux kernel
>  # versions 2.6.36 and 3.6, and remains as an alias in later versions.
> @@ -282,6 +316,12 @@ $(1)-savedefconfig: $(1)-check-configuration-done
>  	$$(call kconfig-package-savedefconfig,$(2))
>  endif
>  
> +ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
> +.PHONY: $(1)-savefragment
> +$(1)-savefragment: $(1)-check-configuration-done
> +	$$(call kconfig-package-savefragment,$(2),$(fragment))
> +endif
> +
>  ifeq ($$($(2)_KCONFIG_DEFCONFIG),)
>  # Target to copy back the configuration to the source configuration file
>  # Even though we could use 'cp --preserve-timestamps' here, the separate
> -- 
> 2.30.1
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
