Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCAAD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946C040A2D;
	Wed,  7 Jan 2026 17:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJf9L0b2DPsq; Wed,  7 Jan 2026 17:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0598940A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808038;
	bh=W6AjLWyzsdOUd0UaCyOQx/x+spQopas6XTnHXsHX0+k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O7HGIGJg8ua5L0/2hODhBKAlI/bBtsdTp4zr5ydvxdDN9H6PIltrHb3vpkii0weGH
	 bexj4PpTapI3nFKR7jeawCfiutXOVAQGg/rhzo0kg3JCSa/vSzM4PYCfyBl9Bvg/uR
	 dcKabyOnXmfTsXYm2VpyFllGfBKmsXFCceYzS1H+vLbtY8c9PYQPZ0VIuCd9Cuc4S/
	 hH3En6gwl0ENytcAotVL3ptVLgAeuzPvzvLjpFsa2jUxSLDrxyN47MkHJZBR89ZkI9
	 gzYm2jn22ol3v7e8mmpHIe4IjY4yktvQF1eapqvqnMRJfEnPdmTEuywdUjsGqjQDI2
	 aYPohuRrXfRAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0598940A28;
	Wed,  7 Jan 2026 17:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D69FA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3EE680A87
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCyvCrP-XPZD for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B9CC80A68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B9CC80A68
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AB7287D42; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:32 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7e124a1c8c5b1d3b412ede2a3ac65baf10b7a15
X-Git-Newrev: 933eef8755fa710f9b66f57ec23c7305a7cb9869
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.8AB7287D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/opencv3: drop
 support for protobuf
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

commit: https://git.buildroot.net/buildroot/commit/?id=933eef8755fa710f9b66f57ec23c7305a7cb9869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The protobuf support breaks the build, as protobuf includes
libabseil-cpp headers, which now require C++14. opencv3 doesn't have
any ENABLE_CXX14 option, so for the time being, disable protobuf
support until someone bothers enough to fix this up.

While we suspect a libabseil-cpp version bump to be responsible for
the issue, we are not 100% sure. However, the issue is definitely
present in Buildroot 2025.02.x, as it can be reproduced using the
following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_OPENCV3=y
BR2_PACKAGE_OPENCV3_LIB_SHAPE=y
BR2_PACKAGE_OPENCV3_LIB_STITCHING=y
BR2_PACKAGE_OPENCV3_LIB_SUPERRES=y
BR2_PACKAGE_OPENCV3_LIB_TS=y
BR2_PACKAGE_OPENCV3_LIB_VIDEOSTAB=y
BR2_PACKAGE_OPENCV3_WITH_PROTOBUF=y

Fixes:

  https://autobuild.buildroot.net/results/39432e7746e6bc5224592a7d2f744ca992bd529a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0865927da4dc74c884d86c0b381f7fef0317d7da)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy           |  9 +++++++++
 package/opencv3/Config.in  | 12 ------------
 package/opencv3/opencv3.mk | 12 +-----------
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 18e5fed951..53f3c95404 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.02.10"
+
+config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
+	bool "opencv3 protobuf support removed"
+	select BR2_LEGACY
+	help
+	  Support for OpenCV 3 protobuf support has been removed as it
+	  was no longer compatible with recent versions of protobuf.
+
 comment "Legacy options removed in 2025.02.9"
 
 config BR2_PACKAGE_MONGREL2
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index a672497108..7a01996b10 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -287,18 +287,6 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
-config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
-	bool "protobuf support"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
-	select BR2_PACKAGE_PROTOBUF
-	help
-	  Use shared protobuf from the target system.
-
-comment "protobuf support needs a toolchain w/ gcc >= 8"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-
 config BR2_PACKAGE_OPENCV3_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 5064496ca6..ab2840c92e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -222,6 +222,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENNI2=OFF \
 	-DWITH_OPENNI=OFF \
+	-DWITH_PROTOBUF=OFF \
 	-DWITH_UNICAP=OFF \
 	-DWITH_VA=OFF \
 	-DWITH_VA_INTEL=OFF \
@@ -288,17 +289,6 @@ else
 OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
-# protobuf needs c++11 (since 3.6.0)
-OPENCV3_CONF_OPTS += \
-	-DENABLE_CXX11=ON \
-	-DPROTOBUF_UPDATE_FILES=ON \
-	-DWITH_PROTOBUF=ON
-OPENCV3_DEPENDENCIES += protobuf
-else
-OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
 OPENCV3_CONF_OPTS += -DWITH_QT=5
 OPENCV3_DEPENDENCIES += qt5base
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
