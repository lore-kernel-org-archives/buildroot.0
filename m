Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEFCC6FA8E
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32C660E46;
	Tue, 28 Feb 2023 15:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E32C660E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arN1STDFAaye; Tue, 28 Feb 2023 15:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A71F61177;
	Tue, 28 Feb 2023 15:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A71F61177
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C79B1BF94D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2657C40105
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2657C40105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsLvJpEGl9u8 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:33:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A0CE40022
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A0CE40022
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:33:17 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pX1yZ-0004Uo-UL;
 Tue, 28 Feb 2023 15:33:12 +0000
Date: Tue, 28 Feb 2023 15:33:10 +0000
From: John Keeping <john@metanate.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <Y/4etrPX5MZiUpdq@donbot>
References: <20230224111509.2434694-3-thomas.devoogdt@barco.com>
 <20230227103956.128236-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230227103956.128236-1-thomas.devoogdt@barco.com>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=vEujlOcOCN/60t7otvNzXDQcBlovKOKJ0zLursUORq4=; b=2AZBa
 0SD2geWY375p990/5xmX9LcoKqfgg+xYNrH9iuUhRVHtU6K2rqPSwkjCfkHXz9binq/FaiMwswyYY
 SLKEsiOcqPRnAE95Z+Xgn9B0nw+ZrwAGBfyqySIRNi4eqLLRdgeyqqMETGszH/S5dgcfIcw29yvdR
 8VyR45P5r1sMIHVG3iZRmX3wijFhFw+CqbjsEW51tU83QLxC1cDGKzU7Ggrp4tmX2L6WMQwN/JEAb
 oBpeQB5smj4JDKmlSj/zSpQ0Htt7vBS0wegFduv4/7ianc7fJhhEg9Dg/k/5NSDK+2YhvA/MLddGo
 CbF1sBGUlCInu1RiS2Sv0LzsPf5DQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=2AZBa0SD
Subject: Re: [Buildroot] [PATCH v2 1/3] pkg-cmake: add option to select the
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 27, 2023 at 11:39:54AM +0100, Thomas Devoogdt wrote:
> E.g. Commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213 can now be replaced by:
> WEBKITGTK_CMAKE_NINJA = YES
> 
> Packages that are selecting Ninja (or overtime another generator),
> should also use the _BUILD_{ENV,OPTS} variables iso the _MAKE variables.
> 
> No _INSTALL{,_STAGING,_TARGET}_OPTS used so far:
> 
>     $ grep '_INSTALL_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
>     $ grep '_INSTALL_STAGING_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
>     $ grep '_INSTALL_TARGET_OPTS' $(grep -rl "cmake-package" package/*/*.mk)
> 
> The _MAKE_{ENV,OPTS} are translated to _BUILD_{ENV,OPTS}:
> 
>     $ grep '_MAKE_ENV =' $(grep -rl "cmake-package" package/*/*.mk)
> 
> > package/netopeer2/netopeer2.mk:NETOPEER2_MAKE_ENV = \
> > package/racehound/racehound.mk:RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)
> 
>     $ grep '_MAKE_OPTS =' $(grep -rl "cmake-package" package/*/*.mk)

This misses package/gdal/gdal.mk which does '_MAKE_OPTS +='.

> > package/mariadb/mariadb.mk:HOST_MARIADB_MAKE_OPTS = import_executables
> > package/zeek/zeek.mk:HOST_ZEEK_MAKE_OPTS = binpac bifcl
> 
> Only "musepack" seems to overwrite MAKE to enforce -j1, so replace it:
> 
>     $ grep '_MAKE =' $(grep -rl "cmake-package" package/*/*.mk)
> 
> > package/musepack/musepack.mk:MUSEPACK_MAKE = $(MAKE1)
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
> v2: made generator use more generic, other generators can now easily be added if required
> ---
>  package/musepack/musepack.mk   |  2 +-
>  package/netopeer2/netopeer2.mk |  2 +-
>  package/pkg-cmake.mk           | 26 ++++++++++++++------------
>  package/racehound/racehound.mk |  2 +-
>  4 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
> index fc66c684a5..d4dd08df36 100644
> --- a/package/musepack/musepack.mk
> +++ b/package/musepack/musepack.mk
> @@ -9,7 +9,7 @@ MUSEPACK_SITE = http://files.musepack.net/source
>  MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
>  MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
>  MUSEPACK_INSTALL_STAGING = YES
> -MUSEPACK_MAKE = $(MAKE1)
> +MUSEPACK_BUILD_OPTS = -j1
>  MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
>  MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
>  
> diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
> index 47fcd31acd..2ebb23eccd 100644
> --- a/package/netopeer2/netopeer2.mk
> +++ b/package/netopeer2/netopeer2.mk
> @@ -24,7 +24,7 @@ NETOPEER2_CONF_OPTS = \
>  # affected mutualy.
>  NETOPEER2_SYSREPO_SHM_PREFIX = sr_buildroot$(subst /,_,$(CONFIG_DIR))_netopeer2
>  
> -NETOPEER2_MAKE_ENV = \
> +NETOPEER2_BUILD_ENV = \
>  	SYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl \
>  	SYSREPO_SHM_PREFIX=$(NETOPEER2_SYSREPO_SHM_PREFIX)
>  
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 8c375779cb..205a93db5f 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -51,11 +51,6 @@ endif
>  
>  define inner-cmake-package
>  
> -$(2)_MAKE			?= $$(MAKE)
> -$(2)_INSTALL_OPTS		?= install
> -$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
> -$(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
> -
>  $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>  
>  
> @@ -65,6 +60,13 @@ else
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
> @@ -88,7 +90,7 @@ define $(2)_CONFIGURE_CMDS
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> @@ -119,7 +121,7 @@ define $(2)_CONFIGURE_CMDS
>  	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>  	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> @@ -166,11 +168,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$(BUILD_OPTS) $$($$(PKG)_BUILD_OPTS)

Where is $$(BUILD_OPTS) set?  As far as I can see this is not needed.

>  endef
>  else
>  define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$(BUILD_OPTS) $$($$(PKG)_BUILD_OPTS)
>  endef
>  endif
>  endif
> @@ -181,7 +183,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
>  endef
>  endif
>  
> @@ -191,7 +193,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
>  endef
>  endif
>  
> @@ -201,7 +203,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
>  endef
>  endif
>  
> diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
> index 6499e166d8..f63bb233f6 100644
> --- a/package/racehound/racehound.mk
> +++ b/package/racehound/racehound.mk
> @@ -22,6 +22,6 @@ RACEHOUND_CONF_OPTS += \
>  	-DKBUILD_VERSION_STRING=$(LINUX_VERSION_PROBED)
>  
>  # cross compile environment for linux kernel module
> -RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)
> +RACEHOUND_BUILD_ENV = $(LINUX_MAKE_FLAGS)
>  
>  $(eval $(cmake-package))
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
