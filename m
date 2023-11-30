Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0719AC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD9060674;
	Thu, 30 Nov 2023 08:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD9060674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1-FresheEpb; Thu, 30 Nov 2023 08:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA5E86F518;
	Thu, 30 Nov 2023 08:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA5E86F518
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85F1D1BF983
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5773760608
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5773760608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrGJ4q-dZhuK for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B12D61B3A
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B12D61B3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3457D87602; Thu, 30 Nov 2023 08:38:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 09:08:28 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: b1a3096f1c65cf1f0d605a1e596cbcf41fbf31bf
X-Git-Newrev: 76699a7770cbee6e35a417e3cda0310a832af434
X-Patchwork-Hint: ignore
Message-Id: <20231130083815.3457D87602@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/zfs: don't
 download patch generated from github
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
Content-Type: multipart/mixed; boundary="===============2770570890747655524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2770570890747655524==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=76699a7770cbee6e35a417e3cda0310a832af434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Git-generated patches embed the short-hash of the objects in the
repository. The length of those short hashes are subject to change
in at least three cases:

  - the number of objects in the repository increases, so git increases
    the length of short hashes to get a good change there is no
    collision;

  - the git configuration changes, see core.abbrev in git-config;

  - the heuristic to compute the length changes in a newer git version.

Since the bump to zfs 2.1.4 in commit 68dfd09708c6, the patch generated
by github has changed, causing download failures:

    wget --passive-ftp -nd -t 3 -O '/home/ymorin/dev/buildroot/O/master/build/.bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch.uoFq9e/output' 'https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch'
    --2023-11-26 16:53:25--
    https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
    Resolving github.com (github.com)... 140.82.121.3
    Connecting to github.com (github.com)|140.82.121.3|:443...  connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 2976 (2.9K) [text/plain]
    Saving to: ‘/home/ymorin/dev/buildroot/O/master/build/.bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch.uoFq9e/output’

    /home/ymorin/dev/buildroot/O/ 100%[================================================>]   2.91K --.-KB/s in 0s

    2023-11-26 16:53:25 (15.0 MB/s) - ‘/home/ymorin/dev/buildroot/O/master/build/.bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch.uoFq9e/output’ saved [2976/2976]

    ERROR: while checking hashes from package/zfs//zfs.hash
    ERROR: bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch has wrong sha256 hash:
    ERROR: expected: 96a27353fe717ff2c8b95deb8b009c4eb750303c6400e2d8a2582ab1ec12b25a
    ERROR: got     : 246c80f66abca5a7e0c41cc7c56eec0b4cb7f16b142262480401142bbc2f999f
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack

And indeed, the length of short hashes has increased by one since then.

Fix that by bundling the patch, with the short hashes that were known
then, so that it matches the sha256 we had for it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2c3946fcb45b07db5cc88cdc944745aa1ef8fa04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zfs/0001-config-user-check-for-aio.h.patch | 94 ++++++++++++++++++++++
 package/zfs/zfs.hash                               |  1 -
 package/zfs/zfs.mk                                 |  3 +-
 3 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/package/zfs/0001-config-user-check-for-aio.h.patch b/package/zfs/0001-config-user-check-for-aio.h.patch
