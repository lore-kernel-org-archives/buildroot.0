Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B52C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B6460E72;
	Mon, 20 Dec 2021 22:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWdWQq8o0JTU; Mon, 20 Dec 2021 22:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C335460E39;
	Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF4451BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF52F40241
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMW7YS-qo9BF for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4D4440210
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DA089828BA; Mon, 20 Dec 2021 22:36:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68c8c37d7d15a11d91b699f15dbaa00adcd4773e
X-Git-Newrev: 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3
X-Patchwork-Hint: ignore
Message-Id: <20211220223640.DA089828BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rygel: bump to version 0.40.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- gdk-pixbuf and gupnp-dlna are now mandatory
- gstreamer1-editing-services is mandatory with gstreamer engine

https://gitlab.gnome.org/GNOME/rygel/-/blob/rygel-0.40.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rygel/Config.in  |  5 +++--
 package/rygel/rygel.hash |  4 ++--
 package/rygel/rygel.mk   | 51 +++++++++++++++++++++---------------------------
 3 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index 86d6a38e1e..df48918833 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -3,7 +3,9 @@ config BR2_PACKAGE_RYGEL
 	depends on BR2_USE_WCHAR # gupnp-av
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gupnp-av
 	depends on BR2_USE_MMU # gupnp-av
+	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GUPNP_AV
+	select BR2_PACKAGE_GUPNP_DLNA
 	select BR2_PACKAGE_LIBGEE
 	select BR2_PACKAGE_LIBMEDIAART
 	select BR2_PACKAGE_SQLITE
@@ -37,10 +39,9 @@ config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_SIMPLE
 
 config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
 	bool "gstreamer1"
-	select BR2_PACKAGE_GDK_PIXBUF
-	select BR2_PACKAGE_GUPNP_DLNA
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
 
 endchoice
 
diff --git a/package/rygel/rygel.hash b/package/rygel/rygel.hash
index 33b44aecc2..04b11ff54a 100644
--- a/package/rygel/rygel.hash
+++ b/package/rygel/rygel.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.38/rygel-0.38.3.sha256sum:
-sha256  08c21a577f7bdad26446a75ffa32778b26842c3b1188165f0b19818559747d00  rygel-0.38.3.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.40/rygel-0.40.2.sha256sum:
+sha256  c9e8c736296d22c4defe959727a29d31437bbd2b7aa0c6470d6be24011050697  rygel-0.40.2.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index 21c8ebee6a..c541cdc0ed 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-RYGEL_VERSION_MAJOR = 0.38
-RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).3
+RYGEL_VERSION_MAJOR = 0.40
+RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).2
 RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
 RYGEL_SITE = http://ftp.gnome.org/pub/gnome/sources/rygel/$(RYGEL_VERSION_MAJOR)
 RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
 RYGEL_LICENSE_FILES = COPYING COPYING.logo
 RYGEL_DEPENDENCIES = \
+	gdk-pixbuf \
 	gupnp-av \
+	gupnp-dlna \
 	libgee \
 	libmediaart \
 	sqlite \
@@ -20,51 +22,42 @@ RYGEL_INSTALL_STAGING = YES
 
 RYGEL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 RYGEL_CONF_OPTS += \
-	--disable-apidocs \
-	--disable-coverage \
-	--disable-example-plugins \
-	--enable-external-plugin \
-	--enable-lms-plugin \
-	--enable-mpris-plugin \
-	--enable-ruih-plugin \
-	--disable-tracker-plugin
-
-ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
-RYGEL_DEPENDENCIES += gdk-pixbuf
-endif
+	-Dapi-docs=false \
+	-Dexamples=false \
+	-Dtests=false
+RYGEL_PLUGINS = external,lms,mpris,ruih
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-RYGEL_CONF_OPTS += --enable-introspection
+RYGEL_CONF_OPTS += -Dintrospection=enabled
 RYGEL_DEPENDENCIES += gobject-introspection
 else
-RYGEL_CONF_OPTS += --disable-introspection
+RYGEL_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1),y)
 RYGEL_CONF_OPTS += \
-	--with-media-engine=gstreamer \
-	--enable-playbin-plugin \
-	--enable-media_export-plugin \
-	--enable-gst-launch-plugin
+	-Dengines=gstreamer \
+	-Dgstreamer=enabled
+RYGEL_PLUGINS += ,playbin,media-export,gst-launch
 RYGEL_DEPENDENCIES += \
-	gupnp-dlna \
 	gst1-plugins-base \
-	gstreamer1
+	gstreamer1 \
+	gstreamer1-editing-services
 else ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_SIMPLE),y)
 RYGEL_CONF_OPTS += \
-	--with-media-engine=simple \
-	--disable-playbin-plugin \
-	--disable-media_export-plugin \
-	--disable-gst-launch-plugin
+	-Dengines=simple \
+	-Dgstreamer=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-RYGEL_CONF_OPTS += --with-ui
+RYGEL_CONF_OPTS += -Dgtk=enabled
 RYGEL_DEPENDENCIES += libgtk3
 else
-RYGEL_CONF_OPTS += --without-ui
+RYGEL_CONF_OPTS += -Dgtk=disabled
 endif
 
+RYGEL_CONF_OPTS += -Dplugins="$(RYGEL_PLUGINS)"
+
 define RYGEL_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/rygel/S99rygel \
 		$(TARGET_DIR)/etc/init.d/S99rygel
@@ -75,4 +68,4 @@ define RYGEL_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/rygel.service
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
