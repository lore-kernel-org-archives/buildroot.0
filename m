Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B06C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 07:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DCF4408F4;
	Mon, 30 Jan 2023 07:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DCF4408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y65LyTnCo8sC; Mon, 30 Jan 2023 07:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9881140933;
	Mon, 30 Jan 2023 07:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9881140933
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBA461BF3DA
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5E5060E81
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E5060E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlyJwD37rFzr for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 07:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40F460C29
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B40F460C29
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 07:08:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 095FD5FFA7;
 Mon, 30 Jan 2023 08:08:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 Jan 2023 08:08:15 +0100
Date: Mon, 30 Jan 2023 08:08:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230130070815.GE2632@scaer>
References: <20230130042913.3605338-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130042913.3605338-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675062498;
 bh=0gpbgirH3/1XvzDCOaCOo6K6RCQU+q7DqXdvXO5w5Tw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tX3AGoTF5kqiPq/nKjV8keGgHXm2+PSuqP2+lQsRlrXl7zd1++/hn8OlHJaSkVXeI
 h4uh3IQ0bxAicd2tvdWf+5SwdiKiIqV9GgVGTFRikEGhyO9Mv2RiVGeUuTUzXFURjn
 rgOO92c21pk8TYCEAII01ALzr0aNKYJ9UgonWZE93SAeUDkUyLOoyxRT9yCzlei66K
 db1l8aNZ6pUb8/vVaM08DGHk/aGxqTjMRx625fRVs2GwuR7vg10UPdSWaDuswQMv/t
 qwS5soedJ0ljApRDkQR0AKBQXJH88pFJhkAs/hlMvP8xCOuJMhgwlzjrNklRPrgPem
 TGCce5xy70PtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tX3AGoTF
Subject: Re: [Buildroot] [PATCH 1/1] package/fxdiv: fix build without C++
 toolchain
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

James, All,

On 2023-01-29 21:29 -0700, James Hilliard spake thusly:
> The cmake project for fxdiv sets the project language to C and CXX
> even when only C is required.
> 
> Add a patch which disables CXX unless required.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/b0f/b0f3b6352429a5156a8c3a2b932331753887b65b
>  - http://autobuild.buildroot.net/results/52f/52f634c06bdfe983280a2c01bb9fec4b0e1a4b34
>  - http://autobuild.buildroot.net/results/181/181b85d9dd505693ed23fab823085b001aa785f4
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...le-CXX-unless-building-tests-benchma.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
> 
> diff --git a/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch b/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
> new file mode 100644
> index 0000000000..0336f5e1cc
> --- /dev/null
> +++ b/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
> @@ -0,0 +1,49 @@
> +From 8c2d8fc60306a8edd21182a1f5f267a7aca55763 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Sun, 29 Jan 2023 21:18:28 -0700
> +Subject: [PATCH] CMake: don't enable CXX unless building tests/benchmarks
> +
> +We only need CXX support when building tests/benchmarks.
> +
> +Fixes:
> +CMake Error at CMakeLists.txt:4 (PROJECT):
> +  No CMAKE_CXX_COMPILER could be found.
> +
> +  Tell CMake where to find the compiler by setting either the environment
> +  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
> +  to the compiler, or to the compiler name if it is in the PATH.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://github.com/Maratyszcza/FXdiv/pull/3]
> +---
> + CMakeLists.txt | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index bcae6b5..c75f558 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,7 +1,7 @@
> + CMAKE_MINIMUM_REQUIRED(VERSION 3.5 FATAL_ERROR)
> + 
> + # ---[ Project
> +-PROJECT(FXdiv C CXX)
> ++PROJECT(FXdiv C)
> + 
> + # ---[ Options.
> + OPTION(FXDIV_USE_INLINE_ASSEMBLY "Allow use of inline assembly in FXdiv" OFF)
> +@@ -16,6 +16,10 @@ ENDIF()
> + # ---[ CMake options
> + INCLUDE(GNUInstallDirs)
> + 
> ++IF(FXDIV_BUILD_TESTS OR FXDIV_BUILD_BENCHMARKS)
> ++  ENABLE_LANGUAGE(CXX)
> ++ENDIF()
> ++
> + IF(FXDIV_BUILD_TESTS)
> +   ENABLE_TESTING()
> + ENDIF()
> +-- 
> +2.34.1
> +
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
