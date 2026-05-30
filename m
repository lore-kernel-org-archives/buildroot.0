Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4957CD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B4C42EDB;
	Sat, 30 May 2026 13:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RalavjgXp7rO; Sat, 30 May 2026 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1143A42ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149184;
	bh=xXXt075Jub848DhtKttqYim3hWkPNNS6zcjJK0ctPKc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OEXMX+NthbHrwmtNWTwG3wsN5It7sst3f1PiXqNDm75w/FJlpsGAKWfVRMY29EiTm
	 uOBXEN2kV9+QMS4UwzUbnpSs9kpZWWKwVyfI2aP4D5Qns1ImC1jvll3UYUQ9+gLGSp
	 l866oL8leYVdfQNioBrzc0hcl7ZtZrtYvttU+AjDLYAexEDGBIO8A47+NPU4Tn8CYG
	 qQ4OaRpiByWEaA7svSCJSdFOebnsjEPil6BMu/4mwU9zWCGV4ag1ZXX3WGxnb9KOsJ
	 DAZUrLjpBC2kxcQ3CUayVRiOlX45zI/f5S0L0qyrfp+/9ewA7dAS2GGhwkLSlRhrDu
	 78sKkAF5SJxTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1143A42ED3;
	Sat, 30 May 2026 13:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05D3312F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6552D42DC7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6A73uuQtLST for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D56D42E97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D56D42E97
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80A868750A; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d0e7bea04d7c38a0be8c321e79ab4517ebc06213
X-Git-Newrev: 6106c2c21cc5b9157141c5fe0abeddf54c934e9d
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.80A868750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openjdk{-bin}: add
 OpenJDK25 and configure it as latest
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6106c2c21cc5b9157141c5fe0abeddf54c934e9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

OpenJDK 25 is the latest release.
See: https://endoflife.date/oracle-jdk

- BR2_OPENJDK_VERSION_LATEST is now set to 25.

- Add version-specific patches for 25.0.2+10:
  - 0001: Add ARCv2 ISA processors support to Zero
  - 0002: Compile OpenJDK in headless mode without requirements
  - 0003: Fix ambiguous cmp() overload in aarch64 macro assembler
          (older GCC 6.x compatibility)
  - 0004: Fix constexpr on non-literal type in Shenandoah GC
          (older GCC 6.x compatibility)

- Add -fpermissive to fix template definition error with older GCC.

- Update HOST_OPENJDK_BIN_VERSION for OpenJDK 25.

- Update the expectedVersion variable in JniTest.java from 0x00150000
  (JNI 21) to 0x00180000 (JNI 24/25).

Tested with:
$ ./support/testing/run-tests -o ~/br-test-py/ -d ~/br-test-dl/ \
    tests.package.test_openjdk.TestOpenJdk

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
[Bernd:
 - rebased on bump of versions 17 & 21
 - build-tested with gcc 16-snapshot]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add .checkpackageignore entry to fix check-package error
 - reformat patches with without numbering to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |   1 +
 package/openjdk-bin/25.0.2_10/openjdk-bin.hash     |   7 +
 package/openjdk-bin/openjdk-bin.mk                 |   6 +-
 ...-Add-ARCv2-ISA-processors-support-to-Zero.patch | 109 ++++++++++++++++
 ...pile-OpenJDK-in-headless-mode-without-req.patch | 144 +++++++++++++++++++++
 ...c-hotspot-aarch64-macro-assembler-fix-cmp.patch |  43 ++++++
 ...hotspot-share-gc-shenandoah-fix-constexpr.patch |  42 ++++++
 package/openjdk/Config.in                          |   7 +-
 package/openjdk/openjdk.hash                       |   1 +
 package/openjdk/openjdk.mk                         |  10 +-
 .../openjdk/package/openjdk-jni-test/JniTest.java  |   2 +-
 11 files changed, 364 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1e11ea4773..db2c321858 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -701,6 +701,7 @@ package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
 package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
 package/openldap/0002-disable-docs.patch lib_patch.Upstream
 package/openntpd/S49ntp Shellcheck lib_sysv.Variables
