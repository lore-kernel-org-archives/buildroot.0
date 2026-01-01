Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BEBFA3723
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DF0360762;
	Thu,  1 Jan 2026 21:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEWtcPvHXes6; Thu,  1 Jan 2026 21:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F364C60686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304375;
	bh=YSlqy8dLgl2lJd8pMpFSMY/RcFfZG8fs6RHP8x34HzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kez4EkBgsLwdekezvaNOUIm6X8ySM+p1VTR52Du9xVbxJ4WJWXRUpYZsCaYwY4GU8
	 mfDqRYGhDY5bV5EaT4TSP+0CubAvi98x3Dwqhoirw+GkVQO8zhEcdWkFxpJNViqYUl
	 kPSplbkvRwmmBqRuJ19sBGKdN1eWRYKbXaRxosgiJQBTgKrQdtTOO3jSQ+VmwtGejE
	 OFBpu6g6CyImI4qa1IXioEPFyxcdmdo2H3jJnEkmyU7tBgX2Lwlmf9eHQnkzIiDEQp
	 wlaS4oIG1SqlMbtDs2G5XSWzVsdQ5U9C6xuB5Sz9jeTqmcZfzM36yL9KilsnWSolAU
	 YZ8JkwWy0GnBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F364C60686;
	Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C3A919D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7ABB80F1B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ld3wcVpCxzow for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD3F80F19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD3F80F19
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DE7E87E6F; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bca9164bd49d89de42a3963792ee3d860797268a
X-Git-Newrev: de970ee7838d775b1b85070a4078f3cb2c19feec
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.1DE7E87E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flot: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=de970ee7838d775b1b85070a4078f3cb2c19feec
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
 Config.in.legacy       |  6 ++++
 package/Config.in      |  1 -
 package/flot/Config.in | 97 --------------------------------------------------
 package/flot/flot.hash |  3 --
 package/flot/flot.mk   | 34 ------------------
 5 files changed, 6 insertions(+), 135 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 35604b87fe..ddd837389a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_FLOT
+	bool "flot has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_EXPLORERCANVAS
 	bool "explorercanvas has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 37c04685fa..97552c6b79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1868,7 +1868,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/flot/Config.in"
 	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
diff --git a/package/flot/Config.in b/package/flot/Config.in
deleted file mode 100644
index 404487202c..0000000000
--- a/package/flot/Config.in
+++ /dev/null
@@ -1,97 +0,0 @@
-config BR2_PACKAGE_FLOT
-	bool "flot"
-	select BR2_PACKAGE_JQUERY
-	help
-	  Flot is a pure Javascript plotting library for jQuery. It
-	  produces graphical plots of arbitrary datasets on-the-fly
-	  client-side.
-
-	  The focus is on simple usage (all settings are optional),
-	  attractive looks and interactive features like zooming and
-	  mouse tracking.
-
-	  The plugin works with Internet Explorer 6+, Firefox 2.x+,
-	  Safari 3.0+, Opera 9.5+ and Konqueror 4.x+ with the HTML
-	  canvas tag.
-
-	  http://www.flotcharts.org/
-
-if BR2_PACKAGE_FLOT
-
-comment "flot plugins"
-
-config BR2_PACKAGE_FLOT_CANVAS
-	bool "canvas"
-	help
-	  Flot plugin to render axis tick labels directly to the canvas
-
-config BR2_PACKAGE_FLOT_CATEGORIES
-	bool "categories"
-	help
-	  Flot plugin for plotting textual data or categories
-
-config BR2_PACKAGE_FLOT_CROSSHAIR
-	bool "crosshair"
-	help
-	  Flot plugin for showing crosshairs when the mouse hovers
-	  over the plot
-
-config BR2_PACKAGE_FLOT_ERRORBARS
-	bool "errorbars"
-	help
-	  Flot plugin for plotting error bars
-
-config BR2_PACKAGE_FLOT_FILLBETWEEN
-	bool "fillbetween"
-	help
-	  Flot plugin for computing bottoms for filled line and bar
-	  charts
-
-config BR2_PACKAGE_FLOT_IMAGE
-	bool "image"
-	help
-	  Flot plugin for plotting images
-
-config BR2_PACKAGE_FLOT_NAVIGATE
-	bool "navigate"
-	help
-	  Flot plugin for adding panning and zooming capabilities to a
-	  plot
-
-config BR2_PACKAGE_FLOT_PIE
-	bool "pie"
-	help
-	  Flot plugin for rendering pie charts
-
-config BR2_PACKAGE_FLOT_RESIZE
-	bool "resize"
-	help
-	  Flot plugin for automatically redrawing plots when the
-	  placeholder size changes.
-
-config BR2_PACKAGE_FLOT_SELECTION
-	bool "selection"
-	help
-	  Flot plugin for selecting regions
-
-config BR2_PACKAGE_FLOT_STACK
-	bool "stack"
-	help
-	  Flot plugin for stacking data sets
-
-config BR2_PACKAGE_FLOT_SYMBOL
-	bool "symbol"
-	help
-	  Flot plugin that adds some extra symbols for plotting points
-
-config BR2_PACKAGE_FLOT_THRESHOLD
-	bool "threshold"
-	help
-	  Flot plugin for thresholding data
-
-config BR2_PACKAGE_FLOT_TIME
-	bool "time"
-	help
-	  Flot plugin for handling time axes
-
-endif
diff --git a/package/flot/flot.hash b/package/flot/flot.hash
deleted file mode 100644
index fb7a331975..0000000000
--- a/package/flot/flot.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21  flot-0.8.3.tar.gz
-sha256  52cb566b16d84314b92b91361ed072eaaf166e8d3dfa3d0fd3577613925f205c  LICENSE.txt
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
deleted file mode 100644
index 58e3ff1276..0000000000
--- a/package/flot/flot.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# flot
-#
-################################################################################
-
-FLOT_VERSION = 0.8.3
-FLOT_SITE = http://www.flotcharts.org/downloads
-FLOT_LICENSE = MIT
-FLOT_LICENSE_FILES = LICENSE.txt
-FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
-	$(if $(BR2_PACKAGE_FLOT_CANVAS),canvas) \
-	$(if $(BR2_PACKAGE_FLOT_CATEGORIES),categories) \
-	$(if $(BR2_PACKAGE_FLOT_CROSSHAIR),crosshair) \
-	$(if $(BR2_PACKAGE_FLOT_ERRORBARS),errorbars) \
-	$(if $(BR2_PACKAGE_FLOT_FILLBETWEEN),fillbetween) \
-	$(if $(BR2_PACKAGE_FLOT_IMAGE),image) \
-	$(if $(BR2_PACKAGE_FLOT_NAVIGATE),navigate) \
-	$(if $(BR2_PACKAGE_FLOT_PIE),pie) \
-	$(if $(BR2_PACKAGE_FLOT_RESIZE),resize) \
-	$(if $(BR2_PACKAGE_FLOT_SELECTION),selection) \
-	$(if $(BR2_PACKAGE_FLOT_STACK),stack) \
-	$(if $(BR2_PACKAGE_FLOT_SYMBOL),symbol) \
-	$(if $(BR2_PACKAGE_FLOT_THRESHOLD),threshold) \
-	$(if $(BR2_PACKAGE_FLOT_TIME),time) \
-	)
-
-define FLOT_INSTALL_TARGET_CMDS
-	for i in $(FLOT_FILES); do \
-		$(INSTALL) -m 0644 -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js || exit 1; \
-	done
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
