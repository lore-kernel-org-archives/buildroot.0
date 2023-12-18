Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E773EC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83170405AF;
	Mon, 18 Dec 2023 08:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83170405AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8wW49O2g4uY; Mon, 18 Dec 2023 08:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CA0F404E9;
	Mon, 18 Dec 2023 08:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CA0F404E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 806D31BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 574AB404E9
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 574AB404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOvhsFHPv7lG for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:18:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E6B740474
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E6B740474
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1666D87BB2; Mon, 18 Dec 2023 08:18:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:15:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 973b1eba5a4ee72f040bd471b147267e36be73ad
X-Git-Newrev: 5714126edac88e3adc043a482b262b319a907dd3
X-Patchwork-Hint: ignore
Message-Id: <20231218081853.1666D87BB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: bump version to 1.17.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=5714126edac88e3adc043a482b262b319a907dd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/strukturag/libheif/releases

Added configure support for new codec plugins introduced in version
1.17.0: https://github.com/strukturag/libheif/releases/tag/v1.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libheif/libheif.hash |  2 +-
 package/libheif/libheif.mk   | 30 +++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 50152abde5..6ea3ba6eec 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f97e4205c0bd9f9b8560536c8bd2e841d1c9a6d610401eb3eb87ed9cdfe78ea  libheif-1.16.2.tar.gz
+sha256  38ab01938ef419dbebb98346dc0b1c8bb503a0449ea61a0e409a988786c2af5b  libheif-1.17.5.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 65e64a02f7..419a864ef3 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.16.2
+LIBHEIF_VERSION = 1.17.5
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
@@ -30,6 +30,20 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_DAV1D=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=ON
+LIBHEIF_DEPENDENCIES += ffmpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_KVAZAAR),y)
+LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=ON
+LIBHEIF_DEPENDENCIES += kvazaar
+else
+LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDE265),y)
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=ON
 LIBHEIF_DEPENDENCIES += libde265
@@ -37,6 +51,20 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
+LIBHEIF_DEPENDENCIES += libjpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=ON -DWITH_OpenJPEG_ENCODER=ON
+LIBHEIF_DEPENDENCIES += openjpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=OFF -DWITH_OpenJPEG_ENCODER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_X265),y)
 LIBHEIF_CONF_OPTS += -DWITH_X265=ON
 LIBHEIF_DEPENDENCIES += x265
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
