Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 18:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6558C833AF;
	Mon, 11 Apr 2022 18:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yg3mMx0le1xw; Mon, 11 Apr 2022 18:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3151083386;
	Mon, 11 Apr 2022 18:11:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAC8F1BF372
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 18:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B816B83386
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 18:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUMGmAxAzjWD for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 18:11:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id C76A98331B
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 18:11:10 +0000 (UTC)
Received: from pwmachine.localnet (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id E20C1209DDA1;
 Mon, 11 Apr 2022 11:11:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E20C1209DDA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649700670;
 bh=pHXYI8gdcAPRvnRo5jJ+PtUnnEDorNrmsMNqouFii1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pXlKma57OL1rOyJey+3dzb476Ng0DEh9rFUkhyTiU0x9DPWGigzwWl9r6OFp1fYu0
 ygq5nFJ3LsNePXzs6CyJxiPK4wJ0KlE0wyzQXWAnQoV0mcVycY3eYoSESoiJP4Zxhh
 7xHF2TUTa5wzh1UVejhUMhez0GpYmOqIosPgwDJQ=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Apr 2022 19:11:05 +0100
Message-ID: <4729294.31r3eYUQgx@pwmachine>
Organization: Microsoft
In-Reply-To: <2b54dc64-98da-5de3-e94e-0fb7bbaaca8b@mind.be>
References: <20220407182425.194001-1-flaniel@linux.microsoft.com>
 <20220407182425.194001-3-flaniel@linux.microsoft.com>
 <2b54dc64-98da-5de3-e94e-0fb7bbaaca8b@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v1 2/2] package/sysdig: bump version to
 0.27.1.
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le samedi 9 avril 2022, 15:40:20 BST Arnout Vandecappelle a =E9crit :
>   Hi Francis,

Hi.

> On 07/04/2022 20:24, Francis Laniel wrote:
> > 0.23.1 has compilation errors with recent kernels.
> > =

> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

>   I've applied to master, with a number of changes.

Thank you for it.

>   I've noticed that it doesn't build on e.g. aarch64, because it uses
> syscalls like open(2) that simply don't exist on aarch64. Fixing that wou=
ld
> be quite a big undertaking, and upstream has simply removed the
> syscall-handling code. So a better solution would be to update to 0.29.1.
> However, *that* is a fairly big change again because they also got rid of
> the kernel driver. It's easy enough to remove the kernel-module part on t=
he
> buildroot side, but I wouldn't know if it still behaves correctly at
> runtime. So, Francis, would you care to look into updating to 0.29.1?

I will try to update sysdig to this version but I sadly cannot give any dat=
e =

of delivery.
Indeed, I am bit worried is that after 0.27.1 sysdig depends of falco/libs =
and =

I do not really know how to handle this.

>   If you do that, please also check if it requires a minimum kernel versi=
on.
> I think it uses all kinds of tracepoint or other kernel features which may
> not exist in older kernels. If it does have a minimum kernel version,
> please add a BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y dependency (with
> explanation in the commit message how you got to that conclusion).
> =

>   Also, I added you to DEVELOPERS for this package. It won't have much
> effect other than being Cc'ed on patches, because sysdig isn't built in t=
he
> autobuilders (since it depends on a kernel to be built and we don't do th=
at
> in autobuilders).
> =

> > ---
> > =

> >   ...ATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 +++++++++++++++++++
> >   ...gainst-libabseil-cpp-which-grpc-uses.patch | 45 ++++++++++
> >   package/sysdig/Config.in                      |  5 ++
> >   package/sysdig/sysdig.hash                    |  1 +
> >   package/sysdig/sysdig.mk                      |  7 +-
> >   5 files changed, 139 insertions(+), 1 deletion(-)
> >   create mode 100644
> >   package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and=
-f
> >   u.patch create mode 100644
> >   package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch> =

