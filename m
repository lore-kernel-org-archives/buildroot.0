Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DE4CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 11:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4550D617BB;
	Sat, 13 Sep 2025 11:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wZSdlajsJP3; Sat, 13 Sep 2025 11:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68514617B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68514617B4;
	Sat, 13 Sep 2025 11:00:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12BEA25B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04BC1617B4
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzyBUBXvSkFY for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 11:00:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EC9610A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EC9610A0
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:00:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7093843BA; Sat, 13 Sep 2025 11:00:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 12:53:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0b77bb90d4151c989443524aed11025c4353c88
X-Git-Newrev: 438042c6fc5f0a3ffa568867d6e4776ce2c18709
X-Patchwork-Hint: ignore
Message-Id: <20250913110046.D7093843BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.8.4
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
Content-Type: multipart/mixed; boundary="===============8795524417802314924=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8795524417802314924==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=438042c6fc5f0a3ffa568867d6e4776ce2c18709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announce:
https://lore.kernel.org/linux-nfs/6f271c01-cd4b-456b-80ac-77a96b99a1fe@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../nfs-utils/0001-Fix-build-with-glibc-2.42.patch | 59 ----------------------
 package/nfs-utils/nfs-utils.hash                   |  4 +-
 package/nfs-utils/nfs-utils.mk                     |  2 +-
 3 files changed, 3 insertions(+), 62 deletions(-)

diff --git a/package/nfs-utils/0001-Fix-build-with-glibc-2.42.patch b/package/nfs-utils/0001-Fix-build-with-glibc-2.42.patch
deleted file mode 100644
index 6bf3622586..0000000000
--- a/package/nfs-utils/0001-Fix-build-with-glibc-2.42.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9f974046c37b7c28705d5558328759fff708b1cb Mon Sep 17 00:00:00 2001
-From: Yaakov Selkowitz <yselkowi@redhat.com>
-Date: Fri, 27 Jun 2025 04:54:08 -0500
-Subject: Fix build with glibc-2.42
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-exportfs.c: In function ‘release_lockfile’:
-exportfs.c:83:17: error: ignoring return value of ‘lockf’ declared with attribute ‘warn_unused_result’ [-Werror=unused-result]
-   83 |                 lockf(_lockfd, F_ULOCK, 0);
-      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
-exportfs.c: In function ‘grab_lockfile’:
-exportfs.c:77:17: error: ignoring return value of ‘lockf’ declared with attribute ‘warn_unused_result’ [-Werror=unused-result]
-   77 |                 lockf(_lockfd, F_LOCK, 0);
-      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
-
-lockf is now marked with attribute warn_unused_result:
-
-https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f3c82fc1b41261f582f5f9fa12f74af9bcbc88f9
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=9f974046c37b7c28705d5558328759fff708b1cb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- utils/exportfs/exportfs.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
-index b03a047b..748c38e3 100644
---- a/utils/exportfs/exportfs.c
-+++ b/utils/exportfs/exportfs.c
-@@ -74,13 +74,19 @@ grab_lockfile(void)
- {
- 	_lockfd = open(lockfile, O_CREAT|O_RDWR, 0666);
- 	if (_lockfd != -1)
--		lockf(_lockfd, F_LOCK, 0);
-+		if (lockf(_lockfd, F_LOCK, 0) != 0) {
-+			xlog_warn("%s: lockf() failed: errno %d (%s)",
-+			__func__, errno, strerror(errno));
-+		}
- }
- static void
- release_lockfile(void)
- {
- 	if (_lockfd != -1) {
--		lockf(_lockfd, F_ULOCK, 0);
-+		if (lockf(_lockfd, F_ULOCK, 0) != 0) {
-+			xlog_warn("%s: lockf() failed: errno %d (%s)",
-+			__func__, errno, strerror(errno));
-+		}
- 		close(_lockfd);
- 		_lockfd = -1;
- 	}
--- 
-cgit v1.2.3
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index af5fc8bd73..fb5c03d917 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.3/sha256sums.asc
-sha256  11e7c5847a8423a72931c865bd9296e7fd56ff270a795a849183900961711725  nfs-utils-2.8.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.4/sha256sums.asc
+sha256  11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5  nfs-utils-2.8.4.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 0af0254d3f..e7d82b10ba 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.3
+NFS_UTILS_VERSION = 2.8.4
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+

--===============8795524417802314924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8795524417802314924==--
