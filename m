Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC796C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 10:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D2B847FF;
	Fri,  1 Dec 2023 10:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88D2B847FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKsdBJu3oJJn; Fri,  1 Dec 2023 10:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA333847EC;
	Fri,  1 Dec 2023 10:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA333847EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B34171BF344
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98FA84021C
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98FA84021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIXkbuPl2GCq for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 10:33:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56C5C40207
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 10:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C5C40207
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E74A876F7; Fri,  1 Dec 2023 10:33:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 11:29:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84b721c2bf88c3ae8f519680a64b1829427176c2
X-Git-Newrev: a44d1a1252572bcb7638e5b832c24841303f4800
X-Patchwork-Hint: ignore
Message-Id: <20231201103323.2E74A876F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.2.0
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
Content-Type: multipart/mixed; boundary="===============2994522322106445157=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2994522322106445157==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a44d1a1252572bcb7638e5b832c24841303f4800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed backported patch:
- https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch

Updated ZFS test to pass this new version; drop the explicit /pool
mountpoint option to rely on the default location (which happens to be
/pool already).

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998@free.fr:
  - needed on master to further bump to a data-corruption fix
]
(cherry picked from commit d153e58d13f262f96c6c7c9a2bc0d31b76c8973d)
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zfs/0001-config-user-check-for-aio.h.patch | 94 ----------------------
 package/zfs/zfs.hash                               |  4 +-
 package/zfs/zfs.mk                                 |  2 +-
 support/testing/tests/package/test_zfs.py          |  4 +-
 4 files changed, 5 insertions(+), 99 deletions(-)

diff --git a/package/zfs/0001-config-user-check-for-aio.h.patch b/package/zfs/0001-config-user-check-for-aio.h.patch
deleted file mode 100644
index 55321ee2fc..0000000000
--- a/package/zfs/0001-config-user-check-for-aio.h.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From bc3f12bfac152a0c28951cec92340ba14f9ccee9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=D0=BD=D0=B0=D0=B1?= <nabijaczleweli@nabijaczleweli.xyz>
-Date: Mon, 28 Mar 2022 19:24:22 +0200
-Subject: [PATCH] config: user: check for <aio.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-And always zpool_read_label_slow() on non-conformant libcs
-
-Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
-Co-authored-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
-Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
-Closes #13207
-Closes #13254
-Upstream: https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- config/user-aio.h.m4        | 7 +++++++
- config/user-libaio.m4       | 2 +-
- config/user.m4              | 1 +
- lib/libzutil/zutil_import.c | 6 ++++++
- 4 files changed, 15 insertions(+), 1 deletion(-)
- create mode 100644 config/user-aio.h.m4
-
-diff --git a/config/user-aio.h.m4 b/config/user-aio.h.m4
-new file mode 100644
-index 00000000000..152c0946722
---- /dev/null
-+++ b/config/user-aio.h.m4
-@@ -0,0 +1,7 @@
-+dnl #
-+dnl # POSIX specifies <aio.h> as part of realtime extensions,
-+dnl # and is missing from at least uClibc – force fallbacks there
-+dnl #
-+AC_DEFUN([ZFS_AC_CONFIG_USER_AIO_H], [
-+	ZFS_AC_FIND_SYSTEM_LIBRARY(AIO_H, [], [aio.h], [], [rt], [lio_listio])
-+])
-diff --git a/config/user-libaio.m4 b/config/user-libaio.m4
-index 95c144d76b4..8009bd11b3e 100644
---- a/config/user-libaio.m4
-+++ b/config/user-libaio.m4
-@@ -1,5 +1,5 @@
- dnl #
--dnl # Check for libaio - only used for libaiot test cases.
-+dnl # Check for libaio - only used for mmap_libaio test cases.
- dnl #
- AC_DEFUN([ZFS_AC_CONFIG_USER_LIBAIO], [
- 	ZFS_AC_FIND_SYSTEM_LIBRARY(LIBAIO, [], [libaio.h], [], [aio], [], [user_libaio=yes], [user_libaio=no])
-diff --git a/config/user.m4 b/config/user.m4
-index 670820b3771..f450af47e04 100644
---- a/config/user.m4
-+++ b/config/user.m4
-@@ -23,6 +23,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [
- 	ZFS_AC_CONFIG_USER_LIBAIO
- 	ZFS_AC_CONFIG_USER_LIBATOMIC
- 	ZFS_AC_CONFIG_USER_LIBFETCH
-+	ZFS_AC_CONFIG_USER_AIO_H
- 	ZFS_AC_CONFIG_USER_CLOCK_GETTIME
- 	ZFS_AC_CONFIG_USER_PAM
- 	ZFS_AC_CONFIG_USER_RUNSTATEDIR
-diff --git a/lib/libzutil/zutil_import.c b/lib/libzutil/zutil_import.c
-index d7547c4249e..3744a1c3474 100644
---- a/lib/libzutil/zutil_import.c
-+++ b/lib/libzutil/zutil_import.c
-@@ -47,7 +47,9 @@
-  * using our derived config, and record the results.
-  */
-
-+#ifdef HAVE_AIO_H
- #include <aio.h>
-+#endif
- #include <ctype.h>
- #include <dirent.h>
- #include <errno.h>
-@@ -982,6 +984,9 @@ zpool_read_label_slow(int fd, nvlist_t **config, int *num_labels)
- int
- zpool_read_label(int fd, nvlist_t **config, int *num_labels)
- {
-+#ifndef HAVE_AIO_H
-+	return (zpool_read_label_slow(fd, config, num_labels));
-+#else
- 	struct stat64 statbuf;
- 	struct aiocb aiocbs[VDEV_LABELS];
- 	struct aiocb *aiocbps[VDEV_LABELS];
-@@ -1104,6 +1109,7 @@ zpool_read_label(int fd, nvlist_t **config, int *num_labels)
- 	*config = expected_config;
-
- 	return (0);
-+#endif
- }
-
- /*
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index f0327ce8cc..b02c49234a 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.12/zfs-2.1.12.sha256.asc
-sha256  64daa26aed3e12c931f6f4413d7527c4ebdb8da35416b356152b5f9fdd4c6e6d  zfs-2.1.12.tar.gz
+# Locally computed
+sha256  42035fd059faa25a09cd511b24a57b8ad1285cb69127f2a0043b98562c5ec690  zfs-2.2.0.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index c7b0ed0407..b35967a3b5 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.1.12
+ZFS_VERSION = 2.2.0
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 1f01ddd768..27dbc2869b 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -40,11 +40,11 @@ class TestZfsBase(infra.basetest.BRTest):
 
         cmds = [
             # Init
-            "modprobe zfs",
+            "modprobe zfs && sleep 2",
             "mount -o remount,size=132M /tmp",
             "fallocate -l 64M /tmp/container1.raw",
             "fallocate -l 64M /tmp/container2.raw",
-            "zpool create -m /pool pool raidz /tmp/container1.raw /tmp/container2.raw",
+            "zpool create pool raidz /tmp/container1.raw /tmp/container2.raw",
             "dd if=/dev/urandom bs=1M count=8 of=/pool/urandom",
             "sha256sum /pool/urandom > /tmp/urandom.sha256",
             # Check ZFS

--===============2994522322106445157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2994522322106445157==--
