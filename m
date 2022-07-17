Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB30C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1704484098;
	Sun, 17 Jul 2022 13:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1704484098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1oiEV4-JnvT; Sun, 17 Jul 2022 13:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA1F83F10;
	Sun, 17 Jul 2022 13:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA1F83F10
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 801EF1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51D9860B09
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D9860B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UYMxOYXefTB for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:00:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8776A60AFD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8776A60AFD
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 54A7A83A90; Sun, 17 Jul 2022 12:46:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 14:59:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 030baf89fc9467329907abe07c292567e2f05c0f
X-Git-Newrev: 0f50b833160e451199a1a9c5b0a17f77075f873a
X-Patchwork-Hint: ignore
Message-Id: <20220717124655.54A7A83A90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to latest master
 commit ba6435930f08e802cffc688d90f156a8959a0f86
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f50b833160e451199a1a9c5b0a17f77075f873a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings in support for OV5675 and IMX477 camera sensors, exposes
autofocus controls through the libcamera API, adds support for more
pixel and media bus formats, fixes AWB on IPU3, improves gstreamer
support and numerous other improvements and fixes.

Since commit fcb0ea001a2d "libcamera: Introduce YamlParser as a helper
to parse yaml files", libyaml is a required dependency since YAML is
used for configuration/tuning files.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/Config.in      | 1 +
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index fd7b3c92c4..0febfef4bc 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -14,6 +14,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
 	  libcamera provides a software stack to support
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 181bb1349a..68c9c1f005 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  9aa62d41470238ac8c3bb847601d1a803ac7a270d3b5e87f722e9c93c867d18d  libcamera-8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98-br1.tar.gz
+sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 3f336cb797..9c03d3a3b3 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
+LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
@@ -13,6 +13,7 @@ LIBCAMERA_DEPENDENCIES = \
 	host-python-jinja2 \
 	host-python-ply \
 	host-python-pyyaml \
+	libyaml \
 	gnutls
 LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
