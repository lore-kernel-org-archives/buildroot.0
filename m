Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74788C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28333612AB;
	Tue, 21 Feb 2023 01:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28333612AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtKwM6BkRfkv; Tue, 21 Feb 2023 01:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A5936FC03;
	Tue, 21 Feb 2023 01:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A5936FC03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1CB1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 947D36FBF8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 947D36FBF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pwsNgTgKw4w for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96F326FBB4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96F326FBB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B70886496; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Feb 2023 23:47:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e30ce907d58e5f675704545599ca77ce2035acd2
X-Git-Newrev: dde95c589767fe995f338d34a3ea9e5e8743c6d9
X-Patchwork-Hint: ignore
Message-Id: <20230220205245.8B70886496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gst1-plugins-base:
 bump version to 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dde95c589767fe995f338d34a3ea9e5e8743c6d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The videoconvert and videoscale plugins have been combined into
the new videoconvertscale plugin.

Rework config options using videoconvert/videoscale to use the new
videoconvertscale option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                           | 14 ++++++++++++++
 package/gstreamer1/gst1-plugins-base/Config.in             | 13 ++++---------
 .../gstreamer1/gst1-plugins-base/gst1-plugins-base.hash    |  4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk  | 14 ++++----------
 package/gstreamer1/gstreamer1-editing-services/Config.in   |  3 +--
 package/webkitgtk/Config.in                                |  3 +--
 package/wpewebkit/Config.in                                |  3 +--
 7 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 41c5fdefb3..3fff2b1ddd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	bool "videoscale removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	help
+	  The videoscale option has been combined with videoconvert.
+
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
+	bool "videoconvert removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	help
+	  The videoconvert option has been combined with videoscale.
+
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	bool "imx-gpu-viv X11 output has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index bd4ee0b994..df10774ac7 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -59,10 +59,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING
 	help
 	  various encoding-related elements
 
-config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
-	bool "videoconvert"
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
+	bool "videoconvertscale (mandatory for video playback)"
+	default y
 	help
-	  Colorspace conversion
+	  Colorspace conversion, resizes video
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
 	bool "gio"
@@ -123,12 +124,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE
 	help
 	  Adjusts video frames
 
-config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
-	bool "videoscale (mandatory for video playback)"
-	default y
-	help
-	  Resizes video
-
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	bool "volume (mandatory for audio playback)"
 	default y
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 5c729d832f..bac4f8398a 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.4.tar.xz.sha256sum
-sha256  8d181b7abe4caf23ee9f9ec5b4d3e232640452464e39495bfffb6d776fc97225  gst-plugins-base-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.0.tar.xz.sha256sum
+sha256  f53672294f3985d56355c8b1df8f6b49c8c8721106563e19f53be3507ff2229d  gst-plugins-base-1.22.0.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index d225cdf910..7d509331fe 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.20.4
+GST1_PLUGINS_BASE_VERSION = 1.22.0
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -147,10 +147,10 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dencoding=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvert=enabled
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvertscale=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvert=disabled
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvertscale=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO),y)
@@ -219,12 +219,6 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dvideorate=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoscale=enabled
-else
-GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoscale=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME),y)
 GST1_PLUGINS_BASE_CONF_OPTS += -Dvolume=enabled
 else
diff --git a/package/gstreamer1/gstreamer1-editing-services/Config.in b/package/gstreamer1/gstreamer1-editing-services/Config.in
index 9c41e8142b..e824781d47 100644
--- a/package/gstreamer1/gstreamer1-editing-services/Config.in
+++ b/package/gstreamer1/gstreamer1-editing-services/Config.in
@@ -6,9 +6,8 @@ config BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE # runtime
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC # runtime
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME # runtime
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE # runtime
 	help
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index cafe497491..dc5d738dae 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -104,8 +104,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04ed40bd92..7a8dc557c3 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -97,8 +97,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERTSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
