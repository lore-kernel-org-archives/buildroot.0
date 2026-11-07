Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16470606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S0i64tt4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA89560671;
	Sat,  7 Nov 2026 18:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2KzL8abFRQN; Sat,  7 Nov 2026 18:07:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A45560664
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794074864;
	b=mXlpVsujFE3iYQo44ssasw4RYxc6/2qvZ9GhxgkATvFjxw+8CM3fDCQgE8XK2mQKcF/B
	 P+iE8LK2lx8BeIyaiRExwWtWeN68QAsPGfmbP9Jlm6hxkIX19J00W3PdTwhQNy/MZsu/c
	 rcxa7DueCbgjpT+zIk7KbvbkMZY5InDzCTKCaFAYbLaAArXK3NVs4rQ+sueD/Hbxga0yk
	 wGDw/5ZFbIIu+37tmTGZpyAw1CJ1E2bh9aJmZiTGLmo2t8fLHMyoyBXKiyylhCFdCkA3Y
	 zXI+ynseaKSQYAnq5WnEM9cpKZtRHwtVqLaMBoUVBLaAan9VQsR3nxgm4p0JH/Z7rZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794074864;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/Jrmal79cER5dgPr4Hm7/UrBkB8BpfcEy4GnSZchEro=;
	b=s/6aM+/PlsKFrhL3ox9L+gGXuotyDCb9s/lhermUWaQiZ8rqmR15R/r+pY/uZwFfMg+5
	 30FPIOqYZ1AVifI9JcBFFKgTkoG7ogGbn/zTwjZchY5MLCN8UHspCJ28dyRzmcis4uyM5
	 ePfP9slOyyGwyyCobRnmFQyQ42pG/j4UaZVfn3g+f8UwXH7Ad88GYPCojCLndwUDyfrky
	 i2jbVQ3VG/Qt5v/4x/0Yb5v4JCixlcXo5HXIDtOQqgNEO3nsgxyw4CLmDFrcgC/TdGmZN
	 +zk7foS2pCROTtki4hYi4kN1mYpHIMgeSoMvx3+7VHnsA9k/YDhr0Y9hwdrhjbCVvUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794074864;
	bh=/Jrmal79cER5dgPr4Hm7/UrBkB8BpfcEy4GnSZchEro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S0i64tt4AprnUmKV3GdF0Kv1uFL/N3reicAdM1n6Dww3ODi1QNc1lt9ZdLmJe+hmV
	 KSRKDUYBMEL4LflfD8Eu/9nIQ/fi0KNSPlUaM5mfzvBNEqyC6cS5Eraw0pX2FOc8TX
	 dXVPJ1tDAlzxqxyqfr40BlKlTUKKNQ2Z65DezowYRR1Ym/VsWkxcnhGcSwQkWq1+3A
	 AfuWZofu2D4CmOx4ZlEbA0pXuN+RYMb5HWn/T0LCf/ZM8ccE/TZtPldy3owqO95B13
	 UJGyVqfIWkX0G8rkYtOa6sW8yGmgqoEPQPoipwrv+SVS23ppBah8NWuS2sitV+S4hg
	 aHkOGX4VJ4LiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A45560664;
	Sat,  7 Nov 2026 18:07:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C71FA32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC8A580EB3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBGKMuuCqh28 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 18:07:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B32F280EDC
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B32F280EDC
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:07:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F32088712; Sat,  7 Nov 2026 18:06:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 18:57:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5b3054633e276d5d7e5fed19206a8d17c11e234
X-Git-Newrev: b45aee7843533b5e813e28b51553104e9b020671
X-Patchwork-Hint: ignore
Message-Id: <20261107180609.4F32088712@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x265: bump version to 4.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3181811774807765797=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3181811774807765797==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b45aee7843533b5e813e28b51553104e9b020671
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://mailman.videolan.org/pipermail/x265-devel/2026-July/014552.html
https://mailman.videolan.org/pipermail/x265-devel/2026-April/014533.html

Rebased patch 0001.
Removed remaining patches which are included in this release.

Upstream moved the repository to github:
https://mailman.videolan.org/pipermail/x265-devel/2026-May/014545.html

This bump includes upstream commit
https://github.com/Multicorewareinc/x265/commit/f74b2f38ad850a09524f331f64870e6300fd923b
that uses vst1q_s16_x2() which was first added to gcc 9:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=568421baa5a4cdb7bb7c5ac323c939492ee3f052

causing build errors detected by the Gitlab pipelines:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/x265-4.3/source/common/aarch64/pixel-prim.cpp:787:25:
 error: ‘vst1q_s16_x2’ was not declared in this scope

