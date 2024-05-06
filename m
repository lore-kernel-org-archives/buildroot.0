Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E20BC4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 08:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02154406C0;
	Mon,  6 May 2024 08:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vak3TdjGnjGj; Mon,  6 May 2024 08:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A96240692
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A96240692;
	Mon,  6 May 2024 08:32:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CDE41BF38A
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7E560706
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkqrO9jD00oN for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 08:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.129.180.196;
 helo=v220200749773122244.hotsrv.de; envelope-from=info@arachnodroid.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E5FD606A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5FD606A6
Received: from v220200749773122244.hotsrv.de (arachnodroid.de [45.129.180.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E5FD606A6
 for <buildroot@buildroot.org>; Mon,  6 May 2024 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (ip4d158028.dynamic.kabel-deutschland.de
 [77.21.128.40])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id 1f41f530
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 6 May 2024 08:32:32 +0000 (UTC)
From: Michael Taubert <info@arachnodroid.de>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 10:32:21 +0200
Message-ID: <20240506083220.4066-2-info@arachnodroid.de>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arachnodroid.de; s=dkim; t=1714984353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vvNrNEoLTLh+e5VnzOfq1Bn9oKcxIK0M0s1ykyS6xsw=;
 b=GAaqHmN8KCBaGTLB6/bYlKWHc3Q2sYvoAlhODBI/Pm4Thk+SrTNEWy4CMSPe0BWGyzOAeU
 IOgYJv3HmtiXpbOY+QeJe31lofOGEhz1Pnd95sqvwNJxt+LwyvnknewMMaY61FuVfGyAgr
 MMAnCG25yFC5F2vM6+WZUiS/Qy1HYRY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arachnodroid.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arachnodroid.de header.i=@arachnodroid.de
 header.a=rsa-sha256 header.s=dkim header.b=GAaqHmN8
Subject: [Buildroot] [RESEND PATCH 1/1] package/gstreamer1: bump version to
 1.24.3
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
Cc: Michael Taubert <michael@arachnodroid.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Taubert <michael@arachnodroid.de>

Sorry for the wrapped lines in the first submission. This time using git.

GStreamer 1.24.3 fixes some 'garbled video' problems, caused by missing DRM dmabuf modifiers.
There are a lot of changes and fixes. Please check https://gstreamer.freedesktop.org/releases/1.24/
for more details.

Outline:
- bumped gstreamer version to 1.24.3
- bumped gst-plugins-* version to 1.24.3
- bumped gst-devtools version to 1.24.3
- bumped gst-imx version to 2.2.0
- bumped gst-python version to 1.24.3
- bumped gst-rtsp-server version to 1.24.3
- bumped gst-vaapi version to 1.24.3 (should be considered deprecated now)
- bumped gstreamer-editing-service version to 1.24.3
- removed gst-omx (obsolete; use v4l2codecs instead)
- select missing wpe_mux for plugin wpe
- removed webrtc-audio-processing patch (already applied now)

Runtime test of gst1-python succeeded with the reference docker image. Additionally, I've compiled
with as much plugins enabled as possible.

Best regards,
Michael

Signed-off-by: Michael Taubert <michael@arachnodroid.de>
---
 package/gstreamer1/Config.in                  |   1 -
 package/gstreamer1/gst-omx/Config.in          |  11 -
 package/gstreamer1/gst-omx/gst-omx.hash       |   3 -
 package/gstreamer1/gst-omx/gst-omx.mk         |  39 -
 .../gst1-devtools/gst1-devtools.hash          |   2 +
 .../gstreamer1/gst1-devtools/gst1-devtools.mk |   2 +-
 package/gstreamer1/gst1-imx/gst1-imx.hash     |   2 +
 package/gstreamer1/gst1-imx/gst1-imx.mk       |   2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash |   2 +
 package/gstreamer1/gst1-libav/gst1-libav.mk   |   2 +-
 ...e-code-for-webrtc-audio-processing-1.patch | 883 ------------------
 package/gstreamer1/gst1-plugins-bad/Config.in |  25 +
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |   2 +
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |  31 +-
 .../gst1-plugins-base/gst1-plugins-base.hash  |   2 +
 .../gst1-plugins-base/gst1-plugins-base.mk    |   2 +-
 .../gstreamer1/gst1-plugins-good/Config.in    |  14 +-
 .../gst1-plugins-good/gst1-plugins-good.hash  |   2 +
 .../gst1-plugins-good/gst1-plugins-good.mk    |  15 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |   2 +
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |   4 +-
 .../gstreamer1/gst1-python/gst1-python.hash   |   2 +
 package/gstreamer1/gst1-python/gst1-python.mk |   2 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |   2 +
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |   2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |   2 +
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |   2 +-
 .../gstreamer1-editing-services.hash          |   2 +
 .../gstreamer1-editing-services.mk            |   2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash |   2 +
 package/gstreamer1/gstreamer1/gstreamer1.mk   |   2 +-
 31 files changed, 114 insertions(+), 954 deletions(-)
 delete mode 100644 package/gstreamer1/gst-omx/Config.in
 delete mode 100644 package/gstreamer1/gst-omx/gst-omx.hash
 delete mode 100644 package/gstreamer1/gst-omx/gst-omx.mk
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch

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
index 86f8c772c9..0000000000
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.9.tar.xz.sha256sum
-sha256  9362d6117985d09dcf6e27bdaef377dc08efb7df01d00101d04fb644addac61e  gst-omx-1.22.9.tar.xz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
deleted file mode 100644
index 32891bafa6..0000000000
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-################################################################################
-#
-# gst-omx
-#
-################################################################################
-
-GST_OMX_VERSION = 1.22.9
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
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 6cf7c9597f..689d10451b 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.9.tar.xz.sha256sum
 sha256  02e29400b44e9cc603aa6444dee5726b57edabef6455e6d0921ffed6f13840ee  gst-devtools-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.3.tar.xz.sha256sum
+sha256  b91114a2fd958f42acf441186e87e2bec93538ef35a9f8248111197360ffb237  gst-devtools-1.24.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 0c085b8b42..4e235a8e42 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.22.9
+GST1_DEVTOOLS_VERSION = 1.24.3
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index 0c2a99cc5b..4ac27d3fca 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,3 +1,5 @@
 # locally computed hash
 sha256  21feb24130c18e4a1f8cc4f72d575903d1f9134dd0604e41e91b5e783d81e320  gst1-imx-0.13.1.tar.gz
+# locally computed hash
+sha256  bb6433b8ea54ea6b75d8e851adc6b96cf94c613d9feda29ccf2a71fa0a5bbc9c  gst1-imx-2.2.0.tar.gz
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  LICENSE
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index f091b4f983..dbce3e3522 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_IMX_VERSION = 0.13.1
+GST1_IMX_VERSION = 2.2.0
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
 GST1_IMX_LICENSE = LGPL-2.0+
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index b5bc84d672..7ff4aa503b 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.9.tar.xz.sha256sum
 sha256  192f7d27d21c1e7c72c339a2647a9b0c247fedc62ea5029115f8c3e22ebb87d8  gst-libav-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.3.tar.xz.sha256sum
+sha256  d9c5b152468a45c1fa8351410422090a7192707ad74d2e1a4367f5254e188d91  gst-libav-1.24.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 1b872b7fa9..861852ae18 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.22.9
+GST1_LIBAV_VERSION = 1.24.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch b/package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch
deleted file mode 100644
index a2ab0ef6d8..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch
+++ /dev/null
@@ -1,883 +0,0 @@
-From d5755744c3e2b70e9f04704ae9d18b928d9fa456 Mon Sep 17 00:00:00 2001
-From: Arun Raghavan <arun@asymptotic.io>
-Date: Wed, 2 Dec 2020 18:31:44 -0500
-Subject: [PATCH] webrtcdsp: Update code for webrtc-audio-processing-1
-
-Updated API usage appropriately, and now we have a versioned package to
-track breaking vs. non-breaking updates.
-
-Deprecates a number of properties (and we have to plug in our own values
-for related enums which are now gone):
-
-  * echo-suprression-level
-  * experimental-agc
-  * extended-filter
-  * delay-agnostic
-  * voice-detection-frame-size-ms
-  * voice-detection-likelihood
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2943>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d5755744c3e2b70e9f04704ae9d18b928d9fa456
----
- .../ext/webrtcdsp/gstwebrtcdsp.cpp            | 271 +++++++-----------
- .../ext/webrtcdsp/gstwebrtcechoprobe.cpp      |  87 +++---
- .../ext/webrtcdsp/gstwebrtcechoprobe.h        |   9 +-
- .../gst-plugins-bad/ext/webrtcdsp/meson.build |   4 +-
- 4 files changed, 164 insertions(+), 207 deletions(-)
-
-diff --git a/ext/webrtcdsp/gstwebrtcdsp.cpp b/ext/webrtcdsp/gstwebrtcdsp.cpp
-index 7ee09488fb..c9a7cdae2f 100644
---- a/ext/webrtcdsp/gstwebrtcdsp.cpp
-+++ b/ext/webrtcdsp/gstwebrtcdsp.cpp
-@@ -71,9 +71,7 @@
- #include "gstwebrtcdsp.h"
- #include "gstwebrtcechoprobe.h"
- 
--#include <webrtc/modules/audio_processing/include/audio_processing.h>
--#include <webrtc/modules/interface/module_common_types.h>
--#include <webrtc/system_wrappers/include/trace.h>
-+#include <modules/audio_processing/include/audio_processing.h>
- 
- GST_DEBUG_CATEGORY (webrtc_dsp_debug);
- #define GST_CAT_DEFAULT (webrtc_dsp_debug)
-@@ -82,10 +80,9 @@ GST_DEBUG_CATEGORY (webrtc_dsp_debug);
- #define DEFAULT_COMPRESSION_GAIN_DB 9
- #define DEFAULT_STARTUP_MIN_VOLUME 12
- #define DEFAULT_LIMITER TRUE
--#define DEFAULT_GAIN_CONTROL_MODE webrtc::GainControl::kAdaptiveDigital
-+#define DEFAULT_GAIN_CONTROL_MODE webrtc::AudioProcessing::Config::GainController1::Mode::kAdaptiveDigital
- #define DEFAULT_VOICE_DETECTION FALSE
- #define DEFAULT_VOICE_DETECTION_FRAME_SIZE_MS 10
--#define DEFAULT_VOICE_DETECTION_LIKELIHOOD webrtc::VoiceDetection::kLowLikelihood
- 
- static GstStaticPadTemplate gst_webrtc_dsp_sink_template =
- GST_STATIC_PAD_TEMPLATE ("sink",
-@@ -119,7 +116,7 @@ GST_STATIC_PAD_TEMPLATE ("src",
-         "channels = (int) [1, MAX]")
-     );
- 
--typedef webrtc::EchoCancellation::SuppressionLevel GstWebrtcEchoSuppressionLevel;
-+typedef int GstWebrtcEchoSuppressionLevel;
- #define GST_TYPE_WEBRTC_ECHO_SUPPRESSION_LEVEL \
-     (gst_webrtc_echo_suppression_level_get_type ())
- static GType
-@@ -127,10 +124,9 @@ gst_webrtc_echo_suppression_level_get_type (void)
- {
-   static GType suppression_level_type = 0;
-   static const GEnumValue level_types[] = {
--    {webrtc::EchoCancellation::kLowSuppression, "Low Suppression", "low"},
--    {webrtc::EchoCancellation::kModerateSuppression,
--      "Moderate Suppression", "moderate"},
--    {webrtc::EchoCancellation::kHighSuppression, "high Suppression", "high"},
-+    {1, "Low Suppression", "low"},
-+    {2, "Moderate Suppression", "moderate"},
-+    {3, "high Suppression", "high"},
-     {0, NULL, NULL}
-   };
- 
-@@ -141,7 +137,7 @@ gst_webrtc_echo_suppression_level_get_type (void)
-   return suppression_level_type;
- }
- 
--typedef webrtc::NoiseSuppression::Level GstWebrtcNoiseSuppressionLevel;
-+typedef webrtc::AudioProcessing::Config::NoiseSuppression::Level GstWebrtcNoiseSuppressionLevel;
- #define GST_TYPE_WEBRTC_NOISE_SUPPRESSION_LEVEL \
-     (gst_webrtc_noise_suppression_level_get_type ())
- static GType
-@@ -149,10 +145,10 @@ gst_webrtc_noise_suppression_level_get_type (void)
- {
-   static GType suppression_level_type = 0;
-   static const GEnumValue level_types[] = {
--    {webrtc::NoiseSuppression::kLow, "Low Suppression", "low"},
--    {webrtc::NoiseSuppression::kModerate, "Moderate Suppression", "moderate"},
--    {webrtc::NoiseSuppression::kHigh, "High Suppression", "high"},
--    {webrtc::NoiseSuppression::kVeryHigh, "Very High Suppression",
-+    {webrtc::AudioProcessing::Config::NoiseSuppression::Level::kLow, "Low Suppression", "low"},
-+    {webrtc::AudioProcessing::Config::NoiseSuppression::Level::kModerate, "Moderate Suppression", "moderate"},
-+    {webrtc::AudioProcessing::Config::NoiseSuppression::Level::kHigh, "High Suppression", "high"},
-+    {webrtc::AudioProcessing::Config::NoiseSuppression::Level::kVeryHigh, "Very High Suppression",
-       "very-high"},
-     {0, NULL, NULL}
-   };
-@@ -164,7 +160,7 @@ gst_webrtc_noise_suppression_level_get_type (void)
-   return suppression_level_type;
- }
- 
--typedef webrtc::GainControl::Mode GstWebrtcGainControlMode;
-+typedef webrtc::AudioProcessing::Config::GainController1::Mode GstWebrtcGainControlMode;
- #define GST_TYPE_WEBRTC_GAIN_CONTROL_MODE \
-     (gst_webrtc_gain_control_mode_get_type ())
- static GType
-@@ -172,8 +168,9 @@ gst_webrtc_gain_control_mode_get_type (void)
- {
-   static GType gain_control_mode_type = 0;
-   static const GEnumValue mode_types[] = {
--    {webrtc::GainControl::kAdaptiveDigital, "Adaptive Digital", "adaptive-digital"},
--    {webrtc::GainControl::kFixedDigital, "Fixed Digital", "fixed-digital"},
-+    {webrtc::AudioProcessing::Config::GainController1::kAdaptiveDigital, "Adaptive Digital", "adaptive-digital"},
-+    {webrtc::AudioProcessing::Config::GainController1::kFixedDigital, "Fixed Digital", "fixed-digital"},
-+    {webrtc::AudioProcessing::Config::GainController1::kAdaptiveAnalog, "Adaptive Analog", "adaptive-analog"},
-     {0, NULL, NULL}
-   };
- 
-@@ -184,7 +181,7 @@ gst_webrtc_gain_control_mode_get_type (void)
-   return gain_control_mode_type;
- }
- 
--typedef webrtc::VoiceDetection::Likelihood GstWebrtcVoiceDetectionLikelihood;
-+typedef int GstWebrtcVoiceDetectionLikelihood;
- #define GST_TYPE_WEBRTC_VOICE_DETECTION_LIKELIHOOD \
-     (gst_webrtc_voice_detection_likelihood_get_type ())
- static GType
-@@ -192,10 +189,10 @@ gst_webrtc_voice_detection_likelihood_get_type (void)
- {
-   static GType likelihood_type = 0;
-   static const GEnumValue likelihood_types[] = {
--    {webrtc::VoiceDetection::kVeryLowLikelihood, "Very Low Likelihood", "very-low"},
--    {webrtc::VoiceDetection::kLowLikelihood, "Low Likelihood", "low"},
--    {webrtc::VoiceDetection::kModerateLikelihood, "Moderate Likelihood", "moderate"},
--    {webrtc::VoiceDetection::kHighLikelihood, "High Likelihood", "high"},
-+    {1, "Very Low Likelihood", "very-low"},
-+    {2, "Low Likelihood", "low"},
-+    {3, "Moderate Likelihood", "moderate"},
-+    {4, "High Likelihood", "high"},
-     {0, NULL, NULL}
-   };
- 
-@@ -227,6 +224,7 @@ enum
-   PROP_VOICE_DETECTION,
-   PROP_VOICE_DETECTION_FRAME_SIZE_MS,
-   PROP_VOICE_DETECTION_LIKELIHOOD,
-+  PROP_EXTRA_DELAY_MS,
- };
- 
- /**
-@@ -248,7 +246,7 @@ struct _GstWebrtcDsp
-   /* Protected by the stream lock */
-   GstAdapter *adapter;
-   GstPlanarAudioAdapter *padapter;
--  webrtc::AudioProcessing * apm;
-+  webrtc::AudioProcessing *apm;
- 
-   /* Protected by the object lock */
-   gchar *probe_name;
-@@ -257,21 +255,15 @@ struct _GstWebrtcDsp
-   /* Properties */
-   gboolean high_pass_filter;
-   gboolean echo_cancel;
--  webrtc::EchoCancellation::SuppressionLevel echo_suppression_level;
-   gboolean noise_suppression;
--  webrtc::NoiseSuppression::Level noise_suppression_level;
-+  webrtc::AudioProcessing::Config::NoiseSuppression::Level noise_suppression_level;
-   gboolean gain_control;
--  gboolean experimental_agc;
--  gboolean extended_filter;
--  gboolean delay_agnostic;
-   gint target_level_dbfs;
-   gint compression_gain_db;
-   gint startup_min_volume;
-   gboolean limiter;
--  webrtc::GainControl::Mode gain_control_mode;
-+  webrtc::AudioProcessing::Config::GainController1::Mode gain_control_mode;
-   gboolean voice_detection;
--  gint voice_detection_frame_size_ms;
--  webrtc::VoiceDetection::Likelihood voice_detection_likelihood;
- };
- 
- G_DEFINE_TYPE_WITH_CODE (GstWebrtcDsp, gst_webrtc_dsp, GST_TYPE_AUDIO_FILTER,
-@@ -376,9 +368,9 @@ gst_webrtc_dsp_analyze_reverse_stream (GstWebrtcDsp * self,
-     GstClockTime rec_time)
- {
-   GstWebrtcEchoProbe *probe = NULL;
--  webrtc::AudioProcessing * apm;
--  webrtc::AudioFrame frame;
-+  webrtc::AudioProcessing *apm;
-   GstBuffer *buf = NULL;
-+  GstAudioBuffer abuf;
-   GstFlowReturn ret = GST_FLOW_OK;
-   gint err, delay;
- 
-@@ -391,48 +383,44 @@ gst_webrtc_dsp_analyze_reverse_stream (GstWebrtcDsp * self,
-   if (!probe)
-     return GST_FLOW_OK;
- 
-+  webrtc::StreamConfig config (probe->info.rate, probe->info.channels,
-+      false);
-   apm = self->apm;
- 
--  if (self->delay_agnostic)
--    rec_time = GST_CLOCK_TIME_NONE;
--
--again:
--  delay = gst_webrtc_echo_probe_read (probe, rec_time, (gpointer) &frame, &buf);
-+  delay = gst_webrtc_echo_probe_read (probe, rec_time, &buf);
-   apm->set_stream_delay_ms (delay);
- 
-+  g_return_val_if_fail (buf != NULL, GST_FLOW_ERROR);
-+
-   if (delay < 0)
-     goto done;
- 
--  if (frame.sample_rate_hz_ != self->info.rate) {
-+  if (probe->info.rate != self->info.rate) {
-     GST_ELEMENT_ERROR (self, STREAM, FORMAT,
-         ("Echo Probe has rate %i , while the DSP is running at rate %i,"
-          " use a caps filter to ensure those are the same.",
--         frame.sample_rate_hz_, self->info.rate), (NULL));
-+         probe->info.rate, self->info.rate), (NULL));
-     ret = GST_FLOW_ERROR;
-     goto done;
-   }
- 
--  if (buf) {
--    webrtc::StreamConfig config (frame.sample_rate_hz_, frame.num_channels_,
--        false);
--    GstAudioBuffer abuf;
--    float * const * data;
-+  gst_audio_buffer_map (&abuf, &self->info, buf, GST_MAP_READWRITE);
-+
-+  if (probe->interleaved) {
-+    int16_t * const data = (int16_t * const) abuf.planes[0];
- 
--    gst_audio_buffer_map (&abuf, &self->info, buf, GST_MAP_READWRITE);
--    data = (float * const *) abuf.planes;
-     if ((err = apm->ProcessReverseStream (data, config, config, data)) < 0)
-       GST_WARNING_OBJECT (self, "Reverse stream analyses failed: %s.",
-           webrtc_error_to_string (err));
--    gst_audio_buffer_unmap (&abuf);
--    gst_buffer_replace (&buf, NULL);
-   } else {
--    if ((err = apm->AnalyzeReverseStream (&frame)) < 0)
-+    float * const * data = (float * const *) abuf.planes;
-+
-+    if ((err = apm->ProcessReverseStream (data, config, config, data)) < 0)
-       GST_WARNING_OBJECT (self, "Reverse stream analyses failed: %s.",
-           webrtc_error_to_string (err));
-   }
- 
--  if (self->delay_agnostic)
--      goto again;
-+  gst_audio_buffer_unmap (&abuf);
- 
- done:
-   gst_object_unref (probe);
-@@ -443,16 +431,14 @@ done:
- 
- static void
- gst_webrtc_vad_post_activity (GstWebrtcDsp *self, GstBuffer *buffer,
--    gboolean stream_has_voice)
-+    gboolean stream_has_voice, guint8 level)
- {
-   GstClockTime timestamp = GST_BUFFER_PTS (buffer);
-   GstBaseTransform *trans = GST_BASE_TRANSFORM_CAST (self);
-   GstStructure *s;
-   GstClockTime stream_time;
-   GstAudioLevelMeta *meta;
--  guint8 level;
- 
--  level = self->apm->level_estimator ()->RMS ();
-   meta = gst_buffer_get_audio_level_meta (buffer);
-   if (meta) {
-     meta->voice_activity = stream_has_voice;
-@@ -481,6 +467,7 @@ gst_webrtc_dsp_process_stream (GstWebrtcDsp * self,
- {
-   GstAudioBuffer abuf;
-   webrtc::AudioProcessing * apm = self->apm;
-+  webrtc::StreamConfig config (self->info.rate, self->info.channels, false);
-   gint err;
- 
-   if (!gst_audio_buffer_map (&abuf, &self->info, buffer,
-@@ -490,19 +477,10 @@ gst_webrtc_dsp_process_stream (GstWebrtcDsp * self,
-   }
- 
-   if (self->interleaved) {
--    webrtc::AudioFrame frame;
--    frame.num_channels_ = self->info.channels;
--    frame.sample_rate_hz_ = self->info.rate;
--    frame.samples_per_channel_ = self->period_samples;
--
--    memcpy (frame.data_, abuf.planes[0], self->period_size);
--    err = apm->ProcessStream (&frame);
--    if (err >= 0)
--      memcpy (abuf.planes[0], frame.data_, self->period_size);
-+    int16_t * const data = (int16_t * const) abuf.planes[0];
-+    err = apm->ProcessStream (data, config, config, data);
-   } else {
-     float * const * data = (float * const *) abuf.planes;
--    webrtc::StreamConfig config (self->info.rate, self->info.channels, false);
--
-     err = apm->ProcessStream (data, config, config, data);
-   }
- 
-@@ -511,10 +489,13 @@ gst_webrtc_dsp_process_stream (GstWebrtcDsp * self,
-         webrtc_error_to_string (err));
-   } else {
-     if (self->voice_detection) {
--      gboolean stream_has_voice = apm->voice_detection ()->stream_has_voice ();
-+      webrtc::AudioProcessingStats stats = apm->GetStatistics ();
-+      gboolean stream_has_voice = stats.voice_detected && *stats.voice_detected;
-+      // The meta takes the value as -dbov, so we negate
-+      guint8 level = stats.output_rms_dbfs ? (guint8) -(*stats.output_rms_dbfs) : 127;
- 
-       if (stream_has_voice != self->stream_has_voice)
--        gst_webrtc_vad_post_activity (self, buffer, stream_has_voice);
-+        gst_webrtc_vad_post_activity (self, buffer, stream_has_voice, level);
- 
-       self->stream_has_voice = stream_has_voice;
-     }
-@@ -583,21 +564,9 @@ static gboolean
- gst_webrtc_dsp_start (GstBaseTransform * btrans)
- {
-   GstWebrtcDsp *self = GST_WEBRTC_DSP (btrans);
--  webrtc::Config config;
- 
-   GST_OBJECT_LOCK (self);
- 
--  config.Set < webrtc::ExtendedFilter >
--      (new webrtc::ExtendedFilter (self->extended_filter));
--  config.Set < webrtc::ExperimentalAgc >
--      (new webrtc::ExperimentalAgc (self->experimental_agc, self->startup_min_volume));
--  config.Set < webrtc::DelayAgnostic >
--      (new webrtc::DelayAgnostic (self->delay_agnostic));
--
--  /* TODO Intelligibility enhancer, Beamforming, etc. */
--
--  self->apm = webrtc::AudioProcessing::Create (config);
--
-   if (self->echo_cancel) {
-     self->probe = gst_webrtc_acquire_echo_probe (self->probe_name);
- 
-@@ -618,10 +587,8 @@ static gboolean
- gst_webrtc_dsp_setup (GstAudioFilter * filter, const GstAudioInfo * info)
- {
-   GstWebrtcDsp *self = GST_WEBRTC_DSP (filter);
--  webrtc::AudioProcessing * apm;
--  webrtc::ProcessingConfig pconfig;
-+  webrtc::AudioProcessing::Config config;
-   GstAudioInfo probe_info = *info;
--  gint err = 0;
- 
-   GST_LOG_OBJECT (self, "setting format to %s with %i Hz and %i channels",
-       info->finfo->description, info->rate, info->channels);
-@@ -633,7 +600,7 @@ gst_webrtc_dsp_setup (GstAudioFilter * filter, const GstAudioInfo * info)
- 
-   self->info = *info;
-   self->interleaved = (info->layout == GST_AUDIO_LAYOUT_INTERLEAVED);
--  apm = self->apm;
-+  self->apm = webrtc::AudioProcessingBuilder().Create();
- 
-   if (!self->interleaved)
-     gst_planar_audio_adapter_configure (self->padapter, info);
-@@ -642,8 +609,7 @@ gst_webrtc_dsp_setup (GstAudioFilter * filter, const GstAudioInfo * info)
-   self->period_samples = info->rate / 100;
-   self->period_size = self->period_samples * info->bpf;
- 
--  if (self->interleaved &&
--      (webrtc::AudioFrame::kMaxDataSizeSamples * 2) < self->period_size)
-+  if (self->interleaved && (self->period_size > MAX_DATA_SIZE_SAMPLES * 2))
-     goto period_too_big;
- 
-   if (self->probe) {
-@@ -658,40 +624,31 @@ gst_webrtc_dsp_setup (GstAudioFilter * filter, const GstAudioInfo * info)
-     GST_WEBRTC_ECHO_PROBE_UNLOCK (self->probe);
-   }
- 
--  /* input stream */
--  pconfig.streams[webrtc::ProcessingConfig::kInputStream] =
--      webrtc::StreamConfig (info->rate, info->channels, false);
--  /* output stream */
--  pconfig.streams[webrtc::ProcessingConfig::kOutputStream] =
--      webrtc::StreamConfig (info->rate, info->channels, false);
--  /* reverse input stream */
--  pconfig.streams[webrtc::ProcessingConfig::kReverseInputStream] =
--      webrtc::StreamConfig (probe_info.rate, probe_info.channels, false);
--  /* reverse output stream */
--  pconfig.streams[webrtc::ProcessingConfig::kReverseOutputStream] =
--      webrtc::StreamConfig (probe_info.rate, probe_info.channels, false);
--
--  if ((err = apm->Initialize (pconfig)) < 0)
--    goto initialize_failed;
--
-   /* Setup Filters */
-+  // TODO: expose pre_amplifier
-+
-   if (self->high_pass_filter) {
-     GST_DEBUG_OBJECT (self, "Enabling High Pass filter");
--    apm->high_pass_filter ()->Enable (true);
-+    config.high_pass_filter.enabled = true;
-   }
- 
-   if (self->echo_cancel) {
-     GST_DEBUG_OBJECT (self, "Enabling Echo Cancellation");
--    apm->echo_cancellation ()->enable_drift_compensation (false);
--    apm->echo_cancellation ()
--        ->set_suppression_level (self->echo_suppression_level);
--    apm->echo_cancellation ()->Enable (true);
-+    config.echo_canceller.enabled = true;
-   }
- 
-   if (self->noise_suppression) {
-     GST_DEBUG_OBJECT (self, "Enabling Noise Suppression");
--    apm->noise_suppression ()->set_level (self->noise_suppression_level);
--    apm->noise_suppression ()->Enable (true);
-+    config.noise_suppression.enabled = true;
-+    config.noise_suppression.level = self->noise_suppression_level;
-+  }
-+
-+  // TODO: expose transient suppression
-+
-+  if (self->voice_detection) {
-+    GST_DEBUG_OBJECT (self, "Enabling Voice Activity Detection");
-+    config.voice_detection.enabled = true;
-+    self->stream_has_voice = FALSE;
-   }
- 
-   if (self->gain_control) {
-@@ -706,30 +663,17 @@ gst_webrtc_dsp_setup (GstAudioFilter * filter, const GstAudioInfo * info)
- 
-     g_type_class_unref (mode_class);
- 
--    apm->gain_control ()->set_mode (self->gain_control_mode);
--    apm->gain_control ()->set_target_level_dbfs (self->target_level_dbfs);
--    apm->gain_control ()->set_compression_gain_db (self->compression_gain_db);
--    apm->gain_control ()->enable_limiter (self->limiter);
--    apm->gain_control ()->Enable (true);
-+    config.gain_controller1.enabled = true;
-+    config.gain_controller1.target_level_dbfs = self->target_level_dbfs;
-+    config.gain_controller1.compression_gain_db = self->compression_gain_db;
-+    config.gain_controller1.enable_limiter = self->limiter;
-+    config.level_estimation.enabled = true;
-   }
- 
--  if (self->voice_detection) {
--    GEnumClass *likelihood_class = (GEnumClass *)
--        g_type_class_ref (GST_TYPE_WEBRTC_VOICE_DETECTION_LIKELIHOOD);
--    GST_DEBUG_OBJECT (self, "Enabling Voice Activity Detection, frame size "
--      "%d milliseconds, likelihood: %s", self->voice_detection_frame_size_ms,
--      g_enum_get_value (likelihood_class,
--          self->voice_detection_likelihood)->value_name);
--    g_type_class_unref (likelihood_class);
-+  // TODO: expose gain controller 2
-+  // TODO: expose residual echo detector
- 
--    self->stream_has_voice = FALSE;
--
--    apm->voice_detection ()->Enable (true);
--    apm->voice_detection ()->set_likelihood (self->voice_detection_likelihood);
--    apm->voice_detection ()->set_frame_size_ms (
--        self->voice_detection_frame_size_ms);
--    apm->level_estimator ()->Enable (true);
--  }
-+  self->apm->ApplyConfig (config);
- 
-   GST_OBJECT_UNLOCK (self);
- 
-@@ -738,9 +682,9 @@ gst_webrtc_dsp_setup (GstAudioFilter * filter, const GstAudioInfo * info)
- period_too_big:
-   GST_OBJECT_UNLOCK (self);
-   GST_WARNING_OBJECT (self, "webrtcdsp format produce too big period "
--      "(maximum is %" G_GSIZE_FORMAT " samples and we have %u samples), "
-+      "(maximum is %d samples and we have %u samples), "
-       "reduce the number of channels or the rate.",
--      webrtc::AudioFrame::kMaxDataSizeSamples, self->period_size / 2);
-+      MAX_DATA_SIZE_SAMPLES, self->period_size / 2);
-   return FALSE;
- 
- probe_has_wrong_rate:
-@@ -751,14 +695,6 @@ probe_has_wrong_rate:
-           " use a caps filter to ensure those are the same.",
-           probe_info.rate, info->rate), (NULL));
-   return FALSE;
--
--initialize_failed:
--  GST_OBJECT_UNLOCK (self);
--  GST_ELEMENT_ERROR (self, LIBRARY, INIT,
--      ("Failed to initialize WebRTC Audio Processing library"),
--      ("webrtc::AudioProcessing::Initialize() failed: %s",
--          webrtc_error_to_string (err)));
--  return FALSE;
- }
- 
- static gboolean
-@@ -803,8 +739,6 @@ gst_webrtc_dsp_set_property (GObject * object,
-       self->echo_cancel = g_value_get_boolean (value);
-       break;
-     case PROP_ECHO_SUPPRESSION_LEVEL:
--      self->echo_suppression_level =
--          (GstWebrtcEchoSuppressionLevel) g_value_get_enum (value);
-       break;
-     case PROP_NOISE_SUPPRESSION:
-       self->noise_suppression = g_value_get_boolean (value);
-@@ -817,13 +751,10 @@ gst_webrtc_dsp_set_property (GObject * object,
-       self->gain_control = g_value_get_boolean (value);
-       break;
-     case PROP_EXPERIMENTAL_AGC:
--      self->experimental_agc = g_value_get_boolean (value);
-       break;
-     case PROP_EXTENDED_FILTER:
--      self->extended_filter = g_value_get_boolean (value);
-       break;
-     case PROP_DELAY_AGNOSTIC:
--      self->delay_agnostic = g_value_get_boolean (value);
-       break;
-     case PROP_TARGET_LEVEL_DBFS:
-       self->target_level_dbfs = g_value_get_int (value);
-@@ -845,11 +776,8 @@ gst_webrtc_dsp_set_property (GObject * object,
-       self->voice_detection = g_value_get_boolean (value);
-       break;
-     case PROP_VOICE_DETECTION_FRAME_SIZE_MS:
--      self->voice_detection_frame_size_ms = g_value_get_int (value);
-       break;
-     case PROP_VOICE_DETECTION_LIKELIHOOD:
--      self->voice_detection_likelihood =
--          (GstWebrtcVoiceDetectionLikelihood) g_value_get_enum (value);
-       break;
-     default:
-       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
-@@ -876,7 +804,7 @@ gst_webrtc_dsp_get_property (GObject * object,
-       g_value_set_boolean (value, self->echo_cancel);
-       break;
-     case PROP_ECHO_SUPPRESSION_LEVEL:
--      g_value_set_enum (value, self->echo_suppression_level);
-+      g_value_set_enum (value, (GstWebrtcEchoSuppressionLevel) 2);
-       break;
-     case PROP_NOISE_SUPPRESSION:
-       g_value_set_boolean (value, self->noise_suppression);
-@@ -888,13 +816,13 @@ gst_webrtc_dsp_get_property (GObject * object,
-       g_value_set_boolean (value, self->gain_control);
-       break;
-     case PROP_EXPERIMENTAL_AGC:
--      g_value_set_boolean (value, self->experimental_agc);
-+      g_value_set_boolean (value, false);
-       break;
-     case PROP_EXTENDED_FILTER:
--      g_value_set_boolean (value, self->extended_filter);
-+      g_value_set_boolean (value, false);
-       break;
-     case PROP_DELAY_AGNOSTIC:
--      g_value_set_boolean (value, self->delay_agnostic);
-+      g_value_set_boolean (value, false);
-       break;
-     case PROP_TARGET_LEVEL_DBFS:
-       g_value_set_int (value, self->target_level_dbfs);
-@@ -915,10 +843,10 @@ gst_webrtc_dsp_get_property (GObject * object,
-       g_value_set_boolean (value, self->voice_detection);
-       break;
-     case PROP_VOICE_DETECTION_FRAME_SIZE_MS:
--      g_value_set_int (value, self->voice_detection_frame_size_ms);
-+      g_value_set_int (value, 0);
-       break;
-     case PROP_VOICE_DETECTION_LIKELIHOOD:
--      g_value_set_enum (value, self->voice_detection_likelihood);
-+      g_value_set_enum (value, 2);
-       break;
-     default:
-       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
-@@ -1005,13 +933,13 @@ gst_webrtc_dsp_class_init (GstWebrtcDspClass * klass)
- 
-   g_object_class_install_property (gobject_class,
-       PROP_ECHO_SUPPRESSION_LEVEL,
--      g_param_spec_enum ("echo-suppression-level", "Echo Suppression Level",
-+      g_param_spec_enum ("echo-suppression-level",
-+          "Echo Suppression Level (does nothing)",
-           "Controls the aggressiveness of the suppressor. A higher level "
-           "trades off double-talk performance for increased echo suppression.",
--          GST_TYPE_WEBRTC_ECHO_SUPPRESSION_LEVEL,
--          webrtc::EchoCancellation::kModerateSuppression,
-+          GST_TYPE_WEBRTC_ECHO_SUPPRESSION_LEVEL, 2,
-           (GParamFlags) (G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS |
--              G_PARAM_CONSTRUCT)));
-+              G_PARAM_CONSTRUCT | G_PARAM_DEPRECATED)));
- 
-   g_object_class_install_property (gobject_class,
-       PROP_NOISE_SUPPRESSION,
-@@ -1026,7 +954,7 @@ gst_webrtc_dsp_class_init (GstWebrtcDspClass * klass)
-           "Controls the aggressiveness of the suppression. Increasing the "
-           "level will reduce the noise level at the expense of a higher "
-           "speech distortion.", GST_TYPE_WEBRTC_NOISE_SUPPRESSION_LEVEL,
--          webrtc::EchoCancellation::kModerateSuppression,
-+          webrtc::AudioProcessing::Config::NoiseSuppression::Level::kModerate,
-           (GParamFlags) (G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS |
-               G_PARAM_CONSTRUCT)));
- 
-@@ -1039,24 +967,26 @@ gst_webrtc_dsp_class_init (GstWebrtcDspClass * klass)
- 
-   g_object_class_install_property (gobject_class,
-       PROP_EXPERIMENTAL_AGC,
--      g_param_spec_boolean ("experimental-agc", "Experimental AGC",
-+      g_param_spec_boolean ("experimental-agc",
-+          "Experimental AGC (does nothing)",
-           "Enable or disable experimental automatic gain control.",
-           FALSE, (GParamFlags) (G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS |
--              G_PARAM_CONSTRUCT)));
-+              G_PARAM_CONSTRUCT | G_PARAM_DEPRECATED)));
- 
-   g_object_class_install_property (gobject_class,
-       PROP_EXTENDED_FILTER,
-       g_param_spec_boolean ("extended-filter", "Extended Filter",
-           "Enable or disable the extended filter.",
-           TRUE, (GParamFlags) (G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS |
--              G_PARAM_CONSTRUCT)));
-+              G_PARAM_CONSTRUCT | G_PARAM_DEPRECATED)));
- 
-   g_object_class_install_property (gobject_class,
-       PROP_DELAY_AGNOSTIC,
--      g_param_spec_boolean ("delay-agnostic", "Delay Agnostic",
-+      g_param_spec_boolean ("delay-agnostic",
-+          "Delay agnostic mode (does nothing)",
-           "Enable or disable the delay agnostic mode.",
-           FALSE, (GParamFlags) (G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS |
--              G_PARAM_CONSTRUCT)));
-+              G_PARAM_CONSTRUCT | G_PARAM_DEPRECATED)));
- 
-   g_object_class_install_property (gobject_class,
-       PROP_TARGET_LEVEL_DBFS,
-@@ -1111,24 +1041,23 @@ gst_webrtc_dsp_class_init (GstWebrtcDspClass * klass)
-   g_object_class_install_property (gobject_class,
-       PROP_VOICE_DETECTION_FRAME_SIZE_MS,
-       g_param_spec_int ("voice-detection-frame-size-ms",
--          "Voice Detection Frame Size Milliseconds",
-+          "Voice detection frame size in milliseconds (does nothing)",
-           "Sets the |size| of the frames in ms on which the VAD will operate. "
-           "Larger frames will improve detection accuracy, but reduce the "
-           "frequency of updates",
-           10, 30, DEFAULT_VOICE_DETECTION_FRAME_SIZE_MS,
-           (GParamFlags) (G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS |
--              G_PARAM_CONSTRUCT)));
-+              G_PARAM_CONSTRUCT | G_PARAM_DEPRECATED)));
- 
-   g_object_class_install_property (gobject_class,
-       PROP_VOICE_DETECTION_LIKELIHOOD,
-       g_param_spec_enum ("voice-detection-likelihood",
--          "Voice Detection Likelihood",
-+          "Voice detection likelihood (does nothing)",
-           "Specifies the likelihood that a frame will be declared to contain "
-           "voice.",
--          GST_TYPE_WEBRTC_VOICE_DETECTION_LIKELIHOOD,
--          DEFAULT_VOICE_DETECTION_LIKELIHOOD,
-+          GST_TYPE_WEBRTC_VOICE_DETECTION_LIKELIHOOD, 2,
-           (GParamFlags) (G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS |
--              G_PARAM_CONSTRUCT)));
-+              G_PARAM_CONSTRUCT | G_PARAM_DEPRECATED)));
- 
-   gst_type_mark_as_plugin_api (GST_TYPE_WEBRTC_GAIN_CONTROL_MODE, (GstPluginAPIFlags) 0);
-   gst_type_mark_as_plugin_api (GST_TYPE_WEBRTC_NOISE_SUPPRESSION_LEVEL, (GstPluginAPIFlags) 0);
-diff --git a/ext/webrtcdsp/gstwebrtcechoprobe.cpp b/ext/webrtcdsp/gstwebrtcechoprobe.cpp
-index acdb3d8a7d..8e8ca064c4 100644
---- a/ext/webrtcdsp/gstwebrtcechoprobe.cpp
-+++ b/ext/webrtcdsp/gstwebrtcechoprobe.cpp
-@@ -33,7 +33,8 @@
- 
- #include "gstwebrtcechoprobe.h"
- 
--#include <webrtc/modules/interface/module_common_types.h>
-+#include <modules/audio_processing/include/audio_processing.h>
-+
- #include <gst/audio/audio.h>
- 
- GST_DEBUG_CATEGORY_EXTERN (webrtc_dsp_debug);
-@@ -102,7 +103,7 @@ gst_webrtc_echo_probe_setup (GstAudioFilter * filter, const GstAudioInfo * info)
-   self->period_size = self->period_samples * info->bpf;
- 
-   if (self->interleaved &&
--      (webrtc::AudioFrame::kMaxDataSizeSamples * 2) < self->period_size)
-+      (MAX_DATA_SIZE_SAMPLES * 2) < self->period_size)
-     goto period_too_big;
- 
-   GST_WEBRTC_ECHO_PROBE_UNLOCK (self);
-@@ -112,9 +113,9 @@ gst_webrtc_echo_probe_setup (GstAudioFilter * filter, const GstAudioInfo * info)
- period_too_big:
-   GST_WEBRTC_ECHO_PROBE_UNLOCK (self);
-   GST_WARNING_OBJECT (self, "webrtcdsp format produce too big period "
--      "(maximum is %" G_GSIZE_FORMAT " samples and we have %u samples), "
-+      "(maximum is %d samples and we have %u samples), "
-       "reduce the number of channels or the rate.",
--      webrtc::AudioFrame::kMaxDataSizeSamples, self->period_size / 2);
-+      MAX_DATA_SIZE_SAMPLES, self->period_size / 2);
-   return FALSE;
- }
- 
-@@ -303,18 +304,20 @@ gst_webrtc_release_echo_probe (GstWebrtcEchoProbe * probe)
- 
- gint
- gst_webrtc_echo_probe_read (GstWebrtcEchoProbe * self, GstClockTime rec_time,
--    gpointer _frame, GstBuffer ** buf)
-+    GstBuffer ** buf)
- {
--  webrtc::AudioFrame * frame = (webrtc::AudioFrame *) _frame;
-   GstClockTimeDiff diff;
--  gsize avail, skip, offset, size;
-+  gsize avail, skip, offset, size = 0;
-   gint delay = -1;
- 
-   GST_WEBRTC_ECHO_PROBE_LOCK (self);
- 
-+  /* We always return a buffer -- if don't have data (size == 0), we generate a
-+   * silence buffer */
-+
-   if (!GST_CLOCK_TIME_IS_VALID (self->latency) ||
-       !GST_AUDIO_INFO_IS_VALID (&self->info))
--    goto done;
-+    goto copy;
- 
-   if (self->interleaved)
-     avail = gst_adapter_available (self->adapter) / self->info.bpf;
-@@ -324,7 +327,7 @@ gst_webrtc_echo_probe_read (GstWebrtcEchoProbe * self, GstClockTime rec_time,
-   /* In delay agnostic mode, just return 10ms of data */
-   if (!GST_CLOCK_TIME_IS_VALID (rec_time)) {
-     if (avail < self->period_samples)
--      goto done;
-+      goto copy;
- 
-     size = self->period_samples;
-     skip = 0;
-@@ -371,23 +374,51 @@ gst_webrtc_echo_probe_read (GstWebrtcEchoProbe * self, GstClockTime rec_time,
-   size = MIN (avail - offset, self->period_samples - skip);
- 
- copy:
--  if (self->interleaved) {
--    skip *= self->info.bpf;
--    offset *= self->info.bpf;
--    size *= self->info.bpf;
--
--    if (size < self->period_size)
--      memset (frame->data_, 0, self->period_size);
--
--    if (size) {
--      gst_adapter_copy (self->adapter, (guint8 *) frame->data_ + skip,
--          offset, size);
--      gst_adapter_flush (self->adapter, offset + size);
--    }
-+  if (!size) {
-+    /* No data, provide a period's worth of silence */
-+    *buf = gst_buffer_new_allocate (NULL, self->period_size, NULL);
-+    gst_buffer_memset (*buf, 0, 0, self->period_size);
-+    gst_buffer_add_audio_meta (*buf, &self->info, self->period_samples,
-+        NULL);
-   } else {
-+    /* We have some actual data, pop period_samples' worth if have it, else pad
-+     * with silence and provide what we do have */
-     GstBuffer *ret, *taken, *tmp;
- 
--    if (size) {
-+    if (self->interleaved) {
-+      skip *= self->info.bpf;
-+      offset *= self->info.bpf;
-+      size *= self->info.bpf;
-+
-+      gst_adapter_flush (self->adapter, offset);
-+
-+      /* we need to fill silence at the beginning and/or the end of the
-+       * buffer in order to have period_samples in the buffer */
-+      if (size < self->period_size) {
-+        gsize padding = self->period_size - (skip + size);
-+
-+        taken = gst_adapter_take_buffer (self->adapter, size);
-+        ret = gst_buffer_new ();
-+
-+        /* need some silence at the beginning */
-+        if (skip) {
-+          tmp = gst_buffer_new_allocate (NULL, skip, NULL);
-+          gst_buffer_memset (tmp, 0, 0, skip);
-+          ret = gst_buffer_append (ret, tmp);
-+        }
-+
-+        ret = gst_buffer_append (ret, taken);
-+
-+        /* need some silence at the end */
-+        if (padding) {
-+          tmp = gst_buffer_new_allocate (NULL, padding, NULL);
-+          gst_buffer_memset (tmp, 0, 0, padding);
-+          ret = gst_buffer_append (ret, tmp);
-+        }
-+      } else {
-+        ret = gst_adapter_take_buffer (self->adapter, size);
-+      }
-+    } else {
-       gst_planar_audio_adapter_flush (self->padapter, offset);
- 
-       /* we need to fill silence at the beginning and/or the end of each
-@@ -430,23 +461,13 @@ copy:
-         ret = gst_planar_audio_adapter_take_buffer (self->padapter, size,
-           GST_MAP_READWRITE);
-       }
--    } else {
--      ret = gst_buffer_new_allocate (NULL, self->period_size, NULL);
--      gst_buffer_memset (ret, 0, 0, self->period_size);
--      gst_buffer_add_audio_meta (ret, &self->info, self->period_samples,
--          NULL);
-     }
- 
-     *buf = ret;
-   }
- 
--  frame->num_channels_ = self->info.channels;
--  frame->sample_rate_hz_ = self->info.rate;
--  frame->samples_per_channel_ = self->period_samples;
--
-   delay = self->delay;
- 
--done:
-   GST_WEBRTC_ECHO_PROBE_UNLOCK (self);
- 
-   return delay;
-diff --git a/ext/webrtcdsp/gstwebrtcechoprobe.h b/ext/webrtcdsp/gstwebrtcechoprobe.h
-index 36fd34f179..488c0e958f 100644
---- a/ext/webrtcdsp/gstwebrtcechoprobe.h
-+++ b/ext/webrtcdsp/gstwebrtcechoprobe.h
-@@ -45,6 +45,12 @@ G_BEGIN_DECLS
- #define GST_WEBRTC_ECHO_PROBE_LOCK(obj) g_mutex_lock (&GST_WEBRTC_ECHO_PROBE (obj)->lock)
- #define GST_WEBRTC_ECHO_PROBE_UNLOCK(obj) g_mutex_unlock (&GST_WEBRTC_ECHO_PROBE (obj)->lock)
- 
-+/* From the webrtc audio_frame.h definition of kMaxDataSizeSamples:
-+ * Stereo, 32 kHz, 120 ms (2 * 32 * 120)
-+ * Stereo, 192 kHz, 20 ms (2 * 192 * 20)
-+ */
-+#define MAX_DATA_SIZE_SAMPLES 7680
-+
- typedef struct _GstWebrtcEchoProbe GstWebrtcEchoProbe;
- typedef struct _GstWebrtcEchoProbeClass GstWebrtcEchoProbeClass;
- 
-@@ -71,6 +77,7 @@ struct _GstWebrtcEchoProbe
-   GstClockTime latency;
-   gint delay;
-   gboolean interleaved;
-+  gint extra_delay;
- 
-   GstSegment segment;
-   GstAdapter *adapter;
-@@ -92,7 +99,7 @@ GST_ELEMENT_REGISTER_DECLARE (webrtcechoprobe);
- GstWebrtcEchoProbe *gst_webrtc_acquire_echo_probe (const gchar * name);
- void gst_webrtc_release_echo_probe (GstWebrtcEchoProbe * probe);
- gint gst_webrtc_echo_probe_read (GstWebrtcEchoProbe * self,
--    GstClockTime rec_time, gpointer frame, GstBuffer ** buf);
-+    GstClockTime rec_time, GstBuffer ** buf);
- 
- G_END_DECLS
- #endif /* __GST_WEBRTC_ECHO_PROBE_H__ */
-diff --git a/ext/webrtcdsp/meson.build b/ext/webrtcdsp/meson.build
-index 5aeae69a44..09565e27c7 100644
---- a/ext/webrtcdsp/meson.build
-+++ b/ext/webrtcdsp/meson.build
-@@ -4,7 +4,7 @@ webrtc_sources = [
-   'gstwebrtcdspplugin.cpp'
- ]
- 
--webrtc_dep = dependency('webrtc-audio-processing', version : ['>= 0.2', '< 0.4'],
-+webrtc_dep = dependency('webrtc-audio-processing-1', version : ['>= 1.0'],
-                         required : get_option('webrtcdsp'))
- 
- if not gnustl_dep.found() and get_option('webrtcdsp').enabled()
-@@ -20,7 +20,7 @@ if webrtc_dep.found() and gnustl_dep.found()
-     dependencies : [gstbase_dep, gstaudio_dep, gstbadaudio_dep, webrtc_dep, gnustl_dep],
-     install : true,
-     install_dir : plugins_install_dir,
--    override_options : ['cpp_std=c++11'],
-+    override_options : ['cpp_std=c++17'],
-   )
-   plugins += [gstwebrtcdsp]
- endif
--- 
-2.34.1
-
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d2c60ec9ce..4aacf2951a 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -32,6 +32,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AIFF
 	help
 	  Create and parse Audio interchange File Format (AIFF) files
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ANALYTICSOVERLAY
+	bool "analyticsoverlay"
+	help
+	  Visualises object-detection metas on a video stream
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX
 	bool "asfmux"
 	help
@@ -77,6 +82,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2
 	help
 	  Take image snapshots and record movies from camera
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CODEC2JSON
+	bool "codec2json"
+	depends on BR2_PACKAGE_JSON_GLIB
+	help
+	  Annotate and format CODEC bitstream to JSON
+
+comment "codec2json depends on json-glib"
+	depends on !BR2_PACKAGE_JSON_GLIB
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CODECALPHA
 	bool "codecalpha"
 	help
@@ -374,6 +388,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
 	help
 	  Compress or decompress streams
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CLOSEDCAPTION
+	bool "closedcaption"
+	help
+	  Closed caption elements
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
@@ -657,6 +676,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 	bool "webp"
 	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_MUX
 	help
 	  Webp image format plugin
 
@@ -716,6 +736,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS
 comment "v4l2codecs need udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_UVCGADGET
+	bool "uvcgadget"
+	help
+	  uvc video gadget plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 174c4ad572..166b6554ba 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.22.9.tar.xz.sha256sum
 sha256  1bc65d0fd5f53a3636564efd3fcf318c3edcdec39c4109a503c1fc8203840a1d  gst-plugins-bad-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.3.tar.xz.sha256sum
+sha256  e90f26c7dc9c76f4aa599b758cfd6d8c10d6a0b9cb265ba2c3c9bdf3888558f8  gst-plugins-bad-1.24.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index a61038376f..ec3724f566 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.22.9
+GST1_PLUGINS_BAD_VERSION = 1.24.3
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -34,6 +34,7 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BAD_CONF_OPTS += \
+	-Daja=disabled \
 	-Dasio=disabled \
 	-Davtp=disabled \
 	-Dopensles=disabled \
@@ -49,8 +50,8 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dflite=disabled \
 	-Dgs=disabled \
 	-Dgsm=disabled \
-	-Dkate=disabled \
 	-Dladspa=disabled \
+	-Dlc3=disabled \
 	-Dldac=disabled \
 	-Dlv2=disabled \
 	-Dmediafoundation=disabled \
@@ -67,6 +68,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dsoundtouch=disabled \
 	-Dgme=disabled \
 	-Dspandsp=disabled \
+	-Dsvtav1=disabled \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
 	-Dwasapi2=disabled \
@@ -129,6 +131,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Daiff=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ANALYTICSOVERLAY),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Danalyticsoverlay=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Danalyticsoverlay=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dasfmux=enabled
 else
@@ -183,6 +191,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dcamerabin2=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CODEC2JSON),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcodec2json=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += json-glib
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcodec2json=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CODECALPHA),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dcodecalpha=enabled
 else
@@ -527,6 +542,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dbz2=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CLOSEDCAPTION),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dclosedcaption=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dclosedcaption=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dcurl=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libcurl
@@ -796,6 +817,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dv4l2codecs=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_UVCGADGET),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Duvcgadget=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Duvcgadget=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dx265=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += x265
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 060a871b95..9dda817928 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.9.tar.xz.sha256sum
 sha256  fac3e0dd2d8e9370388b34bf8c21b89d5f63bc3cfc12cd7fdc8fc6c1cba03334  gst-plugins-base-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.3.tar.xz.sha256sum
+sha256  f1094397eaa7932f06e57ebbb075aa33aa2c76e4b75630a16b02c8d4af46832e  gst-plugins-base-1.24.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 512e3fdee2..df21633bd6 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.22.9
+GST1_PLUGINS_BASE_VERSION = 1.24.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index e1e2674a4a..0779b3d71d 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -263,6 +263,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBSOUP3
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AMRNB
+	bool "amrnb"
+	help
+	  Adaptive Multi-Rate Narrow-Band audio codec plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AMRWBDEC
+	bool "amrwbdec"
+	help
+	  Adaptive Multi-Rate Wide-Band audio decoder plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
 	select BR2_PACKAGE_LAME
@@ -297,8 +307,8 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
 	help
 	  QT5 plugin which includes elements qmlglsrc and qmlglsink
 
-comment "qmlgl (qt5) needs the gst1-plugins-base opengl library"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+comment "qmlgl (qt5) needs the gst1-plugins-base opengl library and QT5"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL || !BR2_PACKAGE_QT5
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
 	bool "shout2"
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 4410da6ef4..3cce274404 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.9.tar.xz.sha256sum
 sha256  26959fcfebfff637d4ea08ef40316baf31b61bb7729820b0684e800c3a1478b6  gst-plugins-good-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.3.tar.xz.sha256sum
+sha256  150f914e61dc05600b68b88ca103c7cc227130158e389ea9ea159f4050a2ebb0  gst-plugins-good-1.24.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index a1ad63915d..50f8a6db4d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.22.9
+GST1_PLUGINS_GOOD_VERSION = 1.24.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -27,6 +27,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 	-Dosxvideo=disabled \
 	-Daalib=disabled \
 	-Dlibcaca=disabled \
+	-Dqt6=disabled \
 	-Ddoc=disabled
 
 # Options which require currently unpackaged libraries
@@ -65,6 +66,18 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_AMRNB), y)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Damrnb=enabled
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Damrnb=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_AMRWBDEC), y)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Damrwbdec=enabled
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Damrwbdec=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
 else
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 20394619b0..fff8526ebc 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.9.tar.xz.sha256sum
 sha256  0bf685d66015a01dd3fc1671b64a1c8acb321dd9d4ab9e05a29ab19782aa6236  gst-plugins-ugly-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.3.tar.xz.sha256sum
