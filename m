Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57989D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F0D28107F;
	Wed,  7 Jan 2026 18:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3VEGvyDKA3B; Wed,  7 Jan 2026 18:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7A883192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808962;
	bh=nBuZDhqYanhP0S1s6pegnRo1gpTwbXX2wZ7WBAWcZ9I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J7ITkD0Hj/3Dz58DtCmUyEk3z+3R5JOCVZyCRVK6NCCRuOLYUulSgwBVMDIYkOtZK
	 vvj5aUi4VAVVwbb3TaLySBsUa8x4SUVS6qNhkEaoyFgx7HBkbKVmwVld8mvogdbyO0
	 x9sz9jhi+RS1iOyDebwbzxQJHSb/98UyoQMFMUnwp8iVCENn9Ap6o6GTQUwrF3P0IE
	 Y4yWZdbpTY9TwUNc6cjSeBhgXT+yM5EL+0r7m5jL9Ipge8Qf8Tpyu36kpxpR+WF7Om
	 7URqFdmNedb7DSz1RAA2CeA1uwvqVtHwHmFWQ9jLfcgf7igX1RAN72YSbX44pRoTAy
	 9YlSKZzmLVMqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7A883192;
	Wed,  7 Jan 2026 18:02:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED419ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 816EC80DCA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2__Q3Lp_pRnO for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C1C80F06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52C1C80F06
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51AFA87C86; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:46:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ef6c4dddf3c5cd780478aa2ad0f428a1107c2523
X-Git-Newrev: 5d83145af3b9d0a248a3804b4c37591114fb8ee8
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.51AFA87C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/opencv3: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d83145af3b9d0a248a3804b4c37591114fb8ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
index 64151b2f44..c9bcb20c1f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.11.1"
+
+config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
+	bool "opencv3 protobuf support removed"
+	select BR2_LEGACY
+	help
+	  Support for OpenCV 3 protobuf support has been removed as it
+	  was no longer compatible with recent versions of protobuf.
+
 comment "Legacy options removed in 2025.11"
 
 config BR2_KERNEL_HEADERS_5_4
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index c4c5d22a54..6c4d4e9c8a 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -278,18 +278,6 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
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
index 8a862a47b1..3fcf2543a7 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -223,6 +223,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENNI2=OFF \
 	-DWITH_OPENNI=OFF \
+	-DWITH_PROTOBUF=OFF \
 	-DWITH_UNICAP=OFF \
 	-DWITH_VA=OFF \
 	-DWITH_VA_INTEL=OFF \
@@ -282,17 +283,6 @@ else
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