new file mode 100644
index 0000000000..55321ee2fc
--- /dev/null
+++ b/package/zfs/0001-config-user-check-for-aio.h.patch
@@ -0,0 +1,94 @@
+From bc3f12bfac152a0c28951cec92340ba14f9ccee9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=BD=D0=B0=D0=B1?= <nabijaczleweli@nabijaczleweli.xyz>
+Date: Mon, 28 Mar 2022 19:24:22 +0200
+Subject: [PATCH] config: user: check for <aio.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+And always zpool_read_label_slow() on non-conformant libcs
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Co-authored-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
+Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
+Closes #13207
+Closes #13254
+Upstream: https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9
+[yann.morin.1998@free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ config/user-aio.h.m4        | 7 +++++++
+ config/user-libaio.m4       | 2 +-
+ config/user.m4              | 1 +
+ lib/libzutil/zutil_import.c | 6 ++++++
+ 4 files changed, 15 insertions(+), 1 deletion(-)
+ create mode 100644 config/user-aio.h.m4
+
+diff --git a/config/user-aio.h.m4 b/config/user-aio.h.m4
+new file mode 100644
+index 00000000000..152c0946722
+--- /dev/null
++++ b/config/user-aio.h.m4
+@@ -0,0 +1,7 @@
++dnl #
++dnl # POSIX specifies <aio.h> as part of realtime extensions,
++dnl # and is missing from at least uClibc – force fallbacks there
++dnl #
++AC_DEFUN([ZFS_AC_CONFIG_USER_AIO_H], [
++	ZFS_AC_FIND_SYSTEM_LIBRARY(AIO_H, [], [aio.h], [], [rt], [lio_listio])
++])
+diff --git a/config/user-libaio.m4 b/config/user-libaio.m4
+index 95c144d76b4..8009bd11b3e 100644
+--- a/config/user-libaio.m4
++++ b/config/user-libaio.m4
+@@ -1,5 +1,5 @@
+ dnl #
+-dnl # Check for libaio - only used for libaiot test cases.
++dnl # Check for libaio - only used for mmap_libaio test cases.
+ dnl #
+ AC_DEFUN([ZFS_AC_CONFIG_USER_LIBAIO], [
+ 	ZFS_AC_FIND_SYSTEM_LIBRARY(LIBAIO, [], [libaio.h], [], [aio], [], [user_libaio=yes], [user_libaio=no])
+diff --git a/config/user.m4 b/config/user.m4
+index 670820b3771..f450af47e04 100644
+--- a/config/user.m4
++++ b/config/user.m4
+@@ -23,6 +23,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [
+ 	ZFS_AC_CONFIG_USER_LIBAIO
+ 	ZFS_AC_CONFIG_USER_LIBATOMIC
+ 	ZFS_AC_CONFIG_USER_LIBFETCH
++	ZFS_AC_CONFIG_USER_AIO_H
+ 	ZFS_AC_CONFIG_USER_CLOCK_GETTIME
+ 	ZFS_AC_CONFIG_USER_PAM
+ 	ZFS_AC_CONFIG_USER_RUNSTATEDIR
+diff --git a/lib/libzutil/zutil_import.c b/lib/libzutil/zutil_import.c
+index d7547c4249e..3744a1c3474 100644
+--- a/lib/libzutil/zutil_import.c
++++ b/lib/libzutil/zutil_import.c
+@@ -47,7 +47,9 @@
+  * using our derived config, and record the results.
+  */
+
++#ifdef HAVE_AIO_H
+ #include <aio.h>
++#endif
+ #include <ctype.h>
+ #include <dirent.h>
+ #include <errno.h>
+@@ -982,6 +984,9 @@ zpool_read_label_slow(int fd, nvlist_t **config, int *num_labels)
+ int
+ zpool_read_label(int fd, nvlist_t **config, int *num_labels)
+ {
++#ifndef HAVE_AIO_H
++	return (zpool_read_label_slow(fd, config, num_labels));
++#else
+ 	struct stat64 statbuf;
+ 	struct aiocb aiocbs[VDEV_LABELS];
+ 	struct aiocb *aiocbps[VDEV_LABELS];
+@@ -1104,6 +1109,7 @@ zpool_read_label(int fd, nvlist_t **config, int *num_labels)
+ 	*config = expected_config;
+
+ 	return (0);
++#endif
+ }
+
+ /*
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 3a73e5e94f..f0327ce8cc 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,6 +1,5 @@
 # From https://github.com/openzfs/zfs/releases/download/zfs-2.1.12/zfs-2.1.12.sha256.asc
 sha256  64daa26aed3e12c931f6f4413d7527c4ebdb8da35416b356152b5f9fdd4c6e6d  zfs-2.1.12.tar.gz
-sha256  96a27353fe717ff2c8b95deb8b009c4eb750303c6400e2d8a2582ab1ec12b25a  bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index b852d8d4e2..43a10a0de9 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -6,13 +6,12 @@
 
 ZFS_VERSION = 2.1.12
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
-ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
 ZFS_CPE_ID_PRODUCT = openzfs
 
-# 0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
+# 0001-config-user-check-for-aio.h.patch
 ZFS_AUTORECONF = YES
 
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl linux

--===============2770570890747655524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2770570890747655524==--
