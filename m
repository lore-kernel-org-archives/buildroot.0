Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C97C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0676240AFC;
	Fri, 22 Apr 2022 21:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zXyUjyVX557; Fri, 22 Apr 2022 21:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6419940AF5;
	Fri, 22 Apr 2022 21:49:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CDD01BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C62540AF5
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2JYU2pTatJk for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:49:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5883540141
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WjeMnyWEsV11AphvnoiOrdbJgt4HXSciDwP/645LoPE=; b=NYBJJZzbsryQCPUqjAp/hZ9L+Q
 11Sp4/wSHrArJ0gVS+sl7MxNV87sykFTqXtzcuBP1eg21265W1n57xn6/rgNNfZY7GctMHshbbZlw
 2PUnAxMonTfBuBc7KaCIpBOgyXO4m6z63aCcHsyHG3TC89VjQFHqsnptsm8ApgBFt6W8vuosN1pK7
 SJR+I2JxMoOEze2THqrtzUODbj74Q+OQq/RG/LGSchTXkqLriQc9I7RI0or3QvMFNSNqLNQBpwJJp
 l6cte8p38TvyXIjDsUl2ML1blySQU0MIjI7T2fdCMXXy+dHferP8k7JS9LKhJPDYYewu8GQt6jmx4
 zVfFviFA==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ni19j-0003SJ-7T; Fri, 22 Apr 2022 23:49:35 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 85bf81fa;
 Fri, 22 Apr 2022 21:49:19 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 00:49:17 +0300
Message-Id: <20220422214919.367067-2-aperez@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220422214919.367067-1-aperez@igalia.com>
References: <20220422214919.367067-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/wlroots: bump to version 0.15.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
