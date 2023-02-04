Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E405C636CC
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 23:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4453060FFF;
	Sat,  4 Feb 2023 23:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4453060FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qClwN_2r46vm; Sat,  4 Feb 2023 23:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF1D61013;
	Sat,  4 Feb 2023 23:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF1D61013
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FB931BF2B5
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 23:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69A9460FDC
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 23:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A9460FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hud4-SEARw_t for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 23:19:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 844B260D6D
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 23:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 844B260D6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74341836A6; Sat,  4 Feb 2023 23:19:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Feb 2023 23:51:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 895840edd2784492d9b7066330b43842b703343b
X-Git-Newrev: 2f1fef1499427d508363c29920468e8f5a495709
X-Patchwork-Hint: ignore
Message-Id: <20230204231934.74341836A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-ugly: bump version to
 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f1fef1499427d508363c29920468e8f5a495709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove xingmux config option which has been moved to the
gst1-plugins-good package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                            | 7 +++++++
 package/gstreamer1/gst1-plugins-ugly/Config.in              | 5 -----
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 8 +-------
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3fff2b1ddd..1c5af2652a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
+	bool "xingmux moved"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_XINGMUX
+	help
+	  The xingmux option has been moved to gst1-plugins-good.
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	bool "videoscale removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index ba19989892..54766ffa8c 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -26,11 +26,6 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB
 	help
 	  DVD subtitle parser and decoder
 
-config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
-	bool "xingmux"
-	help
-	  Add XING tags to mpeg audio files
-
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA
 	bool "realmedia"
 	help
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 4ec29e6894..21579216df 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.4.tar.xz.sha256sum
-sha256  5c9ec6bab96517e438b3f9bae0ceb84d3436f3da9bbe180cf4d28e32a7251b59  gst-plugins-ugly-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.0.tar.xz.sha256sum
+sha256  a644dc981afa2d8d3a913f763ab9523c0620ee4e65a7ec73c7721c29da3c5a0c  gst-plugins-ugly-1.22.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 20382719c3..9f16fa3da8 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.20.4
+GST1_PLUGINS_UGLY_VERSION = 1.22.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -51,12 +51,6 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdsub=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=enabled
-else
-GST1_PLUGINS_UGLY_CONF_OPTS += -Dxingmux=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
