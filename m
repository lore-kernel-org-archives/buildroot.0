Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9BAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38B6681D18;
	Sun,  9 Jan 2022 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21F7leW-8Icn; Sun,  9 Jan 2022 21:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 529D381D7C;
	Sun,  9 Jan 2022 21:00:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1711BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A40A81C56
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A66h7ZUnnmat for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C86C881D7C
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 21:00:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r10so15423108wrc.3
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 13:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1fqXf700YAVHGTFS03PhY5U4NJdlSH8tZXBO9USwBYo=;
 b=ELVAStqXWblXyzEtO2rusoLAwyGITUBdqNsrFbUQ14oJERHPFdikMVEWMK6DP+DCk8
 Y7pAzod1PhV45+hrLXJl0q8Pd6ZZRiGcDcY/qO9xJeWVMP8HYY/LaIRtNaGbMcToZPd2
 vdy53TIKgffEqml+abc/Qg6jGNhkmt4CRPtlUncypffLlXiLWl34jEpESNTNlv4M2cZy
 wrixAzvSK4E4jHZPf/6OqkmQSTPXRsrgjip9cATlJHAE5dlur4OK9lc8nkKIf7pygxIh
 FhxuWxBsSrjJtIqQLTqrx59q4fmh58IBsvrUzoY6MVZH1kOxHOeTW2RVxr/hupjhZ/vD
 WreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1fqXf700YAVHGTFS03PhY5U4NJdlSH8tZXBO9USwBYo=;
 b=zrpfmTnXrYIi9X5RiGMGbjhEnqsvQYLzGDZLfpzbSWFHKAu3g7CxT1Ol6awZ6y+f4c
 AZRPK8CSeH9wsRsWoLu4PPOFnZZvO5lb1f6rR8p6lmyM4Yz4tdVU9c0UZ3PtgQeRkdDW
 rP/009BSRjUV957hXhUw0pOI9GkGuVxcL//bRn4uf1uojnHB3VwTDdAnCUTgto6wu07G
 tkcOS7qSpYgUlpATQeMqyZzWn6LZxEv39Jf3zMgSulr5K250Mt7y5iALO4o+YTi12Pnq
 h3meTpGEOs81ECHPYsFsPqo/EvabeJ+Qml4hC+xCmqZxLfEv3gZ0uKMxJY6sHrlDog1n
 0huQ==
X-Gm-Message-State: AOAM533LVkowF71EJOS+gR8Oo6jzlw2rQwT5cFwGdm3GeK6v/b92HbPe
 sl9KB33R+bsmGG8LCn4gCuwyVQ==
X-Google-Smtp-Source: ABdhPJzg9D1W+hVG4sJPkWlDt7RQckT60CbhQtFPN4KdzYVotSHv0J4xFz/Pe+Q5EhUwjWRgV4dVJg==
X-Received: by 2002:adf:d226:: with SMTP id k6mr60702273wrh.243.1641762032915; 
 Sun, 09 Jan 2022 13:00:32 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l6sm6637394wry.18.2022.01.09.13.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 13:00:32 -0800 (PST)
Message-ID: <0945e7b9-2741-2ecc-1ad5-8fbe54c46da5@mind.be>
Date: Sun, 9 Jan 2022 22:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-7-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-7-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 06/12] package/vulkan-loader: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2021 23:28, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>    - fix license SPDX (Yann E. MORIN)
>    - add sob line
> ---
>   package/Config.in                             |  1 +
>   .../0001-loader-fix-asm_offset-call.patch     | 32 +++++++++++++++++++
>   package/vulkan-loader/Config.in               | 14 ++++++++
>   package/vulkan-loader/vulkan-loader.hash      |  3 ++
>   package/vulkan-loader/vulkan-loader.mk        | 22 +++++++++++++
>   5 files changed, 72 insertions(+)
>   create mode 100644 package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
>   create mode 100644 package/vulkan-loader/Config.in
>   create mode 100644 package/vulkan-loader/vulkan-loader.hash
>   create mode 100644 package/vulkan-loader/vulkan-loader.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9a91e6324c..86676b57ef 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -339,6 +339,7 @@ comment "Graphic libraries"
>   	source "package/sdl2_ttf/Config.in"
>   	source "package/tk/Config.in"
>   	source "package/vulkan-headers/Config.in"
> +	source "package/vulkan-loader/Config.in"
>   
>   comment "Other GUIs"
>   	source "package/qt5/Config.in"
> diff --git a/package/vulkan-loader/0001-loader-fix-asm_offset-call.patch b/package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
> new file mode 100644
> index 0000000000..d62b9390d8
> --- /dev/null
> +++ b/package/vulkan-loader/0001-loader-fix-asm_offset-call.patch
> @@ -0,0 +1,32 @@
> +From 45098898f7fa25dfd12d2c4f1aed889f678aa870 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Wed, 23 Dec 2020 14:46:02 +0100
> +Subject: [PATCH] loader: fix asm_offset call
> +
> +Disable assembler usage (not cross compile capable):
> +
> +  [ 21%] Generating gen_defines.asm
> +  /bin/sh: asm_offset: command not found
> +  make[3]: *** [loader/CMakeFiles/loader_asm_gen_files.dir/build.make:80: loader/gen_defines.asm] Error 127
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + loader/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/loader/CMakeLists.txt b/loader/CMakeLists.txt
> +index ba9f460f1..dbebfb058 100644
> +--- a/loader/CMakeLists.txt
> ++++ b/loader/CMakeLists.txt
> +@@ -187,7 +187,7 @@ else(UNIX AND NOT APPLE) # i.e.: Linux
> +     endif()
> +     set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
> +     try_compile(ASSEMBLER_WORKS ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/asm_test.S)
> +-    if(ASSEMBLER_WORKS)
> ++    if(FALSE)

  This doesn't look OK to me. With the assembler disabled, you get this warning:

