Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D88C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE6F80B53;
	Sat,  3 Aug 2024 20:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zs0_RRjjkz2; Sat,  3 Aug 2024 20:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F9A80B65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F9A80B65;
	Sat,  3 Aug 2024 20:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5160F1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46DED80B53
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-q9mQ67uEfd for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 574BB80B31
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 574BB80B31
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E43183D7F; Sat,  3 Aug 2024 20:29:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 22:15:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 965ce296ee74d8f96c8d7f59e8d5fadb19a3f601
X-Git-Newrev: 0d094c1d41e595b2c77b4d8ece84f2525ac62e6e
X-Patchwork-Hint: ignore
Message-Id: <20240803202942.4E43183D7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: bump version to 1.18.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d094c1d41e595b2c77b4d8ece84f2525ac62e6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release:
https://github.com/strukturag/libheif/commit/4944d7d47cc537681d6836e8c77db179f63af005

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...plugins-encoder_jpeg.cc-fix-libjpeg-build.patch | 47 ----------------------
 package/libheif/libheif.hash                       |  2 +-
 package/libheif/libheif.mk                         |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch b/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
deleted file mode 100644
index 5245327fe7..0000000000
--- a/package/libheif/0001-libheif-plugins-encoder_jpeg.cc-fix-libjpeg-build.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 33eb948240365434c845b618854403e82a229012 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 31 Jan 2024 21:04:37 +0100
-Subject: [PATCH] libheif/plugins/encoder_jpeg.cc: fix libjpeg build
-
-Fix the following libjpeg build failure raised since version 1.17.0 and
-https://github.com/strukturag/libheif/commit/ebd13a20b8b7f1964939642b08b662ef7e483f39
-because third argument of jpeg_mem_dest is defined as size_t* on libjpeg
-instead of unsigned long* on jpeg-turbo:
-
-/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc: In function 'heif_error jpeg_encode_image(void*, const heif_image*, heif_image_input_class)':
-/home/buildroot/autobuild/instance-3/output-1/build/libheif-1.17.5/libheif/plugins/encoder_jpeg.cc:366:37: error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka 'unsigned int*'} [-fpermissive]
-  366 |   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
-      |                                     ^~~~~~~~~~
-      |                                     |
-      |                                     long unsigned int*
-
-Fix #1008 and #1086
-
-Fixes:
- - http://autobuild.buildroot.org/results/8ca909564c8dabe28ad08c96ebbc04b25592e727
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/strukturag/libheif/pull/1120
----
- libheif/plugins/encoder_jpeg.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libheif/plugins/encoder_jpeg.cc b/libheif/plugins/encoder_jpeg.cc
-index d6c7854..21a5541 100644
---- a/libheif/plugins/encoder_jpeg.cc
-+++ b/libheif/plugins/encoder_jpeg.cc
-@@ -360,7 +360,11 @@ struct heif_error jpeg_encode_image(void* encoder_raw, const struct heif_image*
-   }
- 
-   uint8_t* outbuffer = nullptr;
-+#ifdef LIBJPEG_TURBO_VERSION
-   unsigned long outlength = 0;
-+#else
-+  size_t outlength = 0;
-+#endif
- 
-   jpeg_create_compress(&cinfo);
-   jpeg_mem_dest(&cinfo, &outbuffer, &outlength);
--- 
-2.43.0
-
diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index a2ca065b7a..ed1a083d7c 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8390baf4913eda0a183e132cec62b875fb2ef507ced5ddddc98dfd2f17780aee  libheif-1.17.6.tar.gz
+sha256  8702564b0f288707ea72b260b3bf4ba9bf7abfa7dac01353def3a86acd6bbb76  libheif-1.18.1.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 908e2ce068..e2c3a328bc 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.17.6
+LIBHEIF_VERSION = 1.18.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
