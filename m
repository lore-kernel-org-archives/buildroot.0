Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40964C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE29260EEC;
	Sun, 27 Mar 2022 15:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFk8KMbxDkfP; Sun, 27 Mar 2022 15:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19CD260E2E;
	Sun, 27 Mar 2022 15:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41A561BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACCD34099B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TQLH1hMZ1Z0 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A85E4409B0
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5408985D65; Sun, 27 Mar 2022 15:37:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92dfa760ad556e16340305e94fe1ed1e0dbc1798
X-Git-Newrev: 8974c6fa26f626021aa170678989c57fa81e8faf
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.5408985D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.23.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=8974c6fa26f626021aa170678989c57fa81e8faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0002-lib-alsa-Error-add-missing-include.patch, the upstream fix is part
of this release

Change log:
  https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.6/NEWS

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-lib-alsa-Error-add-missing-include.patch  | 25 ----------------------
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/package/mpd/0002-lib-alsa-Error-add-missing-include.patch b/package/mpd/0002-lib-alsa-Error-add-missing-include.patch
deleted file mode 100644
index c45a087a54..0000000000
--- a/package/mpd/0002-lib-alsa-Error-add-missing-include.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3856224df9160c201bc6d224aa927e7c358e3269 Mon Sep 17 00:00:00 2001
-From: aeolio <git@aeolio.de>
-Date: Tue, 14 Dec 2021 09:01:23 +0100
-Subject: [PATCH] lib/alsa/Error: add missing #include
-
-Downloaded from upstream commit:
-https://github.com/MusicPlayerDaemon/MPD/commit/3856224df9160c201bc6d224aa927e7c358e3269
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/lib/alsa/Error.cxx | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lib/alsa/Error.cxx b/src/lib/alsa/Error.cxx
-index cd351f37d1..8ceb4417ca 100644
---- a/src/lib/alsa/Error.cxx
-+++ b/src/lib/alsa/Error.cxx
-@@ -29,6 +29,7 @@
- 
- #include "Error.hxx"
- 
-+#include <stdarg.h>
- #include <alsa/error.h>
- 
- namespace Alsa {
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 56f88490cf..b09140abf5 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f22c2c25093a05f4566f9cd7207cfbcd8405af67ed29a989bcf8905f80b7a299  mpd-0.23.5.tar.xz
+sha256  cbc5928ee3ee1ef7ff6a58f6ba4afaee16c07e9eb42d0107bcc098010f4f26ed  mpd-0.23.6.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a55e4adde2..12da36098f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).5
+MPD_VERSION = $(MPD_VERSION_MAJOR).6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
