Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8610C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1791F70440;
	Fri, 28 Feb 2025 17:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HmbRFGttocm; Fri, 28 Feb 2025 17:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41DD70D04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41DD70D04;
	Fri, 28 Feb 2025 17:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E5B68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2276451C5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnTw6555y6Tv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C0F42588
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5C0F42588
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E006F86FED; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Feb 2025 22:17:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e9c0222bf41d8277469938a103ee97f6df72fb08
X-Git-Newrev: 59a8322ce8363289f880f41fce4667680189b18b
X-Patchwork-Hint: ignore
Message-Id: <20250228163040.E006F86FED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/angularjs: drop package
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
Content-Type: multipart/mixed; boundary="===============8917376585672119361=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8917376585672119361==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=59a8322ce8363289f880f41fce4667680189b18b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The package has not been updated since 2020, has known vulnerabilities and
the upstream Github project has been archived as of April 12, 2024 - So drop
the package.

For reference, AngularJS website [1] reads, at the time of
this commit:
"""
AngularJS support has officially ended as of January 2022.
See what ending support means [2] and read the end of life
announcement [3].
"""

[1] https://angularjs.org/
[2] https://docs.angularjs.org/misc/version-support-status
[3] https://goo.gle/angularjs-end-of-life

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add end-of-life announce and links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                 |  7 +++++++
 DEVELOPERS                       |  3 ---
 package/Config.in                |  1 -
 package/angularjs/Config.in      |  6 ------
 package/angularjs/angularjs.hash |  3 ---
 package/angularjs/angularjs.mk   | 29 -----------------------------
 6 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 037f9a8b89..f94a7db7b0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_ANGULARJS
+	bool "angularjs has been removed"
+	select BR2_LEGACY
+	help
+	  The angularjs package was removed as the upstream
+	  project has been archived.
+
 config BR2_PACKAGE_ANGULAR_WEBSOCKET
 	bool "angular-websocket has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 5f98257b86..4914acba0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1447,9 +1447,6 @@ F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
-N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
-F:	package/angularjs/
-
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
diff --git a/package/Config.in b/package/Config.in
index 5e2dc79cb5..6f79eafc4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1862,7 +1862,6 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
-	source "package/angularjs/Config.in"
 	source "package/bootstrap/Config.in"
 	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
deleted file mode 100644
index f0d2015a70..0000000000
--- a/package/angularjs/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_ANGULARJS
-	bool "angularjs"
-	help
-	  AngularJS web application framework.
-
-	  http://angularjs.org
diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
deleted file mode 100644
index 5468174e4d..0000000000
--- a/package/angularjs/angularjs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  471b57064031da8c5fd3b1ba3f52dd1e0d2740a97ed34da2e8ab2a4cc2718280  angular-1.8.2.zip
-sha256  237656fae6e39d02cd71cbcfbf91b7964eba5796aafca1bfcfff3b054ce3fed6  angular.js
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
deleted file mode 100644
index d393c82c19..0000000000
--- a/package/angularjs/angularjs.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# angularjs
-#
-################################################################################
-
-ANGULARJS_VERSION = 1.8.2
-ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
-ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
-ANGULARJS_LICENSE = MIT
-# There's no separate license file in the archive, so use angular.js instead.
-ANGULARJS_LICENSE_FILES = angular.js
-ANGULARJS_CPE_ID_VENDOR = angularjs
-ANGULARJS_CPE_ID_PRODUCT = angular.js
-
-define ANGULARJS_EXTRACT_CMDS
-	unzip $(ANGULARJS_DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
-	mv $(@D)/angular-$(ANGULARJS_VERSION)/* $(@D)
-	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
-endef
-
-# install .min.js as .js
-define ANGULARJS_INSTALL_TARGET_CMDS
-	$(foreach f,$(notdir $(wildcard $(@D)/*.min.js)),
-		$(INSTALL) -m 0644 -D $(@D)/$(f) \
-			$(TARGET_DIR)/var/www/$(f:.min.js=.js)$(sep))
-endef
-
-$(eval $(generic-package))

--===============8917376585672119361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8917376585672119361==--
