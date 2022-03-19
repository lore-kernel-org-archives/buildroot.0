Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFF7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 06:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E7A660B5F;
	Sat, 19 Mar 2022 06:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKu2WJaqVg7Z; Sat, 19 Mar 2022 06:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E46EE60AD3;
	Sat, 19 Mar 2022 06:12:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 923C71BF846
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 06:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86E8A40385
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 06:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iui2fv2Berv4 for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 06:12:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7980400CB
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 06:12:30 +0000 (UTC)
Received: from iago.. (unknown [151.47.236.3])
 by serv15.avernis.de (Postfix) with ESMTPSA id 24BE0C7085FD;
 Sat, 19 Mar 2022 07:12:26 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 07:11:15 +0100
Message-Id: <20220319061115.1641-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.23.6
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove 0002-lib-alsa-Error-add-missing-include.patch, the upstream fix is part 
of this release

Change log: 
  https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.6/NEWS

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 ...2-lib-alsa-Error-add-missing-include.patch | 25 -------------------
 package/mpd/mpd.hash                          |  2 +-
 package/mpd/mpd.mk                            |  2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 package/mpd/0002-lib-alsa-Error-add-missing-include.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
