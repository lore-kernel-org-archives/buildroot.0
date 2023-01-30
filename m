Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED43C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 07:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F80B60DC2;
	Mon, 30 Jan 2023 07:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F80B60DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nJoJfKP3pfW; Mon, 30 Jan 2023 07:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644B960D52;
	Mon, 30 Jan 2023 07:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644B960D52
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B98E51BF3DA
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A049540919
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A049540919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xi7MDawD2ikS for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 07:08:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B77408F4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10B77408F4
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 07:08:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 29CB95FFA0;
 Mon, 30 Jan 2023 08:07:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 Jan 2023 08:07:57 +0100
Date: Mon, 30 Jan 2023 08:07:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230130070757.GD2632@scaer>
References: <20230130041009.3531224-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130041009.3531224-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675062480;
 bh=YduqvsR198a58aALiYtQgaU6OAN4vNgTduiMI+HsFa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YSML0PelAwYcjD33dHTvNYzA91ydhNjgK25W68OSox19pOxIgQp19ZOTevzL3bEJv
 N0M5fcfv+hJiFN3tJWEwR3JNq8LVKzEu+kDuSIR5yZeiVRBTVLPY8guyDext1vURvm
 t4mNDaeKw5GwTJll6BckLn9F40HglmqvilJshBZVGLtjBNoaZ6/iFug2Kb5uhDggxe
 O2CArF9c2PGECR+jcwZrhjE6UWCLe8Q/8FNySUeKdj61wEkPsGuvcUJ5w0+f+isYV9
 m0BIRO2xKwNb6seaQFcS7RRExG06dstlFwUsZ5//xjr/zz75pq+5IdiSWwK2fx83OA
 wgVDw2sTyo9WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YSML0Pel
Subject: Re: [Buildroot] [PATCH 1/1] package/neon-2-sse: fix build without
 C++ toolchain
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

On 2023-01-29 21:10 -0700, James Hilliard spake thusly:
> The cmake project for neon-2-sse doesn't correctly set the project
> language to C which causes cmake to try and detect a C++ compiler.
> 
> Add a patch which fixes the project language setting.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/0eb/0ebb8c886e0a432b6fb43ab21010f625f6797b9e
>  - http://autobuild.buildroot.net/results/a5d/a5db2f286dbd69e84d518d086df857ef434b936a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../neon-2-sse/0001-Fix-cmake-languages.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/neon-2-sse/0001-Fix-cmake-languages.patch
> 
> diff --git a/package/neon-2-sse/0001-Fix-cmake-languages.patch b/package/neon-2-sse/0001-Fix-cmake-languages.patch
> new file mode 100644
> index 0000000000..e0becb1ffa
> --- /dev/null
> +++ b/package/neon-2-sse/0001-Fix-cmake-languages.patch
> @@ -0,0 +1,40 @@
> +From 186ec82e033d8c718d760d14945535a9d7e160fd Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Sun, 29 Jan 2023 21:00:27 -0700
> +Subject: [PATCH] Fix cmake languages
> +
> +When no language is set cmake defaults to C and CXX, since we support
> +C by itself we should set the project language to C so that we don't
> +get a compiler error when building without a CXX toolchain.
> +
> +Fixes:
> +CMake Error at CMakeLists.txt:5 (project):
> +  No CMAKE_CXX_COMPILER could be found.
> +
> +  Tell CMake where to find the compiler by setting either the environment
> +  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
> +  to the compiler, or to the compiler name if it is in the PATH.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://github.com/intel/ARM_NEON_2_x86_SSE/pull/62]
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index e4b8980..8f58e79 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -2,7 +2,7 @@
> + # Modification: Copyright (C) 2017 David Hirvonen
> + 
> + cmake_minimum_required(VERSION 3.0)
> +-project(NEON_2_SSE VERSION 1.0.0)
> ++project(NEON_2_SSE VERSION 1.0.0 LANGUAGES C)
> + 
> + add_library(${PROJECT_NAME} INTERFACE)
> + 
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
