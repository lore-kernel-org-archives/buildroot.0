Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C2C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 19:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341B6812B7;
	Wed, 27 Dec 2023 19:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 341B6812B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wc0zujT1gO2R; Wed, 27 Dec 2023 19:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F87880EB6;
	Wed, 27 Dec 2023 19:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F87880EB6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC10C1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B21E74011D
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B21E74011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkWKkbLRk-o8 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77C9440108
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77C9440108
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6207B836E1; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 20:20:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53779570e50307482d095ff6ef95582cac2a0165
X-Git-Newrev: a760645bfb3fa74253d24462a39e29d4c54ee5ea
X-Patchwork-Hint: ignore
Message-Id: <20231227192259.6207B836E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good:
 switch to libsoup3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a760645bfb3fa74253d24462a39e29d4c54ee5ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsoup3 is supported since
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c3455def2e7bd09a7c3806283ceb69d0bef24869

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 10 +++++-----
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 36a542227a..e1e2674a4a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -261,7 +261,7 @@ comment "plugins with external dependencies"
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
 	bool "adaptivedemux2 (Adaptive Streaming 2)"
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
@@ -383,11 +383,11 @@ comment "pulseaudio support needs a toolchain w/ threads, wchar, dynamic library
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
-	depends on BR2_USE_WCHAR # libsoup -> glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup -> glib2
-	select BR2_PACKAGE_LIBSOUP
+	depends on BR2_USE_WCHAR # libsoup3 -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsoup3 -> glib2
+	select BR2_PACKAGE_LIBSOUP3
 	help
-	  libsoup HTTP client src/sink
+	  libsoup3 HTTP client src/sink
 
 comment "souphttpsrc needs a toolchain w/ wchar, threads"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 4a84ea01b9..d1a0d71dfb 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -60,7 +60,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=enabled
-GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup libxml2
+GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup3 libxml2
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
 endif
@@ -453,7 +453,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dsoup=enabled
-GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup
+GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup3
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dsoup=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
