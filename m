Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE77C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BBEB60EA6;
	Sat,  1 Oct 2022 16:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BBEB60EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgrfG3NjDdit; Sat,  1 Oct 2022 16:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DED60AC9;
	Sat,  1 Oct 2022 16:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2DED60AC9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9A31BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF704183A
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FF704183A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7pJqE9I3UmQ for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:50:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 112374181D
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 112374181D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0DF3866EB; Sat,  1 Oct 2022 16:50:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 18:50:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e4c0e722f4d9494c2451458a42d4c4f8ef006ab
X-Git-Newrev: 8f67d23af11510b447d9d0e1a71249f97e655305
X-Patchwork-Hint: ignore
Message-Id: <20221001165048.F0DF3866EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: bump to version 2.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f67d23af11510b447d9d0e1a71249f97e655305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-tools-gensiot-Fix-build-with-musl.patch   | 29 ----------------------
 package/gensio/gensio.hash                         |  6 ++---
 package/gensio/gensio.mk                           |  2 +-
 3 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch b/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
deleted file mode 100644
index 7cda950c9e..0000000000
--- a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 64f8f754447572a6b7bed4038a9a29a12b448479 Mon Sep 17 00:00:00 2001
-From: Jan Luebbe <jlu@pengutronix.de>
-Date: Thu, 25 Aug 2022 12:19:16 +0200
-Subject: [PATCH] tools:gensiot: Fix build with musl
-
-According to POSIX getpid() is available in unistd.h, not sys/unistd.h.
-
-Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
-
-[Retrieved from:
-https://github.com/cminyard/gensio/commit/64f8f754447572a6b7bed4038a9a29a12b448479]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/gensiotool.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/gensiotool.c b/tools/gensiotool.c
-index cac531bb..ab0bb958 100644
---- a/tools/gensiotool.c
-+++ b/tools/gensiotool.c
-@@ -44,7 +44,7 @@
- #include <signal.h>
- #include <errno.h>
- #include <sys/types.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- #include <syslog.h>
- #endif
- 
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index a0db4bc516..84af3fdab1 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  60f90f62180922e2c7550877c4bb950c  gensio-2.5.2.tar.gz
-sha1  b6c2ec39b51a56f5d28e88a59122f4c65ff844fa  gensio-2.5.2.tar.gz
+md5  c8d65e1809ed5cd1138fa309e3ab0e94  gensio-2.5.5.tar.gz
+sha1  076fc8324dedb658972a88c738131a409968e2ba  gensio-2.5.5.tar.gz
 # Locally computed:
-sha256  f7bc3d2ba9da73489dd3227a21ddd2f44a18c443185ce2b1a08ec564da06e6d1  gensio-2.5.2.tar.gz
+sha256  63c5fff536efd080fb7bc7fa084331c19fc64abd42b7f2bec86bd77b4fd10840  gensio-2.5.5.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index f1cc00bf32..5538f97b19 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.5.2
+GENSIO_VERSION = 2.5.5
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
