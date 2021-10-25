Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED38C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:19:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F0DA60E74
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F0DA60E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36942608A8;
	Mon, 25 Oct 2021 20:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojaly-_DKygH; Mon, 25 Oct 2021 20:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95A7060807;
	Mon, 25 Oct 2021 20:19:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12F961BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF73E403CB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIMsiQMb71we for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B10AA403DD
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 115D388984; Mon, 25 Oct 2021 20:15:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09f1367c3020c8c43a178bda2cd72de6343d65d3
X-Git-Newrev: 95b812188f20dc4be3997d6f9c8e788933c24136
X-Patchwork-Hint: ignore
Message-Id: <20211025201509.115D388984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuio: bump to
 6ef3d8d096a641686bfdd112035aa04aa16fe81a
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

commit: https://git.buildroot.net/buildroot/commit/?id=95b812188f20dc4be3997d6f9c8e788933c24136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libuio/0002-fix-build-with-musl.patch | 57 ---------------------------
 package/libuio/libuio.hash                    |  2 +-
 package/libuio/libuio.mk                      |  3 +-
 3 files changed, 2 insertions(+), 60 deletions(-)

diff --git a/package/libuio/0002-fix-build-with-musl.patch b/package/libuio/0002-fix-build-with-musl.patch
deleted file mode 100644
index 6e5b168c14..0000000000
--- a/package/libuio/0002-fix-build-with-musl.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c378ee112857128002754c616acb6841ee32aaf6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 2 Jul 2016 10:52:28 +0200
-Subject: [PATCH] fix build with musl
-
-limits.h header is missing in attr.c, base.c and helper.c to provide
-PATH_MAX.
-
-Fixes:
-http://autobuild.buildroot.net/results/702/7023104e6018ea46c54073ddbe5119d0f66ae5a3
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- attr.c   | 1 +
- base.c   | 1 +
- helper.c | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/attr.c b/attr.c
-index 4245140..7512f4e 100644
---- a/attr.c
-+++ b/attr.c
-@@ -25,6 +25,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/base.c b/base.c
-index 14ebcee..4ce7301 100644
---- a/base.c
-+++ b/base.c
-@@ -25,6 +25,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/helper.c b/helper.c
-index 170f084..1fb0b4c 100644
---- a/helper.c
-+++ b/helper.c
-@@ -25,6 +25,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <regex.h>
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.5.5
-
diff --git a/package/libuio/libuio.hash b/package/libuio/libuio.hash
index 54fb02b112..48904a94ce 100644
--- a/package/libuio/libuio.hash
+++ b/package/libuio/libuio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1494375bd493ef1a1b868ce2cbc7d29f3f9f692c21f70689eae28566e56f2c15  libuio-ca28ff0f69d89a789a47552c72db5a43d280710b.tar.gz
+sha256  cb6d2ed1c6c7fd8e0e4a9cb1d81bd88f3af37bd239fdf8966b3cb3671ff6db86  libuio-6ef3d8d096a641686bfdd112035aa04aa16fe81a.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index b6e8e7e774..a0285277ab 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# v0.2.8
-LIBUIO_VERSION = ca28ff0f69d89a789a47552c72db5a43d280710b
+LIBUIO_VERSION = 6ef3d8d096a641686bfdd112035aa04aa16fe81a
 LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
 LIBUIO_LICENSE = LGPL-2.1 (library), GPL-2.0 (programs)
 LIBUIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
