Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469F3C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69D2417D8;
	Mon,  6 Nov 2023 21:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E69D2417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vi6gTIfNd3dR; Mon,  6 Nov 2023 21:08:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9517441950;
	Mon,  6 Nov 2023 21:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9517441950
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20A3F1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03E58414FA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03E58414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0gm7Otnqpis for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:08:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04BF2415B7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04BF2415B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0944869F0; Mon,  6 Nov 2023 21:08:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:08:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55fd656cb29eec570f2f59764454e0e9a29d432a
X-Git-Newrev: 727c041a25e0c7ad992d0b5ca422d20309ddefe4
X-Patchwork-Hint: ignore
Message-Id: <20231106210822.D0944869F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk{-bin}: bump versions to
 17.0.9+9 and 21.0.1+12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=727c041a25e0c7ad992d0b5ca422d20309ddefe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Move openjdk-bin.hash into separate directories, as the
  legal/java.prefs/ASSEMBLY_EXCEPTION file has an upated URL for OpenJDK 21.
  openjdk.java.net -> https://openjdk.org. The license type remains the same.

- Move 0001-Add-ARCv2-ISA-processors-support-to-Zero.patch into separate
  directories as the list of architectures in src/hotspot/os/linux/os_linux.cpp
  is no longer the same. 17 has LOONGARCH and 21 has LOONGARCH64.

Tested on Fedora39 and Debian 11 with:
./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                  |  3 ++-
 package/openjdk-bin/17.0.9_9/openjdk-bin.hash        |  7 +++++++
 package/openjdk-bin/21.0.1_12/openjdk-bin.hash       |  7 +++++++
 package/openjdk-bin/openjdk-bin.hash                 | 11 -----------
 package/openjdk-bin/openjdk-bin.mk                   |  7 +++----
 ...01-Add-ARCv2-ISA-processors-support-to-Zero.patch | 18 +++++++++---------
 ...01-Add-ARCv2-ISA-processors-support-to-Zero.patch | 20 ++++++++++----------
 package/openjdk/openjdk.hash                         |  4 ++--
 package/openjdk/openjdk.mk                           |  8 +++-----
 9 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a0df6757a..e469b55428 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -992,7 +992,8 @@ package/olsr/S50olsr Indent Shellcheck Variables
 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
-package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
+package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
+package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
 package/openldap/0003-disable-docs.patch Upstream
diff --git a/package/openjdk-bin/17.0.9_9/openjdk-bin.hash b/package/openjdk-bin/17.0.9_9/openjdk-bin.hash
new file mode 100644
index 0000000000..29f39c5d36
--- /dev/null
+++ b/package/openjdk-bin/17.0.9_9/openjdk-bin.hash
@@ -0,0 +1,7 @@
+# https://github.com/adoptium/temurin17-binaries/releases
+sha256  7b175dbe0d6e3c9c23b6ed96449b018308d8fc94a5ecd9c0df8b8bc376c3c18a  OpenJDK17U-jdk_x64_linux_hotspot_17.0.9_9.tar.gz
+sha256  e2c5e26f8572544b201bc22a9b28f2b1a3147ab69be111cea07c7f52af252e75  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.9_9.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/21.0.1_12/openjdk-bin.hash b/package/openjdk-bin/21.0.1_12/openjdk-bin.hash
new file mode 100644
index 0000000000..35be28bb4f
--- /dev/null
+++ b/package/openjdk-bin/21.0.1_12/openjdk-bin.hash
@@ -0,0 +1,7 @@
+# From https://github.com/adoptium/temurin21-binaries/releases
+sha256  1a6fa8abda4c5caed915cfbeeb176e7fbd12eb6b222f26e290ee45808b529aa1  OpenJDK21U-jdk_x64_linux_hotspot_21.0.1_12.tar.gz
+sha256  e184dc29a6712c1f78754ab36fb48866583665fa345324f1a79e569c064f95e9  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.1_12.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
deleted file mode 100644
index 1bd33d3d7a..0000000000
--- a/package/openjdk-bin/openjdk-bin.hash
+++ /dev/null
@@ -1,11 +0,0 @@
-# From https://github.com/adoptium/temurin21-binaries/releases
-sha256  82f64c53acaa045370d6762ebd7441b74e6fda14b464d54d1ff8ca941ec069e6  OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
-sha256  33e440c237438aa2e3866d84ead8d4e00dc0992d98d9fd0ee2fe48192f2dbc4b  OpenJDK21U-jdk_aarch64_linux_hotspot_21_35.tar.gz
-
-# https://github.com/adoptium/temurin17-binaries/releases
-sha256  c25dfbc334068a48c19c44ce39ad4b8427e309ae1cfa83f23c102e78b8a6dcc0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz
-sha256  eefd3cf3b3dd47ff269fa5b5c10b5e096b163f4e9c1810023abdbc00dc6cc304  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8.1_1.tar.gz
-
-# Locally calculated
-sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
-sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 05d95dbbc0..0280151fba 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,12 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 35
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.8.1_1
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.9_9
 endif
 
 ifeq ($(HOSTARCH),x86_64)
