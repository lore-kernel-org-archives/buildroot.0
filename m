Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D199AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 13:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B1884D16;
	Fri, 28 Jan 2022 13:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISXxInKH6MEq; Fri, 28 Jan 2022 13:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8489F82B24;
	Fri, 28 Jan 2022 13:40:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 994441BF316
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 13:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8811282B24
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 13:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mm3f1o4w28Qm for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 13:40:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B21382B1E
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643377222;
 bh=NvkbMruJdLhWBmwaNwQHnZg68t6XpZLTAJEUsIo4RBg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=a8MclhGg+5NcQTN/Ozov8O5Bx69yX3qI3XYdU9eNnPnEbZAChH3dyG+a/Bovt/oue
 W3QBhJUtHXGFvbpXykD6IC6QFAPwANHdzfqa4Gi8TsKc84n1TLPOtTgKO/ZKAviI96
 iw9AGQkC5hguiKUqhtUrCzXxMOY75tu4JZg2QV3s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.233]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1mVYIL11NP-00k4X5; Fri, 28
 Jan 2022 14:40:22 +0100
Date: Fri, 28 Jan 2022 14:40:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20220128144021.543b2a0b@gmx.net>
In-Reply-To: <20220128124538.31789-2-ps.report@gmx.net>
References: <20220128124538.31789-1-ps.report@gmx.net>
 <20220128124538.31789-2-ps.report@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:4bs9CMEdD9N6nG991k5XYzT3q2nNvj41hmKSi8kedfkgBsm9p6C
 v/+uFdzl03TSCh3LBDzxC4vvxO2Yl5vIRphAGKWIlSY3Xj4CP59EqpbEa6hPnqacJb7WGow
 pbf/Z2U7e+LNFw/NROWlB2MlixtvQbN1UrMZeQmK/yDCeSo6hi5QxGzjZ4tNCwVbm1YH24x
 6UdxSbNCZz+9w2SHiSOcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wAMCGqpweBA=:/EspMWjfNUK5Da2VOQ+erL
 a5Izlko7PHVXrkpl7qzF8V1qjol5WyVTvjxtQPCM6GV9xkD8rzHmoAtjDc1RGVgJiP+mJJQxk
 KTBl765xrSZ+q4LIj831fm6n2VkIxpXc97XVBJ4C3cqlWXHjYuV/U/Ocp+iOiyAgF3tZQUspY
 cidr6re6s41dbk6Ttfyt4io3vy3M+Yh8T8qA/YGScRiPtBC+MUDBtBbQzd+b5vHBfwgydK0VY
 7rSD3B7A4JWH0Rl4u/dt3UJO3q/X/sOpX9FLSBvIKnajHbAlxxaN89dmhnecujMvtcOKl9vhb
 Zi21s5L3ETiRyTH7FQYSnlJOJb5vqnWQUem35ErrmdGZTpThpTJbLw7X+7jTLQmw3ZazQNanZ
 Chhvtm9Od5UMpuy1RGILZNhkeFB2VwOaRQQzXFVOAqiqpx7G/zZWEYUBfZRoXNNCzxfCbxxb8
 XfIwQqUF0w56lKM+sGwl7H3lxhhlud8gXP/zdcbroDvSj00M3cQuJxfy53cyrJaHqQ2zOjffl
 x+erCHVqoNOGvYFJnzgeNXAjUy03wOtTTBSBquk/M2k56OiJxdqt1Hrp4YC3VOsyoLGbOQF+i
 1Mwy9AJOuWecABYKNbp18lqi6pquQqYerfcy9K9MNwhGDF8OySEh24geC2VGSmOeNhkpd4mKe
 Zvl3R2aOqzvoS79eLDoh9HPuu4MtrBDg2cBr9QYuxuXIjMxzw0mwsDRNML8lCGBote6jIr5L7
 rJ9/FI3viHkoRCBkWJGJXKA8UzPa9oe95WVtJUhg7/qsUvcGJ2s4qtHkA+h5LQz4L6gwU+y6N
 Utyu5RAvLL2dgrQ5+5FB9CtYaaCtQqn86Y/yeM/BJ7nv7HZlKT9BqJO2tIPQc9jFLAjaLMNP7
 Xwb85+SlFaXCpgDPyjbYIP1O8XAyLZT8kmW/rIWftl5DUnWwdKOhJBK0ZfXraTf5c6wXbxq3e
 /w0lgl/84PvV76SXbmRT8Dyr1QSzY5eZs0mT+fc+cR46ds2arsbGJ+z4bEryG5oSb9sPoPSvA
 UI89qdMy/a/ZMNRM5MKSxhXba0WLJAYj8M4gtd8ho9KhfcpkxGeluN97asJYTpRGnoYouPYR/
 fzq2ASgoSfLTFs=
