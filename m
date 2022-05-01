Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2F8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E1083E69;
	Sun,  1 May 2022 19:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZp3jhF1Fzhx; Sun,  1 May 2022 19:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F3583E10;
	Sun,  1 May 2022 19:50:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7419A1BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3014097A
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUt2jxhI0Ote for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3B6F408F5
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:50:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9448:1aca:a169:bea6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 64DF778034E;
 Sun,  1 May 2022 21:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651434607;
 bh=4W+E8xow2bjO1yO+UJy285re69t3XXMASmWaGw0N5e0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcCbJhxkeN2/p8PDB3EbS5o1RiQ4vn3sopYbpkw57gdFnLSZs7Fk1o8ugd++tkpaA
 wHGhNkUxej10gx6r0jXPBg+a7lNCBkxDYAUMxjYSsZ2TK8VaToiEtqR+sE5A9YvVeP
 zVte/uA0eZckNNGpuIC/GGS1+cHQKo6w+iXL40i9LZK7/eboqg5SY7kKm9OceQ4NwV
 JDtH83Q7Q2Kid5KTFbpCrEi5PlEVyfp4TLhaiG7t0Dng7OQlh6y60ju1uems+fnhSI
 wn/iUvjAjj1ZFOGUZyWcDlzoZh3ixr/bXjUeZFTgUMAVeC6AVaV61Vmi7BB2oYVcof
 0KYfddWgHWa6w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 May 2022 21:50:05 +0200
Date: Sun, 1 May 2022 21:50:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dariobin@libero.it>
Message-ID: <20220501195005.GP3624965@scaer>
References: <20220501141815.3886-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501141815.3886-1-dariobin@libero.it>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: add options to build
 examples
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2022-05-01 16:18 +0200, Dario Binacchi via buildroot spake thusly:
> The example applications, which are minimal, can be of great help in
> understanding how the library works.
> 
> As there is no configure option to enable examples compilation, building
> and installation instructions had to be added to libmnl.mk. By default,
> which is always the case for buildroot, they are disabled.

I thjink it does not make much sense to add an option for each example.
Instead, just build all of them when BR2_PACKAGE_LIBMNL_EXAMPLES is set.

Can you rework and respin, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>  package/libmnl/Config.in | 37 +++++++++++++++++++++++++++++++++++++
>  package/libmnl/libmnl.mk | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
> index 5acfb2447e..81b3811270 100644
> --- a/package/libmnl/Config.in
> +++ b/package/libmnl/Config.in
> @@ -5,3 +5,40 @@ config BR2_PACKAGE_LIBMNL
>  	  to Netlink developers.
>  
>  	  http://netfilter.org/projects/libmnl/
> +
> +if BR2_PACKAGE_LIBMNL
> +
> +config BR2_PACKAGE_LIBMNL_EXAMPLES
> +	bool "install examples"
> +	help
> +	  Install binary examples.
> +
> +if BR2_PACKAGE_LIBMNL_EXAMPLES
> +
> +config BR2_PACKAGE_LIBMNL_EXAMPLES_GENL
> +	bool "genl"
> +	help
> +	  This option will build and install the genl examples for
> +	  the target.
> +
> +config BR2_PACKAGE_LIBMNL_EXAMPLES_KOBJECT
> +	bool "kobject"
> +	help
> +	  This option will build and install the kobject examples
> +	  for the target.
> +
> +config BR2_PACKAGE_LIBMNL_EXAMPLES_NETFILTER
> +	bool "netfilter"
> +	help
> +	  This option will build and install the netfilter examples
> +	  for the target.
> +
> +config BR2_PACKAGE_LIBMNL_EXAMPLES_RTNL
> +	bool "rtnl"
> +	help
> +	  This option will build and install the rtnl examples for
> +	  the target.
> +
> +endif
> +
> +endif
> diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
> index 3361d05248..cb31b0f75f 100644
> --- a/package/libmnl/libmnl.mk
> +++ b/package/libmnl/libmnl.mk
> @@ -12,4 +12,43 @@ LIBMNL_LICENSE = LGPL-2.1+
>  LIBMNL_LICENSE_FILES = COPYING
>  LIBMNL_CPE_ID_VENDOR = netfilter
>  
> +ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES),y)
> +define LIBMNL_EXAMPLES_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) check -C $(@D)
> +endef
> +LIBMNL_POST_BUILD_HOOKS += LIBMNL_EXAMPLES_BUILD_CMDS
> +
> +ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_GENL),y)
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \
> +	$(addprefix examples/genl/, genl-family-get genl-group-events)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_KOBJECT),y)
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \
> +	$(addprefix examples/kobject/, kobject-event)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_NETFILTER),y)
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \
> +	$(addprefix examples/netfilter/, nfct-create-batch \
> +		nfct-daemon nfct-dump nfct-event nf-log \
> +		nf-queue)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_RTNL),y)
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \
> +	$(addprefix examples/rtnl/, rtnl-addr-add rtnl-addr-dump \
> +		rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
> +		rtnl-link-event rtnl-link-set rtnl-neigh-dump \
> +		rtnl-route-add rtnl-route-dump rtnl-route-event)
> +endif
> +
> +define LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
> +	$(foreach t,$(LIBMNL_EXAMPLES_INSTALL_TARGETS), \
> +		$(INSTALL) -D -m 0755 $(@D)/$(t) \
> +			$(TARGET_DIR)/usr/bin/$(notdir $(t))$(sep))
> +endef
> +LIBMNL_POST_INSTALL_TARGET_HOOKS += LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.17.1
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
