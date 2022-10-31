Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A659FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE522401A2;
	Mon, 31 Oct 2022 10:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE522401A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5wIePLdezff; Mon, 31 Oct 2022 10:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4489C402AF;
	Mon, 31 Oct 2022 10:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4489C402AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 100081BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE94160B2E
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE94160B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmLM0QeCdtOp for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:58:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C511A60B33
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C511A60B33
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:58:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C6EF1B0053A;
 Mon, 31 Oct 2022 10:58:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:58:15 +0100
Date: Mon, 31 Oct 2022 10:58:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031095815.GO1058960@scaer>
References: <20221030223440.678755-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030223440.678755-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210299;
 bh=2qWkWalpjmYQZvcboJijcdYEslj7dNe1denkn3seNbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLmpvKESDLLlOUsD93YkNArUPjkEruFrAOcWdnL5aesBke8hjuUWbweiuclZNi+j6
 KLJSrO+McG4fH6PWy5HrsWFLcniBW4ywxlK43ItlfO8mCVhG1s2QbRwdlnAIp0iBU4
 ZNZbrLAlRDFzlt/j45DqSTmQ+8ADboKkmsH67zcIK0HBL6yttbrJRmcJ1Js5mrcgba
 hLYCaP9MPhmZDi8RKQcUOL0mlxEqTEfZwGRcKdhCZJyrjVhAPln/wjNv5ePTlKdf+x
 ghmSS6VUFNyZpL56G3LFs3F3kpQe6A3JRizo9SBwn/+ibigUQgtfs8dF5Q3UHODGWJ
 X41ME3zBt3NFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rLmpvKES
Subject: Re: [Buildroot] [PATCH 1/1] package/log4cxx: bump to version 0.13.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-30 23:34 +0100, Fabrice Fontaine spake thusly:
> Drop patch which was merged:
> https://github.com/apache/logging-log4cxx/commit/5240a3db1ba10e657b29c67ae8330f3a5b3d8774
> and updated:
> https://github.com/apache/logging-log4cxx/commit/b7284609ae0b6ae3798b19d3920480c4d7e670ba
> 
> https://logging.apache.org/log4cxx/latest_stable/changelog.html#0.13.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...nly-check-for-boost-if-really-needed.patch | 36 -------------------
>  package/log4cxx/log4cxx.hash                  |  4 +--
>  package/log4cxx/log4cxx.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 39 deletions(-)
>  delete mode 100644 package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch
> 
> diff --git a/package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch b/package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch
> deleted file mode 100644
> index 7df29ea120..0000000000
> --- a/package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 24e7adc8d67b3c8f7d275b4f9a7e70a61b73fcd4 Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Fri, 28 Jan 2022 13:11:01 +0100
> -Subject: [PATCH] boost-fallback: only check for boost if really needed
> -
> -- only check for boost if really needed (in case of legacy c++ standard < c++17)
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - src/cmake/boost-fallback/boost-fallback.cmake | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/src/cmake/boost-fallback/boost-fallback.cmake b/src/cmake/boost-fallback/boost-fallback.cmake
> -index 8285b0b9..0ecf8c6c 100644
> ---- a/src/cmake/boost-fallback/boost-fallback.cmake
> -+++ b/src/cmake/boost-fallback/boost-fallback.cmake
> -@@ -55,6 +55,8 @@ try_compile(STD_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tes
> - try_compile(STD_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
> -     "${CMAKE_CURRENT_LIST_DIR}/test-stdatomic.cpp")
> - 
> -+# search for boost only in case needed for legacy c++ standard < c++17
> -+if(NOT ${STD_THREAD_FOUND} OR NOT ${STD_MUTEX_FOUND} OR NOT ${STD_SHARED_MUTEX_FOUND} OR NOT ${STD_SHARED_PTR_FOUND} OR NOT ${STD_ATOMIC_FOUND})
> - find_package(Boost COMPONENTS thread)
> - if( ${Boost_FOUND} )
> -     try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
> -@@ -67,6 +69,7 @@ if( ${Boost_FOUND} )
> -     try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
> -         "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
> - endif( ${Boost_FOUND} )
> -+endif()
> - 
> - # Link the target with the appropriate boost libraries(if required)
> - function(boostfallback_link target)
> --- 
> -2.34.1
> -
> diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
> index 12633c8e57..8190f94aa3 100644
> --- a/package/log4cxx/log4cxx.hash
> +++ b/package/log4cxx/log4cxx.hash
> @@ -1,4 +1,4 @@
> -# From https://www.apache.org/dist/logging/log4cxx/0.12.1/apache-log4cxx-0.12.1.tar.gz.sha512
> -sha512  807058734cebf7c92e99484313becbc6be63e48bd930889c733318bb78dfec498b66aaa12255ed30879abb005b32e2b965f9dd87ec50d0421ca067f3f66280d9  apache-log4cxx-0.12.1.tar.gz
> +# From https://www.apache.org/dist/logging/log4cxx/0.13.0/apache-log4cxx-0.13.0.tar.gz.sha512
> +sha512  2a5f4fecc0415d942658c588774f0666082c497b6fd49bf64ab3328a997775206788c9b10a8c89208896c57da52fcc12c18d5d11ca1d3bf699e4633b8fcea6e5  apache-log4cxx-0.13.0.tar.gz
>  # Locally computed
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index d20cc792a6..f50267d737 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LOG4CXX_VERSION = 0.12.1
> +LOG4CXX_VERSION = 0.13.0
>  LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
>  LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
>  LOG4CXX_INSTALL_STAGING = YES
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
