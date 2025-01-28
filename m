Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF316C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478DF7069F;
	Fri, 28 Feb 2025 17:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdMg3ZbYncl0; Fri, 28 Feb 2025 17:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2582E606F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2582E606F0;
	Fri, 28 Feb 2025 17:07:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 190B7711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67EE942675
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rj6Wintq8D9q for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0E7B4250C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0E7B4250C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E792687635; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 23:14:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6b615fda369d7431138c71fbee051869ac745e1
X-Git-Newrev: fd29fee3a3ac0ce45404ed256d2059836c352728
X-Patchwork-Hint: ignore
Message-Id: <20250228163022.E792687635@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tensorflow-lite: new
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd29fee3a3ac0ce45404ed256d2059836c352728
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package adds the tensorflow lite runtime to buildroot.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add home page url in Config.in]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-lite-Update-CMakeLists.txt.patch          | 48 ++++++++++++++
 ...002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch | 73 ++++++++++++++++++++++
 .../0003-Fix-FindFlatBuffers-cmake-file.patch      | 50 +++++++++++++++
 ...n-t-link-tensorflow-lite-against-gemmlowp.patch | 31 +++++++++
 ...stdint.h-for-int-types-in-internal-Spectr.patch | 26 ++++++++
 package/tensorflow-lite/Config.in                  | 38 +++++++++++
 package/tensorflow-lite/tensorflow-lite.hash       |  4 ++
 package/tensorflow-lite/tensorflow-lite.mk         | 59 +++++++++++++++++
 10 files changed, 331 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 926a4c0a37..31815b1272 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3041,6 +3041,7 @@ F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/tensorflow-lite/
 F:	package/xnnpack/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index e8e07d37c6..e9c789cff2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2312,6 +2312,7 @@ endif
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
+	source "package/tensorflow-lite/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tl-expected/Config.in"
 	source "package/tllist/Config.in"