+sha256  4c951341c4c648630b6fe1234ec113d81dd2d248529bf2b5478e0ad077c80ed3  gst-plugins-ugly-1.24.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 7bb95dd1d0..e2e5e11490 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.22.9
+GST1_PLUGINS_UGLY_VERSION = 1.24.3
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -19,8 +19,6 @@ GST1_PLUGINS_UGLY_CONF_OPTS += \
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
 	-Da52dec=disabled \
-	-Damrnb=disabled \
-	-Damrwbdec=disabled \
 	-Dcdio=disabled \
 	-Dsidplay=disabled
 
diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 2f352df92e..616f3d1df9 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.9.tar.xz.sha256sum
 sha256  3f9d5c6ffefda268703744b592a6b3983aa6723273b1220ecbcb62c2a5800009  gst-python-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.3.tar.xz.sha256sum
+sha256  ecdb3e2ba94ea2c82b93a8c715d5a7e04f9726a8838c0a6b17694928fd1e8595  gst-python-1.24.3.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 501ca5e02b..2ca655e122 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.22.9
+GST1_PYTHON_VERSION = 1.24.3
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 21f380378c..17169c5784 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,6 @@
 # From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.9.tar.xz.sha256sum
 sha256  808af148f89404ff74850f8ca5272bed4bfe67f9620231dc4514fd07eb26d0a4  gst-rtsp-server-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.3.tar.xz.sha256sum
