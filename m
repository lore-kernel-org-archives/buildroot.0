Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6991BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CBA1405D7;
	Sun, 27 Mar 2022 16:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCqpXsC__h60; Sun, 27 Mar 2022 16:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B25F404D0;
	Sun, 27 Mar 2022 16:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A31C1BF9A4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53DB8404D0
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZr-f7Gyrvuf for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 220CD405D7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B341A85E91; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f799da6f742ef284e6b342054a59cc81e5f07681
X-Git-Newrev: bd651106fc87d2b22565d923217d315fcd537f0a
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.B341A85E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: bump to version 5.16.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd651106fc87d2b22565d923217d315fcd537f0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/kdave/btrfs-progs/blob/v5.16.2/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ux-const-h-to-fix-build-with-5-12-headers.patch | 43 -------------------
 ...clude-sys-sysinfo-h-conditionally-on-musl.patch | 49 ----------------------
 ...add-local-definition-for-alignment-macros.patch | 46 --------------------
 package/btrfs-progs/btrfs-progs.hash               |  2 +-
 package/btrfs-progs/btrfs-progs.mk                 |  2 +-
 5 files changed, 2 insertions(+), 140 deletions(-)

diff --git a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch b/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
deleted file mode 100644
index b6c1a42456..0000000000
--- a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b28f7bd9bba6f65258da48955154794f466b4104 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Thu, 30 Dec 2021 15:23:59 +0200
-Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
- headers
-
-btrfs-tools compile fails with mips, musl and 5.12+ headers.
-
-The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
-add an explicit include of const.h to pickup the macro:
-
-  | make: *** [Makefile:595: mkfs.btrfs] Error 1
-  | make: *** Waiting for unfinished jobs....
-  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
-  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
-  | collect2: error: ld returned 1 exit status
-
-This is safe for older kernel's as well, since the header still
-exists, and is valid to include.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-[remove invalid OE Upstream-status]
-Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
-Signed-off-by: David Sterba <dsterba@suse.com>
-[Retrieved from:
-https://github.com/kdave/btrfs-progs/commit/b28f7bd9bba6f65258da48955154794f466b4104]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kerncompat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index df167fe6c..2503d1afa 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -29,6 +29,7 @@
- #include <stddef.h>
- #include <linux/types.h>
- #include <linux/kernel.h>
-+#include <linux/const.h>
- #include <stdint.h>
- 
- #include <features.h>
diff --git a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch b/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
deleted file mode 100644
index 7473fe67cb..0000000000
--- a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 8 Jan 2022 22:44:44 +0100
-Subject: [PATCH] btrfs-progs: include sys/sysinfo.h conditionally on musl
-
-Make inclusion of sys/sysinfo.h conditional to avoid the following build
-failure on musl:
-
-In file included from .../i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
-                 from ./kerncompat.h:31,
-                 from common/utils.c:42:
-.../i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
-    7 | struct sysinfo {
-      |        ^~~~~~~
-In file included from common/utils.c:27:
-.../i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
-   10 | struct sysinfo {
-      |        ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc
-
-The 'struct sysinfo' is defined in linux/sysinfo.h and sys/sysinfo.h,
-while both must not be included at the same time. Stop including
-linux/kernel.h that sometimes unconditionally includes sys/sysinfo.h and
-causes the double definition for some reason. As we now include
-linux/const.h directly, there's no other effective change.
-
-Pull-request: #433
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: David Sterba <dsterba@suse.com>
-[Retrieved from:
-https://github.com/kdave/btrfs-progs/commit/a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5]
----
- kerncompat.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index 2503d1afa..6ca1526e2 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -28,7 +28,6 @@
- #include <assert.h>
- #include <stddef.h>
- #include <linux/types.h>
--#include <linux/kernel.h>
- #include <linux/const.h>
- #include <stdint.h>
- 
diff --git a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch b/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
deleted file mode 100644
index 86c63edc30..0000000000
--- a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
-From: David Sterba <dsterba@suse.com>
-Date: Thu, 13 Jan 2022 14:47:08 +0100
-Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
- macros
-
-There's still problem left with compilation on musl and kernel < 5.11,
-because __ALIGN_KERNEL is not defined anymore:
-
-../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
-volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
-
-Due to the entangled includes and unconditional definition of
-__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
-eventually (as kerncompat.h is the first include). Instead add local
-definitions of the macros and rename them to avoid name clashes.
-
-Pull-request: #433
-Signed-off-by: David Sterba <dsterba@suse.com>
-[Retrieved from:
-https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kerncompat.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/kerncompat.h b/kerncompat.h
-index 6ca1526e2..f0a6e196e 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -359,7 +359,14 @@ do {					\
- 
- /* Alignment check */
- #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
--#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
-+
-+/*
-+ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
-+ * issues caused by moving the definition in 5.12
-+ */
-+#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
-+#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
-+#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
- 
- static inline int is_power_of_2(unsigned long n)
- {
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 339eab02aa..14eeb1ca07 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  6230f8f33961bd62633d601b0d049a3c6b833c1a1a7a2f2782d0c5796e7ab920  btrfs-progs-v5.15.1.tar.xz
+sha256  9e9b303a1d0fd9ceaaf204ee74c1c8fa1fd55794e223d9fe2bc62875ecbd53d2  btrfs-progs-v5.16.2.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 54922df839..9bf50ccfda 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 5.15.1
+BTRFS_PROGS_VERSION = 5.16.2
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