Note that this may be unsafe, as the C code requires tail-call optimizations to 
remove the stack frame for certain calls. If the compiler does not do this, then 
unknown device extensions will suffer from a corrupted stack.

  Since CMake doesn't make mixed host and target compilation possible, I see two 
solutions.

1. A simple solution that is a bit of a hack. In a _PRE_BUILD_HOOK, manually 
build the asm_offset offset program. It actually needs the Vulkan headers, so we 
also need host-vulkan-headers. We would normally use host-vulkan-loader to build 
the program, but in this case it's so simple that manual compilation is much 
easier. Install the program in the source directory where it's expected. Most 
likely it will already work like that because the program is more recent than 
the source. If not, solution 2 is needed.

2. Add host-vulkan-loader to build asm_offset. Since we only need asm_offset, 
it's easier to use a generic-package rather than cmake-package - especially 
since the program doesn't get installed by cmake anyway. In this case, you'll 
need to add a new variable to CMakeLists.txt that allows to pass the path to an 
external asm_offset and point that to HOST_DIR.


  In addition, the loader only supports aarch64 and x86, so I think the whole 
package should depend on that.


  I've marked as Changes Requested.

> +         set(OPT_LOADER_SRCS ${OPT_LOADER_SRCS} unknown_ext_chain_gas.S)
> +         add_executable(asm_offset asm_offset.c)
> +         target_link_libraries(asm_offset Vulkan::Headers)
> +--
> +2.29.2
> +
> diff --git a/package/vulkan-loader/Config.in b/package/vulkan-loader/Config.in
> new file mode 100644
> index 0000000000..9c215dc9ce
> --- /dev/null
> +++ b/package/vulkan-loader/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_VULKAN_LOADER
> +	bool "vulkan-loader"
> +	depends on BR2_INSTALL_LIBSTDCPP

  AFAICS C++ is only needed for tests, so you could patch CMakeLists.txt with 
enable_language(C) and only add enable_language(CXX) if BUILD_TESTS is ON.

  Regards,
  Arnout


> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_VULKAN_HEADERS
> +	help
> +	  The Khronos official Vulkan ICD desktop loader.
> +
> +	  https://github.com/KhronosGroup/Vulkan-Loader
> +
> +comment "vulkan-loader needs a toolchain w/ C++, dynamic library, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/vulkan-loader/vulkan-loader.hash b/package/vulkan-loader/vulkan-loader.hash
> new file mode 100644
> index 0000000000..c70ed90be6
> --- /dev/null
> +++ b/package/vulkan-loader/vulkan-loader.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  e582dce35051a34af82db2a8fcd38fbc5837b4506e76e6cda685dca02dee01c7  vulkan-loader-1.2.162.tar.gz
> +sha256  43c0a37e6a0fa7ff3c843b3ec5a4fac84b712558ddac103fbd4c1649662a9ece  LICENSE.txt
> diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
> new file mode 100644
> index 0000000000..9c9ccb2458
> --- /dev/null
> +++ b/package/vulkan-loader/vulkan-loader.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# vulkan-loader
> +#
> +################################################################################
> +
> +VULKAN_LOADER_VERSION = 1.2.162
> +VULKAN_LOADER_SITE = $(call github,KhronosGroup,Vulkan-Loader,v$(VULKAN_LOADER_VERSION))
> +VULKAN_LOADER_LICENSE = Apache-2.0
> +VULKAN_LOADER_LICENSE_FILES = LICENSE.txt
> +VULKAN_LOADER_INSTALL_STAGING = YES
> +
> +VULKAN_LOADER_DEPENDENCIES = vulkan-headers
> +
> +VULKAN_LOADER_CONF_OPTS += \
> +	-DBUILD_WSI_XCB_SUPPORT=OFF \
> +	-DBUILD_WSI_XLIB_SUPPORT=OFF \
> +	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
> +	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
> +	-DUSE_CCACHE=OFF
> +
> +$(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
