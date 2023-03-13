Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3C6C74A4B
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 18:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA39B60E83;
	Mon, 13 Mar 2023 18:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA39B60E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sR-xhAwu6fc; Mon, 13 Mar 2023 18:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC2D60EFD;
	Mon, 13 Mar 2023 18:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC2D60EFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1371BF365
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8667260EFD
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8667260EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67-ijco2I70B for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 18:48:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BCF760E83
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BCF760E83
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 18:48:21 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pbnDW-0006Ma-3g;
 Mon, 13 Mar 2023 18:48:18 +0000
Date: Mon, 13 Mar 2023 18:48:16 +0000
From: John Keeping <john@metanate.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZA9v8FEY+3KI9m4G@donbot>
References: <CACXRmJjeRm3+zZTkOLoZ4NPu7bgi_udWmc=KBLD2KcTRQiHOhw@mail.gmail.com>
 <20230313065516.2023267-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313065516.2023267-1-thomas.devoogdt@barco.com>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=Q/H1HRSqzq5lV4nn6tq2yvg5w8B0uzx9FS9BIposyrQ=; b=SbgLH
 4EoyNgmYeuAmjSZHOwX3Lne4bXa1b7tTINOlJe4pOhe2KvOaarxU2r8YVSM9aNmg/S4QiXZydQXdr
 yf8yDJNIKsbpNeeQ49pr5EG8G09TrGwXjWMuXPqkNbi+wTEZXGjxku4QTWVX5m6koEhX4uXyhoSRm
 NGhaVomDDr+QfEV0wojoWhXW76HB7pYY+ZoVzZrmz5ihMuDM1ZOOqDRgxA5Sg5rEzQHscDukjt4+z
 uCzHqbHBXV3i/EYMNQbvpRQ5Po5Cew83/S0aiUAc6fddNO+TEU4L9KNja9lLtmOPR5/Gs3rL7IysK
 0jtUIQd+juylVvXpKmMsoEEL3ENoQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=SbgLH4Eo
Subject: Re: [Buildroot] [PATCH v4 1/3] pkg-cmake: add option to select the
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

On Mon, Mar 13, 2023 at 07:55:14AM +0100, Thomas Devoogdt wrote:
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
> The _MAKE_{ENV,OPTS} are copied to _BUILD_{ENV,OPTS}, usage:
> 
>     $ grep '_MAKE_ENV =' $(grep -rl "cmake-package" package/*/*.mk)
> 
> > package/netopeer2/netopeer2.mk:NETOPEER2_MAKE_ENV = \
> > package/racehound/racehound.mk:RACEHOUND_MAKE_ENV = $(LINUX_MAKE_FLAGS)
> 
>     $ grep '_MAKE_OPTS =' $(grep -rl "cmake-package" package/*/*.mk)
> 
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

Reviewed-by: John Keeping <john@metanate.com>

(minor nit: the commit message seems to be out-of-date in mentioning
MAKE_ENV and MAKE_OPTS for packages which are no longer updated here)

> ---
> v2:
>  - made generator use more generic, other generators can now easily be added if required
> v3:
>  - add _GENERATOR_PROGRAM
>  - add _GENERATOR_PARALLEL for make
>  - dropped BUILD_OPTS
>  - fix gdal.mk
> v4:
>  - restored _MAKE_ENV/_MAKE_OPTS for the Unix Makefiles case
>  - always set -j$(PARALLEL_JOBS)
> ---
>  package/musepack/musepack.mk |  2 +-
>  package/pkg-cmake.mk         | 35 +++++++++++++++++++++++------------
>  2 files changed, 24 insertions(+), 13 deletions(-)
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
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 8c375779cb..36ab88d3a1 100644
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
> @@ -65,6 +60,20 @@ else
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
>  endif
>  
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +$(2)_DEPENDENCIES	+= host-ninja
> +$(2)_GENERATOR		= "Ninja"
> +$(2)_GENERATOR_PROGRAM	= $(HOST_DIR)/bin/ninja
> +else
> +$(2)_GENERATOR		= "Unix Makefiles"
> +$(2)_GENERATOR_PROGRAM	= $(firstword $(BR2_MAKE))
> +
> +# Generator specific code (make) should be avoided,
> +# but for now, copy them to the new variables.
> +$(2)_BUILD_ENV		?= $$($(2)_MAKE_ENV)
> +$(2)_BUILD_OPTS		?= -- $$($(2)_MAKE_OPTS)
> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -88,7 +97,8 @@ define $(2)_CONFIGURE_CMDS
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
> +		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> @@ -119,7 +129,8 @@ define $(2)_CONFIGURE_CMDS
>  	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>  	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
> +		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> @@ -166,11 +177,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
>  endef
>  else
>  define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)
>  endef
>  endif
>  endif
> @@ -181,7 +192,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
>  endef
>  endif
>  
> @@ -191,7 +202,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
>  endef
>  endif
>  
> @@ -201,7 +212,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(TARGET_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_TARGET_OPTS)
>  endef
>  endif
>  
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
