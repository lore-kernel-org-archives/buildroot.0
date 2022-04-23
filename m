Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E55C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 543E760EE4;
	Sat, 23 Apr 2022 15:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZhLoyYHUvVW; Sat, 23 Apr 2022 15:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F4D60BF7;
	Sat, 23 Apr 2022 15:38:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E41321BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC09141993
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ruW_8zYmc_Az for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13EA24198F
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:38:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id f17so13745798edt.4
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8G2cvBMQscNt0PXc+GrJAcIGnXa+I5y8BJxKdmLcxng=;
 b=B4YeD+ZRDsEZqQ2feg67usIoxv9dr6f5Rq5tDvI5DdzyS4PvMJ7I3je4y64iPPqLhR
 7Od/EXvcYPZWpdubfKLk12pmYO1hBh1xx1Cteedn6nHz7YP5QfrzALooOqN9MZJlO0tP
 RvH18Nrhu31xTav7lB33/WEQbmDodF7+qyiV9R8E71+jiIuJEHr0IzCl3ST+A6KTkAu1
 PxWr7yF3ywh+bQWCk5Ld5OKZdciephzDqdNKxw+YYrbyjGo3KWk4XbzOP8NRqW/7IlOb
 +8Qj3fNsHqMcq8mLoutzGW9umJhmT1ZrrqNPolbe2mA3xmak0oLY/M4DzhxR8rNtSIOp
 JXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8G2cvBMQscNt0PXc+GrJAcIGnXa+I5y8BJxKdmLcxng=;
 b=h+15POtPwV1CcPnpTjkWVbnRw6sQv393cWwR+9h66nlK+rDwe2KK3JDoKjnyIBeRNq
 ZqVdEOWbMNp+zWVqwZCcURymcS/d1Dl+9/2iiq96UlL8l6SRIq1oeMnYeDvyX0hUBQgk
 q7RmG4DkKUqvWJAHtYTluqGirA8Tw2AxG6MlXpmEA/EyGFz9/GcK4bTxKcOc11pVSirj
 YzDQNm96C+YeIifzBQ0/A2jydcwja9YjDJZnhyXF9QPVe3fgbfE0+vn68WXbo45tH8sz
 +314VQB+kl4nSUTtgWgS+egL/vmzRzimr1cZDXK9UbzcZCm9gRugEtVO18z9yBT1t9wt
 aeAQ==
X-Gm-Message-State: AOAM533cEqn7xhZ26w5P5oD9BgZwCOitLjrgJhtmwIA2UmwSwTucdi2c
 zJO5hTUS6xJtQUeypqJM4eHIUA==
X-Google-Smtp-Source: ABdhPJzAVs/RdWXsbo6nE3pQ0ay+ay7ThCS75+ebLXFHfHxGDEU/BJiEVuN7QyrUkFVheijuidOz+A==
X-Received: by 2002:a05:6402:35c3:b0:423:f765:4523 with SMTP id
 z3-20020a05640235c300b00423f7654523mr10678903edc.311.1650728313147; 
 Sat, 23 Apr 2022 08:38:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 fy11-20020a1709069f0b00b006e8b68c92d8sm1723714ejc.162.2022.04.23.08.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:38:32 -0700 (PDT)
Message-ID: <79a89879-159c-85b2-46fa-8d59160db6da@mind.be>
Date: Sat, 23 Apr 2022 17:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220420121202.1074548-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420121202.1074548-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: drop tagged layout
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/04/2022 14:12, Fabrice Fontaine wrote:
> Drop boost tagged layout which raises the following build failure with
> botan or libcpprestsdk:
> 
> /nvmedata/autobuild/instance-31/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lboost_system
> 
> CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
>    Could NOT find Boost (missing: random system thread filesystem chrono
>    atomic date_time regex) (found version "1.78.0")
> 
> While at it:
>   - drop BR2_PACKAGE_BOOST_LAYOUT and BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
>   - move --layout=system, --ignore-site-config,
>     --user-config=$(@D)/user-config.jam, -j$(PARALLEL_JOBS), -q and
>     --prefix=$(HOST_DIR) to BOOST_OPTS and HOST_BOOST_OPTS
>   - drop parentheses to avoid spawning a useless sub-shell
>   - use b2 everywhere instead of mixing b2 and
>     tools/build/src/engine/bjam
>   - drop uneeded 'echo "" >> $(@D)/user-config.jam'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f237c9345faf8c28f3c73f7d8acb49271fe61780
>   - http://autobuild.buildroot.org/results/a73225e40fa29bc3b24f36a86719e80c8e469d1f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   Config.in.legacy        | 13 ++++++++++
>   package/boost/Config.in | 27 ---------------------
>   package/boost/boost.mk  | 53 ++++++++++++++---------------------------
>   3 files changed, 31 insertions(+), 62 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 27f19f14e7..a4811831f3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,19 @@ endif
>   
>   comment "Legacy options removed in 2022.05"
>   
> +config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> +	bool "boost system layout removed"
> +	select BR2_LEGACY
> +	help
> +	  Boost system layout is now the only supported layout.

  I didn't include this. Indeed, nothing changes if you already had this 
selected. The purpose of Config.in.legacy is to make it easier for people to 
migrate if Config.in options change. If an option is renamed, then we 
automatically "convert" the old config to the old config. If an option is plain 
removed, we can warn the user that it no longer applies. But if an option just 
becomes mandatory and the user already had it selected, than nothing changes for 
that user - we only want to warn people if they *didn't* have it selected. 
Forcing people to go through the legacy menu and manually deselect it is just 
creating extra work without any gains.

  Applied to master, thanks.

  Regards,
  Arnout


