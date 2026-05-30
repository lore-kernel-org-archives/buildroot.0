Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60457CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A91685842;
	Tue,  9 Jun 2026 13:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ba_7TFIJdTVH; Tue,  9 Jun 2026 13:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A028467F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010276;
	bh=DoiGSd4LYQdN1uLkNL3fa4KwfkGY/fJXDtX0RwSW2Bk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9pJH6f0qmJ8PoUbKyfi+U9MWhSmwsuS2atS4oTrM1FXWEhJ7U3Hq99drbhP8LDZc
	 u9JA1CNuZVLrnvqbx1yEiAs6zJ8oO5IpQUGWN380thFjREQlhUUkqf+THkmYM5uU2u
	 sAeORQleBLB9C5cszKzVLSYDmjsFyzqlOV8+oS88cOuBIuxXrL9afEEhwr/BZtkM2l
	 K9w5e00mSQpVbcfeuC+DPxXh38vEB+XaQQws16sc6mLVBiF6RrLWI3ygXhkbHhWLx1
	 YlY7OpzA1oU6J2u2gxszmvL4U2acJgJPhryRtp/1Xg6zgVuTTc6uuvtA2YfjblBxYb
	 YIVHquRXjhf8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A028467F;
	Tue,  9 Jun 2026 13:04:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81432190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9E434637F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yr1Upc03ewdr for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4B12420E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4B12420E4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0DAD87E68; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a795fa19a752dfd9f04f2a848e04879abf638a1
X-Git-Newrev: 44c7f9b2dd16ca3d78318a4036cc7237bcfcf2c8
X-Patchwork-Hint: ignore
Message-Id: <20260609130122.E0DAD87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rocksdb: bump version to 11.0.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44c7f9b2dd16ca3d78318a4036cc7237bcfcf2c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/facebook/rocksdb/blob/v11.0.4/HISTORY.md

Removed patch 0001 which is included in this release:
https://github.com/facebook/rocksdb/commit/53c8f739fd266bb9e755eccceea7adb4d5126083

Added upstream PR to fix build error.

Updated hash of README.md due to various upstream commits:
https://github.com/facebook/rocksdb/commits/v10.7.5/README.md

Switched build system to cmake.

Added configure parameter -DFAIL_ON_WARNINGS=OFF which converts many
"may be used uninitialized" errors into warnings which fixes build
errors introduced by the upcoming gcc version 16.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   1 -
 ...-unused-parameter-when-Snappy-is-disabled.patch |  24 ++
 ...d_tools-build_detect_platform-fix-C-tests.patch | 325 ---------------------
 package/rocksdb/rocksdb.hash                       |   4 +-
 package/rocksdb/rocksdb.mk                         |  81 ++---
 5 files changed, 46 insertions(+), 389 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index db2c321858..9a06d5526a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -829,7 +829,6 @@ package/restorecond/S02restorecond Shellcheck
 package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch lib_patch.Upstream
 package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch lib_patch.Upstream
 package/rng-tools/S21rngd Shellcheck lib_sysv.Variables
-package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch lib_patch.Upstream
 package/rpcbind/0001-Remove-yellow-pages-support.patch lib_patch.Upstream
 package/rpcbind/S30rpcbind lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
