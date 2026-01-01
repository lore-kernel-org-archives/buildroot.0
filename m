Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1586DFA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D43F8607BA;
	Thu,  1 Jan 2026 21:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tq4IqC21viLN; Thu,  1 Jan 2026 21:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA09C608D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304381;
	bh=huSiYUKc4+QmJEtl0+YxIV0EU8jzKCii3vG9xKoTye8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EUybLSVBpqVtApxmT4EboV1qXStYqNFK/7W7SoDWuUIkzMZbD+ynpYmoAWWG8Ynkh
	 jh2ll/r9rowWxtaQ0dXtucODM6i5GBt7b9qpDW3BAmIVFY5FT3+IQpEGkHuQl2FbTw
	 XfmiHargHroPGoK2BqIPWvxgZ86OIwrXbMJu90DngxZ2GjdlDxLaHgRKhLE/YAaxw3
	 sMtVUOET54Jkk2o9O6yHmRohniandDeKCzaMZcB2vqWvlRyrLIqahALEPVH9YK0yqu
	 rQpgppec/we/yLlroVN0L+Gm+oBK9+YqDvbpGfdyX43GLvpJ/sk6/J5Uf3fd452blu
	 oYS+QlAfwgxtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA09C608D0;
	Thu,  1 Jan 2026 21:53:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9641419D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 527634051F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpRSvpxQ-_RU for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7753440523
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7753440523
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 685CD87E4C; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2865d87995bd3d0141fcd46fa20cc74e29fadcd0
X-Git-Newrev: e5c61cd11e894099d8342709d08cba4cfd1b2ad5
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.685CD87E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-javascript: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5c61cd11e894099d8342709d08cba4cfd1b2ad5
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
 Config.in.legacy                             |  6 ++++++
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/json-javascript/Config.in            |  6 ------
 package/json-javascript/json-javascript.hash |  3 ---
 package/json-javascript/json-javascript.mk   | 16 ----------------
 6 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 111a5855b1..b13d4bdad7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_JSON_JAVASCRIPT
+	bool "json-javascript has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_JQUERY_VALIDATION
 	bool "jquery-validation has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index ff83da022a..1fa34f8df6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3052,7 +3052,6 @@ F:	package/czmq/
 F:	package/filemq/
 F:	package/googlefontdirectory/
 F:	package/jansson/
-F:	package/json-javascript/
 F:	package/lcdapi/
 F:	package/libfreefare/
 F:	package/libjson/
diff --git a/package/Config.in b/package/Config.in
index 823259ef78..a15df179e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1869,7 +1869,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/json-javascript/Config.in"
 	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/vis-network/Config.in"
diff --git a/package/json-javascript/Config.in b/package/json-javascript/Config.in
deleted file mode 100644
index 501c54f3d1..0000000000
--- a/package/json-javascript/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_JSON_JAVASCRIPT
-	bool "json-javascript"
-	help
-	  JSON in JavaScript
-
-	  https://github.com/douglascrockford/JSON-js/
diff --git a/package/json-javascript/json-javascript.hash b/package/json-javascript/json-javascript.hash
deleted file mode 100644
index 9522fee9ea..0000000000
--- a/package/json-javascript/json-javascript.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  1a9dd4429e4bb4929dcb438f9591a3625bc8cc161f840b5f843d8b1d2c8dcfe5  json-javascript-3d7767b6b1f3da363c625ff54e63bbf20e9e83ac.tar.gz
-sha256  925947d3d711c4441a9db20f51215fbf5c119d2a3b51cadb2c9031907d8014b5  json2.js
diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
deleted file mode 100644
index c15b5319b3..0000000000
--- a/package/json-javascript/json-javascript.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# json-javascript
-#
-################################################################################
-
-JSON_JAVASCRIPT_VERSION = 3d7767b6b1f3da363c625ff54e63bbf20e9e83ac
-JSON_JAVASCRIPT_SITE = $(call github,douglascrockford,JSON-js,$(JSON_JAVASCRIPT_VERSION))
-JSON_JAVASCRIPT_LICENSE = Public Domain
-JSON_JAVASCRIPT_LICENSE_FILES = json2.js
-
-define JSON_JAVASCRIPT_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/json2.js $(TARGET_DIR)/var/www/json2.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
