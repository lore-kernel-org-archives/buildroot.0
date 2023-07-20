Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304CEEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E106661289;
	Thu, 20 Jul 2023 21:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E106661289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xD0zTqZMSEKr; Thu, 20 Jul 2023 21:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94CF6129C;
	Thu, 20 Jul 2023 21:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94CF6129C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4AF1BF59D
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5658C82C04
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5658C82C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StcPv6LjtL2E for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F39482CFA
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F39482CFA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 507448749B; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:57:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4c8785ca22dbff0fbcfc373e1cbe2cd6a9b629e
X-Git-Newrev: d8291fde5ee19fd475953f41d9c519e817554d6b
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.507448749B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump to version
 15.0.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7119135583169142794=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7119135583169142794==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d8291fde5ee19fd475953f41d9c519e817554d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add new build dependencies to lld and llvm
- Add host-gcc and gcc >= 7.x dependency since clang doesn't build with gcc 6.3

  [ 28%] Building CXX object utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/TableGen.cpp.o
  output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitter.cpp: In instantiation of ‘{anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}::SemaRecord>)::<lambda(auto:2&)> [with auto:2 = const llvm::SmallVector<clang::RISCV::PrototypeDescriptor>]’:
  /usr/include/c++/6/bits/stl_algo.h:3769:5:   required from ‘_Funct std::for_each(_IIter, _IIter, _Funct) [with _IIter = std::_Rb_tree_const_iterator<llvm::SmallVector<clang::RISCV::PrototypeDescriptor> >; _Funct = {anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}::SemaRecord>)::<lambda(auto:2&)>]’
  output/host/include/llvm/ADT/STLExtras.h:1611:23:   required from ‘UnaryFunction llvm::for_each(R&&, UnaryFunction) [with R = std::set<llvm::SmallVector<clang::RISCV::PrototypeDescriptor>, {anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}::SemaRecord>)::Compare>&; UnaryFunction = {anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}::SemaRecord>)::<lambda(auto:2&)>]’
  output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitter.cpp:249:64:   required from here
  output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitter.cpp:249:50: error: cannot call member function ‘void {anonymous}::SemaSignatureTable::insert(llvm::ArrayRef<clang::RISCV::PrototypeDescriptor>)’ without object
    llvm::for_each(Signatures, [this](auto &Sig) { insert(Sig); });
                                                      ^~~~~~
  utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/build.make:313: recipe for target 'utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/RISCVVEmitter.cpp.o' failed
  make[4]: *** [utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/RISCVVEmitter.cpp.o] Error 1

  Indeed LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN is OFF, the CheckCompilerVersion.cmake
  trigger an error if gcc < 7.x. Indded since llvm 15 this option check for C++17 [1]

  The last gcc 7.x version (7.5) has been released in 2019.
  Fixing llvm/clang issues for old compiler maybe it's not worth it.

