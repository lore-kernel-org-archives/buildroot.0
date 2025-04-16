Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3023C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97AD46061B;
	Wed, 16 Apr 2025 19:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBd24sC5JPKI; Wed, 16 Apr 2025 19:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC5F760B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC5F760B5B;
	Wed, 16 Apr 2025 19:41:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFE3A6B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D60B8417FE
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feQ2AcnhBdFR for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6EA44082C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6EA44082C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:41:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF15584FED; Wed, 16 Apr 2025 19:41:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 21:40:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e248b2f339d506e33149732b39b86033c897e2f0
X-Git-Newrev: 527deef11342e60e945ccf4ed640ee2c327a77b6
X-Patchwork-Hint: ignore
Message-Id: <20250416194105.AF15584FED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump to 3.2.10
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3173382106799262005=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3173382106799262005==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=527deef11342e60e945ccf4ed640ee2c327a77b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
- https://fluentbit.io/announcements/v3.2.10/
- https://fluentbit.io/announcements/v3.2.9/
- https://fluentbit.io/announcements/v3.2.8/
- https://fluentbit.io/announcements/v3.2.7/
- https://fluentbit.io/announcements/v3.2.6/
- https://fluentbit.io/announcements/v3.2.5/
- https://fluentbit.io/announcements/v3.2.4/
- https://fluentbit.io/announcements/v3.2.3/

Drop the BUILD_SHARED_LIBS flag as it has been fixed by commit
https://github.com/fluent/fluent-bit/commit/47fd29ae7b9c393357e318831e0bf616c7856cde,
and more specific by commit
https://github.com/richgel999/miniz/commit/0ce345c44ad1852f29db12c1eb65a429038b2809.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fka-CMakeLists.txt-allow-compilation-with.patch |  2 +-
 ...d-disable-cxx-support-for-librdkafka-7741.patch |  2 +-
 ...-CMakeLists.txt-do-not-require-a-CXX-comp.patch |  2 +-
 ...cmake-CMakeLists.txt-do-not-require-a-CXX.patch |  2 +-
 ...ting-write-gs-base-with-cmake-variable-30.patch | 99 ----------------------
 ...ut-_kafka-CMakeLists.txt-fix-cross-compi.patch} |  2 +-
 ...ib-cprofiles-fix-wrong-pointer-assignment.patch | 81 ------------------
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  7 +-
 9 files changed, 7 insertions(+), 192 deletions(-)

diff --git a/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch b/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
index e144642c93..21e8de4236 100644
--- a/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
+++ b/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
@@ -1,4 +1,4 @@
-From c44256c95f5703dd627413f17c6ad250073898d9 Mon Sep 17 00:00:00 2001
+From 73832f5b7b6c3971d5a7a5cd2c0bcd429cd779c6 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 09:10:41 +0200
 Subject: [PATCH] lib: librdkafka: CMakeLists.txt: allow compilation without
diff --git a/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch b/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
index ec8be4dfc6..afba3d58eb 100644
--- a/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
+++ b/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
@@ -1,4 +1,4 @@
-From 0dc955cd15cc0b09a1d557131fae59842cb2bbd8 Mon Sep 17 00:00:00 2001
+From 16dadccb7e718edc27797fa47e251547264c4285 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 10:00:36 +0200
 Subject: [PATCH] build: disable cxx support for librdkafka #7741
diff --git a/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch b/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
index b68062de4f..339e9b50d2 100644
--- a/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
+++ b/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
@@ -1,4 +1,4 @@
-From 8a9aed874fc41973d007f5145eca85e261f2bb35 Mon Sep 17 00:00:00 2001
+From ecd0e822c64c3f0a8194f8c24be15606f47f8d59 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
 Date: Sun, 25 Aug 2024 20:09:21 +0200
 Subject: [PATCH] lib: nghttp2: CMakeLists.txt: do not require a CXX compiler
diff --git a/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch b/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
index c9c5662405..39d235f3d4 100644
--- a/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
+++ b/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
@@ -1,4 +1,4 @@
-From ac870a2e2de899bcc8b6818b97404479da6d0663 Mon Sep 17 00:00:00 2001
+From eee42b2b0998555b035bdd71b1a815db16c0449f Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
 Date: Sun, 25 Aug 2024 20:10:27 +0200
 Subject: [PATCH] lib: luajit-cmake: CMakeLists.txt: do not require a CXX
