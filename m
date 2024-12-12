Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4BCC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D00142D42;
	Fri, 28 Feb 2025 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fkHWI-8F5Dq; Fri, 28 Feb 2025 16:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6320A4F359
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6320A4F359;
	Fri, 28 Feb 2025 16:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 181EE711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFD7419E2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ww5ANQC8zogt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B1404247D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B1404247D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 479F8820F8; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 12:28:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 45f46779f18c3e6462a91a62ce1f43a21a1b6b03
X-Git-Newrev: 14a7a93472dd1ecd8dd5f30edd13a86c705dab12
X-Patchwork-Hint: ignore
Message-Id: <20250228162938.479F8820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zfs: bump version to
 2.2.7
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4603136895427158759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4603136895427158759==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=14a7a93472dd1ecd8dd5f30edd13a86c705dab12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed backported patch:
- https://github.com/openzfs/zfs/commit/bd949b10bed3d99e3b40249d9c8d74a0b4304774.patch

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...S-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch | 70 ----------------------
 package/zfs/zfs.hash                               |  4 +-
 package/zfs/zfs.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 73 deletions(-)

diff --git a/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch b/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
deleted file mode 100644
index 64972c4f57..0000000000
--- a/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 2ccefd4aff98cf355c7d13b3f92bb4d390dfa522 Mon Sep 17 00:00:00 2001
-From: Tino Reichardt <milky-zfs@mcmilk.de>
-Date: Sun, 4 Aug 2024 11:58:13 +0200
-Subject: [PATCH] ZTS: small fix for SEEK_DATA/SEEK_HOLE tests
-
-Some libc's like uClibc lag the proper definition of SEEK_DATA
-and SEEK_HOLE. Since we have only two files in ZTS which use
-these definitons, let's define them by hand:
-
-```
-#ifndef SEEK_DATA
-#define SEEK_DATA 3
-#endif
-#ifndef SEEK_HOLE
-#define SEEK_HOLE 4
-#endif
-```
-
-There should be no failures, because:
-- FreeBSD has support for SEEK_DATA/SEEK_HOLE since FreeBSD 8
-- Linux has it since Linux 3.1
-- the libc will submit the parameters unchanged to the kernel
-
-Signed-off-by: Tino Reichardt <milky-zfs@mcmilk.de>
-Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
-Upstream: https://github.com/openzfs/zfs/commit/bd949b10bed3d99e3b40249d9c8d74a0b4304774
----
- tests/zfs-tests/cmd/mmap_seek.c                       | 10 ++++++++++
- tests/zfs-tests/tests/functional/cp_files/seekflood.c |  7 +++++++
- 2 files changed, 17 insertions(+)
-
-diff --git a/tests/zfs-tests/cmd/mmap_seek.c b/tests/zfs-tests/cmd/mmap_seek.c
-index 7be92d109565..2d250554a13f 100644
---- a/tests/zfs-tests/cmd/mmap_seek.c
-+++ b/tests/zfs-tests/cmd/mmap_seek.c
-@@ -35,6 +35,16 @@
- #include <linux/fs.h>
- #endif
- 
-+/* some older uClibc's lack the defines, so we'll manually define them */
-+#ifdef	__UCLIBC__
-+#ifndef	SEEK_DATA
-+#define	SEEK_DATA 3
-+#endif
-+#ifndef	SEEK_HOLE
-+#define	SEEK_HOLE 4
-+#endif
-+#endif
-+
- static void
- seek_data(int fd, off_t offset, off_t expected)
- {
-diff --git a/tests/zfs-tests/tests/functional/cp_files/seekflood.c b/tests/zfs-tests/tests/functional/cp_files/seekflood.c
-index 02c2c8e6eca5..f832db85970d 100644
---- a/tests/zfs-tests/tests/functional/cp_files/seekflood.c
-+++ b/tests/zfs-tests/tests/functional/cp_files/seekflood.c
-@@ -36,6 +36,13 @@
- #include <sys/stat.h>
- #include <sys/wait.h>
- 
-+/* some older uClibc's lack the defines, so we'll manually define them */
-+#ifdef	__UCLIBC__
-+#ifndef	SEEK_DATA
-+#define	SEEK_DATA 3
-+#endif
-+#endif
-+
- #define	DATASIZE	(4096)
- char data[DATASIZE];
- 
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 50e53910fa..ce1e010d6d 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.sha256.asc
-sha256  c92e02103ac5dd77bf01d7209eabdca55c7b3356aa747bb2357ec4222652a2a7  zfs-2.2.6.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.7/zfs-2.2.7.sha256.asc
+sha256  b2b8e3bfabf2a6407a0132243726cb6762547a5bd095b1b1f37eaf2a9d8f7672  zfs-2.2.7.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 9cecd499ed..b86214e751 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.2.6
+ZFS_VERSION = 2.2.7
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============4603136895427158759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4603136895427158759==--
