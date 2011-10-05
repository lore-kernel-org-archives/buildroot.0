From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 16:56:53 +0200
Subject: [Buildroot] [git commit] toolchain/gdb: fixup version strings
Message-ID: <20111005150454.C59F68DEC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e23d0d7dd25dcd7cfcee171a2ffd3348b75afa3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gdb tarballs have been re-released after a GPL compliance
issue was found:
  http://sourceware.org/ml/gdb/2011-09/msg00030.html

So all versions were re-packaged.

In the process, an 'a' was appended to the version strings, and
unlike the binutils people, the gdb folks are not inclined in
providing legacy symlinks:
  http://sourceware.org/ml/gdb/2011-09/msg00036.html

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

[Peter: fixup patch to apply to head, don't rename config symbols]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/{6.6 => 6.6a}/100-uclibc-conf.patch  |    0
 .../600-fix-compile-flag-mismatch.patch            |    0
 .../gdb/{6.6 => 6.6a}/gdb-6.6-bfin-gdbserver.patch |    0
 .../600-fix-compile-flag-mismatch.patch            |    0
 toolchain/gdb/Config.in                            |    8 ++++----
 5 files changed, 4 insertions(+), 4 deletions(-)

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
diff --git a/toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.8a/600-fix-compile-flag-mismatch.patch
similarity index 100%
rename from toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch
rename to toolchain/gdb/6.8a/600-fix-compile-flag-mismatch.patch
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 28279a3..a5dc71c 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -66,9 +66,9 @@ endchoice
 
 config BR2_GDB_VERSION
 	string
-	default "6.6"      if BR2_GDB_VERSION_6_6
+	default "6.6a"     if BR2_GDB_VERSION_6_6
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-	default "6.8"      if BR2_GDB_VERSION_6_8
-	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
-	default "7.1"      if BR2_GDB_VERSION_7_1
+	default "6.8a"     if BR2_GDB_VERSION_6_8
+	default "7.0.1a"   if BR2_GDB_VERSION_7_0_1
+	default "7.1a"     if BR2_GDB_VERSION_7_1
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
