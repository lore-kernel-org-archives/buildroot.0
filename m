Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6953E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44FA980DCF;
	Sat, 27 Dec 2025 14:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcQLQMZgo1AD; Sat, 27 Dec 2025 14:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC2180DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847020;
	bh=XPZdXs7FhpRSC2eR7dmC6fCqfCERKgwjTKnm8NQGqYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cDBxoJMo/48A+Z3t7XOqJ4VlL+gZxAZDBMclhb4Uh4lisYr3ql3vrgSgGM5SOBPeV
	 0F6RI4fEype1DaNEVevByNBzHpJbuX8maEbO4YPkRWIbp58VteD4mu8XpI8Tneiods
	 7qDg76zKxkLAwPVYbhAUn77L7HNEXX1qJVkk8YJ6gfciQJrgJV/0NIqHL8bH8TecIZ
	 VDbPZA55NaCG0KIhA/hZSgoySl2n7J31nEm17mzeDVfh4XJG2NHDOEKTPVIPJZacvg
	 KBTTRwUU7pJ5DhsO4a7/eyiJMayprg+ZVbD7Ejb8pPdA6wGGlvoCHr7ltaYfkbsSLq
	 hNWKgaO4b63Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC2180DEB;
	Sat, 27 Dec 2025 14:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73530B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62A67405FF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tm4CjGiaU5Jk for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6131405FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6131405FD
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF8AE8774E; Sat, 27 Dec 2025 14:50:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 15:38:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a63acfa0a37ef890023f637735f8b9fe2ba8a7aa
X-Git-Newrev: 0865927da4dc74c884d86c0b381f7fef0317d7da
X-Patchwork-Hint: ignore
Message-Id: <20251227145016.BF8AE8774E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv3: drop support for protobuf
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

commit: https://git.buildroot.net/buildroot/commit/?id=0865927da4dc74c884d86c0b381f7fef0317d7da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Config.in.legacy           |  7 +++++++
 package/opencv3/Config.in  | 12 ------------
 package/opencv3/opencv3.mk | 12 +-----------
 3 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1a756dcd3c..fea7f79ec5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
+	bool "opencv3 protobuf support removed"
+	select BR2_LEGACY
+	help
+	  Support for OpenCV 3 protobuf support has been removed as it
+	  was no longer compatible with recent versions of protobuf.
+
 config BR2_PACKAGE_RESIPROCATE_APPS
 	bool "resiprocate apps support option removed"
 	select BR2_LEGACY
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