- Remove LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN since
  gcc >= 7 is mendatory.

  When updating LLVM, we also need to update the version of
  SPIRV_LLVM_TRANSLATOR because its CMakeLists.txt verifies the LLVM
  base version [2].

  The patch
  package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch has
  been included in tag llvmorg-15.0.0 of llvm-project.

  [1] https://github.com/llvm/llvm-project/commit/4c72deb613d9d8838785b431facb3eb480fb2f51
  [2] https://github.com/KhronosGroup/SPIRV-LLVM-Translator/blob/5be08b8bb91fc6ca62857792c177bc7479e5e3db/CMakeLists.txt#LL82C6-L82C6

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 package/llvm-project/clang/Config.in               | 10 +++----
 package/llvm-project/clang/clang.hash              |  2 +-
 package/llvm-project/clang/clang.mk                |  8 +----
 package/llvm-project/compiler-rt/Config.in         |  6 ++--
 package/llvm-project/compiler-rt/compiler-rt.hash  |  2 +-
 package/llvm-project/compiler-rt/compiler-rt.mk    |  3 +-
 package/llvm-project/libclc/Config.in              |  6 ++--
 package/llvm-project/libclc/libclc.hash            |  2 +-
 package/llvm-project/libclc/libclc.mk              |  2 +-
 package/llvm-project/lld/Config.in.host            |  6 ++--
 package/llvm-project/lld/lld.hash                  |  2 +-
 package/llvm-project/lld/lld.mk                    |  8 +----
 package/llvm-project/llvm-cmake/llvm-cmake.mk      |  2 +-
 .../llvm-project/llvm-libunwind/llvm-libunwind.mk  |  2 +-
 package/llvm-project/llvm-project.mk               |  4 +--
 .../llvm/0001-nfc-Fix-missing-include.patch        | 24 ---------------
 package/llvm-project/llvm/Config.in                | 10 +++----
 package/llvm-project/llvm/llvm.hash                |  2 +-
 package/llvm-project/llvm/llvm.mk                  | 22 +++++++-------
 ...2-Add-missing-cstdint-header-to-Signals.h.patch | 34 ----------------------
 package/mesa3d/Config.in                           | 10 ++++---
 package/qt5/qt5tools/Config.in                     |  2 +-
 .../spirv-llvm-translator.hash                     |  2 +-
 .../spirv-llvm-translator/spirv-llvm-translator.mk |  4 +--
 25 files changed, 55 insertions(+), 121 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 612d54cab3..dbcd916e2d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -881,7 +881,6 @@ package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch Upstre
 package/lldpd/S60lldpd Indent Shellcheck Variables
 package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch Upstream
 package/llvm-project/libclc/0001-support-out-of-tree-build.patch Upstream
-package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch Upstream
 package/lm-sensors/0001-static-build.patch Upstream
 package/lm-sensors/0002-no-host-ldconfig.patch Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch Upstream
diff --git a/package/llvm-project/clang/Config.in b/package/llvm-project/clang/Config.in
index e4d455781e..2e23888720 100644
--- a/package/llvm-project/clang/Config.in
+++ b/package/llvm-project/clang/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_CLANG
 	bool "clang"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
-	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on BR2_HOST_GCC_AT_LEAST_7
 	select BR2_PACKAGE_LLVM
 	help
 	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
@@ -15,12 +15,12 @@ config BR2_PACKAGE_CLANG
 
 	  http://clang.llvm.org
 
-comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library, host gcc >= 5"
+comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_5
+		|| !BR2_HOST_GCC_AT_LEAST_7
 
 comment "clang needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 0136b80664..52c755cfb3 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  0a8288f065d1f57cb6d96da4d2965cbea32edc572aa972e466e954d17148558b  clang-11.1.0.src.tar.xz
+sha256  96036052694e703d159c995bda203b59d1ff185c6879189b9eba837726e1738c  clang-15.0.3.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 0943e21a8c..0bafd6461b 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -17,13 +17,6 @@ CLANG_INSTALL_STAGING = YES
 HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
 CLANG_DEPENDENCIES = llvm host-clang
 
-# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
-# toolchain using gcc < 5.1 gives an error but actually still works. Setting
-# this option makes it still build with gcc >= 4.8.
-# https://reviews.llvm.org/D57264
-HOST_CLANG_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
-CLANG_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
-
 # This option is needed, otherwise multiple shared libs
 # (libclangAST.so, libclangBasic.so, libclangFrontend.so, etc.) will
 # be generated. As a final shared lib containing all these components
@@ -62,6 +55,7 @@ CLANG_CONF_OPTS += \
 HOST_CLANG_CONF_OPTS += -DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
 	-DCLANG_DEFAULT_LINKER=$(TARGET_LD)
 CLANG_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm \
+	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm \
 	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/bin/clang-tblgen \
 	-DLLVM_TABLEGEN_EXE:FILEPATH=$(HOST_DIR)/bin/llvm-tblgen
 
diff --git a/package/llvm-project/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
index 02169b66c0..e8f2ac4201 100644
--- a/package/llvm-project/compiler-rt/Config.in
+++ b/package/llvm-project/compiler-rt/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_COMPILER_RT
 	bool "compiler-rt"
 	depends on BR2_PACKAGE_LLVM
 	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-clang
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang
 	help
 	  A collection of runtime libraries primarily used by clang and
 	  llvm to provide builtins, sanitizer runtimes, and profiling
