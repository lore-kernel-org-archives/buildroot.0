Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E67C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77D2D4F2EC;
	Fri, 28 Feb 2025 16:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ndbzDm4Z-PM; Fri, 28 Feb 2025 16:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF67C4154B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF67C4154B;
	Fri, 28 Feb 2025 16:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24BF0711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E7F42DBE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IitCBBUk5mdN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 873A2424D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 873A2424D2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8202C83D12; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 23:32:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 36925cb53d9e13d63089c84cc027b08c79a1f8e9
X-Git-Newrev: ffe409140b141cc500e269ef3640e9fdc7475723
X-Patchwork-Hint: ignore
Message-Id: <20250228162950.8202C83D12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6graphs: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffe409140b141cc500e269ef3640e9fdc7475723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in                |  1 +
 package/qt6/qt6graphs/Config.in      |  8 ++++++++
 package/qt6/qt6graphs/qt6graphs.hash |  5 +++++
 package/qt6/qt6graphs/qt6graphs.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 2a5f5a4511..80c417809d 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
+source "package/qt6/qt6graphs/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6opcua/Config.in"
diff --git a/package/qt6/qt6graphs/Config.in b/package/qt6/qt6graphs/Config.in
new file mode 100644
index 0000000000..a99f25d6de
--- /dev/null
+++ b/package/qt6/qt6graphs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6GRAPHS
+	bool "qt6graphs"
+	select BR2_PACKAGE_QT6DECLARATIVE
+	select BR2_PACKAGE_QT6QUICK3D
+	help
+	  This package corresponds to the Qt Graphs module:
+
+	  https://doc.qt.io/qt-6/qtgraphs-index.html
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
new file mode 100644
index 0000000000..59d35d9e66
--- /dev/null
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
+sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.mk b/package/qt6/qt6graphs/qt6graphs.mk
new file mode 100644
index 0000000000..488d5acde2
--- /dev/null
+++ b/package/qt6/qt6graphs/qt6graphs.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# qt6graphs
+#
+################################################################################
+
+QT6GRAPHS_VERSION = $(QT6_VERSION)
+QT6GRAPHS_SITE = $(QT6_SITE)
+QT6GRAPHS_SOURCE = qtgraphs-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRAPHS_VERSION).tar.xz
+QT6GRAPHS_INSTALL_STAGING = YES
+QT6GRAPHS_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6GRAPHS_CMAKE_BACKEND = ninja
+QT6GRAPHS_LICENSE = GPL-3.0
+QT6GRAPHS_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
+
+QT6GRAPHS_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6GRAPHS_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	qt6quick3d
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
