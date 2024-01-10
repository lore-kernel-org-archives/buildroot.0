Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3202C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81E20436FF;
	Wed, 10 Jan 2024 21:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E20436FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqVjsugOXKk9; Wed, 10 Jan 2024 21:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BE9843715;
	Wed, 10 Jan 2024 21:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BE9843715
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0467F1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C863042419
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C863042419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Obi8v-VtF0lG for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:37:38 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67E7141E25
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E7141E25
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 77349B0055A;
 Wed, 10 Jan 2024 22:37:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 22:37:33 +0100
Date: Wed, 10 Jan 2024 22:37:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZZ8OHQPdLpdzTiig@landeda>
References: <20240106230132.423302-1-adam.duskett@amarulasolutions.com>
 <20240106230132.423302-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240106230132.423302-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704922655;
 bh=p3Moyf0B3JyfB8UrDyV4sscF/v4oy80Kdpq26CwPCyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K1/UhxhXqful68cx41fr1CB7YcQIjwsBVY7CjLRyuDL1vr/UHG3dmt3gCh1cHFotC
 DfDJw3Vh8mIWbnDOj0Ia9n/MBN5dnXz8wKPWsY0iEKKTD+YAq501IEKJ8Z1OYClS8p
 NShoeKsTNVw4YPpKZU7e05moHYvLQKwryaM4nyPkkEVxAJbR5+CR2NU3tra4A+2x9S
 JlyWm4auj6uLjRMU1aHtcr6D+UZb4ZZf4dlzxTZ8yIEzp8Ce8hO4W+F++LRjw7QRMA
 gJgVuaNorIdgJM7UGUFFkq2cQ/MxmJ4v16BXj4b62VrknB4Lh+D6mzZmjK2ocMreaF
 1fMPRSc3klrVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K1/UhxhX
Subject: Re: [Buildroot] [PATCH v6] package/ivi-homescreen: new package
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

ADam, All,

On 2024-01-06 16:01 -0700, Adam Duskett spake thusly:
> Much like flutter-pi, this package is a Flutter embedder used to run Flutter
> applications. However, unlike Flutter-pi, this package requires a Wayland
> compositor to run, which flutter-pi does not support. Furthermore, flutter-pi
> lacks several plugins and features that ivi-homescreen supports, such as:
[--SNIP--]
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
> new file mode 100644
> index 0000000000..c59ff09a51
> --- /dev/null
> +++ b/package/ivi-homescreen/Config.in
> @@ -0,0 +1,268 @@
> +menuconfig BR2_PACKAGE_IVI_HOMESCREEN
> +	bool "ivi-homescreen"
> +	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS

That dependency was missing on the comments, so I propagated there.

> +	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # # flutter-engine
> +	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
> +	depends on !BR2_STATIC_LIBS # flutter-engine, wayland
> +	depends on BR2_USE_WCHAR # flutter-engine
> +	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine

I've reordered the dependency in a more logical way (like host gcc-5 and
target gcc-5 together).

I also dropped the NPTL requirement, as it is implied by glibc. I see
that you did propagate the dependency from flutter-engine, but it needs
to be fixed there as well (I missed that when applying flutter-engine).

[--SNIP--]
> +config BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL_CLIENT
> +	bool "ivi-shell client"
> +	select BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT

    $ ./utils/docker-run make check-package
    package/ivi-homescreen/Config.in:37: BR2_PACKAGE_IVI_HOMESCREEN_HAS_CLIENT referenced but not defined

I guess that's because you initially followed ny suggestion on how to
handle the clients, but then changed your mind and dropped the options.
I fixed that when applying.

[--SNIP--]
> diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
> new file mode 100644
> index 0000000000..a0d0162948
> --- /dev/null
> +++ b/package/ivi-homescreen/ivi-homescreen.hash
> @@ -0,0 +1,21 @@
> +# Locally calculated
> +sha256  1ab2e7ab5f947482cb5529dbb6392e7e1945ceb0b593abde6b6279d7bd2fdb79  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-br1.tar.gz
> +
> +# Apache-2.0
> +sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
> +sha256  943c358cb6d086e4bc0937941b8f8d766db7d4e5f06583efd45dca0ca6a645f3  third_party/filament/libs/bluevk/include/bluevk/BlueVK.h
> +
> +# BSD-3-Clause
> +sha256  fdff25c8a4147791114584a45d56621336d294601da77656e83504a71747c8c2  third_party/flutter/shell/platform/common/client_wrapper/core_implementations.cc
> +
> +# BSD-Style
> +sha256  baa98cbcc03e3e745c4ad9ac2d3fb3464424486b2e420081181013034a7e6406  third_party/flutter/third_party/dart/runtime/include/dart_api.h
> +
> +# BSL-1.0
> +sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  third_party/asio-1-28-1/asio/LICENSE_1_0.txt
> +
> +# MIT
> +sha256  240f786071b64c28c0a1dae3e3b05fc3ca93fa4882b1e36e56ee49fee3037b0a  third_party/flutter/third_party/rapidjson/include/rapidjson/rapidjson.h
> +sha256  4b67e7ae8c91e68e1a929eb1cbaa4c773c6d19aa91aaa12c390cf9560d1c9799  third_party/sanitizers-cmake/LICENSE
> +sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  third_party/spdlog-1.12.0/LICENSE
> +sha256  8b79f17fa7cf47adeeb8277965267e3932155fdfcab81a0ed5d583438bdf9135  third_party/weston/protocol/ivi-application.xml

Good idea to group the licenses by category.

> diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
> new file mode 100644
> index 0000000000..1fe4f09f9e
> --- /dev/null
> +++ b/package/ivi-homescreen/ivi-homescreen.mk
> @@ -0,0 +1,135 @@
> +################################################################################
> +#
> +# ivi-homescreen
> +#
> +################################################################################
> +
> +IVI_HOMESCREEN_VERSION = 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
> +IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
> +IVI_HOMESCREEN_SITE_METHOD = git
> +IVI_HOMESCREEN_LICENSE = Apache-2.0, BSD-3-Clause, BSD-Style, BSL-1.0, MIT
> +
> +IVI_HOMESCREEN_LICENSE_FILES = \
> +	LICENSE \
> +	third_party/asio-1-28-1/asio/LICENSE_1_0.txt \
> +	third_party/filament/libs/bluevk/include/bluevk/BlueVK.h \
> +	third_party/flutter/shell/platform/common/client_wrapper/core_implementations.cc \
> +	third_party/flutter/third_party/dart/runtime/include/dart_api.h \
> +	third_party/flutter/third_party/rapidjson/include/rapidjson/rapidjson.h \
> +	third_party/sanitizers-cmake/LICENSE \
> +	third_party/spdlog-1.12.0/LICENSE \
> +	third_party/weston/protocol/ivi-application.xml

I fixed the order to match that of the hash file, and adding a little
comment stating so.

Applied to master with the minor nits above fixed, thanks.

Regards,
Yann E. MORIN.

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
