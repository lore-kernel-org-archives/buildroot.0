Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502CBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC09783F62;
	Sun, 17 Jul 2022 13:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC09783F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMWLw5zEUjUF; Sun, 17 Jul 2022 13:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A5EE83F3B;
	Sun, 17 Jul 2022 13:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5EE83F3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 731641BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49DB360BF5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49DB360BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_A0do2zIhlD for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:03:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C185B60EAC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C185B60EAC
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:03:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D9882780516;
 Sun, 17 Jul 2022 15:02:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:02:59 +0200
Date: Sun, 17 Jul 2022 15:02:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717130259.GG2107091@scaer>
References: <20220717075034.2246639-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220717075034.2246639-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658062982;
 bh=9duU0gvbUONCazHh3/sKvzC9qzW+CB48WrT5UB9Plgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uZqx8/c7lVi56KQgG7uZuRlakjCBWVYZrBP1lfaplYctwOqYF2R59gIpq/EHApPFd
 v/c3Dy65lGgN0AADqQqGtieXnmrGskmbheG0oCpMA5w0oVDexeKPFdbX08PtB6sB1b
 +Lg61UwcE7T6d4qfSDvVwcXM81RiJ5kaiobMRBeHtCkDmidio7Galthmukkx/UBgKi
 OLpO1DZx15D92rnfE+RNii8hzF2wYm7DgvXrERn4m77Pzezca6SizjsdHhiBe9NqPx
 5LOhRDbEc8QIfCokwjuPArVTu1ifO5NUygDHyYz5l1i47ZnzIblcc12vq/rz6schsQ
 DU3Eb1knghZtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uZqx8/c7
Subject: Re: [Buildroot] [PATCH 1/2] package/libwebsockets: bump to version
 4.3.2
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

Fabrice, All,

On 2022-07-17 09:50 +0200, Fabrice Fontaine spake thusly:
> Drop first and second patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...1-CMakeLists.txt-fix-build-without-C.patch | 44 -------------------
>  ...Lists.txt-fix-build-without-threads.patch} |  0
>  ...emove-duplicate-LwsCheckRequirements.patch | 26 -----------
>  package/libwebsockets/libwebsockets.hash      |  2 +-
>  package/libwebsockets/libwebsockets.mk        |  2 +-
>  5 files changed, 2 insertions(+), 72 deletions(-)
>  delete mode 100644 package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
>  rename package/libwebsockets/{0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch => 0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch} (100%)
>  delete mode 100644 package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
> 
> diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
> deleted file mode 100644
> index c6d6d07dcc..0000000000
> --- a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 726b36eca158063d8871c91ad99a29113ea35aea Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 13 Apr 2022 21:03:26 +0200
> -Subject: [PATCH] CMakeLists.txt: fix build without C++
> -
> -Fix the following build failure without C++ raised since version 4.2.0
> -and
> -https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:
> -
> -CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
> -  The C++ compiler
> -
> -    "/usr/bin/clang++"
> -
> -  is not able to compile a simple test program.
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/warmcat/libwebsockets/pull/2613]
> ----
> - CMakeLists.txt | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 08aaf8c6..96e3ad18 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -71,7 +71,10 @@ if (ESP_PLATFORM)
> - endif()
> - 
> - # it's at this point any toolchain file is brought in
> --project(libwebsockets C CXX)
> -+project(libwebsockets C)
> -+if (LWS_WITH_SECURE_STREAMS_CPP)
> -+	enable_language(CXX)
> -+endif()
> - include(CTest)
> - 
> - if (PICO_SDK_PATH)
> --- 
> -2.35.1
> -
> diff --git a/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch b/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
> similarity index 100%
> rename from package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
> rename to package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
> diff --git a/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
> deleted file mode 100644
> index fc76a2b610..0000000000
> --- a/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 99a8b9c4422bed45c8b7412a1e121056f2a6132a Mon Sep 17 00:00:00 2001
> -From: Andy Green <andy@warmcat.com>
> -Date: Mon, 7 Feb 2022 14:48:55 +0000
> -Subject: [PATCH] cmake: remove duplicate LwsCheckRequirements
> -
> -Signed-off-by: Andy Green <andy@warmcat.com>
> -Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
> -Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ----
> - cmake/libwebsockets-config.cmake.in | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/cmake/libwebsockets-config.cmake.in b/cmake/libwebsockets-config.cmake.in
> -index 6247b2cb..8ba97e6f 100644
> ---- a/cmake/libwebsockets-config.cmake.in
> -+++ b/cmake/libwebsockets-config.cmake.in
> -@@ -32,6 +32,5 @@ endforeach()
> - 
> - include(CheckIncludeFile)
> - include(CheckCSourceCompiles)
> --include(LwsCheckRequirements)
> - set(requirements 1)
> - 
> --- 
> -2.35.3
> -
> diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
> index e39d6e1853..4bff068241 100644
> --- a/package/libwebsockets/libwebsockets.hash
> +++ b/package/libwebsockets/libwebsockets.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
> +sha256  6a85a1bccf25acc7e8e5383e4934c9b32a102880d1e4c37c70b27ae2a42406e1  libwebsockets-4.3.2.tar.gz
>  sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index 3a9b9ea88f..f5cde37109 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBWEBSOCKETS_VERSION = 4.3.1
> +LIBWEBSOCKETS_VERSION = 4.3.2
>  LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
>  LIBWEBSOCKETS_LICENSE = MIT with exceptions
>  LIBWEBSOCKETS_LICENSE_FILES = LICENSE
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
