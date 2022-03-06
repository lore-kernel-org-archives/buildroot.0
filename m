Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A3FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 21:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD16E40519;
	Sun,  6 Mar 2022 21:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KuWFmGWnqc3U; Sun,  6 Mar 2022 21:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 271E4404C7;
	Sun,  6 Mar 2022 21:24:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFB881BF2B9
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF7560B7C
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqiALti3x8EC for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 21:24:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73B1C60B6E
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 21:24:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b52b:1138:2d2c:406c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DE159B004E8;
 Sun,  6 Mar 2022 22:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646601869;
 bh=Wej0ienGE56mHnX9YL8EiQAZiLZMuZFLDKgFzgBJmps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h5GXQRAt9AIvuKuFcXBhMq7E//F5URPcqs4JeWBuFNPOPOOxtibllwvXPPA90BjPc
 kNGeGKy2lM1XLNm1vk2pDjGhz0RH/aYBl3EFHXZoGaCVOa1Ud2aKukOLdirXuUzpyB
 g36h2dwlQ2RuV6aHIs6QhgBfFCz97DwalyW3oKLCMHbydP15v4hL3jEo9y9Ju4JtVJ
 OV99w/VTOm4jLTOTOBmc5TBtoK94sWKZKSOqtamxcyrXwxKkuBw1G1Ftgxi+t0J14H
 M7hWEWGSt/H5AYpoUtivuaYowylfMhzr0CnyzvctqCKJOnSVFDkfrjjqK3r1ivBJfM
 BVLKlbHs68HUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Mar 2022 22:24:25 +0100
