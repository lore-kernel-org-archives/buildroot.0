Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0258EC7EE23
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 10:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D41B41904;
	Sun,  4 Jun 2023 10:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D41B41904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rllJ11b3lKJL; Sun,  4 Jun 2023 10:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 108B941907;
	Sun,  4 Jun 2023 10:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 108B941907
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 321B71BF3B5
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10A8C60A9A
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10A8C60A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KstAXWP1Bq7r for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 10:26:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77E4C60A81
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77E4C60A81
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 10:26:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:8434:364d:2728:8930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 583F67804FD;
 Sun,  4 Jun 2023 12:26:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Jun 2023 12:26:07 +0200
Date: Sun, 4 Jun 2023 12:26:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230604102607.GC3340@scaer>
References: <20230603221612.292994-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230603221612.292994-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1685874373;
 bh=qfpkU7871x/bGGyofGqmohG0q20PEoupsbD1sIhotn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=awZm69MHsLDGhqvT+PbPc2o62eyoZkSXwvoiD32l4k/VuHlxcOjX7dakikNoZVbGb
 +US1LxwLAt7+r5Hiz1/KVxUHTkNnMGUylILOKRFO1utJlTPFvUsvg3eNPHHW9djvBI
 h61fXd619ZSzKR02beRPoC1nDJ29vKXMaPhJpdNqsDwpLccX0KqENlsCt1cqdayMg4
 lYLZvB+VqVjZiZcOKcH3X29KQ0niIXE+qckKJvfBMiRa0gf3Xrw1qv0pEkobpnO26P
 Ob5l9JNE9C+xqXlkDwJ0/eCeysa96+W21ITxtojdLwWnwX0My0Eq9A9T9sRqJ4bKc2
 XhsMzn14FWXTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=awZm69MH
Subject: Re: [Buildroot] [RFC] support/dependencies: introduce
 BR2_HOST_CMAKE_AT_LEAST
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2023-06-04 00:16 +0200, Romain Naour spake thusly:
> libjxl requires cmake 3.19 since version v0.7 due to the
> new behavior of cmake [1].

This needs to be split in two:
 1. add the host-cmake versions
 2. fix libjxl to select the required version

This needs a more detailed commit log, please. ;-)

For example:

    Some packages (e.g. libjxl) requires a quite recent cmake version,
    that is not yet available in most distributions, especially those
    LTS versions.

    Currently, when we bump the minum cmake version we require, it gets
    bumped for all packages, regardless of their own minimum required
    version, which means that a given configuration will trigger the
    build of our host-cmake even if the packages that require it are not
    enabled and those that are would be content with the system-provided
    cmake.

    Since host-cmake can take quite some time to build, this can get a
    bit annoying to pay the price of a host-cmake build that would
    otherwise not be needed.

    We intriduce config options that packages can select to indicate
    what minimal cmake version they require, and use that version as the
    required minimal version required by the current configuration [0].

    We would like to ensure that the currently selected minimum cmake
    version is indeed lower (or equal) to the cmake version we package,
    but that is not possible: dependencies.mk is parsed before we parse
    packages, so we do not yet know the cmake version we have, and we
    can't invert the parsing order as we need to know the requires
    dependencies before we parse packages (so that we can build their
    dependency rules in Makefile). So we can only add comments in both
    places, that refer to the other location.

    [0] note that this is yet not optimal, as in such a case, host-cmake
    would be in the dependency chain of all cmake-based packages, even
    for those packages that do not require it. The optimum would be for
    each package to gain such a dependency on an as-needed basis, but
    this is by far more complex to achieve, and would only speed up
    cases where a single package is built from scratch (e.g. with:
    make clean; make foo), which is not worth optimising (yet?)

> -- Configuring done
> CMake Error at cmake/FindLCMS2.cmake:40 (add_library):
>   INTERFACE_LIBRARY targets may only have whitelisted properties.  The
>   property "INCLUDE_DIRECTORIES" is not allowed.
> Call Stack (most recent call first):
>   third_party/CMakeLists.txt:114 (find_package)
> 
> The portability issue has already been reported upstream [2].

This part above would have to be moved into the commit that change
libjxl to request host-cmake 3.22.

