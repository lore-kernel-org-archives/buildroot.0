Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4356C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 759F481E67;
	Sun,  7 May 2023 12:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759F481E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlI0he1PUluj; Sun,  7 May 2023 12:08:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E0881F1B;
	Sun,  7 May 2023 12:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E0881F1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C484E1BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69FD44049E
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69FD44049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxHkyS4kKpZH for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF722404FF
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF722404FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED68F85EEC; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:59:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4e8a18e96724339b69cade4f6bb1c3d27e360b1
X-Git-Newrev: cd1b1bcc0ec31b3af8d901cb7e05bd2794e3130f
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.ED68F85EEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ark: bump
 version to 0.7.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd1b1bcc0ec31b3af8d901cb7e05bd2794e3130f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003328.html

Removed patch which was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: regenerate .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 .../xdriver_xf86-video-ark/0001-mibstore.patch     | 40 ----------------------
 .../xdriver_xf86-video-ark.hash                    |  5 +--
 .../xdriver_xf86-video-ark.mk                      |  6 ++--
 4 files changed, 6 insertions(+), 46 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dd57e8062d..476a802770 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1695,7 +1695,6 @@ package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch Ups
 package/x11r7/xdriver_xf86-input-libinput/0001-build-get-rid-of-sdkdir.patch Upstream
 package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch Upstream
 package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch Upstream
-package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch Upstream
 package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch Upstream
 package/x11r7/xdriver_xf86-video-ati/0002-ati-cleanup-terminology-to-use-primary-secondary.patch Upstream
 package/x11r7/xdriver_xf86-video-ati/0003-Guard-local-variable-priv-only-used-with-glamor.patch Upstream
diff --git a/package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch b/package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch
deleted file mode 100644
index fa3e68596a..0000000000
--- a/package/x11r7/xdriver_xf86-video-ark/0001-mibstore.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3a3eb72baec46f48e6cf15a834271c3d3386deac Mon Sep 17 00:00:00 2001
-From: Gaetan Nadon <memsize@videotron.ca>
-Date: Tue, 17 Sep 2013 19:55:37 +0000
-Subject: Remove usage of mibstore.h (removed from server)
-
-The module had a compile error for this missing header file.
-
-Changes similar to vmware commit
-23d87c92b7211cc5249eefe4ab3a2c7f370e279e
-
-Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
-Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-ark/commit/?id=3a3eb72baec46f48e6cf15a834271c3d3386deac
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/ark_driver.c b/src/ark_driver.c
-index b7c287c..65cfe84 100644
---- a/src/ark_driver.c
-+++ b/src/ark_driver.c
-@@ -39,7 +39,6 @@
- #include "compiler.h"
- #include "mipointer.h"
- #include "micmap.h"
--#include "mibstore.h"
- #include "fb.h"
- #include "ark.h"
- 
-@@ -538,7 +537,6 @@ static Bool ARKScreenInit(SCREEN_INIT_ARGS_DECL)
- 
- 	fbPictureInit (pScreen, 0, 0);
- 
--	miInitializeBackingStore(pScreen);
- 	xf86SetBackingStore(pScreen);
- 
- 	if (!pARK->NoAccel) {
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
index 2e2e953676..68131fdb38 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2012-July/002007.html
-sha256  c690e046f34a393aac1c8d9616b4790e93cda60a460b00b9597d322175dbe51e  xf86-video-ark-0.7.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003328.html
+sha256  5acc9e78122ff6f4390787b2d0d44df81379bd613b6245983cc4bf3f325d085d  xf86-video-ark-0.7.6.tar.xz
+sha512  a52623e07eef6fa12d77b1afc55bb74b21662b850515b3a32bbf5988dcea2e787b4eddf4e020279aa4e4ddba436505ca9298548406913031e0ed5edaac835491  xf86-video-ark-0.7.6.tar.xz
 # Locally calculated
 sha256  8ba9850fb0ecd9033bb1d25c1be85625cb53ca56ce76b71f78f4a034f7310bda  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 3f2a63609e..6301a97300 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.5
-XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_ARK_VERSION = 0.7.6
+XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_ARK_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_ARK_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ARK_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
