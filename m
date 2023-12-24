Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB3AC46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 21:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D26F81AEF;
	Sun, 24 Dec 2023 21:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D26F81AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0uWumZsAZKu; Sun, 24 Dec 2023 21:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8197A81AF3;
	Sun, 24 Dec 2023 21:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8197A81AF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 780AF1BF279
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E165403C0
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E165403C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yglj_D4YLAYq for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 21:36:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D008401F3
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 21:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D008401F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 567A5828A6; Sun, 24 Dec 2023 21:36:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 22:36:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f6b1b8e6893003efcc72185cd468dcb0b088b2d
X-Git-Newrev: d62dda206539ef2eeaf767772a00cdd52a55ab1d
X-Patchwork-Hint: ignore
Message-Id: <20231224213658.567A5828A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/foot: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d62dda206539ef2eeaf767772a00cdd52a55ab1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the default terminal sway uses.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: add comment only for first-order deps]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/foot/Config.in | 36 ++++++++++++++++++++++++++++++++++++
 package/foot/foot.hash |  3 +++
 package/foot/foot.mk   | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 91 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9492ebe79b..a232059a62 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,6 +35,7 @@ N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/dmenu-wayland/
 F:	package/fcft/
+F:	package/foot/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
diff --git a/package/Config.in b/package/Config.in
index b0e18436ff..a7c653746e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
+	source "package/foot/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/foot/Config.in b/package/foot/Config.in
new file mode 100644
index 0000000000..24b3f78821
--- /dev/null
+++ b/package/foot/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_FOOT
+	bool "foot"
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fcft, wayland
+	select BR2_PACKAGE_FCFT
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_TLLIST
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  A fast, lightweight and minimalistic Wayland terminal
+	  emulator.
+	  NOTE: foot needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
+
+	  https://codeberg.org/dnkl/foot
+
+if BR2_PACKAGE_FOOT
+
+config BR2_PACKAGE_FOOT_GRAPHEME_CLUSTERING
+	bool "grapheme-clustering"
+	select BR2_PACKAGE_UTF8PROC
+	help
+	  Enables grapheme clustering.
+
+config BR2_PACKAGE_FOOT_THEMES
+	bool "themes"
+	help
+	  Install themes (predefined color schemes)
+
+endif # BR2_PACKAGE_FOOT
+
+comment "foot needs a toolchain w/ dynamic library, threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/foot/foot.hash b/package/foot/foot.hash
new file mode 100644
index 0000000000..f3bf0f6058
--- /dev/null
+++ b/package/foot/foot.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  1.16.2.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
new file mode 100644
index 0000000000..1595e2a718
--- /dev/null
+++ b/package/foot/foot.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# foot
+#
+################################################################################
+
+FOOT_VERSION = 1.16.2
+FOOT_SOURCE = $(FOOT_VERSION).tar.gz
+FOOT_SITE = https://codeberg.org/dnkl/foot/archive
+FOOT_LICENSE = MIT
+FOOT_LICENSE_FILES = LICENSE
+FOOT_DEPENDENCIES = \
+	fcft \
+	fontconfig \
+	freetype \
+	libxkbcommon \
+	pixman \
+	tllist \
+	wayland \
+	wayland-protocols
+
+FOOT_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dtests=false
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FOOT_DEPENDENCIES += systemd
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUTEMPTER),y)
+FOOT_DEPENDENCIES += libutempter
+FOOT_CONF_OPTS += -Dutmp-backend='libutempter'
+else
+FOOT_CONF_OPTS += -Dutmp-backend='none'
+endif
+
+ifeq ($(BR2_PACKAGE_FOOT_GRAPHEME_CLUSTERING),y)
+FOOT_DEPENDENCIES += utf8proc
+FOOT_CONF_OPTS += -Dgrapheme-clustering=enabled
+else
+FOOT_CONF_OPTS += -Dgrapheme-clustering=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FOOT_THEMES),y)
+FOOT_CONF_OPTS += -Dthemes=true
+else
+FOOT_CONF_OPTS += -Dthemes=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
