Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C38FD88C0
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 21:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF6F61593;
	Tue, 10 Mar 2026 21:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycKoWYLwervS; Tue, 10 Mar 2026 21:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31059614D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773179827;
	bh=XZP+u/YzeOTH/fAEvgmWWWWMAsVOKqVk2pg8cG2CdyY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VHzztf01+Fhax649obdTzgl5D0TxZhTIKiVOSibZn7AEh4TJcub6aUwSw2Ag00Y7y
	 SPrUzu8KDDPLz1D/s5/yzHsB0j+yfDlIytZrXJE9D1VSfMnAxp79dsUOGJjhXSqRTL
	 jhPb6+ccRL6cWlAE4BlHG9NTloCAuIk4IfHFyw2v4jQSA2r68fjdSFSyLADCqpA6A8
	 7Me4nOSZNfEMPa+3zvL1fG9D6xQhlFhiF5qjT+yVE7Q2MCXveJ5Au1Tsd8yssITizP
	 TIvUeoJBKu4SnYHthlXV1p4zlmn7mSQ0ni00WBcPAhiMvJQZkMQ/wif6cdPO3XMc9x
	 dLcUwSwJeR3eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31059614D8;
	Tue, 10 Mar 2026 21:57:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 848B6201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 768054064C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFSBw9lyfUmh for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 21:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCA5F406CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCA5F406CE
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:57:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E378F8688B; Tue, 10 Mar 2026 21:57:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 19:11:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dc5cbdf0d974baa6a2597f91dd734bae3187ffc
X-Git-Newrev: 25cb3813e7fc6ed3e455f983cf0e09c7bc02fccb
X-Patchwork-Hint: ignore
Message-Id: <20260310215701.E378F8688B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.0
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
Content-Type: multipart/mixed; boundary="===============8770937938186346527=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8770937938186346527==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25cb3813e7fc6ed3e455f983cf0e09c7bc02fccb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Subproject tarballs are not provided anymore:
https://discourse.llvm.org/t/llvm-22-1-0-released/89950
"Please note since the last release the subproject tarballs have been
 removed"
https://discourse.llvm.org/t/rfc-do-something-with-the-subproject-tarballs-in-the-release-page/75024/14

Used upstream tarball llvm-project-22.1.0.src.tar.xz for all packages
and linked subproject hash files to ../llvm-project.hash.

Removed patches which fix build errors caused by subproject tarballs.

Removed handling of third-party-21.1.8.src.tar.xz which is included in
the monolithic tarball.

Added _SUBDIR variable or updated _INSTALL_CMDS when needed.

For compiler-rt:

Removed both patches, they are not needed anymore.

Added patch to fix aarch64 build.

Added dependency on gcc >= 15.x because libcxx now depends on gcc >=
15.x: https://github.com/llvm/llvm-project/pull/165684
  warning "Libc++ only supports GCC 15 and later"

Building with gcc 14.x causes many build errors like

output/build/compiler-rt-22.1.0/compiler-rt/buildroot-build/lib/fuzzer/libcxx_fuzzer_x86_64/build/include/c++/v1/__type_traits/is_array.h:43:68:
 error: expected primary-expression before ')' token

output/build/compiler-rt-22.1.0/compiler-rt/buildroot-build/lib/fuzzer/libcxx_fuzzer_x86_64/build/include/c++/v1/__type_traits/is_array.h:43:44:
 error: there are no arguments to '__is_unbounded_array' that depend on
 a template parameter, so a declaration of '__is_unbounded_array' must
 be available [-fpermissive]

output/build/compiler-rt-22.1.0/compiler-rt/buildroot-build/lib/fuzzer/libcxx_fuzzer_x86_64/build/include/c++/v1/__type_traits/decay.h:22:32:
 error: expected type-specifier before '__decay'

A corresponding bug report sent upstream
https://github.com/llvm/llvm-project/issues/174203

was answered:
https://github.com/llvm/llvm-project/issues/174203#issuecomment-3711113919
"Our policy is rather clear: Only the latest GCC is supported."

and an update to supported compiler versions was committed:
https://github.com/llvm/llvm-project/commit/d1146b1ddd03aea3d67ce8f413607e8e8be67f4b

