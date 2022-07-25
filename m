Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 17:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB2F941945;
	Mon, 25 Jul 2022 17:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB2F941945
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4E76w27dESLZ; Mon, 25 Jul 2022 17:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E43541951;
	Mon, 25 Jul 2022 17:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E43541951
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 299F41BF396
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3D1E833D3
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D1E833D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12DQeTc-93cz for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 17:07:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0715D83192
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 17:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0715D83192
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 281F085D81; Mon, 25 Jul 2022 16:53:38 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 19:05:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 607491354f27fc9a4922a5f4b734190acf0b8274
X-Git-Newrev: 31a28d89066a82ef9d0b3c32cf48cdb01d35202f
X-Patchwork-Hint: ignore
Message-Id: <20220725165338.281F085D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vis-network: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=31a28d89066a82ef9d0b3c32cf48cdb01d35202f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[Arnout:
 - alphabetically order DEVELOPERS;
 - license is OR, not AND]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/vis-network/Config.in        |  7 +++++++
 package/vis-network/vis-network.hash |  4 ++++
 package/vis-network/vis-network.mk   | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a07ae100b..e4df6cfe41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1505,6 +1505,7 @@ F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/nginx-dav-ext/
+F:	package/vis-network/
 F:	package/vuejs/
 
 N:	John Stile <johns@msli.com>
diff --git a/package/Config.in b/package/Config.in
index bd3d167487..b663b225c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1688,6 +1688,7 @@ endif
 	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/popperjs/Config.in"
+	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
 comment "External Vue.js plugins"
diff --git a/package/vis-network/Config.in b/package/vis-network/Config.in
new file mode 100644
index 0000000000..39e8ac54c5
--- /dev/null
+++ b/package/vis-network/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_VIS_NETWORK
+	bool "vis-network"
+	help
+	  Display dynamic, automatically organised, customizable network
+	  views. Network uses HTML canvas for rendering.
+
+	  http://visjs.github.io/vis-network/
diff --git a/package/vis-network/vis-network.hash b/package/vis-network/vis-network.hash
new file mode 100644
index 0000000000..56f141f5f7
--- /dev/null
+++ b/package/vis-network/vis-network.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  a9f7325cbe28147318476c63f09c1d5c894d2239bfa4b4dd2dfb3dbebb0705d3  vis-network-9.1.0.tgz
+sha256  1509904280a272780fd69c04b858f512cf216f8e3464a0dd98d8f34416feced9  LICENSE-APACHE-2.0
+sha256  1f65085e54c036645082257618db2c7b787e68c3b02485e214ecd09e0834ee8f  LICENSE-MIT
diff --git a/package/vis-network/vis-network.mk b/package/vis-network/vis-network.mk
new file mode 100644
index 0000000000..4a8def37e0
--- /dev/null
+++ b/package/vis-network/vis-network.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# vis-network
+#
+################################################################################
+
+VIS_NETWORK_VERSION = 9.1.0
+VIS_NETWORK_SOURCE = vis-network-$(VIS_NETWORK_VERSION).tgz
+VIS_NETWORK_SITE = https://registry.npmjs.org/vis-network/-
+VIS_NETWORK_LICENSE = Apache-2.0 or MIT
+VIS_NETWORK_LICENSE_FILES = LICENSE-APACHE-2.0 LICENSE-MIT
+
+# Install .min.js and .min.css as .js and .css, respectively.
+define VIS_NETWORK_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/vis-network.min.js \
+		$(TARGET_DIR)/var/www/vis-network.js
+	$(INSTALL) -m 644 -D $(@D)/dist/dist/vis-network.min.css \
+		$(TARGET_DIR)/var/www/vis-network.css
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