@@ -10,6 +10,6 @@ config BR2_PACKAGE_COMPILER_RT
 
 	  https://compiler-rt.llvm.org/
 
-comment "compiler-rt requires llvm to be enabled, a glibc toolchain, host gcc >= 5"
+comment "compiler-rt requires llvm to be enabled, a glibc toolchain, host gcc >= 7"
 	depends on !BR2_PACKAGE_LLVM
-	depends on !BR2_TOOLCHAIN_USES_GLIBC ||	!BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_TOOLCHAIN_USES_GLIBC ||	!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 8ee010ac5a..fe4e98164b 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  def1fc00c764cd3abbba925c712ac38860a756a43b696b291f46fee09e453274  compiler-rt-11.1.0.src.tar.xz
+sha256  db958eee92d1571d8b7f76c1be8513817f1a888dcf6ced88aca871acfb0eeddd  compiler-rt-15.0.3.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 84add60801..026650c7c8 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -17,7 +17,8 @@ COMPILER_RT_INSTALL_TARGET = NO
 COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
 	-DCOMPILER_RT_STANDALONE_BUILD=ON \
 	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
-	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config
+	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
+	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 
 # The installation of the target runtime libraries defaults to DESTDIR, however
 # host-clang resources directory needs a link so Clang can find the runtime
diff --git a/package/llvm-project/libclc/Config.in b/package/llvm-project/libclc/Config.in
index 938933fdd3..85eb888578 100644
--- a/package/llvm-project/libclc/Config.in
+++ b/package/llvm-project/libclc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBCLC
 	bool "libclc"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	help
 	  libclc is an open source, BSD licensed implementation of
 	  the library requirements of the OpenCL C programming language,
@@ -9,6 +9,6 @@ config BR2_PACKAGE_LIBCLC
 
 	  http://libclc.llvm.org/
 
-comment "libclc needs host gcc >= 5"
+comment "libclc needs host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on !BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index c496291d81..7140884f6c 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8f0213e52e2fcaca3dfcc438f05d0e15e9b3c96fd6b0994a802b267dc1047a1d  libclc-13.0.1.src.tar.xz
+sha256  07e8a2b31e07a8cc8a976a6bfd87797d2543d5a9530f449755bf5119acbdbe8e  libclc-15.0.3.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
index 406adfdb53..9f303d6d2f 100644
--- a/package/llvm-project/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCLC_VERSION = 13.0.1
+LIBCLC_VERSION = $(LLVM_PROJECT_VERSION)
 LIBCLC_SITE = $(LLVM_PROJECT_SITE)
 LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
diff --git a/package/llvm-project/lld/Config.in.host b/package/llvm-project/lld/Config.in.host
index d015fdd520..3bed364a79 100644
--- a/package/llvm-project/lld/Config.in.host
+++ b/package/llvm-project/lld/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_LLD
 	bool "host lld"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	help
 	  LLD is a linker from the LLVM project that is a drop-in
 	  replacement for system linkers, and runs much faster than
@@ -10,6 +10,6 @@ config BR2_PACKAGE_HOST_LLD
 
 	  https://lld.llvm.org/
 
-comment "host lld needs host gcc >= 5"
+comment "host lld needs host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on !BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 6d56ffcaab..2d2598dbeb 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  017a788cbe1ecc4a949abf10755870519086d058a2e99f438829aef24f0c66ce  lld-11.1.0.src.tar.xz
+sha256  cd5d0894a74b957ce78d62212c1df0b3876a7297593aaece6b0512285e3b8732  lld-15.0.3.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index 46ec3b13ff..539dd0bd71 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -10,13 +10,7 @@ LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
 LLD_SUPPORTS_IN_SOURCE_BUILD = NO
