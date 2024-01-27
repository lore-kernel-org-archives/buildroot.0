Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96F8C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70695418F6;
	Sat, 27 Jan 2024 16:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70695418F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gefv7w-Fw_hF; Sat, 27 Jan 2024 16:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8834F418E4;
	Sat, 27 Jan 2024 16:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8834F418E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE32B1BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7D1260BAF
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7D1260BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPOMJAduATon for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:44:44 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF16860745
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF16860745
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 13DF013F838;
 Sat, 27 Jan 2024 17:44:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 17:44:40 +0100
Date: Sat, 27 Jan 2024 17:44:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZbUy-BhrFN161cf5@landeda>
References: <20240120132840.3274187-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240120132840.3274187-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706373883;
 bh=iIctMMlqMW1ovJ517PUin2wMOL2sKOOei6SEL8EKIiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6ZcYh+eLID3l348ng0qYszZ7QgXEpkvUltzkUIMdblqXYvvynLJ3lLQdYna9rge5
 ZXNIVmHq0nqZDptzatcGAUq9y75jJs6RaQ4A3LpHOSkfmveuke3pdWrO+ypTcQb6iE
 ZzwBqEtky4Oj3EkVSIAEGfM5XssGmD6yWIVJ29TmO9G8mp57Kxun7xJiy4/F/n194/
 4p+ICor41QragIvoHWJSy6jE2X9ZhozuX9uIyKRbGwveX8KtrQ/+XU6h1Q1sur65x+
 ataZhsY9yvUBgyCQ8HVzZHourvNseO4cLLP56ZZSZ+82r1LVX8EJu27NEKGPeYw14a
 NHZH6T7MpwOyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n6ZcYh+e
Subject: Re: [Buildroot] [PATCH] package/hiredis: do not install nuget
 packaging file
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-01-20 14:28 +0100, Yann E. MORIN spake thusly:
> The NuGet packaging description file is installed as:
>     $(DEST_DIR)/build/native/hiredis.targets
> 
> This is a sprurious file that has nothing to do on a Linux system,
> whether that be in host/, staging/, or target/.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ption-to-not-install-NuGet-packaging.patch | 51 +++++++++++++++++++
>  package/hiredis/hiredis.mk                    |  4 +-
>  2 files changed, 53 insertions(+), 2 deletions(-)
>  create mode 100644 package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
> 
> diff --git a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
> new file mode 100644
> index 0000000000..3997e78a07
> --- /dev/null
> +++ b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
> @@ -0,0 +1,51 @@
> +From 3b7956ef4140df78cb65e253744782587e3b66e4 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Sat, 20 Jan 2024 13:53:39 +0100
> +Subject: [PATCH] CMakeList: add option to not install NuGet packaging
> +
> +The NuGet hiredis.target packaging description file is of no use on
> +systems that are not using NuGet, like Linux systems, and the spurious
> +presence of that file is not "clean".
> +
> +Add a cmake option to allow users to disable installation of that file.
> +As some people may have relied on that file to be installed, continue to
> +install it by default.
> +
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +Upstream: https://github.com/redis/hiredis/pull/1246

The patch was accepted upstream, so: applied to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + CMakeLists.txt | 11 ++++++++---
> + 1 file changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index b7d6ee8..0fcf29b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -6,6 +6,9 @@ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
> + OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
> + OPTION(ENABLE_EXAMPLES "Enable building hiredis examples" OFF)
> + OPTION(ENABLE_ASYNC_TESTS "Should we run all asynchronous API tests" OFF)
> ++# Historically, the NuGet file was always install; default
> ++# to ON for those who rely on that historical behaviour.
> ++OPTION(ENABLE_NUGET "Install NuGET packaging details" ON)
> +
> + MACRO(getVersionBit name)
> +   SET(VERSION_REGEX "^#define ${name} (.+)$")
> +@@ -105,9 +108,11 @@ if (MSVC AND BUILD_SHARED_LIBS)
> +         CONFIGURATIONS Debug RelWithDebInfo)
> + endif()
> +
> +-# For NuGet packages
> +-INSTALL(FILES hiredis.targets
> +-    DESTINATION build/native)
> ++if (ENABLE_NUGET)
> ++    # For NuGet packages
> ++    INSTALL(FILES hiredis.targets
> ++        DESTINATION build/native)
> ++endif()
> +
> + INSTALL(FILES hiredis.h read.h sds.h async.h alloc.h sockcompat.h
> +     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/hiredis)
> +--
> +2.43.0
> +
> diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
> index a7a6d639e6..476b079336 100644
> --- a/package/hiredis/hiredis.mk
> +++ b/package/hiredis/hiredis.mk
> @@ -12,8 +12,8 @@ HIREDIS_LICENSE_FILES = COPYING
>  HIREDIS_CPE_ID_VENDOR = redislabs
>  HIREDIS_INSTALL_STAGING = YES
>  
> -HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
> -HOST_HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
> +HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON
> +HOST_HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
>  
>  # Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
>  # resulting in build failures when linking.
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
