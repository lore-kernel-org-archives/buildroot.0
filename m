From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 23 May 2017 21:41:37 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03 release
Message-ID: <20170523184137.48708-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit finally bumps ARC toolchain to arc-2017.03 release.
More info on this release could be found here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.03

Note mentioned above web-page is not yet populated but should be very soon.
As a safe fall-back interested could refer to RC2 page here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.03-rc2

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |  2 +-
 .../0300-PATCH-ld-makefile.patch                   |  0
 .../0301-PATCH-check-ldrunpath-length.patch        |  0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |  0
 .../0600-poison-system-directories.patch           |  0
 package/binutils/binutils.hash                     |  2 +-
 package/binutils/binutils.mk                       |  2 +-
 package/gcc/Config.in.host                         |  2 +-
 ...-return-false-for-any-PIC-related-unspecs.patch | 58 ----------------------
 .../301-missing-execinfo_h.patch                   |  0
 .../860-cilk-wchar.patch                           |  0
 .../940-uclinux-enable-threads.patch               |  0
 package/gcc/gcc.hash                               |  2 +-
 package/gdb/Config.in.host                         |  2 +-
 package/gdb/gdb.hash                               |  2 +-
 15 files changed, 7 insertions(+), 65 deletions(-)
 rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0300-PATCH-ld-makefile.patch (100%)
 rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0301-PATCH-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0600-poison-system-directories.patch (100%)
 delete mode 100644 package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch
 rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/860-cilk-wchar.patch (100%)
 rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/940-uclinux-enable-threads.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9e89e57b85..03ddf62cbc 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -23,7 +23,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2017.03-rc2"	if BR2_arc
+	default "arc-2017.03"	if BR2_arc
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28"		if BR2_BINUTILS_VERSION_2_28_X
diff --git a/package/binutils/arc-2017.03-rc2/0300-PATCH-ld-makefile.patch b/package/binutils/arc-2017.03/0300-PATCH-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc2/0300-PATCH-ld-makefile.patch
rename to package/binutils/arc-2017.03/0300-PATCH-ld-makefile.patch
diff --git a/package/binutils/arc-2017.03-rc2/0301-PATCH-check-ldrunpath-length.patch b/package/binutils/arc-2017.03/0301-PATCH-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc2/0301-PATCH-check-ldrunpath-length.patch
rename to package/binutils/arc-2017.03/0301-PATCH-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2017.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2017.03/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc2/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2017.03/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2017.03-rc2/0600-poison-system-directories.patch b/package/binutils/arc-2017.03/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2017.03-rc2/0600-poison-system-directories.patch
rename to package/binutils/arc-2017.03/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 486bf37d37..5a7062004e 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12c
 sha512	ede2e4e59a800260eea8c14eafbaee94e30abadafd5c419a3370f9f62213cf027d6400a1d4970b6958bd4d220e675dcd483a708107016e7abd5c99d7392ba8fd  binutils-2.28.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  577fbd59dc8d41022ed511b86f3afc49af48ab798a7b187411a466621dc6247dff7dd84fa110ca278f09a9e523d8bdb892a233c00bf47d11b92be70e7278efe9  binutils-arc-2017.03-rc2.tar.gz