-HOST_LLD_DEPENDENCIES = host-llvm
-
-# LLVM > 9.0 will soon require C++14 support, building llvm <= 9.0 using a
-# toolchain using gcc < 5.1 gives an error but actually still works. Setting
-# this option makes it still build with gcc >= 4.8.
-# https://reviews.llvm.org/D57264
-HOST_LLD_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+HOST_LLD_DEPENDENCIES = host-llvm host-llvm-libunwind
 
 # build as static libs as is done in llvm & clang
 HOST_LLD_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
index b305797891..33b6ba8339 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.mk
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_CMAKE_VERSION = 15.0.3
+LLVM_CMAKE_VERSION = $(LLVM_PROJECT_VERSION)
 LLVM_CMAKE_SITE = $(LLVM_PROJECT_SITE)
 LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
 LLVM_CMAKE_LICENSE = Apache-2.0 with exceptions
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
index 825e1beac0..be9965a49a 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_LIBUNWIND_VERSION = 15.0.3
+LLVM_LIBUNWIND_VERSION = $(LLVM_PROJECT_VERSION)
 LLVM_LIBUNWIND_SITE = $(LLVM_PROJECT_SITE)
 LLVM_LIBUNWIND_SOURCE = libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz
 LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 747a6f5647..5859ff7cfc 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 11
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_VERSION_MAJOR = 15
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.3
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
deleted file mode 100644
index 62111ca138..0000000000
--- a/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From b498303066a63a203d24f739b2d2e0e56dca70d1 Mon Sep 17 00:00:00 2001
-From: serge-sans-paille <sguelton@redhat.com>
-Date: Tue, 10 Nov 2020 14:55:25 +0100
-Subject: [PATCH] [nfc] Fix missing include
-
-[Retrieved (and backported) from:
-https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- llvm/utils/benchmark/src/benchmark_register.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/benchmark/src/benchmark_register.h b/utils/benchmark/src/benchmark_register.h
-index 0705e219f2fa2..4caa5ad4da079 100644
---- a/utils/benchmark/src/benchmark_register.h
-+++ b/utils/benchmark/src/benchmark_register.h
-@@ -1,6 +1,7 @@
- #ifndef BENCHMARK_REGISTER_H
- #define BENCHMARK_REGISTER_H
- 
-+#include <limits>
- #include <vector>
- 
- #include "check.h"
diff --git a/package/llvm-project/llvm/Config.in b/package/llvm-project/llvm/Config.in
index d9d30a5ba5..ebb0fca66a 100644
--- a/package/llvm-project/llvm/Config.in
+++ b/package/llvm-project/llvm/Config.in
@@ -17,13 +17,13 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
 config BR2_PACKAGE_LLVM
 	bool "llvm"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	help
 	  The LLVM Project is a collection of modular and reusable
 	  compiler and toolchain technologies.
@@ -59,12 +59,12 @@ config BR2_PACKAGE_LLVM_BPF
 
 endif
 
-comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library, host gcc >= 5"
+comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_5
+		|| !BR2_HOST_GCC_AT_LEAST_7
 
 comment "llvm needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index e7f79492de..df9aa88411 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5  llvm-11.1.0.src.tar.xz
+sha256  c39aec729662416dcbf0bfe53a9786b34e7d93d02908a0779a2f6d83ad0a4a27  llvm-15.0.3.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 1adad17b16..556a2f8c35 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -13,16 +13,16 @@ LLVM_CPE_ID_VENDOR = llvm
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
 LLVM_INSTALL_STAGING = YES
 
-# LLVM >= 9.0 can use python3 to build.
-HOST_LLVM_DEPENDENCIES = host-python3
+HOST_LLVM_DEPENDENCIES = host-python3 host-llvm-cmake
 LLVM_DEPENDENCIES = host-llvm
 
-# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
-# toolchain using gcc < 5.1 gives an error but actually still works. Setting
-# this option makes it still build with gcc >= 4.8.
-# https://reviews.llvm.org/D57264
-HOST_LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
-LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+# Path to cmake modules from host-llvm-cmake
+HOST_LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
+LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
+
+# Assembly files for x64 in lib/Support/BLAKE3 need to be compiled
+# by a C compiler
+HOST_LLVM_CONF_OPTS += -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)"
 
 # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
 # This flag assumes that projects are checked out side-by-side and not nested
