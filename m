From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 11 Sep 2011 17:38:10 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain/gdb: fixup version strings
In-Reply-To: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1315755490-9920-5-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The binutils tarballs have been re-released after a GPL compliance
issue was found:
  http://sourceware.org/ml/binutils/2011-08/msg00198.html

So all versions were re-packaged.

In the process, an 'a' was appended to the version strings.

So, this patch fixes the issue by renaming version strings. It is to be
noted that, although the versions got bumped to include an 'a' at the end,
the directory contained in the tarball is still named after the version
string without the 'a'. For example:
 - old version      : 6.6
 - new version      : 6.6a
 - tarball name     : gdb-6.6a.tar.bz2
 - directory name   : gdb-6.6/

In fact, it does not pose any problem for buildroot, as the extract process
explicitly mkdirs the directory to extract into, *and* strips the first level
of the tree extracted from the tarball.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/gdb/{6.6 => 6.6a}/100-uclibc-conf.patch  |    0
 .../600-fix-compile-flag-mismatch.patch            |    0
 .../gdb/{6.6 => 6.6a}/gdb-6.6-bfin-gdbserver.patch |    0
 .../600-fix-compile-flag-mismatch.patch            |    0
 .../600-fix-compile-flag-mismatch.patch            |    0
 toolchain/gdb/Config.in                            |   30 ++++++++++----------
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/toolchain/gdb/6.6/100-uclibc-conf.patch b/toolchain/gdb/6.6a/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gdb/6.6/100-uclibc-conf.patch
rename to toolchain/gdb/6.6a/100-uclibc-conf.patch
diff --git a/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
similarity index 100%
rename from toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch
rename to toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
diff --git a/toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch b/toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
similarity index 100%
rename from toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch
rename to toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
diff --git a/toolchain/gdb/6.7.1/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.7.1a/600-fix-compile-flag-mismatch.patch
similarity index 100%
rename from toolchain/gdb/6.7.1/600-fix-compile-flag-mismatch.patch
rename to toolchain/gdb/6.7.1a/600-fix-compile-flag-mismatch.patch
diff --git a/toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.8a/600-fix-compile-flag-mismatch.patch
similarity index 100%
rename from toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch
rename to toolchain/gdb/6.8a/600-fix-compile-flag-mismatch.patch
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8295f79..23e9624 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -32,30 +32,30 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_6_6
-		bool "gdb 6.6"
+	config BR2_GDB_VERSION_6_6a
+		bool "gdb 6.6a"
 		depends on !BR2_avr32
 		depends on BR2_DEPRECATED || BR2_bfin
 
-	config BR2_GDB_VERSION_6_7_1
+	config BR2_GDB_VERSION_6_7_1a
 		depends on !(BR2_avr32 || BR2_bfin)
-		bool "gdb 6.7.1"
+		bool "gdb 6.7.1a"
 
 	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
 		depends on BR2_avr32
 		bool "gdb 6.7.1-avr32-2.1.5"
 
-	config BR2_GDB_VERSION_6_8
-		bool "gdb 6.8"
+	config BR2_GDB_VERSION_6_8a
+		bool "gdb 6.8a"
 		depends on !(BR2_avr32 || BR2_bfin)
 
-	config BR2_GDB_VERSION_7_0_1
-		bool "gdb 7.0.1"
+	config BR2_GDB_VERSION_7_0_1a
+		bool "gdb 7.0.1a"
 		depends on !BR2_bfin
 		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
 
-	config BR2_GDB_VERSION_7_1
-		bool "gdb 7.1"
+	config BR2_GDB_VERSION_7_1a
+		bool "gdb 7.1a"
 		depends on !BR2_bfin
 		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
 
@@ -63,9 +63,9 @@ endchoice
 
 config BR2_GDB_VERSION
 	string
-	default "6.6"      if BR2_GDB_VERSION_6_6
-	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
+	default "6.6a"     if BR2_GDB_VERSION_6_6a
+	default "6.7.1a"   if BR2_GDB_VERSION_6_7_1a
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-	default "6.8"      if BR2_GDB_VERSION_6_8
-	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
-	default "7.1"      if BR2_GDB_VERSION_7_1
+	default "6.8a"     if BR2_GDB_VERSION_6_8a
+	default "7.0.1a"   if BR2_GDB_VERSION_7_0_1a
+	default "7.1a"     if BR2_GDB_VERSION_7_1a
-- 
1.7.2.5