> host-cmake is know to take a long time to build and we want
> to avoid bumping BR2_CMAKE_VERSION_MIN only for one package.
> As discussed on the mailing list [3] introduce
> BR2_HOST_CMAKE_AT_LEAST_X_Y selected by package that
> requires a higher cmake version than the one provided by
> the host.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095
> 
> [1] https://gitlab.kitware.com/cmake/cmake/-/commit/afb998704e67d3d3ce5b24c112cb06e770fca78d
> [2] https://github.com/libjxl/libjxl/issues/1425
> [3] http://lists.busybox.net/pipermail/buildroot/2023-June/668287.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Julien Olivain <ju.o@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/cmake/Config.in.host             | 31 ++++++++++++++++++++++++
>  package/cmake/cmake.mk                   |  1 +
>  package/libjxl/Config.in                 |  1 +
>  support/dependencies/check-host-cmake.mk | 12 +++++----
>  4 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
> index b2e210ee2c..fe5640088e 100644
> --- a/package/cmake/Config.in.host
> +++ b/package/cmake/Config.in.host
> @@ -9,3 +9,34 @@ config BR2_PACKAGE_HOST_CMAKE
>  	  the compiler environment of your choice.
>  
>  	  http://www.cmake.org/
> +
> +# The latest version in this list must match the one provided by host-cmake.
> +config BR2_HOST_CMAKE_AT_LEAST_3_18 # Debian bullseye provide cmake 3.18.x
> +	bool
> +	default y

There is no need for this symbol, if...

> +config BR2_HOST_CMAKE_AT_LEAST_3_19
> +	bool
> +	select BR2_HOST_CMAKE_AT_LEAST_3_18
> +
> +config BR2_HOST_CMAKE_AT_LEAST_3_20
> +	bool
> +	select BR2_HOST_CMAKE_AT_LEAST_3_19
> +
> +config BR2_HOST_CMAKE_AT_LEAST_3_21
> +	bool
> +	select BR2_HOST_CMAKE_AT_LEAST_3_20
> +
> +config BR2_HOST_CMAKE_AT_LEAST_3_22
> +	bool
> +	select BR2_HOST_CMAKE_AT_LEAST_3_21
> +
> +# This order guarantees that the highest version is set, as kconfig
> +# stops affecting a value on the first matching default.
> +config BR2_HOST_CMAKE_AT_LEAST
> +	string
> +	default "3.22"	if BR2_HOST_CMAKE_AT_LEAST_3_22
> +	default "3.21"	if BR2_HOST_CMAKE_AT_LEAST_3_21
> +	default "3.20"	if BR2_HOST_CMAKE_AT_LEAST_3_20
> +	default "3.19"	if BR2_HOST_CMAKE_AT_LEAST_3_19
> +	default "3.18"	if BR2_HOST_CMAKE_AT_LEAST_3_18

... you remove the conditional here, e.g. just:

    default "3.18"

And I prefer that there is always a non-conditional default.

In which case the first comment would change to:

    # The minimum system cmake version we expect if 3.18 as provided by
    # Debian bullseye, that we use in our reference build docker image.

> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index dc92c8bb4e..b99877696a 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
>  CMAKE_VERSION_MAJOR = 3.22
>  CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
> diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
> index da04b89f9b..923560298f 100644
> --- a/package/libjxl/Config.in
> +++ b/package/libjxl/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBJXL
>  	# libjxl fail to link statically due to libatomic issue
>  	depends on !BR2_STATIC_LIBS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_81426
> +	select BR2_HOST_CMAKE_AT_LEAST_3_19

As suggested above, this needs to be in a separate patch.

Otherwise, this is a very good idea, much simpler than what I was
thinking about (i.e. having each package depend on their required
version).

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_BROTLI
>  	select BR2_PACKAGE_HIGHWAY
>  	select BR2_PACKAGE_LCMS2
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 5760e4ded1..e367690319 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -1,9 +1,11 @@
> -# Set this to either 3.18 or higher, depending on the highest minimum
> -# version required by any of the packages bundled in Buildroot. If a
> -# package is bumped or a new one added, and it requires a higher
> -# version, our cmake infra will catch it and build its own.
> +# The cmake minimum version is set to either 3.18 or higher,
> +# depending on the highest minimum version required by any
> +# of the packages bundled in Buildroot. If a package is
> +# bumped or a new one added, and it requires a higher
> +# cmake version than the one provided by the host, our
> +# cmake infra will catch it and build its own.
>  #
> -BR2_CMAKE_VERSION_MIN = 3.18
> +BR2_CMAKE_VERSION_MIN = $(BR2_HOST_CMAKE_AT_LEAST)
>  
>  BR2_CMAKE_CANDIDATES ?= cmake cmake3
>  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> -- 
> 2.34.3
> 

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
