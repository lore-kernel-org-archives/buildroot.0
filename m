From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 14:48:19 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
 arc-2018.03-rc2
Message-ID: <20180528124718.EFE2E8267F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6505b06d47d0ec5669453c87d601477414586e13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ARC toolchain to arc-2018.03-rc2, which
includes significant changes since arc-2018.03-rc1.
We want to test how new toolchain-rc2 builds packages,
so we can make fixes before release of toolcain.
This makes us closer to toolchain release which will be in a few weeks.

Please note that it is a release candidate
and it might contain some breakages,
please don't use it for production builds.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7aaabe8fc04006b15bb5f9aaf08ac07603fcf7fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                                       | 2 +-
 .../{arc-2018.03-rc1 => arc-2018.03-rc2}/0002-ld-makefile.patch       | 0
 .../0003-check-ldrunpath-length.patch                                 | 0
 .../0004-add-sysroot-fix-from-bug-3049.patch                          | 0
 .../0005-poison-system-directories.patch                              | 0
 package/binutils/binutils.hash                                        | 2 +-
 package/binutils/binutils.mk                                          | 4 ++--
 package/gcc/Config.in.host                                            | 2 +-
 .../gcc/{arc-2018.03-rc1 => arc-2018.03-rc2}/0100-uclibc-conf.patch   | 0
 .../0860-cilk-fix-build-without-wchar.patch                           | 0
 .../{arc-2018.03-rc1 => arc-2018.03-rc2}/0900-remove-selftests.patch  | 0
 package/gcc/gcc.hash                                                  | 2 +-
 package/gdb/Config.in.host                                            | 2 +-
 package/gdb/gdb.hash                                                  | 2 +-
 package/glibc/glibc.hash                                              | 2 +-
 package/glibc/glibc.mk                                                | 2 +-
 16 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 22478d917a..03b228168f 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -24,7 +24,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2018.03-rc1"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2018.03-rc2"	if BR2_BINUTILS_VERSION_ARC
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
diff --git a/package/binutils/arc-2018.03-rc1/0002-ld-makefile.patch b/package/binutils/arc-2018.03-rc2/0002-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2018.03-rc1/0002-ld-makefile.patch
rename to package/binutils/arc-2018.03-rc2/0002-ld-makefile.patch
diff --git a/package/binutils/arc-2018.03-rc1/0003-check-ldrunpath-length.patch b/package/binutils/arc-2018.03-rc2/0003-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2018.03-rc1/0003-check-ldrunpath-length.patch
rename to package/binutils/arc-2018.03-rc2/0003-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2018.03-rc1/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2018.03-rc2/0004-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2018.03-rc1/0004-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2018.03-rc2/0004-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2018.03-rc1/0005-poison-system-directories.patch b/package/binutils/arc-2018.03-rc2/0005-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2018.03-rc1/0005-poison-system-directories.patch
rename to package/binutils/arc-2018.03-rc2/0005-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index ebe1f2ee24..c938222804 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e8262
 sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  7b8c4a5ec38a234b3ca097ce38e0e60628561251085fc83a614c8cf476eec53ca77ab34088987c80ce79772d5e2cc513b28a7df45f3dc5d0d3a82296e1f6474f  binutils-arc-2018.03-rc1.tar.gz
+sha512  c9d41001bd41d96f1cd78748c1e8df9715aab1158c0a1c9c90a2010e335c357d0d6816202b7fcf7c7d8d4a65e25920b0b35af6a59edd0d29fd9edddd8be95a48  binutils-arc-2018.03-rc2.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b24e4334c2..be9e652e10 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2018.03-rc1
+BINUTILS_VERSION = arc-2018.03-rc2
 else
 BINUTILS_VERSION = 2.29.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2018.03-rc1)
+ifeq ($(BINUTILS_VERSION),arc-2018.03-rc2)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7c08fb3596..00e72db032 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -73,7 +73,7 @@ config BR2_GCC_VERSION
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.3.0"     if BR2_GCC_VERSION_7_X
-	default "arc-2018.03-rc1" if BR2_GCC_VERSION_ARC
+	default "arc-2018.03-rc2" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2018.03-rc1/0100-uclibc-conf.patch b/package/gcc/arc-2018.03-rc2/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2018.03-rc1/0100-uclibc-conf.patch
rename to package/gcc/arc-2018.03-rc2/0100-uclibc-conf.patch
diff --git a/package/gcc/arc-2018.03-rc1/0860-cilk-fix-build-without-wchar.patch b/package/gcc/arc-2018.03-rc2/0860-cilk-fix-build-without-wchar.patch
similarity index 100%
rename from package/gcc/arc-2018.03-rc1/0860-cilk-fix-build-without-wchar.patch
rename to package/gcc/arc-2018.03-rc2/0860-cilk-fix-build-without-wchar.patch
diff --git a/package/gcc/arc-2018.03-rc1/0900-remove-selftests.patch b/package/gcc/arc-2018.03-rc2/0900-remove-selftests.patch
similarity index 100%
rename from package/gcc/arc-2018.03-rc1/0900-remove-selftests.patch
rename to package/gcc/arc-2018.03-rc2/0900-remove-selftests.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index d9a651b547..817d04e390 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,6 +8,6 @@ sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bb
 sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4  gcc-7.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  16e5f9d1637be9a099a996074dc43803803497965c1eab6c0057f10d193d30dcc405ad852df82c4f8c61b195195ee797b788ba0b235d7b03e4410806ac5f94bc  gcc-arc-2018.03-rc1.tar.gz
+sha512  a0faf2bb34f6c72b6460c6432639d89915cfc63456cfdf016896b3ef075655b2e9f26e745d841bbc38e776bc7a3729359cca88f1e4fb83489fa6775a3ccb55b8  gcc-arc-2018.03-rc2.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index e8dd09e61c..0011966d88 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -74,7 +74,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2018.03-rc1-gdb" if BR2_arc
+	default "arc-2018.03-rc2-gdb" if BR2_arc
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index a2af7b35d9..cfbaac40f6 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  975f0e09c9fd3ba1ca6aefdeb2da4b2804802606518c0cfdf7abe07c83a61341c1af5c2d2ddfd55ba6112fed420dedc529bc484d0c25b289bbed05edc99d0e72 	gdb-arc-2018.03-rc1-gdb.tar.gz
+sha512  0c58dd3e8fff8b51a459aba78f4acd1beaa3427e00a63a7242827f22c6af157e4aea91ab754cdc021e0075a5bf2b70df903dba67dbff2415fd0f82c8aab99087 	gdb-arc-2018.03-rc2-gdb.tar.gz
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 5a90e612b9..f19fa92af4 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from Github)
 sha256  a74489d14f4017bee6a6c6fe76f1de0dbf7d66c8695116de5aadd141c4757892     glibc-glibc-2.27.tar.gz
 # Locally calculated (fetched from Github)
-sha256  d88f60081285b639122a49425e5fcf8c8cbb0f05efde7a3cb206089fae53c232     glibc-arc-2018.03-rc1.tar.gz
+sha256  ddc63360393ab88ab6a4a0c81d33481f34c5a9ebd758eec2e6bb35385058b4cb     glibc-arc-2018.03-rc2.tar.gz
 
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3ab673c0cc..717182b052 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2018.03-rc1
+GLIBC_VERSION =  arc-2018.03-rc2
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
