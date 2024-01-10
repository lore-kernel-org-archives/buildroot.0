Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304F8C47258
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1A9A43786;
	Wed, 10 Jan 2024 20:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A9A43786
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYLyzrA8b-Yi; Wed, 10 Jan 2024 20:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC9704376A;
	Wed, 10 Jan 2024 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC9704376A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32AA81BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67C95436EF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67C95436EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9uWZ-cxI4_l for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1862436E5
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1862436E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE63585CC8; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:42:57 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: cae61066297f7a94c84fda4fe9c923270a30fc82
X-Git-Newrev: fdc95ef0781b6ccb07b61418fef80950d8e1a0b4
X-Patchwork-Hint: ignore
Message-Id: <20240110201651.BE63585CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libraw: bump to
 version 0.21.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdc95ef0781b6ccb07b61418fef80950d8e1a0b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Drop patch (already in version)

https://github.com/LibRaw/LibRaw/blob/0.21.2/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c67de80597c830f8b8d92b469bf71457aa42c742)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-set-shrink-flag-for-3-4-component-images.patch | 24 ----------------------
 package/libraw/libraw.hash                         |  2 +-
 package/libraw/libraw.mk                           |  5 +----
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
deleted file mode 100644
index ef93e0901b..0000000000
--- a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 477e0719ffc07190c89b4f3d12d51b1292e75828 Mon Sep 17 00:00:00 2001
-From: Alex Tutubalin <lexa@lexa.ru>
-Date: Sat, 14 Jan 2023 18:32:59 +0300
-Subject: [PATCH] do not set shrink flag for 3/4 component images
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/LibRaw/LibRaw/commit/477e0719ffc07190c89b4f3d12d51b1292e75828
----
- src/preprocessing/raw2image.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/preprocessing/raw2image.cpp b/src/preprocessing/raw2image.cpp
-index e65e2ad7..702cf290 100644
---- a/src/preprocessing/raw2image.cpp
-+++ b/src/preprocessing/raw2image.cpp
-@@ -43,6 +43,8 @@ void LibRaw::raw2image_start()
- 
-   // adjust for half mode!
-   IO.shrink =
-+	  !imgdata.rawdata.color4_image && !imgdata.rawdata.color3_image &&
-+	  !imgdata.rawdata.float4_image && !imgdata.rawdata.float3_image &&
-       P1.filters &&
-       (O.half_size || ((O.threshold || O.aber[0] != 1 || O.aber[2] != 1)));
- 
diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 58bb1b4753..838c598d78 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  630a6bcf5e65d1b1b40cdb8608bdb922316759bfb981c65091fec8682d1543cd  LibRaw-0.21.1.tar.gz
+sha256  fe7288013206854baf6e4417d0fb63ba4ed7227bf36fff021992671c2dd34b03  LibRaw-0.21.2.tar.gz
 sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
 sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 63b50e340d..211b67f935 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.21.1
+LIBRAW_VERSION = 0.21.2
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
@@ -18,9 +18,6 @@ LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
-# 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
-LIBRAW_IGNORE_CVES += CVE-2023-1729
-
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
 LIBRAW_DEPENDENCIES += jasper
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