Subject: Re: [Buildroot] [PATCH v1 2/3] package/log4cxx: fix boost-fallback
 (only check for boost if really needed)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jan 2022 13:45:37 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> - add patch 0002-boost-fallback-only-check-for-boost-if-really-needed.patch
>   to check for boost if really needed (in case of legacy c++ standard < c++17)
>
> Fixes:
>
>   - http://autobuild.buildroot.net/results/8d49ab7cd9952f6a13bdd330e875012d0601f1d2
>
>   -- Found Boost: .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include (found version "1.78.0") found components: thread chrono missing components: date_time atomic
>   CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
>     Target "cmTC_aac37" links to target "Boost::date_time" but the target was
>     not found.  Perhaps a find_package() call is missing for an IMPORTED
>     target, or an ALIAS target is missing?
>
>   CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
>     Target "cmTC_aac37" links to target "Boost::atomic" but the target was not
>     found.  Perhaps a find_package() call is missing for an IMPORTED target, or
>     an ALIAS target is missing?
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...nly-check-for-boost-if-really-needed.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
>
> diff --git a/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch b/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
> new file mode 100644
> index 0000000000..7df29ea120
> --- /dev/null
> +++ b/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
> @@ -0,0 +1,36 @@
> +From 24e7adc8d67b3c8f7d275b4f9a7e70a61b73fcd4 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Fri, 28 Jan 2022 13:11:01 +0100
> +Subject: [PATCH] boost-fallback: only check for boost if really needed
> +
> +- only check for boost if really needed (in case of legacy c++ standard < c++17)
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Upstream: https://github.com/apache/logging-log4cxx/pull/107

And https://patchwork.ozlabs.org/project/buildroot/patch/20211119175553.2413433-2-fontaine.fabrice@gmail.com/
for previous attempt to fix a similar/same failure...

Regards,
Peter

> +---
> + src/cmake/boost-fallback/boost-fallback.cmake | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/cmake/boost-fallback/boost-fallback.cmake b/src/cmake/boost-fallback/boost-fallback.cmake
> +index 8285b0b9..0ecf8c6c 100644
> +--- a/src/cmake/boost-fallback/boost-fallback.cmake
> ++++ b/src/cmake/boost-fallback/boost-fallback.cmake
> +@@ -55,6 +55,8 @@ try_compile(STD_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tes
> + try_compile(STD_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
> +     "${CMAKE_CURRENT_LIST_DIR}/test-stdatomic.cpp")
> +
> ++# search for boost only in case needed for legacy c++ standard < c++17
> ++if(NOT ${STD_THREAD_FOUND} OR NOT ${STD_MUTEX_FOUND} OR NOT ${STD_SHARED_MUTEX_FOUND} OR NOT ${STD_SHARED_PTR_FOUND} OR NOT ${STD_ATOMIC_FOUND})
> + find_package(Boost COMPONENTS thread)
> + if( ${Boost_FOUND} )
> +     try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
> +@@ -67,6 +69,7 @@ if( ${Boost_FOUND} )
> +     try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
> +         "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
> + endif( ${Boost_FOUND} )
> ++endif()
> +
> + # Link the target with the appropriate boost libraries(if required)
> + function(boostfallback_link target)
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
