Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 18:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 565FE60E21;
	Mon, 11 Apr 2022 18:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72ZiBPF-xXc2; Mon, 11 Apr 2022 18:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 198CA60B4B;
	Mon, 11 Apr 2022 18:07:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE0491BF372
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD3F683126
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 18:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6jXB2bltC_n for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 18:06:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731E9830C2
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 18:06:58 +0000 (UTC)
Received: from pwmachine.localnet (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2C160205657E;
 Mon, 11 Apr 2022 11:06:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C160205657E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649700417;
 bh=mnw9Tffz//BfH3J7+rWHwcg/zuEWZUoSiz85L1y9aUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OHYwqrAWnm/OlfSlZrsgZOtFMwKEDmTQuVmuMQ7B6iEY2+QCujN6bcSRTZnn6REe3
 DixVPOK4oEjzvFTCF30yAi24iRX4f6ZvhIvjhHc6UlRX0p06FZXB0i+x+MsKjzM62g
 8y6uv2vw/kxyqKTAhcGpGapYqWuOYp3BN6gLHTa0=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Apr 2022 19:06:52 +0100
Message-ID: <2625093.mvXUDI8C0e@pwmachine>
Organization: Microsoft
In-Reply-To: <fc1b7c76-80b2-51a5-d0f5-7afaf05a9a0a@mind.be>
References: <20220407182425.194001-1-flaniel@linux.microsoft.com>
 <20220407182425.194001-2-flaniel@linux.microsoft.com>
 <fc1b7c76-80b2-51a5-d0f5-7afaf05a9a0a@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] tbb: new package
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 bradford barr <bradford@density.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le samedi 9 avril 2022, 14:42:59 BST Arnout Vandecappelle a =E9crit :
>   Hi Francis,

Hi

>   Thank you for this patch. I applied to master but with quite a few
> changes.

You are welcome and thank you for the modifications, they made the contribu=
tion =

better and I learnt some few tricks to make better buildroot contribution!

> On 07/04/2022 20:24, Francis Laniel wrote:
> > From: bradford barr <bradford@density.io>
> > =

> > Intel Threading Building Blocks (TBB), is a C++ library to help develop=
ers
> > write highly parallelized applications. OpenCV uses it to accelerate so=
me
> > of it's more heavy weight procedures.
> > =

> > Signed-off-by: bradford barr <bradford@density.io>
> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> > ---
> > =

> >   DEVELOPERS                                    |  1 +
> >   package/Config.in                             |  1 +
> >   .../0001-tbb-Enable-cross-compilation.patch   | 55 +++++++++++++++++++
> >   package/tbb/Config.in                         | 16 ++++++
> >   package/tbb/tbb.hash                          |  2 +
> >   package/tbb/tbb.mk                            | 39 +++++++++++++
> >   6 files changed, 114 insertions(+)
> >   create mode 100644 package/tbb/0001-tbb-Enable-cross-compilation.patch
> >   create mode 100644 package/tbb/Config.in
> >   create mode 100644 package/tbb/tbb.hash
> >   create mode 100644 package/tbb/tbb.mk
> > =

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index a66b9d7eee..ef4ddcab50 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -970,6 +970,7 @@ F:	package/odhcploc/
> > =

> >   N:	Francis Laniel <flaniel@linux.microsoft.com>
> >   F:	package/pahole/
> > =

> > +F:	package/tbb/
> > =

> >   N:	Francisco Gonzalez <gzmorell@gmail.com>
> >   F:	package/ser2net/
> > =

> > diff --git a/package/Config.in b/package/Config.in
> > index 0d5d763180..24f7af5ea8 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2044,6 +2044,7 @@ endif
> > =

> >   	source "package/skalibs/Config.in"
> >   	source "package/sphinxbase/Config.in"
> >   	source "package/startup-notification/Config.in"
> > =

> > +	source "package/tbb/Config.in"
> > =

> >   	source "package/tinycbor/Config.in"
> >   	source "package/tz/Config.in"
> >   	source "package/tzdata/Config.in"
> > =

> > diff --git a/package/tbb/0001-tbb-Enable-cross-compilation.patch
> > b/package/tbb/0001-tbb-Enable-cross-compilation.patch new file mode
> > 100644
> > index 0000000000..652d59c47b
> > --- /dev/null
> > +++ b/package/tbb/0001-tbb-Enable-cross-compilation.patch
> > @@ -0,0 +1,55 @@
> > +From 42c3faff14917f687aab405d8f571e352ffdf3f5 Mon Sep 17 00:00:00 2001
> > +From: Francis Laniel <flaniel@linux.microsoft.com>
> > +Date: Wed, 6 Apr 2022 15:58:02 +0100
> > +Subject: [PATCH] tbb: Enable cross-compilation.
> > +
> > +This patch replaces hardcoded value for CPLUS and CONLY with $(CXX) and
> > $(CC). +So, by defining CC=3D it is possible to cross compile this libr=
ary
> > using a +cross-compiler.
> > +
> > +This patch was originally written by:
> > +Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > +and taken from:
> > +https://github.com/intel/luv-yocto/blob/3b0688bc9a5e8d52b6ca461b15fb4a=
bd3
> > eaaf7a8/meta-oe/recipes-support/tbb/tbb/cross-compile.patch +
> > +Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> > +---
> > + build/linux.clang.inc | 5 +++--
> > + build/linux.gcc.inc   | 5 +++--
> > + 2 files changed, 6 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/build/linux.clang.inc b/build/linux.clang.inc
> > +index 5a459ef5..a0777db5 100644
> > +--- a/build/linux.clang.inc
> > ++++ b/build/linux.clang.inc
> > +@@ -31,8 +31,9 @@ DYLIB_KEY =3D -shared
> > + EXPORT_KEY =3D -Wl,--version-script,
> > + LIBDL =3D -ldl
> > +
> > +-CPLUS =3D clang++
> > +-CONLY =3D clang
> > ++CPLUS =3D $(CXX)
> > ++CONLY =3D $(CC)
> > ++CPLUS_FLAGS =3D $(CXXFLAGS)
> =

