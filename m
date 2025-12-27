Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E53DE8FDD8
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5608160690;
	Sat, 27 Dec 2025 14:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgLbj8Rho8ZD; Sat, 27 Dec 2025 14:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ADDE60768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847022;
	bh=rkSjXPtM9JnEH+V/Vn0Phdg2+lqUzKIGLkG5aHE0deI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DPydMihGjQ6wMWJ4EufDc407aube/wkTACSVAyaE6kRBq3A2saPcJaXBvL+t/3mR8
	 dTlI9M8VrIl7Okq1lVbEwjSYFEiJMwyw4A/MMsoZ36xtQvuaopbJ1lOP+UpLcQ81Vu
	 l9037fcBWVgbH7LAetVOBjhaR2oESF0Fts8emJv6IY8PvnZRuacXgm1FHZ1dNbVhrE
	 VM07iWRtxWZvAVtQI9sukZjeYvjj9PpF6KeVPJNCH0yBgW0E5u1MyPLsZz7Kprygl9
	 LGaf75hioVWBsM+5Q25C6PbeUKYIXH4pCo7rywdvNiZBhDFw7Yt+g1gA3dvV1+6F1m
	 f3go7E2cpThTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ADDE60768;
	Sat, 27 Dec 2025 14:50:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5F64D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8DC54061F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhbakys53mQj for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D01405F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D01405F8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFF938774F; Sat, 27 Dec 2025 14:50:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 15:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0865927da4dc74c884d86c0b381f7fef0317d7da
X-Git-Newrev: ef538cf4d9fde8e1e92364906a81310e321703d2
X-Patchwork-Hint: ignore
Message-Id: <20251227145016.CFF938774F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv3: drop support for ffmpeg
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef538cf4d9fde8e1e92364906a81310e321703d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opencv3's code is not compatible with newer versions of ffmpeg, and
opencv3 is no longer maintained, so we have no choice but to disable
its ffmpeg support.

Fixes:

  https://autobuild.buildroot.net/results/9ae3911583cccb6362f33cd82e5eaafb059fdc76/

It's not clear which ffmpeg version bump broken the build exactly, but
this issue is definitely present in 2025.02.x as the following
defconfig fails to build in a similar way on 2025.02.x:

 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_PACKAGE_FFMPEG_NONFREE=y
 # BR2_PACKAGE_FFMPEG_FFMPEG is not set
 # BR2_PACKAGE_FFMPEG_INDEVS is not set
 # BR2_PACKAGE_FFMPEG_OUTDEVS is not set
 BR2_PACKAGE_OPENCV3=y
 BR2_PACKAGE_OPENCV3_LIB_VIDEOIO=y
 BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS=y
 BR2_PACKAGE_OPENCV3_WITH_FFMPEG=y
 BR2_PACKAGE_OPENCV3_INSTALL_DATA=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy           | 7 +++++++
 package/ffmpeg/ffmpeg.mk   | 6 +++---
 package/opencv3/Config.in  | 9 ---------
 package/opencv3/opencv3.mk | 8 +-------
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fea7f79ec5..e10fd95f8d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
+	bool "opencv3 ffmpeg support removed"
+	select BR2_LEGACY
+	help
+	  Support for OpenCV 3 ffmpeg support has been removed as it
+	  was no longer compatible with recent versions of ffmpeg.
+
 config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
 	bool "opencv3 protobuf support removed"
 	select BR2_LEGACY
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4c841d7a94..983a87eb2e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -297,11 +297,11 @@ else
 FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
 endif
 
-# To avoid a circular dependency only use opencv if opencv itself does
-# not depend on ffmpeg.
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
+ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),y)
 FFMPEG_CONF_OPTS += --enable-libopencv
 FFMPEG_DEPENDENCIES += opencv3
+# To avoid a circular dependency only use opencv if opencv itself does
+# not depend on ffmpeg.
 else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 6c4d4e9c8a..ad8a075729 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -232,15 +232,6 @@ config BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS
 
 comment "3rd party support"
 
-config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
-	bool "ffmpeg support"
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_SWSCALE
-	help
-	  Use ffmpeg from the target system.
-
 config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3fcf2543a7..9e488bed0c 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -212,6 +212,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_1394=OFF \
 	-DWITH_CLP=OFF \
 	-DWITH_EIGEN=OFF \
+	-DWITH_FFMPEG=OFF \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
 	-DWITH_GSTREAMER_0_10=OFF \
@@ -232,13 +233,6 @@ OPENCV3_CONF_OPTS += \
 
 OPENCV3_DEPENDENCIES += host-pkgconf zlib
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),y)
-OPENCV3_CONF_OPTS += -DWITH_FFMPEG=ON
-OPENCV3_DEPENDENCIES += ffmpeg bzip2
-else
-OPENCV3_CONF_OPTS += -DWITH_FFMPEG=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1),y)
 OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=ON
 OPENCV3_DEPENDENCIES += gstreamer1 gst1-plugins-base
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
