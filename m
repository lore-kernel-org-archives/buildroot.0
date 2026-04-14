Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7FFF9D0F1
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CFD6F4DA;
	Tue, 14 Apr 2026 19:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd269KnLYeXh; Tue, 14 Apr 2026 19:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08EF36F4DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776194061;
	bh=MSiW46qdfcafHKmE/ksU3RrlVP6le1GB2lwD2Hs/uuo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cb1qjA5vL8wd6K0XwT2nFU1dcOLuZvxDjHTYkdfdWw9pH/KQLcNldSYi84Eoib514
	 gEEJAFXN3V8lybeWkdpSR5m2SeziMLulNiq088u+dUKbl0S0Xr0LBVEL1IpzWbv932
	 kbzAdfBrG1Kw34t8QIYVgnPZqfB0x1xi8AJb9cN2qLgefPsPS3aPnk7FL8bpUxM4R8
	 nvjan765XKVZRDsP5p/6NcT120IQTFq5nf+t2DAIiOHomSwD/Nd8s2mUb2twydaaLd
	 o5NFiWYHYf3f5+4NdXVXtv1LDL9pvwH7UNgxZrYEJJoxAgISnH8lhFj/cYLQoptH+P
	 0xV2aRZXejU6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08EF36F4DB;
	Tue, 14 Apr 2026 19:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20280237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0611640467
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBTUHkl9do7A for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB957403A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB957403A5
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67CA080FF6; Tue, 14 Apr 2026 19:14:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:10:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4998fdcba7cf4c937c196a5975b1e05d076fde54
X-Git-Newrev: 5114291fb2c5ed8c77b308e7018755533f7f8ae3
X-Patchwork-Hint: ignore
Message-Id: <20260414191418.67CA080FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycbor: bump to v7.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3114840082614865498=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3114840082614865498==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5114291fb2c5ed8c77b308e7018755533f7f8ae3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update tinycbor to the latest version. This release migrates from a
hand-written Makefile to CMake, which required a number of patches to
restore parity with the old system:

 - Fix building on toolchains without C++ support
 - Keep installing the json2cbor command line tool

Also building on GCC versions older than 11 was fixed and subsequently
broken again, so this requires a refreshed version of the patch that was
already present for 0.6.1.

Changelog: https://github.com/intel/tinycbor/releases/tag/v7.0
Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ith-GCC-11-fallthrough-is-supported-but-n.patch | 55 -------------------
 package/tinycbor/0001-install-json2cbor.patch      | 29 ++++++++++
 ...002-compilersupport-fix-build-with-GCC-11.patch | 41 ++++++++++++++
 .../0002-fix-build-on-i386-without-SSE2.patch      | 59 --------------------
 ...don-t-depend-on-C-compiler-for-main-build.patch | 62 ++++++++++++++++++++++
 package/tinycbor/tinycbor.hash                     |  2 +-
 package/tinycbor/tinycbor.mk                       | 31 +----------
 7 files changed, 135 insertions(+), 144 deletions(-)

