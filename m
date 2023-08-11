Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF148EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7899984089;
	Fri, 11 Aug 2023 15:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7899984089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLcD_lSzIzkU; Fri, 11 Aug 2023 15:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8348A8409A;
	Fri, 11 Aug 2023 15:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8348A8409A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C27551BF575
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AF2640260
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 15:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF2640260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHPG2_anxxVl for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 15:18:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96619401CD
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 15:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96619401CD
Received: from pwmachine.localnet (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1E50720FD0DE;
 Fri, 11 Aug 2023 08:18:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1E50720FD0DE
From: Francis Laniel <flaniel@linux.microsoft.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Aug 2023 17:18:05 +0200
Message-ID: <21975130.EfDdHjke4D@pwmachine>
In-Reply-To: <20230731224956.0d3d88c7@windsurf>
References: <20230428152211.20394-1-flaniel@linux.microsoft.com>
 <20230428152211.20394-3-flaniel@linux.microsoft.com>
 <20230731224956.0d3d88c7@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1691767088;
 bh=tn4dI1bgUs/aEEsRTMpRy9Zja3Q7bC2GvO/ACMOCY0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PepJokh4vo6Wq5uTzvmfCjGugsFoo6KoJ0c90ZEDM4Fe2ukn8LrjTOtd/+ScdcRnU
 XU2OrwmnkXO6mW1bu5yWrJL/5uPrEGvqt99beQZqMjh4xy/vszLeyLdeuZOuyu6CvH
 niV0dbNtWMoNLPIqgKlvDKuj0D5oA9ukm+dlYbPg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=PepJokh4
Subject: Re: [Buildroot] [RFC PATCH v1 2/2] package/falcosecurity-libs: bump
 to version 0.10.5
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le lundi 31 juillet 2023, 22:49:56 CEST Thomas Petazzoni a =E9crit :
> Hello Francis,
> =

> On Fri, 28 Apr 2023 16:22:11 +0100
> =

> Francis Laniel <flaniel@linux.microsoft.com> wrote:
> > diff --git
> > a/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
> > b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
> > new file mode 100644
> > index 0000000000..38a8bdd4f4
> > --- /dev/null
> > +++ b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.pa=
tch
> > @@ -0,0 +1,61 @@
> > +From b6d847fe8aa0513c6d19bd8187133699b9c4efd3 Mon Sep 17 00:00:00 2001
> > +From: Francis Laniel <flaniel@linux.microsoft.com>
> > +Date: Fri, 28 Apr 2023 15:14:27 +0100
> > +Subject: [PATCH] cmake: Install shared libraries.
> > +
> > +This is needed as sysdig is compiled as a non static binary which reli=
es
> > on +these libraries.
> =

> Not clear. An executable can use a mix of shared and static libraries.

Indeed, but it causes troubles without this modification (see below).
Moreover, this whole magic causes a big increase in the rootfs image, as th=
e =

limit should be increased from 60 MB to 195 MB (more than 3 times).

> What is the upstream status of this? How is falcosecurity-libs supposed
> to be used by sysdig according to upstream?

Sadly, I do not have any clue on this.
I will reach someone upstream to understand how everything is built because =

their way of building is totally incompatible with how Buildroot builds.

> All patches now need to have an "Upstream: <link>" tag that indicates
> where the patch has been submitted.

I will ensure this once I would have deal with all the issues here.

> > +diff --git a/cmake/modules/libelf.cmake b/cmake/modules/libelf.cmake
> > +index 8ca2f4f7..73d13d26 100644
> > +--- a/cmake/modules/libelf.cmake
> > ++++ b/cmake/modules/libelf.cmake
> > +@@ -10,7 +10,7 @@ if(LIBELF_INCLUDE)
> > +     add_custom_target(libelf)
> > + elseif(NOT USE_BUNDLED_LIBELF)
> > +     find_path(LIBELF_INCLUDE elf.h PATH_SUFFIXES elf)
> > +-    find_library(LIBELF_LIB NAMES libelf.a libelf.so)
> > ++    find_library(LIBELF_LIB NAMES libelf.so)
> =

> Is this really related?

We need this patch, otherwise, building sysdig fails with the following:
[ 22%] Linking C shared library libscap_engine_bpf.so
/home/francis-buildroot/buildroot/output/host/lib/gcc/x86_64-buildroot-linu=
x-
gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: /home/francis-
buildroot/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/=
../
lib64/libelf.a(elf_error.o): relocation R_X86_64_TPOFF32 against =

`global_error' can not be used when making a shared object; recompile with -
fPIC
/home/francis-buildroot/buildroot/output/host/lib/gcc/x86_64-buildroot-linu=
x-
gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: failed to set =

dynamic section sizes: bad value

> > diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash
> > b/package/falcosecurity-libs/falcosecurity-libs.hash index
> > 2e239ca2fe..ef805cbcf6 100644
> > --- a/package/falcosecurity-libs/falcosecurity-libs.hash
> > +++ b/package/falcosecurity-libs/falcosecurity-libs.hash
> > @@ -1,5 +1,5 @@
> > =

> >  # sha256 locally computed
> > =

> > -sha256  80903bc57b7f9c5f24298ecf1531cf66ef571681b4bd1e05f6e4db704ffb38=
0b =

> > falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a.tar.gz
> > +sha256  2a4b37c08bec4ba81326314831f341385aff267062e8d44834379586896629=
36
> >  falcosecurity-libs-0.10.5.tar.gz> =

> >  sha256  21ec9433a87459b3477faf542bacec419dc03af841309eac35edeffe481cf1=
0b =

> >  COPYING sha256 =

> >  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 =

> >  driver/GPL2.txt sha256 =

> >  f17d3f2c2d565a74a7d5bf96f880c43701e141897e8dff0c8aa13e5d07aaf226 =

> >  driver/MIT.txt> =

> > diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk
> > b/package/falcosecurity-libs/falcosecurity-libs.mk index
> > 92d5c61832..acd46cf7a5 100644
> > --- a/package/falcosecurity-libs/falcosecurity-libs.mk
> > +++ b/package/falcosecurity-libs/falcosecurity-libs.mk
> > @@ -4,7 +4,7 @@
> > =

> >  #
> >  ######################################################################=
###
> >  #######> =

> > -FALCOSECURITY_LIBS_VERSION =3D e5c53d648f3c4694385bbe488e7d47eaa36c229a
> > +FALCOSECURITY_LIBS_VERSION =3D 0.10.5
> > =

> >  FALCOSECURITY_LIBS_SITE =3D $(call
> >  github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
> >  FALCOSECURITY_LIBS_LICENSE =3D Apache-2.0 (userspace), MIT or GPL-2.0
> >  (driver) FALCOSECURITY_LIBS_LICENSE_FILES =3D COPYING driver/MIT.txt
> >  driver/GPL2.txt> =

> > @@ -57,17 +57,19 @@ endef
> > =

> >  # For the others, it was taken by inspecting
> >  # falcosecurity-libs/*/CMakeLists.txt, which normally creates these
> >  # files, but doesn't work well with the kernel-module infrastructure.
> > =

> > +# The magical number for API_VERSION and SCHEMA_VERSION are taken from
> > +# corresponding files.
> =

> Which corresponding files? :-)

I just removed this comment as the files were already mentioned above.

> =

> Thomas




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
