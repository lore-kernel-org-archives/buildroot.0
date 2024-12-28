Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C5EE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DC4608FE;
	Sat, 28 Dec 2024 22:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMwnvE1f5Wpa; Sat, 28 Dec 2024 22:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A8C608FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A8C608FA;
	Sat, 28 Dec 2024 22:32:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 416B3CA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21ED740975
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TTUUV2qC0BX for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 133E44045A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 133E44045A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1AA98738F; Sat, 28 Dec 2024 22:32:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 22:08:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 164053732ed432215fa8352521f6767518492622
X-Git-Newrev: 3eaccb3eb1a2b07e40b26c44492dc0294107ced1
X-Patchwork-Hint: ignore
Message-Id: <20241228223234.F1AA98738F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6quicktimeline: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3eaccb3eb1a2b07e40b26c44492dc0294107ced1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in                              |  1 +
 package/qt6/qt6quicktimeline/Config.in             |  7 ++++++
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash |  5 +++++
 package/qt6/qt6quicktimeline/qt6quicktimeline.mk   | 26 ++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index c5a1a702d3..b1616495a6 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -50,6 +50,7 @@ source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
diff --git a/package/qt6/qt6quicktimeline/Config.in b/package/qt6/qt6quicktimeline/Config.in
new file mode 100644
index 0000000000..4dcf0e1452
--- /dev/null
+++ b/package/qt6/qt6quicktimeline/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT6QUICKTIMELINE
+	bool "qt6quicktimeline"
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
+	help
+	  This package corresponds to the Qt Quick Timeline module:
+
+	  https://doc.qt.io/qt-6/qtquicktimeline-index.html
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
new file mode 100644
index 0000000000..b042b4e2f8
--- /dev/null
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
+sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.mk b/package/qt6/qt6quicktimeline/qt6quicktimeline.mk
new file mode 100644
index 0000000000..18544a5a2b
--- /dev/null
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# qt6quicktimeline
+#
+################################################################################
+
+QT6QUICKTIMELINE_VERSION = $(QT6_VERSION)
+QT6QUICKTIMELINE_SITE = $(QT6_SITE)
+QT6QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6QUICKTIMELINE_VERSION).tar.xz
+QT6QUICKTIMELINE_INSTALL_STAGING = YES
+QT6QUICKTIMELINE_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6QUICKTIMELINE_CMAKE_BACKEND = ninja
+QT6QUICKTIMELINE_LICENSE = GPL-3.0
+QT6QUICKTIMELINE_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
+
+QT6QUICKTIMELINE_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6QUICKTIMELINE_DEPENDENCIES = \
+	qt6base \
+	qt6declarative
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
