Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF730D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7556840562;
	Sun, 27 Oct 2024 18:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqQHosgyzpW0; Sun, 27 Oct 2024 18:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B374056B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B374056B;
	Sun, 27 Oct 2024 18:42:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 042C6AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E39B5607CD
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2x3-AXNz1CG for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 950BB6006A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 950BB6006A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9131C813EA; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 543d255cfb9f930fdc089521a4bec24c25dc7007
X-Git-Newrev: baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c
X-Patchwork-Hint: ignore
Message-Id: <20241027184108.9131C813EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 11.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate build opts to new format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.hash |  4 ++--
 package/python-pillow/python-pillow.mk   | 38 ++++++++++++++++----------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 91626319b2..0ef6ebc820 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  869758b3c5f5d8c15ffda4c8011b78d6  pillow-10.4.0.tar.gz
-sha256  166c1cd4d24309b30d61f79f4a9114b7b2313d7450912277855ff5dfd7cd4a06  pillow-10.4.0.tar.gz
+md5  22912b3db645a51ab4b4ff036b559ca8  pillow-11.0.0.tar.gz
+sha256  72bacbaf24ac003fea9bff9837d1eedb6088758d41e100c1552930151f677739  pillow-11.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 62e87951c9..e87c817c68 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.4.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/cd/74/ad3d526f3bf7b6d3f408b73fde271ec69dfac8b81341a318ce825f2b3812
+PYTHON_PILLOW_VERSION = 11.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/a5/26/0d95c04c868f6bdb0c447e3ee2de5564411845e36a858cfd63766bc7b563
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
@@ -14,60 +14,60 @@ PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 
 PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
-PYTHON_PILLOW_BUILD_OPTS = -C--build-option=build_ext -C--build-option=--disable-platform-guessing
+PYTHON_PILLOW_BUILD_OPTS = -Cplatform-guessing=disable
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -Cfreetype=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -Cfreetype=disable
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += jpeg
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg=disable
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 PYTHON_PILLOW_DEPENDENCIES += lcms2
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -Clcms=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -Clcms=disable
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 PYTHON_PILLOW_DEPENDENCIES += libxcb
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -Cxcb=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -Cxcb=disable
 endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += openjpeg
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg2000=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg2000=disable
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 PYTHON_PILLOW_DEPENDENCIES += tiff
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -Ctiff=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -Ctiff=disable
 endif
 
 ifeq ($(BR2_PACKAGE_WEBP),y)
 PYTHON_PILLOW_DEPENDENCIES += webp
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webp
+PYTHON_PILLOW_BUILD_OPTS += -Cwebp=enable
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=disable
 endif
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webp -C--build-option=--disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable -Cwebpmux=disable
 endif
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
