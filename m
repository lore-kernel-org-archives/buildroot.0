Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5CDFCA188
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 20:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D424260877;
	Mon,  9 Mar 2026 20:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8z7KKwxOLG3e; Mon,  9 Mar 2026 20:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79BD6126A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773089674;
	bh=BLiIfTUsYg4Wg5sxptdLEn+vG9uzfxY9HgZTObL0Ddw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G6O0eGw+ZY8oz6CUOam4Cylj/lFg+RXQVBmMzL3lktuWfpGeb30prxKzm7mkt0ZW4
	 wSbDjcO2K6i130/aVpbgrfEVcXiaFhtOv3KZl6ETHi4WhDuXyFa4sipFrG06YKqoM6
	 CrAXSwVQixrbTb7l8s0urHCGTUqzExwouCDbdF5tUpcvbYTU+KbGfr491+XJyHrimW
	 EMOf+GSZZQ7GVMQgMcU3IeD8GMTmxBOkkN54iWy+PrHm/xLrKHlfaxPppRfw0Lm90D
	 2E4z5+0SWVAL4hEFRFzQnJ99RxMoBGpn2HNwbNfnr+eSbHwPV6dsKuFZjT/+fLZkuj
	 KXzSc2UE6JLaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79BD6126A;
	Mon,  9 Mar 2026 20:54:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D52EC35C
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6E486126A
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEp0lFEzItiD for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 20:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE02B60837
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE02B60837
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 20:54:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB3FB86415; Mon,  9 Mar 2026 20:54:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Mar 2026 21:52:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 489c57a8e91a2870198b969e446e6a85638a3a65
X-Git-Newrev: b1983c1c117f2f952f885474dd973e1d6f49675b
X-Patchwork-Hint: ignore
Message-Id: <20260309205431.EB3FB86415@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: bump version to 1.47.4,
 remove autoreconf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4898425165676310182=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4898425165676310182==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1983c1c117f2f952f885474dd973e1d6f49675b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.47.4.txt

Removed patch 0001 which is included in this release:
https://github.com/tytso/e2fsprogs/commit/4aba12dc19a95626eb7fa1df2d19c5235c2bc848

Also removed autoreconf and its dependencies which were necessary for
patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix changelog url in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...c-check-for-FS_IOC_READ_VERITY_METADATA-a.patch | 103 ---------------------
 package/e2fsprogs/e2fsprogs.hash                   |   4 +-
 package/e2fsprogs/e2fsprogs.mk                     |   9 +-
 3 files changed, 3 insertions(+), 113 deletions(-)