+sha256  62628ecca78b8f5b51c59a4d602c65e9205ffc50c3c83cd61fab1f6348b63565  gst-rtsp-server-1.24.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 87e6413d00..2365c90407 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.22.9
+GST1_RTSP_SERVER_VERSION = 1.24.3
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index ec23ae7c6b..74af8e8948 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.9.tar.xz.sha256sum
 sha256  8ba20da8c4cbf5b2953dba904672c4275d0053e1528f97fdf8e59942c7883ca8  gstreamer-vaapi-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.3.tar.xz.sha256sum
+sha256  845f2efe0dca8dab234dde8fb091da2cd06a9d2a683422b56dcb688954f9070e  gstreamer-vaapi-1.24.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index d934bab233..f1a75afdaf 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.22.9
+GST1_VAAPI_VERSION = 1.24.3
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 2ea29dae61..6ac81dec9e 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,7 @@
 # From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.9.tar.xz.sha256sum
 sha256  3553ad3802dccde0c0ef1461881acd9b55bddf8adf751de4cb51b7f8cb50440d  gst-editing-services-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.24.3.tar.xz.sha256sum
+sha256  cf743215688b013905cd2c9f7fedda21e2d34c844340990c6ea25d10a037293f  gst-editing-services-1.24.3.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index e2c0f1ccf8..9c4dced50c 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.9
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.24.3
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index b6ed001eb3..8eb834e634 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,5 @@
 # From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.9.tar.xz.sha256sum
 sha256  1e7124d347e8cdc80f08ec1d370c201be513002af1102bb20e83c5279cb48ebd  gstreamer-1.22.9.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.3.tar.xz.sha256sum
+sha256  1225ef4a329fae1cadc5ec727dab249ad567e8072879493561ceb91ed34aa414  gstreamer-1.24.3.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 5b9125e62a..f107478cba 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.22.9
+GSTREAMER1_VERSION = 1.24.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
