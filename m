Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C262CA1007
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 20:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A15D412E9;
	Tue,  2 Sep 2025 20:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrMPhH6M-wBq; Tue,  2 Sep 2025 20:13:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB3E412FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB3E412FE;
	Tue,  2 Sep 2025 20:13:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C1FD2
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 20:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7003E412E9
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 20:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMMsgGdGSarm for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 20:13:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D8A412FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3D8A412FE
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 20:13:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A258287C05; Tue,  2 Sep 2025 20:13:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Sep 2025 21:49:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 498b5f3846831e4e9407eed2069bb33e1f5442f8
X-Git-Newrev: 98399d11ff6afe053a052f867bb0610eaacd52a0
X-Patchwork-Hint: ignore
Message-Id: <20250902201325.A258287C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zfs: bump version to
 2.3.4
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
Content-Type: multipart/mixed; boundary="===============1890562549296738302=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1890562549296738302==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=98399d11ff6afe053a052f867bb0610eaacd52a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added backported patch:
- 0001-use-sys_stath-instead-of-linux_stath.patch
  https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.3.4

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-use-sys_stath-instead-of-linux_stath.patch | 82 ++++++++++++++++++++++
 package/zfs/zfs.hash                               |  4 +-
 package/zfs/zfs.mk                                 |  2 +-
 3 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/package/zfs/0001-use-sys_stath-instead-of-linux_stath.patch b/package/zfs/0001-use-sys_stath-instead-of-linux_stath.patch
new file mode 100644
index 0000000000..5e5d21ec52
--- /dev/null
+++ b/package/zfs/0001-use-sys_stath-instead-of-linux_stath.patch
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
+Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
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
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 87ee513aed..0f309155ae 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.3/zfs-2.3.3.sha256.asc
-sha256  844122118f0ea81205a01753bbcb1315330f8967c1f866dcd10155273131f071  zfs-2.3.3.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.4/zfs-2.3.4.sha256.asc
+sha256  9ec397cf360133161a1180035f3e7d6962186ed2b3457953a28d45aa883fa495  zfs-2.3.4.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index ad4f3f232d..a48f89922b 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.3.3
+ZFS_VERSION = 2.3.4
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============1890562549296738302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1890562549296738302==--
