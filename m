Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2027BC001DE
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 07:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B8981A0D;
	Sun, 13 Aug 2023 07:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B8981A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qTc60wgl4lu; Sun, 13 Aug 2023 07:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFABB819F8;
	Sun, 13 Aug 2023 07:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFABB819F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 542FB1BF470
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CC8D819F8
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC8D819F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fb2p-_quByTX for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 07:52:08 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E69AD819F6
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 07:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69AD819F6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 294DA780333;
 Sun, 13 Aug 2023 09:52:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Aug 2023 09:52:02 +0200
Date: Sun, 13 Aug 2023 09:52:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20230813075202.GV421096@scaer>
References: <20230811152710.43564-1-flaniel@linux.microsoft.com>
 <20230811152710.43564-2-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811152710.43564-2-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691913125;
 bh=lOk6wrfCL2M+2Kjb88aPdrUsa6zDbb7qvaRIyAlvtIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwv+8arJyZJlz6huLYjBREvhLG6YstMfiChIDqw7C03xoYxVMBVKVU0n+lgcVfQ3P
 TXzYN0DgUCDSv7qro4DL1zUioYVfQdHPeHlIIaywH8UrYOrmEl4ECwJ9jtFV3iOD6U
 uCuam5LrgNyIoIO2IEHF9UY+SKRBzuxUpwm7aWBqMYIj+GsilnG1+A6Q+AiXbAi6vq
 tEgPrtQWc1cFOeSWsj64Q0S6H3RUkWH0GWnyLt0QfxASf+sZ3LOXC1Ndp7gwYMEgha
 yY9t8t+7FYwg9RZCvm44uWPyBgz1ca5ywqfcCdencyBxd4v+h800oTFpoUZLamJfjt
 i4PJKWL9bNs8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cwv+8arJ
Subject: Re: [Buildroot] [RFC PATCH v2 1/3] package/falcosecurity-libs: bump
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francis, All,

On 2023-08-11 17:27 +0200, Francis Laniel spake thusly:
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

You need to expand on the commit log. Having an overview in the cover
letter as you did is very good to understand a series as a whole.

But the cover letter is not going to get comitted to the git history,
shile the commit logs are. So we really need to have the details of the
change in the commit log.

> ---
>  .../0002-cmake-Install-shared-libraries.patch | 61 +++++++++++++++++++
>  .../falcosecurity-libs.hash                   |  2 +-
>  .../falcosecurity-libs/falcosecurity-libs.mk  | 10 +--
>  3 files changed, 67 insertions(+), 6 deletions(-)
>  create mode 100644 package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
> 
> diff --git a/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
> new file mode 100644
> index 0000000000..38a8bdd4f4
> --- /dev/null
> +++ b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
> @@ -0,0 +1,61 @@
> +From b6d847fe8aa0513c6d19bd8187133699b9c4efd3 Mon Sep 17 00:00:00 2001
> +From: Francis Laniel <flaniel@linux.microsoft.com>
> +Date: Fri, 28 Apr 2023 15:14:27 +0100
> +Subject: [PATCH] cmake: Install shared libraries.
> +
> +This is needed as sysdig is compiled as a non static binary which relies on
> +these libraries.

As I said in the review of the cover letter, this has nothing to do with
the fact that sysdig is static or not, but the fact that
falcosecurity-libs does not install those libs while sysdig needs to
link against them.

So I think it would still work if you even installed just the static
version of those libs (but I agree that it is nicer if they are shared).

Otherwise, this change is not very intrusive. It would be nice to submit
that upstream, indeed, so we don;t have to maintain it forever, but it
is relatively clean.

Is there a reason why the search for a shared libelf is done in the same
patch that generates shared libs?

> +Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> +---
> + cmake/modules/libelf.cmake       |  2 +-
> + userspace/libscap/CMakeLists.txt | 16 +++++++++++++++-
> + 2 files changed, 16 insertions(+), 2 deletions(-)
> +
> +diff --git a/cmake/modules/libelf.cmake b/cmake/modules/libelf.cmake
> +index 8ca2f4f7..73d13d26 100644
> +--- a/cmake/modules/libelf.cmake
> ++++ b/cmake/modules/libelf.cmake
> +@@ -10,7 +10,7 @@ if(LIBELF_INCLUDE)
> +     add_custom_target(libelf)
> + elseif(NOT USE_BUNDLED_LIBELF)
> +     find_path(LIBELF_INCLUDE elf.h PATH_SUFFIXES elf)
> +-    find_library(LIBELF_LIB NAMES libelf.a libelf.so)
> ++    find_library(LIBELF_LIB NAMES libelf.so)

