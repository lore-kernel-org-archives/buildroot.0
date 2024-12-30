Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E060C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80AC24EF86;
	Fri, 28 Feb 2025 16:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGhziYxar_JF; Fri, 28 Feb 2025 16:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0624EFFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED0624EFFE;
	Fri, 28 Feb 2025 16:49:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5283068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1473E41A3C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyJLfCctEeFG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4639A424BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4639A424BB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4205887AF5; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 20:42:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 954b5514a92d9d8439d57a815f097046e6270bb9
X-Git-Newrev: 8c9c1222b79a83c753527203ee5e5ee58738e83a
X-Patchwork-Hint: ignore
Message-Id: <20250228162955.4205887AF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uacme: bump version to
 1.7.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c9c1222b79a83c753527203ee5e5ee58738e83a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://github.com/ndilieto/uacme/blob/v1.7.6/ChangeLog

Also removed 0001-Fix-cross-compilation.patch which is included in
version 1.7.6

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uacme/0001-Fix-cross-compilation.patch | 29 --------------------------
 package/uacme/uacme.hash                       |  2 +-
 package/uacme/uacme.mk                         |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/uacme/0001-Fix-cross-compilation.patch b/package/uacme/0001-Fix-cross-compilation.patch
deleted file mode 100644
index cc384f2c36..0000000000
--- a/package/uacme/0001-Fix-cross-compilation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cdf63e24dc475a558400c68714e32d32904e4c57 Mon Sep 17 00:00:00 2001
-From: Nicola Di Lieto <nicola.dilieto@gmail.com>
-Date: Tue, 20 Feb 2024 01:05:00 +0100
-Subject: [PATCH] Fix cross compilation
-
-Commit fe826f4b1931ae508047d8b2693b5b6ac2cb21fd broke cross compilation
-
-Closes https://github.com/ndilieto/uacme/issues/79
-
-Upstream: https://github.com/ndilieto/uacme/commit/cdf63e24dc475a558400c68714e32d32904e4c57
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 77d1230..3bec75b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -355,7 +355,8 @@ if test "x$OPT_UALPN" != "xno"; then
-                 AC_DEFINE(HAVE_MAP_DEVZERO, 1, [if mmap("/dev/zero", MAP_SHARED) works])
-                 AC_MSG_RESULT([yes]),
-                 AC_MSG_RESULT([no])
--                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)])),
-+                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)]))
-+        ], [
-             AC_COMPILE_IFELSE([AC_LANG_SOURCE([#include <sys/mman.h>
-                              int main() {return mmap(0, 4096, PROT_READ|PROT_WRITE,
-                                 MAP_ANON|MAP_SHARED, -1, 0) == MAP_FAILED;}])],
diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 9a274bf394..26b73ef950 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  596b2fba75fedc7a410dd71583c828642ecd486dfdcfde109dfebb82a374abbe  uacme-1.7.5.tar.gz
+sha256  d11a86ac2a0dbf285de27dff4193c65f7f3736da3d0480049af50d305940e0d6  uacme-1.7.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 0fcb5c5c34..ec538cec12 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.5
+UACME_VERSION = 1.7.6
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