Upstream added the usage of __sync_fetch_and_add_8 with commit
https://github.com/Multicorewareinc/x265/commit/cb40d974e9d6e0388d4dac9484eaa68ceb5c3dcb
first included in this release. To fix build errorswith toolchains not
supporting __sync_fetch_and_add_8 we disable atomics by adding
-DNO_ATOMICS=ON to _CONF_OPTS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...MakeLists.txt-do-not-force-compiler-flags.patch |  4 +-
 ...build-error-with-latest-CMake-4.0-release.patch | 35 -------------
 .../0003-Fix-for-CMake-Build-Errors-in-MacOS.patch | 60 ----------------------
 ...x-neon-undefined-symbols-in-armv6l-armv7l.patch | 28 ----------
 package/x265/x265.hash                             |  3 +-
 package/x265/x265.mk                               | 15 +++++-
 6 files changed, 17 insertions(+), 128 deletions(-)

diff --git a/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch b/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch
index 4a12c15ca4..2ad27de084 100644
--- a/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch
+++ b/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch
@@ -21,7 +21,7 @@ Bernd Kuhls <bernd.kuhls@t-online.de>.
 
 Upstream: https://bitbucket.org/multicoreware/x265_git/pull-requests/26
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Bernd: rebased for 4.1]
+[Bernd: rebased for 4.3]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  source/CMakeLists.txt              | 6 +++---
@@ -32,7 +32,7 @@ diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
 index c14489ea6..fa331e8af 100755
 --- a/source/CMakeLists.txt
 +++ b/source/CMakeLists.txt
-@@ -270,14 +270,14 @@ if(GCC)
+@@ -321,14 +321,14 @@ if(GCC)
      endif()
      if(ARM AND CROSS_COMPILE_ARM)
          message(STATUS "cross compile arm")
