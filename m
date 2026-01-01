Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D1FEEE25C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DE581099;
	Thu,  1 Jan 2026 21:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnN2AMFk4niW; Thu,  1 Jan 2026 21:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3986D81065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304386;
	bh=arH5pzl/LZ0WN/Avai/bKUc8AeamFwcEnVSxkjzUgAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lr6gAaJGCjOWpKDLlBYdzZvopFA2c62G0S8gdFdmV60rQfW/HL5HwXZJO01mOFvg5
	 87o8wiy5nfFrBc+QUd3ZHmqjEHvnq5UDo2sL3w2hnsOLXObGxIWKQ3eX2KUXq+xdzK
	 jrHL2aZFgz3j3xo9UhemN8zykUF5EN2oCyGDN6tKCvnO/+1r0z50kbi5aVpjPKX7Ue
	 3Zs/0aONqPKjtcy6p+HVsT6lq/4nW+4YNeWXVUVPj3kZaD2/ZzNbHsAZFc2weP3w0f
	 1hGsMzY4RLa9sLBn8EEviP6cgNW+LNYJhLfqrhhrl3DOW6MZaW6wvkADxOH2FmM6d+
	 Gvi5zEarejcaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3986D81065;
	Thu,  1 Jan 2026 21:53:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA99119D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2BDB60686
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsTTxqJtglRD for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB106071C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB106071C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E940487E6F; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cb1c572285297f1d6ea71828c39250a4240ca37
X-Git-Newrev: 9038a4e06dfe3e3b6f35d31324b973111fe39b26
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.E940487E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jsmin: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9038a4e06dfe3e3b6f35d31324b973111fe39b26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is no longer maintained and better alternative to minify
JavaScript exists since.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             | 14 ++++++++++++++
 package/Config.in            |  1 -
 package/Config.in.host       |  1 -
 package/jsmin/Config.in      | 11 -----------
 package/jsmin/Config.in.host | 11 -----------
 package/jsmin/jsmin.hash     |  3 ---
 package/jsmin/jsmin.mk       | 29 -----------------------------
 7 files changed, 14 insertions(+), 56 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ebfbf5e0a3..ce7a475838 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_HOST_JSMIN
+	bool "host-jsmin has been removed"
+	select BR2_LEGACY
+	help
+	  JSMin is no longer maintained and better alternative
+	  exists since then.
+
+config BR2_PACKAGE_JSMIN
+	bool "jsmin has been removed"
+	select BR2_LEGACY
+	help
+	  JSMin is no longer maintained and better alternative
+	  exists since then.
+
 config BR2_PACKAGE_VUEJS_ROUTER
 	bool "vuejs-router has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5ade9c4614..643072b71e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1868,7 +1868,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/jsmin/Config.in"
 endmenu
 
 menu "JSON/XML"
diff --git a/package/Config.in.host b/package/Config.in.host
index 6357eec265..1c5ab506f5 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,7 +57,6 @@ menu "Host utilities"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
-	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
 	source "package/llvm-project/lld/Config.in.host"
diff --git a/package/jsmin/Config.in b/package/jsmin/Config.in
deleted file mode 100644
index d0948b8914..0000000000
--- a/package/jsmin/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_JSMIN
-	bool "jsmin"
-	help
-	  JSMin is a filter which removes comments and unnecessary
-	  whitespace from JavaScript files. It typically reduces
-	  filesize by half, resulting in faster downloads. It also
-	  encourages a more expressive programming style because it
-	  eliminates the download cost of clean, literate
-	  self-documentation.
-
-	  http://www.crockford.com/javascript/jsmin.html
diff --git a/package/jsmin/Config.in.host b/package/jsmin/Config.in.host
deleted file mode 100644
index 25ec9bb859..0000000000
--- a/package/jsmin/Config.in.host
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_HOST_JSMIN
-	bool "host jsmin"
-	help
-	  JSMin is a filter which removes comments and unnecessary
-	  whitespace from JavaScript files. It typically reduces
-	  filesize by half, resulting in faster downloads. It also
-	  encourages a more expressive programming style because it
-	  eliminates the download cost of clean, literate
-	  self-documentation.
-
-	  http://www.crockford.com/javascript/jsmin.html
diff --git a/package/jsmin/jsmin.hash b/package/jsmin/jsmin.hash
deleted file mode 100644
index cc4490557b..0000000000
--- a/package/jsmin/jsmin.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  aae127bf7291a7b2592f36599e5ed6c6423eac7abe0cd5992f82d6d46fe9ed2d  jsmin-1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b.tar.gz
-sha256  b420f61778af09534adc836a5086f5625b8499124051c50baefa218e7c03a58c  jsmin.c
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
deleted file mode 100644
index 84c39a7b42..0000000000
--- a/package/jsmin/jsmin.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# jsmin
-#
-################################################################################
-
-JSMIN_VERSION = 1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b
-JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
-JSMIN_LICENSE = MIT
-JSMIN_LICENSE_FILES = jsmin.c
-
-define JSMIN_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
-endef
-
-define JSMIN_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/jsmin $(TARGET_DIR)/usr/bin/jsmin
-endef
-
-define HOST_JSMIN_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
-endef
-
-define HOST_JSMIN_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/bin/jsmin
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