+sha512  07d5639e74eafe8fced259870c1a7dedee67c534573dda53fb78ee1ffeec9e17479fdde41dccd03b1cf0248023acbef7f66013398b2f722e4a8891ac680d1d16  binutils-arc-2017.03.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index bc0268eea4..0dc20a082d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2017.03-rc2
+BINUTILS_VERSION = arc-2017.03
 else
 BINUTILS_VERSION = 2.27
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ba4063d3ea..5a0fd970b8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -106,7 +106,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.3.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2017.03-rc2" if BR2_GCC_VERSION_ARC
+	default "arc-2017.03" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch b/package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch
deleted file mode 100644
index ea9708240e..0000000000
--- a/package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 139fed9d29ab935b3bc5159c0bdf7b8b8a39442d Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@gmail.com>
-Date: Mon, 15 May 2017 05:05:27 -0400
-Subject: [PATCH] [FIX] PIC: return false for any PIC related  unspecs
-
----
- gcc/config/arc/arc.c                        |  9 ++++-----
- gcc/testsuite/gcc.target/arc/pr9001191897.c | 10 ++++++++++
- 2 files changed, 14 insertions(+), 5 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/arc/pr9001191897.c
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 3d53a667d37f..b00126f4d2c4 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -6056,11 +6056,8 @@ arc_legitimate_constant_p (machine_mode mode, rtx x)
-       return true;
- 
-     case NEG:
--      /* Assembler does not understand -(@label at gotoff).  Also, we do
--	 not print such pic address constant.  */
--      if (GET_CODE (XEXP (x, 0)) == UNSPEC)
--	return false;
-       return arc_legitimate_constant_p (mode, XEXP (x, 0));
-+
-     case PLUS:
-     case MINUS:
-       {
-@@ -6090,7 +6087,9 @@ arc_legitimate_constant_p (machine_mode mode, rtx x)
- 	case UNSPEC_TLS_IE:
- 	  return true;
- 	default:
--	  break;
-+	  /* Any other unspec ending here are pic related, hence the above
-+	     constant pic address checking returned false.  */
-+	  return false;
- 	}
-       /* Fall through.  */
- 
-diff --git a/gcc/testsuite/gcc.target/arc/pr9001191897.c b/gcc/testsuite/gcc.target/arc/pr9001191897.c
-new file mode 100644
-index 000000000000..2b9e1689803f
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/arc/pr9001191897.c
-@@ -0,0 +1,10 @@
-+/* { dg-do compile } */
-+/* { dg-skip-if "" { ! { clmcpu } } } */
-+/* { dg-options "-mcpu=arch2 -Os -fpic -mno-sdata -mno-indexed-loads -w" } */
-+a;
-+c() {
-+  static char b[25];
-+  for (; a >= 0; a--)
-+    if (b[a])
-+      b[a] = '\0';
-+}
--- 
-2.7.4
-
diff --git a/package/gcc/arc-2017.03-rc2/301-missing-execinfo_h.patch b/package/gcc/arc-2017.03/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2017.03-rc2/301-missing-execinfo_h.patch
rename to package/gcc/arc-2017.03/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2017.03-rc2/860-cilk-wchar.patch b/package/gcc/arc-2017.03/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2017.03-rc2/860-cilk-wchar.patch
rename to package/gcc/arc-2017.03/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2017.03-rc2/940-uclinux-enable-threads.patch b/package/gcc/arc-2017.03/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2017.03-rc2/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2017.03/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4313f157cb..db59bae309 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,6 +12,6 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78  gcc-6.3.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  8157d784367de2de853f7d288a213ee3222ac77321d18a887cd5a9c55b53f5948cc8608ec82398cb7e0a155ffa79f86f6469a23b505b22cd0eb5b69d610abd41  gcc-arc-2017.03-rc2.tar.gz
+sha512  282f76b8b63372f5b4426092b80d36da96cd0bda2a8588405b9ec22806c69fafb696b0e0df65bc36c3c3aa8ce5befc24246fd5c6ddb21dcde01f45f7b11ff7c4  gcc-arc-2017.03.tar.gz
 # Locally calculated (fetched from Github)
 sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index b1f0b5569c..cd763aa9be 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -55,7 +55,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2017.03-rc2-gdb" if BR2_arc
+	default "arc-2017.03-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 32526d55b6..b0f8a6e042 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-sha512  275241c215d0bd32ab0f9f16358c46a66fd0d5db09d9a148b169a6b8135cfe91c6240a6bb75977573d4fc449a98f0702254577cbdc4598c6153ebbdca39253cf	gdb-arc-2017.03-rc2-gdb.tar.gz
+sha512  8ec849a5ea1c16f104c51c4813c35ab229e460eef0025967673b87316f62b5171f05448cda018464914d43d2da50b2902eb7f9f060d0af1368a9db111f959668	gdb-arc-2017.03-gdb.tar.gz
-- 
2.11.0