Updated TestClangCompilerRT to use a gcc 15-based toolchain.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/clang/clang.hash              |  4 +-
 package/llvm-project/clang/clang.mk                |  8 ++-
 .../compiler-rt/0001-include-cstdint.patch         | 31 ----------
 .../0001-libc-Fix-detection-of-cfloat128.patch     | 70 ++++++++++++++++++++++
 ...-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch | 32 ----------
 package/llvm-project/compiler-rt/Config.in         |  6 +-
 package/llvm-project/compiler-rt/compiler-rt.hash  |  5 +-
 package/llvm-project/compiler-rt/compiler-rt.mk    | 14 +----
 .../libclc/0001-support-out-of-tree-build.patch    | 32 ----------
 package/llvm-project/libclc/libclc.hash            |  4 +-
 package/llvm-project/libclc/libclc.mk              |  4 +-
 package/llvm-project/lld/lld.hash                  |  4 +-
 package/llvm-project/lld/lld.mk                    |  4 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash    |  3 +-
 package/llvm-project/llvm-cmake/llvm-cmake.mk      |  5 +-
 .../llvm-libunwind/llvm-libunwind.hash             |  4 +-
 .../llvm-project/llvm-libunwind/llvm-libunwind.mk  |  4 +-
 package/llvm-project/llvm-project.hash             |  4 ++
 package/llvm-project/llvm-project.mk               |  5 +-
 .../llvm-project/llvm-runtimes/llvm-runtimes.hash  |  3 +-
 .../llvm-project/llvm-runtimes/llvm-runtimes.mk    |  5 +-
 .../llvm/0001-Fix-standalone-build-for-llvm.patch  | 49 ---------------
 package/llvm-project/llvm/llvm.hash                |  5 +-
 package/llvm-project/llvm/llvm.mk                  | 17 +-----
 support/testing/tests/package/test_clang.py        |  1 +
 25 files changed, 116 insertions(+), 207 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
deleted file mode 100644
index 1abe819e62..0000000000
--- a/package/llvm-project/clang/clang.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally calculated
-sha256  6090e3f23720d003cdd84483a47d0eec6d01adbb5e0c714ac0c8b58de546aa62  clang-21.1.8.src.tar.xz
-sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/clang/clang.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 3e41cb3b13..116389449b 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -7,10 +7,12 @@
 CLANG_VERSION_MAJOR = $(LLVM_PROJECT_VERSION_MAJOR)
 CLANG_VERSION = $(LLVM_PROJECT_VERSION)
 CLANG_SITE = $(LLVM_PROJECT_SITE)
-CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
+CLANG_SOURCE = $(LLVM_PROJECT_SOURCE)
+CLANG_DL_SUBDIR = llvm-project
 CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
 CLANG_CPE_ID_VENDOR = llvm
+CLANG_SUBDIR = clang
 CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
 CLANG_INSTALL_STAGING = YES
 
@@ -142,11 +144,11 @@ define HOST_CLANG_TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-wrapper.c \
-		-o $(@D)/toolchain-wrapper-clang
+		-o $(@D)/clang/toolchain-wrapper-clang
 endef
 
 define HOST_CLANG_TOOLCHAIN_WRAPPER_INSTALL
-	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper-clang \
+	$(INSTALL) -D -m 0755 $(@D)/clang/toolchain-wrapper-clang \
 		$(HOST_DIR)/bin/toolchain-wrapper-clang
 endef
 
