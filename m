Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C725C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5F3605A6;
	Mon, 31 Jul 2023 21:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B5F3605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKtSKUlhM9BH; Mon, 31 Jul 2023 21:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EE5A60586;
	Mon, 31 Jul 2023 21:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE5A60586
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DAAC1BF97F
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F68D60592
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F68D60592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhUQ-VZ8k3Mf for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:15:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71A9860586
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A9860586
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58BC383E3A; Mon, 31 Jul 2023 21:15:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 23:15:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e434d8a29fd566c43c1051eb84694b6ac032597d
X-Git-Newrev: 135bc0b0795eb67b94ca3fd39f211eede17f54e7
X-Patchwork-Hint: ignore
Message-Id: <20230731211549.58BC383E3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swaybg: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=135bc0b0795eb67b94ca3fd39f211eede17f54e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides the `swaybg` utility, which is commonly used with `sway` to
manage background images/color configuration for the compositor.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/swaybg/Config.in   | 13 +++++++++++++
 package/swaybg/swaybg.hash |  3 +++
 package/swaybg/swaybg.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3780204227..05a8d26988 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1465,6 +1465,7 @@ F:	package/gtkmm3/
 F:	package/libpqxx/
 F:	package/pangomm/
 F:	package/rpm/
+F:	package/swaybg/
 F:	package/yad/
 
 N:	Jan Heylen <jan.heylen@nokia.com>
diff --git a/package/Config.in b/package/Config.in
index a60a1a8858..1d30465434 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -329,6 +329,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
+	source "package/swaybg/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
 
diff --git a/package/swaybg/Config.in b/package/swaybg/Config.in
new file mode 100644
index 0000000000..63aa8cdb6a
--- /dev/null
+++ b/package/swaybg/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SWAYBG
+	bool "swaybg"
+	default y if BR2_PACKAGE_SWAY
+	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  Wallpaper tool for Wayland compositors.
+
+	  https://github.com/swaywm/swaybg
diff --git a/package/swaybg/swaybg.hash b/package/swaybg/swaybg.hash
new file mode 100644
index 0000000000..62bf048d61
--- /dev/null
+++ b/package/swaybg/swaybg.hash
@@ -0,0 +1,3 @@
+# Locally computed, tarball verified with GPG signature
+sha256  c0205b34f1fad94553b6cb2c2b983cc33186018026058cad0b841a00bc3087e3  swaybg-1.2.0.tar.gz
+sha256  95224d118a325daf31828afcca98cd958d53f0a7cdd856b50b1be8ac44832faf  LICENSE
diff --git a/package/swaybg/swaybg.mk b/package/swaybg/swaybg.mk
new file mode 100644
index 0000000000..90a8cb5d80
--- /dev/null
+++ b/package/swaybg/swaybg.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# swaybg
+#
+################################################################################
+
+SWAYBG_VERSION = 1.2.0
+SWAYBG_SITE = https://github.com/swaywm/swaybg/releases/download/v$(SWAYBG_VERSION)
+SWAYBG_LICENSE = MIT
+SWAYBG_LICENSE_FILES = LICENSE
+
+SWAYBG_DEPENDENCIES = \
+	cairo \
+	wayland \
+	wayland-protocols
+
+SWAYBG_CONF_OPTS = \
+	-Dman-pages=disabled \
+	-Dwerror=false
+
+ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
+SWAYBG_CONF_OPTS += -Dgdk-pixbuf=enabled
+SWAYBG_DEPENDENCIES += gdk-pixbuf
+else
+SWAYBG_CONF_OPTS += -Dgdk-pixbuf=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
