Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB6EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 20:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C399D400CE;
	Wed, 22 Dec 2021 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0i6g3C0MVF8b; Wed, 22 Dec 2021 20:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D49240579;
	Wed, 22 Dec 2021 20:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2074B1BF20B
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 20:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E77140579
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 20:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCks_Ohr-vWt for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 20:59:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 863FB400CE
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 20:59:49 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id o20so13282650eds.10
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 12:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ssuf55+2zvKPN1jG5nwyEfdzBny2RBMWJSjRHjzgqIU=;
 b=cROD/tsrzOGGSoTM2eSuvZkFOZ15S7AjqmmurcGNCPJK9mhUJajLY9pc6Ux+YTQswG
 FlIvzl6YAeJ9z/17dkv/Q/5d337TdvVxlVRm2u0dLhE0vN6HxdGIp+j6/YW/1aw8qJm2
 ElyVLjt1BNOYc9NiFOxyo06doPEAIwxXQBiwMxGum+0/HwxiuDfhKk9DvC9nOdRSNPrq
 S7rxvC3wtiWS0OsKgFBj+g5ERYK2QxpCOMEj6KPWtv5TaRt2EGOJFIGs43gzi57NBj5p
 FlJ8GY5dh86m4zQZSegBLfuA1QQTgP3RSAL0BqQ3b0g4Ow626fVbkClEpDBjoVomrL20
 bN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ssuf55+2zvKPN1jG5nwyEfdzBny2RBMWJSjRHjzgqIU=;
 b=TJecjQMCEoclT1haOKclFPvyo2w77DCjPyA4q/j9ZPWBTlxh02BfU2n7Z1O/9hKqoc
 FFOzIJD1HAToO+o3WZVO+zaVfppy+msz8bqEAUkE3wN9C+3c1DiJeDMAtWFAkKWMpKzq
 1stKBUfhSc8rb5rbHsEeiebWgWA9JhRw/YjhK5juY9xWIltVol/EVKN6kiuc9k2fNtnO
 Xto7EJO62yDeoNjHd9v8PJSDZT17loQUw6UuBq1czbZZyfV9UBBvLGDYyXJYG2H9Qfrd
 sj31s6KmuNgRuV4KT9yRAYdRY/LfnQqpX/C8MaVVRpl6VfeUGIF/sF6iSEFnRP1ePiUp
 Jzow==
X-Gm-Message-State: AOAM533apQR7v1mYCf8KHtJ8URgmMfPi1unBR8Pa0rVPKkITbBmqCMIG
 xKBW1gibycJ1Homn2JWwYlGpG3pL04oiUg==
X-Google-Smtp-Source: ABdhPJyQdUs6uauZcX2VzSLAp7qJOgZjlDep4/7aTOSZ3hif14ks7w+dt6uNYgkAdbWg5cBtvM15TQ==
X-Received: by 2002:a17:906:4796:: with SMTP id
 cw22mr3909669ejc.594.1640206787616; 
 Wed, 22 Dec 2021 12:59:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r8sm286457edd.74.2021.12.22.12.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 12:59:47 -0800 (PST)
Message-ID: <3eaacf7b-c7a8-68c7-8bd9-f5cda43bd0da@mind.be>
Date: Wed, 22 Dec 2021 21:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210428224816.3947926-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210428224816.3947926-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH v3] package/ogre: bump to version 1.12.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/04/2021 00:48, Romain Naour wrote:
> Remove upstream patch [1].
> 
> tinyxml has been replaced by pugixml [2].
> 
> Switch to git download method since github release without
> the complete source code in the tarball [3].
> 
> Update indentation of hash file (two spaces).
> 
> Previous ogre version unconditionally include <sys/sysctl.h>
> header that has been removed from glibc since 2.32.
> This has been fixed since Ogre 1.12.7 [4].
> 
> [1] https://github.com/OGRECave/ogre/commit/de4d5c920e23e1e2b21dc5c8192ef74ba6210cca
> [2] https://github.com/OGRECave/ogre/commit/338103324096b78ae4718f97ac2150c4bb98c2d1
> [3] https://github.com/OGRECave/ogre/issues/1332#issuecomment-563189058
> [4] https://github.com/OGRECave/ogre/commit/8ec086e9bc2e24fab373b514c572483b69071d69
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

  Congratulations for winning the 20 years of Buildroot quiz!

  Regards,
  Arnout

