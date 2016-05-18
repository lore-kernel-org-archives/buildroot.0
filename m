From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 19 May 2016 00:26:46 +0300
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2016.03 release
Message-ID: <1463606806-5676-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change switches ARC tools to the most recent arc-2016.03
version.

ARC GNU tools of version arc-2016.03 bring some quite significant
changes like:
 * Binutils v2.26+ (upstream commit id 202ac19 with additional ARC
 * patches)
 * GCC v4.8.5
 * GDB 7.10

More about changes, improvements and fixes could be found here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03

Note in this change we're adding sha512 checksums for
both binutils and gcc tarballs fetched from GitHub.

Build and run-tested in nSIM for both ARC700 and ARC HS38.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                                      | 2 +-
 .../binutils/{arc-2016.03-rc2 => arc-2016.03}/0300-ld-makefile.patch | 0
 .../0301-check-ldrunpath-length.patch                                | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                         | 0
 .../0600-poison-system-directories.patch                             | 0
 package/binutils/binutils.hash                                       | 5 +++--
 package/binutils/binutils.mk                                         | 2 +-
 package/gcc/Config.in.host                                           | 2 +-
 package/gcc/{arc-2016.03-rc2 => arc-2016.03}/130-pr43538.patch       | 0
 .../{arc-2016.03-rc2 => arc-2016.03}/301-missing-execinfo_h.patch    | 0
 .../305-libmudflap-susv3-legacy.patch                                | 0
 package/gcc/{arc-2016.03-rc2 => arc-2016.03}/842-PR60155.patch       | 0
 .../{arc-2016.03-rc2 => arc-2016.03}/850-libstdcxx-uclibc-c99.patch  | 0
 .../gcc/{arc-2016.03-rc2 => arc-2016.03}/851-PR-other-56780.patch    | 0
 .../930-libgcc-disable-split-stack-nothreads.patch                   | 0
 package/gcc/gcc.hash                                                 | 5 +++--
 package/gdb/Config.in.host                                           | 2 +-
 package/gdb/gdb.hash                                                 | 2 +-
 18 files changed, 11 insertions(+), 9 deletions(-)
 rename package/binutils/{arc-2016.03-rc2 => arc-2016.03}/0300-ld-makefile.patch (100%)
 rename package/binutils/{arc-2016.03-rc2 => arc-2016.03}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2016.03-rc2 => arc-2016.03}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2016.03-rc2 => arc-2016.03}/0600-poison-system-directories.patch (100%)
 rename package/gcc/{arc-2016.03-rc2 => arc-2016.03}/130-pr43538.patch (100%)
 rename package/gcc/{arc-2016.03-rc2 => arc-2016.03}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{arc-2016.03-rc2 => arc-2016.03}/305-libmudflap-susv3-legacy.patch (100%)
 rename package/gcc/{arc-2016.03-rc2 => arc-2016.03}/842-PR60155.patch (100%)
 rename package/gcc/{arc-2016.03-rc2 => arc-2016.03}/850-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2016.03-rc2 => arc-2016.03}/851-PR-other-56780.patch (100%)
 rename package/gcc/{arc-2016.03-rc2 => arc-2016.03}/930-libgcc-disable-split-stack-nothreads.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 33159ca..efdc840 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -26,7 +26,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.03-rc2"	if BR2_arc
