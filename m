Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5358DC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 12:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAB87400B8;
	Mon, 20 Feb 2023 12:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAB87400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obn1WtMhhLgR; Mon, 20 Feb 2023 12:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D15B40A1E;
	Mon, 20 Feb 2023 12:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D15B40A1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53E961BF288
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 12:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E7DE40A1E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 12:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E7DE40A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wbBtLeipEdI for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 12:51:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 649EB400B8
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 649EB400B8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 12:51:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D1721814B9; Mon, 20 Feb 2023 13:51:40 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 13:49:45 +0100
Message-Id: <20230220124945.1842532-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1676897502; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ZMNHzgnuvBQGKeJnqtP+YBfSq0Tp4o31waIqh2scZmA=;
 b=moRWzXqhv1CK0bI+hp1e5ZVpS6DUMZJlsQI3cVj9ibVS4jpqTtdvnNkdcpGfpHMM44muXn
 eQscKE8U6WwsCf7pJmvh6F2XCDfo671QVL5eEfwUsA+1PDOaw1gN2PBeEZI2rmXzNrSSsl
 Czfrq6UeZs6SZ9/ykaVwho2jdHajcY0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=moRWzXqh
Subject: [Buildroot] [PATCH] package/grpc: bump to version 1.52.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- alter patches 0001 and 0003 for changed paths/locations
- bump minimum gcc to 7.3, see [0]
- alter gcc dependency of dependend packages accordingly

[0] https://github.com/grpc/grpc/tree/master/src/cpp

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/collectd/Config.in                    |  6 +-
 package/falcosecurity-libs/Config.in          |  2 +-
 ...the-availability-of-pthread_setname_.patch | 32 ++++++----
 .../grpc/0003-host-grpc-only-cpp-plugin.patch | 62 ++++++++++---------
 package/grpc/Config.in                        |  6 +-
 package/grpc/grpc.hash                        |  2 +-
 package/grpc/grpc.mk                          |  2 +-
 package/sysdig/Config.in                      |  6 +-
 8 files changed, 65 insertions(+), 53 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index a431da79f1..7f87b54645 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -683,15 +683,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc -> libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # grpc
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	select BR2_PACKAGE_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
 
-comment "grpc needs a toolchain w/ C++, gcc >= 5"
+comment "grpc needs a toolchain w/ C++, gcc >= 7.3"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index f101883384..41251fb748 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc, gtest
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # grpc, gtest
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # protobuf, tbb
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
diff --git a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
index 92dc5a6c45..5abdf6600f 100644
--- a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -1,4 +1,4 @@
-From 0dfb289a3b362b082ac3608d887e42f09dadc0d2 Mon Sep 17 00:00:00 2001
+From 7fddf245b63d723ffa03e9c87366e4a7673121c8 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Mon, 31 Dec 2018 16:22:07 +0100
 Subject: [PATCH] Properly detect the availability of pthread_setname_np()
@@ -18,17 +18,23 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
   this with our cmake based workaround.
   See: https://github.com/grpc/grpc/pull/27540
 ]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+
+[buildroot@heine.tech:
+  In 1.52.0 the path of port_platform.h changed. Alter patch accordingly.
+]
+
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
- CMakeLists.txt                            | 6 ++++++
- include/grpc/impl/codegen/port_platform.h | 2 ++
+ CMakeLists.txt                       | 6 ++++++
+ include/grpc/support/port_platform.h | 2 ++
  2 files changed, 8 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 45c2fcb..0b2be4f 100644
+index b0299050c4..5dfc04be90 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -208,6 +208,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
+@@ -247,6 +247,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
  endif()
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
  
@@ -41,11 +47,11 @@ index 45c2fcb..0b2be4f 100644
  if(MSVC)
    include(cmake/msvc_static_runtime.cmake)
    add_definitions(-D_WIN32_WINNT=0x600 -D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS -D_WINSOCK_DEPRECATED_NO_WARNINGS)
-diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codegen/port_platform.h
-index 4f213ff..55ecd9d 100644
---- a/include/grpc/impl/codegen/port_platform.h
-+++ b/include/grpc/impl/codegen/port_platform.h
-@@ -186,6 +186,7 @@
+diff --git a/include/grpc/support/port_platform.h b/include/grpc/support/port_platform.h
+index 9f9cac0054..29f99db7cf 100644
+--- a/include/grpc/support/port_platform.h
++++ b/include/grpc/support/port_platform.h
+@@ -181,6 +181,7 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
@@ -53,7 +59,7 @@ index 4f213ff..55ecd9d 100644
  #ifdef __GLIBC_PREREQ
  #if __GLIBC_PREREQ(2, 12)
  #define GPR_LINUX_PTHREAD_NAME 1
