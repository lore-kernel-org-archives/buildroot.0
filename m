Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CC9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 09:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2D782CCB;
	Wed,  5 Jan 2022 09:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOPZVN2jBxsy; Wed,  5 Jan 2022 09:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D30282C91;
	Wed,  5 Jan 2022 09:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 244D71BF390
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07B4082CC7
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdvxYg3Era3g for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 09:32:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 549B082C91
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 09:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3E12C83236; Wed,  5 Jan 2022 09:26:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 10:29:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56d9b887685c86fd4fbadda247cdbe733d499e81
X-Git-Newrev: 75a4ab2e8708e118576326c026a4f98a924f31ff
X-Patchwork-Hint: ignore
Message-Id: <20220105092630.3E12C83236@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: bump to version 3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=75a4ab2e8708e118576326c026a4f98a924f31ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop third patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-utils-getseuser.c-fix-build-with-gcc-4.8.patch | 47 ----------------------
 package/libselinux/libselinux.hash                 |  4 +-
 package/libselinux/libselinux.mk                   |  2 +-
 3 files changed, 3 insertions(+), 50 deletions(-)

diff --git a/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch b/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 645e84b236..0000000000
--- a/package/libselinux/0003-libselinux-utils-getseuser.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5c4ddfc88f0a7f10a5e9edddbdbe8e8ef1f9945e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 10 Jun 2021 07:38:02 +0200
-Subject: [PATCH] libselinux/utils/getseuser.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 which is raised since
-version 3.2 and
-https://github.com/SELinuxProject/selinux/commit/156dd0de5cad31e7d437c64e11a8aef027f0a691
-
-getseuser.c:53:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < n; i++)
-  ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/37eb0952a763256fbf6ef3c668f6c95fbdf2dd35
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/SELinuxProject/selinux/pull/289]
----
- libselinux/utils/getseuser.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/getseuser.c b/utils/getseuser.c
-index ce1b7b27..34f2e887 100644
---- a/utils/getseuser.c
-+++ b/utils/getseuser.c
-@@ -9,7 +9,7 @@ int main(int argc, char **argv)
- {
- 	char *seuser = NULL, *level = NULL;
- 	char **contextlist;
--	int rc, n;
-+	int rc, n, i;
- 
- 	if (argc != 3) {
- 		fprintf(stderr, "usage:  %s linuxuser fromcon\n", argv[0]);
-@@ -50,7 +50,7 @@ int main(int argc, char **argv)
- 	if (n == 0)
- 		printf("no valid context found\n");
- 
--	for (int i = 0; i < n; i++)
-+	for (i = 0; i < n; i++)
- 		printf("Context %d\t%s\n", i, contextlist[i]);
- 
- 	freeconary(contextlist);
--- 
-2.30.2
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 797b978ee1..a2e0083f7b 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 df758ef1d9d4811051dd901ea6b029ae334ffd7c671c128beb16bce1e25ac161 libselinux-3.2.tar.gz
+sha256  acfdee27633d2496508c28727c3d41d3748076f66d42fccde2e6b9f3463a7057  libselinux-3.3.tar.gz
 
 # Hash for license file
-sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
+sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 0f36db1cfd..c1e90130d2 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.2
+LIBSELINUX_VERSION = 3.3
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
