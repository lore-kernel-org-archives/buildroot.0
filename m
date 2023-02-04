Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155A6C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC3764ECE4;
	Tue, 21 Feb 2023 00:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC3764ECE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BodLfkzruBj5; Tue, 21 Feb 2023 00:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 746F04EE14;
	Tue, 21 Feb 2023 00:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 746F04EE14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87A821BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D922341780
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D922341780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUJQngpOChsU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEE0641795
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEE0641795
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD3858648F; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 00:06:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0e8f9b34f336da6c50bb7f854f8b3921b31d3398
X-Git-Newrev: 33d4c226e582f6c0086431c4d9154e462cb3cf34
X-Patchwork-Hint: ignore
Message-Id: <20230220205245.DD3858648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gst1-vaapi: bump
 version to 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=33d4c226e582f6c0086431c4d9154e462cb3cf34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update config option names and dependency requirements.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 37 +++++++++++++++++++++------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 5baaa4dfb7..6dec625c93 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.4.tar.xz.sha256sum
-sha256  ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a  gstreamer-vaapi-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.0.tar.xz.sha256sum
+sha256  593ccad19f88e5fa29f40f98356c007806bd535828707b1406944d16a90bdff5  gstreamer-vaapi-1.22.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index bd6c16be3e..3d9eb91ffb 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.20.4
+GST1_VAAPI_VERSION = 1.22.0
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
@@ -18,19 +18,40 @@ GST1_VAAPI_DEPENDENCIES += \
 	libdrm
 
 GST1_VAAPI_CONF_OPTS += \
-	-Dwith_drm=yes \
-	-Dwith_x11=no \
-	-Dwith_glx=no \
-	-Dwith_wayland=no \
-	-Dwith_egl=no \
+	-Ddrm=enabled \
+	-Degl=enabled \
 	-Dexamples=disabled \
 	-Dtests=disabled \
 	-Ddoc=disabled
 
 ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
-GST1_VAAPI_CONF_OPTS += -Dwith_encoders=yes
+GST1_VAAPI_CONF_OPTS += -Dencoders=enabled
 else
-GST1_VAAPI_CONF_OPTS += -Dwith_encoders=no
+GST1_VAAPI_CONF_OPTS += -Dencoders=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+GST1_VAAPI_CONF_OPTS += -Degl=enabled
+GST1_VAAPI_DEPENDENCIES += libegl
+else
+GST1_VAAPI_CONF_OPTS += -Degl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+GST1_VAAPI_CONF_OPTS += -Dwayland=enabled
+else
+GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST1_VAAPI_CONF_OPTS += -Dx11=enabled
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+GST1_VAAPI_CONF_OPTS += -Dglx=enabled
+else
+GST1_VAAPI_CONF_OPTS += -Dglx=disabled
+endif
+else
+GST1_VAAPI_CONF_OPTS += -Dx11=disabled -Dglx=disabled
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
