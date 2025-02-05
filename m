Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63959C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2262D41231;
	Wed,  5 Feb 2025 09:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8vLd-bsATl5; Wed,  5 Feb 2025 09:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD34940890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD34940890;
	Wed,  5 Feb 2025 09:47:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6793BCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55F0640892
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yh9iO4Nwwuna for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91669407E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91669407E9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91669407E9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:47:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AB8643210;
 Wed,  5 Feb 2025 09:47:41 +0000 (UTC)
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 05 Feb 2025 10:47:39 +0100
MIME-Version: 1.0
Message-Id: <20250205-fix_zxing-v1-1-c3e4c2adfdab@bootlin.com>
References: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
In-Reply-To: <20250205-fix_zxing-v1-0-c3e4c2adfdab@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefftdefffevfffhjeevveevuddtfeffiedtleejueelffeugfevtdelhfetjeffnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopegludejvddrudeirddvrddutdelngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehfhhhunhhlvghthhesthhrohhoughonhdqshhofhhtfigrrhgvrdgtohhmp
 dhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738748862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4TXw3RPquTmm1Wyz5GLoCkOj1RFoYYvKQbySY3P48o=;
 b=pEzrL/mhmfrOFLEa0oxaWM/f2zQ4l/RyHTl2hSW8EhimgUtIWnjqKa3MwsCeF6Tst/Rt0c
 lVCkJkWCub7GYM53zj7G8MQx/Et82vKEj1thQBm3bMNbPuulUgVJJSp0LONrkn+L48739/
 n+BKOZxNaAXdlEBGrzuYvYFSD79nT1vXAOEXbjasuDhb4/pcVJ2lgomjRAQDHxGGF109jS
 o5muJtAHIHQ4vFKqtBSScsxwZviMRA5vcoND0Fra82ygGK1qsygImHMmCg82kQiwsHEUBO
 LKQ448xW1+F0Y2XYRdJCo8+NkYUyjj6UVwGNHSE9Fiu7C0PqMeMXtQfe5Lk14Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pEzrL/mh
Subject: [Buildroot] [PATCH 01/12] package/gstreamer1/gst-omx: remove gst-omx
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
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The OMX plugin has been removed from gstreamer as the OpenMAX standard
is long dead and even the Raspberry Pi OS no longer supports it.

See release notes for more details:
    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 Config.in.legacy                        |  7 ++++++
 package/gstreamer1/Config.in            |  1 -
 package/gstreamer1/gst-omx/Config.in    | 11 ----------
 package/gstreamer1/gst-omx/gst-omx.hash |  3 ---
 package/gstreamer1/gst-omx/gst-omx.mk   | 39 ---------------------------------
 5 files changed, 7 insertions(+), 54 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e091fd8c0a972c3043e9664652e3d40e6d83af8b..4f0b78d9589a65e8f69bca406cec49cdc2d5294c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -172,6 +172,13 @@ config BR2_PACKAGE_DIRECTFB
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
index 8fe8a343950334caff2954231ae55465473b39f0..67c33e5d4e518d85290a73fdbef484d55f35b617 100644
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
index efe3d211d6d1489400ace233daaa67b5dc326a0b..0000000000000000000000000000000000000000
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
index a84ffa7b6b3e35c3b788cf5a4899980fcb7eac02..0000000000000000000000000000000000000000
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.12.tar.xz.sha256sum
-sha256  6b0685b92ac735032d7987d1028afaeab0a98ab726e0c51e5b9bfc8f2da7c8b1  gst-omx-1.22.12.tar.xz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
deleted file mode 100644
index c1ab2b19c08c69522065af914e30554f20782c02..0000000000000000000000000000000000000000
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

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
