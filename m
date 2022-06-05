Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF7AC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52BC684102;
	Sun,  5 Jun 2022 20:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwqURbjoaGkv; Sun,  5 Jun 2022 20:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6C6840FC;
	Sun,  5 Jun 2022 20:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 038261BF968
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F411A40104
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ujGrmXQmnabD for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29C0340222
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8805686BCB; Sun,  5 Jun 2022 20:13:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 22:23:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e04f1b015989ff924384861cb2872f84eade4155
X-Git-Newrev: 3a6c130754d80005d3212ea7426599fe3a679ad6
X-Patchwork-Hint: ignore
Message-Id: <20220605201306.8805686BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rauc: bump to version
 1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a6c130754d80005d3212ea7426599fe3a679ad6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch that is already in upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-src-verify_hash.c-include-inttypes.h.patch | 38 ----------------------
 package/rauc/rauc.hash                             |  2 +-
 package/rauc/rauc.mk                               |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch b/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
deleted file mode 100644
index 916c8cca0b..0000000000
--- a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b19a9c26d88a913417e77aaf60c72cdbf393d1f6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 31 May 2022 21:22:36 +0200
-Subject: [PATCH] src/verify_hash.c: include inttypes.h
-
-Include inttypes.h to avoid the following build failure:
-
-In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
-                 from src/verity_hash.c:26:
-src/verity_hash.c: In function 'verify_zero':
-src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
-   69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
-      |                                                       ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rauc/rauc/pull/914]
----
- src/verity_hash.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/verity_hash.c b/src/verity_hash.c
-index db82a78..3b2c2a0 100644
---- a/src/verity_hash.c
-+++ b/src/verity_hash.c
-@@ -19,6 +19,7 @@
-  */
- 
- #include <errno.h>
-+#include <inttypes.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.35.1
-
diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index f6c1446de4..677d358158 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
 # https://github.com/rauc/rauc/releases/download/v1.6/rauc-1.6.tar.xz.asc
-sha256  86013788dd02321b7c3f913ad3a1f8802afbc784ec076fa278524a9e1ef9e7b0  rauc-1.6.tar.xz
+sha256  8b7d37cc1eb57df4f03de3c943dd7be290b78d47be28881e8b1f070e1d5e55df  rauc-1.7.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 0520b30521..90b2317d4b 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.6
+RAUC_VERSION = 1.7
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