> > diff --git
> > a/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and=
-f
> > u.patch
> > b/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and=
-f
> > u.patch new file mode 100644
> > index 0000000000..7873210281
> > --- /dev/null
> > +++
> > b/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and=
-f
> > u.patch @@ -0,0 +1,82 @@
> > +From cc8bccc3ebb90103900a7f0f2b085ddb723b8792 Mon Sep 17 00:00:00 2001
> > +From: Francis Laniel <flaniel@linux.microsoft.com>
> > +Date: Wed, 6 Apr 2022 16:54:37 +0100
> > +Subject: [PATCH] libsinsp: Apply PATCH_COMMAND to fix lua types and
> > function. +
> > +Buildroot luajit 5.1 seems to not have compatibility between luaL_reg =
and
> > +luaL_Reg.
> > +So, we apply sysdig CMakeLists.txt PATCH_COMMAND to fix this and lua
> > function +call as well.
> > +Note that, this PATCH_COMMAND was added in sysdig in:
> > +a064440394c9 ("Adding power support to Travis builds (#1566)")
> > +
> > +This patch is also present in kubernetes/minikube in:
> > +f036c279bc59 ("Add patch for compiling sysdig with system luajit")
> > +
> > +Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

>   Would it be possible to send this patch upstream, so we don't need to
> maintain it going forward? Obviously, it's best to first bump to the late=
st
> version (and check if the patch is still needed).
> =

> [snip]
> =

> > diff --git
> > a/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
> > b/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
> > new file mode 100644
> > index 0000000000..60c3d31a3e
> > --- /dev/null
> > +++ b/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.pa=
tch
> > @@ -0,0 +1,45 @@
> > +From a7fb3b863c3574470c45fdf6084dcc40931ca017 Mon Sep 17 00:00:00 2001
> > +From: Francis Laniel <flaniel@linux.microsoft.com>
> > +Date: Thu, 7 Apr 2022 18:30:23 +0100
> > +Subject: [PATCH 2/2] Link against libabseil-cpp which grpc uses.
> =

>   Don't include the 2/2 part (use git format-patch -N). check-package
> reports this.
> > +
> > +This patch was taken from:
> > +55c96b61f7b9 ("sysdig: make extra linking against abseil conditional")
> > +from hhoffstaette/portage.
> =

>   I've changed this to include the full URL of where you've taken it from=
. I
> should have done that for th other patch as well, but I forgot.
> =

>   Also please send this patch upstream.

For the luajit and abseil patch, I will first check if 0.29.1 still needs t=
hem.
If so, I will for sure send these patches upstream!

