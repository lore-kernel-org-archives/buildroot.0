Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D26C7EE23
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 17:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41F761130;
	Fri, 24 Feb 2023 17:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41F761130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jy_tbIiX8swK; Fri, 24 Feb 2023 17:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AEC761132;
	Fri, 24 Feb 2023 17:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AEC761132
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA761BF5F6
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 17:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A09821A7
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 17:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9A09821A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJ3QsJg8cx_X for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 17:53:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142F7821A5
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 142F7821A5
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 17:53:33 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pVcG9-0000ev-Gj;
 Fri, 24 Feb 2023 17:53:29 +0000
Date: Fri, 24 Feb 2023 17:53:24 +0000
From: John Keeping <john@metanate.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <Y/j5lHY2/7h82EG4@donbot>
References: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=f3Ky5ugokTi71izCOletXIT5XUIrTkUJfpQ8TLyx9CQ=; b=pmhXj
 T8oCnp9Qq5+jIq6oxaqGcADZTNEYStqPhptyvKHF4Avt6xoo+KxYCGrmUB5SowjWa3acCtGZaFcSW
 Elm6h3lr0MqzMUuA3L6OIGaUzSCnGBkUvMZRrfuIc6PTAfvJg9mKVTIhUhv3B+pbDQKSf6yIme7po
 +AxT6ENt7EkaJKK38IAgl4wUR74GelvTxYSANjy7iZxACZpaIKwf24vPWENsgmcqwtcZfX2hDdYQ1
 ZuuMPziHhs+6141JmDNaLOd1WO7+u1S29xiPbZnYHrfWupw82moGnffHMl1m3j47y44Q5lUjTDw/6
 GI0dpuiemp2tJ/9w82nseHnoO+oCw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=pmhXjT8o
Subject: Re: [Buildroot] [PATCH v1 1/3] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Feb 24, 2023 at 12:15:07PM +0100, Thomas Devoogdt wrote:
> E.g. Commit 
>  16e5c92ff5fd2b44a1126bd7d7538c68ce838213, and
>  78d499409f71d8a22b0632c8ebc06f67ee6ae6dd 
> can now be replaced by: WEBKITGTK_CMAKE_NINJA = YES
> 
> Packages that are selecting Ninja, should also use the NINJA_{ENV,OPTS} variables iso the MAKE variables.

The current webkitgtk build commands use `cmake --build` and `cmake
--install`, wouldn't it be better to use those here?

I wonder if it makes more sense to replace anything generator-specific
(like $(PKG)_MAKE_OPTS or $(PKG)_NINJA_OPTS) with general
$(PKG)_CMAKE_BUILD_OPTS and $(PKG)_CMAKE_INSTALL_OPTS so that packages
become independent of the generator.

If those options are at the end of the command, then packages still have
the option (in the build phase) to pass built-tool specific options by
including `--` in the value.

> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/pkg-cmake.mk | 41 +++++++++++++++++++++++++++++++++++++++--

No change in docs/? ;-)

>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 8c375779cb..4ce3e6bada 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -65,6 +65,13 @@ else
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
>  endif
>  
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +$(2)_DEPENDENCIES += host-ninja
> +$(2)_GENERATOR			= "Ninja"
> +else
> +$(2)_GENERATOR			= "Unix Makefiles"
> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -88,7 +95,7 @@ define $(2)_CONFIGURE_CMDS
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> @@ -119,7 +126,7 @@ define $(2)_CONFIGURE_CMDS
>  	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>  	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> @@ -165,45 +172,75 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
>  #
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +define $(2)_BUILD_CMDS
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
> +endef
> +else
>  define $(2)_BUILD_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
> +endif
> +else
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +define $(2)_BUILD_CMDS
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
> +endef
>  else
>  define $(2)_BUILD_CMDS
>  	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
>  endif
> +endif
>  
>  #
>  # Host installation step. Only define it if not already defined by the
>  # package .mk file.
>  #
>  ifndef $(2)_INSTALL_CMDS
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +define $(2)_INSTALL_CMDS
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
> +endef
> +else
>  define $(2)_INSTALL_CMDS
>  	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
> +endif
>  
>  #
>  # Staging installation step. Only define it if not already defined by
>  # the package .mk file.
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +define $(2)_INSTALL_STAGING_CMDS
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR install
> +endef
> +else
>  define $(2)_INSTALL_STAGING_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
> +endif
>  
>  #
>  # Target installation step. Only define it if not already defined by
>  # the package .mk file.
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +define $(2)_INSTALL_TARGET_CMDS
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
> +endef
> +else
>  define $(2)_INSTALL_TARGET_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
>  endef
>  endif
> +endif
>  
>  # Call the generic package infrastructure to generate the necessary
>  # make targets
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
