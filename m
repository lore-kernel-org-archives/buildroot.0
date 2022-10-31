Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D0CFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 18:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56087402EF;
	Mon, 31 Oct 2022 18:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56087402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MYyhIZP1rwMQ; Mon, 31 Oct 2022 18:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7F2402F3;
	Mon, 31 Oct 2022 18:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7F2402F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDAA01BF29D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C924080E36
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C924080E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSIis1P6gXR7 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 18:25:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FEC580DE9
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FEC580DE9
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 18:25:24 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout07.t-online.de (Postfix) with SMTP id 2E82B12485;
 Mon, 31 Oct 2022 19:25:21 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opZTJ-27vcnZ0; Mon, 31 Oct 2022 19:25:17 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59890)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opZTJ-0003iQ-0s;
 Mon, 31 Oct 2022 19:25:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 19:25:16 +0100
Message-Id: <20221031182517.263500-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031182517.263500-1-bernd.kuhls@t-online.de>
References: <20221031182517.263500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667240717-E38B1E65-63AABF93/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ece3c78-225e-4695-937b-539fb2dc0f6c
Subject: [Buildroot] [PATCH 2/3] package/monero: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../monero/0001-disable-stack-protector.patch |  22 ++++
 package/monero/0002-system-miniupnpc.patch    | 112 ++++++++++++++++++
 ...lation-and-JIT-support-on-aarch64_be.patch |  28 +++++
 package/monero/Config.in                      |  35 ++++++
 package/monero/monero.hash                    |   3 +
 package/monero/monero.mk                      |  55 +++++++++
 8 files changed, 257 insertions(+)
 create mode 100644 package/monero/0001-disable-stack-protector.patch
 create mode 100644 package/monero/0002-system-miniupnpc.patch
 create mode 100644 package/monero/0003-Fix-compilation-and-JIT-support-on-aarch64_be.patch
 create mode 100644 package/monero/Config.in
 create mode 100644 package/monero/monero.hash
 create mode 100644 package/monero/monero.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 06ee5d8056..7db7954871 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -407,6 +407,7 @@ F:	package/libyuv/
 F:	package/mesa3d/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
+F:	package/monero/
 F:	package/nut/
 F:	package/perl-crypt-openssl-guess/
 F:	package/perl-crypt-openssl-random/
diff --git a/package/Config.in b/package/Config.in
index fff8186351..ac811bf2e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2179,6 +2179,7 @@ menu "Miscellaneous"
 	source "package/haveged/Config.in"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/monero/Config.in"
 	source "package/netdata/Config.in"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
