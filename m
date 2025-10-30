Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C38CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 12:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F9B840E8;
	Thu, 30 Oct 2025 12:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0h242w5Yw4q; Thu, 30 Oct 2025 12:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C4A840EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97C4A840EA;
	Thu, 30 Oct 2025 12:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B0B7160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66DD241238
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06jOn2uJ6B-P for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 12:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AE9B4123A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE9B4123A
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AE9B4123A
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4BACE1814BB; Thu, 30 Oct 2025 13:02:06 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 13:01:31 +0100
Message-ID: <20251030120150.2458324-3-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120150.2458324-1-buildroot@heine.tech>
References: <20251030120150.2458324-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1761825726; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=f5OhG/pIrWMh9yk3cpJKvbBnXz/CH2q+EojE5Oao/O4=;
 b=uToPt4PS6kvll69pBAFl15f8ssZrs/T/TljuH5htfEz0bHJ3j4Xp1pkms84J08UOPbAAMK
 01IecKXE5nvIg3iCWVfTHkm9BUQdLm3urR3rPiT1ILjAIBIyqCgPP5SRS10Gl+hfa9QxIl
 c5WMyI6s3ZXkDohPIrTqT/BwhJ9erys=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=uToPt4PS
Subject: [Buildroot] [PATCH 3/4] package/grpc: bump to version 1.75.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- use new flag gRPC_DOWNLOAD_ARCHIVES=OFF which removed the need for patch 003
- reallign patches and update 0002 to properly apply

Release Notes since 1.66:
https://github.com/grpc/grpc/releases/tag/v1.67.0
https://github.com/grpc/grpc/releases/tag/v1.68.0
https://github.com/grpc/grpc/releases/tag/v1.69.0
https://github.com/grpc/grpc/releases/tag/v1.70.0
https://github.com/grpc/grpc/releases/tag/v1.71.0
https://github.com/grpc/grpc/releases/tag/v1.72.0
https://github.com/grpc/grpc/releases/tag/v1.73.0
https://github.com/grpc/grpc/releases/tag/v1.74.0
https://github.com/grpc/grpc/releases/tag/v1.75.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...the-availability-of-pthread_setname_.patch | 14 ++---
 ...strict-building-of-host-grpc-to-grpc.patch | 54 +++++++++----------
 ...nconditionally-downloading-api-repos.patch | 38 -------------
 package/grpc/grpc.hash                        |  2 +-
 package/grpc/grpc.mk                          |  5 +-
 5 files changed, 38 insertions(+), 75 deletions(-)
 delete mode 100644 package/grpc/0003-disable-unconditionally-downloading-api-repos.patch

diff --git a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
index e8e211758a..909a7fb5b0 100644
--- a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -1,4 +1,4 @@
-From dfec50b899c449bc964514f16e94869de7a68896 Mon Sep 17 00:00:00 2001
+From 3e9f278145fafbfe15a868d0f9032ba590078c3b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Mon, 31 Dec 2018 16:22:07 +0100
 Subject: [PATCH] Properly detect the availability of pthread_setname_np()
@@ -25,10 +25,10 @@ Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
  2 files changed, 8 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 053b9e3784..2565dc5c84 100644
+index f652a4055c..a2c978c7d8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -291,6 +291,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
+@@ -303,6 +303,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
  endif()
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
  
@@ -42,10 +42,10 @@ index 053b9e3784..2565dc5c84 100644
    include(cmake/msvc_static_runtime.cmake)
    add_definitions(-D_WIN32_WINNT=0x600 -D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS -D_WINSOCK_DEPRECATED_NO_WARNINGS)
 diff --git a/include/grpc/support/port_platform.h b/include/grpc/support/port_platform.h
-index 5fb7426af2..24d438d702 100644
+index 04a90fbf8a..6718233782 100644
 --- a/include/grpc/support/port_platform.h
 +++ b/include/grpc/support/port_platform.h
-@@ -228,6 +228,7 @@
+@@ -236,6 +236,7 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
@@ -53,7 +53,7 @@ index 5fb7426af2..24d438d702 100644
  #ifdef __GLIBC_PREREQ
  #if __GLIBC_PREREQ(2, 12)
  #define GPR_LINUX_PTHREAD_NAME 1
-@@ -236,6 +237,7 @@
+@@ -244,6 +245,7 @@
  // musl libc & others
  #define GPR_LINUX_PTHREAD_NAME 1
  #endif
@@ -62,5 +62,5 @@ index 5fb7426af2..24d438d702 100644
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
 -- 
-2.34.1
+2.43.0
 
