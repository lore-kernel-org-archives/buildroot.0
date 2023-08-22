Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE58CEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7768241694;
	Tue, 22 Aug 2023 20:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7768241694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKref6cFMkI0; Tue, 22 Aug 2023 20:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EEBD40855;
	Tue, 22 Aug 2023 20:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEBD40855
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82AE51BF97D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59F1260A8D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F1260A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SdqK7s7zAwo for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7928E60A8C
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7928E60A8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67D5A861A6; Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 22:36:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 29d8ce9c4130a3e4fb3fdf8ce0bfd896979072c8
X-Git-Newrev: d06ca392909d1c03e1e471dc7ae401b3ee73a5fc
X-Patchwork-Hint: ignore
Message-Id: <20230822203731.67D5A861A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kmscube: add optional
 gstreamer support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d06ca392909d1c03e1e471dc7ae401b3ee73a5fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

kmscube has a gstreamer video texture input since:
https://gitlab.freedesktop.org/mesa/kmscube/-/commit/961c85f6eb42e4445513044c9944c83a0d9cb324

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmscube/Config.in  | 14 ++++++++++++++
 package/kmscube/kmscube.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index 7379675609..f68f38b7a8 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -11,6 +11,20 @@ config BR2_PACKAGE_KMSCUBE
 
 	  https://cgit.freedesktop.org/mesa/kmscube/
 
+if BR2_PACKAGE_KMSCUBE
+
+config BR2_PACKAGE_KMSCUBE_GSTREAMER
+	bool "Enable gstreamer video support"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GSTREAMER1
+
+endif
+
 comment "kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread support"
 	depends on \
 		!BR2_PACKAGE_HAS_LIBEGL || \
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index a47df74f7b..eeb22061fb 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -10,6 +10,13 @@ KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
 KMSCUBE_DEPENDENCIES = host-pkgconf libdrm libegl libgbm libgles
 
+ifeq ($(BR2_PACKAGE_KMSCUBE_GSTREAMER),y)
+KMSCUBE_DEPENDENCIES += gst1-plugins-base gstreamer1 libglib2
+KMSCUBE_CONF_OPTS += -Dgstreamer=enabled
+else
+KMSCUBE_CONF_OPTS += -Dgstreamer=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 KMSCUBE_DEPENDENCIES += libpng
 # libpng is automatically detected in meson, there is no build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
