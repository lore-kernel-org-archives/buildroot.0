Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A86AC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F290860773;
	Sun, 17 Jul 2022 13:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F290860773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xc0j_de7Z1JO; Sun, 17 Jul 2022 13:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60BA606A9;
	Sun, 17 Jul 2022 13:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D60BA606A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 103E81BF97A
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC186400DD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC186400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYMMDgBRd98q for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:23:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C80EE400F2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C80EE400F2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:23:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 16E637804FE;
 Sun, 17 Jul 2022 15:23:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:23:15 +0200
Date: Sun, 17 Jul 2022 15:23:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717132315.GK2249625@scaer>
References: <20220710180522.472809-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710180522.472809-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064198;
 bh=3cYWoqRZgEJbqqumNEYIECySYYlomLhPjCSjmlzzFfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GuONqGLdmAG1Mln42iOzdDLYaTN8gosjOPGfNzCpyXYmIxYhHfdkqoQlY3/YimoSY
 BAsXoHky287lf9TtbYIkgTq9xzymDqv+ao6QnoYVCjL3MK7zqw5UXCN3o2yDHaN9lr
 jB0Li4cRrPKqh9tywoKSmhUkqoE6tYagBH8nIyxR30x4m6c4+WQcAzL0g+XTRdS1Ce
 O28pi614RwqOncskjmaFd+ighLNNiR7fBSacohsu/jFaNRhxVrka9ij0uNooRU50zw
 mJ9VBhOxxWmRG8ps9qnmhgAr+zoI83T2J9oXvojSdQpGIJiWaY+PWAxeJyOS6OdAID
 8zZuQtMWZAtjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GuONqGLd
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.6
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

On 2022-07-10 20:05 +0200, Fabrice Fontaine spake thusly:
> Drop patch (already in version)
> 
> https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...1-CMakeLists.txt-fix-build-without-C.patch | 41 -------------------
>  package/minizip/minizip.hash                  |  2 +-
>  package/minizip/minizip.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
> 
> diff --git a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
> deleted file mode 100644
> index b0cb6a6c1e..0000000000
> --- a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 4e7899f3d0533f83b7230ffa787087b65ddd45c0 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 5 Apr 2022 18:20:14 +0200
> -Subject: [PATCH] CMakeLists.txt: fix build without C++
> -
> -Fix the following build failure without a working C++ compiler raised
> -since version 2.0.0 and
> -https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:
> -
> -CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
> -  The C++ compiler
> -
> -    "/usr/bin/c++"
> -
> -  is not able to compile a simple test program.
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/zlib-ng/minizip-ng/pull/621]
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index fef46c3..83adaf3 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -661,7 +661,7 @@ endif()
> - list(APPEND MINIZIP_INC ${CMAKE_CURRENT_SOURCE_DIR})
> - 
> - # Create minizip library
> --project(minizip${MZ_PROJECT_SUFFIX} VERSION ${VERSION})
> -+project(minizip${MZ_PROJECT_SUFFIX} LANGUAGES C VERSION ${VERSION})
> - 
> - if(NOT ${MZ_PROJECT_SUFFIX} STREQUAL "")
> -     message(STATUS "Project configured as ${PROJECT_NAME}")
> --- 
> -2.35.1
> -
> diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
> index e73637670c..0c6e218488 100644
> --- a/package/minizip/minizip.hash
> +++ b/package/minizip/minizip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  1a248c378fdf4ef6c517024bb65577603d5146cffaebe81900bec9c0a5035d4d  minizip-3.0.5.tar.gz
> +sha256  383fa1bdc28c482828a8a8db53f758dbd44291b641182724fda5df5b59cce543  minizip-3.0.6.tar.gz
>  sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
> diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
> index b9259f0c54..61936e0568 100644
> --- a/package/minizip/minizip.mk
> +++ b/package/minizip/minizip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MINIZIP_VERSION = 3.0.5
> +MINIZIP_VERSION = 3.0.6
>  MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
>  MINIZIP_DEPENDENCIES = host-pkgconf
>  MINIZIP_INSTALL_STAGING = YES
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
