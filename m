Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8889EC77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 19:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1097B60B91;
	Sun, 16 Apr 2023 19:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1097B60B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pugvghH8eUK6; Sun, 16 Apr 2023 19:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DEAD60A6B;
	Sun, 16 Apr 2023 19:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DEAD60A6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0879B1C400F
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0D6141C7C
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0D6141C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PWzLHlfokFT for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 19:48:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F647403FB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F647403FB
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 19:48:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4E3DE5FF9D;
 Sun, 16 Apr 2023 21:48:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 21:48:20 +0200
Date: Sun, 16 Apr 2023 21:48:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20230416194820.GF2819@scaer>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
 <20220913174039.182887-2-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220913174039.182887-2-thomas.claveirole@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681674506;
 bh=2ygPemOUM23Zw3H/ipTFvtRrdfSW94AOAGK8F4qNvXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pjqTicXAMPjrcLx5CHT439R6fS8V3hzbsH0Bn/ziy7t246wVBll5edaOHshlarWtL
 GCG5pPyMVRKMObKlva+QX67efSi2VkBzETmD9OsUwyGGT6WIiqVcFlVb6RwFS3MMjd
 YbfydzcuJO/eipzegIjr4fwBnGmNofG+R+jeT1+pZcT5VMivVhRv0zXDHuQgyZlMUx
 Ob0ke3RkRrrh3uEOPSff21IIqOUq1el2eGFhKei5sxqb+k3CbzxZ8FGauJSDR7hs+P
 WzvML8HG9o1JTbLk1qdTTHQFXA6+1OEUWGzNgFp4MCp4yv0BrNHrdmrQU1S5keOkve
 b8zWbA+ght/Og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pjqTicXA
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas C., All,

On 2022-09-13 19:40 +0200, Thomas Claveirole spake thusly:
> Corepack is a zero-runtime-dependency Node.js script that acts as a
> bridge between Node.js projects and the package managers.  It ships
> with Node.js but is disabled by default.
> 
> Some JavaScript packages, such as vuejs and vuejs-router can benefit
> from having Corepack installed on the host.  Therefore, add an option
> to enable Corepack with host-nodejs.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

My understanding of the thread, is that  this patch was introduced to be
able to build vuejs, which you bumped in the following patch.

Yet, the consensus was that we could bump vuejs and use the pre-compiled
variant, instead of needing to build host-nodejs.

However, nothing prevents us from merging the corepack feature, and
still update to the precompiled vuejs anyway.

Given the feedback from Thomas P. in the thread, I understand that
corepack is indeed working as expected, and is not actually requiring
download during the host-nodejs build itself (using it may trigger
download in the package that calls it, but that's another issue).

So, for those who perfer to always build from source at the expense of
build time (like I am), having corepack will be a useful addition.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/Config.in.host | 23 ++++++++++++++++++++---
>  package/nodejs/nodejs.mk      | 21 +++++++++++++++++----
>  2 files changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
> index 4ceaf0c73e..316a02d9d6 100644
> --- a/package/nodejs/Config.in.host
> +++ b/package/nodejs/Config.in.host
> @@ -1,3 +1,7 @@
> +comment "host nodejs needs a host gcc >= 8"
> +	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_8
> +
>  config BR2_PACKAGE_HOST_NODEJS
>  	bool "host nodejs"
>  	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> @@ -13,6 +17,19 @@ config BR2_PACKAGE_HOST_NODEJS
>  
>  	  http://nodejs.org/
>  
> -comment "host nodejs needs a host gcc >= 8"
> -	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> -	depends on !BR2_HOST_GCC_AT_LEAST_8
> +if BR2_PACKAGE_HOST_NODEJS
> +
> +config BR2_PACKAGE_HOST_NODEJS_COREPACK
> +	bool "Corepack"
> +	help
> +	  Enable Corepack with host nodejs.
> +
> +	  Corepack is a zero-runtime-dependency Node.js script that
> +	  acts as a bridge between Node.js projects and the package
> +	  managers they are intended to be used with during
> +	  development. In practical terms, Corepack will let you use
> +	  Yarn and pnpm without having to install them - just like
> +	  what currently happens with npm, which is shipped by Node.js
> +	  by default.
> +
> +endif
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 3154dcd7ec..1a95e1351f 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -117,6 +117,12 @@ define HOST_NODEJS_BUILD_CMDS
>  		$(HOST_NODEJS_MAKE_OPTS)
>  endef
>  
> +ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
> +define HOST_NODEJS_ENABLE_COREPACK
> +	$(COREPACK) enable
> +endef
> +endif
> +
>  define HOST_NODEJS_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
>  		$(MAKE) -C $(@D) install \
> @@ -125,6 +131,7 @@ define HOST_NODEJS_INSTALL_CMDS
>  	$(foreach f,$(NODEJS_HOST_TOOLS), \
>  		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
>  	)
> +	$(HOST_NODEJS_ENABLE_COREPACK)
>  endef
>  
>  ifeq ($(BR2_i386),y)
> @@ -235,8 +242,7 @@ endef
>  NODEJS_MODULES_LIST= $(call qstrip,\
>  	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
>  
> -# Define NPM for other packages to use
> -NPM = $(TARGET_CONFIGURE_OPTS) \
> +NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
>  	LDFLAGS="$(NODEJS_LDFLAGS)" \
>  	LD="$(TARGET_CXX)" \
>  	npm_config_arch=$(NODEJS_CPU) \
> @@ -244,8 +250,15 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
>  	npm_config_build_from_source=true \
>  	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
>  	npm_config_prefix=$(TARGET_DIR)/usr \
> -	npm_config_cache=$(BUILD_DIR)/.npm-cache \
> -	$(HOST_DIR)/bin/npm
> +	npm_config_cache=$(BUILD_DIR)/.npm-cache
> +
> +# Define various packaging tools for other packages to use
> +NPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/npm
> +ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
> +COREPACK = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/corepack
> +PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
> +YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
> +endif
>  
>  #
>  # We can only call NPM if there's something to install.
> -- 
> 2.37.2
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
