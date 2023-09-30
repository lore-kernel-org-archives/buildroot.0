Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07FE7737C
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42E3F415A6;
	Sat, 30 Sep 2023 17:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E3F415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKhof87-Aacq; Sat, 30 Sep 2023 17:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E427415B5;
	Sat, 30 Sep 2023 17:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E427415B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE8DC1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8ED4415D1
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8ED4415D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-lyEJMw-Cri for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:19:48 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5485E415B5
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5485E415B5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2C3BFB00576;
 Sat, 30 Sep 2023 19:19:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 19:19:42 +0200
Date: Sat, 30 Sep 2023 19:19:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230930171942.GF2579@scaer>
References: <20230929161208.1106775-1-fontaine.fabrice@gmail.com>
 <20230929161208.1106775-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230929161208.1106775-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696094386;
 bh=JxITQvClv8mJ/639seNY8KkU8Jy4abnw9U5W/zeXAoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H7dOPsx0g2KdwyX3qLbGAUEbklFpYAxHkGXDolDdxwbHw9GTdQ0EY54F8oZeU0wcV
 8fvDy1rnejCbAIyzstl3m6DIVawSm5s9eKTXoOmzoRdojP+b95RRY0wOHGq9mnX6ec
 b1+/+0nFL9OX3Q2tCuNypdc3eg36eGoS6gDNkEqaldlqb4Qt9/yTmkYK/+VfuPDEFj
 6aogbURpzdfgRi6FKqBRi4wvY1Lcco/GscPnRcW7r1uk5fnWnOYaAt81xFLpO0dKVf
 +Mpczl1su9ESUMg1kgPPavqXtK2T/76oB16gp4vzAhHK5Ha9VdnCCh6YxNwZIorwFZ
 KhcM6W6+SN3MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H7dOPsx0