diff --git a/package/tinycbor/0001-Fix-build-with-GCC-11-fallthrough-is-supported-but-n.patch b/package/tinycbor/0001-Fix-build-with-GCC-11-fallthrough-is-supported-but-n.patch
deleted file mode 100644
index e54e8db6e2..0000000000
--- a/package/tinycbor/0001-Fix-build-with-GCC-11-fallthrough-is-supported-but-n.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 45e4641059709862b4e46f3608d140337566334b Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Wed, 2 Apr 2025 08:39:04 -0700
-Subject: [PATCH] Fix build with GCC < 11: [[fallthrough]] is supported but not
- allowed in C
-
-I think GCC says `__has_cpp_attribute(fallthrough)` is true because C++
-supports it (it means "has C++ attribute"), but that doesn't apply to
-the C language. This causes a compilation error:
-
-```
-compilersupport_p.h:57:41: error: expected expression before '[' token
-   57 | #    define CBOR_FALLTHROUGH            [[fallthrough]]
-      |                                         ^
-cborparser.c:225:13: note: in expansion of macro 'CBOR_FALLTHROUGH'
-  225 |             CBOR_FALLTHROUGH;
-      |             ^~~~~~~~~~~~~~~~
-```
-
-Instead, we should use the C23 `__has_c_attribute` to detect the C
-attribute.
-
-Fixes #293.
-
-Signed-off-by: Thiago Macieira <thiago.macieira@intel.com>
-
-Upstream: https://github.com/intel/tinycbor/commit/45e4641059709862b4e46f3608d140337566334b
-Signed-off-by: Florian Larysch <fl@n621.de>
----
- src/compilersupport_p.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/compilersupport_p.h b/src/compilersupport_p.h
-index c91ea93..9251799 100644
---- a/src/compilersupport_p.h
-+++ b/src/compilersupport_p.h
-@@ -52,10 +52,14 @@
- #  define cbor_static_assert(x)         ((void)sizeof(char[2*!!(x) - 1]))
- #endif
- 
--#if defined(__has_cpp_attribute)    // C23 and C++17
-+#if defined(__has_cpp_attribute) && defined(__cplusplus)    // C++17
- #  if __has_cpp_attribute(fallthrough)
- #    define CBOR_FALLTHROUGH            [[fallthrough]]
- #  endif
-+#elif defined(__has_c_attribute) && !defined(__cplusplus)   // C23
-+#  if __has_c_attribute(fallthrough)
-+#    define CBOR_FALLTHROUGH            [[fallthrough]]
-+#  endif
- #endif
- #ifndef CBOR_FALLTHROUGH
- #  ifdef __GNUC__
--- 
-2.50.1
-
diff --git a/package/tinycbor/0001-install-json2cbor.patch b/package/tinycbor/0001-install-json2cbor.patch
new file mode 100644
index 0000000000..c635070e28
--- /dev/null
+++ b/package/tinycbor/0001-install-json2cbor.patch
@@ -0,0 +1,29 @@
+From c2c569fbef704685ce62d45fb7b20a804f45e9f3 Mon Sep 17 00:00:00 2001
+From: Florian Larysch <larysch@fixme.gmbh>
+Date: Mon, 13 Apr 2026 21:57:03 +0200
+Subject: [PATCH] install json2cbor
+
+The old Make-based build system installed json2cbor during "make
+install" if it has been built. However, this behavior got dropped during
+the CMake migration, causing this tool to be missing by default. Restore
+the old behavior.
+
+Signed-off-by: Florian Larysch <fl@n621.de>
+Upstream: https://github.com/intel/tinycbor/commit/c2c569fbef704685ce62d45fb7b20a804f45e9f3
+---
+ tools/json2cbor/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/json2cbor/CMakeLists.txt b/tools/json2cbor/CMakeLists.txt
+index 41892a3..a873114 100644
+--- a/tools/json2cbor/CMakeLists.txt
++++ b/tools/json2cbor/CMakeLists.txt
+@@ -6,4 +6,5 @@ if(LIBCJSON_FOUND)
+   tinycbor_add_executable(json2cbor json2cbor.c)
+   target_include_directories(json2cbor SYSTEM PUBLIC ${LIBCJSON_INCLUDE_DIRS})
+   target_link_libraries(json2cbor ${LIBCJSON_LIBRARIES})
++  install(TARGETS json2cbor)
+ endif()
+-- 
+2.53.0
+
diff --git a/package/tinycbor/0002-compilersupport-fix-build-with-GCC-11.patch b/package/tinycbor/0002-compilersupport-fix-build-with-GCC-11.patch
new file mode 100644
index 0000000000..6c4b368eff
--- /dev/null
+++ b/package/tinycbor/0002-compilersupport-fix-build-with-GCC-11.patch
@@ -0,0 +1,41 @@
+From 4adba2c1cc376cbbbbc603595e2f561a21259bfb Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Mon, 13 Apr 2026 23:34:39 +0200
+Subject: [PATCH] compilersupport: fix build with GCC < 11
+
+Commit 45e4641 ("Fix build with GCC < 11: [[fallthrough]] is supported
+but not allowed in C") introduced a fix for old GCC versions, but commit
+91d1c50 ("compilersupport: fix compilation in C23 mode") reverted it,
+reintroducing the build failure.
+
+Revert the revert.
+
+Signed-off-by: Florian Larysch <fl@n621.de>
+Upstream: https://github.com/intel/tinycbor/commit/76d7a29cead0f8c1c72a6b4fb2ecbc8a9885ed89
+---
+ src/compilersupport_p.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/compilersupport_p.h b/src/compilersupport_p.h
+index 7f24773..670a291 100644
+--- a/src/compilersupport_p.h
++++ b/src/compilersupport_p.h
+@@ -52,10 +52,14 @@
+ #  define cbor_static_assert(x)         ((void)sizeof(char[2*!!(x) - 1]))
+ #endif
+ 
+-#if defined(__has_cpp_attribute)    // C23 and C++17
++#if defined(__has_cpp_attribute) && defined(__cplusplus)    // C++17
+ #  if __has_cpp_attribute(fallthrough)
+ #    define CBOR_FALLTHROUGH            [[fallthrough]]
+ #  endif
++#elif defined(__has_c_attribute) && !defined(__cplusplus)   // C23
++#  if __has_c_attribute(fallthrough)
++#    define CBOR_FALLTHROUGH            [[fallthrough]]
++#  endif
+ #endif
+ #ifndef CBOR_FALLTHROUGH
+ #  ifdef __GNUC__
+-- 
+2.53.0
+
diff --git a/package/tinycbor/0002-fix-build-on-i386-without-SSE2.patch b/package/tinycbor/0002-fix-build-on-i386-without-SSE2.patch
deleted file mode 100644
index 45611e6f23..0000000000
--- a/package/tinycbor/0002-fix-build-on-i386-without-SSE2.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 48a22bddfcc67b3a433ded695f906cc314a0bd5f Mon Sep 17 00:00:00 2001
-From: Florian Larysch <fl@n621.de>
-Date: Sun, 17 Aug 2025 00:20:57 +0200
-Subject: [PATCH] fix build on i386 without SSE2
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 3cba6b1 ("Use _Float16 for half conversions if available") added
-support for using half-width float support in the compiler to perform
-encoding operations, using the FLT16_MANT_DIG macro to check for
-support on the given target.
-
-However, on x86 GCC only supports this when SSE2 is enabled[1]. Unlike
-clang and the other architectures where support for this is conditional,
-GCC *does* define those macros even without SSE2 support, causing a
-build failure:
-
-  In file included from cborencoder_float.c:29:
-  cborinternal_p.h: In function ‘encode_half’:
-  cborinternal_p.h:56:5: error: invalid conversion to type ‘_Float16’ without option ‘-msse2’
-     56 |     _Float16 f = (_Float16)x;
-        |     ^~~~~~~~
-  cborinternal_p.h: In function ‘decode_half’:
-  cborinternal_p.h:65:5: error: invalid conversion from type ‘_Float16’ without option ‘-msse2’
-     65 |     return (float)f;
-        |
-
-Work around this by additionally checking for this specific condition.
-
-[1] https://gcc.gnu.org/onlinedocs/gcc/Half-Precision.html
-
-Upstream: https://github.com/intel/tinycbor/commit/48a22bddfcc67b3a433ded695f906cc314a0bd5f
-Signed-off-by: Florian Larysch <fl@n621.de>
----
- src/cborinternal_p.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/cborinternal_p.h b/src/cborinternal_p.h
-index 19273ac..ee9c117 100644
---- a/src/cborinternal_p.h
-+++ b/src/cborinternal_p.h
-@@ -48,8 +48,12 @@
- /* Check for FLT16_MANT_DIG using integer comparison. Clang headers incorrectly
-  * define this macro unconditionally when __STDC_WANT_IEC_60559_TYPES_EXT__
-  * is defined (regardless of actual support for _Float16).
-+ *
-+ * GCC defines these macros but doesn't support arithmetic including
-+ * conversions on x86 without SSE2.
-  */
--#  if FLT16_MANT_DIG > 0 || __FLT16_MANT_DIG__ > 0
-+#  if (FLT16_MANT_DIG > 0 || __FLT16_MANT_DIG__ > 0) && \
-+      !(defined(__i386__) && !defined(__SSE2__))
- static inline unsigned short encode_half(float x)
- {
-     unsigned short h;
--- 
-2.50.1
-
diff --git a/package/tinycbor/0003-CMake-don-t-depend-on-C-compiler-for-main-build.patch b/package/tinycbor/0003-CMake-don-t-depend-on-C-compiler-for-main-build.patch
new file mode 100644
index 0000000000..7fabb1e57d
--- /dev/null
+++ b/package/tinycbor/0003-CMake-don-t-depend-on-C-compiler-for-main-build.patch
@@ -0,0 +1,62 @@
+From bd2f0a3d2402cbb2d6e071cc3051ad04aa93e63d Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Mon, 13 Apr 2026 23:26:21 +0200
+Subject: [PATCH] CMake: don't depend on C++ compiler for main build
+
+Only the tests actually require a C++ compiler, however CXX is globally
+enabled for the project, which prevents building on targets that do
+not have a C++ compiler available.
+
+Only enable C++ support selectively when building the tests is enabled
+too.
+
+Signed-off-by: Florian Larysch <fl@n621.de>
+Upstream: https://github.com/intel/tinycbor/pull/323
+---
+ CMakeLists.txt | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e504ee5..e185474 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -24,7 +24,7 @@
+ 
+ cmake_minimum_required(VERSION 3.10)
+ 
+-project(tinycbor LANGUAGES C CXX VERSION 7.0)
++project(tinycbor LANGUAGES C VERSION 7.0)
+ 
+ # Set path to additional cmake scripts
+ set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
+@@ -56,7 +56,7 @@ add_library(tinycbor
+ )
+ if(WITH_FREESTANDING)
+   target_compile_options(tinycbor PUBLIC
+-    $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-ffreestanding>
++    $<$<NOT:$<C_COMPILER_ID:MSVC>>:-ffreestanding>
+   )
+ else()
+   target_sources(tinycbor PRIVATE
+@@ -106,8 +106,8 @@ endif()
+ 
+ # Enable warnings
+ target_compile_options(tinycbor PRIVATE
+-  $<$<CXX_COMPILER_ID:MSVC>:-W3>
+-  $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:
++  $<$<C_COMPILER_ID:MSVC>:-W3>
++  $<$<NOT:$<C_COMPILER_ID:MSVC>>:
+     -Wall -Wextra
+     -Werror=format-security
+     -Werror=incompatible-pointer-types
+@@ -181,6 +181,7 @@ if(BUILD_EXAMPLES)
+   add_subdirectory(examples)
+ endif()
+ if(BUILD_TESTING)
++  enable_language(CXX)
+   enable_testing()
+   add_subdirectory(tests)
+ endif()
+-- 
+2.53.0
+
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index dd63822908..808e487694 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0f9944496d1143935e9c996bc6233ca0dd5451299def33ef400a409942f8f34b  tinycbor-0.6.1.tar.gz
+sha256  8b1b76001b9f987677f2ea7aa814fba1f810ff6cbbffa62ea3bac612c55b1a56  tinycbor-7.0.tar.gz
 sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 03067edbd7..188cd4617b 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,42 +4,15 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = 0.6.1
+TINYCBOR_VERSION = 7.0
 TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
 
-TINYCBOR_DEPENDENCIES = host-pkgconf
 TINYCBOR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
 
-TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1 prefix=/usr
-
-ifeq ($(BR2_STATIC_LIBS),y)
-TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=1
-else ifeq ($(BR2_SHARED_LIBS),y)
-TINYCBOR_MAKE_OPTS += BUILD_STATIC=0 BUILD_SHARED=1
-endif
-
-# disabled parallel build because of build failures while
-# producing the .config file
-define TINYCBOR_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(TINYCBOR_MAKE_OPTS) -C $(@D)
-endef
-
-define TINYCBOR_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) install
-endef
-
-define TINYCBOR_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))

--===============3114840082614865498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3114840082614865498==--
