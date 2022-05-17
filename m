Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F703C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E3CB41B4A;
	Tue, 17 May 2022 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zfv9gVy8jCeX; Tue, 17 May 2022 19:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1EB41B47;
	Tue, 17 May 2022 19:56:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0C11BF995
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B3A44038B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6ykyfrqIYnV for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52F5F400D6
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:56:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2DC2585F43; Tue, 17 May 2022 19:45:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 21:55:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ec4cb24717c59d17fd4965c546ecf762e1be890
X-Git-Newrev: dbaee8e4564392a6ad24807a0f0136a32c80ec9c
X-Patchwork-Hint: ignore
Message-Id: <20220517194505.2DC2585F43@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/qt5/qt5webengine-chromium-catapult: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbaee8e4564392a6ad24807a0f0136a32c80ec9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version of catapult is python3 compatible and will be used to
replace the python2 only version in qt5webengine-chromium.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in                                      |  1 +
 package/qt5/qt5webengine-chromium-catapult/Config.in       |  4 ++++
 .../qt5webengine-chromium-catapult.hash                    |  3 +++
 .../qt5webengine-chromium-catapult.mk                      | 14 ++++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index cbb2e06a21..f36baf9bd2 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -65,6 +65,7 @@ source "package/qt5/qt5wayland/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5webengine/Config.in"
+source "package/qt5/qt5webengine-chromium-catapult/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5webview/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
diff --git a/package/qt5/qt5webengine-chromium-catapult/Config.in b/package/qt5/qt5webengine-chromium-catapult/Config.in
new file mode 100644
index 0000000000..471c2a2dbc
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/Config.in
@@ -0,0 +1,4 @@
+# Not user-selectable, it is only needed to be copied
+# into the chromium source tree.
+config BR2_PACKAGE_QT5WEBENGINE_CHROMIUM_CATAPULT
+	bool
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
new file mode 100644
index 0000000000..8190a6dd5d
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br1.tar.gz
+sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
new file mode 100644
index 0000000000..5d0db1e790
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# qt5webengine-chromium-catapult
+#
+################################################################################
+
+QT5WEBENGINE_CHROMIUM_CATAPULT_VERSION = 5eedfe23148a234211ba477f76fc2ea2e8529189
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE = https://chromium.googlesource.com/catapult.git
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE_METHOD = git
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE = BSD-3-Clause
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE_FILES = LICENSE
+QT5WEBENGINE_CHROMIUM_CATAPULT_INSTALL_TARGET = NO
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
