Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6B5606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iYFjXi9w
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F09F40920;
	Thu, 22 Oct 2026 09:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CNTrSkEiIMP; Thu, 22 Oct 2026 09:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CC1504099E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661681;
	b=BP/hvroOxgZVRtxmmdQ8U8a7X+MWLYTdj6ThAcyaNBZEfOnlxmHp93BpA7Nw3ERFRe7g
	 ocxXniXq1gAnjnwalSfg7LlhQhexZ5VfTse6vWTFF97kx4Ic0i3dMzqZoYXv+MEisMT4e
	 1fE9nWy2AgU8g4kjtwHZHU5nhwhlom4EPzx/9TNNQrBvBbQMvDFYjC7KUqc4QLlKH1KPD
	 BuM+EEgR+2WJ6v4qnCu0pNy0qGu273nDBVWSq+MRCG3lW0LYjyis8xqX8Z/vqf2dVBd+S
	 ZH/kfl9GU0bXCZtAl1zSF8XOEl65ZV4xWV2frErGKCm1eBX8oiIOMEVDQgcxpaonjqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K2+z3+4qUnP5Mzf2ZZCWb/sqrz3+gYrhe2f2BNnD1kU=;
	b=HxfpJtysBj2sndYsB9fDv+WRs9fvVxxIZ9Gm+UGA0sUXvOXF2TR9FfGL4kIwCAwvCo5G
	 So9t63N1czII9VVMKDjZTrhZguhbGX7XCTQCpGKUjGOE38b8ffG0TJSc4FVh6fkfYjo5/
	 ZaPQtK7lp7Xo5sjA0Vdoi922/T+DyWpCpHQAfecU+qeIbfN3JE2eDZtSI+NT4eONZ1/4d
	 EIQjBeAkEC9hX8CyQaAhiuniiUat5tP5CarfvVVXtrNpI8q1nPzz2bxJr2zQgiqapXtg5
	 p6AXjD4Q43NkRFWiIydf5BImhe9Gmo9W40Yq+6bjW05DmxAVIzapZgI0gUT4vSs6NLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661681;
	bh=K2+z3+4qUnP5Mzf2ZZCWb/sqrz3+gYrhe2f2BNnD1kU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iYFjXi9wAl48/QGKeFcfXSSUhdQN4iDqlblEw1KZtAQeKCGYLRzc5Yun/oOIh0tQb
	 RxwP71hKgPZBLh6HhrAaomuwmPNFXbXYthRK10PSF/DDMhTMQUlUpuUL3q5CGIjq9L
	 /dyL+OQvMC/tKanFyE37wNpYuw+kkd5KL1j3eRkTSIu8dolJpNYccWuJcCNSWPH3p2
	 e21xYVGzmS51WKBLTnlzOBKS24bdk0rQMdvAcabgH8+LfJ6bmMZydCsRbSMZxzo76i
	 5o0h44njaDsindYbQ28QzVeKeLOxUf7HHUkNmfMgPAZh3cQS71pAkAktxfjGsy4oS3
	 6YWPttV4SU91Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1504099E;
	Thu, 22 Oct 2026 09:34:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2248A3AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A2F401A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDbL4FdJ9b4A for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 04F9040050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661673;
 b=c1YBYG22OFaQVAxZz3+AIHX5ibJFZuySLipIWIhG111sBKUbkeExdrRAbyYmG4GP39Y2
 Wy89oMSycDbe4uQBrmI9gQ3gfKUXosfa5lJ+1C1tlsjdXVtgIrlBVZZ8fQ44XqDVC0stc
 LV35KhDvd31mIJ56n/JA7BgnJ/RMsEkZeJ2S8c4Cf4eMVKW39PUAtrsnSfu+cLvLEjgh+
 7i+wQLe4ysXg3ZOn2AUfM3bCJyXXNWvxDEbrqUNEmwT5DV74EUNR6MDuVH68Y6PkLFwc5
 ZquofF+8hQjUfI7ZzgWAfPaPv3kqHBUMFriuee5nN/t75b0TkYSdRVVwLgaPBXL28qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661673;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3cA5CP7qRByMzD6BE9Enp3jQMAttxJ1xKmQN9YiCExk=;
 b=eiHWb9XXD2MF4y2cPSYk1OcI1L8JI1F9MGqO+yaDNTKVuwp8+4hqNKFFG8cqQnf/HOql
 0Zve9Su0Eu8Ix1LH11SCTueDm2MQatWY8uFORiQu09ANr3rpt7U1RoIzlvY67a018FTLV
 GpqOkTCEmz4SH0OwtbyQbKIxpNG80fQJ80RE3m4L/XmMlLFPKAiXnb7ZlagEzypMRly7Z
 BEKMaGSik9LMQA1+MIG6qB93a1ZKllv4BXMLzNIrubZ15voRWm2MckUlEh1+adsL2Of/O
 d3R+rWn6wBcBDb21vdDT17d5OuniQLiuTqArc92A78LUfvq3DwHppGkkBIipBgaYt9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04F9040050
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0483D9B986; Thu, 22 Oct 2026 09:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:45:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e81cea88313cfe308a9b07d6c0ab4ee87965165e
X-Git-Newrev: 9f6df9b7d6158757ab08f5a83622888a0c7310df
X-Patchwork-Hint: ignore
Message-Id: <20261022093309.0483D9B986@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zfs: fix uclibc
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f6df9b7d6158757ab08f5a83622888a0c7310df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit [1] fixed ZFS support for uclibc 1.0.57. This commit
has been cherry picked in LTS branch 2025.02.x as the same error
occured in that target branch.