diff --git a/package/openjdk-bin/25.0.2_10/openjdk-bin.hash b/package/openjdk-bin/25.0.2_10/openjdk-bin.hash
new file mode 100644
index 0000000000..42892b1e6c
--- /dev/null
+++ b/package/openjdk-bin/25.0.2_10/openjdk-bin.hash
@@ -0,0 +1,7 @@
+# From https://github.com/adoptium/temurin25-binaries/releases
+sha256  987387933b64b9833846dee373b640440d3e1fd48a04804ec01a6dbf718e8ab8  OpenJDK25U-jdk_x64_linux_hotspot_25.0.2_10.tar.gz
+sha256  a9d73e711d967dc44896d4f430f73a68fd33590dabc29a7f2fb9f593425b854c  OpenJDK25U-jdk_aarch64_linux_hotspot_25.0.2_10.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 819bf9052b..5f1922dea5 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
+ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_25),y)
+HOST_OPENJDK_BIN_VERSION_MAJOR = 25
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.2
+HOST_OPENJDK_BIN_VERSION_BUILD = 10
+else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.10
 HOST_OPENJDK_BIN_VERSION_BUILD = 7
diff --git a/package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
new file mode 100644
index 0000000000..5cbc30ddd6
--- /dev/null
+++ b/package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -0,0 +1,109 @@
+From 86aee60f0457bd9716c4221da53bcd9d893359b3 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 18 Oct 2021 05:20:05 -0700
+Subject: [PATCH] Add ARCv2 ISA processors support to Zero
+
+This adds ARCv2 processors support in OpenJDK via
+"Zero Assembly Project" (see https://openjdk.java.net/projects/zero).
+
+That' a purely interpretive mode, so likely not that fast
+as JIT'ed version, but for starters it's much better than nothing.
+
+Once all the logistical problems are solved hopefully this
+change will be accepted upstream.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ make/autoconf/libraries.m4        | 8 ++++++++
+ make/autoconf/platform.m4         | 8 ++++++++
+ src/hotspot/os/linux/os_linux.cpp | 8 +++++++-
+ 3 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
+index 8dc3d55ed0c..96f377c2f99 100644
+--- a/make/autoconf/libraries.m4
++++ b/make/autoconf/libraries.m4
+@@ -141,6 +141,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lrt"
+   fi
+ 
++  # Libatomic library
++  # 32-bit ARC needs fallback library for 8-byte atomic ops
++  # Inspired by a fix for MIPS, see https://github.com/openjdk/jdk/commit/1b3aa3af
++  if test "x$OPENJDK_TARGET_OS" = xlinux &&
++      (test "x$OPENJDK_TARGET_CPU" = xarc); then
++    BASIC_JVM_LIBS="$BASIC_JVM_LIBS -latomic"
++  fi
++
+   # perfstat lib
+   if test "x$OPENJDK_TARGET_OS" = xaix; then
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lperfstat"
+diff --git a/make/autoconf/platform.m4 b/make/autoconf/platform.m4
+index 31451d0c37f..8d2b95d4399 100644
+--- a/make/autoconf/platform.m4
++++ b/make/autoconf/platform.m4
+@@ -54,6 +54,12 @@ AC_DEFUN([PLATFORM_EXTRACT_VARS_FROM_CPU],
+       VAR_CPU_BITS=64
+       VAR_CPU_ENDIAN=little
+       ;;
++    arc)
++      VAR_CPU=arc
++      VAR_CPU_ARCH=arc
++      VAR_CPU_BITS=32
++      VAR_CPU_ENDIAN=little
++      ;;
+     arm*)
+       VAR_CPU=arm
+       VAR_CPU_ARCH=arm
+@@ -571,6 +577,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+     HOTSPOT_$1_CPU_DEFINE=RISCV64
+ 
+   # The cpu defines below are for zero, we don't support them directly.
++  elif test "x$OPENJDK_$1_CPU" = xarc; then
++    HOTSPOT_$1_CPU_DEFINE=ARC
+   elif test "x$OPENJDK_$1_CPU" = xsparc; then
+     HOTSPOT_$1_CPU_DEFINE=SPARC
+   elif test "x$OPENJDK_$1_CPU" = xppc; then
+diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.cpp
+index 49125ae8954..317e779782d 100644
+--- a/src/hotspot/os/linux/os_linux.cpp
++++ b/src/hotspot/os/linux/os_linux.cpp
+@@ -1757,6 +1757,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+ #ifndef EM_AARCH64
+   #define EM_AARCH64    183               /* ARM AARCH64 */
+ #endif
++#ifndef EM_ARC_COMPACT2
++  #define EM_ARC_COMPACT2 195             /* ARC ARCv2 ISA */
++#endif
+ #ifndef EM_RISCV
+   #define EM_RISCV      243               /* RISC-V */
+ #endif
+@@ -1781,6 +1784,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+     {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
+ #endif
+     {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
++    {EM_ARC_COMPACT2, EM_ARC_COMPACT2, ELFCLASS32, ELFDATA2LSB, (char*)"ARC"},
+     // we only support 64 bit z architecture
+     {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
+     {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
+@@ -1811,6 +1815,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_PPC;
+ #elif  (defined AARCH64)
+   static  Elf32_Half running_arch_code=EM_AARCH64;
++#elif  (defined ARC)
++  static  Elf32_Half running_arch_code=EM_ARC_COMPACT2;
+ #elif  (defined ARM)
+   static  Elf32_Half running_arch_code=EM_ARM;
+ #elif  (defined S390)
+@@ -1833,7 +1839,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_LOONGARCH;
+ #else
+     #error Method os::dll_load requires that one of following is defined:\
+-        AARCH64, ALPHA, ARM, AMD64, IA32, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+ #endif
+ 
+   // Identify compatibility class for VM's architecture and library's architecture
+-- 
+2.43.0
+
diff --git a/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch b/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
new file mode 100644
index 0000000000..78ab31ff62
--- /dev/null
+++ b/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
@@ -0,0 +1,144 @@
+From 434d082d9082c1ce2d9ea46ec3c90420442567b9 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Wed, 4 Feb 2026 06:48:59 +0000
+Subject: [PATCH] 8376684: Compile OpenJDK in headless mode without required
+ X11 libraries
+
+Reviewed-by: erikj, aivanov
+
+Upstream: https://github.com/openjdk/jdk/pull/28310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ doc/building.html                                |  7 +++----
+ doc/building.md                                  |  6 ++----
+ make/autoconf/libraries.m4                       |  8 ++++----
+ make/modules/java.desktop/lib/AwtLibraries.gmk   | 16 ++++++++++++++--
+ .../unix/native/common/awt/utility/rect.h        |  4 ++--
+ 5 files changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/doc/building.html b/doc/building.html
+index da8465bc532..f8d815a5474 100644
+--- a/doc/building.html
++++ b/doc/building.html
+@@ -1380,10 +1380,9 @@ <h4 id="alsa-1">ALSA</h4>
+ can specify it by <code>--with-alsa</code>.</p></li>
+ </ul>
+ <h4 id="x11-1">X11</h4>
+-<p>You will need X11 libraries suitable for your <em>target</em> system.
+-In most cases, using Debian's pre-built libraries work fine.</p>
+-<p>Note that X11 is needed even if you only want to build a headless
+-JDK.</p>
++<p>When not building a headless JDK, you will need X11 libraries
++suitable for your <em>target</em> system. In most cases, using Debian's
++pre-built libraries work fine.</p>
+ <ul>
+ <li><p>Go to <a href="https://www.debian.org/distrib/packages">Debian
+ Package Search</a>, search for the following packages for your
+diff --git a/doc/building.md b/doc/building.md
+index 1a9fe6b2e78..92ebd3d32c7 100644
+--- a/doc/building.md
++++ b/doc/building.md
+@@ -1173,10 +1173,8 @@ #### ALSA
+ 
+ #### X11
+ 
+-You will need X11 libraries suitable for your *target* system. In most cases,
+-using Debian's pre-built libraries work fine.
+-
+-Note that X11 is needed even if you only want to build a headless JDK.
++When not building a headless JDK, you will need X11 libraries suitable for your
++*target* system. In most cases, using Debian's pre-built libraries work fine.
+ 
+ * Go to [Debian Package Search](https://www.debian.org/distrib/packages),
+   search for the following packages for your *target* system, and download them
+diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
+index 96f377c2f99..8f02b7ec8a7 100644
+--- a/make/autoconf/libraries.m4
++++ b/make/autoconf/libraries.m4
+@@ -42,12 +42,12 @@ m4_include([lib-tests.m4])
+ AC_DEFUN_ONCE([LIB_DETERMINE_DEPENDENCIES],
+ [
+   # Check if X11 is needed
+-  if test "x$OPENJDK_TARGET_OS" = xwindows || test "x$OPENJDK_TARGET_OS" = xmacosx; then
+-    # No X11 support on windows or macosx
++  if test "x$OPENJDK_TARGET_OS" = xwindows ||
++     test "x$OPENJDK_TARGET_OS" = xmacosx ||
++     test "x$ENABLE_HEADLESS_ONLY" = xtrue; then
+     NEEDS_LIB_X11=false
+   else
+-    # All other instances need X11, even if building headless only, libawt still
+-    # needs X11 headers.
++    # All other instances need X11 for libawt.
+     NEEDS_LIB_X11=true
+   fi
+ 
+diff --git a/make/modules/java.desktop/lib/AwtLibraries.gmk b/make/modules/java.desktop/lib/AwtLibraries.gmk
+index 463e09e12dc..8b6b50b9e62 100644
+--- a/make/modules/java.desktop/lib/AwtLibraries.gmk
++++ b/make/modules/java.desktop/lib/AwtLibraries.gmk
+@@ -88,6 +88,10 @@ LIBAWT_EXTRA_HEADER_DIRS := \
+ 
+ LIBAWT_CFLAGS := -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES -DMLIB_NO_LIBSUNMATH
+ 
++ifeq ($(ENABLE_HEADLESS_ONLY), true)
++  LIBAWT_CFLAGS += -DHEADLESS
++endif
++
+ ifeq ($(call isTargetOs, windows), true)
+   LIBAWT_CFLAGS += -EHsc -DUNICODE -D_UNICODE -DMLIB_OS64BIT
+   LIBAWT_RCFLAGS ?= -I$(TOPDIR)/src/java.base/windows/native/launcher/icons
+@@ -167,11 +171,18 @@ ifeq ($(call isTargetOs, windows macosx), false)
+       $(TOPDIR)/src/$(MODULE)/$(OPENJDK_TARGET_OS_TYPE)/native/common/awt \
+       #
+ 
++  LIBAWT_HEADLESS_EXCLUDE_FILES := \
++      GLXGraphicsConfig.c \
++      GLXSurfaceData.c \
++      X11PMBlitLoops.c \
++      X11Renderer.c \
++      X11SurfaceData.c \
++      #
++
+   LIBAWT_HEADLESS_EXTRA_HEADER_DIRS := \
+       $(LIBAWT_DEFAULT_HEADER_DIRS) \
+       common/awt/debug \
+       common/font \
+-      common/java2d/opengl \
+       java.base:libjvm \
+       #
+ 
+@@ -191,7 +202,8 @@ ifeq ($(call isTargetOs, windows macosx), false)
+   $(eval $(call SetupJdkLibrary, BUILD_LIBAWT_HEADLESS, \
+       NAME := awt_headless, \
+       EXTRA_SRC := $(LIBAWT_HEADLESS_EXTRA_SRC), \
+-      EXCLUDES := medialib, \
++      EXCLUDES := medialib opengl, \
++      EXCLUDE_FILES := $(LIBAWT_HEADLESS_EXCLUDE_FILES), \
+       ONLY_EXPORTED := $(LIBAWT_HEADLESS_ONLY_EXPORTED), \
+       OPTIMIZATION := LOW, \
+       CFLAGS := -DHEADLESS=true $(CUPS_CFLAGS) $(FONTCONFIG_CFLAGS) \
+diff --git a/src/java.desktop/unix/native/common/awt/utility/rect.h b/src/java.desktop/unix/native/common/awt/utility/rect.h
+index ceea38f4349..91b5a17ec58 100644
+--- a/src/java.desktop/unix/native/common/awt/utility/rect.h
++++ b/src/java.desktop/unix/native/common/awt/utility/rect.h
+@@ -28,7 +28,7 @@
+ #ifndef _AWT_RECT_H
+ #define _AWT_RECT_H
+ 
+-#ifndef MACOSX
++#if !defined(HEADLESS) && !defined(MACOSX)
+ #include <X11/Xlib.h>
+ typedef XRectangle RECT_T;
+ #else
+@@ -39,7 +39,7 @@ typedef struct {
+     int width;
+     int height;
+ } RECT_T;
+-#endif /* !MACOSX */
++#endif /* !HEADLESS && !MACOSX */
+ 
+ #define RECT_EQ_X(r1,r2)        ((r1).x==(r2).x && (r1).width==(r2).width)
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch b/package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
new file mode 100644
index 0000000000..db050aa60f
--- /dev/null
+++ b/package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
@@ -0,0 +1,43 @@
+From ac1110be8a65b230a3413890c77565cead5fa44f Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sat, 21 Feb 2026 15:45:42 +0100
+Subject: [PATCH] src: hotspot: aarch64: macro assembler: fix cmp
+
+Older GCC versions (e.g., GCC 6.x from bootlin toolchains) cannot
+resolve the overload ambiguity when passing an InstanceKlass::ClassState
+enum value to cmp(). The compiler sees both cmp(Register, unsigned char)
+and the deleted cmp(Register, unsigned int) as candidates.
+
+Explicitly cast the enum value to unsigned char to fix the build with
+older toolchains.
+
+Fixes:
+
+  * For target hotspot_variant-server_libjvm_objs_macroAssembler_aarch64.o:
+  /home/thomas/br-test-pkg/bootlin-aarch64-glibc-old/build/openjdk-25.0.2+10/src/hotspot/cpu/aarch64/macroAssembler_aarch64.cpp: In member function 'void MacroAssembler::clinit_barrier(Register, Register, Label*, Label*)':
+  /home/thomas/br-test-pkg/bootlin-aarch64-glibc-old/build/openjdk-25.0.2+10/src/hotspot/cpu/aarch64/macroAssembler_aarch64.cpp:2048:48: error: call of overloaded 'cmp(Register&, InstanceKlass::ClassState)' is ambiguous
+     cmp(scratch, InstanceKlass::fully_initialized);
+                                                  ^
+
+Upstream: https://github.com/openjdk/jdk/pull/29856
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/hotspot/cpu/aarch64/macroAssembler_aarch64.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hotspot/cpu/aarch64/macroAssembler_aarch64.cpp b/src/hotspot/cpu/aarch64/macroAssembler_aarch64.cpp
+index a424bd7f275..5cf4b1d981f 100644
+--- a/src/hotspot/cpu/aarch64/macroAssembler_aarch64.cpp
++++ b/src/hotspot/cpu/aarch64/macroAssembler_aarch64.cpp
+@@ -2045,7 +2045,7 @@ void MacroAssembler::clinit_barrier(Register klass, Register scratch, Label* L_f
+   // Fast path check: class is fully initialized
+   lea(scratch, Address(klass, InstanceKlass::init_state_offset()));
+   ldarb(scratch, scratch);
+-  cmp(scratch, InstanceKlass::fully_initialized);
++  cmp(scratch, (unsigned char)InstanceKlass::fully_initialized);
+   br(Assembler::EQ, *L_fast_path);
+ 
+   // Fast path check: current thread is initializer thread
+-- 
+2.43.0
+
diff --git a/package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch b/package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
new file mode 100644
index 0000000000..00cc22a3ed
--- /dev/null
+++ b/package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
@@ -0,0 +1,42 @@
+From 87cb37e3341a33c5a8fac361972c53b1edc56799 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sat, 21 Feb 2026 15:50:42 +0100
+Subject: [PATCH] src: hotspot: share: gc: shenandoah: fix constexpr
+
+Older GCC versions (e.g., GCC 6.x from bootlin toolchains) enforce
+C++14 rules more strictly and do not allow constexpr member functions
+on non-literal types. ShenandoahSimpleBitMap is not a literal type
+because it has a non-trivial destructor or other disqualifying members.
+
+Remove constexpr from ShenandoahSimpleBitMap::alignment() to fix the
+build with older toolchains. The function can still be inlined and
+optimized.
+
+Fixes:
+
+  /home/thomas/br-test-pkg/bootlin-aarch64-glibc-old/build/openjdk-25.0.2+10/src/hotspot/share/gc/shenandoah/shenandoahSimpleBitMap.hpp:93:26: error: enclosing class of constexpr non-static member function 'idx_t ShenandoahSimpleBitMap::alignment() const' is not a literal type
+     inline constexpr idx_t alignment() const {
+                            ^~~~~~~~~
+
+Upstream: https://github.com/openjdk/jdk/pull/29856
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/hotspot/share/gc/shenandoah/shenandoahSimpleBitMap.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hotspot/share/gc/shenandoah/shenandoahSimpleBitMap.hpp b/src/hotspot/share/gc/shenandoah/shenandoahSimpleBitMap.hpp
+index 3a4cb8cf742..451c11e2e58 100644
+--- a/src/hotspot/share/gc/shenandoah/shenandoahSimpleBitMap.hpp
++++ b/src/hotspot/share/gc/shenandoah/shenandoahSimpleBitMap.hpp
+@@ -90,7 +90,7 @@ class ShenandoahSimpleBitMap {
+     return array_idx;
+   }
+ 
+-  inline constexpr idx_t alignment() const {
++  inline idx_t alignment() const {
+     return BitsPerWord;
+   }
+ 
+-- 
+2.43.0
+
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 7f29e7a489..022ded8dbb 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -53,8 +53,8 @@ if BR2_PACKAGE_OPENJDK
 choice
 	prompt "openjdk version"
 	default BR2_PACKAGE_OPENJDK_VERSION_17 if BR2_OPENJDK_VERSION_LTS # legacy
-	default BR2_PACKAGE_OPENJDK_VERSION_21 if BR2_OPENJDK_VERSION_LATEST # legacy
-	default BR2_PACKAGE_OPENJDK_VERSION_21
+	default BR2_PACKAGE_OPENJDK_VERSION_25 if BR2_OPENJDK_VERSION_LATEST # legacy
+	default BR2_PACKAGE_OPENJDK_VERSION_25
 	help
 	  Select the version of OpenJDK you wish to use.
 
@@ -64,6 +64,9 @@ config BR2_PACKAGE_OPENJDK_VERSION_17
 config BR2_PACKAGE_OPENJDK_VERSION_21
 	bool "OpenJDK 21"
 
+config BR2_PACKAGE_OPENJDK_VERSION_25
+	bool "OpenJDK 25"
+
 endchoice
 
 config BR2_PACKAGE_OPENJDK_X11
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 72a6ff2e27..3f83ab48f8 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,5 @@
 # Locally computed
+sha256  9b3164cedf78d7a76a59499d7a6833145c7e0269ec7b664bfe5ee03ced2f449e  openjdk-25.0.2+10.tar.gz
 sha256  6500906cb7cc49268ce4ca368db3ddf3541b40afd25eecb378e13d5a72f43214  openjdk-21.0.10+7.tar.gz
 sha256  7ebfcc2aafd514c23df3fe5280e1a34630b9b1d429c65a80dd5a4b6e7f177bc3  openjdk-17.0.18+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e5d9d5e630..fbc860019c 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
+ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_25),y)
+OPENJDK_VERSION_MAJOR = 25
+OPENJDK_VERSION_MINOR = 0.2
+OPENJDK_VERSION_BUILD = 10
+else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
 OPENJDK_VERSION_MINOR = 0.10
 OPENJDK_VERSION_BUILD = 7
-
 else
 OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.18
@@ -80,7 +83,6 @@ OPENJDK_CONF_ENV = \
 
 OPENJDK_CONF_OPTS = \
 	--disable-full-docs \
-	--disable-manpages \
 	--disable-warnings-as-errors \
 	--enable-openjdk-only \
 	--enable-unlimited-crypto \
@@ -90,7 +92,7 @@ OPENJDK_CONF_OPTS = \
 	--with-debug-level=release \
 	--with-devkit=$(HOST_DIR) \
 	--with-extra-cflags="$(TARGET_CFLAGS)" \
-	--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
+	--with-extra-cxxflags="$(TARGET_CXXFLAGS) -fpermissive" \
 	--with-extra-ldflags="-Wl,-rpath,$(OPENJDK_INSTALL_BASE)/lib,-rpath,$(OPENJDK_INSTALL_BASE)/lib/$(OPENJDK_JVM_VARIANT)" \
 	--with-giflib=system \
 	--with-jobs=$(PARALLEL_JOBS) \
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
index 21d9679788..97dec8b804 100644
--- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
@@ -33,7 +33,7 @@ public class JniTest
 	public static void main(String[] args)
 	{
 		var actualVersion = JniWrapper.get_jni_version();
-		var expectedVersion = 0x00150000;
+		var expectedVersion = 0x00180000;
 		JniTest.Test(
 			"Get JNI Version",
 			actualVersion,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