>   I dropped this patch. Instead, I simply passed CPLUS, CONLY and
> CPLUS_FLAGS in the $(MAKE) call.
> =

> > + LIB_LINK_FLAGS =3D $(DYLIB_KEY) -Wl,-soname=3D$(BUILDING_LIBRARY)
> > + LIBS +=3D -lpthread -lrt
> > + LINK_FLAGS =3D -Wl,-rpath-link=3D. -rdynamic
> > +diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
> > +index 786c4153..30242a82 100644
> > +--- a/build/linux.gcc.inc
> > ++++ b/build/linux.gcc.inc
> > +@@ -32,8 +32,9 @@ DYLIB_KEY =3D -shared
> > + EXPORT_KEY =3D -Wl,--version-script,
> > + LIBDL =3D -ldl
> > +
> > +-CPLUS =3D g++
> > +-CONLY =3D gcc
> > ++CPLUS =3D $(CXX)
> > ++CONLY =3D $(CC)
> > ++CPLUS_FLAGS =3D $(CXXFLAGS)
> > + LIB_LINK_FLAGS =3D $(DYLIB_KEY) -Wl,-soname=3D$(BUILDING_LIBRARY)
> > + LIBS +=3D -lpthread -lrt
> > + LINK_FLAGS =3D -Wl,-rpath-link=3D. -rdynamic
> > +--
> > +2.25.1
> > +
> > diff --git a/package/tbb/Config.in b/package/tbb/Config.in
> > new file mode 100644
> > index 0000000000..0f40b74d31
> > --- /dev/null
> > +++ b/package/tbb/Config.in
> > @@ -0,0 +1,16 @@
> > +config BR2_PACKAGE_TBB
> > +	bool "tbb"
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +	depends on !BR2_STATIC_LIBS
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS
> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	help
> > +	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
> > +	  easily write parallel C++ programs that take full advantage
> > +	  of multicore performance, that are portable, composable and
> > +	  have future-proof scalability.
> > +
> > +	  https://www.threadingbuildingblocks.org/
> > +
> > +comment "tbb needs a glibc toolchain w/ dynamic library, threads, C++"
> > +	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS ||
> > !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP diff --git
> > a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> > new file mode 100644
> > index 0000000000..e9fb7511b8
> > --- /dev/null
> > +++ b/package/tbb/tbb.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256  b8dbab5aea2b70cf07844f86fa413e549e099aa3205b6a04059ca92ead93a3=
72 =

> > tbb-2018_U5.tar.gz
>   You also need to include a hash for the license file.
> =

> > diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> > new file mode 100644
> > index 0000000000..cf06579b98
> > --- /dev/null
> > +++ b/package/tbb/tbb.mk
> > @@ -0,0 +1,39 @@
> > +######################################################################=
###
> > ####### +#
> > +# tbb
> > +#
> > +######################################################################=
###
> > ####### +
> > +TBB_VERSION =3D 2018_U5
> > +TBB_SITE =3D $(call github,01org,tbb,$(TBB_VERSION))
> > +TBB_INSTALL_STAGING =3D YES
> > +TBB_LICENSE =3D Apache-2.0
> > +TBB_LICENSE_FILES =3D LICENSE
> > +
> > +TBB_SO_VERSION =3D 2
> > +TBB_LIBS =3D libtbb libtbbmalloc libtbbmalloc_proxy
> > +TBB_BIN_PATH =3D $(@D)/build/linux_*
> > +
> > +define TBB_BUILD_CMDS
> > +	$(MAKE) $(TARGET_CONFIGURE_OPTS) arch=3D$(BR2_ARCH) -C $(@D)
> =

>   The values for arch that are used by tbb are different from the values
> that BR2_ARCH has. I studied this in more detail:
> =

> # arch is normally set based on uname -m with some conversions. However,
> # it is not really used for much:
> # - to decide between 32 or 64-bit files (based on '64' in the name)
> # - to decide on some arch-specific CFLAGS like -m32, which we don't
> actually want # - to set DO_ITT_NOTIFY if it's x86 (32 or 64 bit)
> # - to include assembler source, but it only exists for ia64
> # The only thing we actually want from the above is the 32/64-bit, and
> # DO_ITT_NOTIFY. Therefore, set arch to a fixed value which is unknown to
> # the tbb build system, and set DO_ITT_NOTIFY explicitly.
> =

>   Regards,
>   Arnout
> =

> > +endef
> > +
> > +define TBB_INSTALL_LIBS
> > +	$(foreach lib,$(TBB_LIBS),
> > +		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$
(TBB_SO_VERSION) \
> > +			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
> > +		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
> > +	)
> > +endef
> > +
> > +define TBB_INSTALL_STAGING_CMDS
> > +	mkdir -p $(STAGING_DIR)/usr/include/
> > +	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/
> > +	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
> > +endef
> > +
> > +define TBB_INSTALL_TARGET_CMDS
> > +	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
> > +endef
> > +
> > +$(eval $(generic-package))




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
