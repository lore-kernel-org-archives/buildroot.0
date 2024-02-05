Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5459FC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BF594098E;
	Mon,  5 Feb 2024 09:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BF594098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtrsEir-9nYj; Mon,  5 Feb 2024 09:49:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D4241775;
	Mon,  5 Feb 2024 09:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D4241775
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 218DD1BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEFE860E83
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEFE860E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSKeKxj8kfYZ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5902F6074C
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5902F6074C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45D55869B8; Mon,  5 Feb 2024 09:49:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 10:49:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7794fa4c4e1d19a245bb0367cde94560432a2bc5
X-Git-Newrev: 00599be13ed5022bab7e49fee8db07e20af8a4ba
X-Patchwork-Hint: ignore
Message-Id: <20240205094953.45D55869B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump to v2.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=00599be13ed5022bab7e49fee8db07e20af8a4ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A bunch of release notes:

https://fluentbit.io/announcements/v2.1.8
https://fluentbit.io/announcements/v2.1.9
https://fluentbit.io/announcements/v2.1.10
https://fluentbit.io/announcements/v2.2.0
https://fluentbit.io/announcements/v2.2.1
https://fluentbit.io/announcements/v2.2.2

In addition:

- Dropped -fcommon fix for monkey (multiple definitions of `mk_tls_*'),
  as this is fixed upstream [1].

- Added WAMR related patches.

- Rebased the patches for v2.2.2.

[1] https://github.com/monkey/monkey/commit/627422b901af5c3c5b770d02c4a4567a0a8a61e6.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-use-the-system-provided-LuaJIT-if-found.patch | 12 +--
 ...fka-CMakeLists.txt-allow-compilation-with.patch | 25 +++---
 ...txt-disable-cxx-support-for-librdkafka-77.patch |  8 +-
 ...asm-restore-support-for-some-targets-8401.patch | 43 ++++++++++
 ...ting-write-gs-base-with-cmake-variable-30.patch | 99 ++++++++++++++++++++++
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  6 +-
 7 files changed, 167 insertions(+), 28 deletions(-)

diff --git a/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
index 9f6f4d0ebb..aca6401ac8 100644
--- a/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
+++ b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
@@ -1,4 +1,4 @@
-From 4f8eb7bb5a39d83374806928b7a5b622136ef055 Mon Sep 17 00:00:00 2001
+From 8d6f6cfb07a8fe32dc0b9577e1b2f1ee1b67b736 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
 Date: Fri, 28 Apr 2023 10:25:16 +0200
 Subject: [PATCH] build: use the system provided LuaJIT if found
@@ -15,10 +15,10 @@ Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
  2 files changed, 12 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9af783c79..0601b7c18 100644
+index 2da792d53..3229420c6 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -123,6 +123,7 @@ option(FLB_TESTS_INTERNAL_FUZZ "Enable internal fuzz tests"    No)
+@@ -128,6 +128,7 @@ option(FLB_TESTS_INTERNAL_FUZZ "Enable internal fuzz tests"    No)
  option(FLB_TESTS_OSSFUZZ       "Enable OSS-Fuzz build"         No)
  option(FLB_MTRACE              "Enable mtrace support"         No)
  option(FLB_POSIX_TLS           "Force POSIX thread storage"    No)
@@ -26,7 +26,7 @@ index 9af783c79..0601b7c18 100644
  option(FLB_INOTIFY             "Enable inotify support"       Yes)
  option(FLB_SQLDB               "Enable SQL embedded DB"       Yes)
  option(FLB_HTTP_SERVER         "Enable HTTP Server"           Yes)
-@@ -1003,7 +1004,16 @@ endif()
+@@ -1023,7 +1024,16 @@ endif()
  # LuaJIT (Scripting Support)
  # ==========================
  if(FLB_LUAJIT)
@@ -45,10 +45,10 @@ index 9af783c79..0601b7c18 100644
  endif()
  
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 06a206dd4..8b66ddd22 100644
+index b6233d9f7..67baec456 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -220,7 +220,7 @@ endif()
+@@ -221,7 +221,7 @@ endif()
  if(FLB_LUAJIT)
    set(extra_libs
      ${extra_libs}
diff --git a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
index a315fbf7ef..bcfe3ea859 100644
--- a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
+++ b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
@@ -1,4 +1,4 @@
-From d5492ae7a0fa4e2c19b1d091ad28133fed53d8e2 Mon Sep 17 00:00:00 2001
+From 29be5275f6f7e15aca768e9b235998abc5a604e2 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 09:10:41 +0200
 Subject: [PATCH] lib: librdkafka: CMakeLists.txt: allow compilation without
@@ -10,14 +10,14 @@ Upstream: https://github.com/confluentinc/librdkafka/pull/4366
 Upstream: https://github.com/fluent/fluent-bit/pull/7765
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 ---
- lib/librdkafka-2.1.0/CMakeLists.txt          | 18 ++++++++++--
- lib/librdkafka-2.1.0/examples/CMakeLists.txt | 30 +++++++++++++-------
- 2 files changed, 35 insertions(+), 13 deletions(-)
+ lib/librdkafka-2.3.0/CMakeLists.txt          | 18 ++++++++++--
+ lib/librdkafka-2.3.0/examples/CMakeLists.txt | 31 +++++++++++++-------
+ 2 files changed, 35 insertions(+), 14 deletions(-)
 
-diff --git a/lib/librdkafka-2.1.0/CMakeLists.txt b/lib/librdkafka-2.1.0/CMakeLists.txt
+diff --git a/lib/librdkafka-2.3.0/CMakeLists.txt b/lib/librdkafka-2.3.0/CMakeLists.txt
 index 7f3dd0fc6..c1ee93062 100644
---- a/lib/librdkafka-2.1.0/CMakeLists.txt
-+++ b/lib/librdkafka-2.1.0/CMakeLists.txt
+--- a/lib/librdkafka-2.3.0/CMakeLists.txt
++++ b/lib/librdkafka-2.3.0/CMakeLists.txt
 @@ -3,7 +3,12 @@ cmake_minimum_required(VERSION 3.2)
  include("packaging/cmake/parseversion.cmake")
  parseversion("src/rdkafka.h")
@@ -57,10 +57,10 @@ index 7f3dd0fc6..c1ee93062 100644
  
  if(RDKAFKA_BUILD_EXAMPLES)
    add_subdirectory(examples)
-diff --git a/lib/librdkafka-2.1.0/examples/CMakeLists.txt b/lib/librdkafka-2.1.0/examples/CMakeLists.txt
-index bbbb89ad9..51b8b04be 100644
---- a/lib/librdkafka-2.1.0/examples/CMakeLists.txt
-+++ b/lib/librdkafka-2.1.0/examples/CMakeLists.txt
+diff --git a/lib/librdkafka-2.3.0/examples/CMakeLists.txt b/lib/librdkafka-2.3.0/examples/CMakeLists.txt
+index 8c0079abe..c9336b729 100644
+--- a/lib/librdkafka-2.3.0/examples/CMakeLists.txt
++++ b/lib/librdkafka-2.3.0/examples/CMakeLists.txt
 @@ -5,8 +5,10 @@ endif(WIN32)
  add_executable(producer producer.c ${win32_sources})
  target_link_libraries(producer PUBLIC rdkafka)
@@ -101,12 +101,13 @@ index bbbb89ad9..51b8b04be 100644
  
  add_executable(misc misc.c ${win32_sources})
  target_link_libraries(misc PUBLIC rdkafka)
-@@ -35,6 +43,8 @@ if(NOT WIN32)
+@@ -70,7 +78,8 @@ if(NOT WIN32)
      add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
      target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
  
 -    add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
 -    target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
+-
 +    if(RDKAFKA_BUILD_CXX)
 +        add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
 +        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
diff --git a/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch b/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch
index 0022d5929c..c96a7bdaa0 100644
--- a/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch
+++ b/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch
@@ -1,4 +1,4 @@
-From f5303533fb64bf038dbd8203ac52d94819346239 Mon Sep 17 00:00:00 2001
+From 7f3fc55b734db2d28af63c393b52bc238af9f20a Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 10:00:36 +0200
 Subject: [PATCH] CMakeLists.txt: disable cxx support for librdkafka #7741
@@ -6,17 +6,17 @@ Subject: [PATCH] CMakeLists.txt: disable cxx support for librdkafka #7741
 Fluent-bit is c only, so no need to compile cxx.
 This fixes also a compile error in buildroot.
 
-Upstream: https://github.com/fluent/fluent-bit/pull/7765/commits
+Upstream: https://github.com/fluent/fluent-bit/pull/7765
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 ---
  CMakeLists.txt | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index df6b283cf..10e6071f3 100644
+index 3229420c6..2694f189f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -967,6 +967,7 @@ if(FLB_BACKTRACE)
+@@ -979,6 +979,7 @@ if(FLB_BACKTRACE)
  endif()
  
  if(FLB_IN_KAFKA OR FLB_OUT_KAFKA)
diff --git a/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch b/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
new file mode 100644
index 0000000000..ed6206268f
--- /dev/null
+++ b/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
@@ -0,0 +1,43 @@
+From 4a6c5f56cd1a979b91c168fb8e245587c2927aca Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Mon, 22 Jan 2024 19:27:56 +0100
+Subject: [PATCH] wasm: restore support for some targets (#8401)
+
+Somehow, support for ARC, MIPS, and XTENSA got dropped by bumping to v1.3.0,
+so restore it now. Remark that those targets are mentioned in the section above.
+
+See commit fa6a248746f9f481b5f6aef49716141fa0222650.
+
+Upstream: https://github.com/fluent/fluent-bit/pull/8401
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/wasm/CMakeLists.txt | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/wasm/CMakeLists.txt b/src/wasm/CMakeLists.txt
+index a258dc063..4ea7eba65 100644
+--- a/src/wasm/CMakeLists.txt
++++ b/src/wasm/CMakeLists.txt
+@@ -51,6 +51,10 @@ elseif (WAMR_BUILD_TARGET MATCHES "AARCH64.*")
+ elseif (WAMR_BUILD_TARGET MATCHES "ARM.*")
+   add_definitions(-DBUILD_TARGET_ARM)
+   add_definitions(-DBUILD_TARGET="${WAMR_BUILD_TARGET}")
++elseif (WAMR_BUILD_TARGET STREQUAL "MIPS")
++  add_definitions(-DBUILD_TARGET_MIPS)
++elseif (WAMR_BUILD_TARGET STREQUAL "XTENSA")
++  add_definitions(-DBUILD_TARGET_XTENSA)
+ elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64" OR WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64D")
+   add_definitions(-DBUILD_TARGET_RISCV64_LP64D)
+ elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64")
+@@ -59,6 +63,8 @@ elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32" OR WAMR_BUILD_TARGET STREQUAL "RISC
+   add_definitions(-DBUILD_TARGET_RISCV32_ILP32D)
+ elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32_ILP32")
+   add_definitions(-DBUILD_TARGET_RISCV32_ILP32)
++elseif (WAMR_BUILD_TARGET STREQUAL "ARC")
++  add_definitions(-DBUILD_TARGET_ARC)
+ else ()
+   message (FATAL_ERROR "-- Build target isn't set")
+ endif ()
+-- 
+2.34.1
+
diff --git a/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch b/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
new file mode 100644
index 0000000000..9cdab4c47a
--- /dev/null
+++ b/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
@@ -0,0 +1,99 @@
+From 7eacb2ab839e74cb07038398def5e3cc198448d4 Mon Sep 17 00:00:00 2001
+From: Wenyong Huang <wenyong.huang@intel.com>
+Date: Tue, 23 Jan 2024 12:21:20 +0800
+Subject: [PATCH] Enhance setting write gs base with cmake variable (#3066)
+
+In linux x86-64, developer can use cmake variable to configure whether
+to enable writing linear memory base address to x86 GS register or not:
+- `cmake -DWAMR_DISABLE_WRITE_GS_BASE=1`: disabled it
+- `cmake -DWAMR_DISABLE_WRITE_GS_BASE=0`: enabled it
+- `cmake` without `-DWAMR_DISABLE_WRITE_GS_BASE=1/0`:
+        auto-detected by the compiler
+
+Upstream: https://github.com/bytecodealliance/wasm-micro-runtime/pull/3066
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ .../build-scripts/config_common.cmake         | 65 ++++++++++++-------
+ 1 file changed, 41 insertions(+), 24 deletions(-)
+
+diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
+index e73ebc85f..a61a522f3 100644
+--- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
++++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
+@@ -408,32 +408,49 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
+   add_definitions (-DWASM_ENABLE_STATIC_PGO=1)
+   message ("     AOT static PGO enabled")
+ endif ()
+-if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
+-  add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=1)
+-  message ("     Write linear memory base addr to x86 GS register disabled")
+-elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
+-        AND WAMR_BUILD_PLATFORM STREQUAL "linux")
+-  set (TEST_WRGSBASE_SOURCE "${CMAKE_BINARY_DIR}/test_wrgsbase.c")
+-  file (WRITE "${TEST_WRGSBASE_SOURCE}" "
+-  #include <stdio.h>
+-  #include <stdint.h>
+-  int main() {
+-      uint64_t value;
+-      asm volatile (\"wrgsbase %0\" : : \"r\"(value));
+-      printf(\"WRGSBASE instruction is available.\\n\");
+-      return 0;
+-  }")
+-  # Try to compile and run the test program
+-  try_run (TEST_WRGSBASE_RESULT
+-    TEST_WRGSBASE_COMPILED
+-    ${CMAKE_BINARY_DIR}/test_wrgsbase
+-    SOURCES ${TEST_WRGSBASE_SOURCE}
+-    CMAKE_FLAGS -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
+-  )
+-  #message("${TEST_WRGSBASE_COMPILED}, ${TEST_WRGSBASE_RESULT}")
+-  if (NOT TEST_WRGSBASE_RESULT EQUAL 0)
++if (WAMR_BUILD_TARGET STREQUAL "X86_64"
++    AND WAMR_BUILD_PLATFORM STREQUAL "linux")
++  if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
++    # disabled by user
++    set (DISABLE_WRITE_GS_BASE 1)
++  elseif (WAMR_DISABLE_WRITE_GS_BASE EQUAL 0)
++    # enabled by user
++    set (DISABLE_WRITE_GS_BASE 0)
++  elseif (CMAKE_CROSSCOMPILING)
++    # disabled in cross compilation environment
++    set (DISABLE_WRITE_GS_BASE 1)
++  else ()
++    # auto-detected by the compiler
++    set (TEST_WRGSBASE_SOURCE "${CMAKE_BINARY_DIR}/test_wrgsbase.c")
++    file (WRITE "${TEST_WRGSBASE_SOURCE}" "
++    #include <stdio.h>
++    #include <stdint.h>
++    int main() {
++        uint64_t value;
++        asm volatile (\"wrgsbase %0\" : : \"r\"(value));
++        printf(\"WRGSBASE instruction is available.\\n\");
++        return 0;
++    }")
++    # Try to compile and run the test program
++    try_run (TEST_WRGSBASE_RESULT
++      TEST_WRGSBASE_COMPILED
++      ${CMAKE_BINARY_DIR}/test_wrgsbase
++      SOURCES ${TEST_WRGSBASE_SOURCE}
++      CMAKE_FLAGS -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
++    )
++    #message("${TEST_WRGSBASE_COMPILED}, ${TEST_WRGSBASE_RESULT}")
++    if (TEST_WRGSBASE_RESULT EQUAL 0)
++      set (DISABLE_WRITE_GS_BASE 0)
++    else ()
++      set (DISABLE_WRITE_GS_BASE 1)
++    endif ()
++  endif ()
++  if (DISABLE_WRITE_GS_BASE EQUAL 1)
+     add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=1)
+     message ("     Write linear memory base addr to x86 GS register disabled")
++  else ()
++    add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=0)
++    message ("     Write linear memory base addr to x86 GS register enabled")
+   endif ()
+ endif ()
+ if (WAMR_CONFIGUABLE_BOUNDS_CHECKS EQUAL 1)
+-- 
+2.34.1
+
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 7e2059109a..2c34583f7a 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed80291d660be19f8458d81796c7d3f7e8735eb48ec393467a0c9deca2e9abc3  fluent-bit-2.1.7.tar.gz
+sha256  8e7e951b2907e9d29508699c71c8949a4a22d750d54ffa5ee5b96537e59371dd  fluent-bit-2.2.2.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 1185860661..e51322aad6 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.1.7
+FLUENT_BIT_VERSION = 2.2.2
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
@@ -55,10 +55,6 @@ FLUENT_BIT_CONF_OPTS += \
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
 
-# Fix multiple definition of `mk_tls_*'.
-# https://github.com/fluent/fluent-bit/issues/5537
-FLUENT_BIT_CFLAGS += -fcommon
-
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # https://bugzilla.redhat.com/show_bug.cgi?id=574992
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
