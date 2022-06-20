Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50084C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E95D340B7C;
	Mon, 20 Jun 2022 19:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E95D340B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSZtZKvSCBhw; Mon, 20 Jun 2022 19:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C06C440BAE;
	Mon, 20 Jun 2022 19:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C06C440BAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7C771BF9BA
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 906FD4018F
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 906FD4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQYLG562bhnz for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E78405B3
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E78405B3
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A1B64874DB; Mon, 20 Jun 2022 19:22:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 20:30:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 776385d645b37cfc43479b37e106244aa9ab2e85
X-Git-Newrev: 456f704e6b7be147c504d53a78536938f088e8e8
X-Patchwork-Hint: ignore
Message-Id: <20220620192231.A1B64874DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm: bump to version 11.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=456f704e6b7be147c504d53a78536938f088e8e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/clang/Config.in  |  6 +++---
 package/llvm/Config.in   |  6 +++---
 package/llvm/llvm.hash   |  4 ++--
 package/llvm/llvm.mk     | 20 ++++++--------------
 package/mesa3d/Config.in |  6 +++---
 5 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/package/clang/Config.in b/package/clang/Config.in
index a67e7631a8..7c732c7af7 100644
--- a/package/clang/Config.in
+++ b/package/clang/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CLANG
 	bool "clang"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
@@ -14,10 +14,10 @@ config BR2_PACKAGE_CLANG
 
 	  http://clang.llvm.org
 
-comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
+comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "clang needs a toolchain not affected by GCC bug 64735"
diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 6ec2ffcfe6..c1887e36dd 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
 config BR2_PACKAGE_LLVM
 	bool "llvm"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
@@ -55,10 +55,10 @@ config BR2_PACKAGE_LLVM_BPF
 
 endif
 
-comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
+comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm needs a toolchain not affected by GCC bug 64735"
diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 6bf2755777..e7f79492de 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
-sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
+sha256  ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5  llvm-11.1.0.src.tar.xz
+sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 6c721c30b9..825de96392 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 9.0.1
+LLVM_VERSION = 11.1.0
 LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
@@ -157,15 +157,9 @@ LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 HOST_LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 
-# Disable C++1y (ISO C++ 2014 standard)
-# Disable C++1z (ISO C++ 2017 standard)
-# Compile llvm with the C++11 (ISO C++ 2011 standard) which is the fallback.
-HOST_LLVM_CONF_OPTS += \
-	-DLLVM_ENABLE_CXX1Y=OFF \
-	-DLLVM_ENABLE_CXX1Z=OFF
-LLVM_CONF_OPTS += \
-	-DLLVM_ENABLE_CXX1Y=OFF \
-	-DLLVM_ENABLE_CXX1Z=OFF
+# Compile llvm with the C++14 (ISO C++ 2014 standard).
+HOST_LLVM_CONF_OPTS += -DCMAKE_CXX_STANDARD=14
+LLVM_CONF_OPTS += -DCMAKE_CXX_STANDARD=14
 
 # Disabled, requires sys/ndir.h header
 # Disable debug in module
@@ -237,13 +231,11 @@ endif
 HOST_LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
 	-DLLVM_BUILD_RUNTIME=OFF \
-	-DLLVM_INCLUDE_RUNTIMES=OFF \
-	-DLLVM_POLLY_BUILD=OFF
+	-DLLVM_INCLUDE_RUNTIMES=OFF
 LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
 	-DLLVM_BUILD_RUNTIME=OFF \
-	-DLLVM_INCLUDE_RUNTIMES=OFF \
-	-DLLVM_POLLY_BUILD=OFF
+	-DLLVM_INCLUDE_RUNTIMES=OFF
 
 HOST_LLVM_CONF_OPTS += \
 	-DLLVM_ENABLE_WARNINGS=ON \
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e41da562dc..b0ebc09212 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
@@ -32,10 +32,10 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_USE_WCHAR # std::wstring
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
+comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm support needs a toolchain not affected by GCC bug 64735"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
