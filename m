Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA1CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C0B41632;
	Sat,  8 Jan 2022 10:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eAJIUKMB1hCB; Sat,  8 Jan 2022 10:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FDB408C0;
	Sat,  8 Jan 2022 10:27:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFDB61BF84C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCC58607AA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eI8eLYlcEMBr for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:27:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C36D860797
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:27:25 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout03.t-online.de (Postfix) with SMTP id B9B964647;
 Sat,  8 Jan 2022 11:26:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n68vU-0S9JPl0; Sat, 8 Jan 2022 11:26:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55046)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n68vU-00014z-Jq;
 Sat, 08 Jan 2022 11:26:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 11:26:20 +0100
Message-Id: <20220108102620.1603341-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641637581-0000BD0E-5FA46D40/0/0 CLEAN NORMAL
X-TOI-MSGID: 5cb4a417-9c8d-4323-8daf-a1f3b6cedc96
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump version to 0.23.5
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

Switched project URL to https.

Added upstream patch to fix build error wich uClibc:
https://github.com/MusicPlayerDaemon/MPD/commit/3856224df9160c201bc6d224aa927e7c358e3269
https://github.com/MusicPlayerDaemon/MPD/pull/1382

Changelog:
https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.5/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...2-lib-alsa-Error-add-missing-include.patch | 25 +++++++++++++++++++
 package/mpd/Config.in                         |  2 +-
 package/mpd/mpd.hash                          |  2 +-
 package/mpd/mpd.mk                            |  2 +-
 4 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 package/mpd/0002-lib-alsa-Error-add-missing-include.patch

diff --git a/package/mpd/0002-lib-alsa-Error-add-missing-include.patch b/package/mpd/0002-lib-alsa-Error-add-missing-include.patch
new file mode 100644
index 0000000000..c45a087a54
--- /dev/null
+++ b/package/mpd/0002-lib-alsa-Error-add-missing-include.patch
@@ -0,0 +1,25 @@
+From 3856224df9160c201bc6d224aa927e7c358e3269 Mon Sep 17 00:00:00 2001
+From: aeolio <git@aeolio.de>
+Date: Tue, 14 Dec 2021 09:01:23 +0100
+Subject: [PATCH] lib/alsa/Error: add missing #include
+
+Downloaded from upstream commit:
+https://github.com/MusicPlayerDaemon/MPD/commit/3856224df9160c201bc6d224aa927e7c358e3269
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/alsa/Error.cxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/alsa/Error.cxx b/src/lib/alsa/Error.cxx
+index cd351f37d1..8ceb4417ca 100644
+--- a/src/lib/alsa/Error.cxx
++++ b/src/lib/alsa/Error.cxx
+@@ -29,6 +29,7 @@
+ 
+ #include "Error.hxx"
+ 
++#include <stdarg.h>
+ #include <alsa/error.h>
+ 
+ namespace Alsa {
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index eb10151df3..fc0f409448 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -16,7 +16,7 @@ menuconfig BR2_PACKAGE_MPD
 	  it can play a variety of sound files while being
 	  controlled by its network protocol.
 
-	  http://www.musicpd.org
+	  https://www.musicpd.org
 
 if BR2_PACKAGE_MPD
 
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index cb9d05cd32..56f88490cf 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b300625701005c6b14649f11dac118d05540529a5385d05b7c3062c0ce08f399  mpd-0.23.3.tar.xz
+sha256  f22c2c25093a05f4566f9cd7207cfbcd8405af67ed29a989bcf8905f80b7a299  mpd-0.23.5.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7bda0963c6..42165b1308 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).3
+MPD_VERSION = $(MPD_VERSION_MAJOR).5
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