@@ -21,6 +19,7 @@ ifeq ($(HOSTARCH),aarch64)
 HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
 endif
 
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
diff --git a/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 86%
copy from package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
copy to package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index a8ea5aff65..afec2772c0 100644
--- a/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/17.0.9+9/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -23,8 +23,8 @@ diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
 index 5120918aed2..f7a99955874 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -146,6 +146,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
-     fi
+@@ -152,6 +152,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -latomic"
    fi
  
 +  # Libatomic library
@@ -55,8 +55,8 @@ index c0f2446dbd7..dc416ece885 100644
      arm*)
        VAR_CPU=arm
        VAR_CPU_ARCH=arm
-@@ -563,6 +569,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
-     HOTSPOT_$1_CPU_DEFINE=PPC64
+@@ -565,6 +571,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+     HOTSPOT_$1_CPU_DEFINE=RISCV64
  
    # The cpu defines below are for zero, we don't support them directly.
 +  elif test "x$OPENJDK_$1_CPU" = xarc; then
@@ -68,7 +68,7 @@ diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.c
 index b08caf4d5d3..2bf084895ba 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1676,6 +1676,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1721,6 +1721,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1700,6 +1703,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1745,6 +1748,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1728,6 +1732,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1773,6 +1777,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,12 +95,12 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1750,7 +1756,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1795,7 +1801,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
 -        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
-+        AARCH64, ALPHA, ARC ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
  #endif
  
    // Identify compatibility class for VM's architecture and library's architecture
diff --git a/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 83%
rename from package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
index a8ea5aff65..6c46ec7b42 100644
--- a/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
+++ b/package/openjdk/21.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -23,8 +23,8 @@ diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
 index 5120918aed2..f7a99955874 100644
 --- a/make/autoconf/libraries.m4
 +++ b/make/autoconf/libraries.m4
-@@ -146,6 +146,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
-     fi
+@@ -163,6 +163,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lrt"
    fi
  
 +  # Libatomic library
@@ -55,8 +55,8 @@ index c0f2446dbd7..dc416ece885 100644
      arm*)
        VAR_CPU=arm
        VAR_CPU_ARCH=arm
-@@ -563,6 +569,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
-     HOTSPOT_$1_CPU_DEFINE=PPC64
+@@ -571,6 +577,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+     HOTSPOT_$1_CPU_DEFINE=RISCV64
  
    # The cpu defines below are for zero, we don't support them directly.
 +  elif test "x$OPENJDK_$1_CPU" = xarc; then
@@ -68,7 +68,7 @@ diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.c
 index b08caf4d5d3..2bf084895ba 100644
 --- a/src/hotspot/os/linux/os_linux.cpp
 +++ b/src/hotspot/os/linux/os_linux.cpp
-@@ -1676,6 +1676,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1653,6 +1653,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
  #ifndef EM_AARCH64
    #define EM_AARCH64    183               /* ARM AARCH64 */
  #endif
@@ -78,7 +78,7 @@ index b08caf4d5d3..2bf084895ba 100644
  #ifndef EM_RISCV
    #define EM_RISCV      243               /* RISC-V */
  #endif
-@@ -1700,6 +1703,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1677,6 +1680,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
      {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
  #endif
      {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
@@ -86,7 +86,7 @@ index b08caf4d5d3..2bf084895ba 100644
      // we only support 64 bit z architecture
      {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
      {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
-@@ -1728,6 +1732,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1709,6 +1713,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_PPC;
  #elif  (defined AARCH64)
    static  Elf32_Half running_arch_code=EM_AARCH64;
@@ -95,12 +95,12 @@ index b08caf4d5d3..2bf084895ba 100644
  #elif  (defined ARM)
    static  Elf32_Half running_arch_code=EM_ARM;
  #elif  (defined S390)
-@@ -1750,7 +1756,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+@@ -1731,7 +1737,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
    static  Elf32_Half running_arch_code=EM_LOONGARCH;
  #else
      #error Method os::dll_load requires that one of following is defined:\
--        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
-+        AARCH64, ALPHA, ARC ARM, AMD64, IA32, IA64, LOONGARCH, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+-        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, LOONGARCH64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
  #endif
  
    // Identify compatibility class for VM's architecture and library's architecture
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 76d419f255..949a62e527 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b798ebc2e899a98edf2be99e786bb0fbad144e2270925dffe624fbe052f07ade  openjdk-21+35.tar.gz
-sha256  e57251d8306911282b6f0a2f721431dab5f87c99cce0930fc062e690f7c77f04  openjdk-17.0.8.1+1.tar.gz
+sha256  9943e3814d3c1a31f1449f09a8b67df54841944f855a1d372be892c5e6b19217  openjdk-21.0.1+12.tar.gz
+sha256  836adb5fec5a58ce2f49a0faeaf9e69a3cb89865f4d855c6098f0264843672ad  openjdk-17.0.9+9.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e3e63e2382..f4e1920e6c 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,14 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 35
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+OPENJDK_VERSION_MINOR = 0.1+12
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.8.1+1
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+OPENJDK_VERSION_MINOR = 0.9+9
 endif
-
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
 OPENJDK_LICENSE = GPL-2.0+ with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
