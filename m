From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:05:18 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2017.03-rc2
Message-ID: <20170513130534.96BAF8283B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=043737282010f83e8ec20618a034131bc7e8cae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ARC toolchain to arc-2017.03-rc2

Please note that it is a release candidate and it might contain some
breakages, please don't use it for production builds.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../{arc-2017.03-rc1 => arc-2017.03-rc2}/0300-PATCH-ld-makefile.patch   | 0
 .../0301-PATCH-check-ldrunpath-length.patch                             | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
 .../0600-poison-system-directories.patch                                | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../{arc-2017.03-rc1 => arc-2017.03-rc2}/301-missing-execinfo_h.patch   | 0
 package/gcc/{arc-2017.03-rc1 => arc-2017.03-rc2}/860-cilk-wchar.patch   | 0
 .../940-uclinux-enable-threads.patch                                    | 0
 package/gcc/gcc.hash                                                    | 2 +-
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 13 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index e147ef0..9e89e57 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -23,7 +23,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2017.03-rc1"	if BR2_arc
+	default "arc-2017.03-rc2"	if BR2_arc
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28"		if BR2_BINUTILS_VERSION_2_28_X
diff --git a/package/binutils/arc-2017.03-rc1/0300-PATCH-ld-makefile.patch b/package/binutils/arc-2017.03-rc2/0300-PATCH-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc1/0300-PATCH-ld-makefile.patch
rename to package/binutils/arc-2017.03-rc2/0300-PATCH-ld-makefile.patch
diff --git a/package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch b/package/binutils/arc-2017.03-rc2/0301-PATCH-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc1/0301-PATCH-check-ldrunpath-length.patch
rename to package/binutils/arc-2017.03-rc2/0301-PATCH-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2017.03-rc1/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2017.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc1/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2017.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2017.03-rc1/0600-poison-system-directories.patch b/package/binutils/arc-2017.03-rc2/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc1/0600-poison-system-directories.patch
rename to package/binutils/arc-2017.03-rc2/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index be3f703..486bf37 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12c
 sha512	ede2e4e59a800260eea8c14eafbaee94e30abadafd5c419a3370f9f62213cf027d6400a1d4970b6958bd4d220e675dcd483a708107016e7abd5c99d7392ba8fd  binutils-2.28.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  536d252a4dae94803eb95a400e16d43c8e709276e3baed1d0c07fd764b2457b7845a0b3de9c78ab10211ab7e18a49c3a988570fc434357a72aac05cee9ca6beb  binutils-arc-2017.03-rc1.tar.gz
+sha512  577fbd59dc8d41022ed511b86f3afc49af48ab798a7b187411a466621dc6247dff7dd84fa110ca278f09a9e523d8bdb892a233c00bf47d11b92be70e7278efe9  binutils-arc-2017.03-rc2.tar.gz
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4bcb23e..ba4063d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -106,7 +106,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.3.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2017.03-rc1" if BR2_GCC_VERSION_ARC
+	default "arc-2017.03-rc2" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2017.03-rc1/301-missing-execinfo_h.patch b/package/gcc/arc-2017.03-rc2/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2017.03-rc1/301-missing-execinfo_h.patch
rename to package/gcc/arc-2017.03-rc2/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2017.03-rc1/860-cilk-wchar.patch b/package/gcc/arc-2017.03-rc2/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2017.03-rc1/860-cilk-wchar.patch
rename to package/gcc/arc-2017.03-rc2/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2017.03-rc1/940-uclinux-enable-threads.patch b/package/gcc/arc-2017.03-rc2/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2017.03-rc1/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2017.03-rc2/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 052a825..4313f15 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,6 +12,6 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78  gcc-6.3.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  e4fe5a179b8feabf932a8a6f4794ff6907b868a65487412d855a4b3671aa24ec8544a44f3b63e69ea2c12fcd4d8028d0619d40bf016ee7c1a5b5a99aa9315ef3  gcc-arc-2017.03-rc1.tar.gz
+sha512  8157d784367de2de853f7d288a213ee3222ac77321d18a887cd5a9c55b53f5948cc8608ec82398cb7e0a155ffa79f86f6469a23b505b22cd0eb5b69d610abd41  gcc-arc-2017.03-rc2.tar.gz
 # Locally calculated (fetched from Github)
 sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 62b5b1a..b1f0b55 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -55,7 +55,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2017.03-rc1-gdb" if BR2_arc
+	default "arc-2017.03-rc2-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index efb5b11..32526d5 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-sha512  0bd0ec8169ee059493675db59170f09a6c16d12408a426d6f07892a72d43b73e3ef0059ea409e9fb72998da6cb762d336b852d2e13e2817a0a0fe976e20803bd  gdb-arc-2017.03-rc1-gdb.tar.gz
+sha512  275241c215d0bd32ab0f9f16358c46a66fd0d5db09d9a148b169a6b8135cfe91c6240a6bb75977573d4fc449a98f0702254577cbdc4598c6153ebbdca39253cf	gdb-arc-2017.03-rc2-gdb.tar.gz