> > +
> > +Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> > +---
> > + CMakeLists.txt                    | 1 +
> > + userspace/libsinsp/CMakeLists.txt | 4 ++++
> > + 2 files changed, 5 insertions(+)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 1f34f1d6..c0354b29 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -552,6 +552,7 @@ if(NOT WIN32 AND NOT APPLE)
> > + 			else()
> > + 				message(FATAL_ERROR "Couldn't find system grpc")
> > + 			endif()
> > ++			find_library(ABSL_SYNC_LIB NAMES absl_synchronization)
> > + 			find_program(GRPC_CPP_PLUGIN grpc_cpp_plugin)
> > + 			if(NOT GRPC_CPP_PLUGIN)
> > + 				message(FATAL_ERROR "System grpc_cpp_plugin not =

found")
> > +diff --git a/userspace/libsinsp/CMakeLists.txt
> > b/userspace/libsinsp/CMakeLists.txt +index d72f9115..d1b7ea02 100644
> > +--- a/userspace/libsinsp/CMakeLists.txt
> > ++++ b/userspace/libsinsp/CMakeLists.txt
> > +@@ -214,6 +214,10 @@ if(NOT WIN32)
> > + 				"${JQ_LIB}"
> > + 				"${B64_LIB}")
> > +
> > ++			if(ABSL_SYNC_LIB)
> > ++				target_link_libraries(sinsp "${ABSL_SYNC_LIB}")
> > ++			endif()
> > ++
> > + 			if(NOT MUSL_OPTIMIZED_BUILD)
> > + 			target_link_libraries(sinsp
> > + 				rt
> > +--
> > +2.25.1
> > +
> > diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> > index 06d20c7f7b..5a7fbb50e0 100644
> > --- a/package/sysdig/Config.in
> > +++ b/package/sysdig/Config.in
> > @@ -8,13 +8,18 @@ config BR2_PACKAGE_SYSDIG
> > =

> >   	depends on BR2_USE_WCHAR # elfutils
> >   	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC #
> >   	elfutils
> >   	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> > =

> > +	select BR2_PACKAGE_C_ARES
> > =

> >   	select BR2_PACKAGE_ELFUTILS
> > =

> > +	select BR2_PACKAGE_GRPC
> =

>   You also need to propagate the dependencies of grpc. For grpc, that's j=
ust
> a matter of adding grpc to the comments above, but some other packages ha=
ve
> stricter dependencies.
> =

> > +	select BR2_PACKAGE_GTEST
> =

>   gtest is only required if tests are enabled, so I added the conf opt to
> disable tests instead.
> =

> >   	select BR2_PACKAGE_JQ
> >   	select BR2_PACKAGE_JSONCPP
> >   	select BR2_PACKAGE_LIBB64
> >   	select BR2_PACKAGE_LIBCURL
> >   	select BR2_PACKAGE_NCURSES
> >   	select BR2_PACKAGE_OPENSSL
> > =

> > +	select BR2_PACKAGE_PROTOBUF
> > +	select BR2_PACKAGE_TBB
> > =

> >   	select BR2_PACKAGE_ZLIB
> >   	help
> >   	=

> >   	  Sysdig is open source, system-level exploration:
> > diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
> > index 565b1e9828..4bce674f3e 100644
> > --- a/package/sysdig/sysdig.hash
> > +++ b/package/sysdig/sysdig.hash
> > @@ -1,3 +1,4 @@
> > =

> >   # sha256 locally computed
> > =

> > +sha256  b9d05854493d245a7a7e75f77fc654508f720aab5e5e8a3a932bd8eb54e49b=
da =

> > sysdig-0.27.1.tar.gz> =

> >   sha256  57d5b713b875eba35546a1408bf3f20c2703904a17d956be115ee55272db4=
cfa
> >    sysdig-0.23.1.tar.gz sha256 =

> >   8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 =

> >   COPYING
>   The COPYING file has changed, as shown by 'make legal-info'. Turns out
> that the license changed to Apache-2.0, except for the driver which is
> GPLv2 or MIT. So I updated the license hash and added the new license
> files.
> =

> > diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> > index 08d93750ae..d497c7c381 100644
> > --- a/package/sysdig/sysdig.mk
> > +++ b/package/sysdig/sysdig.mk
> > @@ -4,7 +4,7 @@
> > =

> >   #
> >   #####################################################################=
###
> >   ########> =

> > -SYSDIG_VERSION =3D 0.23.1
> > +SYSDIG_VERSION =3D 0.27.1
> > =

> >   SYSDIG_SITE =3D $(call github,draios,sysdig,$(SYSDIG_VERSION))
> >   SYSDIG_LICENSE =3D GPL-2.0
> >   SYSDIG_LICENSE_FILES =3D COPYING
> =

>   This needed to be updated as well for the license change, of course.
> =

>   Regards,
>   Arnout
> =

> > @@ -13,7 +13,10 @@ SYSDIG_CONF_OPTS =3D -DENABLE_DKMS=3DOFF
> > -DUSE_BUNDLED_DEPS=3DOFF> =

> >   SYSDIG_SUPPORTS_IN_SOURCE_BUILD =3D NO
> >   =

> >   SYSDIG_DEPENDENCIES =3D \
> > =

> > +	c-ares \
> > =

> >   	elfutils \
> > =

> > +	gtest \
> > +	grpc \
> > =

> >   	jq \
> >   	jsoncpp \
> >   	libb64 \
> > =

> > @@ -21,6 +24,8 @@ SYSDIG_DEPENDENCIES =3D \
> > =

> >   	luainterpreter \
> >   	ncurses \
> >   	openssl \
> > =

> > +	protobuf \
> > +	tbb \
> > =

> >   	zlib
> >   =

> >   # sysdig creates the module Makefile from a template, which contains a




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
