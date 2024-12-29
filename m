Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BCCC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3BB46A5D;
	Fri, 28 Feb 2025 16:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBQxe2TtbBFo; Fri, 28 Feb 2025 16:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356EC4F229
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356EC4F229;
	Fri, 28 Feb 2025 16:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11516711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1C6C42E0D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2Xgrc_77FIq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1794B424DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1794B424DE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 093C581099; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:24:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1b9fde0c2badf0b0c7fe597ad134bac9c465a6a8
X-Git-Newrev: d56765a3ffa3d4649b07c7db2ba47bc3e1ba5cab
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.093C581099@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/gstreamer1/gst1-plugins-bad: drop directfb plugin
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
