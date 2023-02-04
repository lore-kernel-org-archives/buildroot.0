Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B1AC636CC
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 23:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF87404C2;
	Sat,  4 Feb 2023 23:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF87404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-UwSUo9V2eO; Sat,  4 Feb 2023 23:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA153401CA;
	Sat,  4 Feb 2023 23:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA153401CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82B2A1BF2B5
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 23:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93EB082009
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 23:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93EB082009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksfR9OQkT8ti for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 23:19:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2E718200D
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 23:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E718200D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93ABC836A4; Sat,  4 Feb 2023 23:19:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 00:06:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e8f9b34f336da6c50bb7f854f8b3921b31d3398
X-Git-Newrev: 33d4c226e582f6c0086431c4d9154e462cb3cf34
X-Patchwork-Hint: ignore
Message-Id: <20230204231934.93ABC836A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-vaapi: bump version to 1.22.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