Maybe keep libelf.a but in reverse order, so as to prefer the shared
variant, and fallback to the static one?

    find_library(LIBELF_LIB NAMES libelf.so libelf.a)

> +     if(LIBELF_LIB)
> +         message(STATUS "Found LIBELF: include: ${LIBELF_INCLUDE}, lib: ${LIBELF_LIB}")
> +     else()
> +diff --git a/userspace/libscap/CMakeLists.txt b/userspace/libscap/CMakeLists.txt
> +index ae4760df..59378fea 100644
> +--- a/userspace/libscap/CMakeLists.txt
> ++++ b/userspace/libscap/CMakeLists.txt
> +@@ -70,7 +70,7 @@ endif()
> + 
> + include_directories(${CMAKE_CURRENT_SOURCE_DIR})
> + 
> +-add_library(scap STATIC
> ++add_library(scap SHARED

Rather than forcing staitic or shared, it should probably be left out
entorely, to let the build decide based on BUILD_SHARED_LIBS:

    https://cmake.org/cmake/help/v3.27/manual/cmake-variables.7.html#variables-that-change-behavior
    https://cmake.org/cmake/help/v3.27/variable/BUILD_SHARED_LIBS.html

> ++install(TARGETS scap)
> ++install(TARGETS scap_engine_udig)
> ++install(TARGETS scap_engine_savefile)
> ++install(TARGETS scap_engine_bpf)
> ++install(TARGETS scap_engine_noop)
> ++install(TARGETS scap_engine_source_plugin)
> ++install(TARGETS scap_engine_kmod)
> ++install(TARGETS scap_engine_nodriver)
> ++install(TARGETS scap_event_schema)
> ++install(TARGETS scap_platform)
> ++install(TARGETS scap_engine_util)
> ++install(TARGETS scap_error)
> ++install(TARGETS driver_event_schema)

You'd still need to install them, whether they are static or shared.

[--SNIP--]
> diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
> index 92d5c61832..039b64bd5c 100644
> --- a/package/falcosecurity-libs/falcosecurity-libs.mk
> +++ b/package/falcosecurity-libs/falcosecurity-libs.mk
[--SNIP--]
> @@ -63,11 +63,11 @@ define FALCOSECURITY_LIBS_MODULE_GEN_MAKEFILE
>  	$(SED) 's/@DRIVER_NAME@/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/Makefile
>  
>  	$(INSTALL) -m 0644 $(@D)/driver/driver_config.h.in $(@D)/driver/driver_config.h
> -	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
> +	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MAJOR}/3/;' $(@D)/driver/driver_config.h
>  	$(SED) 's/\$${PPM_API_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
> -	$(SED) 's/\$${PPM_API_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
> -	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MAJOR}/1/;' $(@D)/driver/driver_config.h
> -	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MINOR}/0/;' $(@D)/driver/driver_config.h
> +	$(SED) 's/\$${PPM_API_CURRENT_VERSION_PATCH}/1/;' $(@D)/driver/driver_config.h
> +	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MAJOR}/2/;' $(@D)/driver/driver_config.h
> +	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_MINOR}/2/;' $(@D)/driver/driver_config.h

As you noticed in the cover letter, it would be much better to extract
those from the files where they are defined, rather than hardcode them
here, which as you noticed, is quite a burden to maintain.

FTR, I did that for erlang and it was recently applied:

    b574a9606e62  package/erlang: do not hard-code the Erlang Interface Version (EI_VSN)

So yes, it'd be nice to do the same here.

Regards,
Yann E. MORIN.

>  	$(SED) 's/\$${PPM_SCHEMA_CURRENT_VERSION_PATCH}/0/;' $(@D)/driver/driver_config.h
>  	$(SED) 's/\$${DRIVER_VERSION}//;' $(@D)/driver/driver_config.h
>  	$(SED) 's/\$${DRIVER_NAME}/$(FALCOSECURITY_LIBS_DRIVER_NAME)/;' $(@D)/driver/driver_config.h
> -- 
> 2.34.1
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