diff --git a/package/e2fsprogs/0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch b/package/e2fsprogs/0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
deleted file mode 100644
index 36442a53b8..0000000000
--- a/package/e2fsprogs/0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 1a2ce8cd956065106ae27a36a5000f00ebc4591f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 22 Nov 2025 21:12:23 +0100
-Subject: [PATCH] configure.ac: check for FS_IOC_READ_VERITY_METADATA
- availability
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 6bfa843b4435334ac073e42950b48d8bacb54977 ("mke2fs: enable
-copying of fs-verity metadata") introduced support for reading
-fs-verity metadata, which requires using the
-FS_IOC_READ_VERITY_METADATA.
-
-The code is conditionally compiled when the kernel headers have
-<linux/fsverity.h> available. Unfortunately, this check is not
-sufficient: <linux/fsverity.h> was introduced in Linux 5.10, but the
-FS_IOC_READ_VERITY_METADATA was not introduced before 5.12, so if one
-is using 5.10 or 5.11 kernel headers, the build fails with:
-
-./../misc/create_inode.c: In function ‘copy_fs_verity_data’:
-./../misc/create_inode.c:589:10: error: variable ‘arg’ has initializer but incomplete type
-  589 |   struct fsverity_read_metadata_arg arg = {
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
-[...]
-./../misc/create_inode.c:600:20: error: ‘FS_IOC_READ_VERITY_METADATA’ undeclared (first use in this function)
-  600 |   size = ioctl(fd, FS_IOC_READ_VERITY_METADATA, &arg);
-      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This commit therefore extends the configure.ac check to ensure that
-not only <linux/fsverity.h> exists but also that it defines the
-FS_IOC_READ_VERITY_METADATA ioctl.
-
-Upstream: https://github.com/tytso/e2fsprogs/pull/256
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac        | 18 ++++++++++++++++++
- misc/create_inode.c |  6 +++---
- 2 files changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a0171163..3e5586a3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1997,6 +1997,24 @@ OS_IO_FILE=""
- esac]
- AC_SUBST(OS_IO_FILE)
- 
-+dnl Check for fsverity ioctl
-+if test "${ac_cv_header_linux_fsverity_h}" = "yes"; then
-+   AC_MSG_CHECKING([for FS_IOC_READ_VERITY_METADATA ioctl])
-+   AC_PREPROC_IFELSE(
-+   [AC_LANG_PROGRAM([[
-+#include <linux/fsverity.h>
-+#ifndef FS_IOC_READ_VERITY_METADATA
-+# error "FS_IOC_READ_VERITY_METADATA not available"
-+#endif
-+]], [])], [
-+   AC_DEFINE([HAVE_FS_IOC_READ_VERITY_METADATA], [1], [Define to 1 if FS_IOC_READ_VERITY_METADATA ioctl is available])
-+   AC_MSG_RESULT([yes])
-+   ],
-+   [
-+   AC_MSG_RESULT([no])
-+   ])
-+fi
-+
- dnl
- dnl Make our output files, being sure that we create the some miscellaneous 
- dnl directories
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 624efc03..a7918873 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -30,7 +30,7 @@
- #ifdef HAVE_SYS_SYSMACROS_H
- #include <sys/sysmacros.h>
- #endif
--#ifdef HAVE_LINUX_FSVERITY_H
-+#if defined(HAVE_LINUX_FSVERITY_H) && defined(HAVE_FS_IOC_READ_VERITY_METADATA)
- #include <linux/fsverity.h>
- #include <linux/fs.h>
- #endif
-@@ -569,7 +569,7 @@ out:
- }
- #endif /* FS_IOC_FIEMAP */
- 
--#ifdef HAVE_LINUX_FSVERITY_H
-+#if defined(HAVE_LINUX_FSVERITY_H) && defined(HAVE_FS_IOC_READ_VERITY_METADATA)
- static inline off_t round_up(off_t n, off_t blksz, off_t bias)
- {
-   return ((n - bias + (blksz - 1)) & ~(blksz - 1)) + bias;
-@@ -738,7 +738,7 @@ static errcode_t copy_file(ext2_filsys fs, int fd, struct stat *statbuf,
- 		err = copy_file_chunk(fs, fd, e2_file, 0, statbuf->st_size, buf,
- 				      zerobuf);
- 
--#ifdef HAVE_LINUX_FSVERITY_H
-+#if defined(HAVE_LINUX_FSVERITY_H) && defined(HAVE_FS_IOC_READ_VERITY_METADATA)
- 	if (!err && (flags & EXT4_VERITY_FL))
- 		err = copy_fs_verity(fs, fd, e2_file, statbuf->st_size);
- #endif
--- 
-2.51.1
-
diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 3afae18f20..1455457152 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.3/sha256sums.asc
-sha256  857e6ef800feaa2bb4578fbc810214be5d3c88b072ea53c5384733a965737329  e2fsprogs-1.47.3.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.4/sha256sums.asc
+sha256  fd5bf388cbdbe006a3d3b318d983b2948382440acc85a87f1e7d108653e8db0b  e2fsprogs-1.47.4.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ad3d1dbe75..d9ebf4c73d 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.47.3
+E2FSPROGS_VERSION = 1.47.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
@@ -18,13 +18,6 @@ E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
 
-# 0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
-# the additional dependencies are only needed for autoreconf
-E2FSPROGS_AUTORECONF = YES
-E2FSPROGS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
-E2FSPROGS_DEPENDENCIES += host-gettext host-autoconf-archive
-HOST_E2FSPROGS_DEPENDENCIES += host-gettext host-autoconf-archive
-
 E2FSPROGS_SELINUX_MODULES = fstools
 
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't

--===============4898425165676310182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4898425165676310182==--
