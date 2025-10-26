Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825E9CCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 13:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A1E40485;
	Sun, 26 Oct 2025 13:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joOYBvuUHroL; Sun, 26 Oct 2025 13:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E31240488
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E31240488;
	Sun, 26 Oct 2025 13:28:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AA8BD7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C04F60EFB
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8E1ttAfcwJQ for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 13:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1E0260A6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1E0260A6E
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:28:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B147D878E3; Sun, 26 Oct 2025 13:28:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 14:22:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cc346e763341f3abf88096701b3deb0889c43bb
X-Git-Newrev: b7d96a1381e6cd82aa717b34ff7270d6a230187b
X-Patchwork-Hint: ignore
Message-Id: <20251026132847.B147D878E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblo: bump to version 0.34
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7d96a1381e6cd82aa717b34ff7270d6a230187b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstreamed local patch

Release Notes:
https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: reorder hashes in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ver.c-fix-build-failure-as-static-library.patch | 34 ----------------------
 package/liblo/liblo.hash                           |  8 ++---
 package/liblo/liblo.mk                             |  2 +-
 3 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch b/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
deleted file mode 100644
index caeee536a0..0000000000
--- a/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 74b228c74c7821dbe16d7730040030eed2f01a28 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 7 Jul 2025 22:58:10 +0200
-Subject: [PATCH] server.c: fix build failure as static library
-
-As static library strncpy() can't determine precise maximum characters
-because strlen() is variable, so to fix build failure let's convert 3
-lines into one by using strdup() that does the same as the actual code.
-
-Upstream: https://sourceforge.net/p/liblo/patches/9/
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- src/server.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/server.c b/src/server.c
-index 130f6d5..1236279 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -2062,10 +2062,7 @@ static void dispatch_method(lo_server s, const char *path,
-                     char *tmp;
-                     char *sec;
- 
--                    int tmplen = (int) strlen(it->path + len) + 1;
--                    tmp = (char*) malloc(strlen(it->path + len) + 1);
--                    strncpy(tmp, it->path + len, tmplen);
--                    tmp[tmplen-1]=0;
-+                    tmp = strdup(it->path + len);
-                     sec = strchr(tmp, '/');
-                     if (sec)
-                         *sec = '\0';
--- 
-2.39.5
-
diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index a87b6233dd..cab192b421 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.32/
-sha1  e660cf3f630f9255a626102b4ff5082114ebd8a1  liblo-0.32.tar.gz
-md5  a93a7a9da084e6a0937bde6fc324a52a  liblo-0.32.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.34/
+md5  14a65154e8f2609f558ce2648f1c99ef  liblo-0.34.tar.gz
+sha1  0bcc3f30a4cdd2f41fe6c20c48f92bcaeaa8e6bc  liblo-0.34.tar.gz
 
 # Locally computed
-sha256  5df05f2a0395fc5ac90f6b538b8c82bb21941406fd1a70a765c7336a47d70208  liblo-0.32.tar.gz
+sha256  69aa0cd365dba5ea7799b850a7da659ad303e6074bbd67f4ab84e4d6f5f6c3a4  liblo-0.34.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index c47e06c0a3..ab30feab81 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.32
+LIBLO_VERSION = 0.34
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
