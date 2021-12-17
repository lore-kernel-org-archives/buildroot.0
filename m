Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7223084D55;
	Fri, 17 Dec 2021 19:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TufYNXi_OzEF; Fri, 17 Dec 2021 19:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D35684D51;
	Fri, 17 Dec 2021 19:10:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE481BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3978A84D51
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id teTlklb2NU34 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:10:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3003384D20
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:10:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so4713406wmj.5
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVdaxbIkqb8bvUAd9tj9Gahomc+k1mLq1C3Xx0pKytQ=;
 b=jieWGhRO5MRqlw4ex/nQU1USbOpc6gSW1qjC5MOvaEa7qnAMcIBhFpETohCFPdGpLt
 4gG4G5SVW796rFJfj9uFEcSJn7qpeuw8s6CHMBLm0Wf2sxfXhQzMefWrFbn2WCgRvzyA
 SEnzX99zUCqrGn7n9zBFk6lY852uQH9n7xZUUHDi2VmNnuzvHXkzGnthGjIdDRWt7W9q
 W3AGqdw56WhkhbLnwPQHYp4VjG1299hcw1nb9wrZwPCjq3O2Q90qyK+rIXB5Xxfuk0vr
 3DARwz3T/1uffHz8ijJRbuAli5Y157B7gXDhD86KK5TzpmESG9ezAeWWvAR9R9IxOXRV
 /mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVdaxbIkqb8bvUAd9tj9Gahomc+k1mLq1C3Xx0pKytQ=;
 b=E8GMS56of/k2DVacQsgntZzor7kwoOs0SZr9Tq8pQNcIn0F2qleVkcPHnCN4Vd3YPo
 HLgb49sSsGZbsQ5PPVIJnUpxzK8cTdTFRd26MoE/hZEN87wYrTuYXdjAca01hrQ9CKAo
 yRxrhR3A+DnfFkepAxHDeykwsvId2C2Dd708koO8ZDae2T7v48HrGdGnWrFi1IZj+OHo
 fD2+ORilm5jbjPI+H7IkjG6v6xPxPESmkwM9v02+ISXVhec/V0cuYwsvs7//uqleVmBC
 IPghHSUdTBgyzNNdWgZYvNAUvVfPpLRolXiJdMQ2JSTCT6nckRUB8n1lnjakZneakAw/
 Kn3w==
X-Gm-Message-State: AOAM531JpSDfavhNt6+KhnNOWb2fwDabAtmhs0a7y0l1LLDUH6IofpHg
 Ve+aCaZSuPA0v654qsYe6zrQtcPqa9AH8w==
X-Google-Smtp-Source: ABdhPJy0xjm8wqdvnsraVne/duYdIbvwIhyDyk5f98OqhE/8dk8cWfaZmi4WQGaNVyQCbr94PYmUjw==
X-Received: by 2002:a05:600c:24e:: with SMTP id
 14mr3863101wmj.67.1639768204192; 
 Fri, 17 Dec 2021 11:10:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z22sm2860101wmi.26.2021.12.17.11.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:10:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:08:53 +0100
Message-Id: <20211217190853.18713-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211217190853.18713-1-fontaine.fabrice@gmail.com>
References: <20211217190853.18713-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/rygel: bump to version 0.40.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to meson-package
- gdk-pixbuf and gupnp-dlna are now mandatory
- gstreamer1-editing-services is mandatory with gstreamer engine

https://gitlab.gnome.org/GNOME/rygel/-/blob/rygel-0.40.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rygel/Config.in  |  5 ++--
 package/rygel/rygel.hash |  4 ++--
 package/rygel/rygel.mk   | 51 +++++++++++++++++-----------------------
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
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
