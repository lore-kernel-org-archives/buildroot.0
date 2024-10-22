Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E70D1715D
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 04:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C4180A5C;
	Tue, 22 Oct 2024 04:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2is-nzX7kq6; Tue, 22 Oct 2024 04:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94FCB80A5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FCB80A5E;
	Tue, 22 Oct 2024 04:26:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F752072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 04:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E8A060759
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 04:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEND8Wm6CGDY for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 04:26:23 +0000 (UTC)
X-Greylist: delayed 612 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 22 Oct 2024 04:26:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F126460753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F126460753
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F126460753
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 04:26:22 +0000 (UTC)
Received: from shale (syn-141-126-093-001.res.spectrum.com [141.126.93.1])
 (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 49M4Fw6E028700
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 21 Oct 2024 21:16:07 -0700
Date: Mon, 21 Oct 2024 21:15:54 -0700
From: Sen Hastings <sen@hastings.org>
To: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Cc: buildroot@buildroot.org
Message-ID: <Zxcm4lWvOQcbZ2YU@shale>
References: <20240719161557.8832-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719161557.8832-1-javad.rahimipetroudi@mind.be>
X-Sonic-CAuth: UmFuZG9tSVYNIx0hNLIeLUolEcLebYvEOXM1/Hd/yXnvP9yLiy+4L+hcbLru2aczbSNxvzuCxgFqAbzDzs6q+D18qtzRNn+B
X-Sonic-ID: C;sLsHVyyQ7xG15/UmL2ybUA== M;FgyIXCyQ7xG15/UmL2ybUA==
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: Re: [Buildroot] [PATCH 1/2] package/libplacebo: add libplacebo
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jul 19, 2024 at 06:15:56PM +0200, Javad Rahimipetroudi via buildroot wrote:
> This patch adds libplacebo package that is used
> by mpv player.
> libplacebo is the core rendering algorithms and
> ideas of mpv rewritten as an independent library
> and contains a large assortment of video processing
> shaders, focusing on both quality and performance.
> 

Great, this works! 

tested on: x86_64 with musl stable 2024.05-1 bootlin toolchain

I was thinking however: perhaps the package should live under "Multimedia" 
instead of "Audio/Sound"?

> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Tested-by: Sen Hastings <sen@hastings.org>
> ---
>  package/Config.in                             |  1 +
>  ...ild-fix-linker-error-in-uclibc-sparc.patch | 45 +++++++++++++++++++
>  ...h-add-static_assert-define-for-ulibc.patch | 36 +++++++++++++++
>  package/libplacebo/Config.in                  | 18 ++++++++
>  package/libplacebo/libplacebo.hash            |  2 +
>  package/libplacebo/libplacebo.mk              | 15 +++++++
>  6 files changed, 117 insertions(+)
>  create mode 100644 package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
>  create mode 100644 package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
>  create mode 100644 package/libplacebo/Config.in
>  create mode 100644 package/libplacebo/libplacebo.hash
>  create mode 100644 package/libplacebo/libplacebo.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f2e10b2b5e..1207001640 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1509,6 +1509,7 @@ menu "Audio/Sound"
>  	source "package/libmodplug/Config.in"
>  	source "package/libmpdclient/Config.in"
>  	source "package/libopenmpt/Config.in"
> +	source "package/libplacebo/Config.in"
>  	source "package/libreplaygain/Config.in"
>  	source "package/libsamplerate/Config.in"
>  	source "package/libsidplay2/Config.in"
> diff --git a/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch b/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
> new file mode 100644
> index 0000000000..3056d28651
> --- /dev/null
> +++ b/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
> @@ -0,0 +1,45 @@
> +From 4386f3e3b3d02c55776e3f674d8447fd24388c2c Mon Sep 17 00:00:00 2001
> +From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
> +Date: Fri, 19 Jul 2024 07:02:48 +0200
> +Subject: [PATCH] meson.build: add libatomic dependency if needed  
> +
> +This PR fixes the problem related to not finding the libatomic during the
> +build. Some combinations or architecture and libc (e.g. uClibc on SPARC)
> +operations in a separate library and don't link with it automatically.
> +An optional find_library to meson.build has been added to 
> +discover this.
> +
> +
> +Fixes:
> + - https://github.com/haasn/libplacebo/issues/278
> +
> +Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
> +Upstream: https://github.com/haasn/libplacebo/commit/4386f3e3b3d02c55776e3f674d8447fd24388c2c
> +---
> + meson.build | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index a73e49ff..f8cbf9f1 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -448,6 +448,7 @@ add_project_link_arguments(link_args, language: ['c', 'cpp'])
> + # Global dependencies
> + fs = import('fs')
> + libm = cc.find_library('m', required: false)
> ++atomic = cc.find_library('atomic', required: false)
> + thirdparty = meson.project_source_root()/'3rdparty'
> + python = import('python').find_installation()
> + python_env = environment()
> +@@ -473,7 +474,7 @@ else
> +     )
> + endif
> + 
> +-build_deps = [ libm, threads ]
> ++build_deps = [ libm, threads, atomic]
> + 
> + subdir('tools')
> + subdir('src')
> +-- 
> +2.45.2
> +
> diff --git a/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch b/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
> new file mode 100644
> index 0000000000..6960c2f219
> --- /dev/null
> +++ b/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
> @@ -0,0 +1,36 @@
> +From 0182e2b94bbc6bb964f96527d18e93c9b4709a3a Mon Sep 17 00:00:00 2001
> +From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
> +Date: Fri, 19 Jul 2024 07:57:45 +0200
> +Subject: [PATCH] src/pl_assert.h:add static_assert define for ulibc
> +
> +This PR adds the static_assert macro defination for uClibc that is
> +missed in some platforms. However, it is limited to C versions lower
> +than C23. From C23, static_assert is not defined as macro anymore:
> +https://en.cppreference.com/w/c/language/_Static_assert
> +
> +Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
> +Upstream: https://github.com/haasn/libplacebo/commit/0182e2b94bbc6bb964f96527d18e93c9b4709a3a
> +---
> + src/pl_assert.h | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/pl_assert.h b/src/pl_assert.h
> +index b4c6656c..de9d3547 100644
> +--- a/src/pl_assert.h
> ++++ b/src/pl_assert.h
> +@@ -20,6 +20,12 @@
> + #include <stdio.h>
> + #include <assert.h>
> + 
> ++#if !defined (__cplusplus)
> ++#if (__STDC_VERSION__ < 202301L)
> ++#define static_assert _Static_assert
> ++#endif
> ++#endif
> ++
> + #ifndef NDEBUG
> + # define pl_assert assert
> + #else
> +-- 
> +2.45.2
> +
> diff --git a/package/libplacebo/Config.in b/package/libplacebo/Config.in
> new file mode 100644
> index 0000000000..e2fc434248
> --- /dev/null
> +++ b/package/libplacebo/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LIBPLACEBO
> +	bool "libplacebo"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 #C++20
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on !BR2_STATIC_LIBS # needs <dlfcn.h>
> +
> +	help
> +	  libplacebo is, in a nutshell, the core rendering
> +	  algorithms and ideas of mpv rewritten as an
> +	  independent library. As of today, libplacebo
> +	  contains a large assortment of video processing
> +	  shaders, focusing on both quality and performance.
> +
> +comment "libplacebo needs a toolchain w/ dynamic library, threads, and dynamic loading"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
> new file mode 100644
> index 0000000000..d1588a608b
> --- /dev/null
> +++ b/package/libplacebo/libplacebo.hash
> @@ -0,0 +1,2 @@
> +sha256  afaaf16668a1dfaa5f5bf7329713d0dd89cf2ca0dbe7c68aeea894d333e2503e  libplacebo-v7.349.0-git4.tar.gz
> +sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
> diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
> new file mode 100644
> index 0000000000..ae3cb68022
> --- /dev/null
> +++ b/package/libplacebo/libplacebo.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libplacebo
> +#
> +################################################################################
> +
> +LIBPLACEBO_VERSION = v7.349.0
> +LIBPLACEBO_SITE = https://github.com/haasn/libplacebo
> +LIBPLACEBO_SITE_METHOD = git
> +LIBPLACEBO_GIT_SUBMODULES = YES
> +LIBPLACEBO_LICENSE = LGPL-2.1
> +LIBPLACEBO_LICENSE_FILES = LICENSE
> +LIBPLACEBO_INSTALL_STAGING = YES
> +
> +$(eval $(meson-package))
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