-@@ -194,6 +195,7 @@
+@@ -189,6 +190,7 @@
  // musl libc & others
  #define GPR_LINUX_PTHREAD_NAME 1
  #endif
@@ -61,6 +67,6 @@ index 4f213ff..55ecd9d 100644
  #include <linux/version.h>
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
-
 -- 
-2.26.63
+2.34.1
+
diff --git a/package/grpc/0003-host-grpc-only-cpp-plugin.patch b/package/grpc/0003-host-grpc-only-cpp-plugin.patch
index c68b096df6..73cef78fd8 100644
--- a/package/grpc/0003-host-grpc-only-cpp-plugin.patch
+++ b/package/grpc/0003-host-grpc-only-cpp-plugin.patch
@@ -1,4 +1,4 @@
-From a1922eadfc87da3dd221ff631f94ddd4a8ee7049 Mon Sep 17 00:00:00 2001
+From 7858880865e3a35a3d1d69ea490fb8f390dee12d Mon Sep 17 00:00:00 2001
 From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Date: Tue, 25 May 2021 14:55:23 +0200
 Subject: [PATCH] Add option to restrict building of (host-)grpc to
@@ -14,12 +14,15 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 Updated for 1.48.0:
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+
+Updated for 1.52.1:
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
- CMakeLists.txt | 43 +++++++++++++++++++++++++++++++++++--------
- 1 file changed, 35 insertions(+), 8 deletions(-)
+ CMakeLists.txt | 39 +++++++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d3963b074b..51cef83141 100644
+index b0299050c4..d6efe523c0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -49,12 +49,16 @@ option(gRPC_BUILD_TESTS "Build tests" OFF)
@@ -39,7 +42,7 @@ index d3963b074b..51cef83141 100644
  set(gRPC_INSTALL ${gRPC_INSTALL_default} CACHE BOOL
      "Generate installation target")
  