diff --git a/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
new file mode 100644
index 0000000000..b849bc5055
--- /dev/null
+++ b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
@@ -0,0 +1,48 @@
+From 081c2e4e3cf021efb2853a485a18b563e88f6117 Mon Sep 17 00:00:00 2001
+From: Terry Heo <terryheo@google.com>
+Date: Tue, 1 Nov 2022 15:55:30 -0700
+Subject: [PATCH] lite: Update CMakeLists.txt
+
+This changes are needed to build kernel tests.
+
+PiperOrigin-RevId: 485439972
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/tensorflow/tensorflow/commit/081c2e4e3cf021efb2853a485a18b563e88f6117
+---
+ tensorflow/lite/CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index 9dfbb4b72f3..fd8b3faf1e2 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -209,6 +209,9 @@ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tflite_with_xnnpack\\.cc$")
+ # Exclude Flex related files.
+ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*with_selected_ops\\.cc$")
+ 
++# Exclude tensorflow_profiler_logger files.
++list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tensorflow_profiler_logger\\.cc$")
++
+ if(_TFLITE_ENABLE_MMAP)
+   list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation_disabled\\.cc$")
+ else()
+@@ -222,6 +225,7 @@ if(NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")
+ endif()
+ populate_tflite_source_vars("core" TFLITE_CORE_SRCS)
+ populate_tflite_source_vars("core/api" TFLITE_CORE_API_SRCS)
++populate_tflite_source_vars("core/c" TFLITE_CORE_C_SRCS)
+ populate_tflite_source_vars("c" TFLITE_C_SRCS)
+ populate_tflite_source_vars("delegates" TFLITE_DELEGATES_SRCS)
+ if(TFLITE_ENABLE_GPU)
+@@ -483,6 +487,7 @@ endif()
+ # TFLite library
+ set(_ALL_TFLITE_SRCS
+   ${TFLITE_CORE_API_SRCS}
++  ${TFLITE_CORE_C_SRCS}
+   ${TFLITE_CORE_SRCS}
+   ${TFLITE_C_SRCS}
+   ${TFLITE_DELEGATES_FLEX_SRCS}
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch b/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch
new file mode 100644
index 0000000000..538af1de9d
--- /dev/null
+++ b/package/tensorflow-lite/0002-Add-SYSTEM_FARMHASH-cmake-config-flag.patch
@@ -0,0 +1,73 @@
+From d8451a9048d09692994c40a6f9bc928e70ed79b5 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 28 Nov 2022 21:36:34 -0700
+Subject: [PATCH] Add SYSTEM_FARMHASH cmake config flag
+
+Since farmhash does not install a cmake package we need to
+search for the library and headers to use the provided
+version.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/tensorflow/tensorflow/commit/d8451a9048d09692994c40a6f9bc928e70ed79b5
+---
+ tensorflow/lite/g3doc/guide/build_cmake.md    |  1 +
+ .../tools/cmake/modules/Findfarmhash.cmake    | 30 +++++++++++++++----
+ 2 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/tensorflow/lite/g3doc/guide/build_cmake.md b/tensorflow/lite/g3doc/guide/build_cmake.md
+index 6950a365bb8..6de955e70b0 100644
+--- a/tensorflow/lite/g3doc/guide/build_cmake.md
++++ b/tensorflow/lite/g3doc/guide/build_cmake.md
+@@ -81,6 +81,7 @@ variables to point to your library installations.
+ ```sh
+ cmake ../tensorflow_src/tensorflow/lite -DTFLITE_ENABLE_INSTALL=ON \
+   -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
++  -DSYSTEM_FARMHASH=ON \
+   -Dabsl_DIR=<install path>/lib/cmake/absl \
+   -DEigen3_DIR=<install path>/share/eigen3/cmake \
+   -DFlatbuffers_DIR=<install path>/lib/cmake/flatbuffers \
+diff --git a/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake b/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake
+index 1b0dc28f624..97b43298f13 100644
+--- a/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake
++++ b/tensorflow/lite/tools/cmake/modules/Findfarmhash.cmake
+@@ -13,12 +13,32 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
+ 
+-# tensorflow-lite uses find_package for this package, so override the system
+-# installation and build from source instead.
+-include(farmhash)
+-if(farmhash_POPULATED)
++# tensorflow-lite uses find_package for this package, so build from
++# source if the system version is not enabled.
++
++if(SYSTEM_FARMHASH)
++  include(FindPackageHandleStandardArgs)
++  find_path(FARMHASH_ROOT_DIR NAMES include/farmhash.h)
++  find_library(FARMHASH_LIB NAMES farmhash PATHS ${FARMHASH_ROOT_DIR}/lib ${FARMHASH_LIB_PATH})
++  find_path(FARMHASH_INCLUDE_DIRS NAMES farmhash.h PATHS ${FARMHASH_ROOT_DIR}/include)
++  find_package_handle_standard_args(farmhash DEFAULT_MSG FARMHASH_LIB FARMHASH_INCLUDE_DIRS)
++endif()
++
++if(farmhash_FOUND)
++  add_library(farmhash SHARED IMPORTED GLOBAL)
++  set_target_properties(farmhash PROPERTIES
++    IMPORTED_LOCATION ${FARMHASH_LIB}
++    INTERFACE_INCLUDE_DIRECTORIES ${FARMHASH_INCLUDE_DIRS}
++  )
++else()
++  include(farmhash)
++  if(farmhash_POPULATED)
++    get_target_property(FARMHASH_INCLUDE_DIRS farmhash INTERFACE_DIRECTORIES)
++  endif()
++endif()
++
++if(farmhash_FOUND OR farmhash_POPULATED)
+   set(FARMHASH_FOUND TRUE)
+-  get_target_property(FARMHASH_INCLUDE_DIRS farmhash INTERFACE_DIRECTORIES)
+   add_library(farmhash::farmhash ALIAS farmhash)
+   set(FARMHASH_LIBRARIES farmhash::farmhash)
+ endif()
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch b/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch
new file mode 100644
index 0000000000..83e8ae6423
--- /dev/null
+++ b/package/tensorflow-lite/0003-Fix-FindFlatBuffers-cmake-file.patch
@@ -0,0 +1,50 @@
+From d8f98dd9f2b437cca5954b38cb48d9c21733f67d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 24 Nov 2022 14:29:06 -0700
+Subject: [PATCH] Fix FindFlatBuffers cmake file
+
+Capitalization needs to match for system cmake override to work:
+https://github.com/google/flatbuffers/blob/v22.11.23/CMake/FindFlatBuffers.cmake
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/tensorflow/tensorflow/commit/d8f98dd9f2b437cca5954b38cb48d9c21733f67d
+---
+ tensorflow/lite/CMakeLists.txt                                  | 2 +-
+ tensorflow/lite/g3doc/guide/build_cmake.md                      | 2 +-
+ .../modules/{FindFlatbuffers.cmake => FindFlatBuffers.cmake}    | 0
+ 3 files changed, 2 insertions(+), 2 deletions(-)
+ rename tensorflow/lite/tools/cmake/modules/{FindFlatbuffers.cmake => FindFlatBuffers.cmake} (100%)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index f9c30d6a046..c2ee9edfb61 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -143,7 +143,7 @@ find_package(absl REQUIRED)
+ find_package(Eigen3 REQUIRED)
+ find_package(farmhash REQUIRED)
+ find_package(fft2d REQUIRED)
+-find_package(Flatbuffers REQUIRED)
++find_package(FlatBuffers REQUIRED)
+ find_package(gemmlowp REQUIRED)
+ find_package(NEON_2_SSE REQUIRED)
+ find_package(cpuinfo REQUIRED)  #CPUINFO is used by XNNPACK and RUY library
+diff --git a/tensorflow/lite/g3doc/guide/build_cmake.md b/tensorflow/lite/g3doc/guide/build_cmake.md
+index 6950a365bb8..9cb7ebac326 100644
+--- a/tensorflow/lite/g3doc/guide/build_cmake.md
++++ b/tensorflow/lite/g3doc/guide/build_cmake.md
+@@ -84,7 +84,7 @@ cmake ../tensorflow_src/tensorflow/lite -DTFLITE_ENABLE_INSTALL=ON \
+   -DSYSTEM_FARMHASH=ON \
+   -Dabsl_DIR=<install path>/lib/cmake/absl \
+   -DEigen3_DIR=<install path>/share/eigen3/cmake \
+-  -DFlatbuffers_DIR=<install path>/lib/cmake/flatbuffers \
++  -DFlatBuffers_DIR=<install path>/lib/cmake/flatbuffers \
+   -DNEON_2_SSE_DIR=<install path>/lib/cmake/NEON_2_SSE \
+   -Dcpuinfo_DIR=<install path>/share/cpuinfo \
+   -Druy_DIR=<install path>/lib/cmake/ruy
+diff --git a/tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake b/tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+similarity index 100%
+rename from tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake
+rename to tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemmlowp.patch b/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemmlowp.patch
new file mode 100644
index 0000000000..eadc483778
--- /dev/null
+++ b/package/tensorflow-lite/0004-Don-t-link-tensorflow-lite-against-gemmlowp.patch
@@ -0,0 +1,31 @@
+From fb584589f707853d85a081c99b1b82598c2631c1 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 24 Nov 2022 15:10:27 -0700
+Subject: [PATCH] Don't link tensorflow-lite against gemmlowp
+
+We can't link against gemmlowp as it is a header only library.
+
+Fixes:
+/bin/ld: cannot find -lgemmlowp: No such file or directory
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/tensorflow/tensorflow/commit/fb584589f707853d85a081c99b1b82598c2631c1
+---
+ tensorflow/lite/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index f9c30d6a046..3fe5ed15605 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -534,7 +534,6 @@ target_link_libraries(tensorflow-lite
+     farmhash
+     fft2d_fftsg2d
+     flatbuffers::flatbuffers
+-    gemmlowp
+     ruy::ruy
+     ${CMAKE_DL_LIBS}
+     ${TFLITE_TARGET_DEPENDENCIES}
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0005-tflite-add-stdint.h-for-int-types-in-internal-Spectr.patch b/package/tensorflow-lite/0005-tflite-add-stdint.h-for-int-types-in-internal-Spectr.patch
new file mode 100644
index 0000000000..e4eac41bb3
--- /dev/null
+++ b/package/tensorflow-lite/0005-tflite-add-stdint.h-for-int-types-in-internal-Spectr.patch
@@ -0,0 +1,26 @@
+From 9dbee4329ffd0474b939927f6d337959fb72318a Mon Sep 17 00:00:00 2001
+From: Stephan Hartmann <stha09@googlemail.com>
+Date: Fri, 31 Mar 2023 16:01:44 +0000
+Subject: [PATCH] tflite: add stdint.h for int types in internal::Spectrogram
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/tensorflow/tensorflow/commit/9dbee4329ffd0474b939927f6d337959fb72318a
+---
+ tensorflow/lite/kernels/internal/spectrogram.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tensorflow/lite/kernels/internal/spectrogram.cc b/tensorflow/lite/kernels/internal/spectrogram.cc
+index a832962a38d..919eebeb3e7 100644
+--- a/tensorflow/lite/kernels/internal/spectrogram.cc
++++ b/tensorflow/lite/kernels/internal/spectrogram.cc
+@@ -17,6 +17,7 @@ limitations under the License.
+ 
+ #include <assert.h>
+ #include <math.h>
++#include <stdint.h>
+ 
+ #include "third_party/fft2d/fft.h"
+ 
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
new file mode 100644
index 0000000000..99d219622d
--- /dev/null
+++ b/package/tensorflow-lite/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+
+config BR2_PACKAGE_TENSORFLOW_LITE
+	bool "tensorflow-lite"
+	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_SHARED_LIBS
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_FARMHASH
+	select BR2_PACKAGE_FFT2D
+	select BR2_PACKAGE_FLATBUFFERS
+	select BR2_PACKAGE_GEMMLOWP
+	select BR2_PACKAGE_LIBABSEIL_CPP
+	select BR2_PACKAGE_NEON_2_SSE
+	select BR2_PACKAGE_RUY if BR2_PACKAGE_RUY_ARCH_SUPPORTS
+	select BR2_PACKAGE_XNNPACK if BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	help
+	  Tensorflow Lite dynamic library and headers: Inference engine
+	  to run previously trained machine learning models.
+
+	  https://www.tensorflow.org/
+
+comment "tensorflow-lite needs a toolchain w/ gcc >= 8, C++, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
+			!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "tensorflow-lite needs a toolchain w/ shared libraries"
+	depends on !BR2_SHARED_LIBS
diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/tensorflow-lite/tensorflow-lite.hash
new file mode 100644
index 0000000000..7d9035707b
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc92dac48  tensorflow-lite-2.11.0.tar.gz
+# License files, locally calculated
+sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1aec65  LICENSE
diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorflow-lite/tensorflow-lite.mk
new file mode 100644
index 0000000000..433eff3242
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# tensorflow-lite
+#
+################################################################################
+
+TENSORFLOW_LITE_VERSION = 2.11.0
+TENSORFLOW_LITE_SITE =  $(call github,tensorflow,tensorflow,v$(TENSORFLOW_LITE_VERSION))
+TENSORFLOW_LITE_INSTALL_STAGING = YES
+TENSORFLOW_LITE_LICENSE = Apache-2.0
+TENSORFLOW_LITE_LICENSE_FILES = LICENSE
+TENSORFLOW_LITE_SUBDIR = tensorflow/lite
+TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD = NO
+TENSORFLOW_LITE_DEPENDENCIES += \
+	host-pkgconf \
+	host-flatbuffers \
+	cpuinfo \
+	eigen \
+	farmhash \
+	fft2d \
+	flatbuffers \
+	gemmlowp \
+	libabseil-cpp \
+	neon-2-sse
+
+TENSORFLOW_LITE_CONF_OPTS = \
+	-Dabsl_DIR=$(STAGING_DIR)/usr/lib/cmake/absl \
+	-DBUILD_SHARED_LIBS=ON \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/gemmlowp" \
+	-DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+	-DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DFETCHCONTENT_QUIET=OFF \
+	-DFFT2D_SOURCE_DIR=$(STAGING_DIR)/usr/include/fft2d \
+	-DFlatBuffers_DIR=$(STAGING_DIR)/usr/lib/cmake/flatbuffers \
+	-DNEON_2_SSE_DIR=$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \
+	-DSYSTEM_FARMHASH=ON \
+	-DTFLITE_ENABLE_EXTERNAL_DELEGATE=ON \
+	-DTFLITE_ENABLE_GPU=OFF \
+	-DTFLITE_ENABLE_INSTALL=ON \
+	-DTFLITE_ENABLE_MMAP=ON \
+	-DTFLITE_ENABLE_NNAPI=OFF
+
+ifeq ($(BR2_PACKAGE_RUY),y)
+TENSORFLOW_LITE_DEPENDENCIES += ruy
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_RUY=ON
+else
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_RUY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XNNPACK),y)
+TENSORFLOW_LITE_DEPENDENCIES += xnnpack
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_XNNPACK=ON -Dxnnpack_POPULATED=ON
+else
+TENSORFLOW_LITE_CONF_OPTS += -DTFLITE_ENABLE_XNNPACK=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
