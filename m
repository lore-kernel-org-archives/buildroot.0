Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F91C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:05:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8D760F6B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E8D760F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEA764039D;
	Sat, 13 Nov 2021 17:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZarCBxNFVzNK; Sat, 13 Nov 2021 17:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2930F40501;
	Sat, 13 Nov 2021 17:05:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45DA31BF42D
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C4480EAE
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MLrrHrmtzFv for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EF1A80C86
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:04:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 074BA8CA19; Sat, 13 Nov 2021 17:00:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:04:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeb5cc0eebd96f4cac48181efd25e29189e74508
X-Git-Newrev: 1e48b159dc2be3f7ab6c82987055d655c8c9dac8
X-Patchwork-Hint: ignore
Message-Id: <20211113170014.074BA8CA19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: security bump to
 version 5.62
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e48b159dc2be3f7ab6c82987055d655c8c9dac8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop second patch (already in version)
- Fix CVE-2021-43400: An issue was discovered in gatt-database.c in BlueZ
  5.61. A use-after-free can occur when a client disconnects during D-Bus
  processing of a WriteValue call.

http://www.bluez.org/release-of-bluez-5-62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |  2 +-
 .../0002-profiles-audio-media.c-rename-pause.patch | 52 ----------------------
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  2 +-
 4 files changed, 3 insertions(+), 55 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index f4c7fc3cbb..e671431093 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.61
+BLUEZ5_UTILS_HEADERS_VERSION = 5.62
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch b/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
deleted file mode 100644
index a7fabc9edd..0000000000
--- a/package/bluez5_utils/0002-profiles-audio-media.c-rename-pause.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0bb5785a68a2799db003364770be3764af9b9034 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Sep 2021 13:55:49 +0200
-Subject: [PATCH] profiles/audio/media.c: rename pause
-
-Rename pause to media_player_pause to avoid the following build failure:
-
-profiles/audio/media.c:1284:13: error: conflicting types for 'pause'
- 1284 | static bool pause(void *user_data)
-      |             ^~~~~
-In file included from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
-                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
-                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
-                 from /tmp/instance-0/output-1/per-package/bluez5_utils/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib.h:34,
-                 from profiles/audio/media.c:21:
-/tmp/instance-0/output-1/per-package/bluez5_utils/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:489:12: note: previous declaration of 'pause' was here
-  489 | extern int pause (void);
-      |            ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/c4fbface34be8815838fd7201621d7a8fddd32c5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- profiles/audio/media.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/profiles/audio/media.c b/profiles/audio/media.c
-index 267722542..f93b74e67 100644
---- a/profiles/audio/media.c
-+++ b/profiles/audio/media.c
-@@ -1281,7 +1281,7 @@ static bool stop(void *user_data)
- 	return media_player_send(mp, "Stop");
- }
- 
--static bool pause(void *user_data)
-+static bool media_player_pause(void *user_data)
- {
- 	struct media_player *mp = user_data;
- 
-@@ -1331,7 +1331,7 @@ static struct avrcp_player_cb player_cb = {
- 	.set_volume = set_volume,
- 	.play = play,
- 	.stop = stop,
--	.pause = pause,
-+	.pause = media_player_pause,
- 	.next = next,
- 	.previous = previous,
- };
--- 
-2.33.0
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 3ba2482468..3ec4acac7f 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b  bluez-5.61.tar.xz
+sha256  38090a5b750e17fc08d3e52178ed8d3254c5f4bd2c48830d5c1955b88e3bc0c2  bluez-5.62.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index ce927b7a43..cf46d6e0d6 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.61
+BLUEZ5_UTILS_VERSION = 5.62
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
