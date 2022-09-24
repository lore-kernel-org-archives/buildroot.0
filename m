Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98AFC07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 14:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B2A084089;
	Sat, 24 Sep 2022 14:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B2A084089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWzLWpq9SHX9; Sat, 24 Sep 2022 14:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AD4B84078;
	Sat, 24 Sep 2022 14:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD4B84078
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13FC71BF325
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E225660BF6
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E225660BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9LMc22urIee for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 14:56:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD4A60BBF
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 14:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD4A60BBF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E99FD84EDC; Sat, 24 Sep 2022 14:56:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 16:55:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02fe7c747bfff95c0e4da215980a0dfc25699fde
X-Git-Newrev: d1938358ec119869a63af7622391f6a8de1fbb16
X-Patchwork-Hint: ignore
Message-Id: <20220924145602.E99FD84EDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/forge: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1938358ec119869a63af7622391f6a8de1fbb16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A native implementation of TLS (and various other cryptographic tools)
in JavaScript.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[Thomas: switch to pre-compiled JS files instead of depending on
host-nodejs]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/forge/Config.in  |  7 +++++++
 package/forge/forge.hash |  3 +++
 package/forge/forge.mk   | 23 +++++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a760a9b9a..51d025173a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1552,6 +1552,7 @@ F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
+F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vis-network/
 F:	package/vuejs/
diff --git a/package/Config.in b/package/Config.in
index 360a1645c9..e3a34d6e97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1690,6 +1690,7 @@ endif
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
+	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
 menu "External jQuery plugins"
diff --git a/package/forge/Config.in b/package/forge/Config.in
new file mode 100644
index 0000000000..86d4832101
--- /dev/null
+++ b/package/forge/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FORGE
+	bool "forge"
+	help
+	  A native implementation of TLS (and various other
+	  cryptographic tools) in JavaScript.
+
+	  https://github.com/digitalbazaar/forge
diff --git a/package/forge/forge.hash b/package/forge/forge.hash
new file mode 100644
index 0000000000..36e92be743
--- /dev/null
+++ b/package/forge/forge.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  77de03720cd00fafdbcda47e3e995a1f548f2e9028d11a98b0d9bef37ec2ad85  node-forge-1.3.1.tgz
+sha256  f63ff0e4e239244aa79280da2dd4811a0469e5e201caf5cbc0d97c3a1dff8e82  LICENSE
diff --git a/package/forge/forge.mk b/package/forge/forge.mk
new file mode 100644
index 0000000000..9a811b4929
--- /dev/null
+++ b/package/forge/forge.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# forge
+#
+################################################################################
+
+FORGE_VERSION = 1.3.1
+FORGE_SITE = https://registry.npmjs.org/node-forge/-
+FORGE_SOURCE = node-forge-$(FORGE_VERSION).tgz
+FORGE_LICENSE = BSD-3-Clause, GPL-2.0, vendored dependencies licenses probably not listed
+FORGE_LICENSE_FILES = LICENSE
+
+# Install .min.js as .js
+define FORGE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/forge.all.min.js \
+		$(TARGET_DIR)/var/www/forge.all.js
+	$(INSTALL) -m 644 -D $(@D)/dist/forge.min.js \
+		$(TARGET_DIR)/var/www/forge.js
+	$(INSTALL) -m 644 -D $(@D)/dist/prime.worker.min.js \
+		$(TARGET_DIR)/var/www/prime.worker.js
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
