From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Fri,  5 Feb 2016 15:46:40 +0300
Subject: [Buildroot] [PATCH v4] toolchain: bump ARC toolchain components to
	arc-2015.12
Message-ID: <1454676400-12797-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change introduces newer ARC toolchain in Buildroot.

That new arc-2015.12 release doesn't bring any significant changes
but mostly is focused on fixes and minor improvements here and there.
Most noticeable changes are:
 * GCC: Source update to v4.8.5
 * GDB: Updated to upstream 7.10 release.

You may find more info on fixes and improvements in that release at:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
change v1->v3:
- binutils and gdb version bump
change v2->v3:
- use diff.renames copy
change v3->v4:
- arc-2015.12-rc1 patches to gcc (UPDATE: Fix handling complex PIC moves,
UPDATE1: Fix handling complex PIC moves, Don't allow mcompact-casesi for ARCv2)
should be applied to arc-2015.12, because of our local decision not to include
these patches to arc-2015.12 release.
---
 package/binutils/Config.in.host                                         | 2 +-
 .../binutils/{arc-2015.12-rc1 => arc-2015.12}/0001-PR-other-56780.patch | 0
 .../600-poison-system-directories.patch                                 | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../gcc/{arc-2015.12-rc1 => arc-2015.12}/100-libstdcxx-uclibc-c99.patch | 0
 package/gcc/{arc-2015.12-rc1 => arc-2015.12}/851-PR-other-56780.patch   | 0
 .../900-UPDATE-Fix-handling-complex-PIC-moves.patch                     | 0
 .../901-UPDATE1-Fix-handling-complex-PIC-moves.patch                    | 0
 .../950-Don-t-allow-mcompact-casesi-for-ARCv2.patch                     | 0
 package/gcc/gcc.hash                                                    | 2 +-
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 14 files changed, 7 insertions(+), 7 deletions(-)
 rename package/binutils/{arc-2015.12-rc1 => arc-2015.12}/0001-PR-other-56780.patch (100%)
 rename package/binutils/{arc-2015.12-rc1 => arc-2015.12}/600-poison-system-directories.patch (100%)
 rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/100-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/851-PR-other-56780.patch (100%)
 rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/900-UPDATE-Fix-handling-complex-PIC-moves.patch (100%)
 rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/901-UPDATE1-Fix-handling-complex-PIC-moves.patch (100%)
 rename package/gcc/{arc-2015.12-rc1 => arc-2015.12}/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 7a04d39..df3c385 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2015.12-rc1"	if BR2_arc
+	default "arc-2015.12"	if BR2_arc
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch b/package/binutils/arc-2015.12/0001-PR-other-56780.patch
similarity index 100%
rename from package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch
rename to package/binutils/arc-2015.12/0001-PR-other-56780.patch
diff --git a/package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch b/package/binutils/arc-2015.12/600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch
rename to package/binutils/arc-2015.12/600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 5d4ddb3..4af5498 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none   xxx  binutils-arc-2015.12-rc1.tar.gz
+none   xxx  binutils-arc-2015.12.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 7c5955e..5635a09 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2015.12-rc1
+BINUTILS_VERSION = arc-2015.12
 else
 BINUTILS_VERSION = 2.24
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4184ac7..cad6896 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -114,7 +114,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
-	default "arc-2015.12-rc1" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2015.12" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2015.12/100-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch b/package/gcc/arc-2015.12/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch
rename to package/gcc/arc-2015.12/851-PR-other-56780.patch
diff --git a/package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12/900-UPDATE-Fix-handling-complex-PIC-moves.patch
similarity index 100%
rename from package/gcc/arc-2015.12-rc1/900-UPDATE-Fix-handling-complex-PIC-moves.patch
rename to package/gcc/arc-2015.12/900-UPDATE-Fix-handling-complex-PIC-moves.patch
diff --git a/package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch b/package/gcc/arc-2015.12/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
similarity index 100%
rename from package/gcc/arc-2015.12-rc1/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
rename to package/gcc/arc-2015.12/901-UPDATE1-Fix-handling-complex-PIC-moves.patch
diff --git a/package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch b/package/gcc/arc-2015.12/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
similarity index 100%
rename from package/gcc/arc-2015.12-rc1/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
rename to package/gcc/arc-2015.12/950-Don-t-allow-mcompact-casesi-for-ARCv2.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 064a727..0ef4e65 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -9,4 +9,4 @@ sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a31
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
 sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2015.12-rc1.tar.gz
+none  xxx  gcc-arc-2015.12.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d5f08b2..6807694 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -52,7 +52,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2015.12-rc1-gdb" if BR2_arc
+	default "arc-2015.12-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 64bc501..3abdcd0 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,5 +4,5 @@ sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2015.12-rc1-gdb.tar.gz
+none	xxx	gdb-arc-2015.12-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.5.0
