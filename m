Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C00C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9CE404AB;
	Thu, 24 Mar 2022 20:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwfJyd1lJtNV; Thu, 24 Mar 2022 20:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 865AA401E1;
	Thu, 24 Mar 2022 20:38:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4171BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 488D640250
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plyCXYp5wmYu for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:38:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EDE040247
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:38:53 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id lr4so3098753ejb.11
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xzs7EbB4L3BXT5hOCjH67o2yZgU02Od7MHKnWVLlHkc=;
 b=gcaCwC7ljm3MU/ceVVDly1yyb4JAx9zLUvVxbQz/YBRzYBcyLHgPIVwx053JW577uW
 IyrBc/xawquv0WQGLcx17HOLGuN9VT8CW37A4vGBey7eTkcaDWcha5PLGhd46rQECAhe
 9Zk2Ez8iYiaYkR16BBVJvy1JnnIogqj/jIVMOTR93rYlFpUzz4p8ybKtwaA2IohBHCKc
 GTO0e16hj9AXGuDNuKdH67HZSkveSw8efWzCZ6QggFmi3qm13aUo4QQUPc0yNIy51WK8
 8+uaznHYGvnCKgdVHZUF5HFIDhN8IzfSRD8sWBKpRyCvUWsDOx9FjTQk5nPQL8x3HUZN
 9opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xzs7EbB4L3BXT5hOCjH67o2yZgU02Od7MHKnWVLlHkc=;
 b=0804KEuER/1ybyv5antoRdP+DD5CF4qJ4KWnuEifuqAvS9BoQSR8SAHFr8xXgMU/9J
 NfBaL4phpEiZpoJRx3PpS64jYGlxp6Qg6jXytdZjATd41RRsUX1QNBS5cLV5qJPt2ylQ
 t9oFizOFZru6DaywXqVb/5q51EjrByYWg1SPuJG3mLHykFSoco3Z/3tDiQzLTIb2Y/6X
 /OBhfusB1QrIYBb/ga1Au+U3uOoP1hIrKPclYcq8AkQJQfWvr5n6ZcWn/+f7EO40mn8d
 k3AtqknJuCGwBtEXMfn/Mrf4zp7zoM5/Go0BZ9Jm2GmEYaeHNfRCpH5LItlDPV0x6lRC
 ENhQ==
X-Gm-Message-State: AOAM533uSycV540U+7qinTIzMnCBEJDXNWwHaJTZFa6ujEW71s/RzNFT
 eq4RIMiXSL7YmjEQqSLujAeR0g==
X-Google-Smtp-Source: ABdhPJydlBnU+bPGGsF9FMf4cZsapaSWNwoj+yxiQX1OEj6ebdGpSz/vyNrCyE678kpOGb8Fgj61ag==
X-Received: by 2002:a17:907:9506:b0:6da:b4cd:515b with SMTP id
 ew6-20020a170907950600b006dab4cd515bmr7793368ejc.602.1648154331315; 
 Thu, 24 Mar 2022 13:38:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm1498449ejb.162.2022.03.24.13.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:38:50 -0700 (PDT)
Message-ID: <5a93d9b6-0db2-4613-c0a4-c7304f19236e@mind.be>
Date: Thu, 24 Mar 2022 21:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313173919.1162577-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313173919.1162577-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/librtlsdr: switch to
 autotools-package
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
Cc: Jason Pruitt <jrspruitt@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 18:39, Fabrice Fontaine wrote:
> Switch to autotools-package to avoid the following static build failure

  Usually cmake is more future-safe, but here it seems both really are fully 
maintained.

  Applied to master, thanks.

  Regards,
  Arnout

