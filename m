Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA493CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A278183C76;
	Fri, 29 May 2026 08:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaxwsItpTPm0; Fri, 29 May 2026 08:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02C283C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043182;
	bh=nKQGNivYEkRERHPKKtz62WMJjSShh1lQ1PL5J3BVtXk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=csLRr1TQdgPO5cgnxk3AJ+DKYIN2qDhl5FWAaP9O4ox3q1+hEpdv1T6u8HLcXx+X+
	 topVDD/sBQmhxsTz7NQTFIOeEonMnEWrVGjZsLvVJySzrVlUWADJr67UKznfOz023l
	 MFljiizlXwslDoCUNKgXJYGTLTp25dnrFSD1doWEirbuE6gEJ9JzPc6GzCPzDaCJCE
	 QILIG5Yu57+LUo1ZKe6x5Ks/ioSB1br3f7zpfaf1ZxMHeSimZTD34ChInV9grvQe0B
	 QVGk7hX8OcY/FwYLprD2h+I2grhHK8lE0m825f00gctS4h6HCCN4ue42b6hpCDeelx
	 v+nEhSjSiLXyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02C283C69;
	Fri, 29 May 2026 08:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11AA8288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AEA841F9E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAbMm6ymlsOm for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A13D41F78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A13D41F78
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDECB870C6; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:40:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1a33b41f56b37ef31257aa19b35effb7c1fa2b92
X-Git-Newrev: 71726bf7ccb15b25b3177d75298472ca17693f9b
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.DDECB870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: bump
 version to 1.21.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71726bf7ccb15b25b3177d75298472ca17693f9b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/strukturag/libheif/releases/tag/v1.21.0
https://github.com/strukturag/libheif/releases/tag/v1.21.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a8aed698c706ec534ddc41cdce651c18016c28ca)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...01-fix-wrong-copy-width-in-overlay-images.patch | 26 ----------------------
 package/libheif/libheif.hash                       |  2 +-
 package/libheif/libheif.mk                         |  5 +----
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch b/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
deleted file mode 100644
index 4d845b2f90..0000000000
--- a/package/libheif/0001-fix-wrong-copy-width-in-overlay-images.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b8c12a7b70f46c9516711a988483bed377b78d46 Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Tue, 11 Nov 2025 19:47:50 +0100
-Subject: [PATCH] fix wrong copy width in overlay images (thanks to Aldo
- Ristori for reporting this)
-
-CVE: CVE-2025-68431
-Upstream: https://github.com/strukturag/libheif/commit/b8c12a7b70f46c9516711a988483bed377b78d46
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- libheif/pixelimage.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libheif/pixelimage.cc b/libheif/pixelimage.cc
-index f202c61049..84a8dd739e 100644
---- a/libheif/pixelimage.cc
-+++ b/libheif/pixelimage.cc
-@@ -1508,7 +1508,7 @@ Error HeifPixelImage::overlay(std::shared_ptr<HeifPixelImage>& overlay, int32_t
-       if (!has_alpha) {
-         memcpy(out_p + out_x0 + (out_y0 + y - in_y0) * out_stride,
-                in_p + in_x0 + y * in_stride,
--               in_w - in_x0);
-+               in_w);
-       }
-       else {
-         for (uint32_t x = in_x0; x < in_w; x++) {
diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index da2516a583..3da82e3e27 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  68ac9084243004e0ef3633f184eeae85d615fe7e4444373a0a21cebccae9d12a  libheif-1.20.2.tar.gz
+sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index b69e699bf9..acd302d847 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.20.2
+LIBHEIF_VERSION = 1.21.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
@@ -23,9 +23,6 @@ LIBHEIF_CONF_OPTS = \
 	-DWITH_REDUCED_VISIBILITY=ON \
 	-DWITH_SvtEnc=OFF
 
-# 0001-fix-wrong-copy-width-in-overlay-images.patch
-LIBHEIF_IGNORE_CVES += CVE-2025-68431
-
 ifeq ($(BR2_PACKAGE_DAV1D),y)
 LIBHEIF_CONF_OPTS += -DWITH_DAV1D=ON
 LIBHEIF_DEPENDENCIES += dav1d
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
