Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD72D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9DEF60DD3;
	Tue, 13 Jan 2026 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFzUCoGLWcQ0; Tue, 13 Jan 2026 19:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A59460DD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333052;
	bh=EtJLUedtltvT9ydC0YiTLjK6FNNoTzz52qgV41sdHUE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MvX8VGAo0YhLFZCqZhHQm7tVX8ktPM3+M6q3Zw2VBYahfu3m6n5bZA+EkLfgalrjg
	 GPPladz4fAFJvw296pjLrPq5CHb3dEeY6n5i82gNsM+k/X6P4sPg9nLJuZ8gXBlpkr
	 wB/CLs+iJ/gwIYheVigkzdfWy4N54HBubdafb+1QFPd4UTJkjaKbVay9i0YJxJ1x8e
	 BTg1X+kVa27uHxq8839Kl2NPy5LIwDrhIwfq2gOoWJ0yuIAjJc4cqApPE2z8mrv48o
	 F5VRqeEtDWMXw710QoAhwbs5EN0tytosTQWq2bGyrM4OzRqGadjDKWJ1u5nUKsf1A7
	 QAP7xviZT4A2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A59460DD4;
	Tue, 13 Jan 2026 19:37:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12251231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C6F4055D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNV3FIosPgND for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C822E4056A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C822E4056A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C77B5873D9; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5d3880e9f35edf34fafaca07bf7026a54c3ac74f
X-Git-Newrev: b262d3f0582e8437b2ed254ca0f8254b60fd9d1c
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.C77B5873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/opencv4-contrib:
 add missing gcc >= 8 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=b262d3f0582e8437b2ed254ca0f8254b60fd9d1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit
75ab6cf93a3ba505897ae99b5ff4bffda55d3c7b ("package/{python-}protobuf:
bump to version 28.1") added a whole bunch of gcc >= 8 dependencies to
OpenCV 4 options, but forgot to propagate those to opencv4-contrib.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
  Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=n]
  Selected by [y]:
  - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a67ab908d4f546bda9a94521f3b1f37aea60a365)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/opencv4-contrib/Config.in | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index ad61c3fbe8..529687dd96 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -76,28 +76,32 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 	bool "dnn_objdetect"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Object Detection using CNNs -- Implements compact CNN Model
 	  for object detection. Trained using Caffe but uses
 	  opencv_dnn module.
 
-comment "dnn_objdetect needs a glibc or musl toolchain"
+comment "dnn_objdetect needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Superresolution using CNNs -- Contains four trained
 	  convolutional neural networks to upscale images.
 
-comment "dnn_superres needs a glibc or musl toolchain"
+comment "dnn_superres needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
@@ -109,27 +113,31 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
 	bool "dpm"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Deformable Part Model -- Felzenszwalb's Cascade with
 	  deformable parts object recognition code.
 
-comment "dpm needs a glibc or musl toolchain"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
-	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+comment "dpm needs a glibc or musl toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
 	bool "face"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Face Recognition -- Face recognition techniques: Eigen, Fisher
 	  and Local Binary Pattern Histograms LBPH methods.
 
-comment "face needs a glibc or musl toolchain"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
-	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+comment "face needs a glibc or musl toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE
 	bool "freetype"
@@ -347,15 +355,17 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
 	bool "xobjdetect"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Boosted 2D Object Detection -- Uses a Waldboost cascade and
 	  local binary patterns computed as integral features for 2D
 	  object detection.
 
-comment "xobjdetect needs a glibc or musl toolchain"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
-	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+comment "xobjdetect needs a glibc or musl toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
 	bool "xphoto"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
