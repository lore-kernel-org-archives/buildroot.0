Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B3AC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9606384D4F;
	Fri, 28 Feb 2025 17:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khfx88GrJuXw; Fri, 28 Feb 2025 17:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A08B85DA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A08B85DA2;
	Fri, 28 Feb 2025 17:18:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 066CD1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A30EC45790
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87zBs73lTorq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB24C45BC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB24C45BC3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6D798285C; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Feb 2025 22:13:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b5ff38782cf8f1dbc1fd9585f49affdfb14833e8
X-Git-Newrev: e9c0222bf41d8277469938a103ee97f6df72fb08
X-Patchwork-Hint: ignore
Message-Id: <20250228163040.C6D798285C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/angular-websocket:
 drop package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9c0222bf41d8277469938a103ee97f6df72fb08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The package has not been updated since it was added in 2016 and the upstream
Github project has been archived as of Feb 17, 2024 - So drop the package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                 |  7 +++++++
 package/Config.in                                |  5 -----
 package/angular-websocket/Config.in              |  7 -------
 package/angular-websocket/angular-websocket.hash |  3 ---
 package/angular-websocket/angular-websocket.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c302b73423..037f9a8b89 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_ANGULAR_WEBSOCKET
+	bool "angular-websocket has been removed"
+	select BR2_LEGACY
+	help
+	  The angular-websocket package was removed as the upstream
+	  project has been archived.
+
 config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index dac1fc568d..5e2dc79cb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1863,11 +1863,6 @@ endmenu
 
 menu "Javascript"
 	source "package/angularjs/Config.in"
-if BR2_PACKAGE_ANGULARJS
-menu "External AngularJS plugins"
-	source "package/angular-websocket/Config.in"
-endmenu
-endif
 	source "package/bootstrap/Config.in"
 	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
diff --git a/package/angular-websocket/Config.in b/package/angular-websocket/Config.in
deleted file mode 100644
index 0981bd0d52..0000000000
--- a/package/angular-websocket/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_ANGULAR_WEBSOCKET
-	bool "angular-websocket"
-	help
-	  An AngularJS WebSocket service for connecting client
-	  applications to servers.
-
-	  https://github.com/AngularClass/angular-websocket
diff --git a/package/angular-websocket/angular-websocket.hash b/package/angular-websocket/angular-websocket.hash
deleted file mode 100644
index 3aa5b5e7e1..0000000000
--- a/package/angular-websocket/angular-websocket.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  69d752896bc17c08750a2fda24b5eb3c6d653afc6f406dd90a6b7c920b22a14a  angular-websocket-2.0.0.tar.gz
-sha256  3013a57f2c8df37775804b8be5b107665a2ca209607bb92c618bcc084feb00a7  LICENSE
diff --git a/package/angular-websocket/angular-websocket.mk b/package/angular-websocket/angular-websocket.mk
deleted file mode 100644
index d45bfdf910..0000000000
--- a/package/angular-websocket/angular-websocket.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# angular-websocket
-#
-################################################################################
-
-ANGULAR_WEBSOCKET_VERSION = 2.0.0
-ANGULAR_WEBSOCKET_SITE = $(call github,AngularClass,angular-websocket,v$(ANGULAR_WEBSOCKET_VERSION))
-ANGULAR_WEBSOCKET_LICENSE = MIT
-ANGULAR_WEBSOCKET_LICENSE_FILES = LICENSE
-
-# install .min.js as .js
-define ANGULAR_WEBSOCKET_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/angular-websocket.min.js \
-		$(TARGET_DIR)/var/www/angular-websocket.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
