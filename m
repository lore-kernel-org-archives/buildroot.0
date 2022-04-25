Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EAFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568B260B43;
	Mon, 25 Apr 2022 19:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAeX2eQLKX3o; Mon, 25 Apr 2022 19:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49FD460758;
	Mon, 25 Apr 2022 19:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1471BF982
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7DC760E15
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEm44J8KzHEm for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D6F060AC9
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D7E278437E; Mon, 25 Apr 2022 19:25:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:10:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a890e68b6c19b273fc001fa0b2b7eac9bf3b19d
X-Git-Newrev: b02b8ee3bb99cf453675d216701dec7ae6313e38
X-Patchwork-Hint: ignore
Message-Id: <20220425192517.D7E278437E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: bump to version 0.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b02b8ee3bb99cf453675d216701dec7ae6313e38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to version 0.15.1, and adapt to upstream changes:

- Adapted from the old -Dfoo-backend Meson option to the new -Dbackends
  one, which is an array. The set of always enabled backends matches the
  previous selection: drm+libinput always enabled, x11 only if selected.
- Removed the libpng and ffmpeg dependency, which are no longer needed
  with examples disabled (which is always the case for Buildroot).
- Changed homepage and download site URLs to the FreeDesktop.org GitLab.

This release changes the API/ABI, and applications which use wlroots
must be adapted and rebuilt. Currently in Buildroot we have only the
cage compositor, to be updated in a follow-up patch.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wlroots/Config.in    |  2 +-
 package/wlroots/wlroots.hash |  4 ++--
 package/wlroots/wlroots.mk   | 19 ++++++++-----------
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 8d485992f5..84a4ef846e 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_WLROOTS
 	  wlroots is a modular Wayland library for building compositors
 	  which implements many of their common features.
 
-	  https://github.com/swaywm/wlroots
+	  https://gitlab.freedesktop.org/wlroots/wlroots
 
 if BR2_PACKAGE_WLROOTS
 
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index fdebe1ef68..04bbd65e43 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.14.1/wlroots-0.14.1.tar.gz.sig
-sha256  448a83d579ac280357c8a4e902b9477bacbab81cc4d9c140e443642d458869db  wlroots-0.14.1.tar.gz
+# Generated locally, after checking https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.15.1/downloads/wlroots-0.15.1.tar.gz.sig
+sha256  5b92f11a52d978919ed1306e0d54c9d59f1762b28d44f0a2da3ef3b351305373  wlroots-0.15.1.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 89d5024176..baa1edd9e1 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.14.1
-WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
+WLROOTS_VERSION = 0.15.1
+WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
 WLROOTS_INSTALL_STAGING = YES
@@ -25,19 +25,16 @@ WLROOTS_DEPENDENCIES = \
 
 WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Drenderers=gles2
 
-ifeq ($(BR2_PACKAGE_FFMPEG),y)
-WLROOTS_DEPENDENCIES += ffmpeg
-endif
-
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-WLROOTS_DEPENDENCIES += libpng
-endif
+WLROOTS_BACKENDS = libinput drm
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
-WLROOTS_CONF_OPTS += -Dx11-backend=enabled -Dxwayland=enabled
+WLROOTS_BACKENDS += x11
+WLROOTS_CONF_OPTS += -Dxwayland=enabled
 WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
 else
-WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
+WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
 
+WLROOTS_CONF_OPTS += -Dbackends=$(subst $(space),$(comma),$(strip $(WLROOTS_BACKENDS)))
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
