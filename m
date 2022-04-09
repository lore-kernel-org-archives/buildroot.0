Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D54C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5418041E04;
	Sat,  9 Apr 2022 14:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhMBQohWogdD; Sat,  9 Apr 2022 14:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950E341DF8;
	Sat,  9 Apr 2022 14:41:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A38A71BF425
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A044860A6A
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTDcoXmN8MiA for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:41:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B8D860A46
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:41:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0046D83761; Sat,  9 Apr 2022 14:31:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 16:00:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c114c9e8ce3cca598babe77dca0d2137fa404a4b
X-Git-Newrev: 7818cef78bfaf8eab8ec86d715ca76b0dbfa46e8
X-Patchwork-Hint: ignore
Message-Id: <20220409143154.0046D83761@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysdig: bump version to 0.27.1.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7818cef78bfaf8eab8ec86d715ca76b0dbfa46e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0.23.1 has compilation errors with recent kernels.

0.27.1 changed license for userspace from GPLv2 to Apache and added MIT
option for driver.

New dependencies: c-ares, grpc, protobuf, tbb. There's also a dependency
on gtest, but only if tests are enabled. Therefore, add conf opt to
disable tests.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
[Arnout:
 - Add Francis to DEVELOPERS for sysdig.
 - Add link to source of patch 2.
 - Remove N/M from patch 2 (check-package).
 - Correct license info and hashes.
 - Remove gtest dependency.
 - Add -DCREATE_TEST_TARGETS=OFF conf opt.
 - Propagate Config.in dependencies of reverse dependencies.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 ...ply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 ++++++++++++++++++++++
 ...ink-against-libabseil-cpp-which-grpc-uses.patch | 47 +++++++++++++
 package/sysdig/Config.in                           | 20 ++++--
 package/sysdig/sysdig.hash                         |  6 +-
 package/sysdig/sysdig.mk                           | 15 ++--
 6 files changed, 158 insertions(+), 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ef4ddcab50..d5035b3239 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -970,6 +970,7 @@ F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
 F:	package/pahole/
+F:	package/sysdig/
 F:	package/tbb/
 
 N:	Francisco Gonzalez <gzmorell@gmail.com>
diff --git a/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch b/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
new file mode 100644
index 0000000000..7873210281
--- /dev/null
+++ b/package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
@@ -0,0 +1,82 @@
+From cc8bccc3ebb90103900a7f0f2b085ddb723b8792 Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Wed, 6 Apr 2022 16:54:37 +0100
+Subject: [PATCH] libsinsp: Apply PATCH_COMMAND to fix lua types and function.
+
+Buildroot luajit 5.1 seems to not have compatibility between luaL_reg and
+luaL_Reg.
+So, we apply sysdig CMakeLists.txt PATCH_COMMAND to fix this and lua function
+call as well.
+Note that, this PATCH_COMMAND was added in sysdig in:
+a064440394c9 ("Adding power support to Travis builds (#1566)")
+
+This patch is also present in kubernetes/minikube in:
+f036c279bc59 ("Add patch for compiling sysdig with system luajit")
+
+Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
+---
+ userspace/libsinsp/chisel.cpp         | 6 +++---
+ userspace/libsinsp/lua_parser.cpp     | 2 +-
+ userspace/libsinsp/lua_parser_api.cpp | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.cpp
+index 0a6e3cf8..0c2e255a 100644
+--- a/userspace/libsinsp/chisel.cpp
++++ b/userspace/libsinsp/chisel.cpp
+@@ -98,7 +98,7 @@ void lua_stackdump(lua_State *L)
+ // Lua callbacks
+ ///////////////////////////////////////////////////////////////////////////////
+ #ifdef HAS_LUA_CHISELS
+-const static struct luaL_reg ll_sysdig [] =
++const static struct luaL_Reg ll_sysdig [] =
+ {
+ 	{"set_filter", &lua_cbacks::set_global_filter},
+ 	{"set_snaplen", &lua_cbacks::set_snaplen},
+@@ -134,7 +134,7 @@ const static struct luaL_reg ll_sysdig [] =
+ 	{NULL,NULL}
+ };
+ 
+-const static struct luaL_reg ll_chisel [] =
++const static struct luaL_Reg ll_chisel [] =
+ {
+ 	{"request_field", &lua_cbacks::request_field},
+ 	{"set_filter", &lua_cbacks::set_filter},
+@@ -146,7 +146,7 @@ const static struct luaL_reg ll_chisel [] =
+ 	{NULL,NULL}
+ };
+ 
+-const static struct luaL_reg ll_evt [] =
++const static struct luaL_Reg ll_evt [] =
+ {
+ 	{"field", &lua_cbacks::field},
+ 	{"get_num", &lua_cbacks::get_num},
+diff --git a/userspace/libsinsp/lua_parser.cpp b/userspace/libsinsp/lua_parser.cpp
+index 0e26617d..78810d96 100644
+--- a/userspace/libsinsp/lua_parser.cpp
++++ b/userspace/libsinsp/lua_parser.cpp
+@@ -32,7 +32,7 @@ extern "C" {
+ #include "lauxlib.h"
+ }
+ 
+-const static struct luaL_reg ll_filter [] =
++const static struct luaL_Reg ll_filter [] =
+ {
+ 	{"rel_expr", &lua_parser_cbacks::rel_expr},
+ 	{"bool_op", &lua_parser_cbacks::bool_op},
+diff --git a/userspace/libsinsp/lua_parser_api.cpp b/userspace/libsinsp/lua_parser_api.cpp
+index c89e9126..c3d8008a 100644
+--- a/userspace/libsinsp/lua_parser_api.cpp
++++ b/userspace/libsinsp/lua_parser_api.cpp
+@@ -266,7 +266,7 @@ int lua_parser_cbacks::rel_expr(lua_State *ls)
+ 					string err = "Got non-table as in-expression operand\n";
+ 					throw sinsp_exception("parser API error");
+ 				}
+-				int n = luaL_getn(ls, 4);  /* get size of table */
++				int n = lua_objlen (ls, 4);  /* get size of table */
+ 				for (i=1; i<=n; i++)
+ 				{
+ 					lua_rawgeti(ls, 4, i);
+-- 
+2.25.1
+
diff --git a/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch b/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
new file mode 100644
index 0000000000..a9155fbb4a
--- /dev/null
+++ b/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
@@ -0,0 +1,47 @@
+From a7fb3b863c3574470c45fdf6084dcc40931ca017 Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Thu, 7 Apr 2022 18:30:23 +0100
+Subject: [PATCH] Link against libabseil-cpp which grpc uses.
+
+This patch was taken from:
+55c96b61f7b9 ("sysdig: make extra linking against abseil conditional") [1]
+from hhoffstaette/portage.
+
+[1] https://github.com/hhoffstaette/portage/blob/55c96b61f7b91e4d91bed6723e86c00dd91f8d16/dev-util/sysdig/files/0.27.1-grpc-absl-sync.patch
+
+Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
+---
+ CMakeLists.txt                    | 1 +
+ userspace/libsinsp/CMakeLists.txt | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1f34f1d6..c0354b29 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -552,6 +552,7 @@ if(NOT WIN32 AND NOT APPLE)
+ 			else()
+ 				message(FATAL_ERROR "Couldn't find system grpc")
+ 			endif()
++			find_library(ABSL_SYNC_LIB NAMES absl_synchronization)
+ 			find_program(GRPC_CPP_PLUGIN grpc_cpp_plugin)
+ 			if(NOT GRPC_CPP_PLUGIN)
+ 				message(FATAL_ERROR "System grpc_cpp_plugin not found")
+diff --git a/userspace/libsinsp/CMakeLists.txt b/userspace/libsinsp/CMakeLists.txt
+index d72f9115..d1b7ea02 100644
+--- a/userspace/libsinsp/CMakeLists.txt
++++ b/userspace/libsinsp/CMakeLists.txt
+@@ -214,6 +214,10 @@ if(NOT WIN32)
+ 				"${JQ_LIB}"
+ 				"${B64_LIB}")
+ 
++			if(ABSL_SYNC_LIB)
++				target_link_libraries(sinsp "${ABSL_SYNC_LIB}")
++			endif()
++
+ 			if(NOT MUSL_OPTIMIZED_BUILD)
+ 			target_link_libraries(sinsp
+ 				rt
+-- 
+2.25.1
+
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 06d20c7f7b..3a4c033b2b 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,20 +1,25 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq
-	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq, protobuf, tbb
+	depends on !BR2_STATIC_LIBS # elfutils, protobuf, tbb
 	depends on BR2_USE_WCHAR # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils, tbb
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_GRPC
 	select BR2_PACKAGE_JQ
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBB64
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_TBB
 	select BR2_PACKAGE_ZLIB
 	help
 	  Sysdig is open source, system-level exploration:
@@ -25,9 +30,10 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc or uclibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
+		|| !BR2_TOOLCHAIN_USES_GLIBC \
 	    || !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 565b1e9828..4ec46abfc3 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,5 @@
 # sha256 locally computed
-sha256  57d5b713b875eba35546a1408bf3f20c2703904a17d956be115ee55272db4cfa  sysdig-0.23.1.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  b9d05854493d245a7a7e75f77fc654508f720aab5e5e8a3a932bd8eb54e49bda  sysdig-0.27.1.tar.gz
+sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
+sha256  e3f6a43d097ed68176e9738de925d98b938e1bccf6d6bd1bcd79395eca8f76ed  driver/MIT.txt
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 08d93750ae..9a9aaa35c3 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,16 +4,21 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.23.1
+SYSDIG_VERSION = 0.27.1
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
-SYSDIG_LICENSE = GPL-2.0
-SYSDIG_LICENSE_FILES = COPYING
+SYSDIG_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
+SYSDIG_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
 SYSDIG_CPE_ID_VENDOR = sysdig
-SYSDIG_CONF_OPTS = -DENABLE_DKMS=OFF -DUSE_BUNDLED_DEPS=OFF
+SYSDIG_CONF_OPTS = \
+	-DENABLE_DKMS=OFF \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DCREATE_TEST_TARGETS=OFF
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 SYSDIG_DEPENDENCIES = \
+	c-ares \
 	elfutils \
+	grpc \
 	jq \
 	jsoncpp \
 	libb64 \
@@ -21,6 +26,8 @@ SYSDIG_DEPENDENCIES = \
 	luainterpreter \
 	ncurses \
 	openssl \
+	protobuf \
+	tbb \
 	zlib
 
 # sysdig creates the module Makefile from a template, which contains a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