> since commit d661740201405970f65c16c39a79f4148705af30:
> 
> [ 56%] Linking C executable rtl_biast
> /home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.3.0/../../../../riscv64-buildroot-linux-musl/bin/ld: attempted static link of dynamic object `/home/peko/autobuild/instance-1/output-1/host/riscv64-buildroot-linux-musl/sysroot/lib/libatomic.so'
> collect2: error: ld returned 1 exit status
> 
> Drop both cmake-related patches
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/cf84759682848db8ed5610e1abe5a92337d0e957
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...pect-DESTDIR-with-install-udev-rules.patch |  31 +++++
>   ...sable_shared_library_target_in_build.patch | 130 ------------------
>   ...rsion.cmake-don-t-use-Git-version-if.patch |  47 -------
>   package/librtlsdr/librtlsdr.mk                |  26 ++--
>   4 files changed, 42 insertions(+), 192 deletions(-)
>   create mode 100644 package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch
>   delete mode 100644 package/librtlsdr/0001-disable_shared_library_target_in_build.patch
>   delete mode 100644 package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch
> 
> diff --git a/package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch b/package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch
> new file mode 100644
> index 0000000000..1aec8166cc
> --- /dev/null
> +++ b/package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch
> @@ -0,0 +1,31 @@
> +From 082c9e4cb6c8f96aa59dd3d03b0288752518fad7 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 19 Feb 2022 22:29:45 +0100
> +Subject: [PATCH] Makefile.am: respect $(DESTDIR) with install-udev-rules
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/steve-m/librtlsdr/pull/67]
> +---
> + Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 65b2f21..6b8691a 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -14,10 +14,10 @@ dist-hook:
> + 	echo $(VERSION) > $(distdir)/.tarball-version
> +
> + install-udev-rules:
> +-	$(INSTALL_DATA) rtl-sdr.rules /etc/udev/rules.d
> ++	$(INSTALL_DATA) rtl-sdr.rules $(DESTDIR)/etc/udev/rules.d
> +
> + uninstall-udev-rules:
> +-	rm -rf /etc/udev/rules.d/rtl-sdr.rules
> ++	rm -rf $(DESTDIR)/etc/udev/rules.d/rtl-sdr.rules
> +
> + EXTRA_DIST = git-version-gen .version
> +
> +--
> +2.34.1
> +
> diff --git a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
> deleted file mode 100644
> index 2fb63465de..0000000000
> --- a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -From 9a1c2587d4ef18e2026811deabd024eb7577d9ce Mon Sep 17 00:00:00 2001
> -From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> -Date: Fri, 15 May 2020 16:14:48 +0200
> -Subject: [PATCH] disable shared library target in build
> -
> -Disable shared library target if BUILD_SHARED_LIBS if OFF.
> -
> -Patch retrieved from
> -https://git.buildroot.net/buildroot/tree/package/librtlsdr/0001-disable_shared_library_target_in_build.patch?h=2020.02.x
> -
> -Patch has been updated to work with master and to be able to keep current
> -behavior of building shared and static version of library if
> -BUILD_SHARED_LIBS and BUILD_STATIC_LIBS are both set.
> -Moreover, if BUILD_STATIC_LIBS is OFF, only shared version of library
> -will be install.
> -
> -[Upstream status: http://lists.osmocom.org/pipermail/osmocom-sdr/2020-May/002075.html]
> -
> -Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> -Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ----
> - src/CMakeLists.txt | 30 +++++++++++++++++++++---------
> - 1 file changed, 21 insertions(+), 9 deletions(-)
> -
> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> -index de93044..13b7b1a 100644
> ---- a/src/CMakeLists.txt
> -+++ b/src/CMakeLists.txt
> -@@ -18,6 +18,8 @@
> - ########################################################################
> - # Setup shared library variant
> - ########################################################################
> -+option(BUILD_SHARED_LIBS "Build shared library" ON)
> -+if(BUILD_SHARED_LIBS)
> - add_library(rtlsdr SHARED librtlsdr.c
> -   tuner_e4k.c tuner_fc0012.c tuner_fc0013.c tuner_fc2580.c tuner_r82xx.c)
> - target_link_libraries(rtlsdr PkgConfig::LIBUSB)
> -@@ -30,10 +32,14 @@ set_target_properties(rtlsdr PROPERTIES OUTPUT_NAME rtlsdr)
> - set_target_properties(rtlsdr PROPERTIES SOVERSION ${MAJOR_VERSION})
> - set_target_properties(rtlsdr PROPERTIES VERSION ${LIBVER})
> - generate_export_header(rtlsdr)
> -+list(APPEND rtlsdr_lib rtlsdr)
> -+endif()
> -
> - ########################################################################
> - # Setup static library variant
> - ########################################################################
> -+option(BUILD_STATIC_LIBS "Build static library" ON)
> -+if(BUILD_STATIC_LIBS)
> - add_library(rtlsdr_static STATIC librtlsdr.c
> -   tuner_e4k.c tuner_fc0012.c tuner_fc0013.c tuner_fc2580.c tuner_r82xx.c)
> - target_link_libraries(rtlsdr_static PkgConfig::LIBUSB)
> -@@ -47,6 +53,8 @@ if(NOT WIN32)
> - set_target_properties(rtlsdr_static PROPERTIES OUTPUT_NAME rtlsdr)
> - endif()
> - generate_export_header(rtlsdr_static)
> -+list(APPEND rtlsdr_lib rtlsdr_static)
> -+endif()
> -
> - ########################################################################
> - # Set up Windows DLL resource files
> -@@ -90,37 +98,37 @@ add_executable(rtl_eeprom rtl_eeprom.c)
> - add_executable(rtl_adsb rtl_adsb.c)
> - add_executable(rtl_power rtl_power.c)
> - add_executable(rtl_biast rtl_biast.c)
> --set(INSTALL_TARGETS rtlsdr rtlsdr_static rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast)
> -+set(INSTALL_TARGETS ${rtlsdr_lib} rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast)
> -
> --target_link_libraries(rtl_sdr rtlsdr convenience_static
> -+target_link_libraries(rtl_sdr ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> --target_link_libraries(rtl_tcp rtlsdr convenience_static
> -+target_link_libraries(rtl_tcp ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> --target_link_libraries(rtl_test rtlsdr convenience_static
> -+target_link_libraries(rtl_test ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> --target_link_libraries(rtl_fm rtlsdr convenience_static
> -+target_link_libraries(rtl_fm ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> --target_link_libraries(rtl_eeprom rtlsdr convenience_static
> -+target_link_libraries(rtl_eeprom ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> --target_link_libraries(rtl_adsb rtlsdr convenience_static
> -+target_link_libraries(rtl_adsb ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> --target_link_libraries(rtl_power rtlsdr convenience_static
> -+target_link_libraries(rtl_power ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> --target_link_libraries(rtl_biast rtlsdr convenience_static
> -+target_link_libraries(rtl_biast ${rtlsdr_lib} convenience_static
> -     ${LIBUSB_LIBRARIES}
> -     ${CMAKE_THREAD_LIBS_INIT}
> - )
> -@@ -156,12 +164,16 @@ endif()
> - ########################################################################
> - # Install built library files & utilities
> - ########################################################################
> -+if(BUILD_SHARED_LIBS)
> - install(TARGETS rtlsdr EXPORT RTLSDR-export
> -   LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} # .so/.dylib file
> -   )
> -+endif()
> -+if(BUILD_STATIC_LIBS)
> - install(TARGETS rtlsdr_static EXPORT RTLSDR-export
> -   ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} # .so/.dylib file
> -   )
> -+endif()
> - install(TARGETS rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast
> -   DESTINATION ${CMAKE_INSTALL_BINDIR}
> -   )
> ---
> -2.25.3
> -
> diff --git a/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch b/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch
> deleted file mode 100644
> index 9c808edd41..0000000000
> --- a/package/librtlsdr/0002-cmake-Modules-Version.cmake-don-t-use-Git-version-if.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From feb5d9c6b7bcec788f9b01781c205e31fff260e7 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Tue, 11 Aug 2020 23:07:08 +0200
> -Subject: [PATCH] cmake/Modules/Version.cmake: don't use Git version if not in
> - a Git repo
> -
> -If the librtlsdr code comes from a tarball, it doesn't have any .git/
> -metadata, and therefore even if Git (as a tool) is found, the logic in
> -cmake/Modules/Version.cmake fails finding a version through Git:
> -
> --- Extracting version information from git describe...
> -fatal: Not a git repository (or any of the parent directories): .git
> -
> -As a consequence, the VERSION variable is empty, which later causes
> -cmake to bail out with:
> -
> -CMake Error at /home/test/autobuild/run/instance-1/output-1/host/share/cmake-3.15/Modules/WriteBasicConfigVersionFile.cmake:43 (message):
> -  No VERSION specified for WRITE_BASIC_CONFIG_VERSION_FILE()
> -Call Stack (most recent call first):
> -  /home/test/autobuild/run/instance-1/output-1/host/share/cmake-3.15/Modules/CMakePackageConfigHelpers.cmake:225 (write_basic_config_version_file)
> -  CMakeLists.txt:173 (write_basic_package_version_file)
> -
> -To avoid this, we only use Git to determine the version if the cmake
> -project top-level source directory has a .git/ folder.
> -
> -Upstream: https://github.com/librtlsdr/librtlsdr/pull/75
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - cmake/Modules/Version.cmake | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/cmake/Modules/Version.cmake b/cmake/Modules/Version.cmake
> -index 2d4e76d..6f67fa4 100644
> ---- a/cmake/Modules/Version.cmake
> -+++ b/cmake/Modules/Version.cmake
> -@@ -32,7 +32,7 @@ set(PATCH_VERSION ${VERSION_INFO_PATCH_VERSION})
> - ########################################################################
> - find_package(Git QUIET)
> -
> --if(GIT_FOUND)
> -+if(GIT_FOUND AND EXISTS ${CMAKE_SOURCE_DIR}/.git)
> -     message(STATUS "Extracting version information from git describe...")
> -     execute_process(
> -         COMMAND ${GIT_EXECUTABLE} describe --always --abbrev=4 --long
> ---
> -2.26.2
> -
> diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
> index 7796d1096a..908be158b1 100644
> --- a/package/librtlsdr/librtlsdr.mk
> +++ b/package/librtlsdr/librtlsdr.mk
> @@ -9,29 +9,25 @@ LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
>   LIBRTLSDR_LICENSE = GPL-2.0+
>   LIBRTLSDR_LICENSE_FILES = COPYING
>   LIBRTLSDR_INSTALL_STAGING = YES
> -LIBRTLSDR_DEPENDENCIES = libusb
> -
> -# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
> -ifeq ($(BR2_STATIC_LIBS),y)
> -LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
> -else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> -LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
> -else ifeq ($(BR2_SHARED_LIBS),y)
> -LIBRTLSDR_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
> -endif
> +# From git
> +LIBRTLSDR_AUTORECONF = YES
> +LIBRTLSDR_DEPENDENCIES = host-pkgconf libusb
> +LIBRTLSDR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
>   
>   ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -LIBRTLSDR_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
> +LIBRTLSDR_INSTALL_TARGET_OPTS += install-udev-rules
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
> -LIBRTLSDR_CONF_OPTS += -DDETACH_KERNEL_DRIVER=1
> +LIBRTLSDR_CONF_OPTS += --enable-driver-detach
> +else
> +LIBRTLSDR_CONF_OPTS += --disable-driver-detach
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBRTLSDR_ZEROCOPY),y)
> -LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=ON
> +LIBRTLSDR_CONF_OPTS += --enable-zerocopy
>   else
> -LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=OFF
> +LIBRTLSDR_CONF_OPTS += --disable-zerocopy
>   endif
>   
> -$(eval $(cmake-package))
> +$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
