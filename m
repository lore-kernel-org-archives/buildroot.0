Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE125EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBEF83903;
	Thu,  7 Sep 2023 15:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBEF83903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUwTijSkAJUR; Thu,  7 Sep 2023 15:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92821836C5;
	Thu,  7 Sep 2023 15:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92821836C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 625811BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 281B261261
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 281B261261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vm1ef3Dt5KmC for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58D7A6128D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58D7A6128D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56AF086A1E; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:19:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33f2d1498fb4d695465fe2ad0c829b7f3925298c
X-Git-Newrev: 4fcbeb391a0c9cd701448a69026a937e1adf14e0
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.56AF086A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: bump version to 2.39.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fcbeb391a0c9cd701448a69026a937e1adf14e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/v2.39.2-ReleaseNotes

This update primarily allows util-linux to be built against older kernel
headers. It also means that a downstream patch can be eliminated, because
the changes are included in util-linux 2.39.2. Therefore, AUTORECONF =
YES is no longer needed.

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=c0136ac0c98b1

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-libmount-ifdef-statx-call.patch           | 57 ----------------------
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   |  6 +--
 3 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/util-linux/0001-libmount-ifdef-statx-call.patch b/package/util-linux/0001-libmount-ifdef-statx-call.patch
deleted file mode 100644
index ba44650bd3..0000000000
--- a/package/util-linux/0001-libmount-ifdef-statx-call.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c0136ac0c98b18208508fbcfac31a843e0bb8a37 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 3 Aug 2023 12:39:19 +0200
-Subject: [PATCH] libmount: ifdef statx() call
-
-In this case the statx() is use to get mount ID. It's optional and not
-required. Let's #ifdef the statx() call and also check for stx_mnt_id
-struct member.
-
-Fixes: https://github.com/util-linux/util-linux/issues/2415
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37
----
- configure.ac              | 5 ++++-
- libmount/src/hook_mount.c | 2 ++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a3cf330b5..ae721c7ac 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -525,7 +525,10 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
-     [[#include <termios.h>]])
- 
- AC_CHECK_MEMBERS([struct stat.st_mtim.tv_nsec],,,
--	[#include <sys/stat.h>])
-+    [[#include <sys/stat.h>]])
-+
-+AC_CHECK_MEMBERS([struct statx.stx_mnt_id],,,
-+    [[#include <linux/stat.h>]])
- 
- AC_CHECK_DECLS([_NL_TIME_WEEK_1STDAY],[],[],[[#include <langinfo.h>]])
- 
-diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
-index d69a018ec..056338c49 100644
---- a/libmount/src/hook_mount.c
-+++ b/libmount/src/hook_mount.c
-@@ -294,6 +294,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
- 		/* cleanup after fail (libmount may only try the FS type) */
- 		close_sysapi_fds(api);
- 
-+#if defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
- 	if (!rc && cxt->fs) {
- 		struct statx st;
- 
-@@ -306,6 +307,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
- 				fs->id = cxt->fs->id;
- 		}
- 	}
-+#endif
- 
- done:
- 	DBG(HOOK, ul_debugobj(hs, "create FS done [rc=%d, id=%d]", rc, cxt->fs ? cxt->fs->id : -1));
--- 
-2.39.2
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 7ecd165459..1638cd9967 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/sha256sums.asc
-sha256  890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b  util-linux-2.39.1.tar.xz
+sha256  87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f  util-linux-2.39.2.tar.xz
 # License files, locally calculated
 sha256  64dfeae1519bf0e27563d905a71264310fb6a8fa74e5cf99bb36e4d30d7ef455  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0b8e3979b7..4a40d5afec 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.39
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -30,10 +30,6 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
-
-# 0001-libmount-ifdef-statx-call.patch
-UTIL_LINUX_AUTORECONF = YES
-
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
