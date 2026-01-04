Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBDAC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D819A4059B;
	Sun,  4 Jan 2026 13:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypcuH29z9xaN; Sun,  4 Jan 2026 13:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D04F4032B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767531998;
	bh=e+4oT09Bbbc+5JAYANO9Ocp+ZrdcHzg9lXQOeKU88s8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ljRvU01ozNX0/CemM2Vhkb8f9pi6QoKb/RCabwG+Cpnh83HkEeysV2IiilbxIsO8h
	 OTU0bLqdOPWvW/n+4hSLa16NGVFDRiTw+pgxH9e+q7fcNo9cIXM5Le99qiCsrOIRYb
	 xA3F+3vDZgXxSiOy+d5OL/FDRLyuWoTlxBwVjncAZ+ReXjRvDNaoIo1EE8B9JdipvO
	 hnB43+aMkvCVgJjE7HY/h9MRO/7TOp3YAb4gV3qNdO/Zb8OmGmW7VEInV5qBsJhvrt
	 JnMwgueFQfGBoMl1L+fSdtErMpiLdEKElpbnaxJskiOzKHSK58eFki9RElN+lVG1zD
	 9sBzsl08eyYzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D04F4032B;
	Sun,  4 Jan 2026 13:06:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D13A2DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C184059B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNvsmnTYyxXU for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D52740353
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D52740353
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F6C388244; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a67ab908d4f546bda9a94521f3b1f37aea60a365
X-Git-Newrev: 73e9b996fb22205f966bacee4b556afb8afeeb79
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.4F6C388244@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: add missing Config.in
 comments on gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=73e9b996fb22205f966bacee4b556afb8afeeb79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
75ab6cf93a3ba505897ae99b5ff4bffda55d3c7b ("package/{python-}protobuf:
bump to version 28.1") added a whole bunch of gcc >= 8 dependencies to
opencv4 options, but forgot to create or update appropriate Config.in
comments for several options:

BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
BR2_PACKAGE_OPENCV4_LIB_STITCHING
BR2_PACKAGE_OPENCV4_WITH_PROTOBUF

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencv4/Config.in | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index a7f5592122..47c1cf3f4a 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -157,9 +157,10 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	  Include opencv_objdetect (object detection) module into the
 	  OpenCV build.
 
-comment "objdetect needs a glibc or musl toolchain"
+comment "objdetect needs a glibc or musl toolchain w/ gcc 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_LIB_PHOTO
 	bool "photo"
@@ -207,9 +208,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	  Include opencv_stitching (images stitching) module into the
 	  OpenCV build.
 
-comment "stitching needs a glibc or musl toolchain"
+comment "stitching needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
 	bool "superres"
@@ -332,6 +334,10 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
 
+comment "protobuf support needs a toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_OPENCV4_WITH_TBB
 	bool "tbb support"
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