@@ -259,7 +259,8 @@ HOST_LLVM_CONF_OPTS += \
 	-DLLVM_INCLUDE_EXAMPLES=OFF \
 	-DLLVM_INCLUDE_DOCS=OFF \
 	-DLLVM_INCLUDE_GO_TESTS=OFF \
-	-DLLVM_INCLUDE_TESTS=OFF
+	-DLLVM_INCLUDE_TESTS=OFF \
+	-DLLVM_INCLUDE_BENCHMARKS=OFF
 LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_EXAMPLES=OFF \
 	-DLLVM_BUILD_DOCS=OFF \
@@ -270,7 +271,8 @@ LLVM_CONF_OPTS += \
 	-DLLVM_INCLUDE_EXAMPLES=OFF \
 	-DLLVM_INCLUDE_DOCS=OFF \
 	-DLLVM_INCLUDE_GO_TESTS=OFF \
-	-DLLVM_INCLUDE_TESTS=OFF
+	-DLLVM_INCLUDE_TESTS=OFF \
+	-DLLVM_INCLUDE_BENCHMARKS=OFF
 
 # Copy llvm-config (host variant) to STAGING_DIR
 # llvm-config (host variant) returns include and lib directories
diff --git a/package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch b/package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
deleted file mode 100644
index c798f585d6..0000000000
--- a/package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c6c71ab47d658ab8f84e6a6066d476fd9632bbca Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Mon, 23 May 2022 08:03:23 +0100
-Subject: [PATCH] Add missing <cstdint> header to Signals.h
-
-Without the change llvm build fails on this week's gcc-13 snapshot as:
-
-    [  0%] Building CXX object lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
-    In file included from llvm/lib/Support/Signals.cpp:14:
-    llvm/include/llvm/Support/Signals.h:119:8: error: variable or field 'CleanupOnSignal' declared void
-      119 |   void CleanupOnSignal(uintptr_t Context);
-          |        ^~~~~~~~~~~~~~~
-
-Upstream: https://github.com/llvm/llvm-project/commit/ff1681ddb303223973653f7f5f3f3435b48a1983.patch
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- include/llvm/Support/Signals.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/llvm/Support/Signals.h b/include/llvm/Support/Signals.h
-index e0a18e72..148216b8 100644
---- a/include/llvm/Support/Signals.h
-+++ b/include/llvm/Support/Signals.h
-@@ -14,6 +14,7 @@
- #ifndef LLVM_SUPPORT_SIGNALS_H
- #define LLVM_SUPPORT_SIGNALS_H
- 
-+#include <cstdint>
- #include <string>
- 
- namespace llvm {
--- 
-2.40.1
-
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dfd0dc105d..c7ee2a8db0 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -24,19 +24,21 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ wchar, threads, C++, dynamic library, host gcc >= 5"
+comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_5
+		|| !BR2_HOST_GCC_AT_LEAST_7
 
 comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 46585e1e04..aa8a1b1629 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # llvm, clang
 	depends on !BR2_STATIC_LIBS # llvm, clang
 	depends on BR2_USE_WCHAR # llvm, clang
-	depends on BR2_HOST_GCC_AT_LEAST_5 # llvm, clang
+	depends on BR2_HOST_GCC_AT_LEAST_7 # llvm, clang
 	help
 	  This option enables the qdoc host tool.
 
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index edfca1ea02..4500fc4f62 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  bdd7cb677b9fcaaff1cce2153de9d69298f136edecaef3631915614bb5db09a1  spirv-llvm-translator-v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2.tar.gz
+sha256  0a00a72a5b004eeb73f9c96c9c6ba2d6de232cbf3c22a7b322047604d24402ba  spirv-llvm-translator-v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c6e63.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 159f7d3b52..37db47340e 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Generate version string using:
-#   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
-SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2
+#   git describe --tags --match 'v15*' --abbrev=40 origin/llvm_release_150
+SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c6e63
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT

--===============7119135583169142794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7119135583169142794==--
