Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F93BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 17:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2EC441769;
	Thu, 14 Apr 2022 17:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XLSZRWimWykh; Thu, 14 Apr 2022 17:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D476C4173F;
	Thu, 14 Apr 2022 17:44:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 485AC1BF39C
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1703260AB0
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMskU_trE2t0 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 17:44:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFCC460B5E
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 17:44:23 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 15BE020C34F4;
 Thu, 14 Apr 2022 10:44:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 15BE020C34F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649958263;
 bh=TxGO4RxezUnzXMF0ND5SA4UJHOcfgoYNmadgqIdapoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OL2cOp4flmQUEJ4hMGhUvw7iG7M+bPm8rxKpoftp+t91zYu/S/l1SyhcA5bpIH1it
 A9m8RHV22TDoVVbZIvORrBd/asSL+b6vP7dyPpNj7WpN7XifsNcFQ5OLAwAC6sEN9m
 dY8LXKHTHC1RgtxrOOOe8VCPHLOurLgiL7IHpjTw=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 18:43:58 +0100
Message-Id: <20220414174358.38059-4-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414174358.38059-1-flaniel@linux.microsoft.com>
References: <20220414174358.38059-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/sysdig: bump to 0.29.1
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sysdig 0.27.1 cannot be cross-compiled to, e.g., aarch64 because it uses open()
syscall [1].
This patch bumps its version to enable cross-compilation.

[1] https://marc.info/?l=buildroot&m=164951521629400

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 ...BUNDLED_DEPS-before-getting-nlohmann.patch | 50 +++++++++++
 ...ATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 -------------------
 ...gainst-libabseil-cpp-which-grpc-uses.patch | 47 -----------
 package/sysdig/Config.in                      | 31 ++-----
 package/sysdig/sysdig.hash                    |  1 +
 package/sysdig/sysdig.mk                      | 39 ++-------
 6 files changed, 66 insertions(+), 184 deletions(-)
 create mode 100644 package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
 delete mode 100644 package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
 delete mode 100644 package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch

