From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri,  3 Mar 2017 15:47:21 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03-eng008
Message-ID: <1488545241-17332-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps ARC toolchain to arc-2017.03-eng008.

Please note that it is an engineering build and it might have all kinds
of breakages, please don't use it for production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../{arc-2016.09-release => arc-2017.03-eng008}/0300-ld-makefile.patch  | 0
 .../0301-check-ldrunpath-length.patch                                   | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
 .../0600-poison-system-directories.patch                                | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../301-missing-execinfo_h.patch                                        | 0
 .../{arc-2016.09-release => arc-2017.03-eng008}/860-cilk-wchar.patch    | 0
 .../940-uclinux-enable-threads.patch                                    | 0
 package/gcc/gcc.hash                                                    | 2 +-
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 14 files changed, 7 insertions(+), 7 deletions(-)
 rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0300-ld-makefile.patch (100%)
 rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2016.09-release => arc-2017.03-eng008}/0600-poison-system-directories.patch (100%)
 rename package/gcc/{arc-2016.09-release => arc-2017.03-eng008}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{arc-2016.09-release => arc-2017.03-eng008}/860-cilk-wchar.patch (100%)
 rename package/gcc/{arc-2016.09-release => arc-2017.03-eng008}/940-uclinux-enable-threads.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 99a4a96..37742fb 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -22,7 +22,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-release"	if BR2_arc
+	default "arc-2017.03-eng008"	if BR2_arc
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
diff --git a/package/binutils/arc-2016.09-release/0300-ld-makefile.patch b/package/binutils/arc-2017.03-eng008/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-release/0300-ld-makefile.patch
rename to package/binutils/arc-2017.03-eng008/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-release/0301-check-ldrunpath-length.patch b/package/binutils/arc-2017.03-eng008/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-release/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2017.03-eng008/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-release/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2017.03-eng008/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-release/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2017.03-eng008/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-release/0600-poison-system-directories.patch b/package/binutils/arc-2017.03-eng008/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-release/0600-poison-system-directories.patch
rename to package/binutils/arc-2017.03-eng008/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index cf56b1a..3bc18d6 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,4 +5,4 @@ sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  b94f43bd084aef1cbe75da947775c7d9ad1873fb27f7b0b99244813c97bb44cd7fd4c11855418d74b731aa889bff615694777f41f4cd68429d8136d9bac2a239  binutils-arc-2016.09-release.tar.gz
+sha512  4f259849ee191b41b820a24ce3db37ade7a07290f6178c09d3935bf88b777b7aa36a40ba681bd5da765d9c6943ab52fa2975179bf9bf48260ae0a39692c3600c  binutils-arc-2017.03-eng008.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d8ca5d6..6d29f24 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-release
+BINUTILS_VERSION = arc-2017.03-eng008
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index eb41aa4..e6a38e8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -106,7 +106,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.3.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-release" if BR2_GCC_VERSION_ARC
+	default "arc-2017.03-eng008" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2016.09-release/301-missing-execinfo_h.patch b/package/gcc/arc-2017.03-eng008/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.09-release/301-missing-execinfo_h.patch
rename to package/gcc/arc-2017.03-eng008/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.09-release/860-cilk-wchar.patch b/package/gcc/arc-2017.03-eng008/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2016.09-release/860-cilk-wchar.patch
rename to package/gcc/arc-2017.03-eng008/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2016.09-release/940-uclinux-enable-threads.patch b/package/gcc/arc-2017.03-eng008/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2016.09-release/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2017.03-eng008/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4376db4..65f9d03 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,6 +12,6 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78  gcc-6.3.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  faae6dc3f7843412068a52de5919797cd23e6ed1b8d140c230d0381f13fd38af67baaa4a09e581c03602127da3dd2fab6f9f5d7ac5d4270585bd079c673dda9a  gcc-arc-2016.09-release.tar.gz
+sha512  571c9af48b403f528f27d3a71aa11c05890b1e856cda6797a44c45958bced41a4cea3226aef7429d83e85605205dff1657d39a3a7f0cce33064913ac3dc42977  gcc-arc-2017.03-eng008.tar.gz
 # Locally calculated (fetched from Github)
 sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 24e2274..8e4c48a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -56,7 +56,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2016.09-release-gdb" if BR2_arc
+	default "arc-2017.03-eng008-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1e205db..1308134 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-sha512  3b204108821ba687974e61bb47f0ab91621ac233503cec6c82913bcb665a8c0cea0c8b992177b2fb6befade774c2491d94c72a1bf859f9b79d44755be05dcd64  gdb-arc-2016.09-release-gdb.tar.gz
+sha512  aa8e2df52d75089f436f1692bbe348e641fa356822b9a116601df68963cdc203f220cbe3569d8721fecd5c6bbbfcaf2a1a2ee7296b0ee895f7e321951ca4c3c7  gdb-arc-2017.03-eng008-gdb.tar.gz
-- 
2.7.4