Date: Sun, 6 Mar 2022 22:24:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220306212425.GG228549@scaer>
References: <20220306102722.129713-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220306102722.129713-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libglfw: fix wayland build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-06 11:27 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 3.3.6 in
> commit 3cd9bb4f2a91d3739c5da96f5e4dd37d3ae13799:
> 
> CMake Error at CMakeLists.txt:252 (find_package):
>   Could not find a package configuration file provided by "ECM" with any of
>   the following names:
> 
>     ECMConfig.cmake
>     ecm-config.cmake
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0d7420aff7392c294614fd12e65ac7cd57787e98
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Fix typo in title
> 
>  ...emove-extra-cmake-modules-dependency.patch | 121 ++++++++++++++++++
>  ...xt-allow-override-of-wayland-pkgdata.patch |  32 +++++
>  package/libglfw/Config.in                     |   2 +
>  package/libglfw/libglfw.mk                    |   6 +-
>  4 files changed, 160 insertions(+), 1 deletion(-)
>  create mode 100644 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
>  create mode 100644 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
> 
> diff --git a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
> new file mode 100644
> index 0000000000..d5ee7c829a
> --- /dev/null
> +++ b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
> @@ -0,0 +1,121 @@
> +From 2747e47393cbca2d09db56223e735bd94b21e2eb Mon Sep 17 00:00:00 2001
> +From: Joel Winarske <joel.winarske@gmail.com>
> +Date: Mon, 28 Sep 2020 22:23:02 -0700
> +Subject: [PATCH] Wayland: Remove extra-cmake-modules dependency
> +
> +Fixes #1774.
> +
> +[Retrieved (and backported) from:
> +https://github.com/glfw/glfw/commit/2747e47393cbca2d09db56223e735bd94b21e2eb]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + .gitignore         |  4 ---
> + CMakeLists.txt     | 16 ++++++------
> + src/CMakeLists.txt | 62 ++++++++++++++++++++++++++++------------------
> + 3 files changed, 45 insertions(+), 37 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 42bfa1806d..394827520b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -191,20 +191,18 @@ endif()
> + # Use Wayland for window creation
> + #--------------------------------------------------------------------
> + if (_GLFW_WAYLAND)
> +-    find_package(ECM REQUIRED NO_MODULE)
> +-    list(APPEND CMAKE_MODULE_PATH "${ECM_MODULE_PATH}")
> + 
> +-    find_package(Wayland REQUIRED Client Cursor Egl)
> +-    find_package(WaylandScanner REQUIRED)
> +-    find_package(WaylandProtocols 1.15 REQUIRED)
> ++    include(FindPkgConfig)
> ++    pkg_check_modules(Wayland REQUIRED
> ++        wayland-client>=0.2.7
> ++        wayland-cursor>=0.2.7
> ++        wayland-egl>=0.2.7
> ++        xkbcommon)
> + 
> +     list(APPEND glfw_PKG_DEPS "wayland-client")
> + 
> +     list(APPEND glfw_INCLUDE_DIRS "${Wayland_INCLUDE_DIRS}")
> +-    list(APPEND glfw_LIBRARIES "${Wayland_LIBRARIES}" "${CMAKE_THREAD_LIBS_INIT}")
> +-
> +-    find_package(XKBCommon REQUIRED)
> +-    list(APPEND glfw_INCLUDE_DIRS "${XKBCOMMON_INCLUDE_DIRS}")
> ++    list(APPEND glfw_LIBRARIES "${Wayland_LINK_LIBRARIES}" "${CMAKE_THREAD_LIBS_INIT}")
> + 
> +     include(CheckIncludeFiles)
> +     include(CheckFunctionExists)
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 2f2bdd883d..e834506c6c 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -45,30 +45,44 @@ if (_GLFW_X11 OR _GLFW_WAYLAND)
> +                      posix_time.c posix_thread.c xkb_unicode.c
> +                      egl_context.c osmesa_context.c)
> + 
> +-    ecm_add_wayland_client_protocol(glfw_SOURCES
> +-        PROTOCOL
> +-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/stable/xdg-shell/xdg-shell.xml"
> +-        BASENAME xdg-shell)
> +-    ecm_add_wayland_client_protocol(glfw_SOURCES
> +-        PROTOCOL
> +-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml"
> +-        BASENAME xdg-decoration)
> +-    ecm_add_wayland_client_protocol(glfw_SOURCES
> +-        PROTOCOL
> +-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/stable/viewporter/viewporter.xml"
> +-        BASENAME viewporter)
> +-    ecm_add_wayland_client_protocol(glfw_SOURCES
> +-        PROTOCOL
> +-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/relative-pointer/relative-pointer-unstable-v1.xml"
> +-        BASENAME relative-pointer-unstable-v1)
> +-    ecm_add_wayland_client_protocol(glfw_SOURCES
> +-        PROTOCOL
> +-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml"
> +-        BASENAME pointer-constraints-unstable-v1)
> +-    ecm_add_wayland_client_protocol(glfw_SOURCES
> +-        PROTOCOL
> +-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml"
> +-        BASENAME idle-inhibit-unstable-v1)
> ++    find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
> ++    pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
> ++    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
> ++
> ++    macro(wayland_generate protocol_file output_file)
> ++          add_custom_command(OUTPUT ${output_file}.h
> ++              COMMAND ${WAYLAND_SCANNER_EXECUTABLE} client-header
> ++              < ${protocol_file} > ${output_file}.h
> ++              DEPENDS ${protocol_file})
> ++          list(APPEND glfw_SOURCES ${output_file}.h)
> ++
> ++          add_custom_command(OUTPUT ${output_file}.c 
> ++              COMMAND ${WAYLAND_SCANNER_EXECUTABLE} private-code
> ++              < ${protocol_file} > ${output_file}.c
> ++              DEPENDS ${protocol_file})
> ++          list(APPEND glfw_SOURCES ${output_file}.c)
> ++    endmacro()
> ++
> ++    set(GLFW_WAYLAND_PROTOCOL_SOURCES)
> ++    wayland_generate(
> ++        ${WAYLAND_PROTOCOLS_BASE}/stable/xdg-shell/xdg-shell.xml
> ++        ${CMAKE_BINARY_DIR}/src/wayland-xdg-shell-client-protocol)
> ++    wayland_generate(
> ++        ${WAYLAND_PROTOCOLS_BASE}/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml
> ++        ${CMAKE_BINARY_DIR}/src/wayland-xdg-decoration-client-protocol)
> ++    wayland_generate(
> ++        ${WAYLAND_PROTOCOLS_BASE}/stable/viewporter/viewporter.xml
> ++        ${CMAKE_BINARY_DIR}/src/wayland-viewporter-client-protocol)
> ++    wayland_generate(
> ++        ${WAYLAND_PROTOCOLS_BASE}/unstable/relative-pointer/relative-pointer-unstable-v1.xml
> ++        ${CMAKE_BINARY_DIR}/src/wayland-relative-pointer-unstable-v1-client-protocol)
> ++    wayland_generate(
> ++        ${WAYLAND_PROTOCOLS_BASE}/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml
> ++        ${CMAKE_BINARY_DIR}/src/wayland-pointer-constraints-unstable-v1-client-protocol)
> ++    wayland_generate(
> ++        ${WAYLAND_PROTOCOLS_BASE}/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml
> ++        ${CMAKE_BINARY_DIR}/src/wayland-idle-inhibit-unstable-v1-client-protocol)
> ++
> + elseif (_GLFW_OSMESA)
> +     set(glfw_HEADERS ${common_HEADERS} null_platform.h null_joystick.h
> +                      posix_time.h posix_thread.h osmesa_context.h)
> diff --git a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
> new file mode 100644
> index 0000000000..4bcb5e4eb7
> --- /dev/null
> +++ b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
> @@ -0,0 +1,32 @@
> +From 46aaf2b2b4d3ec240b9aad175bb3eddb6ae11ead Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 4 Mar 2022 17:59:19 +0100
> +Subject: [PATCH] src/CMakeLists.txt: allow override of wayland pkgdatadir
> +
> +Allow the user to override WAYLAND_{PROTOCOLS_BASE,CLIENT_PKGDATADIR}
> +(needed when cross-compiling)
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/glfw/glfw/pull/2053]
> +---
> + src/CMakeLists.txt | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 01f191c9..475ce882 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -75,7 +75,9 @@ if (GLFW_BUILD_WAYLAND)
> +     include(FindPkgConfig)
> +     find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
> +     pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
> +-    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
> ++    if (NOT WAYLAND_PROTOCOLS_BASE)
> ++        pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
> ++    endif()
> + 
> +     macro(wayland_generate protocol_file output_file)
> +         add_custom_command(OUTPUT "${output_file}.h"
> +-- 
> +2.34.1
> +
> diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
> index 281b55df7b..e5e96036ff 100644
> --- a/package/libglfw/Config.in
> +++ b/package/libglfw/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBGLFW
>  	bool "libglfw"
>  	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
>  	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
>  	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_XORG7
> diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
> index 2ba31fd674..0a3986f662 100644
> --- a/package/libglfw/libglfw.mk
> +++ b/package/libglfw/libglfw.mk
> @@ -29,7 +29,11 @@ LIBGLFW_DEPENDENCIES += libgles
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WAYLAND),y)
> -LIBGLFW_CONF_OPTS +=  -DGLFW_USE_WAYLAND=1
> +LIBGLFW_DEPENDENCIES += libxkbcommon wayland-protocols
> +# Override pkg-config pkgdatadir variable, it needs the prefix
> +LIBGLFW_CONF_OPTS += \
> +	-DGLFW_USE_WAYLAND=1 \
> +	-DWAYLAND_PROTOCOLS_BASE=$(STAGING_DIR)/usr/share/wayland-protocols
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
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
