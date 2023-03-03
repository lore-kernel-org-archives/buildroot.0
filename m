Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7828CC64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 12:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B291141C9D;
	Fri,  3 Mar 2023 12:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B291141C9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3p5YGls3d9Tf; Fri,  3 Mar 2023 12:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E05941CA1;
	Fri,  3 Mar 2023 12:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E05941CA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 354B81BF239
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B98B61391
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B98B61391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmFvx6hn4Tn2 for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 12:15:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE4C161397
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE4C161397
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 12:15:49 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pY4K9-0005sF-KU;
 Fri, 03 Mar 2023 12:15:45 +0000
Date: Fri, 3 Mar 2023 12:15:39 +0000
From: John Keeping <john@metanate.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZAHk6987hSiKPc6I@donbot>
References: <Y/4etrPX5MZiUpdq@donbot>
 <20230228155528.2430203-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230228155528.2430203-1-thomas.devoogdt@barco.com>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=TYSgWEXQJKwMTRw47auPLt91SZleNBg4JReuqasrieY=; b=ViqhY
 BLKbDlnDOSFvSzXl06abxyeqpXQkx5WU80fsiL3gpJ4xWJe7A3Ahpu2gGpucDtK71eabPu+n9dVdM
 5qBlakv6mKyQ6Mk2TJ/ItTt7reVfMN+ryDqzqNAHARqJ1upxYJcHufpwVyort6pIHXZ5ZBegF9FX/
 nUPKwfsYtJbhdSXY18Gn8svb9PO0+ps1Mb8X/cQRS8JJbs7v1hIhJ6KcC2mxrhWM6pEqbnz0NyQvG
 17+TvcqlYAqUk2exQg/j/xVrWtsyyYwu+WNvNPiHynZkxKaswmDL0FfcSqer7trX37R+cOs51sL3W
 3aloj5/pccDvfnuVS18pEmZR7W6QQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=ViqhYBLK
Subject: Re: [Buildroot] [PATCH v3 1/3] pkg-cmake: add option to select the
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

On Tue, Feb 28, 2023 at 04:55:26PM +0100, Thomas Devoogdt wrote:
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
> ---
> v2:
>  - made generator use more generic, other generators can now easily be added if required
> v3:
>  - add _GENERATOR_PROGRAM
>  - add _GENERATOR_PARALLEL for make
>  - dropped BUILD_OPTS
>  - fix gdal.mk
> ---
>  package/gdal/gdal.mk           |  2 +-
>  package/musepack/musepack.mk   |  2 +-
>  package/netopeer2/netopeer2.mk |  2 +-
>  package/pkg-cmake.mk           | 31 +++++++++++++++++++------------
>  package/racehound/racehound.mk |  2 +-
>  5 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
> index a3b11c53af..d8ce623283 100644
> --- a/package/gdal/gdal.mk
> +++ b/package/gdal/gdal.mk
> @@ -19,7 +19,7 @@ GDAL_SUPPORTS_IN_SOURCE_BUILD = NO
>  # autotools in gdal. We need to force 'make' to use the Makefile,
>  # which is generated by CMake. GNUmakefile and autoconf are dropped in
>  # 3.6 so this can be dropped in future version.
> -GDAL_MAKE_OPTS += -f Makefile
> +GDAL_BUILD_OPTS += -f Makefile

Do we need "--" here before the flag?

The documentation says:

	cmake --build <dir> [<options>] [-- <build-tool-options>]

implying that this is necessary.

But is the option even needed with `cmake --build`?  I wonder if CMake
always uses the right Makefile anyway.

>  # gdal at its core only needs host-pkgconf, libgeotiff, proj and tiff
>  # but since by default mrf driver support is enabled, it also needs
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
> index 8c375779cb..5f5988beb8 100644
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
> @@ -65,6 +60,16 @@ else
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
>  endif
>  
> +ifeq ($$($(3)_CMAKE_NINJA),YES)
> +$(2)_DEPENDENCIES += host-ninja
> +$(2)_GENERATOR			= "Ninja"
> +$(2)_GENERATOR_PROGRAM	= $(HOST_DIR)/bin/ninja
> +else
> +$(2)_GENERATOR			= "Unix Makefiles"
> +$(2)_GENERATOR_PROGRAM	= $(firstword $(BR2_MAKE))
> +$(2)_GENERATOR_PARALLEL	= -j$(PARALLEL_JOBS)

Should this be passed to ninja as well?  The default may be higher than
the number of parallel jobs configured.

And for make should we use:

	$(wordlist 2,$(words $(BR2_MAKE)),$(BR2_MAKE))

?  Although that requires passing build options after "--" which breaks
the generic $(PKG)_BUILD_OPTS handling; "-j" is special in that cmake
recognises the option itself.

> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -88,7 +93,8 @@ define $(2)_CONFIGURE_CMDS
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
> +		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> @@ -119,7 +125,8 @@ define $(2)_CONFIGURE_CMDS
>  	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>  	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix Makefiles" \
> +		-G$$($$(PKG)_GENERATOR) \
> +		-DCMAKE_MAKE_PROGRAM="$$($$(PKG)_GENERATOR_PROGRAM)" \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> @@ -166,11 +173,11 @@ $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
>  ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$($$(PKG)_GENERATOR_PARALLEL) $$($$(PKG)_BUILD_OPTS)
>  endef
>  else
>  define $(2)_BUILD_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build $$($$(PKG)_BUILDDIR) $$($$(PKG)_GENERATOR_PARALLEL) $$($$(PKG)_BUILD_OPTS)
>  endef
>  endif
>  endif
> @@ -181,7 +188,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
> -	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(HOST_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_OPTS)
>  endef
>  endif
>  
> @@ -191,7 +198,7 @@ endif
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
> -	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPTS) -C $$($$(PKG)_BUILDDIR)
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) DESTDIR=$$(STAGING_DIR) $$(BR2_CMAKE) --install $$($$(PKG)_BUILDDIR) $$($$(PKG)_INSTALL_STAGING_OPTS)
>  endef
>  endif
>  
> @@ -201,7 +208,7 @@ endif
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
