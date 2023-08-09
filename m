Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE67DEC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA598169B;
	Thu,  7 Sep 2023 15:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA598169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7NewZp8h8Oe; Thu,  7 Sep 2023 15:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5BB821F5;
	Thu,  7 Sep 2023 15:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE5BB821F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 994401BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E4641D7B
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E4641D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWsVgnhcBPnu for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D1AD41D76
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1AD41D76
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74AC786A1F; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 20:37:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69d4e3bc3ed0fec343ab0b85cac65a0a095d308c
X-Git-Newrev: 31d48b8a29efa7680097f60fcf5d1906f19d23d5
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.74AC786A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-material-design-icons: drop
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=31d48b8a29efa7680097f60fcf5d1906f19d23d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer versions of Google's Material Design icon package are structured
differently, making a version bump no so trivial. While work can be done
to support this, considering this package is using v2.2.3 and the most
recent version is v4.0, it is most likely that this package is not being
used. Environments which desire Material icons/fonts/etc. will most
likely achieve better results be managing their own custom package to
have an explicit selection/filter of design styles (e.g. standard,
Android, etc.), variants (basic, outlined, rounds, etc.), display
resolutions and scale selection desired.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  6 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/google-material-design-icons/Config.in     | 40 --------------
 .../google-material-design-icons.hash              |  3 --
 .../google-material-design-icons.mk                | 61 ----------------------
 6 files changed, 6 insertions(+), 106 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d5bf4f08f3..1f9960b6eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.08"
 
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
+	bool "google-material-design-icons removed"
+	select BR2_LEGACY
+	help
+	  The google-material-design-icons package has been removed.
+
 config BR2_GDB_VERSION_10
 	bool "gdb 10.x removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 2cfff87cd5..2c45786a83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1466,7 +1466,6 @@ F:	support/testing/tests/package/test_python_rtoml.py
 N:	James Knight <james.knight@collins.com>
 F:	package/atkmm/
 F:	package/cairomm/
-F:	package/google-material-design-icons/
 F:	package/glibmm/
 F:	package/gtkmm3/
 F:	package/libpqxx/
diff --git a/package/Config.in b/package/Config.in
index 1617f7488a..9ee1893e45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -271,7 +271,6 @@ comment "Fonts"
 
 comment "Icons"
 	source "package/adwaita-icon-theme/Config.in"
-	source "package/google-material-design-icons/Config.in"
 	source "package/hicolor-icon-theme/Config.in"
 
 comment "Sounds"
diff --git a/package/google-material-design-icons/Config.in b/package/google-material-design-icons/Config.in
deleted file mode 100644
index 775f258f27..0000000000
--- a/package/google-material-design-icons/Config.in
+++ /dev/null
@@ -1,40 +0,0 @@
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
-	bool "google-material-design-icons"
-	help
-	  Material design icons are the official icon set from Google
-	  that are designed under the material design guidelines.
-
-	  https://github.com/google/material-design-icons
-
-if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
-	bool "Install PNG icons"
-	help
-	  Use PNG icon types.
-
-	  The default. Traditional format; simplicity and compatibility.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG
-	bool "Install SVG icons"
-	help
-	  Use SVG icon types.
-
-	  Vector format that is limitlessly scalable.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT
-	bool "Install TrueType font"
-	help
-	  Install the Material TrueType font (ttf) on the target system.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS
-	bool "Install CSS sprites"
-	help
-	  Install CSS (PNG) spritesheets.
-
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG
-	bool "Install SVG sprites"
-	help
-	  Install SVG spritesheets.
-
-endif
diff --git a/package/google-material-design-icons/google-material-design-icons.hash b/package/google-material-design-icons/google-material-design-icons.hash
deleted file mode 100644
index 535eca8100..0000000000
--- a/package/google-material-design-icons/google-material-design-icons.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  769547061a51f81623bf5174767c08fc587fd6946339592fbd6cd0dd45f56b4c  2.2.3.tar.gz
-sha256  8ae9438818c26e4873b91d8c6ad620526c011e27e125677f13031eda903f007c  LICENSE
diff --git a/package/google-material-design-icons/google-material-design-icons.mk b/package/google-material-design-icons/google-material-design-icons.mk
deleted file mode 100644
index d410a45e30..0000000000
--- a/package/google-material-design-icons/google-material-design-icons.mk
+++ /dev/null
@@ -1,61 +0,0 @@
-################################################################################
-#
-# google-material-design-icons
-#
-################################################################################
-
-GOOGLE_MATERIAL_DESIGN_ICONS_VERSION = 2.2.3
-GOOGLE_MATERIAL_DESIGN_ICONS_SOURCE = \
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_VERSION).tar.gz
-GOOGLE_MATERIAL_DESIGN_ICONS_SITE = \
-	https://github.com/google/material-design-icons/archive
-GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE = CC-BY-4.0
-GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE_FILES = LICENSE
-
-GOOGLE_MATERIAL_DESIGN_ICONS_LIST = \
-	action alert av communication content device editor file \
-	hardware image maps navigation notification places social toggle
-
-ifneq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG)$(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG),)
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_IMAGES
-	$(foreach family,$(GOOGLE_MATERIAL_DESIGN_ICONS_LIST),\
-		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$(family) \
-			|| exit 1; \
-		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG), \
-			$(INSTALL) -D -m 0644 $(@D)/$(family)/1x_web/*.png \
-				$(TARGET_DIR)/usr/share/google-material/$(family) || exit 1;) \
-		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG), \
-			$(INSTALL) -D -m 0644 $(@D)/$(family)/svg/production/*.svg \
-				$(TARGET_DIR)/usr/share/google-material/$(family) || exit 1;) \
-	)
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT),y)
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT
-	$(INSTALL) -D -m 0644 $(@D)/iconfont/MaterialIcons-Regular.ttf \
-		$(TARGET_DIR)/usr/share/fonts/google-material/MaterialIcons-Regular.ttf \
-		|| exit 1
-endef
-endif
-
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
-	$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS), \
-		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/css-sprite \
-			|| exit 1; \
-		$(INSTALL) -D -m 0644 $(@D)/sprites/css-sprite/* \
-			$(TARGET_DIR)/usr/share/google-material/css-sprite || exit 1)
-	$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG), \
-		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/svg-sprite \
-			|| exit 1; \
-		$(INSTALL) -D -m 0644 $(@D)/sprites/svg-sprite/* \
-			$(TARGET_DIR)/usr/share/google-material/svg-sprite || exit 1)
-endef
-
-define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_TARGET_CMDS
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT)
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_IMAGES)
-	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES)
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
