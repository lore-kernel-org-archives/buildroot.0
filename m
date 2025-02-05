Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E1C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F854149F;
	Wed,  5 Feb 2025 10:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZ_6BcEb_fZa; Wed,  5 Feb 2025 10:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D0F414B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75D0F414B7;
	Wed,  5 Feb 2025 10:09:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E365B185
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7685414B7
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPOTMmgK7p2G for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D794149F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D794149F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:09:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F1FA86FB9; Wed,  5 Feb 2025 10:09:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:06:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75ab6cf93a3ba505897ae99b5ff4bffda55d3c7b
X-Git-Newrev: 51e292cf67587f0e8ce666306d07309766595b9f
X-Patchwork-Hint: ignore
Message-Id: <20250205100919.7F1FA86FB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst-omx: remove gst-omx
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51e292cf67587f0e8ce666306d07309766595b9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OMX plugin has been removed from gstreamer as the OpenMAX standard
is long dead and even the Raspberry Pi OS no longer supports it.

See release notes for more details:
    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy                        |  7 ++++++
 package/gstreamer1/Config.in            |  1 -
 package/gstreamer1/gst-omx/Config.in    | 11 ----------
 package/gstreamer1/gst-omx/gst-omx.hash |  3 ---
 package/gstreamer1/gst-omx/gst-omx.mk   | 39 ---------------------------------
 5 files changed, 7 insertions(+), 54 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2e5bd3153f..fbabe784ba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -204,6 +204,13 @@ config BR2_PACKAGE_DIRECTFB
 	  This package was no longer maintained upstream, so it was
 	  dropped from Buildroot.
 
+config BR2_PACKAGE_GST_OMX
+	bool "gst-omx has been removed"
+	select BR2_LEGACY
+	help
+	  The gst-omx module has been removed from Gstreamer in
+	  release 1.24 in favor of Video4Linux-based video encoders.
+
 config BR2_PACKAGE_SDL2_DIRECTFB
 	bool "sdl2 directfb support removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 8fe8a34395..67c33e5d4e 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -15,7 +15,6 @@ source "package/gstreamer1/gst1-python/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-shark/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
-source "package/gstreamer1/gst-omx/Config.in"
 source "package/gstreamer1/gstd/Config.in"
 source "package/gstreamer1/gstreamer1-editing-services/Config.in"
 endif
diff --git a/package/gstreamer1/gst-omx/Config.in b/package/gstreamer1/gst-omx/Config.in
deleted file mode 100644
index efe3d211d6..0000000000
--- a/package/gstreamer1/gst-omx/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_GST_OMX
-	bool "gst-omx"
-	depends on BR2_PACKAGE_HAS_LIBOPENMAX
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	help
-	  GStreamer plug-in to use OpenMAX API.
-
-	  https://cgit.freedesktop.org/gstreamer/gst-omx
-
-comment "gst-omx requires a OpenMAX implementation"
-	depends on !BR2_PACKAGE_HAS_LIBOPENMAX
diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
deleted file mode 100644
index a84ffa7b6b..0000000000
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.12.tar.xz.sha256sum
-sha256  6b0685b92ac735032d7987d1028afaeab0a98ab726e0c51e5b9bfc8f2da7c8b1  gst-omx-1.22.12.tar.xz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
deleted file mode 100644
index c1ab2b19c0..0000000000
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-################################################################################
-#
-# gst-omx
-#
-################################################################################
-
-GST_OMX_VERSION = 1.22.12
-GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
-GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
-
-GST_OMX_LICENSE = LGPL-2.1
-GST_OMX_LICENSE_FILES = COPYING
-
-GST_OMX_CONF_OPTS = \
-	-Dexamples=disabled \
-	-Dtests=disabled \
-	-Dtools=disabled \
-	-Ddoc=disabled
-
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-GST_OMX_VARIANT = rpi
-GST_OMX_CONF_OPTS += -Dheader_path=$(STAGING_DIR)/usr/include/IL
-else
-GST_OMX_VARIANT = generic
-endif
-
-GST_OMX_CONF_OPTS += -Dtarget=$(GST_OMX_VARIANT)
-
-GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
-
-# adjust library paths to where buildroot installs them
-define GST_OMX_FIXUP_CONFIG_PATHS
-	find $(@D)/config -name gstomx.conf | \
-		xargs $(SED) 's|/usr/local|/usr|g' -e 's|/opt/vc|/usr|g'
-endef
-
-GST_OMX_POST_PATCH_HOOKS += GST_OMX_FIXUP_CONFIG_PATHS
-
-$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