diff --git a/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch b/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
deleted file mode 100644
index 4446238bd3..0000000000
--- a/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From e17ce6ddcb4dc1cd3081eabfb94a1cdc224f4d69 Mon Sep 17 00:00:00 2001
-From: Wenyong Huang <wenyong.huang@intel.com>
-Date: Tue, 23 Jan 2024 12:21:20 +0800
-Subject: [PATCH] Enhance setting write gs base with cmake variable (#3066)
-
-In linux x86-64, developer can use cmake variable to configure whether
-to enable writing linear memory base address to x86 GS register or not:
-- `cmake -DWAMR_DISABLE_WRITE_GS_BASE=1`: disabled it
-- `cmake -DWAMR_DISABLE_WRITE_GS_BASE=0`: enabled it
-- `cmake` without `-DWAMR_DISABLE_WRITE_GS_BASE=1/0`:
-        auto-detected by the compiler
-
-Upstream: https://github.com/bytecodealliance/wasm-micro-runtime/pull/3066
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- .../build-scripts/config_common.cmake         | 65 ++++++++++++-------
- 1 file changed, 41 insertions(+), 24 deletions(-)
-
-diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
-index e73ebc85f..a61a522f3 100644
---- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
-+++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmake
-@@ -408,32 +408,49 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
-   add_definitions (-DWASM_ENABLE_STATIC_PGO=1)
-   message ("     AOT static PGO enabled")
- endif ()
--if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
--  add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=1)
--  message ("     Write linear memory base addr to x86 GS register disabled")
--elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
--        AND WAMR_BUILD_PLATFORM STREQUAL "linux")
--  set (TEST_WRGSBASE_SOURCE "${CMAKE_BINARY_DIR}/test_wrgsbase.c")
--  file (WRITE "${TEST_WRGSBASE_SOURCE}" "
--  #include <stdio.h>
--  #include <stdint.h>
--  int main() {
--      uint64_t value;
--      asm volatile (\"wrgsbase %0\" : : \"r\"(value));
--      printf(\"WRGSBASE instruction is available.\\n\");
--      return 0;
--  }")
--  # Try to compile and run the test program
--  try_run (TEST_WRGSBASE_RESULT
--    TEST_WRGSBASE_COMPILED
--    ${CMAKE_BINARY_DIR}/test_wrgsbase
--    SOURCES ${TEST_WRGSBASE_SOURCE}
--    CMAKE_FLAGS -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
--  )
--  #message("${TEST_WRGSBASE_COMPILED}, ${TEST_WRGSBASE_RESULT}")
--  if (NOT TEST_WRGSBASE_RESULT EQUAL 0)
-+if (WAMR_BUILD_TARGET STREQUAL "X86_64"
-+    AND WAMR_BUILD_PLATFORM STREQUAL "linux")
-+  if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
-+    # disabled by user
-+    set (DISABLE_WRITE_GS_BASE 1)
-+  elseif (WAMR_DISABLE_WRITE_GS_BASE EQUAL 0)
-+    # enabled by user
-+    set (DISABLE_WRITE_GS_BASE 0)
-+  elseif (CMAKE_CROSSCOMPILING)
-+    # disabled in cross compilation environment
-+    set (DISABLE_WRITE_GS_BASE 1)
-+  else ()
-+    # auto-detected by the compiler
-+    set (TEST_WRGSBASE_SOURCE "${CMAKE_BINARY_DIR}/test_wrgsbase.c")
-+    file (WRITE "${TEST_WRGSBASE_SOURCE}" "
-+    #include <stdio.h>
-+    #include <stdint.h>
-+    int main() {
-+        uint64_t value;
-+        asm volatile (\"wrgsbase %0\" : : \"r\"(value));
-+        printf(\"WRGSBASE instruction is available.\\n\");
-+        return 0;
-+    }")
-+    # Try to compile and run the test program
-+    try_run (TEST_WRGSBASE_RESULT
-+      TEST_WRGSBASE_COMPILED
-+      ${CMAKE_BINARY_DIR}/test_wrgsbase
-+      SOURCES ${TEST_WRGSBASE_SOURCE}
-+      CMAKE_FLAGS -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
-+    )
-+    #message("${TEST_WRGSBASE_COMPILED}, ${TEST_WRGSBASE_RESULT}")
-+    if (TEST_WRGSBASE_RESULT EQUAL 0)
-+      set (DISABLE_WRITE_GS_BASE 0)
-+    else ()
-+      set (DISABLE_WRITE_GS_BASE 1)
-+    endif ()
-+  endif ()
-+  if (DISABLE_WRITE_GS_BASE EQUAL 1)
-     add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=1)
-     message ("     Write linear memory base addr to x86 GS register disabled")
-+  else ()
-+    add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=0)
-+    message ("     Write linear memory base addr to x86 GS register enabled")
-   endif ()
- endif ()
- if (WAMR_CONFIGUABLE_BOUNDS_CHECKS EQUAL 1)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/0006-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch b/package/fluent-bit/0005-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
similarity index 96%
rename from package/fluent-bit/0006-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
rename to package/fluent-bit/0005-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
index 4083753a3e..787129eb4c 100644
--- a/package/fluent-bit/0006-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
+++ b/package/fluent-bit/0005-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
@@ -1,4 +1,4 @@
-From 7e8bb790cba0619af9e8d80e947f7cda0910caaa Mon Sep 17 00:00:00 2001
+From 845076d4e8b480da41f80efafd97c199adbb831e Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
 Date: Sat, 16 Nov 2024 19:46:28 +0100
 Subject: [PATCH] plugins/{in,out}_kafka/CMakeLists.txt: fix cross compile
diff --git a/package/fluent-bit/0007-lib-cprofiles-fix-wrong-pointer-assignment.patch b/package/fluent-bit/0007-lib-cprofiles-fix-wrong-pointer-assignment.patch
deleted file mode 100644
index 033b5d428a..0000000000
--- a/package/fluent-bit/0007-lib-cprofiles-fix-wrong-pointer-assignment.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 6f474716432ca3ddae2ce989d9cdcdc9145c3959 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sat, 16 Nov 2024 20:55:37 +0100
-Subject: [PATCH] lib: cprofiles: fix wrong pointer assignment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The wrong struct types were used. Typo?
-
-/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c: In function ‘cprof_profile_destroy’:
-/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c:160:18: error: assignment to ‘struct cprof_mapping *’ from incompatible pointer type ‘struct cprof_location *’ [-Wincompatible-pointer-types]
-  160 |         location = cfl_list_entry(iterator,
-      |                  ^
-/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c:166:32: error: passing argument 1 of ‘cprof_location_destroy’ from incompatible pointer type [-Wincompatible-pointer-types]
-  166 |         cprof_location_destroy(location);
-      |                                ^~~~~~~~
-      |                                |
-      |                                struct cprof_mapping *
-In file included from /home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c:21:
-/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/include/cprofiles/cprofiles.h:304:52: note: expected ‘struct cprof_location *’ but argument is of type ‘struct cprof_mapping *’
-  304 | void cprof_location_destroy(struct cprof_location *instance);
-      |                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
-
-Upstream: https://github.com/fluent/cprofiles/pull/3
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- lib/cprofiles/src/cprof_encode_text.c | 6 +++---
- lib/cprofiles/src/cprof_profile.c     | 4 ++--
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/lib/cprofiles/src/cprof_encode_text.c b/lib/cprofiles/src/cprof_encode_text.c
-index 218a72b5b..ab2d6247d 100644
---- a/lib/cprofiles/src/cprof_encode_text.c
-+++ b/lib/cprofiles/src/cprof_encode_text.c
-@@ -1909,7 +1909,7 @@ static int encode_cprof_resource_profiles(
-                 struct cprof_resource_profiles *instance) {
-     int result;
-     struct cfl_list             *iterator;
--    struct cprof_scope_profile *scope_profile;
-+    struct cprof_scope_profiles *scope_profiles;
- 
-     result = encode_string(context,
-                             CFL_TRUE,
-@@ -1958,11 +1958,11 @@ static int encode_cprof_resource_profiles(
- 
-         cfl_list_foreach(iterator,
-                          &instance->scope_profiles) {
--            scope_profile = cfl_list_entry(
-+            scope_profiles = cfl_list_entry(
-                                 iterator,
-                                 struct cprof_scope_profiles, _head);
- 
--            result = encode_cprof_scope_profiles(context, scope_profile);
-+            result = encode_cprof_scope_profiles(context, scope_profiles);
- 
-             if (result != CPROF_ENCODE_TEXT_SUCCESS) {
-                 return result;
-diff --git a/lib/cprofiles/src/cprof_profile.c b/lib/cprofiles/src/cprof_profile.c
-index 66d62b361..931457ef7 100644
---- a/lib/cprofiles/src/cprof_profile.c
-+++ b/lib/cprofiles/src/cprof_profile.c
-@@ -98,7 +98,7 @@ void cprof_profile_destroy(struct cprof_profile *instance)
-     struct cfl_list             *iterator_backup;
-     struct cprof_attribute_unit *attribute_unit;
-     struct cprof_value_type     *value_type;
--    struct cprof_mapping        *location;
-+    struct cprof_location       *location;
-     struct cprof_function       *function;
-     struct cfl_list             *iterator;
-     struct cprof_mapping        *mapping;
-@@ -307,4 +307,4 @@ int cprof_profile_add_comment(struct cprof_profile *profile, int64_t comment)
-     profile->comments_count++;
- 
-     return 0;
--}
-\ No newline at end of file
-+}
--- 
-2.43.0
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 57e5272ec0..9abf13698a 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3abcd7eda1a26fe79f1d715491bafcca77d0186cc46d1d8465157790358f827d  fluent-bit-3.2.2.tar.gz
+sha256  f86ecbe208ae152841909a063f28ca250b8a6771c5e43dcb1786ef310f927904  fluent-bit-3.2.10.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 31f62db7c7..bd7c82b26b 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.2.2
+FLUENT_BIT_VERSION = 3.2.10
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
@@ -63,11 +63,6 @@ else
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
 endif
 
-# Force bundled miniz to be linked statically.
-# https://github.com/fluent/fluent-bit/issues/6711
-FLUENT_BIT_CONF_OPTS += \
-	-DBUILD_SHARED_LIBS=OFF
-
 # Move the config files from /usr/etc/ to /etc/.
 # https://github.com/fluent/fluent-bit/issues/6619
 FLUENT_BIT_CONF_OPTS += \

--===============3173382106799262005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3173382106799262005==--