diff --git a/package/llvm-project/compiler-rt/0001-include-cstdint.patch b/package/llvm-project/compiler-rt/0001-include-cstdint.patch
deleted file mode 100644
index ce75b29f4e..0000000000
--- a/package/llvm-project/compiler-rt/0001-include-cstdint.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 735207ac16bb15d88116bf00283eb0135ed2585a Mon Sep 17 00:00:00 2001
-From: Paul Zander <negril.nx+gentoo@gmail.com>
-Date: Thu, 22 Aug 2024 11:40:13 +0200
-Subject: [PATCH] include cstdint
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Gentoo-Component: compiler-rt
-Signed-off-by: Paul Zander <negril.nx+gentoo@gmail.com>
-Signed-off-by: Michał Górny <mgorny@gentoo.org>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://bugs.gentoo.org/939498
----
- lib/orc/error.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/orc/error.h b/lib/orc/error.h
-index 92ac5a884ac6..33a599f71149 100644
---- a/lib/orc/error.h
-+++ b/lib/orc/error.h
-@@ -14,6 +14,7 @@
- #include "stl_extras.h"
- 
- #include <cassert>
-+#include <cstdint>
- #include <memory>
- #include <string>
- #include <type_traits>
--- 
-2.46.0
diff --git a/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch b/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch
new file mode 100644
index 0000000000..4587dbfd7d
--- /dev/null
+++ b/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch
@@ -0,0 +1,70 @@
+From 4e1af872f819782bd233ab21953ab92cf36ff9c3 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 9 Mar 2026 19:07:10 +0100
+Subject: [PATCH] [libc] Fix detection of cfloat128
+
+Building compiler-rt with aarch64-buildroot-linux-gnu-gcc 15.2 causes a
+build error:
+
+compiler-rt-22.1.0/cmake/Modules/../../libc/src/__support/CPP/type_traits/is_complex.h:44:31:
+ error: 'cfloat128' was not declared in this scope; did you mean 'float128'? [-Wtemplate-body]
+
+According to https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Floating-Types.html
+__float128 is not available on aarch64.
+
+Analyzing the gcc defines for aarch64 seems to prove it:
+
+$ aarch64-buildroot-linux-gnu-gcc -v
+Target: aarch64-buildroot-linux-gnu
+gcc version 15.2.0 (Buildroot 2026.02-114-gdadec9da56)
+
+$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep __GCC_IEC_559_COMPLEX
+  #define __GCC_IEC_559_COMPLEX 2
+
+$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep __STDC_IEC_60559_COMPLEX__
+  #define __STDC_IEC_60559_COMPLEX__ 201404L
+
+$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep -i float128
+$
+
+In contrast gcc for x86_64:
+
+$ x86_64-buildroot-linux-gnu-gcc -v
+Target: x86_64-buildroot-linux-gnu
+gcc version 15.2.0 (Buildroot 2026.02-112-gd12ac02486)
+
+$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep __GCC_IEC_559_COMPLEX
+  #define __GCC_IEC_559_COMPLEX 2
+
+$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep __STDC_IEC_60559_COMPLEX__
+  #define __STDC_IEC_60559_COMPLEX__ 201404L
+
+$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep -i float128
+  #define __SIZEOF_FLOAT128__ 16
+
+This patch changes the or-condition to an and-condition for
+__STDC_IEC_60559_COMPLEX__ and __SIZEOF_FLOAT128__.
+
+Upstream: https://github.com/llvm/llvm-project/pull/185486
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libc/include/llvm-libc-macros/cfloat128-macros.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/include/llvm-libc-macros/cfloat128-macros.h b/libc/include/llvm-libc-macros/cfloat128-macros.h
+index 5f28cfa21aae..ff4aa530685d 100644
+--- a/libc/include/llvm-libc-macros/cfloat128-macros.h
++++ b/libc/include/llvm-libc-macros/cfloat128-macros.h
+@@ -27,7 +27,7 @@
+ #define LIBC_TYPES_HAS_CFLOAT128
+ #endif
+ #elif defined(__GNUC__)
+-#if (defined(__STDC_IEC_60559_COMPLEX__) || defined(__SIZEOF_FLOAT128__)) &&   \
++#if (defined(__STDC_IEC_60559_COMPLEX__) && defined(__SIZEOF_FLOAT128__)) &&   \
+     (__GNUC__ >= 13 || (!defined(__cplusplus)))
+ #define LIBC_TYPES_HAS_CFLOAT128
+ #endif
+-- 
+2.47.3
+
diff --git a/package/llvm-project/compiler-rt/0002-compiler-rt-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch b/package/llvm-project/compiler-rt/0002-compiler-rt-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch
deleted file mode 100644
index 2aa2d2c583..0000000000
--- a/package/llvm-project/compiler-rt/0002-compiler-rt-Use-LLVM_THIRD_PARTY_DIR-for-siphash-inc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8fb17d03f8f7cec84dc8d6baebd479c4c34ba74b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 2 Nov 2025 21:18:24 +0100
-Subject: [PATCH] compiler-rt: Use LLVM_THIRD_PARTY_DIR for siphash include
-
-Introduced by https://github.com/llvm/llvm-project/commit/7f3afab9181d83f92771293ad3b6c00ac62800fd
-but currently unused in compiler-rt leading to build errors with
-COMPILER_RT_STANDALONE_BUILD=ON
-
-Upstream: https://github.com/llvm/llvm-project/pull/166097
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/builtins/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/builtins/CMakeLists.txt b/lib/builtins/CMakeLists.txt
-index 6c226aa7d2d4..7eb5ef487d31 100644
---- a/lib/builtins/CMakeLists.txt
-+++ b/lib/builtins/CMakeLists.txt
-@@ -64,7 +64,7 @@ include(CMakePushCheckState)
- option(COMPILER_RT_BUILTINS_HIDE_SYMBOLS
-   "Do not export any symbols from the static library." ON)
- 
--include_directories(../../../third-party/siphash/include)
-+include_directories(${LLVM_THIRD_PARTY_DIR}/siphash/include)
- 
- # TODO: Need to add a mechanism for logging errors when builtin source files are
- # added to a sub-directory and not this CMakeLists file.
--- 
-2.47.3
-
diff --git a/package/llvm-project/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
index b665165516..9fa7fbccfc 100644
--- a/package/llvm-project/compiler-rt/Config.in
+++ b/package/llvm-project/compiler-rt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_COMPILER_RT
 	bool "compiler-rt"
 	depends on BR2_PACKAGE_LLVM
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang
 	select BR2_PACKAGE_LIBXCRYPT
