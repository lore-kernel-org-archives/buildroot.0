Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2BDCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D688102F;
	Fri, 29 May 2026 09:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqxO-k2ywZsb; Fri, 29 May 2026 09:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A667810B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780048175;
	bh=+wzjIbvrnMYA8R+tdGb9G7h6k5leFqVJzyegQLZkeOc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EI8TqgGO9HbXal+nHbn7WPMH15wWzUJFLUCeO0UpvhoivDPLp/FtG0Lnr7tMuL0Gs
	 yjCQfqgnsrYvSFkjqj9mhh8HInfQaNY5Qs5LcJLe+46Gpr/KMPln5t1zr69StXK5GC
	 C1EqIf1ZK84rhHId+f/qLDhKK3MwvuRUGuokjO4xctJkiQg1p1ShPKNFQ6SzuRqeZS
	 j7hftM7qApiMnuwqWxeTx36BrW8jRBRhktK4oAne00J47JAJiBZuBeAx9b4Xyatj6n
	 ztRYB9ctwyQgo3SDdMPYDUlS3i+A76IMg3JVmCiBOdsP8t9awoIdc0HuiC+n+70Ysu
	 UQ57booSNdTAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A667810B4;
	Fri, 29 May 2026 09:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 490FDD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2983B4202F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kdpl0YZjKKEf for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1674D40861
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1674D40861
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:49:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FD5E87304; Fri, 29 May 2026 09:49:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:49:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94d6d266f4038157818dcaa37a16fac8089d0043
X-Git-Newrev: 948f819d955cce4917c12a4d65ccc55c29f5e501
X-Patchwork-Hint: ignore
Message-Id: <20260529094919.9FD5E87304@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeek: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3816813020641763396=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3816813020641763396==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/948f819d955cce4917c12a4d65ccc55c29f5e501
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In [1], Bernd notes:

  Our zeek release 4.1.1 dates back to 2021 with > 8000 patches
  applied to upstream since then, current version is
  8.1.1. Backporting python- related patches to fix the build of
  zeekctl looks really difficult due to many changes in the 3rd-party
  libraries/submodules used by zeek.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20260419090115.1129567-1-bernd@kuhls.net/

Since the package is not maintained, and is causing build issues in
our autobuilders with recent gcc versions, let's drop the package.

Fixes:

  https://autobuild.buildroot.net/results/0227cdc337fe7cbb19d9b88b2c3d890c6a3ee347/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  8 ++
 DEVELOPERS                                         |  1 -
 package/zeek/0001-Bump-minimum-cmake-version.patch | 42 ----------
 ...dd-missing-includes-fix-build-with-GCC-13.patch | 40 ----------
 ...-resulting-from-removal-of-ghc-filesystem.patch | 48 -----------
 ...State.h-to-fix-compilation-error-on-gcc13.patch | 24 ------
 package/zeek/Config.in                             | 44 -----------
 package/zeek/zeek.hash                             |  6 --
 package/zeek/zeek.mk                               | 92 ----------------------
 9 files changed, 8 insertions(+), 297 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 11ace58153..8fed4b72c1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_ZEEK
+	bool "zeek removed"
+	select BR2_LEGACY
+	help
+	  The zeek package was not maintained, with numerous build
+	  issues and severely lagging behind upstream. so it has been
+	  dropped.
+
 config BR2_PACKAGE_PIGPIO
 	bool "pigpio removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 94d612bbde..a00627b28c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1102,7 +1102,6 @@ F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/whois/
 F:	package/x11r7/xlib_libXpresent/
-F:	package/zeek/
 
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
 F:	board/freescale/imx6ullevk/