> ---
> v3: improve commit log.
>      bump ogre 1.12.12
> ---
>   ...ompiledHeader.cmake-Add-c-argument-t.patch | 57 -------------------
>   package/ogre/Config.in                        |  1 +
>   package/ogre/ogre.hash                        |  4 +-
>   package/ogre/ogre.mk                          | 14 +++--
>   4 files changed, 13 insertions(+), 63 deletions(-)
>   delete mode 100644 package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch
> 
> diff --git a/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch b/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch
> deleted file mode 100644
> index 97f4e24890..0000000000
> --- a/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From f480ac538eb69086d4b7db855c2a457d5d6420d4 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 10 Feb 2020 14:05:12 +0100
> -Subject: [PATCH] CMake/Utils/PrecompiledHeader.cmake: Add -c argument to build
> - precompiled headers
> -
> -Add "-c" argument when building precompiled headers to fix build with
> -RELRO.
> -
> -More information on a similar issue with domoticz can be found here:
> -https://patchwork.ozlabs.org/patch/1187328:
> -
> -"The problem AFAICS is that if no -c or similar option is given, GCC
> -decides what needs to be done based on the rest of the arguments. If the
> -rest of the arguments include a -Wl,... option, it decides that linking
> -needs to be done. If the rest of the arguments are just header files, it
> -decides to create a precompiled header."
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/8fabf8d270b9257c3a9db6a2f17f1c08ec9428d3
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream: https://github.com/OGRECave/ogre/commit/de4d5c920e23e1e2b21dc5c8192ef74ba6210cca]
> ----
> - CMake/Utils/PrecompiledHeader.cmake | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMake/Utils/PrecompiledHeader.cmake b/CMake/Utils/PrecompiledHeader.cmake
> -index a02d99acd..bfb0059db 100644
> ---- a/CMake/Utils/PrecompiledHeader.cmake
> -+++ b/CMake/Utils/PrecompiledHeader.cmake
> -@@ -133,11 +133,11 @@ MACRO(_PCH_GET_COMPILE_COMMAND out_command _input _output)
> -             STRING(REGEX REPLACE "^ +" "" pchsupport_compiler_cxx_arg1 ${CMAKE_CXX_COMPILER_ARG1})
> -
> -             SET(${out_command}
> --              ${CMAKE_CXX_COMPILER} ${pchsupport_compiler_cxx_arg1} ${_compile_FLAGS} -x c++-header -o ${_output} ${_input}
> -+              ${CMAKE_CXX_COMPILER} ${pchsupport_compiler_cxx_arg1} ${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}
> -               )
> -         ELSE(CMAKE_CXX_COMPILER_ARG1)
> -             SET(${out_command}
> --              ${CMAKE_CXX_COMPILER}  ${_compile_FLAGS} -x c++-header -o ${_output} ${_input}
> -+              ${CMAKE_CXX_COMPILER}  ${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}
> -               )
> -         ENDIF(CMAKE_CXX_COMPILER_ARG1)
> -     ELSE(CMAKE_COMPILER_IS_GNUCXX)
> -@@ -291,7 +291,7 @@ MACRO(ADD_PRECOMPILED_HEADER _targetName _input)
> -     set_target_properties(${_targetName}_pch_dephelp PROPERTIES INCLUDE_DIRECTORIES "${DIRINC}")
> -
> -     #MESSAGE("_compile_FLAGS: ${_compile_FLAGS}")
> --    #message("COMMAND ${CMAKE_CXX_COMPILER}	${_compile_FLAGS} -x c++-header -o ${_output} ${_input}")
> -+    #message("COMMAND ${CMAKE_CXX_COMPILER}	${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}")
> -
> -     ADD_CUSTOM_COMMAND(
> -       OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${_name}"
> ---
> -2.24.1
> -
> diff --git a/package/ogre/Config.in b/package/ogre/Config.in
> index 1d7784714d..7d57d3f82a 100644
> --- a/package/ogre/Config.in
> +++ b/package/ogre/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_OGRE
>   	depends on BR2_USE_WCHAR # use wchar_t
>   	select BR2_PACKAGE_FREETYPE
>   	select BR2_PACKAGE_LIBFREEIMAGE
> +	select BR2_PACKAGE_PUGIXML
>   	select BR2_PACKAGE_SDL2
>   	select BR2_PACKAGE_SDL2_OPENGL
>   	select BR2_PACKAGE_SDL2_X11 # use wmInfo.info.x11
> diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
> index 8bb4ae96a1..0028a4b97c 100644
> --- a/package/ogre/ogre.hash
> +++ b/package/ogre/ogre.hash
> @@ -1,3 +1,3 @@
>   # sha256 locally computed
> -sha256 163e7700e319532d4389ecba91e3ab88551f78610886fa36f8f262f9a5080988  ogre-1.12.0.tar.gz
> -sha256 82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
> +sha256  805b97aacd2070f19394fe92442307a7ba6036ad95c511f551817d694c8dea37  ogre-v1.12.12-br1.tar.gz
> +sha256  82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
> diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
> index 2df685a23a..72c96cb33a 100644
> --- a/package/ogre/ogre.mk
> +++ b/package/ogre/ogre.mk
> @@ -4,17 +4,21 @@
>   #
>   ################################################################################
>   
> -OGRE_VERSION = 1.12.0
> -OGRE_SITE = $(call github,OGRECave,ogre,v$(OGRE_VERSION))
> -OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins), Zlib (tinyxml)
> +OGRE_VERSION = v1.12.12
> +OGRE_SITE = https://github.com/OGRECave/ogre
> +OGRE_SITE_METHOD = git
> +OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
>   OGRE_LICENSE_FILES = LICENSE
>   OGRE_INSTALL_STAGING = YES
>   
> -# Ogre use a bundled version of tinyxml
> +# Download with imgui submodule (https://github.com/ocornut/imgui
> +OGRE_GIT_SUBMODULES = YES
> +
>   OGRE_DEPENDENCIES = host-pkgconf \
>   	freetype \
>   	libfreeimage \
>   	libgl \
> +	pugixml \
>   	sdl2 \
>   	xlib_libX11 \
>   	xlib_libXaw \
> @@ -27,9 +31,11 @@ OGRE_CXXFLAGS = $(TARGET_CXXFLAGS) -DGLEW_NO_GLU
>   
>   # Unbundle freetype and zziplib.
>   # Disable java and nvidia cg support.
> +# Disable imgui overlay to avoid extra download from CMake.
>   OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
>   	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
>   	-DOGRE_BUILD_PLUGIN_CG=OFF \
> +	-DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI=OFF \
>   	-DOGRE_INSTALL_DOCS=OFF \
>   	-DCMAKE_C_FLAGS="$(OGRE_CFLAGS)" \
>   	-DCMAKE_CXX_FLAGS="$(OGRE_CXXFLAGS)"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