diff --git a/package/rocksdb/0001-Fix-unused-parameter-when-Snappy-is-disabled.patch b/package/rocksdb/0001-Fix-unused-parameter-when-Snappy-is-disabled.patch
new file mode 100644
index 0000000000..413473d35e
--- /dev/null
+++ b/package/rocksdb/0001-Fix-unused-parameter-when-Snappy-is-disabled.patch
@@ -0,0 +1,24 @@
+From cfd448002d601159feab4908a616ae09c444b39e Mon Sep 17 00:00:00 2001
+From: Youngjae Lee <ls4154.lee@gmail.com>
+Date: Thu, 26 Jun 2025 21:51:03 +0900
+Subject: [PATCH] Fix unused parameter warning when Snappy is disabled
+
+Upstream: https://github.com/facebook/rocksdb/pull/13732
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ util/compression.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/util/compression.cc b/util/compression.cc
+index 0aa473b179d..ca1649571ca 100644
+--- a/util/compression.cc
++++ b/util/compression.cc
+@@ -693,6 +693,7 @@ class BuiltinDecompressorV2SnappyOnly : public BuiltinDecompressorV2 {
+     args.uncompressed_size = uncompressed_length;
+     return Status::OK();
+ #else
++    (void)args;
+     return Status::NotSupported("Snappy not supported in this build");
+ #endif
+   }
diff --git a/package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch b/package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch
deleted file mode 100644
index ced4a3a3d9..0000000000
--- a/package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch
+++ /dev/null
@@ -1,325 +0,0 @@
-From 23739c6f9694d7fc436967439f170173dbb4c6b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 24 Feb 2020 10:22:13 +0100
-Subject: [PATCH] build_tools/build_detect_platform: fix C++ tests
-
-Replace -o /dev/null by -o test.o when testing for C++ features such as
--faligned-new otherwise tests will fail with some bugged binutils
-(https://sourceware.org/bugzilla/show_bug.cgi?id=19526):
-
-output/host/bin/xtensa-buildroot-linux-uclibc-g++ -faligned-new -x c++ - -o /dev/null <<EOF
-            struct alignas(1024) t {int a;};
-            int main() {}
-EOF
-/home/fabrice/buildroot/output/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: final link failed: file truncated
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/facebook/rocksdb/pull/6479]
----
- build_tools/build_detect_platform | 66 +++++++++++++++----------------
- 1 file changed, 33 insertions(+), 33 deletions(-)
-
-diff --git a/build_tools/build_detect_platform b/build_tools/build_detect_platform
-index 2535d8124..64a0ae76c 100755
---- a/build_tools/build_detect_platform
-+++ b/build_tools/build_detect_platform
-@@ -172,7 +172,7 @@ case "$TARGET_OS" in
-         PLATFORM_LDFLAGS="$PLATFORM_LDFLAGS -lpthread -lrt -ldl"
-         if test $ROCKSDB_USE_IO_URING; then
-             # check for liburing
--            $CXX $PLATFORM_CXXFLAGS -x c++ - -luring -o /dev/null 2>/dev/null  <<EOF
-+            $CXX $PLATFORM_CXXFLAGS -x c++ - -luring -o test.o 2>/dev/null  <<EOF
-               #include <liburing.h>
-               int main() {
-                 struct io_uring ring;
-@@ -245,7 +245,7 @@ if [ "$CROSS_COMPILE" = "true" -o "$FBCODE_BUILD" = "true" ]; then
- else
-     if ! test $ROCKSDB_DISABLE_FALLOCATE; then
-         # Test whether fallocate is available
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <fcntl.h>
-           #include <linux/falloc.h>
-           int main() {
-@@ -261,7 +261,7 @@ EOF
-     if ! test $ROCKSDB_DISABLE_SNAPPY; then
-         # Test whether Snappy library is installed
-         # http://code.google.com/p/snappy/
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <snappy.h>
-           int main() {}
- EOF
-@@ -276,7 +276,7 @@ EOF
-         # Test whether gflags library is installed
-         # http://gflags.github.io/gflags/
-         # check if the namespace is gflags
--        if $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null << EOF
-+        if $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null << EOF
-           #include <gflags/gflags.h>
-           using namespace GFLAGS_NAMESPACE;
-           int main() {}
-@@ -323,7 +323,7 @@ EOF
-           COMMON_FLAGS="$COMMON_FLAGS -DGFLAGS=1"
-           PLATFORM_LDFLAGS="$PLATFORM_LDFLAGS -lgflags"
-         # check if namespace is gflags
--        elif $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null << EOF
-+        elif $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null << EOF
-             #include <gflags/gflags.h>
-             using namespace gflags;
-             int main() {}
-@@ -285,7 +285,7 @@ EOF
-           COMMON_FLAGS="$COMMON_FLAGS -DGFLAGS=1 -DGFLAGS_NAMESPACE=gflags"
-           PLATFORM_LDFLAGS="$PLATFORM_LDFLAGS -lgflags"
-         # check if namespace is google
--        elif $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null << EOF
-+        elif $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null << EOF
-             #include <gflags/gflags.h>
-             using namespace google;
-             int main() {}
-@@ -299,7 +299,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_ZLIB; then
-         # Test whether zlib library is installed
--        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <zlib.h>
-           int main() {}
- EOF
-@@ -312,7 +312,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_BZIP; then
-         # Test whether bzip library is installed
--        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <bzlib.h>
-           int main() {}
- EOF
-@@ -325,7 +325,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_LZ4; then
-         # Test whether lz4 library is installed
--        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <lz4.h>
-           #include <lz4hc.h>
-           int main() {}
-@@ -339,7 +339,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_ZSTD; then
-         # Test whether zstd library is installed
--        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <zstd.h>
-           int main() {}
- EOF
-@@ -352,7 +352,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_NUMA; then
-         # Test whether numa is available
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null -lnuma 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o -lnuma 2>/dev/null  <<EOF
-           #include <numa.h>
-           #include <numaif.h>
-           int main() {}
-@@ -366,7 +366,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_TBB; then
-         # Test whether tbb is available
--        $CXX $PLATFORM_CXXFLAGS $LDFLAGS -x c++ - -o /dev/null -ltbb 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS $LDFLAGS -x c++ - -o test.o -ltbb 2>/dev/null  <<EOF
-           #include <tbb/tbb.h>
-           int main() {}
- EOF
-@@ -379,7 +379,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_JEMALLOC; then
-         # Test whether jemalloc is available
--        if echo 'int main() {}' | $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null -ljemalloc \
-+        if echo 'int main() {}' | $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o -ljemalloc \
-           2>/dev/null; then
-             # This will enable some preprocessor identifiers in the Makefile
-             JEMALLOC=1
-@@ -400,7 +400,7 @@ EOF
-     fi
-     if ! test $JEMALLOC && ! test $ROCKSDB_DISABLE_TCMALLOC; then
-         # jemalloc is not available. Let's try tcmalloc
--        if echo 'int main() {}' | $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null \
-+        if echo 'int main() {}' | $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o \
-           -ltcmalloc 2>/dev/null; then
-             PLATFORM_LDFLAGS="$PLATFORM_LDFLAGS -ltcmalloc"
-             JAVA_LDFLAGS="$JAVA_LDFLAGS -ltcmalloc"
-@@ -409,7 +409,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_MALLOC_USABLE_SIZE; then
-         # Test whether malloc_usable_size is available
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <malloc.h>
-           int main() {
-             size_t res = malloc_usable_size(0);
-@@ -424,7 +424,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_MEMKIND; then
-         # Test whether memkind library is installed
--        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -lmemkind -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -lmemkind -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <memkind.h>
-           int main() {
-             memkind_malloc(MEMKIND_DAX_KMEM, 1024);
-@@ -486,7 +486,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_PTHREAD_MUTEX_ADAPTIVE_NP; then
-         # Test whether PTHREAD_MUTEX_ADAPTIVE_NP mutex type is available
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <pthread.h>
-           int main() {
-             int x = PTHREAD_MUTEX_ADAPTIVE_NP;
-@@ -439,7 +439,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_BACKTRACE; then
-         # Test whether backtrace is available
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <execinfo.h>
-           int main() {
-             void* frames[1];
-@@ -451,7 +451,7 @@ EOF
-             COMMON_FLAGS="$COMMON_FLAGS -DROCKSDB_BACKTRACE"
-         else
-             # Test whether execinfo library is installed
--            $CXX $PLATFORM_CXXFLAGS -lexecinfo -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+            $CXX $PLATFORM_CXXFLAGS -lexecinfo -x c++ - -o test.o 2>/dev/null  <<EOF
-               #include <execinfo.h>
-               int main() {
-                 void* frames[1];
-@@ -468,7 +468,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_PG; then
-         # Test if -pg is supported
--        $CXX $PLATFORM_CXXFLAGS -pg -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -pg -x c++ - -o test.o 2>/dev/null  <<EOF
-           int main() {
-             return 0;
-           }
-@@ -480,7 +480,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_SYNC_FILE_RANGE; then
-         # Test whether sync_file_range is supported for compatibility with an old glibc
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <fcntl.h>
-           int main() {
-             int fd = open("/dev/null", 0);
-@@ -494,7 +494,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_SCHED_GETCPU; then
-         # Test whether sched_getcpu is supported
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <sched.h>
-           int main() {
-             int cpuid = sched_getcpu();
-@@ -508,7 +508,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_AUXV_GETAUXVAL; then
-         # Test whether getauxval is supported
--        $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o 2>/dev/null  <<EOF
-           #include <sys/auxv.h>
-           int main() {
-             uint64_t auxv = getauxval(AT_HWCAP);
-@@ -522,7 +522,7 @@ EOF
- 
-     if ! test $ROCKSDB_DISABLE_ALIGNED_NEW; then
-         # Test whether c++17 aligned-new is supported
--        $CXX $PLATFORM_CXXFLAGS -faligned-new -x c++ - -o /dev/null 2>/dev/null <<EOF
-+        $CXX $PLATFORM_CXXFLAGS -faligned-new -x c++ - -o test.o 2>/dev/null <<EOF
-             struct alignas(1024) t {int a;};
-             int main() {}
- EOF
-@@ -536,7 +536,7 @@ fi
- # -Wshorten-64-to-32 breaks compilation on FreeBSD i386
- if ! [ "$TARGET_OS" = FreeBSD -a "$TARGET_ARCHITECTURE" = i386 ]; then
-   # Test whether -Wshorten-64-to-32 is available
--  $CXX $PLATFORM_CXXFLAGS -x c++ - -o /dev/null -Wshorten-64-to-32 2>/dev/null  <<EOF
-+  $CXX $PLATFORM_CXXFLAGS -x c++ - -o test.o -Wshorten-64-to-32 2>/dev/null  <<EOF
-     int main() {}
- EOF
-   if [ "$?" = 0 ]; then
-@@ -603,7 +603,7 @@ if test "$TRY_SSE_ETC"; then
-   TRY_LZCNT="-mlzcnt"
- fi
- 
--$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_SSE42 -x c++ - -o /dev/null 2>/dev/null <<EOF
-+$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_SSE42 -x c++ - -o test.o 2>/dev/null <<EOF
-   #include <cstdint>
-   #include <nmmintrin.h>
-   int main() {
-@@ -617,7 +617,7 @@ elif test "$USE_SSE"; then
-   echo "warning: USE_SSE specified but compiler could not use SSE intrinsics, disabling" >&2
- fi
- 
--$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_PCLMUL -x c++ - -o /dev/null 2>/dev/null <<EOF
-+$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_PCLMUL -x c++ - -o test.o 2>/dev/null <<EOF
-   #include <cstdint>
-   #include <wmmintrin.h>
-   int main() {
-@@ -634,7 +634,7 @@ elif test "$USE_SSE"; then
-   echo "warning: USE_SSE specified but compiler could not use PCLMUL intrinsics, disabling" >&2
- fi
- 
--$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_AVX2 -x c++ - -o /dev/null 2>/dev/null <<EOF
-+$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_AVX2 -x c++ - -o test.o 2>/dev/null <<EOF
-   #include <cstdint>
-   #include <immintrin.h>
-   int main() {
-@@ -649,7 +649,7 @@ elif test "$USE_SSE"; then
-   echo "warning: USE_SSE specified but compiler could not use AVX2 intrinsics, disabling" >&2
- fi
- 
--$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_BMI -x c++ - -o /dev/null 2>/dev/null <<EOF
-+$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_BMI -x c++ - -o test.o 2>/dev/null <<EOF
-   #include <cstdint>
-   #include <immintrin.h>
-   int main(int argc, char *argv[]) {
-@@ -739,7 +739,7 @@ elif test "$USE_SSE"; then
-   echo "warning: USE_SSE specified but compiler could not use BMI intrinsics, disabling" >&2
- fi
- 
--$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_LZCNT -x c++ - -o /dev/null 2>/dev/null <<EOF
-+$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS $TRY_LZCNT -x c++ - -o test.o 2>/dev/null <<EOF
-   #include <cstdint>
-   #include <immintrin.h>
-   int main(int argc, char *argv[]) {
-@@ -753,7 +753,7 @@ elif test "$USE_SSE"; then
-   echo "warning: USE_SSE specified but compiler could not use LZCNT intrinsics, disabling" >&2
- fi
- 
--$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o /dev/null 2>/dev/null <<EOF
-+$CXX $PLATFORM_CXXFLAGS $COMMON_FLAGS -x c++ - -o test.o 2>/dev/null <<EOF
-   #include <cstdint>
-   int main() {
-     uint64_t a = 0xffffFFFFffffFFFF;
-@@ -666,7 +666,7 @@ fi
- # succeed because the cross-compiler flags are added by the Makefile, not this
- # script.
- if [ "$PLATFORM" != IOS ]; then
--  $CXX $COMMON_FLAGS -x c++ - -o /dev/null 2>/dev/null <<EOF
-+  $CXX $COMMON_FLAGS -x c++ - -o test.o 2>/dev/null <<EOF
-   #if defined(_MSC_VER) && !defined(__thread)
-   #define __thread __declspec(thread)
-   #endif
-@@ -685,7 +685,7 @@ if [ "$FBCODE_BUILD" != "true" -a "$PLATFORM" = OS_LINUX ]; then
-   void dummy_func() {}
- EOF
-   if [ "$?" = 0 ]; then
--    $CXX $COMMON_FLAGS $PLATFORM_SHARED_LDFLAGS test_dl.o -o /dev/null 2>/dev/null
-+    $CXX $COMMON_FLAGS $PLATFORM_SHARED_LDFLAGS test_dl.o -o test.o 2>/dev/null
-     if [ "$?" = 0 ]; then
-       EXEC_LDFLAGS+="-ldl"
-       rm -f test_dl.o
--- 
-2.25.0
-
diff --git a/package/rocksdb/rocksdb.hash b/package/rocksdb/rocksdb.hash
index 935b498c55..fc2668a635 100644
--- a/package/rocksdb/rocksdb.hash
+++ b/package/rocksdb/rocksdb.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-sha256  c6502c7aae641b7e20fafa6c2b92273d935d2b7b2707135ebd9a67b092169dca  rocksdb-6.20.3.tar.gz
+sha256  b4dfd75199f385ec76056f81d33cde8f4cb446ea2ed1821feec7b996b3409f67  rocksdb-11.0.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.Apache
 sha256  b568f1f37a5a1d37a3e981e7c8b7fc4856ca33b2ca0a45bc8e847aaaf7afe485  LICENSE.leveldb
-sha256  e62e4f73402cf6a16969673f0b7eb46bc91782e50a2afe400dd0157547bc09f0  README.md
+sha256  99d85d5d88c6d853c2e6fda21de51fa33288a51d3aa4959dd2b68535f768894b  README.md
diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index bed0634134..d4265b52cf 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -4,104 +4,63 @@
 #
 ################################################################################
 
-ROCKSDB_VERSION = 6.20.3
+ROCKSDB_VERSION = 11.0.4
 ROCKSDB_SITE = $(call github,facebook,rocksdb,v$(ROCKSDB_VERSION))
 ROCKSDB_LICENSE = GPL-2.0 or Apache-2.0
 ROCKSDB_LICENSE_FILES = COPYING LICENSE.Apache LICENSE.leveldb README.md
 ROCKSDB_INSTALL_STAGING = YES
-
-ROCKSDB_MAKE_OPTS = \
-	PORTABLE=1 \
-	PREFIX=/usr
-
-# Internal error, aborting at dwarf2cfi.c:2802 in connect_traces
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
-ifeq ($(BR2_m68k_cf),y)
-ROCKSDB_EXTRA_CXXFLAGS += -fno-defer-pop
-endif
+ROCKSDB_CONF_OPTS = \
+	-DFAIL_ON_WARNINGS=OFF \
+	-DPORTABLE=1 \
+	-DWITH_TESTS=OFF
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ROCKSDB_DEPENDENCIES += bzip2
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_BZ2=0
+ROCKSDB_CONF_OPTS += -DWITH_BZ2=ON
 else
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_BZ2=1
+ROCKSDB_CONF_OPTS += -DWITH_BZ2=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
 ROCKSDB_DEPENDENCIES += gflags
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_GFLAGS=0
+ROCKSDB_CONF_OPTS += -DWITH_GFLAGS=ON
 else
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_GFLAGS=1
+ROCKSDB_CONF_OPTS += -DWITH_GFLAGS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 ROCKSDB_DEPENDENCIES += jemalloc
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_JEMALLOC=0
+ROCKSDB_CONF_OPTS += -DWITH_JEMALLOC=ON
 else
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_JEMALLOC=1
+ROCKSDB_CONF_OPTS += -DWITH_JEMALLOC=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
 ROCKSDB_DEPENDENCIES += lz4
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_LZ4=0
+ROCKSDB_CONF_OPTS += -DWITH_LZ4=ON
 else
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_LZ4=1
+ROCKSDB_CONF_OPTS += -DWITH_LZ4=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SNAPPY),y)
 ROCKSDB_DEPENDENCIES += snappy
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_SNAPPY=0
+ROCKSDB_CONF_OPTS += -DWITH_SNAPPY=ON
 else
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_SNAPPY=1
+ROCKSDB_CONF_OPTS += -DWITH_SNAPPY=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ROCKSDB_DEPENDENCIES += zlib
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZLIB=0
+ROCKSDB_CONF_OPTS += -DWITH_ZLIB=ON
 else
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZLIB=1
+ROCKSDB_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 ROCKSDB_DEPENDENCIES += zstd
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZSTD=0
-else
-ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZSTD=1
-endif
-
-ifeq ($(BR2_ENABLE_LTO),y)
-ROCKSDB_MAKE_OPTS += USE_LTO=1
+ROCKSDB_CONF_OPTS += -DWITH_ZSTD=ON
 else
-ROCKSDB_MAKE_OPTS += USE_LTO=0
+ROCKSDB_CONF_OPTS += -DWITH_ZSTD=OFF
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-ROCKSDB_BUILD_TARGETS += static_lib
-ROCKSDB_INSTALL_TARGETS += install-static
-ROCKSDB_EXTRA_CXXFLAGS += -DROCKSDB_NO_DYNAMIC_EXTENSION
-else ifeq ($(BR2_SHARED_LIBS),y)
-ROCKSDB_BUILD_TARGETS += shared_lib
-ROCKSDB_INSTALL_TARGETS += install-shared
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-ROCKSDB_BUILD_TARGETS += shared_lib static_lib
-ROCKSDB_INSTALL_TARGETS += install-shared install-static
-endif
-
-ROCKSDB_MAKE_OPTS += EXTRA_CXXFLAGS="$(ROCKSDB_EXTRA_CXXFLAGS)"
-
-define ROCKSDB_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(ROCKSDB_MAKE_OPTS) -C $(@D) \
-		$(ROCKSDB_BUILD_TARGETS)
-endef
-
-define ROCKSDB_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(ROCKSDB_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) $(ROCKSDB_INSTALL_TARGETS)
-endef
-
-define ROCKSDB_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(ROCKSDB_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) $(ROCKSDB_INSTALL_TARGETS)
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
