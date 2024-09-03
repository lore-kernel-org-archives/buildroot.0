Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A958CD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05F5B403F6;
	Tue,  3 Sep 2024 20:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyYRsOB7ADGt; Tue,  3 Sep 2024 20:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E3E4046D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E3E4046D;
	Tue,  3 Sep 2024 20:41:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 127561BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 005C560687
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11U79tmBsBvE for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B98F560679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B98F560679
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A78B786CAE; Tue,  3 Sep 2024 20:41:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:37:51 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5aa45c4e00d9197cda147dbb4b92d100cffff038
X-Git-Newrev: 726588f81cb3a8687b3b350e5aae006fde90fa59
X-Patchwork-Hint: ignore
Message-Id: <20240903204146.A78B786CAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zfs: replace wip
 patch by upstream patch
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8600425803535291607=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8600425803535291607==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=726588f81cb3a8687b3b350e5aae006fde90fa59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 08edb3c22a61b6de28e1472faceaebc3399b6537)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...S-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch |  70 +++++++++
 ..._files-ignore-if-SEEK_DATA-is-not-defined.patch | 162 ---------------------
 package/zfs/zfs.mk                                 |   3 -
 3 files changed, 70 insertions(+), 165 deletions(-)

diff --git a/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch b/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
new file mode 100644
index 0000000000..64972c4f57
--- /dev/null
+++ b/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
@@ -0,0 +1,70 @@
+From 2ccefd4aff98cf355c7d13b3f92bb4d390dfa522 Mon Sep 17 00:00:00 2001
+From: Tino Reichardt <milky-zfs@mcmilk.de>
+Date: Sun, 4 Aug 2024 11:58:13 +0200
+Subject: [PATCH] ZTS: small fix for SEEK_DATA/SEEK_HOLE tests
+
+Some libc's like uClibc lag the proper definition of SEEK_DATA
+and SEEK_HOLE. Since we have only two files in ZTS which use
+these definitons, let's define them by hand:
+
+```
+#ifndef SEEK_DATA
+#define SEEK_DATA 3
+#endif
+#ifndef SEEK_HOLE
+#define SEEK_HOLE 4
+#endif
+```
+
+There should be no failures, because:
+- FreeBSD has support for SEEK_DATA/SEEK_HOLE since FreeBSD 8
+- Linux has it since Linux 3.1
+- the libc will submit the parameters unchanged to the kernel
+
+Signed-off-by: Tino Reichardt <milky-zfs@mcmilk.de>
+Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
+Upstream: https://github.com/openzfs/zfs/commit/bd949b10bed3d99e3b40249d9c8d74a0b4304774
+---
+ tests/zfs-tests/cmd/mmap_seek.c                       | 10 ++++++++++
+ tests/zfs-tests/tests/functional/cp_files/seekflood.c |  7 +++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/tests/zfs-tests/cmd/mmap_seek.c b/tests/zfs-tests/cmd/mmap_seek.c
+index 7be92d109565..2d250554a13f 100644
+--- a/tests/zfs-tests/cmd/mmap_seek.c
++++ b/tests/zfs-tests/cmd/mmap_seek.c
+@@ -35,6 +35,16 @@
+ #include <linux/fs.h>
+ #endif
+ 
++/* some older uClibc's lack the defines, so we'll manually define them */
++#ifdef	__UCLIBC__
++#ifndef	SEEK_DATA
++#define	SEEK_DATA 3
++#endif
++#ifndef	SEEK_HOLE
++#define	SEEK_HOLE 4
++#endif
++#endif
++
+ static void
+ seek_data(int fd, off_t offset, off_t expected)
+ {
+diff --git a/tests/zfs-tests/tests/functional/cp_files/seekflood.c b/tests/zfs-tests/tests/functional/cp_files/seekflood.c
+index 02c2c8e6eca5..f832db85970d 100644
+--- a/tests/zfs-tests/tests/functional/cp_files/seekflood.c
++++ b/tests/zfs-tests/tests/functional/cp_files/seekflood.c
+@@ -36,6 +36,13 @@
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+ 
++/* some older uClibc's lack the defines, so we'll manually define them */
++#ifdef	__UCLIBC__
++#ifndef	SEEK_DATA
++#define	SEEK_DATA 3
++#endif
++#endif
++
+ #define	DATASIZE	(4096)
+ char data[DATASIZE];
+ 
diff --git a/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patch b/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patch
deleted file mode 100644
index f47c615d10..0000000000
--- a/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 93e7f8889072047276da11fe6a525d3f0ea16205 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
- <salvador.joseluis@gmail.com>
-Date: Sat, 11 May 2024 22:40:12 +0200
-Subject: [PATCH] tests/cp_files: ignore if SEEK_DATA is not defined
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Not all C libraries support SEEK_DATA (e.g., uClibc). Skip the test case
-cp_files if SEEK_DATA is not defined.
-
-Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
-Upstream: https://github.com/openzfs/zfs/pull/16169
----
- config/user-unistd.m4                  | 24 ++++++++++++++++++++++++
- config/user.m4                         |  1 +
- config/zfs-build.m4                    |  1 +
- tests/test-runner/bin/zts-report.py.in |  1 +
- tests/zfs-tests/Makefile.am            |  2 ++
- tests/zfs-tests/cmd/Makefile.am        |  6 +++++-
- tests/zfs-tests/tests/Makefile.am      | 14 +++++++++-----
- 7 files changed, 43 insertions(+), 6 deletions(-)
- create mode 100644 config/user-unistd.m4
-
-diff --git a/config/user-unistd.m4 b/config/user-unistd.m4
-new file mode 100644
-index 000000000..302bc0bde
---- /dev/null
-+++ b/config/user-unistd.m4
-@@ -0,0 +1,24 @@
-+dnl #
-+dnl # Check for SEEK_DATA - only used for cp_files/seekflood test case.
-+dnl #
-+AC_DEFUN([ZFS_AC_CONFIG_USER_UNISTD_SEEK_DATA], [
-+	AC_MSG_CHECKING(whether host toolchain supports SEEK_DATA)
-+
-+	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-+		#ifndef _GNU_SOURCE
-+		#define _GNU_SOURCE
-+		#endif
-+		#include <unistd.h>
-+		#if defined(SEEK_DATA)
-+			int ok;
-+		#else
-+			error fail
-+		#endif
-+	]])], [
-+		user_unistd_seek_data=yes
-+		AC_MSG_RESULT([yes])
-+	], [
-+		user_unistd_seek_data=no
-+		AC_MSG_RESULT([no])
-+	])
-+])
-diff --git a/config/user.m4 b/config/user.m4
-index 6ec27a5b2..2326a44be 100644
---- a/config/user.m4
-+++ b/config/user.m4
-@@ -23,6 +23,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [
- 	ZFS_AC_CONFIG_USER_LIBAIO
- 	ZFS_AC_CONFIG_USER_LIBATOMIC
- 	ZFS_AC_CONFIG_USER_LIBFETCH
-+	ZFS_AC_CONFIG_USER_UNISTD_SEEK_DATA
- 	ZFS_AC_CONFIG_USER_AIO_H
- 	ZFS_AC_CONFIG_USER_CLOCK_GETTIME
- 	ZFS_AC_CONFIG_USER_PAM
-diff --git a/config/zfs-build.m4 b/config/zfs-build.m4
-index bb5a85d81..578692676 100644
---- a/config/zfs-build.m4
-+++ b/config/zfs-build.m4
-@@ -294,6 +294,7 @@ AC_DEFUN([ZFS_AC_CONFIG], [
- 	    [test "x$qatsrc" != x ])
- 	AM_CONDITIONAL([WANT_DEVNAME2DEVID], [test "x$user_libudev" = xyes ])
- 	AM_CONDITIONAL([WANT_MMAP_LIBAIO], [test "x$user_libaio" = xyes ])
-+	AM_CONDITIONAL([WANT_UNISTD_SEEK_DATA], [test "x$user_unistd_seek_data" = xyes ])
- 	AM_CONDITIONAL([PAM_ZFS_ENABLED], [test "x$enable_pam" = xyes])
- ])
- 
-diff --git a/tests/test-runner/bin/zts-report.py.in b/tests/test-runner/bin/zts-report.py.in
-index ecc50f487..3a00345ed 100755
---- a/tests/test-runner/bin/zts-report.py.in
-+++ b/tests/test-runner/bin/zts-report.py.in
-@@ -162,6 +162,7 @@ known = {
-         ['FAIL', rewind_reason],
-     'cli_user/misc/zfs_share_001_neg': ['SKIP', na_reason],
-     'cli_user/misc/zfs_unshare_001_neg': ['SKIP', na_reason],
-+    'cp_files/cp_stress': ['SKIP', 16169],
-     'pool_checkpoint/checkpoint_discard_busy': ['SKIP', 12053],
-     'privilege/setup': ['SKIP', na_reason],
-     'refreserv/refreserv_004_pos': ['FAIL', known_reason],
-diff --git a/tests/zfs-tests/Makefile.am b/tests/zfs-tests/Makefile.am
-index 3dd1a6452..8ae790057 100644
---- a/tests/zfs-tests/Makefile.am
-+++ b/tests/zfs-tests/Makefile.am
-@@ -13,8 +13,10 @@ scripts_zfs_tests_functional_hkdf_PROGRAMS = %D%/tests/functional/hkdf/hkdf_test
- %C%_tests_functional_hkdf_hkdf_test_LDADD = \
- 	libzpool.la
- 
-+if WANT_UNISTD_SEEK_DATA
- scripts_zfs_tests_functional_cp_filesdir = $(datadir)/$(PACKAGE)/zfs-tests/tests/functional/cp_files
- scripts_zfs_tests_functional_cp_files_PROGRAMS = %D%/tests/functional/cp_files/seekflood
-+endif
- 
- if BUILD_LINUX
- scripts_zfs_tests_functional_tmpfiledir = $(datadir)/$(PACKAGE)/zfs-tests/tests/functional/tmpfile
-diff --git a/tests/zfs-tests/cmd/Makefile.am b/tests/zfs-tests/cmd/Makefile.am
-index 23848a82f..69bba3039 100644
---- a/tests/zfs-tests/cmd/Makefile.am
-+++ b/tests/zfs-tests/cmd/Makefile.am
-@@ -5,7 +5,6 @@ scripts_zfs_tests_bin_PROGRAMS  = %D%/chg_usr_exec
- scripts_zfs_tests_bin_PROGRAMS += %D%/clonefile
- scripts_zfs_tests_bin_PROGRAMS += %D%/clone_mmap_cached
- scripts_zfs_tests_bin_PROGRAMS += %D%/clone_mmap_write
--scripts_zfs_tests_bin_PROGRAMS += %D%/cp_files
- scripts_zfs_tests_bin_PROGRAMS += %D%/ctime
- scripts_zfs_tests_bin_PROGRAMS += %D%/dir_rd_update
- scripts_zfs_tests_bin_PROGRAMS += %D%/dosmode_readonly_write
-@@ -16,6 +15,11 @@ scripts_zfs_tests_bin_PROGRAMS += %D%/truncate_test
- scripts_zfs_tests_bin_PROGRAMS += %D%/zfs_diff-socket
- 
- 
-+if WANT_UNISTD_SEEK_DATA
-+scripts_zfs_tests_bin_PROGRAMS += %D%/cp_files
-+endif
-+
-+
- scripts_zfs_tests_bin_PROGRAMS += %D%/badsend
- %C%_badsend_LDADD = \
- 	libzfs_core.la \
-diff --git a/tests/zfs-tests/tests/Makefile.am b/tests/zfs-tests/tests/Makefile.am
-index cc66d762f..1e9f06a7e 100644
---- a/tests/zfs-tests/tests/Makefile.am
-+++ b/tests/zfs-tests/tests/Makefile.am
-@@ -1394,11 +1394,6 @@ nobase_dist_datadir_zfs_tests_tests_SCRIPTS += \
- 	functional/compression/l2arc_encrypted.ksh \
- 	functional/compression/l2arc_encrypted_no_compressed_arc.ksh \
- 	functional/compression/setup.ksh \
--	functional/cp_files/cleanup.ksh \
--	functional/cp_files/cp_files_001_pos.ksh \
--	functional/cp_files/cp_files_002_pos.ksh \
--	functional/cp_files/cp_stress.ksh \
--	functional/cp_files/setup.ksh \
- 	functional/crtime/cleanup.ksh \
- 	functional/crtime/crtime_001_pos.ksh \
- 	functional/crtime/setup.ksh \
-@@ -2108,3 +2103,12 @@ nobase_dist_datadir_zfs_tests_tests_SCRIPTS += \
- 	functional/idmap_mount/idmap_mount_003.ksh \
- 	functional/idmap_mount/idmap_mount_004.ksh \
- 	functional/idmap_mount/idmap_mount_005.ksh
-+
-+if WANT_UNISTD_SEEK_DATA
-+nobase_dist_datadir_zfs_tests_tests_SCRIPTS += \
-+	functional/cp_files/cleanup.ksh \
-+	functional/cp_files/cp_files_001_pos.ksh \
-+	functional/cp_files/cp_files_002_pos.ksh \
-+	functional/cp_files/cp_stress.ksh \
-+	functional/cp_files/setup.ksh
-+endif
--- 
-2.45.2
-
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index e0fa392670..e51ade55a4 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -12,9 +12,6 @@ ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
 ZFS_CPE_ID_PRODUCT = openzfs
 
-# 0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patch
-ZFS_AUTORECONF = YES
-
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl linux
 
 # sysvinit installs only a commented-out modules-load.d/ config file

--===============8600425803535291607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8600425803535291607==--
