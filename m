Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AD1C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 08:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C44408EC;
	Sat, 10 Dec 2022 08:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C44408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zJj-PwhT9T3; Sat, 10 Dec 2022 08:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45914097B;
	Sat, 10 Dec 2022 08:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45914097B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF7A81BF44A
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 08:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA744017C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 08:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA744017C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ZzWKuDWqFu6 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 08:47:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6EB9400C0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6EB9400C0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:47:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.151])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1E65C780350;
 Sat, 10 Dec 2022 09:47:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 09:47:32 +0100
Date: Sat, 10 Dec 2022 09:47:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221210084732.GR2855@scaer>
References: <20221208202338.4085-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208202338.4085-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670662057;
 bh=6LE89l88JNbLwGs3+uzGH7tbeWH0zuf7y3cu94fjS9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UNv3XTb+UrqlaEUyYW4IL7Cp/3x8zPCpx/xKUwGgo5WQ8qzpGK9F94yL0WiPFcfgA
 Z8+HVgeFivPzhLQ8t+7g0gN9vkeKyBpYnPlHVgGDi8j84CrnDzDzz78QIJasYRHGva
 kHiOqim7StJgo67nDIOXGZFvPOYcfWLHTHmA7G9w8iGMWs/9tCj/jSBAnU50XQKLaI
 Rl6ZuGkjWZnfT1goMTIprCmKc3gT4CwNDyIvC+zacz0sNWWfhpM7/Wc1vHQqsWjLbo
 aZmisNUjSZphQY4zwMOlhnsds10ZJexGcqjitpBgEk6G6wjQk13PTPfFaexJOdjScK
 zFzXO+o910AaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UNv3XTb+
Subject: Re: [Buildroot] [PATCH 1/1] package/libftdi1: fix static build with
 libusb and -latomic
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
Cc: Daniel Sangue <daniel.sangue@sangue.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-08 21:23 +0100, Fabrice Fontaine spake thusly:
> Use pkg-config to retrieve libusb dependencies such as -latomic and
> avoid the following static build failure raised since bump of libusb to
> version 1.0.25 in commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:
> 
> /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
> /nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ix-static-build-with-libusb-and-lato.patch | 47 +++++++++++++++++++
>  package/libftdi1/libftdi1.mk                  |  2 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
> 
> diff --git a/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
> new file mode 100644
> index 0000000000..c818c58d68
> --- /dev/null
> +++ b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
> @@ -0,0 +1,47 @@
> +From b5b8fab6063ad90bb5ef05a72708ecde1796bc81 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 13 May 2022 18:11:50 +0200
> +Subject: [PATCH] CMakeLists.txt: fix static build with libusb and -latomic
> +
> +Use pkg-config to retrieve libusb dependencies such as -latomic and
> +avoid the following static build failure:
> +
> +/nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
> +/nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +http://developer.intra2net.com/git/?p=libftdi;a=commit;h=b5b8fab6063ad90bb5ef05a72708ecde1796bc81]
> +---
> + CMakeLists.txt |   12 ++++++++++--
> + 1 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 58f664a..d20aa94 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -25,8 +25,16 @@ if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
> + endif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
> + 
> + # find libusb
> +-find_package ( USB1 REQUIRED )
> +-include_directories ( ${LIBUSB_INCLUDE_DIR} )
> ++find_package( PkgConfig )
> ++if (PkgConfig_FOUND)
> ++  pkg_check_modules( LIBUSB libusb-1.0 )
> ++  if (LIBUSB_FOUND)
> ++    include_directories ( ${LIBUSB_INCLUDE_DIRS} )
> ++  else()
> ++    find_package ( USB1 REQUIRED )
> ++    include_directories ( ${LIBUSB_INCLUDE_DIR} )
> ++  endif()
> ++endif()
> + 
> + # Find Boost
> + if (FTDIPP OR BUILD_TESTS)
> +-- 
> +1.7.1
> +
> diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
> index d2e3f42e14..66798addc4 100644
> --- a/package/libftdi1/libftdi1.mk
> +++ b/package/libftdi1/libftdi1.mk
> @@ -8,7 +8,7 @@ LIBFTDI1_VERSION = 1.5
>  LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
>  LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
>  LIBFTDI1_INSTALL_STAGING = YES
> -LIBFTDI1_DEPENDENCIES = libusb
> +LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
>  LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
>  LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
>  LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
> -- 
> 2.35.1
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
