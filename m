Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F3DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10787611E7;
	Sat, 11 Dec 2021 21:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrbgq5BruYoJ; Sat, 11 Dec 2021 21:14:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E0186112B;
	Sat, 11 Dec 2021 21:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E56231BF95C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D577E85810
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9P4MKGntjZ0n for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:14:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 017378580E
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:14:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BA54282A0C; Sat, 11 Dec 2021 21:09:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 22:13:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e83e7b85110df99981605d5a22183f8dc6526d4
X-Git-Newrev: aee03038e4231b5eecaebe00f3bafa16316505ba
X-Patchwork-Hint: ignore
Message-Id: <20211211210920.BA54282A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-rsxs: bump
 version to 19.0.1-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=aee03038e4231b5eecaebe00f3bafa16316505ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream.

Release notes:
https://github.com/xbmc/screensavers.rsxs/releases/tag/19.0.1-Matrix

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-impSurface.h-fix-build-with-gcc11.patch   | 29 ----------------------
 .../kodi-screensaver-rsxs.hash                     |  2 +-
 .../kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch b/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
deleted file mode 100644
index 9080731918..0000000000
--- a/package/kodi-screensaver-rsxs/0001-impSurface.h-fix-build-with-gcc11.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fb23e136f88a94aa497e8eb4369bb06435c2aaf8 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 26 Sep 2021 15:59:29 +0200
-Subject: [PATCH] impSurface.h: fix build with gcc11
-
-lib/Implicit/impSurface.h:44:9: error: 'size_t' does not name a type
-   44 |         size_t vertex_data_size;
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Upstream status: https://github.com/xbmc/screensavers.rsxs/pull/52
----
- lib/Implicit/impSurface.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/Implicit/impSurface.h b/lib/Implicit/impSurface.h
-index 388701aa..3319820e 100644
---- a/lib/Implicit/impSurface.h
-+++ b/lib/Implicit/impSurface.h
-@@ -21,6 +21,7 @@
- #ifndef IMPSURFACE_H
- #define IMPSURFACE_H
- 
-+#include <cstddef>
- #include <functional>
- 
- #ifdef WIN32
--- 
-2.30.2
-
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 4ffd035e81..0c2292a223 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d08570d45a7f5bcf43f737a89f2988ebb163590f1746a8f734995711cda0d3a6  kodi-screensaver-rsxs-19.0.0-Matrix.tar.gz
+sha256  9b06aa9745aa1ee6e4c01d3faab8adea7404933779c597537d2223f9f5492c14  kodi-screensaver-rsxs-19.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 1ec8c8003e..0c0ffea02f 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 19.0.0-Matrix
+KODI_SCREENSAVER_RSXS_VERSION = 19.0.1-Matrix
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
