Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A410C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E1182716;
	Sun, 12 Dec 2021 15:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzPKCc69qmMF; Sun, 12 Dec 2021 15:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D06098271D;
	Sun, 12 Dec 2021 15:54:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D41DC1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2131A8199D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSNCoFMK_XcA for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:53:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AED781959
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:53:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 005358353F; Sun, 12 Dec 2021 15:48:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 16:50:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac629ef040fc8b10521d2592c944e09fd70b7016
X-Git-Newrev: 251c5f33983ec0a62053530e511b4be5db2246c7
X-Patchwork-Hint: ignore
Message-Id: <20211212154839.005358353F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: bump to version 4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=251c5f33983ec0a62053530e511b4be5db2246c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://git.tuxfamily.org/chrony/chrony.git/tree/NEWS?id=4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...linux-fix-build-with-older-kernel-headers.patch | 33 ----------------------
 package/chrony/chrony.hash                         |  4 +--
 package/chrony/chrony.mk                           |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch b/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
deleted file mode 100644
index 892664f494..0000000000
--- a/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5dab78341bd515692f1b9ff8716a911c3ebf9ee1 Mon Sep 17 00:00:00 2001
-Message-Id: <5dab78341bd515692f1b9ff8716a911c3ebf9ee1.1611839550.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 28 Jan 2021 15:02:40 +0200
-Subject: [PATCH] sys_linux: fix build with older kernel headers
-
-The renameat2 system call was introduced in kernel version 3.15. Fix
-build against older headers.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit a2372b0c3abfc85d11c1684c0fb6370cc329e5c4
-
- sys_linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sys_linux.c b/sys_linux.c
-index 0b24445e173d..202da845edac 100644
---- a/sys_linux.c
-+++ b/sys_linux.c
-@@ -547,7 +547,9 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
-     SCMP_SYS(readlinkat),
-     SCMP_SYS(rename),
-     SCMP_SYS(renameat),
-+#ifdef __NR_renameat2
-     SCMP_SYS(renameat2),
-+#endif
-     SCMP_SYS(stat),
-     SCMP_SYS(stat64),
-     SCMP_SYS(statfs),
--- 
-2.29.2
-
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 87e0cf8ea0..f8dd1438bc 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,4 +1,4 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/10/msg00000.html
-sha256  be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625  chrony-4.0.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2021/05/msg00000.html
+sha256  ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c  chrony-4.1.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index dc162a6c40..5a34f70e1e 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.0
+CHRONY_VERSION = 4.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
