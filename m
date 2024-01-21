Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15E9C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5383E40142;
	Sun, 21 Jan 2024 19:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5383E40142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDKmb5ThVQKL; Sun, 21 Jan 2024 19:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28B53404F8;
	Sun, 21 Jan 2024 19:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28B53404F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F227F1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB84482591
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB84482591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tp6OgDAA7o3z for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 19:26:19 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C05C682564
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 19:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05C682564
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F277B13F8A7;
 Sun, 21 Jan 2024 20:26:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 20:26:14 +0100
Date: Sun, 21 Jan 2024 20:26:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Za1v1kNsN60GIie8@landeda>
References: <20240120161015.4618-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240120161015.4618-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705865178;
 bh=vuc4Adbac4xyBGBi5qDgBDdLap/hkvxfu7LzIX86fn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V9tfJqHZV06MFF4dh9xotounSCAq7BvJLnxzZA/msLZJcsfWfYEo8fefhYE0mD19S
 wxF0iRAEUeMni00IUoK9lgXpj16ljppqMvK9rxz2ICcSQbRYgMktsxBy27EqJ7aDws
 fJUm6kt4SN0KvV36iiWf/ThVpQYHsIJbxXPlHrEsRo5TlphWrT6Z/JRDKWaCDEkWdD
 6tlpI8kZtw+Qn2wpJLlwpZMjPHseyGucWajyuXSDYgMckgH0lWWTvZQkXDCpPpERX6
 k/9MzZYGgvNnhvhpZlvrstwnr5tI48WkcEE9SelRNZY1KRHPJ89K3mhcfaJUwE4iix
 OPjpvvsDvlZWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V9tfJqHZ
Subject: Re: [Buildroot] [PATCH 1/1] package/highway: fix riscv32 build
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-20 17:10 +0100, Fabrice Fontaine spake thusly:
> Do not set -march=rv64gcv1p0 when building for riscv32 to fix the
> following build failure raised since bump to version 1.0.7 in commit
> 0db3c08daf335571a2b2d18a16d8980ddf4567ab and
> https://github.com/google/highway/commit/7c15872e81d88c77bca5e74fe0a6543cc374601a:
> 
> cc1plus: error: ABI requires '-march=rv32'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3f8def50c93f73c26339f72d6a13951d5fb41c30
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...1-add-required-RISC-V-flags-to-CMake.patch | 42 +++++++++++++++++++
>  package/highway/highway.mk                    |  4 ++
>  2 files changed, 46 insertions(+)
>  create mode 100644 package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
> 
> diff --git a/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch b/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
> new file mode 100644
> index 0000000000..bfcbfb055c
> --- /dev/null
> +++ b/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
> @@ -0,0 +1,42 @@
> +From 5d58d233fbcec0c6a39df8186a877329147324b3 Mon Sep 17 00:00:00 2001
> +From: Mathieu Malaterre <mathieu.malaterre@gmail.com>
> +Date: Wed, 13 Sep 2023 08:37:54 +0200
> +Subject: [PATCH] Add an option to opt-out of HWY_RISCV
> +
> +Fixes #1740
> +
> +Upstream: https://github.com/google/highway/commit/5d58d233fbcec0c6a39df8186a877329147324b3
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + CMakeLists.txt | 11 ++++++++---
> + 1 file changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index c2bf57b3f5..be639c945f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -61,6 +61,9 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4
> + # skipped. For GCC 13.1+, you can also build with -fexcess-precision=standard.
> + set(HWY_CMAKE_SSE2 OFF CACHE BOOL "Set SSE2 as baseline for 32-bit x86?")
> + 
> ++# Currently this will compile the entire codebase with `-march=rv64gcv1p0`:
> ++set(HWY_CMAKE_RVV ON CACHE BOOL "Set copts for RISCV with RVV?")
> ++
> + # Unconditionally adding -Werror risks breaking the build when new warnings
> + # arise due to compiler/platform changes. Enable this in CI/tests.
> + set(HWY_WARNINGS_ARE_ERRORS OFF CACHE BOOL "Add -Werror flag?")
> +@@ -260,9 +263,11 @@ else()
> +     # gcc(13) and recent clang both support V, but not yet runtime dispatch, so
> +     # we add the gcv compiler flag, which then requires the CPU (now when using
> +     # either compiler) to support V.
> +-    list(APPEND HWY_FLAGS -march=rv64gcv1p0)
> +-    if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
> +-      list(APPEND HWY_FLAGS -menable-experimental-extensions)
> ++    if(HWY_CMAKE_RVV)
> ++      list(APPEND HWY_FLAGS -march=rv64gcv1p0)
> ++      if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
> ++        list(APPEND HWY_FLAGS -menable-experimental-extensions)
> ++      endif()
> +     endif()
> +   endif()
> + 
> diff --git a/package/highway/highway.mk b/package/highway/highway.mk
> index 692794959a..2ae2cdc6b6 100644
> --- a/package/highway/highway.mk
> +++ b/package/highway/highway.mk
> @@ -41,6 +41,10 @@ else
>  HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=OFF
>  endif
>  
> +ifeq ($(BR2_RISCV_32),y)
> +HIGHWAY_CONF_OPTS += -DHWY_CMAKE_RVV=OFF
> +endif
> +
>  # Workaround for gcc bug 104028 on m68k.
>  # See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
> -- 
> 2.43.0
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
