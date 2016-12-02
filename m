From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Dec 2016 20:45:09 +0100
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-rc2
Message-ID: <20161202194633.68C6F8183C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19eaddc935eacb31e48938caad9eb227dcb6eec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-rc2.

This change contains a set of minor fixes and updates.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../{arc-2016.09-rc1 => arc-2016.09-rc2}/0300-ld-makefile.patch         | 0
 .../0301-check-ldrunpath-length.patch                                   | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
 .../0600-poison-system-directories.patch                                | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../{arc-2016.09-rc1 => arc-2016.09-rc2}/301-missing-execinfo_h.patch   | 0
 package/gcc/{arc-2016.09-rc1 => arc-2016.09-rc2}/860-cilk-wchar.patch   | 0
 .../940-uclinux-enable-threads.patch                                    | 0
 package/gcc/gcc.hash                                                    | 2 +-
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 14 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index af9339e..e67b346 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -22,7 +22,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-rc1"	if BR2_arc
+	default "arc-2016.09-rc2"	if BR2_arc
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
diff --git a/package/binutils/arc-2016.09-rc1/0300-ld-makefile.patch b/package/binutils/arc-2016.09-rc2/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-rc1/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-rc2/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-rc1/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-rc2/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-rc1/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-rc2/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-rc1/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-rc2/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-rc1/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-rc2/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-rc1/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-rc2/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-rc1/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-rc2/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 80ac9dd..7b3ec6b 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,4 +5,4 @@ sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  d0befdeb0a7b76efd1ad655fc062cde2aa67be7b26210c913ab2709e069d815c4ff2863ce7add1f6434da5a2f4faf1ce5a5bc3d0e64f3e04548a7479f24edcbc  binutils-arc-2016.09-rc1.tar.gz
+sha512  d2ae310dc1bdac8fcbeb7d1e5cd009a32d45d433ed1f0eaf4cddb3a86c803a89ef11df1db87b6fa45193a64c59197902ac84dd011f1b3dbac88edeb40b91833e  binutils-arc-2016.09-rc2.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 61486a2..bf345bb 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-rc1
+BINUTILS_VERSION = arc-2016.09-rc2
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d10798b..0fc1ec4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -98,7 +98,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.2.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-rc1" if BR2_GCC_VERSION_ARC
+	default "arc-2016.09-rc2" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.09-rc1/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-rc2/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.09-rc1/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-rc2/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.09-rc1/860-cilk-wchar.patch b/package/gcc/arc-2016.09-rc2/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2016.09-rc1/860-cilk-wchar.patch
rename to package/gcc/arc-2016.09-rc2/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2016.09-rc1/940-uclinux-enable-threads.patch b/package/gcc/arc-2016.09-rc2/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2016.09-rc1/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2016.09-rc2/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index e5d96f4..0d758b0 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  1e8b826a3d44b9d5899309894e20c03abeb352bf3d273b8ad63af814c0ee2911f1a83ce1cd4cdd2d1cb0b3e3c34e9b7ae1b2ab83dfc649ee817ab05247c76198  gcc-6.2.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  7029d7ae1316b9385880f32283aa6c4979b1257500bb21e3fb234475ecb20082f46b114d8b7022c75a8dcf0c0c7b6b02e9384b49dd3189adc3d454502b8b0c26  gcc-arc-2016.09-rc1.tar.gz
+sha512  fb4fdc00d3d2e4db52a83cb34f3e99399fd6b1d1d1e6dd378188a209467dca8975d6b2a4e16ccc27f53b897480ece4b496db21b0adc7c1bcddcdc775c2a3d2f9  gcc-arc-2016.09-rc2.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index da6b30e..4c8d902 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -56,7 +56,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2016.09-rc1-gdb" if BR2_arc
+	default "arc-2016.09-rc2-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
 	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 8c0d51b..c91373b 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-sha512  e6019ac0d6b1354943d3c06c84f353ba49fef105b07c1a04ad90cc5b65f91e38fe6c671e0c34a9541ee282d0f42cf24579c011a0469d19faaa4d00d64a17afe2	gdb-arc-2016.09-rc1-gdb.tar.gz
+sha512  f428e0e86179e8f0bf09e516884e575c00663de37a85f4ab3dbb2c384a839f3c06971a24690bdd7da0b31a00e629dd304578d2baa8c8a62baf040006c4b89728	gdb-arc-2016.09-rc2-gdb.tar.gz
