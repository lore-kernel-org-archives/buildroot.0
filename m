Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C41D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9D040896;
	Wed,  7 Jan 2026 17:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JV2wKiGsznQH; Wed,  7 Jan 2026 17:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FD440A7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808108;
	bh=CACcQ+0gaRV4T8+XP3LYAqU1dVNbgXEiizTm4u1/1HA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FLv8CVhzOhhQWzLJ+zIaKW2ek6snsRwxmy3Q+hrPLQvziMOgpAGQzDlFZyv30I0RL
	 baKtl5+5YgFmeHBuZonsmDFnCARZU/phWmA/bBIhTqFGIgSqnevM5UBIteVnjuhPLC
	 pJotckvo0SbbaasaDvmnvQYYqOFIU0XUcPn+e7hYNj86cCOoMb3/8BKjQMghZaBdq6
	 VJzEalu3HbGWYjAjuNkzWGkXbxHnVeH0wS66vnM05lakvr6fff04iaq4AmwHVv0nLK
	 V6v4o3z19gFolRmNMVAj5LWJ2ctJ862jw27dEKUhlAtZ+2lA3ErVnKqWhKU5R1V+49
	 S3Rlykg+0E9NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FD440A7E;
	Wed,  7 Jan 2026 17:48:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A64FA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1E2D60859
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fr6ToNcCGXx7 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9879E60897
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9879E60897
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97FFC88367; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:34 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 933eef8755fa710f9b66f57ec23c7305a7cb9869
X-Git-Newrev: de761fa21cc737292655f7c57f1cca382367e2b4
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.97FFC88367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/opencv3: drop
 support for ffmpeg
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de761fa21cc737292655f7c57f1cca382367e2b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit ef538cf4d9fde8e1e92364906a81310e321703d2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy           | 7 +++++++
 package/ffmpeg/ffmpeg.mk   | 6 +++---
 package/opencv3/Config.in  | 9 ---------
 package/opencv3/opencv3.mk | 8 +-------
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 53f3c95404..598cd9c0ef 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02.10"
 
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
index f218e60067..1d6ad32d3e 100644
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
 else
 FFMPEG_CONF_OPTS += --disable-libopencv
 endif
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 7a01996b10..d24a7ee83f 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -241,15 +241,6 @@ config BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS
 
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
index ab2840c92e..d6882114d5 100644
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
@@ -231,13 +232,6 @@ OPENCV3_CONF_OPTS += \
 
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