@@ -12,6 +13,7 @@ config BR2_PACKAGE_COMPILER_RT
 
 	  https://compiler-rt.llvm.org/
 
-comment "compiler-rt requires llvm to be enabled, a glibc toolchain, host gcc >= 7"
+comment "compiler-rt requires llvm to be enabled, a glibc toolchain, gcc >= 15, host gcc >= 7"
 	depends on !BR2_PACKAGE_LLVM
-	depends on !BR2_TOOLCHAIN_USES_GLIBC ||	!BR2_HOST_GCC_AT_LEAST_7
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_HOST_GCC_AT_LEAST_7 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_15
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
deleted file mode 100644
index 0ecea6d400..0000000000
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally computed:
-sha256  dd54ae21aee1780fac59445b51ebff601ad016b31ac3a7de3b21126fd3ccb229  compiler-rt-21.1.8.src.tar.xz
-sha256  7fe99424384aea529ffaeec9cc9dfb8b451fd1852c03fc109e426fe208a1f1a7  third-party-21.1.8.src.tar.xz
-sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 2571114253..7c8fdf7f40 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -5,32 +5,24 @@
 ################################################################################
 
 COMPILER_RT_VERSION = $(LLVM_PROJECT_VERSION)
-COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
 COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
+COMPILER_RT_SOURCE = $(LLVM_PROJECT_SOURCE)
+COMPILER_RT_DL_SUBDIR = llvm-project
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_CPE_ID_VENDOR = llvm
 COMPILER_RT_DEPENDENCIES = host-clang libxcrypt llvm
+COMPILER_RT_SUBDIR = compiler-rt
 COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 
 COMPILER_RT_INSTALL_STAGING = YES
 COMPILER_RT_INSTALL_TARGET = NO
 
-COMPILER_RT_EXTRA_DOWNLOADS = third-party-$(COMPILER_RT_VERSION).src.tar.xz
-
-define COMPILER_RT_THIRD_PARTY_EXTRACT
-	$(call suitable-extractor,$(notdir $(COMPILER_RT_EXTRA_DOWNLOADS))) \
-		$(COMPILER_RT_DL_DIR)/$(notdir $(COMPILER_RT_EXTRA_DOWNLOADS)) | \
-		$(TAR) -C $(@D) $(TAR_OPTIONS) -
-endef
-COMPILER_RT_POST_EXTRACT_HOOKS += COMPILER_RT_THIRD_PARTY_EXTRACT
-
 COMPILER_RT_CONF_OPTS = \
 	-DCOMPILER_RT_STANDALONE_BUILD=ON \
 	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
 	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
 	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm \
