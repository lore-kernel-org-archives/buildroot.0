Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA3CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025B942954;
	Fri,  7 Jan 2022 17:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejj6EScbPtdG; Fri,  7 Jan 2022 17:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C5F44291E;
	Fri,  7 Jan 2022 17:55:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB961BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28A98400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVsZFN5wVEJJ for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:55:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3187740002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:55:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B39B682B9C; Fri,  7 Jan 2022 17:49:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:55:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8604c57da7e54bfd55747ed161b5c51a870d3549
X-Git-Newrev: b0cfb1b90c1bb41dc95d7d3ab9cef1ae358a067c
X-Patchwork-Hint: ignore
Message-Id: <20220107174943.B39B682B9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0cfb1b90c1bb41dc95d7d3ab9cef1ae358a067c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new meson configuration options and optional dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index c41c0a3686..8464a56338 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b6a2eab8bda2f3cb87c3a0a714839696831ad27b5786674c4bd6c3776b9ebc97  pipewire-0.3.40.tar.bz2
+sha256  2e91f228ffb93494f2423956b930014de20e15639a03f3df4fca4ebf4bc51fc0  pipewire-0.3.43.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 7043745cc1..604d08f90d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.40
+PIPEWIRE_VERSION = 0.3.43
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -28,7 +28,8 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideoconvert=enabled \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled \
-	-Dsession-managers=[]
+	-Dsession-managers=[] \
+	-Dlv2=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -174,6 +175,13 @@ else
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PIPEWIRE_CONF_OPTS += -Draop=enabled
+PIPEWIRE_DEPENDENCIES += openssl
+else
+PIPEWIRE_CONF_OPTS += -Draop=disabled
+endif
+
 define PIPEWIRE_USERS
 	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