Subject: Re: [Buildroot] [PATCH 2/2] package/powertop: bump to version 2.15
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-29 18:12 +0200, Fabrice Fontaine spake thusly:
> - Switch site to get latest version
> - Replace patch by an upstreamable one
> 
> https://github.com/fenrus75/powertop/compare/v2.13...v2.15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  1 -
>  ...1-add-disable-stack-protector-option.patch | 55 +++++++++++++++++++
>  ...dont-force-stack-smashing-protection.patch | 18 ------
>  package/powertop/Config.in                    |  2 +-
>  package/powertop/powertop.hash                |  6 +-
>  package/powertop/powertop.mk                  | 16 ++++--
>  6 files changed, 70 insertions(+), 28 deletions(-)
>  create mode 100644 package/powertop/0001-add-disable-stack-protector-option.patch
>  delete mode 100644 package/powertop/0001-dont-force-stack-smashing-protection.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0c7fae9409..d6873fb5a3 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1110,7 +1110,6 @@ package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
>  package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch Upstream
>  package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch Upstream
>  package/postgresql/S50postgresql Variables
> -package/powertop/0001-dont-force-stack-smashing-protection.patch Upstream
>  package/pppd/0001-pppd-Fix-compilation-with-older-glibc-or-kernel-headers.patch Upstream
>  package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch Upstream
>  package/pptp-linux/0001-susv3-legacy.patch Upstream
> diff --git a/package/powertop/0001-add-disable-stack-protector-option.patch b/package/powertop/0001-add-disable-stack-protector-option.patch
> new file mode 100644
> index 0000000000..01a030522d
> --- /dev/null
> +++ b/package/powertop/0001-add-disable-stack-protector-option.patch
> @@ -0,0 +1,55 @@
> +From 95382246ddd889839633aa0da800a03936b93986 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 31 Oct 2021 18:26:01 +0100
> +Subject: [PATCH] add --disable-stack-protector option
> +
> +Allow the user to disable stack-protector as not all toolchains support
> +this feature
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/fenrus75/powertop/pull/138
> +---
> + configure.ac    | 4 ++++
> + src/Makefile.am | 5 ++++-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 37c1304..69160d5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -43,6 +43,10 @@ AX_ADD_FORTIFY_SOURCE
> + AX_CXX_COMPILE_STDCXX([11], [noext], [mandatory])
> + PKG_PROG_PKG_CONFIG
> + 
> ++AC_ARG_ENABLE([stack-protector],
> ++	AS_HELP_STRING([--disable-stack-protector], [Disable stack-protector]))
> ++AM_CONDITIONAL([ENABLE_STACK_PROTECTOR], [test x$enable_stack_protector != xno])
> ++
> + # Checks for libraries.
> + AX_PTHREAD([
> +     LIBS="$PTHREAD_LIBS $LIBS"
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 6b523f6..ca30d20 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -138,13 +138,16 @@ powertop_CXXFLAGS = \
> + 	-Wformat \
> + 	-Wshadow \
> + 	-fno-omit-frame-pointer \
> +-	-fstack-protector \
> + 	$(GLIB2_CFLAGS) \
> + 	$(LIBNL_CFLAGS) \
> + 	$(NCURSES_CFLAGS) \
> + 	$(PCIUTILS_CFLAGS) \
> + 	$(PTHREAD_CFLAGS)
> + 
> ++if ENABLE_STACK_PROTECTOR
> ++powertop_CXXFLAGS += \
> ++	-fstack-protector
> ++endif
> + 
> + powertop_CPPFLAGS = \
> + 	-DLOCALEDIR=\"$(localedir)\" \
> +-- 
> +2.33.0
> +
> diff --git a/package/powertop/0001-dont-force-stack-smashing-protection.patch b/package/powertop/0001-dont-force-stack-smashing-protection.patch
> deleted file mode 100644
> index 75ed2d1c24..0000000000
> --- a/package/powertop/0001-dont-force-stack-smashing-protection.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Do not pass -fstack-protector unconditionally
> -
> -Using -fstack-protector only works when the toolchain has SSP support.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: b/src/Makefile.am
> -===================================================================
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -127,7 +127,6 @@
> - 	-Wformat \
> - 	-Wshadow \
> - 	-fno-omit-frame-pointer \
> --	-fstack-protector \
> - 	$(GLIB2_CFLAGS) \
> - 	$(LIBNL_CFLAGS) \
> - 	$(NCURSES_CFLAGS) \
> diff --git a/package/powertop/Config.in b/package/powertop/Config.in
> index fd88a3d0eb..2f7ba2bb9d 100644
> --- a/package/powertop/Config.in
> +++ b/package/powertop/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_POWERTOP
>  	  A tool to diagnose issues with power consumption and power
>  	  management
>  
> -	  https://01.org/powertop/
> +	  https://github.com/fenrus75/powertop/
>  
>  comment "powertop needs a toolchain w/ C++, threads, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> diff --git a/package/powertop/powertop.hash b/package/powertop/powertop.hash
> index fc8f3cc52f..810b80a514 100644
> --- a/package/powertop/powertop.hash
> +++ b/package/powertop/powertop.hash
> @@ -1,5 +1,3 @@
> -# Locally calculated after checking pgp signature
> -# https://01.org/sites/default/files/downloads/powertop-2.13.tar.gz.asc.txt
> -# using key 22E8F306C8FA4BAA2A5F36F3A0303B060918941C
> -sha256  a65f992ca4a419bc73b623651060eb9fc00c5a86fa03556358cd9db011ef3178  powertop-2.13.tar.gz
> +# Locally calculated
> +sha256  e58ab3fd7b8ff5f4dd0d17f11848817e7d83c0a6918145ac81de03b5dccf8f49  powertop-2.15.tar.gz
>  sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
> index 681f5fda46..41403b0918 100644
> --- a/package/powertop/powertop.mk
> +++ b/package/powertop/powertop.mk
> @@ -4,16 +4,24 @@
>  #
>  ################################################################################
>  
> -POWERTOP_VERSION = 2.13
> -POWERTOP_SITE = https://01.org/sites/default/files/downloads
> -POWERTOP_DEPENDENCIES = ncurses libnl host-pkgconf \
> +POWERTOP_VERSION = 2.15
> +POWERTOP_SITE = $(call github,fenrus75,powertop,v$(POWERTOP_VERSION))
> +POWERTOP_DEPENDENCIES = host-autoconf-archive ncurses libnl host-pkgconf \
>  	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  POWERTOP_LICENSE = GPL-2.0
>  POWERTOP_LICENSE_FILES = COPYING
>  POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
> -# 0001-dont-force-stack-smashing-protection.patch
> +POWERTOP_CONF_OPTS = --disable-stack-protector
> +# 0001-add-disable-stack-protector-option.patch
>  POWERTOP_AUTORECONF = YES
> +POWERTOP_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> +
> +# fix missing config.rpath (needed for autoreconf) in the codebase
> +define POWERTOP_TOUCH_CONFIG_RPATH
> +	touch $(@D)/config.rpath
> +endef
> +POWERTOP_PRE_CONFIGURE_HOOKS += POWERTOP_TOUCH_CONFIG_RPATH
>  
>  # Help powertop at finding the right ncurses library depending on
>  # which one is available.
> -- 
> 2.40.1
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
