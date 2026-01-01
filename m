Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD0EEE25C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180C581087;
	Thu,  1 Jan 2026 21:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fyd4baH-KjTj; Thu,  1 Jan 2026 21:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE48E81004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304383;
	bh=jYMkh4JW8vdGm36JFJsYvoDfTMcOJKrYEU/xa/sfxnc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O1Y8aO8n32OTrhTjhYFCFwc8yNuMJY39BnmpfZwV4GgBvC66bmOMnmr0sZk6nzAPr
	 tZsJtoxdKqNeCvzMXhdRkKof7HUKA7VoDFKlsamQA2ZQ88jB6JqeX2QgsmfQD5iYL8
	 nVJf+5pkbLW4QYKtzduGlODm51HCYDSsslwGOit8ZEIa64b7fB+oN384MTrOlLiSFj
	 y+YflesQDoJAK/vTQTzHtRjCNPXcBEdHy4kYTwtXqf9YqcMAdF7av/NxFdCccfSIRk
	 o1fTzEVboGwK+kPEIFnzij/GqmivNfVcX5SCxd4bzAqhxKtXGfmmNKnksP5lV9W8/z
	 jN5ydc6ygNG/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE48E81004;
	Thu,  1 Jan 2026 21:53:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E866C19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9B48606F7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1P18wMZf8JC for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA2660718
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DA2660718
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B9B3877AD; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87be409ee122bf632d3b54c334cd24adc7413ada
X-Git-Newrev: bca9164bd49d89de42a3963792ee3d860797268a
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.0B9B3877AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/explorercanvas: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=bca9164bd49d89de42a3963792ee3d860797268a
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
 Config.in.legacy                           |  6 ++++++
 package/Config.in                          |  1 -
 package/explorercanvas/Config.in           | 10 ----------
 package/explorercanvas/explorercanvas.hash |  3 ---
 package/explorercanvas/explorercanvas.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5b69ba6f3c..35604b87fe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_EXPLORERCANVAS
+	bool "explorercanvas has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_DATATABLES_RESPONSIVE
 	bool "datatables-responsive has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bc6b724f8b..37c04685fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1868,7 +1868,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
diff --git a/package/explorercanvas/Config.in b/package/explorercanvas/Config.in
deleted file mode 100644
index 9714a580ce..0000000000
--- a/package/explorercanvas/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_EXPLORERCANVAS
-	bool "explorercanvas"
-	help
-	  Modern browsers like Firefox, Safari, Chrome and Opera
-	  support the HTML5 canvas tag to allow 2D command-based
-	  drawing. ExplorerCanvas brings the same functionality to
-	  Internet Explorer (<v9). To use, web developers only need to
-	  include a single script tag in their existing web pages.
-
-	  http://excanvas.sf.net/
diff --git a/package/explorercanvas/explorercanvas.hash b/package/explorercanvas/explorercanvas.hash
deleted file mode 100644
index e47367a21a..0000000000
--- a/package/explorercanvas/explorercanvas.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  7b8f597b5d3a2f71e87aac413e12e03d852df3dd3ac39f70e1615c9c850217ec  explorercanvas-aa989ea9d9bac748638f7c66b0fc88e619715da6.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
deleted file mode 100644
index 57ebfcf13c..0000000000
--- a/package/explorercanvas/explorercanvas.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# explorercanvas
-#
-################################################################################
-
-EXPLORERCANVAS_VERSION = aa989ea9d9bac748638f7c66b0fc88e619715da6
-EXPLORERCANVAS_SITE = $(call github,arv,ExplorerCanvas,$(EXPLORERCANVAS_VERSION))
-EXPLORERCANVAS_LICENSE = Apache-2.0
-EXPLORERCANVAS_LICENSE_FILES = COPYING
-
-define EXPLORERCANVAS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/excanvas.js $(TARGET_DIR)/var/www/excanvas.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
