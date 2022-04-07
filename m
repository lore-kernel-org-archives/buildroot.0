Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EAAC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 18:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BD954060C;
	Thu,  7 Apr 2022 18:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opgCQCu3oAGc; Thu,  7 Apr 2022 18:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4120540A93;
	Thu,  7 Apr 2022 18:31:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CEA51BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 18:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C724612AC
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 18:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QuElEgUdQL1h for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 18:30:49 +0000 (UTC)
X-Greylist: delayed 00:06:00 by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE2B16127C
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 18:30:49 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 76DB020BA5AC;
 Thu,  7 Apr 2022 11:24:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 76DB020BA5AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649355895;
 bh=irs9Nn5mCFyQTC3QPLHypHVKi818D0qPjrN9uwP6WBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iQHCq5BKqiyV0n3Ir/zLRkalumXZTyEmbY6O4RY7kK2vbs6OdPBcad2edMiPJGlz9
 SbG8W4VocBFqQ9wrCodxknSv893wFO9ENBRPlawpXipopfYyus2VrzBbJjX/la3nA9
 RXgBqkufYHRfyzVvfIoJ0Ip1QZrbKU5NeZap5fx0=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 19:24:25 +0100
Message-Id: <20220407182425.194001-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407182425.194001-1-flaniel@linux.microsoft.com>
References: <20220407182425.194001-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 2/2] package/sysdig: bump version to
 0.27.1.
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
 bradford barr <bradford@density.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

0.23.1 has compilation errors with recent kernels.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 ...ATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 +++++++++++++++++++
 ...gainst-libabseil-cpp-which-grpc-uses.patch | 45 ++++++++++
 package/sysdig/Config.in                      |  5 ++
 package/sysdig/sysdig.hash                    |  1 +
 package/sysdig/sysdig.mk                      |  7 +-
 5 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
 create mode 100644 package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch

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
index 0000000000..60c3d31a3e
--- /dev/null
+++ b/package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
@@ -0,0 +1,45 @@
+From a7fb3b863c3574470c45fdf6084dcc40931ca017 Mon Sep 17 00:00:00 2001
+From: Francis Laniel <flaniel@linux.microsoft.com>
+Date: Thu, 7 Apr 2022 18:30:23 +0100
+Subject: [PATCH 2/2] Link against libabseil-cpp which grpc uses.
+
+This patch was taken from:
+55c96b61f7b9 ("sysdig: make extra linking against abseil conditional")
+from hhoffstaette/portage.
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
index 06d20c7f7b..5a7fbb50e0 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -8,13 +8,18 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_GRPC
+	select BR2_PACKAGE_GTEST
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
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 565b1e9828..4bce674f3e 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,4 @@
 # sha256 locally computed
+sha256  b9d05854493d245a7a7e75f77fc654508f720aab5e5e8a3a932bd8eb54e49bda  sysdig-0.27.1.tar.gz
 sha256  57d5b713b875eba35546a1408bf3f20c2703904a17d956be115ee55272db4cfa  sysdig-0.23.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 08d93750ae..d497c7c381 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.23.1
+SYSDIG_VERSION = 0.27.1
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
@@ -13,7 +13,10 @@ SYSDIG_CONF_OPTS = -DENABLE_DKMS=OFF -DUSE_BUNDLED_DEPS=OFF
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 SYSDIG_DEPENDENCIES = \
+	c-ares \
 	elfutils \
+	gtest \
+	grpc \
 	jq \
 	jsoncpp \
 	libb64 \
@@ -21,6 +24,8 @@ SYSDIG_DEPENDENCIES = \
 	luainterpreter \
 	ncurses \
 	openssl \
+	protobuf \
+	tbb \
 	zlib
 
 # sysdig creates the module Makefile from a template, which contains a
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