diff --git a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
index 82705d8a1e..685750cb8b 100644
--- a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
+++ b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
@@ -1,4 +1,4 @@
-From 6aab068a6bd92e215b61eaab61062bf1d97bc065 Mon Sep 17 00:00:00 2001
+From 63133ef2799b08c14ef6b971526f79cebbd0381a Mon Sep 17 00:00:00 2001
 From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Date: Tue, 25 May 2021 14:55:23 +0200
 Subject: [PATCH] Add option to restrict building of (host-)grpc to
@@ -12,14 +12,14 @@ Upstream: not accepted (see https://github.com/grpc/grpc/issues/25322)
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
-Updated for 1.48.0:
+Updated for 1.74.1:
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
  CMakeLists.txt | 36 +++++++++++++++++++++++++++++++-----
  1 file changed, 31 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2565dc5c84..94f8fd3e93 100644
+index a2c978c7d8..27d5733d26 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -50,12 +50,16 @@ set(gRPC_BUILD_MSVC_MP_COUNT 0 CACHE STRING "The maximum number of processes for
@@ -39,7 +39,7 @@ index 2565dc5c84..94f8fd3e93 100644
  set(gRPC_INSTALL ${gRPC_INSTALL_default} CACHE BOOL
      "Generate installation target")
  
-@@ -662,6 +666,8 @@ add_custom_target(plugins
+@@ -693,6 +697,8 @@ add_custom_target(plugins
    DEPENDS ${_gRPC_PLUGIN_LIST}
  )
  
@@ -48,16 +48,16 @@ index 2565dc5c84..94f8fd3e93 100644
  add_custom_target(tools_c
    DEPENDS
  )
-@@ -673,6 +679,8 @@ add_custom_target(tools_cxx
+@@ -704,6 +710,8 @@ add_custom_target(tools_cxx
  add_custom_target(tools
    DEPENDS tools_c tools_cxx)
  
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
 +
  protobuf_generate_grpc_cpp_with_import_path_correction(
-   src/proto/grpc/channelz/channelz.proto src/proto/grpc/channelz/channelz.proto
+   src/core/ext/transport/chaotic_good/chaotic_good_frame.proto src/core/ext/transport/chaotic_good/chaotic_good_frame.proto
  )
-@@ -1660,7 +1668,7 @@ if(gRPC_BUILD_TESTS)
+@@ -1959,7 +1967,7 @@ if(gRPC_BUILD_TESTS)
      DEPENDS buildtests_c buildtests_cxx)
  endif()
  
@@ -66,7 +66,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  add_library(address_sorting
    third_party/address_sorting/address_sorting.c
-@@ -2855,6 +2863,8 @@ if(gRPC_INSTALL)
+@@ -3169,6 +3177,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -75,16 +75,16 @@ index 2565dc5c84..94f8fd3e93 100644
  if(gRPC_BUILD_TESTS)
  
  add_library(grpc_test_util
-@@ -2987,6 +2997,8 @@ endif()
+@@ -3321,6 +3331,8 @@ endif()
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(grpc_unsecure
-   src/core/channelz/channel_trace.cc
-   src/core/channelz/channelz.cc
-@@ -3547,6 +3559,8 @@ if(gRPC_INSTALL)
+   src/core/call/call_arena_allocator.cc
+   src/core/call/call_filters.cc
+@@ -3888,6 +3900,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -93,7 +93,7 @@ index 2565dc5c84..94f8fd3e93 100644
  if(gRPC_BUILD_TESTS)
  
  add_library(gtest
-@@ -3621,6 +3635,8 @@ target_link_libraries(gtest
+@@ -3962,6 +3976,8 @@ target_link_libraries(gtest
  
  endif()
  
@@ -102,7 +102,7 @@ index 2565dc5c84..94f8fd3e93 100644
  add_library(upb_base_lib
    third_party/upb/upb/base/status.c
  )
-@@ -4108,6 +4124,8 @@ if(gRPC_INSTALL)
+@@ -4629,6 +4645,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -111,16 +111,16 @@ index 2565dc5c84..94f8fd3e93 100644
  if(gRPC_BUILD_TESTS)
  
  if(gRPC_BUILD_CODEGEN)
-@@ -4193,6 +4211,8 @@ endif()
+@@ -4721,6 +4739,8 @@ endif()
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(grpc++
-   src/core/ext/transport/binder/client/binder_connector.cc
-   src/core/ext/transport/binder/client/channel_create.cc
-@@ -4684,6 +4704,7 @@ if(gRPC_INSTALL)
+   src/cpp/client/call_credentials.cc
+   src/cpp/client/channel_cc.cc
+@@ -5196,6 +5216,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -128,7 +128,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  if(gRPC_BUILD_CODEGEN)
  add_library(grpc++_reflection ${_gRPC_STATIC_WIN32}
-@@ -4967,6 +4988,8 @@ target_link_libraries(grpc++_test_util
+@@ -5470,6 +5491,8 @@ target_link_libraries(grpc++_test_util
  
  endif()
  
@@ -137,7 +137,7 @@ index 2565dc5c84..94f8fd3e93 100644
  add_library(grpc++_unsecure
    src/cpp/client/call_credentials.cc
    src/cpp/client/channel_cc.cc
-@@ -5707,6 +5730,7 @@ if(gRPC_INSTALL)
+@@ -6207,6 +6230,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -145,7 +145,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  add_library(grpc_plugin_support
    src/compiler/cpp_generator.cc
-@@ -5769,7 +5793,7 @@ foreach(_hdr
+@@ -6270,7 +6294,7 @@ foreach(_hdr
  endforeach()
  
  
@@ -154,7 +154,7 @@ index 2565dc5c84..94f8fd3e93 100644
    install(TARGETS grpc_plugin_support EXPORT gRPCTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
      BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-@@ -16520,7 +16544,7 @@ target_link_libraries(grpc_completion_queue_test
+@@ -17591,7 +17615,7 @@ target_link_libraries(grpc_completion_queue_test
  
  
  endif()
@@ -163,7 +163,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
-@@ -16548,7 +16572,7 @@ target_link_libraries(grpc_cpp_plugin
+@@ -17619,7 +17643,7 @@ target_link_libraries(grpc_cpp_plugin
  
  
  
@@ -172,7 +172,7 @@ index 2565dc5c84..94f8fd3e93 100644
    install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
      BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-@@ -37968,7 +37992,7 @@ endif()
+@@ -47262,7 +47286,7 @@ endif()
  
  
  
@@ -181,13 +181,13 @@ index 2565dc5c84..94f8fd3e93 100644
  
  if(gRPC_INSTALL)
    install(EXPORT gRPCTargets
-@@ -38089,3 +38113,5 @@ generate_pkgconfig(
+@@ -47383,3 +47407,5 @@ generate_pkgconfig(
    "-lgrpcpp_otel_plugin"
-   "-laddress_sorting -lupb_textformat_lib -lupb_json_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mem_lib -lupb_base_lib"
+   "-laddress_sorting -lupb_textformat_lib -lupb_json_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
    "grpcpp_otel_plugin.pc")
 +
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
 \ No newline at end of file
 -- 
-2.34.1
+2.43.0
 
diff --git a/package/grpc/0003-disable-unconditionally-downloading-api-repos.patch b/package/grpc/0003-disable-unconditionally-downloading-api-repos.patch
deleted file mode 100644
index 0cd5012b26..0000000000
--- a/package/grpc/0003-disable-unconditionally-downloading-api-repos.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2a73f6439b6d745b2cbfff120dc7adc555400247 Mon Sep 17 00:00:00 2001
-From: Michael Nosthoff <buildroot@heine.tech>
-Date: Fri, 22 Jul 2022 08:49:48 +0200
-Subject: [PATCH] disable unconditionally downloading api repos
-
-The Buildroot build doesn't need those submodules, so disable them hard
-for now.
-
-See https://github.com/grpc/grpc/issues/30385
-
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94f8fd3e93..df43d2e193 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -402,6 +402,7 @@ if(gRPC_BUILD_GRPCPP_OTEL_PLUGIN)
-   include(cmake/opentelemetry-cpp.cmake)
- endif()
- 
-+if(FALSE)
- # Setup external proto library at third_party/envoy-api with 2 download URLs
- if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/envoy-api AND gRPC_DOWNLOAD_ARCHIVES)
-   # Download the archive via HTTP, validate the checksum, and extract to third_party/envoy-api.
-@@ -478,6 +479,7 @@ if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/xds AND gRPC_DOWNLOAD_ARC
-     xds-3a472e524827f72d1ad621c4983dd5af54c46776
-   )
- endif()
-+endif()
- 
- if(WIN32)
-   set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} ws2_32 crypt32)
--- 
-2.34.1
-
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 08aada1454..c055d90618 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79ed4ab72fa9589b20f8b0b76c16e353e4cfec1d773d33afad605d97b5682c61  grpc-1.66.1.tar.gz
+sha256  486d5e32b3627926476a9a472f9792e4d7fe4e89c962473f1296183f76c6b032  grpc-1.75.1.tar.gz
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 39be4f583f..336b090cee 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.66.1
+GRPC_VERSION = 1.75.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
@@ -36,7 +36,8 @@ GRPC_CONF_OPTS = \
 	-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
-	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
+	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF \
+	-DgRPC_DOWNLOAD_ARCHIVES=OFF
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 GRPC_DEPENDENCIES += libexecinfo
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