-@@ -555,6 +559,8 @@ add_custom_target(plugins
+@@ -562,6 +566,8 @@ add_custom_target(plugins
    DEPENDS ${_gRPC_PLUGIN_LIST}
  )
  
@@ -48,7 +51,7 @@ index d3963b074b..51cef83141 100644
  add_custom_target(tools_c
    DEPENDS
  )
-@@ -567,6 +573,8 @@ add_custom_target(tools_cxx
+@@ -573,6 +579,8 @@ add_custom_target(tools_cxx
  add_custom_target(tools
    DEPENDS tools_c tools_cxx)
  
@@ -57,7 +60,7 @@ index d3963b074b..51cef83141 100644
  protobuf_generate_grpc_cpp_with_import_path_correction(
    src/proto/grpc/channelz/channelz.proto src/proto/grpc/channelz/channelz.proto
  )
-@@ -1228,6 +1236,7 @@ if(gRPC_BUILD_TESTS)
+@@ -1332,6 +1340,7 @@ if(gRPC_BUILD_TESTS)
      DEPENDS buildtests_c buildtests_cxx)
  endif()
  
@@ -65,7 +68,7 @@ index d3963b074b..51cef83141 100644
  
  add_library(address_sorting
    third_party/address_sorting/address_sorting.c
-@@ -1280,6 +1289,8 @@ if(gRPC_INSTALL)
+@@ -1385,6 +1394,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -74,16 +77,16 @@ index d3963b074b..51cef83141 100644
  if(gRPC_BUILD_TESTS)
  
  add_library(end2end_tests
-@@ -1451,6 +1462,8 @@ endforeach()
+@@ -1538,6 +1549,8 @@ target_link_libraries(end2end_tests
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(gpr
-   src/core/ext/upb-generated/google/protobuf/any.upb.c
-   src/core/ext/upb-generated/google/rpc/status.upb.c
-@@ -2373,6 +2386,8 @@ if(gRPC_INSTALL)
+   src/core/lib/gpr/alloc.cc
+   src/core/lib/gpr/atm.cc
+@@ -2566,6 +2579,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -92,7 +95,7 @@ index d3963b074b..51cef83141 100644
  if(gRPC_BUILD_TESTS)
  
  add_library(grpc_test_util
-@@ -2511,6 +2526,8 @@ endif()
+@@ -2684,6 +2699,8 @@ endif()
  
  endif()
  
@@ -101,7 +104,7 @@ index d3963b074b..51cef83141 100644
  add_library(grpc_unsecure
    src/core/ext/filters/census/grpc_context.cc
    src/core/ext/filters/channel_idle/channel_idle_filter.cc
-@@ -2916,6 +2933,8 @@ if(gRPC_INSTALL)
+@@ -3177,6 +3194,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -110,7 +113,7 @@ index d3963b074b..51cef83141 100644
  if(gRPC_BUILD_TESTS)
  
  if(gRPC_BUILD_CODEGEN)
-@@ -2987,6 +3006,8 @@ endif()
+@@ -3262,6 +3281,8 @@ endif()
  
  endif()
  
@@ -119,7 +122,7 @@ index d3963b074b..51cef83141 100644
  add_library(grpc++
    src/core/ext/transport/binder/client/binder_connector.cc
    src/core/ext/transport/binder/client/channel_create.cc
-@@ -3463,6 +3484,7 @@ if(gRPC_INSTALL)
+@@ -3717,6 +3738,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -127,7 +130,7 @@ index d3963b074b..51cef83141 100644
  
  if(gRPC_BUILD_CODEGEN)
  add_library(grpc++_reflection
-@@ -3705,6 +3727,8 @@ target_link_libraries(grpc++_test_util
+@@ -3979,6 +4001,8 @@ target_link_libraries(grpc++_test_util
  
  endif()
  
@@ -136,7 +139,7 @@ index d3963b074b..51cef83141 100644
  add_library(grpc++_unsecure
    src/cpp/client/channel_cc.cc
    src/cpp/client/client_callback.cc
-@@ -4023,6 +4047,7 @@ if(gRPC_INSTALL)
+@@ -4644,6 +4668,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -144,7 +147,7 @@ index d3963b074b..51cef83141 100644
  
  add_library(grpc_plugin_support
    src/compiler/cpp_generator.cc
-@@ -4082,7 +4107,7 @@ foreach(_hdr
+@@ -4705,7 +4730,7 @@ foreach(_hdr
  endforeach()
  
  
@@ -153,7 +156,7 @@ index d3963b074b..51cef83141 100644
    install(TARGETS grpc_plugin_support EXPORT gRPCTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
      BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-@@ -4166,6 +4191,8 @@ endif()
+@@ -4791,6 +4816,8 @@ endif()
  
  endif()
  
@@ -162,16 +165,16 @@ index d3963b074b..51cef83141 100644
  add_library(upb
    third_party/upb/third_party/utf8_range/naive.c
    third_party/upb/third_party/utf8_range/range2-neon.c
-@@ -4256,6 +4283,8 @@ target_link_libraries(gen_hpack_tables
-   gpr
+@@ -4891,6 +4918,8 @@ target_link_libraries(bad_server_response_test
+   grpc_test_util
  )
  
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
 +
  
+ endif()
  if(gRPC_BUILD_TESTS)
- 
-@@ -11228,7 +11257,7 @@ target_link_libraries(grpc_cli
+@@ -12155,7 +12184,7 @@ target_link_libraries(grpc_completion_queue_test
  
  
  endif()
@@ -180,16 +183,16 @@ index d3963b074b..51cef83141 100644
  
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
-@@ -11258,7 +11287,7 @@ target_link_libraries(grpc_cpp_plugin
+@@ -12187,7 +12216,7 @@ target_link_libraries(grpc_cpp_plugin
  
  
  
 -if(gRPC_INSTALL)
 +if(gRPC_INSTALL OR gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
-   install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
+   install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
      BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-@@ -19803,7 +19832,7 @@ endif()
+@@ -25209,7 +25238,7 @@ endif()
  
  
  
@@ -198,9 +201,12 @@ index d3963b074b..51cef83141 100644
  
  if(gRPC_INSTALL)
    install(EXPORT gRPCTargets
-@@ -19900,3 +19929,5 @@ generate_pkgconfig(
+@@ -25317,3 +25346,5 @@ generate_pkgconfig(
    "-lgrpc++_unsecure"
    ""
    "grpc++_unsecure.pc")
 +
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
+-- 
+2.34.1
+
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index db6425819b..dffe164e3a 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -19,9 +19,9 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 5"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 7.3"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index e6b76dcb5e..e53c13476f 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b55696fb249669744de3e71acc54a9382bea0dce7cd5ba379b356b12b82d4229  grpc-1.51.1.tar.gz
+sha256  ec125d7fdb77ecc25b01050a0d5d32616594834d3fe163b016768e2ae42a2df6  grpc-1.52.1.tar.gz
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 9125b1f9f6..fd051170fe 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.51.1
+GRPC_VERSION = 1.52.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index c0a631bd49..581d778d54 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
 	depends on BR2_LINUX_KERNEL # falcosecurity-libs
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # falcosecurity-libs
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # grpc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
 	depends on !BR2_STATIC_LIBS # falcosecurity-libs
 	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
@@ -23,12 +23,12 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 5, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 7.3, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
