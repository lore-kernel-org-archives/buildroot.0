Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5CDC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 718E7410C4;
	Sun,  5 Feb 2023 12:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 718E7410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQjsqNOFnL9s; Sun,  5 Feb 2023 12:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422CE410CA;
	Sun,  5 Feb 2023 12:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422CE410CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2B511BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B92AF410CA
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92AF410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RoVmnP_RkIUk for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:29:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B8D5410C4
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B8D5410C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6936483798; Sun,  5 Feb 2023 12:29:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:29:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f802249c6227fa1b7299e59d8fff43b98cb2106d
X-Git-Newrev: 8f291a384388a4d48c118b68fb25affb868fb280
X-Patchwork-Hint: ignore
Message-Id: <20230205122936.6936483798@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-bad: add new va option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f291a384388a4d48c118b68fb25affb868fb280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option enables va plugin support.

These plugins are vaapi based encoders/decoders that are eventually
intended to replace the legacy vaapi plugins.

Details:
https://gstreamer.freedesktop.org/documentation/va/index.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 11 +++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index bcb4cb1545..1e89cd124f 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -629,6 +629,17 @@ comment "uvch264 needs a toolchain w/ threads, wchar, gcc >= 4.9"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA
+	bool "va"
+	depends on !BR2_STATIC_LIBS # libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
+	select BR2_PACKAGE_LIBVA
+	help
+	  VA-API new plugin
+
+comment "va needs a toolchain w/ threads, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 	bool "voaacenc"
 	select BR2_PACKAGE_VO_AACENC
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 8f11ce6b37..dfe1f1c9eb 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -745,6 +745,16 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dva=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libva
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
+endif
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dva=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
