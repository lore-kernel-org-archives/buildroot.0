Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4ECD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FBCB4133E;
	Wed,  7 Jan 2026 18:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YShZwl9AfiV0; Wed,  7 Jan 2026 18:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E01B4132D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808916;
	bh=pB0ux+NjXyqqMxKcG/NGjtyrX8nQOp4hLDznjLgCVLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X538DXwWr7czs57xbu33XSCLKpBvsRhnWZfiIkzTQoi1+Li9JbndeN/o1+F2bxq6j
	 S8GQgUOKGc6eq5Z/Io2zMBxIxilae7nTDiHfQmhR+J8SETRW4GjdDgfdQx3NX7IlGi
	 5nI1A5KXN1+ppExmJfnXXn3gq6Izpg7jmMIUe6NLgprdlHiJRiuzNU8HJv8soxkHv9
	 lcyeDOZgdHGH77Qq+3xnE4irOP+i2GFD3bSe4jfdxSxVr1UpPQ/c1q3np4o/vu2XlK
	 v+jk6nMchQQML3ifBvuIGA98tklvHHyizLP2AbeNhfjnBXzor/u4MoHaC4aYzxxvwD
	 ldvcOXWyt/ZZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E01B4132D;
	Wed,  7 Jan 2026 18:01:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB95A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5269B40A6E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47o_LX6cnvaM for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F25C408AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F25C408AA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E68E82200; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:50:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5d83145af3b9d0a248a3804b4c37591114fb8ee8
X-Git-Newrev: d943f82156e18837cfd10f9a37f811936676eea7
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.5E68E82200@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/opencv3: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=d943f82156e18837cfd10f9a37f811936676eea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
index c9bcb20c1f..f53fb149bf 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11.1"
 
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
