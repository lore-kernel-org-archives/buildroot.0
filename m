Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ABEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73E0F4090A;
	Sat,  8 Jan 2022 13:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2cESJiKt664; Sat,  8 Jan 2022 13:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD96408F2;
	Sat,  8 Jan 2022 13:45:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E13621BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEE8D60AA4
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsjOyzHXtrnE for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:45:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E971260634
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:45:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8C33582BC6; Sat,  8 Jan 2022 13:39:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 14:45:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5ecbffe61594ea572da18d1550a7cbdc28b7e1d
X-Git-Newrev: cd84e1bcf9f116ccff2092124d56c1203d831a42
X-Patchwork-Hint: ignore
Message-Id: <20220108133926.8C33582BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.23.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd84e1bcf9f116ccff2092124d56c1203d831a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched project URL to HTTPS as HTTP redirects to it.

Added upstream patch to fix build error with uClibc:
https://github.com/MusicPlayerDaemon/MPD/commit/3856224df9160c201bc6d224aa927e7c358e3269
https://github.com/MusicPlayerDaemon/MPD/pull/1382

Changelog:
https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.5/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: also update MPD_SITE]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-lib-alsa-Error-add-missing-include.patch  | 25 ++++++++++++++++++++++
 package/mpd/Config.in                              |  2 +-
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  4 ++--
 4 files changed, 29 insertions(+), 4 deletions(-)

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
index 7bda0963c6..6f01b29c6d 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).3
+MPD_VERSION = $(MPD_VERSION_MAJOR).5
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
-MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
+MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
