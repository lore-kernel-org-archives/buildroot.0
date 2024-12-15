Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7EAE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 17:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF2D60838;
	Sun, 15 Dec 2024 17:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiJj9PeTwc4m; Sun, 15 Dec 2024 17:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F271460840
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F271460840;
	Sun, 15 Dec 2024 17:05:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5539CE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 939A760838
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtiUI4ex1_GJ for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 17:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C7B60852
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6C7B60852
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A43EC87092; Sun, 15 Dec 2024 17:05:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 17:51:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 865457e76201f663cf81b09486485fbee961423d
X-Git-Newrev: 4a2ec46014687faf91c3db8f9f768a00133c3f36
X-Patchwork-Hint: ignore
Message-Id: <20241215170529.A43EC87092@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: multimedia support
 needs gst1-plugins-bad
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a2ec46014687faf91c3db8f9f768a00133c3f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error

--   Package 'gstreamer-webrtc-1.0' not found
-- Found GStreamer: GSTREAMER_INCLUDE_DIRS;GSTREAMER_LIBRARIES;GSTREAMER_VERSION;GSTREAMER_BASE_INCLUDE_DIRS;GSTREAMER_BASE_LIBRARIES;GSTREAMER_APP_INCLUDE_DIRS;GSTREAMER_APP_LIBRARIES;GSTREAMER_PBUTILS_INCLUDE_DIRS;GSTREAMER_PBUTILS_LIBRARIES;GSTREAMER_VIDEO_INCLUDE_DIRS;GSTREAMER_VIDEO_LIBRARIES;GSTREAMER_MPEGTS_INCLUDE_DIRS;GSTREAMER_MPEGTS_LIBRARIES;GSTREAMER_TAG_INCLUDE_DIRS;GSTREAMER_TAG_LIBRARIES;GSTREAMER_GL_INCLUDE_DIRS;GSTREAMER_GL_LIBRARIES;GSTREAMER_AUDIO_INCLUDE_DIRS;GSTREAMER_AUDIO_LIBRARIES;GSTREAMER_FFT_INCLUDE_DIRS;GSTREAMER_FFT_LIBRARIES;GSTREAMER_TRANSCODER_INCLUDE_DIRS;GSTREAMER_TRANSCODER_LIBRARIES (Required is at least version "1.18.4")
CMake Error at Source/cmake/GStreamerChecks.cmake:62 (message):
  GStreamerTranscoder >= 1.20 is needed for USE_GSTREAMER_TRANSCODER.
Call Stack (most recent call first):
  Source/cmake/OptionsGTK.cmake:478 (include)
  Source/cmake/WebKitCommon.cmake:237 (include)
  CMakeLists.txt:21 (include)

using this defconfig

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WEBKITGTK=y
BR2_PACKAGE_WEBKITGTK_MULTIMEDIA=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/webkitgtk/webkitgtk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 9328327ac2..ecdb3c788c 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -47,7 +47,7 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
 	-DENABLE_WEB_AUDIO=ON \
 	-DENABLE_WEB_CODECS=ON
-WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
+WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-bad gst1-plugins-base
 else
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