diff --git a/package/zeek/0001-Bump-minimum-cmake-version.patch b/package/zeek/0001-Bump-minimum-cmake-version.patch
deleted file mode 100644
index 27c453078d..0000000000
--- a/package/zeek/0001-Bump-minimum-cmake-version.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bab553abf0dddc9e8fe90baf4c3b0b7ac5e5bfdd Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 4 Jan 2026 13:24:31 +0100
-Subject: [PATCH] Bump minimum cmake version
-
-This commit fixes buildroot errors after cmake was bumped to 4.x.
-
-This upstream commit removed CMP0063:
-https://github.com/zeek/libkqueue/commit/34cc1fea01e2f1d49238e1c58997c09bfa241568
-
-This upstream commit bumped cmake_minimum_required to 3.8.0:
-https://github.com/zeek/libkqueue/commit/a947dee39c70d151b1efff2b5bfc7fa46499e619
-
-Upstream: https://github.com/zeek/libkqueue/commit/a947dee39c70d151b1efff2b5bfc7fa46499e619
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 835e211..7b3dadf 100644
---- a/auxil/libkqueue/CMakeLists.txt
-+++ b/auxil/libkqueue/CMakeLists.txt
-@@ -16,13 +16,7 @@
- 
- set(PROJECT_VERSION 2.4.0)
- 
--cmake_minimum_required(VERSION 3.0)
--
--# This policy doesn't exist until version 3.3
--if (${CMAKE_VERSION} VERSION_EQUAL "3.3" OR
--    ${CMAKE_VERSION} VERSION_GREATER "3.3")
--  cmake_policy(SET CMP0063 OLD)
--endif()
-+cmake_minimum_required(VERSION 3.8.0)
- 
- # Both variables used in include/sys/libkqueue_version.h.in
- string(TIMESTAMP PROJECT_VERSION_DATE "%b %d %Y at %H:%M:%S")
--- 
-2.47.3
-
diff --git a/package/zeek/0002-Add-missing-includes-fix-build-with-GCC-13.patch b/package/zeek/0002-Add-missing-includes-fix-build-with-GCC-13.patch
deleted file mode 100644
index 3590b01c58..0000000000
--- a/package/zeek/0002-Add-missing-includes-fix-build-with-GCC-13.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c41f1c24f6ed2a5441b231b17e1889580bbbc01c Mon Sep 17 00:00:00 2001
-From: Dominik Charousset <dominik@charousset.de>
-Date: Wed, 29 Mar 2023 17:01:37 +0200
-Subject: [PATCH] Add missing includes, fix build with GCC 13
-
-(cherry picked from commit c2ee99c38989deba848cc4c4ec9a230fa71162f7)
-
-Upstream: https://github.com/zeek/actor-framework/commit/c41f1c24f6ed2a5441b231b17e1889580bbbc01c
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libcaf_core/caf/detail/ripemd_160.hpp     | 1 +
- libcaf_core/caf/telemetry/metric_type.hpp | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/libcaf_core/caf/detail/ripemd_160.hpp b/libcaf_core/caf/detail/ripemd_160.hpp
-index ea9f44cec3..ec2482ecfa 100644
---- a/auxil/broker/caf/libcaf_core/caf/detail/ripemd_160.hpp
-+++ b/auxil/broker/caf/libcaf_core/caf/detail/ripemd_160.hpp
-@@ -42,6 +42,7 @@
- 
- #include <array>
- #include <string>
-+#include <cstdint>
- 
- #include "caf/detail/core_export.hpp"
- 
-diff --git a/libcaf_core/caf/telemetry/metric_type.hpp b/libcaf_core/caf/telemetry/metric_type.hpp
-index 0525dd1da7..2047b5f6cc 100644
---- a/auxil/broker/caf/libcaf_core/caf/telemetry/metric_type.hpp
-+++ b/auxil/broker/caf/libcaf_core/caf/telemetry/metric_type.hpp
-@@ -4,6 +4,8 @@
- 
- #pragma once
- 
-+#include <cstdint>
-+
- namespace caf::telemetry {
- 
- enum class metric_type : uint8_t {
diff --git a/package/zeek/0003-Fix-some-missing-includes-resulting-from-removal-of-ghc-filesystem.patch b/package/zeek/0003-Fix-some-missing-includes-resulting-from-removal-of-ghc-filesystem.patch
deleted file mode 100644
index 7789223a09..0000000000
--- a/package/zeek/0003-Fix-some-missing-includes-resulting-from-removal-of-ghc-filesystem.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1f87382302896876df0838d83f0d107aae4b89d3 Mon Sep 17 00:00:00 2001
-From: Tim Wojtulewicz <tim@corelight.com>
-Date: Thu, 10 Jul 2025 16:28:40 -0700
-Subject: [PATCH] Fix some missing #includes resulting from removal of
- ghc::filesystem
-
-Upstream: https://github.com/zeek/zeek/commit/1f87382302896876df0838d83f0d107aae4b89d3
-
-[Bernd:
-- backported only UDP.cc change from upstream commit
-- added similar change to src/script_opt/CPP/GenFunc.cc, no upstream
-  commit due to switch to from transform to std::ranges::transform:
-  https://github.com/zeek/zeek/commit/72c79006ac028558004a259081fa8e02de3ebe85
-  to fix build error:
-
-  /home/bernd/buildroot/output/build/zeek-4.1.1/src/script_opt/CPP/GenFunc.cc:
-   In member function ‘std::string zeek::detail::CPPCompile::BodyName(const zeek::detail::FuncInfo&)’:
-  /home/bernd/buildroot/output/build/zeek-4.1.1/src/script_opt/CPP/GenFunc.cc:214:17:
-   error: ‘transform’ was not declared in this scope
-    214 |                 transform(fns.begin(), fns.end(), fns.begin(), canonicalize);]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/packet_analysis/protocol/udp/UDP.cc      | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/packet_analysis/protocol/udp/UDP.cc b/src/packet_analysis/protocol/udp/UDP.cc
-index bebfabd3fbb..bf114f5518b 100644
---- a/src/packet_analysis/protocol/udp/UDP.cc
-+++ b/src/packet_analysis/protocol/udp/UDP.cc
-@@ -1,6 +1,9 @@
- // See the file "COPYING" in the main distribution directory for copyright.
- 
- #include "zeek/packet_analysis/protocol/udp/UDP.h"
-+
-+#include <algorithm>
-+
- #include "zeek/RunState.h"
- #include "zeek/Conn.h"
- #include "zeek/session/Manager.h"
---- a/src/script_opt/CPP/GenFunc.cc
-+++ b/src/script_opt/CPP/GenFunc.cc
-@@ -1,5 +1,6 @@
- // See the file "COPYING" in the main distribution directory for copyright.
- 
-+#include <algorithm>
- #include <errno.h>
- #include <unistd.h>
- #include <sys/stat.h>
diff --git a/package/zeek/0004-Add-cstdint-to-WeirdState.h-to-fix-compilation-error-on-gcc13.patch b/package/zeek/0004-Add-cstdint-to-WeirdState.h-to-fix-compilation-error-on-gcc13.patch
deleted file mode 100644
index 09207a2d62..0000000000
--- a/package/zeek/0004-Add-cstdint-to-WeirdState.h-to-fix-compilation-error-on-gcc13.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 122b8d6052ab987237dd8eb3feeed598230881f7 Mon Sep 17 00:00:00 2001
-From: Tim Wojtulewicz <tim@corelight.com>
-Date: Mon, 10 Apr 2023 16:07:18 -0700
-Subject: [PATCH] Add cstdint to WeirdState.h to fix compilation error on gcc13
-
-Upstream: https://github.com/zeek/zeek/commit/122b8d6052ab987237dd8eb3feeed598230881f7
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/WeirdState.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/WeirdState.h b/src/WeirdState.h
-index 5b8e90fba6a..b34a6da8e82 100644
---- a/src/WeirdState.h
-+++ b/src/WeirdState.h
-@@ -2,6 +2,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <unordered_map>
- 
diff --git a/package/zeek/Config.in b/package/zeek/Config.in
deleted file mode 100644
index 730388ded7..0000000000
--- a/package/zeek/Config.in
+++ /dev/null
@@ -1,44 +0,0 @@
-config BR2_PACKAGE_ZEEK
-	bool "zeek"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-	depends on BR2_HOST_GCC_AT_LEAST_7 # host-zeek
-	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
-	select BR2_PACKAGE_ZLIB
-	help
-	  The Zeek Network Security Monitor
-
-	  Zeek is a powerful network analysis framework that is much
-	  different from the typical IDS you may know. (Zeek is the new
-	  name for the long-established Bro system.)
-
-	  https://www.zeek.org
-
-if BR2_PACKAGE_ZEEK
-
-config BR2_PACKAGE_ZEEK_ZEEKCTL
-	bool "zeekctl"
-	select BR2_PACKAGE_BASH # runtime
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-	select BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON3_CURSES
-	select BR2_PACKAGE_PYTHON3_SQLITE
-	select BR2_PACKAGE_PYTHON3_ZLIB
-	help
-	  Tool for managing Zeek deployments
-
-endif
-
-comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 7"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
deleted file mode 100644
index 05e57b5024..0000000000
--- a/package/zeek/zeek.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Locally computed:
-sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
-
-# Hash for license files:
-sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
-sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
deleted file mode 100644
index 584bfb0778..0000000000
--- a/package/zeek/zeek.mk
+++ /dev/null
@@ -1,92 +0,0 @@
-################################################################################
-#
-# zeek
-#
-################################################################################
-
-ZEEK_VERSION = 4.1.1
-ZEEK_SITE = https://download.zeek.org
-ZEEK_LICENSE = \
-	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
-	Public Domain (sqlite), \
-	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
-	LGPL-3.0+ (Multifast Project), \
-	BSD-2-Clause (event.h), \
-	BSD-3-Clause (in_cksum.cc) \
-	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
-	Apache-2.0 (highwayhash, folly), \
-	MPL-2.0 (mozilla-ca-list.zeek)
-ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
-ZEEK_CPE_ID_VENDOR = zeek
-ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
-ZEEK_DEPENDENCIES = \
-	host-bison \
-	host-flex \
-	host-pkgconf \
-	host-python3 \
-	host-zeek \
-	$(if $(BR2_PACKAGE_LIBKRB5),libkrb5) \
-	$(if $(BR2_PACKAGE_LIBMAXMINDDB),libmaxminddb) \
-	libpcap \
-	openssl \
-	$(if $(BR2_PACKAGE_ROCKSDB),rocksdb) \
-	zlib
-HOST_ZEEK_DEPENDENCIES = \
-	host-bison \
-	host-flex \
-	host-pkgconf \
-	host-python3 \
-	host-libpcap \
-	host-openssl \
-	host-zlib
-
-ZEEK_CONF_OPTS = \
-	-DBIFCL_EXE_PATH=$(HOST_DIR)/bin/bifcl \
-	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
-	-DBROKER_DISABLE_DOCS=ON \
-	-DBROKER_DISABLE_TESTS=ON \
-	-DINSTALL_AUX_TOOLS=ON \
-	-DZEEK_ETC_INSTALL_DIR=/etc
-
-define ZEEK_FIX_PYTHON_PATH
-	$(SED) 's,@PYTHON_EXECUTABLE@,/usr/bin/python,' \
-		$(@D)/auxil/zeekctl/ZeekControl/ssh_runner.py
-endef
-ZEEK_POST_PATCH_HOOKS += ZEEK_FIX_PYTHON_PATH
-
-ifeq ($(BR2_PACKAGE_JEMALLOC),y)
-ZEEK_DEPENDENCIES += jemalloc
-ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=ON
-else
-ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ZEEK_ZEEKCTL),y)
-ZEEK_DEPENDENCIES += host-swig python3
-ZEEK_CONF_OPTS += \
-	-DDISABLE_PYTHON_BINDINGS=OFF \
-	-DINSTALL_ZEEKCTL=ON \
-	-DPY_MOD_INSTALL_DIR=/usr/lib/zeekctl \
-	-DZEEK_PYTHON_PREFIX=/usr
-else
-ZEEK_CONF_OPTS += \
-	-DDISABLE_PYTHON_BINDINGS=ON \
-	-DINSTALL_ZEEKCTL=OFF
-endif
-
-ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-ZEEK_DEPENDENCIES += musl-fts
-ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
-endif
-
-HOST_ZEEK_MAKE_OPTS = binpac bifcl
-
-define HOST_ZEEK_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
-		$(HOST_DIR)/bin/bifcl
-	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
-		$(HOST_DIR)/bin/binpac
-endef
-
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))

--===============3816813020641763396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3816813020641763396==--
