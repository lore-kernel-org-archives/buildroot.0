Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E427EFA3723
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC416071C;
	Thu,  1 Jan 2026 21:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZWamvugm_Fo; Thu,  1 Jan 2026 21:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AD6360749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304378;
	bh=93Lf1MkJ8vH5I4TrHNSQE6ddbIcjbc5dv36lGxU/xxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pc4nvJaWkkrjw9/vfrcXsx3race7J064Ka5/kdT4+Nglel/3YWkNGfdhcFA9rLAr+
	 YiccU0Vkj1VftQ0q2ttAuo9F2Xj0ID1U81yOHIASUGt6DG3YZKE7d2Bojtc/n8uG/g
	 OV8iJRoJIS8EOgCdsaIuAA/BuXDi8KTiDHXEUqwMuWJ1P7RvicrnVDrGnlsRL/Cs2W
	 U1Xlw1btDyM2SYXPWt8Vzj8UufWwut4E6HEghnkdMFI6P606EVjux8tN/NAY71zjHc
	 7LYBihJMeVUcAGJuHMWdP4Jadl6766jDqg15VyoyJoRhKWjlhdere0rgm2WHB6f3Jp
	 DfyPb24fXyI5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AD6360749;
	Thu,  1 Jan 2026 21:52:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC16119D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E73D40392
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIygLNIEA8qO for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B75FA4039C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B75FA4039C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9BA287E4C; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0c6af9e76270a744ce4ed79158f95d719f1da01
X-Git-Newrev: c0524d385543496a4aafdabb9bd7a37c038c04b9
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.A9BA287E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openlayers: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0524d385543496a4aafdabb9bd7a37c038c04b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                   |  6 ++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/openlayers/Config.in       | 11 -----------
 package/openlayers/openlayers.hash |  3 ---
 package/openlayers/openlayers.mk   | 22 ----------------------
 6 files changed, 6 insertions(+), 38 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 706f8b441f..d5f5e7b0f6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENLAYERS
+	bool "openlayers has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_JSZIP
 	bool "jszip has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 1fa34f8df6..2c8650d657 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3178,7 +3178,6 @@ F:	configs/pine64_star64_defconfig
 
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
-F:	package/openlayers/
 F:	package/vuejs/
 F:	package/vuejs-router/
 
diff --git a/package/Config.in b/package/Config.in
index a2a9f4a931..8e14ce6638 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1869,7 +1869,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/openlayers/Config.in"
 	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
diff --git a/package/openlayers/Config.in b/package/openlayers/Config.in
deleted file mode 100644
index a7b7f334cf..0000000000
--- a/package/openlayers/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_OPENLAYERS
-	bool "openlayers"
-	help
-	  OpenLayers makes it easy to put a dynamic map in any web
-	  page. It can display map tiles, vector data and markers
-	  loaded from any source. OpenLayers has been developed to
-	  further the use of geographic information of all kinds. It
-	  is completely free, Open Source JavaScript, released under
-	  the 2-clause BSD License (also known as the FreeBSD).
-
-	  https://openlayers.org
diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
deleted file mode 100644
index 50f4dbe849..0000000000
--- a/package/openlayers/openlayers.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  ff847580458b10c85dcb38699733368d67037f855fcb6a5fce46e6412737cf67  v10.5.0-package.zip
-sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
deleted file mode 100644
index e62ea35fd4..0000000000
--- a/package/openlayers/openlayers.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# openlayers
-#
-################################################################################
-
-OPENLAYERS_VERSION = 10.5.0
-OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
-OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
-OPENLAYERS_LICENSE = BSD-2-Clause
-OPENLAYERS_LICENSE_FILES = LICENSE.md
-
-define OPENLAYERS_EXTRACT_CMDS
-	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
-endef
-
-define OPENLAYERS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/ol.css $(TARGET_DIR)/var/www/ol.css
-	$(INSTALL) -D -m 0644 $(@D)/dist/ol.js $(TARGET_DIR)/var/www/ol.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