diff --git a/package/monero/0001-disable-stack-protector.patch b/package/monero/0001-disable-stack-protector.patch
new file mode 100644
index 0000000000..0407b4e32d
--- /dev/null
+++ b/package/monero/0001-disable-stack-protector.patch
@@ -0,0 +1,22 @@
+Disable unconditional stack-protector support
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr monero-source-v0.18.1.0.orig/CMakeLists.txt monero-source-v0.18.1.0/CMakeLists.txt
+--- monero-source-v0.18.1.0.orig/CMakeLists.txt	2022-08-10 05:34:23.000000000 +0200
++++ monero-source-v0.18.1.0/CMakeLists.txt	2022-08-15 18:40:52.240699837 +0200
+@@ -831,14 +831,6 @@
+   add_c_flag_if_supported(-Wformat-security C_SECURITY_FLAGS)
+   add_cxx_flag_if_supported(-Wformat-security CXX_SECURITY_FLAGS)
+ 
+-  # -fstack-protector
+-  if (NOT OPENBSD AND NOT (WIN32 AND (CMAKE_C_COMPILER_ID STREQUAL "GNU" AND CMAKE_C_COMPILER_VERSION VERSION_LESS 9.1)))
+-    add_c_flag_if_supported(-fstack-protector C_SECURITY_FLAGS)
+-    add_cxx_flag_if_supported(-fstack-protector CXX_SECURITY_FLAGS)
+-    add_c_flag_if_supported(-fstack-protector-strong C_SECURITY_FLAGS)
+-    add_cxx_flag_if_supported(-fstack-protector-strong CXX_SECURITY_FLAGS)
+-  endif()
+-
+   # New in GCC 8.2
+   if (NOT OPENBSD AND NOT (WIN32 AND (CMAKE_C_COMPILER_ID STREQUAL "GNU" AND CMAKE_C_COMPILER_VERSION VERSION_LESS 9.1)))
+     add_c_flag_if_supported(-fcf-protection=full C_SECURITY_FLAGS)
diff --git a/package/monero/0002-system-miniupnpc.patch b/package/monero/0002-system-miniupnpc.patch
new file mode 100644
index 0000000000..e12d9302bd
--- /dev/null
+++ b/package/monero/0002-system-miniupnpc.patch
@@ -0,0 +1,112 @@
+Add support for miniupnpc system library
+
+Downloaded from
+https://git.alpinelinux.org/aports/plain/community/monero/system-miniupnpc.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -676,6 +676,14 @@
+ include_directories("${CMAKE_CURRENT_BINARY_DIR}/translations")
+ add_subdirectory(external)
+ 
++# Final setup for miniupnpc
++if(UPNP_STATIC OR IOS)
++  add_definitions("-DUPNP_STATIC")
++else()
++  add_definitions("-DUPNP_DYNAMIC")
++  include_directories(${UPNP_INCLUDE})
++endif()
++
+ # Final setup for libunbound
+ include_directories(${UNBOUND_INCLUDE_DIR})
+ 
+diff --git a/src/p2p/net_node.inl b/src/p2p/net_node.inl
+index 9b21705e..76340a22 100644
+--- a/src/p2p/net_node.inl
++++ b/src/p2p/net_node.inl
+@@ -60,9 +60,16 @@
+ #include "cryptonote_core/cryptonote_core.h"
+ #include "net/parse.h"
+ 
+-#include <miniupnp/miniupnpc/miniupnpc.h>
+-#include <miniupnp/miniupnpc/upnpcommands.h>
+-#include <miniupnp/miniupnpc/upnperrors.h>
++// We have to look for miniupnpc headers in different places, dependent on if its compiled or external
++#ifdef UPNP_STATIC
++  #include <miniupnp/miniupnpc/miniupnpc.h>
++  #include <miniupnp/miniupnpc/upnpcommands.h>
++  #include <miniupnp/miniupnpc/upnperrors.h>
++#else
++  #include "miniupnpc.h"
++  #include "upnpcommands.h"
++  #include "upnperrors.h"
++#endif
+ 
+ #undef MONERO_DEFAULT_LOG_CATEGORY
+ #define MONERO_DEFAULT_LOG_CATEGORY "net.p2p"
+-- 
+2.17.0
+
+--- a/external/CMakeLists.txt	2021-12-04 03:56:51.405517304 +0200
++++ b/external/CMakeLists.txt	2021-12-04 04:02:37.649484660 +0200
+@@ -34,24 +34,46 @@
+ # We always compile if we are building statically to reduce static dependency issues...
+ # ...except for FreeBSD, because FreeBSD is a special case that doesn't play well with
+ # others.
++if(NOT IOS)
++    find_package(Miniupnpc QUIET)
++endif()
+ 
+-find_package(Miniupnpc REQUIRED)
+-
+-message(STATUS "Using in-tree miniupnpc")
+-set(UPNPC_NO_INSTALL TRUE CACHE BOOL "Disable miniupnp installation" FORCE)
+-add_subdirectory(miniupnp/miniupnpc)
+-set_property(TARGET libminiupnpc-static PROPERTY FOLDER "external")
+-set_property(TARGET libminiupnpc-static PROPERTY POSITION_INDEPENDENT_CODE ON)
+-if(MSVC)
+-  set_property(TARGET libminiupnpc-static APPEND_STRING PROPERTY COMPILE_FLAGS " -wd4244 -wd4267")
+-elseif(NOT MSVC)
+-  set_property(TARGET libminiupnpc-static APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-undef -Wno-unused-result -Wno-unused-value")
++# If we have the correct shared version and we're not building static, use it
++if(STATIC OR IOS)
++ set(USE_SHARED_MINIUPNPC false)
++elseif(MINIUPNP_FOUND AND MINIUPNPC_VERSION_1_7_OR_HIGHER)
++ set(USE_SHARED_MINIUPNPC true)
+ endif()
++
++
++if(USE_SHARED_MINIUPNPC)
++  message(STATUS "Using shared miniupnpc found at ${MINIUPNP_INCLUDE_DIR}")
++
++  set(UPNP_STATIC false PARENT_SCOPE)
++  set(UPNP_INCLUDE ${MINIUPNP_INCLUDE_DIR} PARENT_SCOPE)
++  set(UPNP_LIBRARIES ${MINIUPNP_LIBRARY} PARENT_SCOPE)
++else()
++  if(STATIC)
++    message(STATUS "Using miniupnpc from local source tree for static build")
++  else()
++    message(STATUS "Using miniupnpc from local source tree (/external/miniupnp/miniupnpc)")
++  endif()
++  add_subdirectory(miniupnp/miniupnpc)
++
++  set_property(TARGET libminiupnpc-static PROPERTY FOLDER "external")
++  if(MSVC)
++    set_property(TARGET libminiupnpc-static APPEND_STRING PROPERTY COMPILE_FLAGS " -wd4244 -wd4267")
++  elseif(NOT MSVC)
++    set_property(TARGET libminiupnpc-static APPEND_STRING PROPERTY COMPILE_FLAGS " -Wno-undef -Wno-unused-result -Wno-unused-value")
++  endif()
++
+ if(CMAKE_SYSTEM_NAME MATCHES "NetBSD")
+ 	set_property(TARGET libminiupnpc-static APPEND_STRING PROPERTY COMPILE_FLAGS " -D_NETBSD_SOURCE")
+ endif()
+ 
+-set(UPNP_LIBRARIES "libminiupnpc-static" PARENT_SCOPE)
++  set(UPNP_STATIC true PARENT_SCOPE)
++  set(UPNP_LIBRARIES "libminiupnpc-static" PARENT_SCOPE)
++endif()
+ 
+ find_package(Unbound)
+ 
diff --git a/package/monero/0003-Fix-compilation-and-JIT-support-on-aarch64_be.patch b/package/monero/0003-Fix-compilation-and-JIT-support-on-aarch64_be.patch
new file mode 100644
index 0000000000..e15ebc127a
--- /dev/null
+++ b/package/monero/0003-Fix-compilation-and-JIT-support-on-aarch64_be.patch
@@ -0,0 +1,28 @@
+From 1e5f48aa9dcb8c17b645fa09544da08c7c9be432 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 31 Oct 2022 19:11:37 +0100
+Subject: [PATCH] Fix compilation and JIT support on aarch64_be
+
+Patch sent upstream: https://github.com/tevador/RandomX/pull/257
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ external/randomx/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4b6ba9e..2812449 100644
+--- a/external/randomx/CMakeLists.txt
++++ b/external/randomx/CMakeLists.txt
+@@ -150,7 +150,7 @@ if(ARCH_ID STREQUAL "ppc64" OR ARCH_ID STREQUAL "ppc64le")
+ endif()
+ 
+ # ARMv8
+-if(ARM_ID STREQUAL "aarch64" OR ARM_ID STREQUAL "arm64" OR ARM_ID STREQUAL "armv8-a")
++if(ARM_ID STREQUAL "aarch64" OR ARM_ID STREQUAL "aarch64_be" OR ARM_ID STREQUAL "arm64" OR ARM_ID STREQUAL "armv8-a")
+   list(APPEND randomx_sources
+     src/jit_compiler_a64_static.S
+     src/jit_compiler_a64.cpp)
+-- 
+2.34.1
+
diff --git a/package/monero/Config.in b/package/monero/Config.in
new file mode 100644
index 0000000000..c18d54e684
--- /dev/null
+++ b/package/monero/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_MONERO
+	bool "monero"
+	depends on !BR2_i386
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	# monero needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_LOCALE
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_CZMQ
+	select BR2_PACKAGE_LIBMINIUPNPC
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UNBOUND
+	help
+	  The secure, private, untraceable cryptocurrency
+
+	  https://getmonero.org/
+
+comment "monero needs a glibc or musl toolchain w/ C++, dynamic library, threads"
+	depends on !BR2_i386
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/monero/monero.hash b/package/monero/monero.hash
new file mode 100644
index 0000000000..91f452cbec
--- /dev/null
+++ b/package/monero/monero.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0b667acba2223f8f082b388d7ceb5d212e0515b8a94395f3ec69183ef4bebf6c  monero-source-v0.18.1.2.tar.bz2
+sha256  c2fe351163f4e0cee45d38e9481f2ea60f3cb77b24f818c4a2c740383f2f4cb2  LICENSE
diff --git a/package/monero/monero.mk b/package/monero/monero.mk
new file mode 100644
index 0000000000..ee215f90e1
--- /dev/null
+++ b/package/monero/monero.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# monero
+#
+################################################################################
+
+MONERO_VERSION = 0.18.1.2
+MONERO_SOURCE = monero-source-v$(MONERO_VERSION).tar.bz2
+MONERO_SITE = https://downloads.getmonero.org/cli
+MONERO_LICENSE = MIT
+MONERO_LICENSE_FILES = LICENSE
+MONERO_CONF_OPTS = \
+	-DBUILD_DOCUMENTATION=OFF \
+	-DCMAKE_CXX_FLAGS="$(MONERO_CXXFLAGS)" \
+	-DCMAKE_BUILD_TYPE=None \
+	-DMANUAL_SUBMODULES=ON \
+	-DSTACK_TRACE=OFF \
+	-DUSE_CCACHE=OFF \
+	-DUSE_DEVICE_TREZOR=OFF
+MONERO_DEPENDENCIES = \
+	boost \
+	czmq \
+	libminiupnpc \
+	libsodium \
+	openssl \
+	unbound
+
+ifeq ($(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64el)$(BR2_sparc64),y)
+MONERO_CONF_OPTS += -DNO_AES=ON
+endif
+
+MONERO_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
+
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+MONERO_CXXFLAGS += -latomic
+endif
+
+# relocation truncated to fit: R_MIPS_GOT16
+ifeq ($(BR2_mipsel),y)
+MONERO_CXXFLAGS += -mxgot
+endif
+
+ifeq ($(BR2_PACKAGE_HIDAPI),y)
+MONERO_DEPENDENCIES += hidapi
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+MONERO_CONF_OPTS += -DUSE_READLINE=ON
+MONERO_DEPENDENCIES += readline
+else
+MONERO_CONF_OPTS += -DUSE_READLINE=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
