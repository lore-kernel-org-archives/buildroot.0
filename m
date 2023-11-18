Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7532C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56C5D404A1;
	Sat, 18 Nov 2023 14:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C5D404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2MCvP0Z_7Mp; Sat, 18 Nov 2023 14:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 885CC4051D;
	Sat, 18 Nov 2023 14:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 885CC4051D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38CCD1BF364
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EE2A8219D
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EE2A8219D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrg37MsKIUOk for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:37:03 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A7F682192
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7F682192
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8949978050E;
 Sat, 18 Nov 2023 15:36:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:36:55 +0100
Date: Sat, 18 Nov 2023 15:36:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20231118143655.GA996011@scaer>
References: <20231113212707.1229840-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113212707.1229840-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700318221;
 bh=YaAPZXG2wE0ho+iwXRqNjWeri0YIV1tK3TZ+5GqYxsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jTI8B1ZHSPPUFWkyQQTmlAXXoFEqBMmGUHFgqdzo4zTPpKISli6AFaa9zznEuP6/S
 1lKFMdNam8hN3Mvdx4d3/6ocJo1I9tOjAB5VbAxpzlROUzoRldktXPAZSJWSGRyWGm
 04uy53KqSQdirJaYA/J8WgFOLP5w5SSgGSFX/GUs+o9BLukanzijwQNMkqr4uwPe5j
 a166jpI3TdcGtPW1bvIE8Uqxud2kijsgBZbdHTaZ/91wHFaxrs5PMmxi8ZQs0YuCMd
 pM76U4E2JJFi3B/ioEHYy89BqWxpZVfVDueqCAGfaY+zkwzmF4e0ph02JHvGcs933W
 m3kQYN3xmlj+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jTI8B1ZH
Subject: Re: [Buildroot] [PATCH v2] package/libabseil-cpp: bump to version
 20230802.1
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Robert Rose <robertroyrose@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2023-11-13 22:27 +0100, Michael Nosthoff via buildroot spake thusly:
> abseil and other google tools are now subject to
> "Google's Foundational C++ Support Policy" [0][1]. This currently mandates
> gcc 7.3.1 and C++14 as minimum versions.
> 
> Since we don't have guards for patch versions of gcc 7 use gcc 8 as minimum.
> 
> [0] https://github.com/abseil/abseil-cpp/releases/tag/20230125.0
> [1] https://github.com/google/oss-policies-info/blob/b842c39db88e6569dfe2cf98be434b03507cb503/foundational-cxx-support-matrix.md
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v1 -> v2:
> - bump minimum gcc from 7 to 8
> ---
>  package/collectd/Config.in               | 6 +++---
>  package/falcosecurity-libs/Config.in     | 2 +-
>  package/grpc/Config.in                   | 6 +++---
>  package/libabseil-cpp/Config.in          | 6 +++---
>  package/libabseil-cpp/libabseil-cpp.hash | 2 +-
>  package/libabseil-cpp/libabseil-cpp.mk   | 6 +++---
>  package/sysdig/Config.in                 | 6 +++---
>  7 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index a431da79f1..d3b686771d 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -683,15 +683,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
>  	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc -> libabseil-cpp
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # grpc -> libabseil-cpp
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
>  	select BR2_PACKAGE_GRPC
>  	help
>  	  Send/receive values using the gRPC protocol.
>  
> -comment "grpc needs a toolchain w/ C++, gcc >= 5"
> +comment "grpc needs a toolchain w/ C++, gcc >= 8"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
>  
> diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
> index f101883384..028a0ed28b 100644
> --- a/package/falcosecurity-libs/Config.in
> +++ b/package/falcosecurity-libs/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc, gtest
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # grpc -> libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
>  	depends on !BR2_STATIC_LIBS # protobuf, tbb
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> index db6425819b..afe0ea8450 100644
> --- a/package/grpc/Config.in
> +++ b/package/grpc/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
>  	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> @@ -19,9 +19,9 @@ config BR2_PACKAGE_GRPC
>  
>  	  http://github.com/grpc/grpc
>  
> -comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 5"
> +comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
> index 45f339ff26..7b65ec40d0 100644
> --- a/package/libabseil-cpp/Config.in
> +++ b/package/libabseil-cpp/Config.in
> @@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  config BR2_PACKAGE_LIBABSEIL_CPP
>  	bool "libabseil-cpp"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS # uses dlfcn.h
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> @@ -31,7 +31,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
>  
>  	  https://github.com/abseil/abseil-cpp
>  
> -comment "libabseil-cpp needs a toolchain w/ gcc >= 4.9, C++, threads, dynamic library"
> +comment "libabseil-cpp needs a toolchain w/ gcc >= 8, C++, threads, dynamic library"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
> index 808bdbab29..c3fc0d85e1 100644
> --- a/package/libabseil-cpp/libabseil-cpp.hash
> +++ b/package/libabseil-cpp/libabseil-cpp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  91ac87d30cc6d79f9ab974c51874a704de9c2647c40f6932597329a282217ba8  libabseil-cpp-20220623.1.tar.gz
> +sha256  987ce98f02eefbaf930d6e38ab16aa05737234d7afbab2d5c4ea7adbe50c28ed  libabseil-cpp-20230802.1.tar.gz
>  sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
> diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
> index ceda106b7d..a5dfc8eb19 100644
> --- a/package/libabseil-cpp/libabseil-cpp.mk
> +++ b/package/libabseil-cpp/libabseil-cpp.mk
> @@ -4,19 +4,19 @@
>  #
>  ################################################################################
>  
> -LIBABSEIL_CPP_VERSION = 20220623.1
> +LIBABSEIL_CPP_VERSION = 20230802.1
>  LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
>  LIBABSEIL_CPP_LICENSE = Apache-2.0
>  LIBABSEIL_CPP_LICENSE_FILES = LICENSE
>  LIBABSEIL_CPP_INSTALL_STAGING = YES
>  
>  LIBABSEIL_CPP_CONF_OPTS = \
> -	-DCMAKE_CXX_STANDARD=11 \
> +	-DCMAKE_CXX_STANDARD=14 \
>  	-DABSL_ENABLE_INSTALL=ON \
>  	-DABSL_USE_GOOGLETEST_HEAD=OFF
>  
>  HOST_LIBABSEIL_CPP_CONF_OPTS = \
> -	-DCMAKE_CXX_STANDARD=11 \
> +	-DCMAKE_CXX_STANDARD=14 \
>  	-DABSL_ENABLE_INSTALL=ON \
>  	-DABSL_USE_GOOGLETEST_HEAD=OFF
>  
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index c0a631bd49..3a3670f5cb 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_SYSDIG
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
>  	depends on BR2_LINUX_KERNEL # falcosecurity-libs
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # falcosecurity-libs
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # falcosecurity-libs -> grpc -> libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
>  	depends on !BR2_STATIC_LIBS # falcosecurity-libs
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
> @@ -23,12 +23,12 @@ config BR2_PACKAGE_SYSDIG
>  
>  	  https://github.com/draios/sysdig/wiki
>  
> -comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 5, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
> +comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS \
>  		|| !BR2_TOOLCHAIN_USES_GLIBC \
>  		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
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
