Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A20FE66891
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C35760AC6;
	Fri, 19 Dec 2025 22:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzMnwbK-bpeh; Fri, 19 Dec 2025 22:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C0960AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766182521;
	bh=wvm0VFT22T4oLrbJVeAue/53/E1UuJglZkES3K/FQVg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JxSDpMoc7LwdG8SuCnU32ij/ea0vyI2d7T1e3htQVgBhSApMNHrQAsmoIAc5NC+Al
	 ucwTu2vNQoZkFBMKgcR8FPMoi+0wq28wIdc65XNDmZxbjrtzD7prgf+gw3JT54LWFa
	 +ApxooZcHidq5mag97r3D8FzaflGrbEFJi2V6mha0s2Q0SuNCnUJsXVswk+kezFNV7
	 /N3UFUg5F3MAj3LqWlEUCCmV1/uq37r+2Y5TQaa3ynw4LhXbReE02EU0ouy5qkMCOl
	 +F3TQzjf2j/0uPXrs18/7ttFrsiIk61T2VZdIFWJKF3yfb4V4mCrRbnhKnZXwp5VYd
	 AAu3UPbJjvFPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C0960AFF;
	Fri, 19 Dec 2025 22:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F7E71A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C7B583D57
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Szb4T0N_DfWg for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE27583D56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE27583D56
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD73F87419; Fri, 19 Dec 2025 22:15:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 22:32:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 469ff398178e73ba733d41127ab85d7cd4477c12
X-Git-Newrev: 8ee86dabefb74e267bc7a1ffec764b97eccdbe93
X-Patchwork-Hint: ignore
Message-Id: <20251219221518.BD73F87419@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.4.0
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
Content-Type: multipart/mixed; boundary="===============8927775601542248923=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8927775601542248923==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8ee86dabefb74e267bc7a1ffec764b97eccdbe93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed backported patch:
 - 0001-use-sys_stath-instead-of-linux_stath.patch
Merged upstream in:
https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.4.0

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-use-sys_stath-instead-of-linux_stath.patch | 82 ----------------------
 package/zfs/zfs.hash                               |  4 +-
 package/zfs/zfs.mk                                 |  2 +-
 support/testing/tests/package/test_zfs.py          |  2 +-
 4 files changed, 4 insertions(+), 86 deletions(-)

diff --git a/package/zfs/0001-use-sys_stath-instead-of-linux_stath.patch b/package/zfs/0001-use-sys_stath-instead-of-linux_stath.patch
deleted file mode 100644
index 5e5d21ec52..0000000000
--- a/package/zfs/0001-use-sys_stath-instead-of-linux_stath.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d Mon Sep 17 00:00:00 2001
-From: classabbyamp <5366828+classabbyamp@users.noreply.github.com>
-Date: Wed, 27 Aug 2025 17:42:32 -0400
-Subject: [PATCH] linux: use sys/stat.h instead of linux/stat.h
-
-glibc includes linux/stat.h for statx, but musl defines its own statx
-struct and associated constants, which does not include STATX_MNT_ID
-yet. Thus, including linux/stat.h directly should be avoided for
-maximum libc compatibility.
-
-Tested on:
-  - glibc: x86_64, i686, aarch64, armv7l, armv6l
-  - musl: x86_64, aarch64, armv7l, armv6l
-
-Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
-Tested-By: Achill Gilgenast <achill@achill.org>
-Signed-off-by: classabbyamp <dev@placeviolette.net>
-Closes #17675
-
-Upstream: https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d
-Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
----
- config/user-statx.m4                   | 6 +++---
- include/os/linux/spl/sys/stat.h        | 2 +-
- lib/libspl/include/os/linux/sys/stat.h | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/config/user-statx.m4 b/config/user-statx.m4
-index 0315f93e0c20..1ba74a40e9b8 100644
---- a/config/user-statx.m4
-+++ b/config/user-statx.m4
-@@ -2,7 +2,7 @@ dnl #
- dnl # Check for statx() function and STATX_MNT_ID availability
- dnl #
- AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
--	AC_CHECK_HEADERS([linux/stat.h],
-+	AC_CHECK_HEADERS([sys/stat.h],
- 		[have_stat_headers=yes],
- 		[have_stat_headers=no])
- 
-@@ -14,7 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
- 			AC_MSG_CHECKING([for STATX_MNT_ID])
- 			AC_COMPILE_IFELSE([
- 				AC_LANG_PROGRAM([[
--					#include <linux/stat.h>
-+					#include <sys/stat.h>
- 				]], [[
- 					struct statx stx;
- 					int mask = STATX_MNT_ID;
-@@ -29,6 +29,6 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
- 			])
- 		])
- 	], [
--		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
-+		AC_MSG_WARN([sys/stat.h not found; skipping statx support])
- 	])
- ])  dnl end AC_DEFUN
-diff --git a/include/os/linux/spl/sys/stat.h b/include/os/linux/spl/sys/stat.h
-index 087389b57b34..ad2815e46394 100644
---- a/include/os/linux/spl/sys/stat.h
-+++ b/include/os/linux/spl/sys/stat.h
-@@ -25,6 +25,6 @@
- #ifndef _SPL_STAT_H
- #define	_SPL_STAT_H
- 
--#include <linux/stat.h>
-+#include <sys/stat.h>
- 
- #endif /* SPL_STAT_H */
-diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
-index a605af962a6d..13cc0b46ac93 100644
---- a/lib/libspl/include/os/linux/sys/stat.h
-+++ b/lib/libspl/include/os/linux/sys/stat.h
-@@ -33,7 +33,7 @@
- 
- #ifdef HAVE_STATX
- #include <fcntl.h>
--#include <linux/stat.h>
-+#include <sys/stat.h>
- #endif
- 
- /*
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 6ebcfb7a3d..87f4e462f1 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.5/zfs-2.3.5.sha256.asc
-sha256  326ae0cba8a615afa42c6891640e76acc4bd230f6d6ddec120c11e30b1392067  zfs-2.3.5.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.0/zfs-2.4.0.sha256.asc
+sha256  7bdf13de0a71d95554c0e3e47d5e8f50786c30d4f4b63b7c593b1d11af75c9ee  zfs-2.4.0.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 712f2afb54..30207f7cf7 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.3.5
+ZFS_VERSION = 2.4.0
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 698d8d8bbd..384fad7e33 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -57,7 +57,7 @@ class TestZfsBase(infra.basetest.BRTest):
             "sha256sum -c /tmp/urandom.sha256",
             "zpool status -v",
             # Check PyZFS
-            "arc_summary",
+            "zarcsummary",
         ]
         for cmd in cmds:
             self.assertRunOk(cmd, timeout=self.timeout)

--===============8927775601542248923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8927775601542248923==--