At the time the master branch was based on 2.4.1 while 2025.02.x branch
was based on ZFS version 2.3.2

The ZFS version present on the master branch included a number of
upstream commit [2][3] not present in 2025.02.x. Those commits adds
the infrastructure to properly support statx in both uclibc and glibc.

Later a follow up commit [4] has been commited upstream.

This commit backport this set of commit to fix the uclibc support for
zfs. Those patches change the autoconf files and thus needs to be regen.

[1] b6884913ae package/zfs: add patch to fix build with uclibc >= 1.0.57
[2] https://github.com/openzfs/zfs/commit/523d9d6007effb01bf6a44f9942158f47a65e2b2
[3] https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d
[4] https://github.com/openzfs/zfs/commit/2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/17125191168
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ntpoint-on-path-based-unmount-using-statx.patch | 92 ++++++++++++++++++++++
 ...ux-use-sys-stat-h-instead-of-linux-stat-h.patch | 82 +++++++++++++++++++
 .../0004-config-fix-STATX_MNT_ID-detection.patch   | 41 ++++++++++
 ...-tests-cmd-statx.c-avoid-statx-conflicts.patch} |  0
 package/zfs/zfs.mk                                 |  5 ++
 5 files changed, 220 insertions(+)

diff --git a/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch b/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
new file mode 100644
index 0000000000..4f1fcb75b4
--- /dev/null
+++ b/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
@@ -0,0 +1,92 @@
+From 523d9d6007effb01bf6a44f9942158f47a65e2b2 Mon Sep 17 00:00:00 2001
+From: Ameer Hamza <ahamza@ixsystems.com>
+Date: Wed, 9 Jul 2025 07:10:00 +0500
+Subject: [PATCH] Validate mountpoint on path-based unmount using statx
+
+Use statx to verify that path-based unmounts proceed only if the
+mountpoint reported by statx matches the MNTTAB entry reported by
+libzfs, aborting the operation if they differ. Align
+`zfs umount /path` behavior with `zfs umount dataset`.
+
+Reviewed-by: Alexander Motin <mav@FreeBSD.org>
+Signed-off-by: Ameer Hamza <ahamza@ixsystems.com>
+Closes #17481
+
+Upstream: https://github.com/openzfs/zfs/commit/523d9d6007effb01bf6a44f9942158f47a65e2b2
+[thomas: stripped to only add support for the statx infrastructure]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ config/user-statx.m4                   | 34 ++++++++++++++++++++++++
+ config/user.m4                         |  1 +
+ 5 files changed, 89 insertions(+), 6 deletions(-)
+ create mode 100644 config/user-statx.m4
+
+diff --git a/config/user-statx.m4 b/config/user-statx.m4
+new file mode 100644
+index 000000000000..0315f93e0c20
+--- /dev/null
++++ b/config/user-statx.m4
+@@ -0,0 +1,34 @@
++dnl #
++dnl # Check for statx() function and STATX_MNT_ID availability
++dnl #
++AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
++	AC_CHECK_HEADERS([linux/stat.h],
++		[have_stat_headers=yes],
++		[have_stat_headers=no])
++
++	AS_IF([test "x$have_stat_headers" = "xyes"], [
++		AC_CHECK_FUNC([statx], [
++			AC_DEFINE([HAVE_STATX], [1], [statx() is available])
++
++			dnl Check for STATX_MNT_ID availability
++			AC_MSG_CHECKING([for STATX_MNT_ID])
++			AC_COMPILE_IFELSE([
++				AC_LANG_PROGRAM([[
++					#include <linux/stat.h>
++				]], [[
++					struct statx stx;
++					int mask = STATX_MNT_ID;
++					(void)mask;
++					(void)stx.stx_mnt_id;
++				]])
++			], [
++				AC_MSG_RESULT([yes])
++				AC_DEFINE([HAVE_STATX_MNT_ID], [1], [STATX_MNT_ID is available])
++			], [
++				AC_MSG_RESULT([no])
++			])
++		])
++	], [
++		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
++	])
++])  dnl end AC_DEFUN
+diff --git a/config/user.m4 b/config/user.m4
+index badd920d2b8a..62e59ed94437 100644
+--- a/config/user.m4
++++ b/config/user.m4
+@@ -17,6 +17,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [
+ 		ZFS_AC_CONFIG_USER_LIBUDEV
+ 		ZFS_AC_CONFIG_USER_LIBUUID
+ 		ZFS_AC_CONFIG_USER_LIBBLKID
++		ZFS_AC_CONFIG_USER_STATX
+ 	])
+ 	ZFS_AC_CONFIG_USER_LIBTIRPC
+ 	ZFS_AC_CONFIG_USER_LIBCRYPTO
+diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
+index 488554f4e844..a605af962a6d 100644
+--- a/lib/libspl/include/os/linux/sys/stat.h
++++ b/lib/libspl/include/os/linux/sys/stat.h
+@@ -31,6 +31,11 @@
+ 
+ #include <sys/mount.h> /* for BLKGETSIZE64 */
+ 
++#ifdef HAVE_STATX
++#include <fcntl.h>
++#include <linux/stat.h>
++#endif
++
+ /*
+  * Emulate Solaris' behavior of returning the block device size in fstat64().
+  */
+
diff --git a/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch b/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
new file mode 100644
index 0000000000..1cac841a5a
--- /dev/null
+++ b/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
@@ -0,0 +1,82 @@
+From ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d Mon Sep 17 00:00:00 2001
+From: classabbyamp <5366828+classabbyamp@users.noreply.github.com>
+Date: Wed, 27 Aug 2025 17:42:32 -0400
+Subject: [PATCH] linux: use sys/stat.h instead of linux/stat.h
+
+glibc includes linux/stat.h for statx, but musl defines its own statx
+struct and associated constants, which does not include STATX_MNT_ID
+yet. Thus, including linux/stat.h directly should be avoided for
+maximum libc compatibility.
+
+Tested on:
+  - glibc: x86_64, i686, aarch64, armv7l, armv6l
+  - musl: x86_64, aarch64, armv7l, armv6l
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Tested-By: Achill Gilgenast <achill@achill.org>
+Signed-off-by: classabbyamp <dev@placeviolette.net>
+Closes #17675
+
+Upstream: https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ config/user-statx.m4                   | 6 +++---
+ include/os/linux/spl/sys/stat.h        | 2 +-
+ lib/libspl/include/os/linux/sys/stat.h | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/config/user-statx.m4 b/config/user-statx.m4
+index 0315f93e0c20..1ba74a40e9b8 100644
+--- a/config/user-statx.m4
++++ b/config/user-statx.m4
+@@ -2,7 +2,7 @@ dnl #
+ dnl # Check for statx() function and STATX_MNT_ID availability
+ dnl #
+ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+-	AC_CHECK_HEADERS([linux/stat.h],
++	AC_CHECK_HEADERS([sys/stat.h],
+ 		[have_stat_headers=yes],
+ 		[have_stat_headers=no])
+ 
+@@ -14,7 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			AC_MSG_CHECKING([for STATX_MNT_ID])
+ 			AC_COMPILE_IFELSE([
+ 				AC_LANG_PROGRAM([[
+-					#include <linux/stat.h>
++					#include <sys/stat.h>
+ 				]], [[
+ 					struct statx stx;
+ 					int mask = STATX_MNT_ID;
+@@ -29,6 +29,6 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			])
+ 		])
+ 	], [
+-		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
++		AC_MSG_WARN([sys/stat.h not found; skipping statx support])
+ 	])
+ ])  dnl end AC_DEFUN
+diff --git a/include/os/linux/spl/sys/stat.h b/include/os/linux/spl/sys/stat.h
+index 087389b57b34..ad2815e46394 100644
+--- a/include/os/linux/spl/sys/stat.h
++++ b/include/os/linux/spl/sys/stat.h
+@@ -25,6 +25,6 @@
+ #ifndef _SPL_STAT_H
+ #define	_SPL_STAT_H
+ 
+-#include <linux/stat.h>
++#include <sys/stat.h>
+ 
+ #endif /* SPL_STAT_H */
+diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
+index a605af962a6d..13cc0b46ac93 100644
+--- a/lib/libspl/include/os/linux/sys/stat.h
++++ b/lib/libspl/include/os/linux/sys/stat.h
+@@ -33,7 +33,7 @@
+ 
+ #ifdef HAVE_STATX
+ #include <fcntl.h>
+-#include <linux/stat.h>
++#include <sys/stat.h>
+ #endif
+ 
+ /*
diff --git a/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch b/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
new file mode 100644
index 0000000000..176dca28d2
--- /dev/null
+++ b/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
@@ -0,0 +1,41 @@
+From 2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5 Mon Sep 17 00:00:00 2001
+From: Rob Norris <rob.norris@truenas.com>
+Date: Fri, 13 Mar 2026 03:58:54 +1100
+Subject: [PATCH] config: fix STATX_MNT_ID detection
+
+statx(2) requires _GNU_SOURCE to be defined in order for sys/stat.h to
+produce a definition for struct statx and the STATX_* defines. We get
+that at compile time because we pass -D_GNU_SOURCE through to
+everything, but in the configure check we aren't setting _GNU_SOURCE, so
+we don't find STATX_MNT_ID, and so don't set HAVE_STATX_MNT_ID.
+
+(This was fine before ccf5a8a6fc, because linux/stat.h does not require
+_GNU_SOURCE).
+
+Simple fix: in the check, define _GNU_SOURCE before including
+sys/stat.h.
+
+Sponsored-by: TrueNAS
+Reviewed-by: Ameer Hamza <ahamza@ixsystems.com>
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Signed-off-by: Rob Norris <rob.norris@truenas.com>
+Closes #18312
+
+Upstream: https://github.com/openzfs/zfs/commit/2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ config/user-statx.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/config/user-statx.m4 b/config/user-statx.m4
+index b2441631c824..d359f48b8579 100644
+--- a/config/user-statx.m4
++++ b/config/user-statx.m4
+@@ -14,6 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			AC_MSG_CHECKING([for STATX_MNT_ID])
+ 			AC_COMPILE_IFELSE([
+ 				AC_LANG_PROGRAM([[
++					#define _GNU_SOURCE
+ 					#include <sys/stat.h>
+ 				]], [[
+ 					struct statx stx;
diff --git a/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch b/package/zfs/0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
similarity index 100%
rename from package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
rename to package/zfs/0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index bdd7b2a3b0..e6c8f98af9 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -14,6 +14,11 @@ ZFS_CPE_ID_PRODUCT = openzfs
 
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl linux
 
+# 0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
+# 0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
+# 0004-config-fix-STATX_MNT_ID-detection.patch
+ZFS_AUTORECONF = YES
+
 # sysvinit installs only a commented-out modules-load.d/ config file
 ZFS_CONF_OPTS = \
 	--with-linux=$(LINUX_DIR) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