+	default "arc-2016.03"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26"		if BR2_BINUTILS_VERSION_2_26_X
diff --git a/package/binutils/arc-2016.03-rc2/0300-ld-makefile.patch b/package/binutils/arc-2016.03/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.03-rc2/0300-ld-makefile.patch
rename to package/binutils/arc-2016.03/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.03-rc2/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.03/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.03-rc2/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.03/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.03/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.03/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.03-rc2/0600-poison-system-directories.patch b/package/binutils/arc-2016.03/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.03-rc2/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.03/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 7e77b6b..338bb8d 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,5 +2,6 @@
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 sha512  e77e1b8dbbcbaf9ac2fae95c4403615808af3be03b2e1d32448cd3a7d32c43273f8bcace3f2de84ec120a982879295673029da306e2885dbf5f990584932cfc7  binutils-2.26.tar.bz2
-# No hash for the ARC variant, comes from the github-helper:
-none   xxx  binutils-arc-2016.03-rc2.tar.gz
+
+# Locally calculated (fetched from Github)
+sha512  566312760ef564902fd85e281ef1370426c1451a16eb1d3e2faea7ec62100ae70ac9a5f33a7a5f87cdc744e82dd03203378fa4db1652c6b7856d865404dd19f8  binutils-arc-2016.03.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 340846d..9ed7262 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.03-rc2
+BINUTILS_VERSION = arc-2016.03
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6c2732d..61d3dbe 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -100,7 +100,7 @@ config BR2_GCC_VERSION
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
-	default "arc-2016.03-rc2" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.03" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.03-rc2/130-pr43538.patch b/package/gcc/arc-2016.03/130-pr43538.patch
similarity index 100%
rename from package/gcc/arc-2016.03-rc2/130-pr43538.patch
rename to package/gcc/arc-2016.03/130-pr43538.patch
diff --git a/package/gcc/arc-2016.03-rc2/301-missing-execinfo_h.patch b/package/gcc/arc-2016.03/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.03-rc2/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.03/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.03-rc2/305-libmudflap-susv3-legacy.patch b/package/gcc/arc-2016.03/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from package/gcc/arc-2016.03-rc2/305-libmudflap-susv3-legacy.patch
rename to package/gcc/arc-2016.03/305-libmudflap-susv3-legacy.patch
diff --git a/package/gcc/arc-2016.03-rc2/842-PR60155.patch b/package/gcc/arc-2016.03/842-PR60155.patch
similarity index 100%
rename from package/gcc/arc-2016.03-rc2/842-PR60155.patch
rename to package/gcc/arc-2016.03/842-PR60155.patch
diff --git a/package/gcc/arc-2016.03-rc2/850-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2016.03/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2016.03-rc2/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2016.03/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2016.03-rc2/851-PR-other-56780.patch b/package/gcc/arc-2016.03/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2016.03-rc2/851-PR-other-56780.patch
rename to package/gcc/arc-2016.03/851-PR-other-56780.patch
diff --git a/package/gcc/arc-2016.03-rc2/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/arc-2016.03/930-libgcc-disable-split-stack-nothreads.patch
similarity index 100%
rename from package/gcc/arc-2016.03-rc2/930-libgcc-disable-split-stack-nothreads.patch
rename to package/gcc/arc-2016.03/930-libgcc-disable-split-stack-nothreads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 61c8993..1bed770 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,5 +10,6 @@ sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a31
 sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.1.0/sha512.sum
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
-# No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2016.03-rc2.tar.gz
+
+# Locally calculated (fetched from Github)
+sha512  65b1eef5f8ca26941dd9b5e1bcaf4ce285cc95429eeb92b4088663577bcdb2392f9712925f38666d94207fecd244579336f753a13de1f90e5169b21d8a73bef3  gcc-arc-2016.03.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d006fb7..257d68a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -48,7 +48,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2016.03-rc2-gdb" if BR2_arc
+	default "arc-2016.03-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
 	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index dd55189..bf3f925 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  eadd2a59a1e48b1484eb2bea85256d6b1912926bc8b690793d02babf2639608bd22a0f2d
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-sha512  6026889c72baee2f57d3e706fdd07c19e9b0b27d9ab87d32da39cc3bc3afe911f0d30e3bbca6fd6281b7e94da66d475b17edadfd58bce4d8b419ee8d475660fa	gdb-arc-2016.03-rc2-gdb.tar.gz
+sha512  1abef1357896c2b57cfa7f7414eedc49d0de26b54321c680c2d027b1a27ec453d421e7f89a5281336047542379fd4820685802059efbd32b87c5ccffbaf2bd16	gdb-arc-2016.03-gdb.tar.gz
-- 
2.5.5