diff --git a/package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch b/package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
new file mode 100644
index 0000000000..53c88678ad
--- /dev/null
+++ b/package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
@@ -0,0 +1,50 @@
+From 7af62336bce5b92aee6e3b16e53fd09b14e45adb Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Wed, 13 Apr 2022 18:01:11 +0100
+Subject: [PATCH] cmake: Check USE_BUNDLED_DEPS before getting nlohmann-json.
+
+Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
+---
+ cmake/modules/nlohmann-json.cmake | 29 +++++++++++++++++++----------
+ 1 file changed, 19 insertions(+), 10 deletions(-)
+
+diff --git a/cmake/modules/nlohmann-json.cmake b/cmake/modules/nlohmann-json.cmake
+index bb1279d7..feb0f071 100644
+--- a/cmake/modules/nlohmann-json.cmake
++++ b/cmake/modules/nlohmann-json.cmake
+@@ -16,13 +16,22 @@
+ # limitations under the License.
+ #
+ 
+-set(NJSON_SRC "${PROJECT_BINARY_DIR}/njson-prefix/src/njson")
+-message(STATUS "Using bundled nlohmann-json in '${NJSON_SRC}'")
+-set(NJSON_INCLUDE_DIR "${NJSON_SRC}/single_include")
+-ExternalProject_Add(
+-  njson
+-  URL "https://github.com/nlohmann/json/archive/v3.3.0.tar.gz"
+-  URL_HASH "SHA256=2fd1d207b4669a7843296c41d3b6ac5b23d00dec48dba507ba051d14564aa801"
+-  CONFIGURE_COMMAND ""
+-  BUILD_COMMAND ""
+-  INSTALL_COMMAND "")
++if(NOT USE_BUNDLED_DEPS)
++  find_path(NJSON_INCLUDE_DIR NAMES nlohmann/json.hpp)
++  if(NJSON_INCLUDE_DIR)
++    message(STATUS "Found njson: include: ${NJSON_INCLUDE_DIR}")
++  else()
++    message(FATAL_ERROR "Couldn't find system njson")
++  endif()
++else()
++  set(NJSON_SRC "${PROJECT_BINARY_DIR}/njson-prefix/src/njson")
++  message(STATUS "Using bundled nlohmann-json in '${NJSON_SRC}'")
++  set(NJSON_INCLUDE_DIR "${NJSON_SRC}/single_include")
++  ExternalProject_Add(
++    njson
++    URL "https://github.com/nlohmann/json/archive/v3.3.0.tar.gz"
++    URL_HASH "SHA256=2fd1d207b4669a7843296c41d3b6ac5b23d00dec48dba507ba051d14564aa801"
++    CONFIGURE_COMMAND ""
++    BUILD_COMMAND ""
++    INSTALL_COMMAND "")
++endif()
+-- 
+2.25.1
+
diff --git a/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch b/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
deleted file mode 100644
index 7873210281..0000000000
--- a/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From cc8bccc3ebb90103900a7f0f2b085ddb723b8792 Mon Sep 17 00:00:00 2001
-From: Francis Laniel <flaniel@linux.microsoft.com>
-Date: Wed, 6 Apr 2022 16:54:37 +0100
-Subject: [PATCH] libsinsp: Apply PATCH_COMMAND to fix lua types and function.
-
-Buildroot luajit 5.1 seems to not have compatibility between luaL_reg and
-luaL_Reg.
-So, we apply sysdig CMakeLists.txt PATCH_COMMAND to fix this and lua function
-call as well.
-Note that, this PATCH_COMMAND was added in sysdig in:
-a064440394c9 ("Adding power support to Travis builds (#1566)")
-
-This patch is also present in kubernetes/minikube in:
-f036c279bc59 ("Add patch for compiling sysdig with system luajit")
-
-Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
----
- userspace/libsinsp/chisel.cpp         | 6 +++---
- userspace/libsinsp/lua_parser.cpp     | 2 +-
- userspace/libsinsp/lua_parser_api.cpp | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.cpp
-index 0a6e3cf8..0c2e255a 100644
---- a/userspace/libsinsp/chisel.cpp
-+++ b/userspace/libsinsp/chisel.cpp
-@@ -98,7 +98,7 @@ void lua_stackdump(lua_State *L)
- // Lua callbacks
- ///////////////////////////////////////////////////////////////////////////////
- #ifdef HAS_LUA_CHISELS
--const static struct luaL_reg ll_sysdig [] =
-+const static struct luaL_Reg ll_sysdig [] =
- {
- 	{"set_filter", &lua_cbacks::set_global_filter},
- 	{"set_snaplen", &lua_cbacks::set_snaplen},
-@@ -134,7 +134,7 @@ const static struct luaL_reg ll_sysdig [] =
- 	{NULL,NULL}
- };
- 
--const static struct luaL_reg ll_chisel [] =
-+const static struct luaL_Reg ll_chisel [] =
- {
- 	{"request_field", &lua_cbacks::request_field},
- 	{"set_filter", &lua_cbacks::set_filter},
-@@ -146,7 +146,7 @@ const static struct luaL_reg ll_chisel [] =
- 	{NULL,NULL}
- };
- 
--const static struct luaL_reg ll_evt [] =
-+const static struct luaL_Reg ll_evt [] =
- {
- 	{"field", &lua_cbacks::field},
- 	{"get_num", &lua_cbacks::get_num},
-diff --git a/userspace/libsinsp/lua_parser.cpp b/userspace/libsinsp/lua_parser.cpp
-index 0e26617d..78810d96 100644
---- a/userspace/libsinsp/lua_parser.cpp
-+++ b/userspace/libsinsp/lua_parser.cpp
-@@ -32,7 +32,7 @@ extern "C" {
- #include "lauxlib.h"
- }
- 
--const static struct luaL_reg ll_filter [] =
-+const static struct luaL_Reg ll_filter [] =
- {
- 	{"rel_expr", &lua_parser_cbacks::rel_expr},
- 	{"bool_op", &lua_parser_cbacks::bool_op},
-diff --git a/userspace/libsinsp/lua_parser_api.cpp b/userspace/libsinsp/lua_parser_api.cpp
-index c89e9126..c3d8008a 100644
---- a/userspace/libsinsp/lua_parser_api.cpp
-+++ b/userspace/libsinsp/lua_parser_api.cpp
-@@ -266,7 +266,7 @@ int lua_parser_cbacks::rel_expr(lua_State *ls)
- 					string err = "Got non-table as in-expression operand\n";
- 					throw sinsp_exception("parser API error");
- 				}
--				int n = luaL_getn(ls, 4);  /* get size of table */
-+				int n = lua_objlen (ls, 4);  /* get size of table */
- 				for (i=1; i<=n; i++)
- 				{
- 					lua_rawgeti(ls, 4, i);
--- 
-2.25.1
-
diff --git a/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch b/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
deleted file mode 100644
index a9155fbb4a..0000000000
--- a/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a7fb3b863c3574470c45fdf6084dcc40931ca017 Mon Sep 17 00:00:00 2001
-From: Francis Laniel <flaniel@linux.microsoft.com>
-Date: Thu, 7 Apr 2022 18:30:23 +0100
-Subject: [PATCH] Link against libabseil-cpp which grpc uses.
-
-This patch was taken from:
-55c96b61f7b9 ("sysdig: make extra linking against abseil conditional") [1]
-from hhoffstaette/portage.
-
-[1] https://github.com/hhoffstaette/portage/blob/55c96b61f7b91e4d91bed6723e86c00dd91f8d16/dev-util/sysdig/files/0.27.1-grpc-absl-sync.patch
-
-Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
----
- CMakeLists.txt                    | 1 +
- userspace/libsinsp/CMakeLists.txt | 4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1f34f1d6..c0354b29 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -552,6 +552,7 @@ if(NOT WIN32 AND NOT APPLE)
- 			else()
- 				message(FATAL_ERROR "Couldn't find system grpc")
- 			endif()
-+			find_library(ABSL_SYNC_LIB NAMES absl_synchronization)
- 			find_program(GRPC_CPP_PLUGIN grpc_cpp_plugin)
- 			if(NOT GRPC_CPP_PLUGIN)
- 				message(FATAL_ERROR "System grpc_cpp_plugin not found")
-diff --git a/userspace/libsinsp/CMakeLists.txt b/userspace/libsinsp/CMakeLists.txt
-index d72f9115..d1b7ea02 100644
---- a/userspace/libsinsp/CMakeLists.txt
-+++ b/userspace/libsinsp/CMakeLists.txt
-@@ -214,6 +214,10 @@ if(NOT WIN32)
- 				"${JQ_LIB}"
- 				"${B64_LIB}")
- 
-+			if(ABSL_SYNC_LIB)
-+				target_link_libraries(sinsp "${ABSL_SYNC_LIB}")
-+			endif()
-+
- 			if(NOT MUSL_OPTIMIZED_BUILD)
- 			target_link_libraries(sinsp
- 				rt
--- 
-2.25.1
-
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 3a4c033b2b..8f520b5e77 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,26 +1,11 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq, protobuf, tbb
-	depends on !BR2_STATIC_LIBS # elfutils, protobuf, tbb
-	depends on BR2_USE_WCHAR # elfutils
-	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils, tbb
-	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
-	select BR2_PACKAGE_C_ARES
-	select BR2_PACKAGE_ELFUTILS
-	select BR2_PACKAGE_GRPC
-	select BR2_PACKAGE_JQ
-	select BR2_PACKAGE_JSONCPP
-	select BR2_PACKAGE_LIBB64
-	select BR2_PACKAGE_LIBCURL
+	depends on BR2_INSTALL_LIBSTDCPP # yaml-cpp
+	select BR2_PACKAGE_FALCOSECURITY_LIBS
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PROTOBUF
-	select BR2_PACKAGE_TBB
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_NLOHMANN_JSON
+	select BR2_PACKAGE_YAML_CPP
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux
@@ -30,10 +15,6 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+comment "sysdig needs a toolchain w/ C++, a Linux kernel and luajit or lua 5.1 to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_USES_GLIBC \
-	    || !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 4ec46abfc3..f567ed97ac 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,4 +1,5 @@
 # sha256 locally computed
+sha256  3721c97f0da43c1a68d2962d30363525d8532ab5f2534dfefc86d175e17e423e  sysdig-0.29.1.tar.gz
 sha256  b9d05854493d245a7a7e75f77fc654508f720aab5e5e8a3a932bd8eb54e49bda  sysdig-0.27.1.tar.gz
 sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 9a9aaa35c3..d1a37162a7 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.27.1
+SYSDIG_VERSION = 0.29.1
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 SYSDIG_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
@@ -16,39 +16,18 @@ SYSDIG_CONF_OPTS = \
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 SYSDIG_DEPENDENCIES = \
-	c-ares \
-	elfutils \
-	grpc \
-	jq \
-	jsoncpp \
-	libb64 \
-	libcurl \
-	luainterpreter \
+	falcosecurity-libs \
 	ncurses \
-	openssl \
-	protobuf \
-	tbb \
-	zlib
+	nlohmann-json \
+	yaml-cpp
 
-# sysdig creates the module Makefile from a template, which contains a
-# single place-holder, KBUILD_FLAGS, wich is only replaced with two
-# things:
-#   - debug flags, which we don't care about here,
-#   - 'sysdig-feature' flags, which are never set, so always empty
-# So, just replace the place-holder with the only meaningful value: nothing.
-define SYSDIG_MODULE_GEN_MAKEFILE
-	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
-	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
-	$(SED) 's/@PROBE_NAME@/sysdig-probe/;' $(@D)/driver/Makefile
-endef
-SYSDIG_POST_PATCH_HOOKS += SYSDIG_MODULE_GEN_MAKEFILE
-
-# Don't build the driver as part of the 'standard' procedure, we'll
-# build it on our own with the kernel-module infra.
-SYSDIG_CONF_OPTS += -DBUILD_DRIVER=OFF
+# sysdig needs falcosecurity-libs sources, so we set the souce directory here.
+# It will sadly compile again falcosecurity-libs, so we also need to set again
+# grpc_cpp_plugin.
+SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(BUILD_DIR)/falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a -DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
+	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson
 
 SYSDIG_MODULE_SUBDIRS = driver
 SYSDIG_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
 
-$(eval $(kernel-module))
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