diff --git a/package/x265/0002-Fix-CMake-build-error-with-latest-CMake-4.0-release.patch b/package/x265/0002-Fix-CMake-build-error-with-latest-CMake-4.0-release.patch
deleted file mode 100644
index 95d7a7c7b2..0000000000
--- a/package/x265/0002-Fix-CMake-build-error-with-latest-CMake-4.0-release.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b354c009a60bcd6d7fc04014e200a1ee9c45c167 Mon Sep 17 00:00:00 2001
-From: yaswanthsastry <yaswanth.sastry@multicorewareinc.com>
-Date: Mon, 24 Feb 2025 17:07:03 +0530
-Subject: [PATCH] Fix CMake build error with latest CMake 4.0 release
-
-Upstream: https://bitbucket.org/multicoreware/x265_git/commits/b354c009a60bcd6d7fc04014e200a1ee9c45c167
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- source/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
-index 37dbe1a87..4f5b3ed82 100755
---- a/source/CMakeLists.txt
-+++ b/source/CMakeLists.txt
-@@ -7,13 +7,13 @@ if(NOT CMAKE_BUILD_TYPE)
- endif()
- message(STATUS "cmake version ${CMAKE_VERSION}")
- if(POLICY CMP0025)
--    cmake_policy(SET CMP0025 OLD) # report Apple's Clang as just Clang
-+    cmake_policy(SET CMP0025 NEW) # report Apple's Clang as just Clang
- endif()
- if(POLICY CMP0042)
-     cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
- endif()
- if(POLICY CMP0054)
--    cmake_policy(SET CMP0054 OLD) # Only interpret if() arguments as variables or keywords when unquoted
-+    cmake_policy(SET CMP0054 NEW) # Only interpret if() arguments as variables or keywords when unquoted
- endif()
- 
- project (x265)
--- 
-2.51.0
-
diff --git a/package/x265/0003-Fix-for-CMake-Build-Errors-in-MacOS.patch b/package/x265/0003-Fix-for-CMake-Build-Errors-in-MacOS.patch
deleted file mode 100644
index 200ba15be4..0000000000
--- a/package/x265/0003-Fix-for-CMake-Build-Errors-in-MacOS.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 51ae8e922bcc4586ad4710812072289af91492a8 Mon Sep 17 00:00:00 2001
-From: yaswanthsastry <yaswanth.sastry@multicorewareinc.com>
-Date: Mon, 7 Apr 2025 11:27:36 +0530
-Subject: [PATCH] Fix for CMake Build Errors in MacOS
-
-Upstream: https://bitbucket.org/multicoreware/x265_git/commits/51ae8e922bcc4586ad4710812072289af91492a8
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- source/CMakeLists.txt | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
-index 4f5b3ed82..7183fd3ce 100755
---- a/source/CMakeLists.txt
-+++ b/source/CMakeLists.txt
-@@ -6,18 +6,14 @@ if(NOT CMAKE_BUILD_TYPE)
-         FORCE)
- endif()
- message(STATUS "cmake version ${CMAKE_VERSION}")
--if(POLICY CMP0025)
--    cmake_policy(SET CMP0025 NEW) # report Apple's Clang as just Clang
--endif()
-+
- if(POLICY CMP0042)
-     cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
- endif()
--if(POLICY CMP0054)
--    cmake_policy(SET CMP0054 NEW) # Only interpret if() arguments as variables or keywords when unquoted
--endif()
-+
- 
- project (x265)
--cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries require 2.8.8
-+cmake_minimum_required (VERSION 2.8.8...3.10) # OBJECT libraries require 2.8.8
- include(CheckIncludeFiles)
- include(CheckFunctionExists)
- include(CheckSymbolExists)
-@@ -168,7 +164,7 @@ if(APPLE)
-   add_definitions(-DMACOS=1)
- endif()
- 
--if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
-+if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "AppleClang")
-     set(CLANG 1)
- endif()
- if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
-@@ -740,6 +736,9 @@ if((MSVC_IDE OR XCODE OR GCC) AND ENABLE_ASSEMBLY)
-     if(ARM OR CROSS_COMPILE_ARM)
-     # compile ARM arch asm files here
-         enable_language(ASM)
-+        if(APPLE)
-+            set(ARM_ARGS ${ARM_ARGS} -arch ${CMAKE_OSX_ARCHITECTURES})
-+        endif()
-         foreach(ASM ${ARM_ASMS})
- 			set(ASM_SRC ${CMAKE_CURRENT_SOURCE_DIR}/common/arm/${ASM})
-             list(APPEND ASM_SRCS ${ASM_SRC})
--- 
-2.51.0
-
diff --git a/package/x265/0004-Fix-neon-undefined-symbols-in-armv6l-armv7l.patch b/package/x265/0004-Fix-neon-undefined-symbols-in-armv6l-armv7l.patch
deleted file mode 100644
index 75f1d4c532..0000000000
--- a/package/x265/0004-Fix-neon-undefined-symbols-in-armv6l-armv7l.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ddb1933598736394b646cb0f78da4a4201ffc656 Mon Sep 17 00:00:00 2001
-From: Uthayakumar Muthu <uthayakumar.muthu@multicorewareinc.com>
-Date: Sun, 12 Jan 2025 13:17:21 +0530
-Subject: [PATCH] Fix neon undefined symbols in armv6l,armv7l
-
-Upstream: https://bitbucket.org/multicoreware/x265_git/commits/ddb1933598736394b646cb0f78da4a4201ffc656
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- source/common/cpu.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/source/common/cpu.cpp b/source/common/cpu.cpp
-index ae0907890..35c43deaf 100644
---- a/source/common/cpu.cpp
-+++ b/source/common/cpu.cpp
-@@ -352,7 +352,7 @@ uint32_t cpu_detect(bool benableavx512)
- {
-     int flags = 0;
- 
--#if HAVE_ARMV6
-+#if HAVE_ARMV6 && ENABLE_ASSEMBLY
-     flags |= X265_CPU_ARMV6;
- 
-     // don't do this hack if compiled with -mfpu=neon
--- 
-2.51.0
-
diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 640cd9ce0d..fa9348a075 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,3 +1,4 @@
+# From https://github.com/Multicorewareinc/x265/releases/tag/4.3
+sha256  83c53e4c8bbb8f1e33ed59e10a7d621d1d7801ca853910c3eb41f038b8ffb121  x265_4.3.tar.gz
 # Locally generated
-sha256  a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29  x265_4.1.tar.gz
 sha256  d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index fdbdfc2cfd..6aca8db3d9 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-X265_VERSION = 4.1
+X265_VERSION = 4.3
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
-X265_SITE = https://bitbucket.org/multicoreware/x265_git/downloads
+X265_SITE = https://github.com/Multicorewareinc/x265/releases/download/$(X265_VERSION)
 X265_LICENSE = GPL-2.0+
 X265_LICENSE_FILES = COPYING
 X265_CPE_ID_VENDOR = multicorewareinc
@@ -37,12 +37,23 @@ ifeq ($(BR2_i386),y)
 X265_CONF_OPTS += -DEXTRA_LINK_FLAGS=-Wl,-z,notext
 endif
 
+# x265 uses vst1q_s16_x2 on aarch64 which was implemented in gcc 9
+ifeq ($(BR2_aarch64):$(BR2_TOOLCHAIN_GCC_AT_LEAST_9),y:)
+X265_CONF_OPTS += -DENABLE_ASSEMBLY=0
+endif
+
 # disable altivec, it has build issues
 # https://bitbucket.org/multicoreware/x265/issues/320/
 ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 X265_CONF_OPTS += -DENABLE_ALTIVEC=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8),y)
+X265_CONF_OPTS += -DNO_ATOMICS=OFF
+else
+X265_CONF_OPTS += -DNO_ATOMICS=ON
+endif
+
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 X265_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_PIC=ON
 else

--===============3181811774807765797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3181811774807765797==--
