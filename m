Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655C4C77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B95242BAD;
	Tue,  9 May 2023 21:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B95242BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZltaJV1Jlcq5; Tue,  9 May 2023 21:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A8242B83;
	Tue,  9 May 2023 21:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09A8242B83
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AADCA1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8319360F42
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8319360F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiuzKGmU0wxl for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 21:03:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AAE960AFC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AAE960AFC
 for <buildroot@buildroot.org>; Tue,  9 May 2023 21:03:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3a04:4e20:1cde:35ad])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 16B8C2003AE;
 Tue,  9 May 2023 23:02:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 23:02:56 +0200
Date: Tue, 9 May 2023 23:02:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230509210256.GF252090@scaer>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-6-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425171454.48802-6-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683666184;
 bh=2oxJmRhKUW/vqRudjdhqMm4hQGd/gtZD51yUZlVSpXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LPqdUvcThfXb5XmerOItDLJXYkeLd9ZyJgnoQ5Gr03A76f9x8FaenN41FKHJCDac0
 EjRQdJI56sje0IDwS/Aq09KIirbnfrg4US7dmCI/RLO8637/3RIXxU9lkVJIRbmsoJ
 qlU2bxTiPUwWa5vUEIhg1zr4Jt+d1HG/cYq1H9mYFhtPlHWkD7mBOnM4NbnfLGjp6v
 V9UBwBM3+R5yYA++mGPJOd0j1W1zsEHHWi5NetszmaoKElNWjgywDt+MNOymZ/imjQ
 KeXOnANPt1M/tKYJBjLkVZ8UXsE+4hP1xc6a38REeUsdUvq5U3ztwY1RxGx+Aim2Q9
 Kd5SDI+eTWE6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LPqdUvcT
Subject: Re: [Buildroot] [PATCH v2 05/13] package/libselinux: bump to
 version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-04-25 10:14 -0700, Adam Duskett spake thusly:
> - libselinux now requires pip to install the python tools.

I extended that to explain that is really is just about the
installation, while the build is still performed with setuptools.

Also, that python bindings, not python tools; python tools have their
own dedicated pachage.selinux-python (which you update in a follow-up
patch).

> - Rebase patches for version 3.5

I also backported an upstream patch to fix intsallation of the python
bindings.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libselinux/0001-fix-musl-build.patch     |  4 ++--
>  ...CEXT-and-rely-on-the-installed-file-nam.patch |  8 ++++----
>  package/libselinux/Config.in                     |  1 +
>  package/libselinux/libselinux.hash               |  2 +-
>  package/libselinux/libselinux.mk                 | 16 +++++++++++++---
>  5 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/package/libselinux/0001-fix-musl-build.patch b/package/libselinux/0001-fix-musl-build.patch
> index 44189e6400..b8b16be26f 100644
> --- a/package/libselinux/0001-fix-musl-build.patch
> +++ b/package/libselinux/0001-fix-musl-build.patch
> @@ -12,13 +12,13 @@ Domain, and we want to avoid license propagation, so this macro is
>  completely written from scratch, and non-optimal.
>  
>  Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -[Updated for 3.0]
> +[Updated for 3.5]
>  Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>  diff --git a/src/booleans.c b/src/booleans.c
>  index ffa8d26..8569002 100644
>  --- a/src/booleans.c
>  +++ b/src/booleans.c
> -@@ -65,6 +65,14 @@ int security_get_boolean_names(char ***names, int *len)
> +@@ -64,6 +64,14 @@ int security_get_boolean_names(char ***names, int *len)
>   		goto bad;
>   	}
>   
> diff --git a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> index 18c79b3b4d..c744ca4069 100644
> --- a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> +++ b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> @@ -18,7 +18,7 @@ was installed.
>  Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
>  [Refreshed for 3.1]
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -[Refreshed for 3.0]
> +[Refreshed for 3.5]
>  Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>  ---
>   src/Makefile | 3 +--
> @@ -31,14 +31,14 @@ index 190016e2af34..7ee22fd35da3 100644
>  @@ -15,7 +15,6 @@ INCLUDEDIR ?= $(PREFIX)/include
>   PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
>   PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
> - PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(plat_specific=1, prefix='$(PREFIX)'))")
> + PYTHONLIBDIR ?= $(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_path('platlib', vars={'platbase': '$(PREFIX)', 'base': '$(PREFIX)'}))")
>  -PYCEXT ?= $(shell $(PYTHON) -c 'import importlib.machinery;print(importlib.machinery.EXTENSION_SUFFIXES[0])')
>   RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
>   RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
>   RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
> -@@ -184,7 +183,7 @@ install: all
> +@@ -189,7 +188,7 @@ install: all
>   install-pywrap: pywrap
> - 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)` $(PYTHON_SETUP_ARGS)
> + 	$(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
>   	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
>  -	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
>  +	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
> diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
> index 3098fe3ea4..bc40e32a46 100644
> --- a/package/libselinux/Config.in
> +++ b/package/libselinux/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSELINUX
>  	select BR2_PACKAGE_LIBSEPOL
>  	select BR2_PACKAGE_PCRE2
>  	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS if BR2_PACKAGE_PYTHON3
>  	help
>  	  libselinux is the runtime SELinux library that provides
>  	  interfaces (e.g. library functions for the SELinux kernel
> diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
> index a2e0083f7b..14bc627a80 100644
> --- a/package/libselinux/libselinux.hash
> +++ b/package/libselinux/libselinux.hash
> @@ -1,5 +1,5 @@
>  # From: https://github.com/SELinuxProject/selinux/wiki/Releases
> -sha256  acfdee27633d2496508c28727c3d41d3748076f66d42fccde2e6b9f3463a7057  libselinux-3.3.tar.gz
> +sha256  9a3a3705ac13a2ccca2de6d652b6356fead10f36fb33115c185c5ccdf29eec19  libselinux-3.5.tar.gz
>  
>  # Hash for license file
>  sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index db35da130f..b8de21edaa 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBSELINUX_VERSION = 3.3
> +LIBSELINUX_VERSION = 3.5
>  LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
>  LIBSELINUX_LICENSE = Public Domain
>  LIBSELINUX_LICENSE_FILES = LICENSE
> @@ -31,7 +31,11 @@ LIBSELINUX_MAKE_OPTS += FTS_LDLIBS=-lfts
>  endif
>  
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -LIBSELINUX_DEPENDENCIES += python3 host-swig
> +LIBSELINUX_DEPENDENCIES += \
> +	python3 \
> +	python-setuptools \
> +	host-python-pip \
> +	host-swig
>  
>  LIBSELINUX_MAKE_OPTS += \
>  	$(PKG_PYTHON_DISTUTILS_ENV) \
> @@ -77,7 +81,13 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
>  endef
>  
>  HOST_LIBSELINUX_DEPENDENCIES = \
> -	host-pkgconf host-libsepol host-pcre2 host-swig host-python3
> +	host-pkgconf \
> +	host-libsepol \
> +	host-pcre2 \
> +	host-swig \
> +	host-python3 \
> +	host-python-pip \
> +	host-python-setuptools
>  
>  HOST_LIBSELINUX_MAKE_OPTS = \
>  	$(HOST_CONFIGURE_OPTS) \
> -- 
> 2.40.0
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
