Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AE3E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 19:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D2280D78;
	Sun, 29 Dec 2024 19:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0nbM8rYiXJA; Sun, 29 Dec 2024 19:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E386A80D4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E386A80D4E;
	Sun, 29 Dec 2024 19:53:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A162BC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82CED6084D
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Z5Arc6GmiEV for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC2260733
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADC2260733
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C575876F5; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:24:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b9fde0c2badf0b0c7fe597ad134bac9c465a6a8
X-Git-Newrev: d56765a3ffa3d4649b07c7db2ba47bc3e1ba5cab
X-Patchwork-Hint: ignore
Message-Id: <20241229195346.9C575876F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: drop
 directfb plugin
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d56765a3ffa3d4649b07c7db2ba47bc3e1ba5cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the DirectFB package, let's drop the
GStreamer DirectFB plugin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                        |  7 +++++++
 package/gstreamer1/gst1-plugins-bad/Config.in           |  5 -----
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 10 ++--------
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c4c52c64d0..124bb1ae44 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
+	bool "gstreamer directfb plugin removed"
+	select BR2_LEGACY
+	help
+	  The directfb plugin from GStreamer is no longer supported,
+	  as directfb is no longer packaged in Buildroot.
+
 config BR2_PACKAGE_LITE
 	bool "lite has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index e85ec16784..158e6a4ed3 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -396,11 +396,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
 comment "decklink needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP  || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
-	bool "directfb"
-	default y
-	depends on BR2_PACKAGE_DIRECTFB
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
 	# FEC_2_5 / QAM_4_NR definitions
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 7d36c041cc..11ce19e7f2 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -73,7 +73,8 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dmagicleap=disabled \
 	-Disac=disabled \
 	-Diqa=disabled \
-	-Dopencv=disabled
+	-Dopencv=disabled \
+	-Ddirectfb=disabled
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
@@ -547,13 +548,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddecklink=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
-GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=enabled
-GST1_PLUGINS_BAD_DEPENDENCIES += directfb
-else
-GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddvb=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