-	-DLLVM_THIRD_PARTY_DIR=$(@D)/third-party-$(COMPILER_RT_VERSION).src \
 	-DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 
 # The installation of the target runtime libraries defaults to DESTDIR, however
diff --git a/package/llvm-project/libclc/0001-support-out-of-tree-build.patch b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
deleted file mode 100644
index d2cde4de0a..0000000000
--- a/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a435f3c9318935ba29b04dabe7342cd6160711e0 Mon Sep 17 00:00:00 2001
-From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
-Date: Thu, 15 May 2025 10:02:12 +0200
-Subject: [PATCH] support out of tree build
-
-prepare_builtins tool is built
-but not placed in the path for later use in the build. This
-fix allows the later build steps to use the binary in-place.
-
-Upstream: Not submitted
-
-Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
----
- libclc/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d651a9bf506b..18bd7efe8217 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -180,7 +180,7 @@ set(LLVM_LINK_COMPONENTS
- )
- if( LIBCLC_STANDALONE_BUILD )
-   add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
--  set( prepare_builtins_exe prepare_builtins )
-+  set( prepare_builtins_exe ./prepare_builtins )
-   set( prepare_builtins_target prepare_builtins )
- else()
-   add_llvm_utility( prepare_builtins utils/prepare-builtins.cpp )
--- 
-2.43.0
-
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
deleted file mode 100644
index 8f06a55864..0000000000
--- a/package/llvm-project/libclc/libclc.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally calculated
-sha256  6c2677362a53531c35edf482bdc9171ea0471ca0a1e9138ac9b5a1782925616f  libclc-21.1.8.src.tar.xz
-sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/libclc/libclc.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
index 399878bf0b..ff00871747 100644
--- a/package/llvm-project/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -6,9 +6,11 @@
 
 LIBCLC_VERSION = $(LLVM_PROJECT_VERSION)
 LIBCLC_SITE = $(LLVM_PROJECT_SITE)
-LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
+LIBCLC_SOURCE = $(LLVM_PROJECT_SOURCE)
+LIBCLC_DL_SUBDIR = llvm-project
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
+LIBCLC_SUBDIR= libclc
 
 LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
 HOST_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
deleted file mode 100644
index b7483d5564..0000000000
--- a/package/llvm-project/lld/lld.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally calculated
-sha256  d9524c5ee952500a2af92c27042a0d90ab089962af47816d4c85d0ebf76373d1  lld-21.1.8.src.tar.xz
-sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/lld/lld.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index e7233e74ae..735cb8a7ed 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -6,9 +6,11 @@
 
 LLD_VERSION = $(LLVM_PROJECT_VERSION)
 LLD_SITE = $(LLVM_PROJECT_SITE)
-LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
+LLD_SOURCE = $(LLVM_PROJECT_SOURCE)
+LLD_DL_SUBDIR = llvm-project
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
+LLD_SUBDIR = lld
 LLD_SUPPORTS_IN_SOURCE_BUILD = NO
 HOST_LLD_DEPENDENCIES = host-llvm host-llvm-libunwind
 
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
deleted file mode 100644
index c93a606c3c..0000000000
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally calculated
-sha256  85735f20fd8c81ecb0a09abb0c267018475420e93b65050cc5b7634eab744de9  cmake-21.1.8.src.tar.xz
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
index 26dc04dcd7..31b015c5c0 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.mk
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -6,12 +6,13 @@
 
 LLVM_CMAKE_VERSION = $(LLVM_PROJECT_VERSION)
 LLVM_CMAKE_SITE = $(LLVM_PROJECT_SITE)
-LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
+LLVM_CMAKE_SOURCE = $(LLVM_PROJECT_SOURCE)
+LLVM_CMAKE_DL_SUBDIR = llvm-project
 LLVM_CMAKE_LICENSE = Apache-2.0 with exceptions
 
 define HOST_LLVM_CMAKE_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/lib/cmake/llvm/Modules
-	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm/Modules
+	cp -Rv $(@D)/cmake/Modules/* $(HOST_DIR)/lib/cmake/llvm/Modules
 	ln -sf $(HOST_DIR)/lib/cmake/llvm/Modules/* $(HOST_DIR)/lib/cmake/llvm/
 endef
 
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
deleted file mode 100644
index bdd6b2481c..0000000000
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  03e8adc6c3bdde657dcaedc94886ea70d1f7d551d622fcd8a36a8300e5c36cbc  libunwind-21.1.8.src.tar.xz
-sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
index e7b59a9dcf..31e0e75bfb 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -6,9 +6,11 @@
 
 LLVM_LIBUNWIND_VERSION = $(LLVM_PROJECT_VERSION)
 LLVM_LIBUNWIND_SITE = $(LLVM_PROJECT_SITE)
-LLVM_LIBUNWIND_SOURCE = libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz
+LLVM_LIBUNWIND_SOURCE = $(LLVM_PROJECT_SOURCE)
+LLVM_LIBUNWIND_DL_SUBDIR = llvm-project
 LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
 LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
+LLVM_LIBUNWIND_SUBDIR = libunwind
 LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
 
 HOST_LLVM_LIBUNWIND_DEPENDENCIES = host-llvm-cmake host-llvm-runtimes
diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
new file mode 100644
index 0000000000..99e5dc666a
--- /dev/null
+++ b/package/llvm-project/llvm-project.hash
@@ -0,0 +1,4 @@
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.0
+sha256  25d2e2adc4356d758405dd885fcfd6447bce82a90eb78b6b87ce0934bd077173  llvm-project-22.1.0.src.tar.xz
+# locally calculated
+sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 411ef5fb3a..d9820d7d12 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 21
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
+LLVM_PROJECT_VERSION_MAJOR = 22
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
+LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
deleted file mode 100644
index 419176341a..0000000000
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally calculated
-sha256  b6989d35cdfc1acee4af1d110fb8887f76831eb93e1df6ff7365004048742db8  runtimes-21.1.8.src.tar.xz
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.mk b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
index 1886ff3a14..653dc74c89 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
@@ -6,12 +6,13 @@
 
 LLVM_RUNTIMES_VERSION = $(LLVM_PROJECT_VERSION)
 LLVM_RUNTIMES_SITE = $(LLVM_PROJECT_SITE)
-LLVM_RUNTIMES_SOURCE = runtimes-$(LLVM_RUNTIMES_VERSION).src.tar.xz
+LLVM_RUNTIMES_SOURCE = $(LLVM_PROJECT_SOURCE)
+LLVM_RUNTIMES_DL_SUBDIR = llvm-project
 LLVM_RUNTIMES_LICENSE = Apache-2.0 with exceptions
 
 define HOST_LLVM_RUNTIMES_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/lib/cmake/llvm/Modules
-	cp -Rv $(@D)/cmake/Modules/* $(HOST_DIR)/lib/cmake/llvm
+	cp -Rv $(@D)/runtimes/cmake/Modules/* $(HOST_DIR)/lib/cmake/llvm
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/llvm-project/llvm/0001-Fix-standalone-build-for-llvm.patch b/package/llvm-project/llvm/0001-Fix-standalone-build-for-llvm.patch
deleted file mode 100644
index cbb15599cb..0000000000
--- a/package/llvm-project/llvm/0001-Fix-standalone-build-for-llvm.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 255068deb7f3d18837ed30e739aa92c111ab450a Mon Sep 17 00:00:00 2001
-From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
-Date: Sat, 10 May 2025 12:55:07 +0200
-Subject: [PATCH] Fix standalone build for llvm
-
-Upstream commit 9dd01a5241dc ("Harmonize cmake_policy() across standalone builds of all projects")
-moved the `cmake_policy()` settings from `llvm/CMakeLists.txt` into a shared
-`cmake/modules/CMakePolicy.cmake`, and included it from all relevant projects
-(Clang, LLD, LLDB, etc.) to harmonize standalone builds.
-
-However, in `llvm/CMakeLists.txt`, unlike other components, the line:
-    set(LLVM_COMMON_CMAKE_UTILS ...)
-was left **without** the usual:
-    if(NOT DEFINED LLVM_COMMON_CMAKE_UTILS)
-
-This prevents external build systems (e.g., when using separate source archives)
-from overriding the `LLVM_COMMON_CMAKE_UTILS` variable, since the value is
-always reset unconditionally.
-
-This patch adds the missing `if(NOT DEFINED LLVM_COMMON_CMAKE_UTILS)` guard,
-in the same way as it is already done in Clang, LLD, etc., to make
-`LLVM_COMMON_CMAKE_UTILS` properly overridable.
-
-Upstream: Not submitted
-
-Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
----
- llvm/CMakeLists.txt | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f5293e866324..d861233f299f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -4,7 +4,10 @@ cmake_minimum_required(VERSION 3.20.0)
- 
- include(CMakeDependentOption)
- 
--set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
-+if(NOT DEFINED LLVM_COMMON_CMAKE_UTILS)
-+  set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
-+endif()
-+
- include(${LLVM_COMMON_CMAKE_UTILS}/Modules/CMakePolicy.cmake
-   NO_POLICY_SCOPE)
- 
--- 
-2.49.0
-
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
deleted file mode 100644
index 2e08ef5977..0000000000
--- a/package/llvm-project/llvm/llvm.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# locally calculated
-sha256  d9022ddadb40a15015f6b27e6549a7144704ded8828ba036ffe4b8165707de21  llvm-21.1.8.src.tar.xz
-sha256  7fe99424384aea529ffaeec9cc9dfb8b451fd1852c03fc109e426fe208a1f1a7  third-party-21.1.8.src.tar.xz
-sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
new file mode 120000
index 0000000000..c7905bcb53
--- /dev/null
+++ b/package/llvm-project/llvm/llvm.hash
@@ -0,0 +1 @@
+../llvm-project.hash
\ No newline at end of file
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 554e16169f..577128bb1e 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -6,26 +6,15 @@
 
 LLVM_VERSION = $(LLVM_PROJECT_VERSION)
 LLVM_SITE = $(LLVM_PROJECT_SITE)
-LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
+LLVM_SOURCE = $(LLVM_PROJECT_SOURCE)
+LLVM_DL_SUBDIR = llvm-project
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
 LLVM_CPE_ID_VENDOR = llvm
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
+LLVM_SUBDIR = llvm
 LLVM_INSTALL_STAGING = YES
 
-HOST_LLVM_EXTRA_DOWNLOADS = third-party-$(LLVM_VERSION).src.tar.xz
-
-define HOST_LLVM_THIRD_PARTY_EXTRACT
-	$(call suitable-extractor,$(notdir $(HOST_LLVM_EXTRA_DOWNLOADS))) \
-		$(HOST_LLVM_DL_DIR)/$(notdir $(HOST_LLVM_EXTRA_DOWNLOADS)) | \
-		$(TAR) -C $(@D) $(TAR_OPTIONS) -
-endef
-HOST_LLVM_POST_EXTRACT_HOOKS += HOST_LLVM_THIRD_PARTY_EXTRACT
-LLVM_POST_EXTRACT_HOOKS += HOST_LLVM_THIRD_PARTY_EXTRACT
-
-HOST_LLVM_CONF_OPTS += -DLLVM_THIRD_PARTY_DIR=$(@D)/third-party-$(LLVM_PROJECT_VERSION).src
-LLVM_CONF_OPTS += -DLLVM_THIRD_PARTY_DIR=$(@D)/third-party-$(LLVM_PROJECT_VERSION).src
-
 HOST_LLVM_DEPENDENCIES = host-python3 host-llvm-cmake
 LLVM_DEPENDENCIES = host-llvm
 
diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index a9794a49fa..6df8a71530 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -13,6 +13,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
         f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y

--===============8770937938186346527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8770937938186346527==--
