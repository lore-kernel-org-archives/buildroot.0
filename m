Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B751FA3723
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60DF24051F;
	Thu,  1 Jan 2026 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diXysKHB_sPM; Thu,  1 Jan 2026 21:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CFFD4073B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304387;
	bh=kfOVlIQata0VJtnoNRkF/TwUbWqhnNNGXlq/y+1Sxu0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A1z4RtoA2OYCMvsuLl2aUV+/69vYbRX0tWt7D+gxzjoUy8YvNZHx1cOkkW7n3JziB
	 nbIpNj5vCPamm76k01itdoSvfUYdioU4CCyODnDYe4LB7iww0BdrygqCR9zKiQYbOj
	 tjUhCR74DpgKtwnku5l0DZ2Z7++tCsBxNA0U9wKkDt75fEcmFAJvA/CKFgD3WSJPWs
	 GSIbbaD4kHarnt2sB3Z3RAdwZYtkq1pclhD5HO9u2ZW346w6VfVAJUuoELwhOUrmy7
	 XIHjXiiZLWVjpGaO4y1vnQL2ioNt43P3fd/GWSiBUCxwNxw2fCBbiPsBmyqJa8WN0P
	 r5tv7PQ1ndA3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CFFD4073B;
	Thu,  1 Jan 2026 21:53:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E30619D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D95D86071C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zn7gMpn3-FXY for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A5760718
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4A5760718
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2FE887E4C; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7865718235f9bbe4c52f26a547327f04b4153db
X-Git-Newrev: 2cb1c572285297f1d6ea71828c39250a4240ca37
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.D2FE887E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cb1c572285297f1d6ea71828c39250a4240ca37
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
 Config.in.legacy                       | 12 ++++++++++++
 DEVELOPERS                             |  3 ---
 package/Config.in                      |  5 -----
 package/vuejs-router/Config.in         |  6 ------
 package/vuejs-router/vuejs-router.hash |  3 ---
 package/vuejs-router/vuejs-router.mk   | 19 -------------------
 package/vuejs/Config.in                |  6 ------
 package/vuejs/vuejs.hash               |  3 ---
 package/vuejs/vuejs.mk                 | 19 -------------------
 9 files changed, 12 insertions(+), 64 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b12fa51cb2..ebfbf5e0a3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_VUEJS_ROUTER
+	bool "vuejs-router has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_VUEJS
+	bool "vuejs has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_VIS_NETWORK
 	bool "vis-network has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8a7db1b921..a06ebe73e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1713,7 +1713,6 @@ F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
 F:	package/erlang-xmpp/
 F:	package/nginx-dav-ext/
-F:	package/vuejs/
 
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
@@ -3177,8 +3176,6 @@ F:	configs/pine64_star64_defconfig
 
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
-F:	package/vuejs/
-F:	package/vuejs-router/
 
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
diff --git a/package/Config.in b/package/Config.in
index 0620ce1602..5ade9c4614 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1869,11 +1869,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/vuejs/Config.in"
-if BR2_PACKAGE_VUEJS
-comment "External Vue.js plugins"
-	source "package/vuejs-router/Config.in"
-endif
 endmenu
 
 menu "JSON/XML"
diff --git a/package/vuejs-router/Config.in b/package/vuejs-router/Config.in
deleted file mode 100644
index ac79b3ea61..0000000000
--- a/package/vuejs-router/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_VUEJS_ROUTER
-	bool "vuejs-router"
-	help
-	  The official router for Vue.js.
-
-	  http://router.vuejs.org
diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
deleted file mode 100644
index 299ca61649..0000000000
--- a/package/vuejs-router/vuejs-router.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  093fee5133cf82e75d25940d86f58a4e3f194b74262205ff5c1926aed53339c4  vue-router-4.5.1.tgz
-sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
deleted file mode 100644
index a6d9df6dc2..0000000000
--- a/package/vuejs-router/vuejs-router.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# vuejs-router
-#
-################################################################################
-
-VUEJS_ROUTER_VERSION = 4.5.1
-VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
-VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
-VUEJS_ROUTER_LICENSE = MIT
-VUEJS_ROUTER_LICENSE_FILES = LICENSE
-
-# Install .prod.js as .js
-define VUEJS_ROUTER_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vue-router.global.prod.js \
-		$(TARGET_DIR)/var/www/vue-router.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/vuejs/Config.in b/package/vuejs/Config.in
deleted file mode 100644
index 6456d288f9..0000000000
--- a/package/vuejs/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_VUEJS
-	bool "vuejs"
-	help
-	  VueJS web application framework.
-
-	  http://vuejs.org
diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
deleted file mode 100644
index 894eaa4874..0000000000
--- a/package/vuejs/vuejs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  afddbe7bb09a00bb23e738c2a5354819bf662955fd4a06abc630a3d1acc41a8b  vue-3.5.16.tgz
-sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
deleted file mode 100644
index 8f5c002548..0000000000
--- a/package/vuejs/vuejs.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# vuejs
-#
-################################################################################
-
-VUEJS_VERSION = 3.5.16
-VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
-VUEJS_SITE = https://registry.npmjs.org/vue/-
-VUEJS_LICENSE = MIT
-VUEJS_LICENSE_FILES = LICENSE
-
-# Install .prod.js as .js
-define VUEJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vue.global.prod.js \
-		$(TARGET_DIR)/var/www/vue.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