> +
> +config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
> +	bool "boost tagged layout removed"
> +	select BR2_LEGACY
> +	help
> +	  Boost tagged layout isn't handled by some packages (e.g. botan
> +	  or libcpprestsdk).
> +
>   config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
>   	bool "boost versioned layout removed"
>   	select BR2_LEGACY
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 9e96be7878..b99b01f22e 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -16,33 +16,6 @@ config BR2_PACKAGE_BOOST
>   
>   if BR2_PACKAGE_BOOST
>   
> -choice
> -	prompt "Layout"
> -	default BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> -	help
> -	  Selects the layout of Boost binary names
> -
> -config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> -	bool "system"
> -	help
> -	  Boost binary names do not include the Boost version number
> -	  or the name and version number of the compiler.
> -
> -config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
> -	bool "tagged"
> -	help
> -	  Boost binary names include the encoded build properties such
> -	  as variant and threading, but do not include compiler name
> -	  and version, or Boost version. This option is useful if you
> -	  build several variants of Boost, using the same compiler.
> -
> -endchoice
> -
> -config BR2_PACKAGE_BOOST_LAYOUT
> -	string
> -	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
> -	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
> -
>   config BR2_PACKAGE_BOOST_ATOMIC
>   	bool "boost-atomic"
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 032ba5c820..346d309777 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -76,7 +76,9 @@ BOOST_DEPENDENCIES += python3
>   endif
>   
>   HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
> -	variant=release link=shared runtime-link=shared
> +	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
> +	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
> +	--user-config=$(@D)/user-config.jam
>   
>   ifeq ($(BR2_MIPS_OABI32),y)
>   BOOST_ABI = o32
> @@ -90,7 +92,12 @@ BOOST_OPTS += --no-cmake-config \
>   	toolset=gcc \
>   	threading=multi \
>   	abi=$(BOOST_ABI) \
> -	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)
> +	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
> +	-j$(PARALLEL_JOBS) \
> +	-q \
> +	--ignore-site-config \
> +	--layout=system \
> +	--user-config=$(@D)/user-config.jam
>   
>   ifeq ($(BR2_sparc64),y)
>   BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
> @@ -119,43 +126,29 @@ endif
>   
>   BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
>   BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
> -BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
>   
>   # how verbose should the build be?
>   BOOST_OPTS += $(if $(QUIET),-d,-d+1)
>   HOST_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
>   
>   define BOOST_CONFIGURE_CMDS
> -	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
> +	cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS)
>   	echo "using gcc : `$(TARGET_CC) -dumpversion` : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
> -	echo "" >> $(@D)/user-config.jam
>   	sed -i "s/: -O.* ;/: $(TARGET_OPTIMIZATION) ;/" $(@D)/tools/build/src/tools/gcc.jam
>   endef
>   
>   define BOOST_BUILD_CMDS
> -	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
> -	--user-config=$(@D)/user-config.jam \
> -	$(BOOST_OPTS) \
> -	--ignore-site-config \
> -	--layout=$(BOOST_LAYOUT))
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS)
>   endef
>   
>   define BOOST_INSTALL_TARGET_CMDS
> -	(cd $(@D) && $(TARGET_MAKE_ENV) ./b2 -j$(PARALLEL_JOBS) -q \
> -	--user-config=$(@D)/user-config.jam \
> -	$(BOOST_OPTS) \
> -	--prefix=$(TARGET_DIR)/usr \
> -	--ignore-site-config \
> -	--layout=$(BOOST_LAYOUT) install )
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS) \
> +		--prefix=$(TARGET_DIR)/usr install
>   endef
>   
>   define BOOST_INSTALL_STAGING_CMDS
> -	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
> -	--user-config=$(@D)/user-config.jam \
> -	$(BOOST_OPTS) \
> -	--prefix=$(STAGING_DIR)/usr \
> -	--ignore-site-config \
> -	--layout=$(BOOST_LAYOUT) install)
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS) \
> +		--prefix=$(STAGING_DIR)/usr install
>   endef
>   
>   # These hooks will help us to detect missing select in Config.in
> @@ -177,26 +170,16 @@ endef
>   BOOST_POST_INSTALL_TARGET_HOOKS += BOOST_CHECK_TARGET_LIBRARIES
>   
>   define HOST_BOOST_CONFIGURE_CMDS
> -	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
> +	cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS)
>   	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
> -	echo "" >> $(@D)/user-config.jam
>   endef
>   
>   define HOST_BOOST_BUILD_CMDS
> -	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
> -	--user-config=$(@D)/user-config.jam \
> -	$(HOST_BOOST_OPTS) \
> -	--ignore-site-config \
> -	--prefix=$(HOST_DIR) )
> +	cd $(@D) && ./b2 $(HOST_BOOST_OPTS)
>   endef
>   
>   define HOST_BOOST_INSTALL_CMDS
> -	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
> -	--user-config=$(@D)/user-config.jam \
> -	$(HOST_BOOST_OPTS) \
> -	--prefix=$(HOST_DIR) \
> -	--ignore-site-config \
> -	--layout=$(BOOST_LAYOUT) install )
> +	cd $(@D) && ./b2 $(HOST_BOOST_OPTS) install
>   endef
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
