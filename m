Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF30C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:19:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432DD60F36
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 432DD60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F193606B8;
	Fri, 13 Aug 2021 13:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34ufRVJqjJTa; Fri, 13 Aug 2021 13:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FA860BCA;
	Fri, 13 Aug 2021 13:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AE611BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AABA60BB2
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USX5EmQt-1Wd for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:19:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DB3260C15
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:19:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C8F5C87ECA; Fri, 13 Aug 2021 13:18:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:17:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0b694a008de0ae06e2d0bb0283ebeb82ca272870
X-Git-Newrev: cce9eeac8b70878cb0a0f6a990aa99e517529e10
X-Patchwork-Hint: ignore
Message-Id: <20210813131834.C8F5C87ECA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wlroots: bump to
 version 0.14.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cce9eeac8b70878cb0a0f6a990aa99e517529e10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to version 0.14.1, and adapt to upstream changes:

- seatd/libseat is now used unconditionally, the logind/elogind build
  options have been removed (which can be used through seatd, no
  functionality is lost).
- Now wlroots includes a software-based renderer (which uses pixman),
  and the OpenGL ES one is optional. For now it is left always enabled
  (as it was before) but this could be changed in the future.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wlroots/Config.in    |  1 +
 package/wlroots/wlroots.hash |  4 ++--
 package/wlroots/wlroots.mk   | 19 +++----------------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 41f8986772..8d485992f5 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_WLROOTS
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_SEATD
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 024ea93cae..fdebe1ef68 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.13.0/wlroots-0.13.0.tar.gz.sig
-sha256  f6bea37fd4a6f5e5f552b83d61adae8c73e64b0bcb9ae0ab464ebcd9309d3cf3  wlroots-0.13.0.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.14.1/wlroots-0.14.1.tar.gz.sig
+sha256  448a83d579ac280357c8a4e902b9477bacbab81cc4d9c140e443642d458869db  wlroots-0.14.1.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 0696d037df..89d5024176 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.13.0
+WLROOTS_VERSION = 0.14.1
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -18,11 +18,12 @@ WLROOTS_DEPENDENCIES = \
 	libegl \
 	libgles \
 	pixman \
+	seatd \
 	udev \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Drenderers=gles2
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 WLROOTS_DEPENDENCIES += ffmpeg
@@ -32,13 +33,6 @@ ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WLROOTS_DEPENDENCIES += libpng
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
-WLROOTS_CONF_OPTS += -Dlogind=enabled -Dlogind-provider=systemd
-WLROOTS_DEPENDENCIES += systemd
-else
-WLROOTS_CONF_OPTS += -Dlogind=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 WLROOTS_CONF_OPTS += -Dx11-backend=enabled -Dxwayland=enabled
 WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
@@ -46,11 +40,4 @@ else
 WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SEATD),y)
-WLROOTS_CONF_OPTS += -Dlibseat=enabled
-WLROOTS_DEPENDENCIES += seatd
-else
-WLROOTS_CONF_OPTS += -Dlibseat=disabled
-endif
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
