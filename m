Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5989DC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0192740239;
	Sat, 17 Sep 2022 08:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0192740239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lOLAsjFENd5N; Sat, 17 Sep 2022 08:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA5040193;
	Sat, 17 Sep 2022 08:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EA5040193
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2151BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA87041D0F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA87041D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i57gMrW9VDho for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:25:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF4CF41CF1
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4CF41CF1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AB7DC83FED; Sat, 17 Sep 2022 08:25:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 10:25:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a20fe66a1553b7c4299f5fb6e7e599cb5fc6bbb5
X-Git-Newrev: 4134dff6203885269cf35a9c94e751485e496ead
X-Patchwork-Hint: ignore
Message-Id: <20220917082529.AB7DC83FED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnspr: bump to version 4.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=4134dff6203885269cf35a9c94e751485e496ead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's drop local patch that has been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Bug-1765100-fix-build-on-mips-musl-libc.patch | 33 ----------------------
 package/libnspr/libnspr.hash                       |  4 +--
 package/libnspr/libnspr.mk                         |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
deleted file mode 100644
index 10bf74130c..0000000000
--- a/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 00e5b818f2d9f3264107801fc2fcff33a9355a78 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sun, 17 Apr 2022 23:55:26 +0200
-Subject: [PATCH] Bug 1765100 - fix build on mips+musl libc
-
-This patch fix build failure on mips with musl libc by using Linux
-<asm/sgidefs.h> instead of the one provided by libc since musl doesn't
-provide <sgidefs.h>.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
-This patch is pending upstream:
-https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
----
- nspr/pr/include/md/_linux.cfg | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nspr/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
-index 23b160fd..dbc0d40e 100644
---- a/nspr/pr/include/md/_linux.cfg
-+++ b/nspr/pr/include/md/_linux.cfg
-@@ -499,7 +499,7 @@
- #elif defined(__mips__)
- 
- /* For _ABI64 */
--#include <sgidefs.h>
-+#include <asm/sgidefs.h>
- 
- #ifdef __MIPSEB__
- #define IS_BIG_ENDIAN 1
--- 
-2.25.1
-
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index a368f02c54..c569135663 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.34.1/src/SHA256SUMS
-sha256  c5b8354c48b632b8f4c1970628146c0e0c0ca8f32c7315d7d5736c002e03774f  nspr-4.34.1.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.35/src/SHA256SUMS
+sha256  7ea3297ea5969b5d25a5dd8d47f2443cda88e9ee746301f6e1e1426f8a6abc8f  nspr-4.35.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index fcb2a1db49..e891aa4852 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.34.1
+LIBNSPR_VERSION = 4.35
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
