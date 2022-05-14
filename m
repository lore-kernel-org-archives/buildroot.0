Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D974EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 517B081B6D;
	Sat, 14 May 2022 21:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fp44oi1DeKZ; Sat, 14 May 2022 21:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ECAB81A27;
	Sat, 14 May 2022 21:01:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1DDE1BF681
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C00A74051A
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChLOQVEGF8v3 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:01:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B534840004
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:01:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1949:2e37:e3d5:26d2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9542B5FF9A;
 Sat, 14 May 2022 23:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652562074;
 bh=wKFCg4MdaGcWj0H65msEwqqgBEWqRG+bnobClrruVdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEW93h1W1ORDNR/Scd3mY9t+26Stp0ELNvgovJASl3+hsVHgq71M3tRPKuqczBrpZ
 tXie+L1b2fctRuKFBNA/LWJCd7jud00SVQRio6mqBNJbxaOLKZiWSc2gx+Xt47olxX
 chKh6R8sHxXc+QGUtThJZHoPys+GdjOjV8/Lnup44dXu5iLvhd1wFAlW/ololzn+4E
 3DhRDv8R1M3mt9DCjQuawMPBz0cCcmqqKmMhz0GQrs8W2bd4dqRypcAz383tuDu6xE
 ch18gUFgkGiRFHRfqO2khUjPpxMrwqT7hL4pIppcx6INN2Ckn0K9YCyCmxMQnHcuvr
 F5Xa1VY2c3eVg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 23:01:08 +0200
Date: Sat, 14 May 2022 23:01:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tom Marcuzzi <tom.marcuzzi@orolia.com>
Message-ID: <20220514210108.GD1597494@scaer>
References: <20220125130506.668690-1-tom.marcuzzi@orolia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220125130506.668690-1-tom.marcuzzi@orolia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] packages/nodejs: install npm packages on
 host
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
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tom, All,

Sorry for the delay; here's a quick review...

On 2022-01-25 14:05 +0100, Tom Marcuzzi spake thusly:
> Installing npm packages on host allows to use JavaScript tools that
> runs on NodeJS (such as webpack) to build web applications.
> 
> Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
> ---
[--SNIP--]
> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
> index 4ceaf0c73e..0b67a59c55 100644
> --- a/package/nodejs/Config.in.host
> +++ b/package/nodejs/Config.in.host
> @@ -16,3 +16,35 @@ config BR2_PACKAGE_HOST_NODEJS
>  comment "host nodejs needs a host gcc >= 8"
>  	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	depends on !BR2_HOST_GCC_AT_LEAST_8
> +
> +if BR2_PACKAGE_HOST_NODEJS
> +
> +config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL
> +	string "Additional modules"
> +	help
> +	  List of space-separated nodejs modules to install via npm
> +	  on host. See https://npmjs.org/ to find modules and
> +	  'npm help install' for available installation methods.
> +	  For repeatable builds, download and save tgz files or
> +	  clone git repos for the components you care about.
> +
> +	  Example:
> +	  serialport uglify-js@1.3.4 /my/module/mymodule.tgz \
> +	  git://github.com/someuser/somemodule.git#v1.2
> +
> +	  This would install the serialport module (at the newest
> +	  version), the uglify-js module at 1.3.4, a module from a
> +	  filesystem path, and a module from a git repository.
> +
> +config BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
> +	string "Additional module dependencies"

I know you modelled this after the equivalent code for the target
variant, but I think BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL_DEPS
should have a dependency on BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL
not being empty (and a similar dependency should be added for the target
case), something like:

    depends on BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL != ""

[--SNIP--]
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 727af6dc50..8a4a2ff0cf 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
[--SNIP--]
> @@ -96,6 +97,35 @@ NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
> 
>  HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
> 
> +#
> +# Build the list of modules to install on host.
> +#
> +HOST_NODEJS_MODULES_LIST= $(call qstrip,\
> +	$(BR2_PACKAGE_HOST_NODEJS_MODULES_ADDITIONAL))
> +
> +# Define NPMHOST for other packages to use
> +NPMHOST = $(HOST_CONFIGURE_OPTS) \
> +	LDFLAGS="$(HOST_LDFLAGS)" \
> +	LD="$(HOST_CXX)" \
> +	npm_config_arch=$(NODEJS_CPU) \
> +	npm_config_target_arch=$(NODEJS_CPU) \

NODEJS_CPU is the target CPU. This is most probably incorrect for the
host npm. You can use $(HOSTARCH) to decide what kind of CPU to use,
something like:

    ifeq ($(HOSTARCH),x86)
    HOST_NODEJS_CPU = ia32
    else ifeq ($(HOSTARCH),x86_64)
    HOST_NODEJS_CPU = x84
    ...
    fi

Or maybe we just don't need it at all, since we do not specify it at all
when configuring the host nodejs...

> +	npm_config_build_from_source=true \
> +	npm_config_nodedir=$(HOST_DIR)/nodejs-$(NODEJS_VERSION) \

For the target variant, we point that to the nodejs build directory:

    npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION)

So for the host we should probably do something similar:

    npm_config_nodedir=$(BUILD_DIR)/host-nodejs-$(NODEJS_VERSION)

Otherwise, please explain that in the commit log.

And note that it should probably be better to use the actual variable:

    npm_config_nodedir=$(HOST_NODEJS_BUILDDIR)

and that the target variant should probably also be fixed.

> +	npm_config_prefix=$(HOST_DIR)/usr \
> +	npm_config_cache=$(HOST_DIR)/.npm-cache \

Ditto, this should point to $(BUILD_DIR)/.host-npm-cache

Regards,
Yann E. MORIN.

> +	$(HOST_DIR)/bin/npm
> +#
> +# We can only call NPMHOST if there's something to install.
> +#
> +ifneq ($(HOST_NODEJS_MODULES_LIST),)
> +define HOST_NODEJS_INSTALL_MODULES
> +	# If you're having trouble with module installation, adding -d to the
> +	# npm install call below and setting npm_config_rollback=false can both
> +	# help in diagnosing the problem.
> +	$(NPMHOST) install -g $(HOST_NODEJS_MODULES_LIST)
> +endef
> +endif
> +
>  define HOST_NODEJS_BUILD_CMDS
>  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
>  		$(MAKE) -C $(@D) \
> @@ -110,6 +140,8 @@ define HOST_NODEJS_INSTALL_CMDS
>  	$(foreach f,$(NODEJS_HOST_TOOLS), \
>  		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
>  	)
> +
> +	$(HOST_NODEJS_INSTALL_MODULES)
>  endef
> 
>  ifeq ($(BR2_i386),y)
> --
> 2.25.1
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
