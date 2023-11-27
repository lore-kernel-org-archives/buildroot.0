Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9DBC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 489178135A;
	Mon, 27 Nov 2023 18:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 489178135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URoT7U0fj4a8; Mon, 27 Nov 2023 18:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5871D80D50;
	Mon, 27 Nov 2023 18:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5871D80D50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2264C1BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0829160F1F
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0829160F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HniQ_AUCd2Wg for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:35:43 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDE0660EA0
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDE0660EA0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 93634B00565;
 Mon, 27 Nov 2023 19:35:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:35:33 +0100
Date: Mon, 27 Nov 2023 19:35:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20231127183533.GA3177259@scaer>
References: <20231127101405.3306410-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127101405.3306410-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701110141;
 bh=UHS5xRSXOXsE46thY2BcaB51PVz9kL69+P5M/uVrKGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KctD5Le4KXYxRJ0BWsepNx+DhSgjlVymy7IFJjQBRayrbs12ZMofetZUQtsVcwhiT
 cMO8/KwephqPnbJBXwV3rAplg4mp5rGbKdTsAG964EBrw2mNV8jyRIf71w7TtvDvMH
 J1oZOIq6CFcxema405KSs0ciHtGGnODvxo+sQRdGYbTeieoigCB8iElNNYuJ83CHqh
 JbNupKaqfO8kzLeu4Ia06WasG6GlqTnLAuREaUP++wN+bbrU+g4fwjBdvky6UqkhfV
 cigVTMBw2EYeow9DpI17Ew6GMNODIrlnjtJi/rVk2v+4fXiS09MDlwYSIafKelPfwS
 v5ZErTjvRozkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KctD5Le4
Subject: Re: [Buildroot] [PATCH v3] package/re2: bump to version 2023.11.01
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Rose <robertroyrose@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2023-11-27 11:14 +0100, Michael Nosthoff via buildroot spake thusly:
> - libabseil-cpp is now a dependency
> - required c++ standard is now c++14 [0] --> requires gcc8
> - drop fix for gcc <= 5 introduced in 25fd3b0a523805db14682f7c559cc1c9c366ed55
>   (c++ >= 14 is the default for gcc >= 8)
> - update gcc required for depending packages qt5webengine & grpc
> 
> [0] https://github.com/google/re2/wiki/Install/7c2552dd54444695ce5a9e6a01dd8f312b347914
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v2:
>  - clarify that re2 itself now requires c++14
>  - raise gcc required version for qt5webengine and add comment for grpc
> 
> v3:
>  - update C++14 comment in Config.in
> ---
>  package/grpc/Config.in             |  2 +-
>  package/qt5/qt5webengine/Config.in |  6 +++---
>  package/re2/Config.in              |  7 ++++---
>  package/re2/re2.hash               |  2 +-
>  package/re2/re2.mk                 | 13 +++++--------
>  5 files changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> index afe0ea8450..ef3e1c86cb 100644
> --- a/package/grpc/Config.in
> +++ b/package/grpc/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp, re2
>  	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 542f212dfc..cfa5893f41 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -10,10 +10,10 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # qt5base-icu
>  	depends on BR2_USE_MMU # libglib2, qt5base-dbus
>  
> -comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.9, host gcc >= 4.9, threads, wchar"
> +comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, threads, wchar"
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
>  		!BR2_HOST_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  
> @@ -26,7 +26,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # qt5base-icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
> diff --git a/package/re2/Config.in b/package/re2/Config.in
> index 64217e8aa2..0ac0041f6d 100644
> --- a/package/re2/Config.in
> +++ b/package/re2/Config.in
> @@ -1,8 +1,9 @@
>  config BR2_PACKAGE_RE2
>  	bool "re2"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBABSEIL_CPP
>  	help
>  	  RE2 is a fast, safe, thread-friendly alternative
>  	  to backtracking regular expression engines like
> @@ -11,7 +12,7 @@ config BR2_PACKAGE_RE2
>  
>  	  https://github.com/google/re2
>  
> -comment "re2 needs a toolchain w/ C++, threads, gcc >= 4.8"
> +comment "re2 needs a toolchain w/ C++, threads, gcc >= 8"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> diff --git a/package/re2/re2.hash b/package/re2/re2.hash
> index a39dece7a9..5f590aba6e 100644
> --- a/package/re2/re2.hash
> +++ b/package/re2/re2.hash
> @@ -1,3 +1,3 @@
>  # locally calculated
> -sha256  cbce8b7803e856827201a132862e41af386e7afd9cc6d9a9bc7a4fa4d8ddbdde  re2-2023-02-01.tar.gz
> +sha256  4e6593ac3c71de1c0f322735bc8b0492a72f66ffccfad76e259fa21c41d27d8a  re2-2023-11-01.tar.gz
>  sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index 5587366b1f..b81a64f2e9 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -4,29 +4,26 @@
>  #
>  ################################################################################
>  
> -RE2_VERSION = 2023-02-01
> +RE2_VERSION = 2023-11-01
>  RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
>  RE2_LICENSE = BSD-3-Clause
>  RE2_LICENSE_FILES = LICENSE
>  RE2_INSTALL_STAGING = YES
> -
> -RE2_MAKE_OPTS = \
> -	$(TARGET_CONFIGURE_OPTS) \
> -	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
> +RE2_DEPENDENCIES = libabseil-cpp
>  
>  define RE2_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>  		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
>  endef
>  
>  define RE2_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>  		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
>  		$(if $(BR2_STATIC_LIBS),static-install,install)
>  endef
>  
>  define RE2_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>  		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
>  		$(if $(BR2_STATIC_LIBS),static-install,install)
>  endef
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
