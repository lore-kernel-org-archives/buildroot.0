Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EFFC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 132B36078B;
	Sat, 23 Mar 2024 20:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3fJI5ywViwT; Sat, 23 Mar 2024 20:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41EF9607A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EF9607A7;
	Sat, 23 Mar 2024 20:35:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9917E1BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8226182160
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYanOHhnhl5e for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4555C82061
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4555C82061
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:35:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 071CD839A1; Sat, 23 Mar 2024 20:35:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 21:34:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59674e5f8de5cb0a13344d04083287eb7fd3cf22
X-Git-Newrev: 2e9f161d4a7a68a041860e5855e98bee9d3a1498
X-Patchwork-Hint: ignore
Message-Id: <20240323203540.071CD839A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glog: bump to version 0.7.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e9f161d4a7a68a041860e5855e98bee9d3a1498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of COPYING (year updated and gettimeofday license
  dropped with:
  https://github.com/google/glog/commit/70285fddc728cd5dbc2d1a20b373d358f6ae62ae)
- elf detection has been reworked with
  https://github.com/google/glog/commit/7e6fca90e8bc69c6500ec61a6cc334dd8f682224
- threads are mandatory since
  https://github.com/google/glog/commit/fe46778bd326e3c012875eb756acaa4a1ca304f7

https://github.com/google/glog/releases/tag/v0.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                              |   1 -
 package/glog/0001-added-emscripten-support.patch | 292 -----------------------
 package/glog/Config.in                           |   9 +-
 package/glog/glog.hash                           |   4 +-
 package/glog/glog.mk                             |   6 +-
 5 files changed, 8 insertions(+), 304 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3b64c90d8b..ef1c661812 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -461,7 +461,6 @@ package/gerbera/S99gerbera Indent
 package/giblib/0001-fix-imlib2-detection.patch Upstream
 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
-package/glog/0001-added-emscripten-support.patch Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch Upstream
diff --git a/package/glog/0001-added-emscripten-support.patch b/package/glog/0001-added-emscripten-support.patch
deleted file mode 100644
index bb601affce..0000000000
--- a/package/glog/0001-added-emscripten-support.patch
+++ /dev/null
@@ -1,292 +0,0 @@
-From 6ed0c9e58b11680779c571996a3007bd972e0853 Mon Sep 17 00:00:00 2001
-From: Sergiu Deitsch <sergiud@users.noreply.github.com>
-Date: Thu, 4 Aug 2022 22:52:47 +0200
-Subject: [PATCH] added emscripten support (#846)
-
-[Retrieved from:
-https://github.com/google/glog/commit/6ed0c9e58b11680779c571996a3007bd972e0853,
-to fix build without threads, a fix that is lost in the middle of a
-larger commit adding emscripten support.]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .github/workflows/emscripten.yml | 60 ++++++++++++++++++++++++++++++++
- CMakeLists.txt                   | 14 ++++----
- src/config.h.cmake.in            |  6 ++--
- src/glog/logging.h.in            |  6 ++--
- src/glog/platform.h              |  2 ++
- src/logging.cc                   | 11 ++++--
- src/raw_logging.cc               |  9 ++---
- src/stacktrace_unwind-inl.h      |  2 +-
- src/symbolize.cc                 |  2 +-
- src/utilities.h                  |  2 +-
- 10 files changed, 93 insertions(+), 21 deletions(-)
- create mode 100644 .github/workflows/emscripten.yml
-
-diff --git a/.github/workflows/emscripten.yml b/.github/workflows/emscripten.yml
-new file mode 100644
-index 00000000..566c67eb
---- /dev/null
-+++ b/.github/workflows/emscripten.yml
-@@ -0,0 +1,60 @@
-+name: Emscripten
-+
-+on: [push, pull_request]
-+
-+jobs:
-+  build-linux:
-+    defaults:
-+      run:
-+        shell: bash
-+    name: Emscripten-C++${{matrix.std}}-${{matrix.build_type}}-${{matrix.lib}}-${{matrix.extra}}
-+    runs-on: ubuntu-latest
-+    container: emscripten/emsdk
-+    strategy:
-+      fail-fast: true
-+      matrix:
-+        build_type: [Release, Debug]
-+        extra: [no-custom-prefix, custom-prefix]
-+        lib: [static]
-+        std: [98, 11, 14, 17, 20]
-+
-+    steps:
-+      - uses: actions/checkout@v2
-+
-+      - name: Setup Dependencies
-+        run: |
-+          apt-get update
-+          DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
-+            cmake \
-+            ninja-build
-+
-+      - name: Setup C++98 Environment
-+        if: matrix.std == '98'
-+        run: |
-+          echo 'CXXFLAGS=-Wno-error=variadic-macros -Wno-error=long-long ${{env.CXXFLAGS}}' >> $GITHUB_ENV
-+
-+      - name: Configure
-+        env:
-+          CXXFLAGS: -Wall -Wextra -Wsign-conversion -Wtautological-compare -Wformat-nonliteral -Wundef -Werror -Wno-error=wasm-exception-spec ${{env.CXXFLAGS}}
-+        run: |
-+          cmake -S . -B build_${{matrix.build_type}} \
-+            -DBUILD_SHARED_LIBS=${{matrix.lib == 'shared'}} \
-+            -DCMAKE_AR=$(which emar) \
-+            -DCMAKE_C_COMPILER=$(which emcc) \
-+            -DCMAKE_CXX_COMPILER=$(which em++) \
-+            -DCMAKE_CXX_STANDARD=${{matrix.std}} \
-+            -DCMAKE_CXX_STANDARD_REQUIRED=ON \
-+            -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
-+            -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
-+            -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ONLY \
-+            -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
-+            -DCMAKE_INSTALL_PREFIX=${{github.workspace}}/install \
-+            -DCMAKE_RANLIB=$(which emranlib) \
-+            -DWITH_CUSTOM_PREFIX=${{matrix.extra == 'custom-prefix'}} \
-+            -G Ninja \
-+            -Werror
-+
-+      - name: Build
-+        run: |
-+          cmake --build build_${{matrix.build_type}} \
-+                --config ${{matrix.build_type}}
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 643a8b8a..ce6daa40 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -93,11 +93,11 @@ find_package (Unwind)
- if (Unwind_FOUND)
-   set (HAVE_LIB_UNWIND 1)
- else (Unwind_FOUND)
--  check_include_file_cxx (unwind.h HAVE_UNWIND_H)
-   # Check whether linking actually succeeds. ARM toolchains of LLVM unwind
-   # implementation do not necessarily provide the _Unwind_Backtrace function
-   # which causes the previous check to succeed but the linking to fail.
-   check_cxx_symbol_exists (_Unwind_Backtrace unwind.h HAVE__UNWIND_BACKTRACE)
-+  check_cxx_symbol_exists (_Unwind_GetIP unwind.h HAVE__UNWIND_GETIP)
- endif (Unwind_FOUND)
- 
- check_include_file_cxx (dlfcn.h HAVE_DLFCN_H)
-@@ -197,9 +197,10 @@ int main(void)
- }
- " HAVE___SYNC_VAL_COMPARE_AND_SWAP)
- 
--cmake_push_check_state (RESET)
--set (CMAKE_REQUIRED_LIBRARIES Threads::Threads)
--check_cxx_source_compiles ("
-+if (Threads_FOUND)
-+  cmake_push_check_state (RESET)
-+  set (CMAKE_REQUIRED_LIBRARIES Threads::Threads)
-+  check_cxx_source_compiles ("
- #define _XOPEN_SOURCE 500
- #include <pthread.h>
- int main(void)
-@@ -209,8 +210,9 @@ int main(void)
-   pthread_rwlock_rdlock(&l);
-   return 0;
- }
--" HAVE_RWLOCK)
--cmake_pop_check_state ()
-+  " HAVE_RWLOCK)
-+  cmake_pop_check_state ()
-+endif (Threads_FOUND)
- 
- check_cxx_source_compiles ("
- __declspec(selectany) int a;
-diff --git a/src/config.h.cmake.in b/src/config.h.cmake.in
-index b67e8a77..20b5f1c4 100644
---- a/src/config.h.cmake.in
-+++ b/src/config.h.cmake.in
-@@ -118,12 +118,12 @@
- /* Define to 1 if you have the <unistd.h> header file. */
- #cmakedefine HAVE_UNISTD_H ${HAVE_UNISTD_H}
- 
--/* Define if you have the <unwind.h> header file. */
--#cmakedefine HAVE_UNWIND_H
--
- /* Define if you linking to _Unwind_Backtrace is possible. */
- #cmakedefine HAVE__UNWIND_BACKTRACE
- 
-+/* Define if you linking to _Unwind_GetIP is possible. */
-+#cmakedefine HAVE__UNWIND_GETIP
-+
- /* define if the compiler supports using expression for operator */
- #cmakedefine HAVE_USING_OPERATOR
- 
-diff --git a/src/glog/logging.h.in b/src/glog/logging.h.in
-index c6def152..098e28fe 100644
---- a/src/glog/logging.h.in
-+++ b/src/glog/logging.h.in
-@@ -97,7 +97,7 @@
- 
- @ac_google_start_namespace@
- 
--#if @ac_cv_have_uint16_t@      // the C99 format
-+#if @ac_cv_have_stdint_h@      // the C99 format
- typedef int32_t int32;
- typedef uint32_t uint32;
- typedef int64_t int64;
-@@ -1822,8 +1822,8 @@ GLOG_EXPORT void SetEmailLogging(LogSeverity min_severity,
- 
- // A simple function that sends email. dest is a commma-separated
- // list of addressess.  Thread-safe.
--GLOG_EXPORT bool SendEmail(const char *dest,
--                                    const char *subject, const char *body);
-+GLOG_EXPORT bool SendEmail(const char* dest, const char* subject,
-+                           const char* body);
- 
- GLOG_EXPORT const std::vector<std::string>& GetLoggingDirectories();
- 
-diff --git a/src/glog/platform.h b/src/glog/platform.h
-index e6144119..7893c45d 100644
---- a/src/glog/platform.h
-+++ b/src/glog/platform.h
-@@ -50,6 +50,8 @@
- #define GLOG_OS_NETBSD
- #elif defined(__OpenBSD__)
- #define GLOG_OS_OPENBSD
-+#elif defined(__EMSCRIPTEN__)
-+#define GLOG_OS_EMSCRIPTEN
- #else
- // TODO(hamaji): Add other platforms.
- #error Platform not supported by glog. Please consider to contribute platform information by submitting a pull request on Github.
-diff --git a/src/logging.cc b/src/logging.cc
-index e65e80e9..1df1034a 100644
---- a/src/logging.cc
-+++ b/src/logging.cc
-@@ -2188,6 +2188,7 @@ void SetExitOnDFatal(bool value) {
- }  // namespace internal
- }  // namespace base
- 
-+#ifndef GLOG_OS_EMSCRIPTEN
- // Shell-escaping as we need to shell out ot /bin/mail.
- static const char kDontNeedShellEscapeChars[] =
-             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
-@@ -2222,14 +2223,14 @@ static string ShellEscape(const string& src) {
-   }
-   return result;
- }
--
-+#endif
- 
- // use_logging controls whether the logging functions LOG/VLOG are used
- // to log errors.  It should be set to false when the caller holds the
- // log_mutex.
- static bool SendEmailInternal(const char*dest, const char *subject,
-                               const char*body, bool use_logging) {
--#ifndef __EMSCRIPTEN__
-+#ifndef GLOG_OS_EMSCRIPTEN
-   if (dest && *dest) {
-     if ( use_logging ) {
-       VLOG(1) << "Trying to send TITLE:" << subject
-@@ -2275,6 +2276,12 @@ static bool SendEmailInternal(const char*dest, const char *subject,
-       }
-     }
-   }
-+#else
-+  (void)dest;
-+  (void)subject;
-+  (void)body;
-+  (void)use_logging;
-+  LOG(WARNING) << "Email support not available; not sending message";
- #endif
-   return false;
- }
-diff --git a/src/raw_logging.cc b/src/raw_logging.cc
-index 43159832..befeac89 100644
---- a/src/raw_logging.cc
-+++ b/src/raw_logging.cc
-@@ -59,11 +59,12 @@
- # include <unistd.h>
- #endif
- 
--#if (defined(HAVE_SYSCALL_H) || defined(HAVE_SYS_SYSCALL_H)) && (!(defined(GLOG_OS_MACOSX)))
--# define safe_write(fd, s, len)  syscall(SYS_write, fd, s, len)
-+#if (defined(HAVE_SYSCALL_H) || defined(HAVE_SYS_SYSCALL_H)) && \
-+    (!(defined(GLOG_OS_MACOSX))) && !defined(GLOG_OS_EMSCRIPTEN)
-+#define safe_write(fd, s, len) syscall(SYS_write, fd, s, len)
- #else
--  // Not so safe, but what can you do?
--# define safe_write(fd, s, len)  write(fd, s, len)
-+// Not so safe, but what can you do?
-+#define safe_write(fd, s, len) write(fd, s, len)
- #endif
- 
- _START_GOOGLE_NAMESPACE_
-diff --git a/src/stacktrace_unwind-inl.h b/src/stacktrace_unwind-inl.h
-index fbb5f988..dc1665b4 100644
---- a/src/stacktrace_unwind-inl.h
-+++ b/src/stacktrace_unwind-inl.h
-@@ -73,7 +73,7 @@ static _Unwind_Reason_Code GetOneFrame(struct _Unwind_Context *uc, void *opq) {
-   if (targ->skip_count > 0) {
-     targ->skip_count--;
-   } else {
--    targ->result[targ->count++] = (void *) _Unwind_GetIP(uc);
-+    targ->result[targ->count++] = reinterpret_cast<void *>(_Unwind_GetIP(uc));
-   }
- 
-   if (targ->count == targ->max_depth) {
-diff --git a/src/symbolize.cc b/src/symbolize.cc
-index 51025018..f56e97c9 100644
---- a/src/symbolize.cc
-+++ b/src/symbolize.cc
-@@ -834,7 +834,7 @@ static ATTRIBUTE_NOINLINE bool SymbolizeAndDemangle(void *pc, char *out,
- 
- _END_GOOGLE_NAMESPACE_
- 
--#elif defined(GLOG_OS_MACOSX) && defined(HAVE_DLADDR)
-+#elif (defined(GLOG_OS_MACOSX) || defined(GLOG_OS_EMSCRIPTEN)) && defined(HAVE_DLADDR)
- 
- #include <dlfcn.h>
- #include <cstring>
-diff --git a/src/utilities.h b/src/utilities.h
-index bd0ec632..760c142c 100644
---- a/src/utilities.h
-+++ b/src/utilities.h
-@@ -88,7 +88,7 @@
- 
- #if defined(HAVE_LIB_UNWIND)
- # define STACKTRACE_H "stacktrace_libunwind-inl.h"
--#elif defined(HAVE__UNWIND_BACKTRACE)
-+#elif defined(HAVE__UNWIND_BACKTRACE) && defined(HAVE__UNWIND_GETIP)
- # define STACKTRACE_H "stacktrace_unwind-inl.h"
- #elif !defined(NO_FRAME_POINTER)
- # if defined(__i386__) && __GNUC__ >= 2
diff --git a/package/glog/Config.in b/package/glog/Config.in
index 3376323004..bbdd1e2151 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -1,13 +1,12 @@
 config BR2_PACKAGE_GLOG
 	bool "glog"
-	# __ELF__ not defined on Microblaze
-	depends on !BR2_microblaze
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
-comment "glog needs a toolchain w/ C++"
-	depends on !BR2_microblaze
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "glog needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index fab77c522b..fb0ea93979 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8a83bf982f37bb70825df71a9709fa90ea9f4447fb3c099e1d720a439d88bad6  glog-0.6.0.tar.gz
+sha256  375106b5976231b92e66879c1a92ce062923b9ae573c42b56ba28b112ee4cc11  glog-0.7.0.tar.gz
 
 # Hash for License file:
-sha256  0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
+sha256  136d48dea7a681413691f3db3098f6cf5ffaa3119d96d97bb83b8cff3ce38c4a  COPYING
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index ddf71fd15a..4b3f39be3a 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-GLOG_VERSION = 0.6.0
+GLOG_VERSION = 0.7.0
 GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
 GLOG_LICENSE_FILES = COPYING
-GLOG_CONF_OPTS = \
-	-DWITH_GTEST=OFF \
-	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
+GLOG_CONF_OPTS = -DWITH_GTEST=OFF
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
 GLOG_DEPENDENCIES += gflags
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
