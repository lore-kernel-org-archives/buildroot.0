Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4D2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25D9940ADC;
	Tue,  3 May 2022 14:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRpaSuDcqtF8; Tue,  3 May 2022 14:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E82B340AD6;
	Tue,  3 May 2022 14:15:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EDE01BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7D440AD6
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbUMcTz0eBVD for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:15:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EC12402D0
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:15:20 +0000 (UTC)
Received: from pwmachine.localnet (154.pool92-186-13.dynamic.orange.es
 [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9480A20EAB91;
 Tue,  3 May 2022 07:15:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9480A20EAB91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651587318;
 bh=MOI3P4yuDNDd7dlpEoXD+ugSUlk9GmtUs4EO9brr1yI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ej0XEG9ACpvdU5EmvyZh05GBmBEl8k7L0cDiTi+PFhMzqG311AEZgXBH61MbjzON6
 u2Q1YhkSggEUFaJAE3JCv4NoodL8Bd5SxAPz2lbbTAy/oe6ej/3GspA/Y5PrUmhX3G
 4kheYGvh9pK6zsfk2Eq4JQJaKZtBucU4E1XEKq34=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 May 2022 15:15:13 +0100
Message-ID: <2627901.mvXUDI8C0e@pwmachine>
Organization: Microsoft
In-Reply-To: <e15d95db-043a-aa7f-baee-78ade04669f2@mind.be>
References: <20220425164319.24788-1-flaniel@linux.microsoft.com>
 <20220425164319.24788-3-flaniel@linux.microsoft.com>
 <e15d95db-043a-aa7f-baee-78ade04669f2@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v4 2/2] package/sysdig: bump to 0.29.1
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
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

Le samedi 30 avril 2022, 19:07:41 BST Arnout Vandecappelle a =E9crit :
> On 25/04/2022 18:43, Francis Laniel wrote:
> > sysdig 0.27.1 cannot be cross-compiled to, e.g., aarch64 because it uses
> > open() syscall [1].
> > This patch bumps its version to enable cross-compilation.
> > =

> > By doing so, we can remove the previous patches.
> > But this commit introduces new patches.
> > Indeed, libsinsp (lib system inspection), libscap (lib system capture) =
and
> > the kernel module were moved to falcosecurity/libs.
> > Sadly, it is not possible to compile sysdig with pre-compiled libs (like
> > we do in buildroot).
> > So, this contribution introduces a new patch to build sysdig with alrea=
dy
> > built falcosecurity/libs.
> > =

> > [1] https://marc.info/?l=3Dbuildroot&m=3D164951521629400
> > =

> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

> [snip]
> =

> > diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> > index c124054105..392d858ac6 100644
> > --- a/package/sysdig/Config.in
> > +++ b/package/sysdig/Config.in
> > @@ -2,25 +2,17 @@ config BR2_PACKAGE_SYSDIG
> > =

> >   	bool "sysdig"
> >   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> >   	depends on BR2_LINUX_KERNEL
> > =

> > -	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
> > +	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb, yaml-cpp
> > =

> >   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
> >   	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq, protobuf, tbb
> =

>   This is now an indirect dependency. We normally show that as
> ... # falcosecurity-libs -> elfutils, jq, protobuf, tbb
> but that would get really long, so I changed all of them to just mention
> falcosecurity-libs.
> =

> >   	depends on !BR2_STATIC_LIBS # elfutils, protobuf, tbb
> >   	depends on BR2_USE_WCHAR # elfutils
> =

>   This one is not present in falcosecurity-libs (anyway implied by glibc),
> so I removed it.
> =

> >   	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils
> >   	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> > =

> > -	select BR2_PACKAGE_C_ARES
> > -	select BR2_PACKAGE_ELFUTILS
> > -	select BR2_PACKAGE_GRPC
> > -	select BR2_PACKAGE_JQ
> > -	select BR2_PACKAGE_JSONCPP
> > -	select BR2_PACKAGE_LIBB64
> > -	select BR2_PACKAGE_LIBCURL
> > +	select BR2_PACKAGE_FALCOSECURITY_LIBS
> > =

> >   	select BR2_PACKAGE_NCURSES
> > =

> > -	select BR2_PACKAGE_OPENSSL
> > -	select BR2_PACKAGE_PROTOBUF
> > -	select BR2_PACKAGE_TBB
> > -	select BR2_PACKAGE_ZLIB
> > +	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
> > +	select BR2_PACKAGE_YAML_CPP
> > =

> >   	help
> >   	=

> >   	  Sysdig is open source, system-level exploration:
> >   	  capture system state and activity from a running Linux
> > =

> > @@ -36,4 +28,4 @@ comment "sysdig needs a glibc toolchain w/ C++, threa=
ds,
> > gcc >=3D 4.8, dynamic lib> =

> >   		|| !BR2_TOOLCHAIN_HAS_THREADS \
> >   		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
> >   		|| !BR2_TOOLCHAIN_USES_GLIBC \
> > =

> > -	    || !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> > +		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> > diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
> > index 4ec46abfc3..380c9dce1e 100644
> > --- a/package/sysdig/sysdig.hash
> > +++ b/package/sysdig/sysdig.hash
> > @@ -1,5 +1,3 @@
> > =

> >   # sha256 locally computed
> > =

> > -sha256  b9d05854493d245a7a7e75f77fc654508f720aab5e5e8a3a932bd8eb54e49b=
da =

> > sysdig-0.27.1.tar.gz +sha256 =

> > 3721c97f0da43c1a68d2962d30363525d8532ab5f2534dfefc86d175e17e423e =

> > sysdig-0.29.1.tar.gz> =

> >   sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2=
702
> >    COPYING> =

> > -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b8806=
43 =

> > driver/GPL2.txt -sha256 =

> > e3f6a43d097ed68176e9738de925d98b938e1bccf6d6bd1bcd79395eca8f76ed =

> > driver/MIT.txt diff --git a/package/sysdig/sysdig.mk
> > b/package/sysdig/sysdig.mk
> > index 9a9aaa35c3..3ce5d0bb79 100644
> > --- a/package/sysdig/sysdig.mk
> > +++ b/package/sysdig/sysdig.mk
> > @@ -4,10 +4,10 @@
> > =

> >   #
> >   #####################################################################=
###
> >   ########> =

> > -SYSDIG_VERSION =3D 0.27.1
> > +SYSDIG_VERSION =3D 0.29.1
> > =

> >   SYSDIG_SITE =3D $(call github,draios,sysdig,$(SYSDIG_VERSION))
> > =

> > -SYSDIG_LICENSE =3D Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
> > -SYSDIG_LICENSE_FILES =3D COPYING driver/MIT.txt driver/GPL2.txt
> > +SYSDIG_LICENSE =3D Apache-2.0
> > +SYSDIG_LICENSE_FILE =3D COPYING
> > =

> >   SYSDIG_CPE_ID_VENDOR =3D sysdig
> >   SYSDIG_CONF_OPTS =3D \
> >   =

> >   	-DENABLE_DKMS=3DOFF \
> > =

> > @@ -16,39 +16,26 @@ SYSDIG_CONF_OPTS =3D \
> > =

> >   SYSDIG_SUPPORTS_IN_SOURCE_BUILD =3D NO
> >   =

> >   SYSDIG_DEPENDENCIES =3D \
> > =

> > -	c-ares \
> > -	elfutils \
> > -	grpc \
> > -	jq \
> > -	jsoncpp \
> > -	libb64 \
> > -	libcurl \
> > -	luainterpreter \
> > +	falcosecurity-libs \
> > =

> >   	ncurses \
> > =

> > -	openssl \
> > -	protobuf \
> > -	tbb \
> > -	zlib
> > +	json-for-modern-cpp \
> > +	yaml-cpp
> > =

> > -# sysdig creates the module Makefile from a template, which contains a
> > -# single place-holder, KBUILD_FLAGS, wich is only replaced with two
> > -# things:
> > -#   - debug flags, which we don't care about here,
> > -#   - 'sysdig-feature' flags, which are never set, so always empty
> > -# So, just replace the place-holder with the only meaningful value:
> > nothing. -define SYSDIG_MODULE_GEN_MAKEFILE
> > -	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
> > -	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
> > -	$(SED) 's/@PROBE_NAME@/sysdig-probe/;' $(@D)/driver/Makefile
> > -endef
> > -SYSDIG_POST_PATCH_HOOKS +=3D SYSDIG_MODULE_GEN_MAKEFILE
> > +# For sysdig to automatically loads the driver, SYSDIG_DRIVER_NAME sho=
uld
> > be +# the same than FALCOSECURITY_LIBS_DRIVER_NAME.
> > +SYSDIG_DRIVER_NAME =3D scap
> =

>   It's a bit silly to have this huge comment and then define a variable t=
hat
> is used only once. So I removed all that and directly used
> FALCOSECURITY_LIBS_DRIVER_NAME below.
> =

>   Applied to master, thanks.

Thank you for it!
I actually did a small mistake when sending this patch...
I will send a new series which corrects the problem and bump to 0.29.2 befo=
re =

end of the day!

>   Regards,
>   Arnout
> =

> > -# Don't build the driver as part of the 'standard' procedure, we'll
> > -# build it on our own with the kernel-module infra.
> > -SYSDIG_CONF_OPTS +=3D -DBUILD_DRIVER=3DOFF
> > -
> > -SYSDIG_MODULE_SUBDIRS =3D driver
> > -SYSDIG_MODULE_MAKE_OPTS =3D KERNELDIR=3D$(LINUX_DIR)
> > +# Don't build the driver as part of the 'standard' procedure, it has b=
een
> > built +# by falcosecurity-libs.mk.
> > +# grpc_cpp_plugin is needed to build falcosecurity libs, so we give the
> > host +# one there.
> > +SYSDIG_CONF_OPTS +=3D
> > -DFALCOSECURITY_LIBS_SOURCE_DIR=3D$(FALCOSECURITY_LIBS_SRCDIR) \
> > +	-DBUILD_DRIVER=3DOFF \
> > +	-DGRPC_CPP_PLUGIN=3D$(HOST_DIR)/bin/grpc_cpp_plugin \
> > +	-DDRIVER_NAME=3D$(SYSDIG_DRIVER_NAME) \
> > +	-DENABLE_DKMS=3DOFF \
> > +	-DUSE_BUNDLED_DEPS=3DOFF \
> > +	-DWITH_CHISEL=3DON \
> > +	-DVALIJSON_INCLUDE=3D$(BUILD_DIR)/valijson-0.6/include/valijson
> > =

> > -$(eval $(kernel-module))
> > =

> >   $(eval $(cmake-package))




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
