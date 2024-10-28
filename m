Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DA3D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB65881140;
	Mon, 28 Oct 2024 21:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93DVkdaIULBx; Mon, 28 Oct 2024 21:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A80CC8113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80CC8113D;
	Mon, 28 Oct 2024 21:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3E2C4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B259D80E15
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKI0z8PQaMDt for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C41678113D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C41678113D
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1116845F9; Mon, 28 Oct 2024 21:43:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:40:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e634be8906bd64d6a9de1768204d0f03d8d8357a
X-Git-Newrev: 51948983aaad8b430aa817a4d66b62062158c4de
X-Patchwork-Hint: ignore
Message-Id: <20241028214300.B1116845F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6charts: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=51948983aaad8b430aa817a4d66b62062158c4de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Qt 6.8.0 this package will be replaced by Qt Graphs. But since it
was requested on the mailinglist we add it now. It will be replaced by
qt6graphs when Qt 6.8.0 is out.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in                |  1 +
 package/qt6/qt6charts/Config.in      |  8 ++++++++
 package/qt6/qt6charts/qt6charts.hash |  5 +++++
 package/qt6/qt6charts/qt6charts.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4cbb60322c..c5a1a702d3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -44,6 +44,7 @@ menuconfig BR2_PACKAGE_QT6
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
+source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
diff --git a/package/qt6/qt6charts/Config.in b/package/qt6/qt6charts/Config.in
new file mode 100644
index 0000000000..cf44ce7169
--- /dev/null
+++ b/package/qt6/qt6charts/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6CHARTS
+	bool "qt6charts"
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	help
+	  This package corresponds the Qt Charts module:
+
+	  https://doc.qt.io/qt-6/qtcharts-index.html
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
new file mode 100644
index 0000000000..fbeb580f29
--- /dev/null
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -0,0 +1,5 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtcharts-everywhere-src-6.7.3.tar.xz.sha256
+sha256  07ea63a550e6bcfa4a9c38056f7aa524357305572268fe26f6063d83e4233659  qtcharts-everywhere-src-6.7.3.tar.xz
+
+# Hashes for license files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6charts/qt6charts.mk b/package/qt6/qt6charts/qt6charts.mk
new file mode 100644
index 0000000000..133c4154de
--- /dev/null
+++ b/package/qt6/qt6charts/qt6charts.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# qt6charts
+#
+################################################################################
+
+QT6CHARTS_VERSION = $(QT6_VERSION)
+QT6CHARTS_SITE = $(QT6_SITE)
+QT6CHARTS_SOURCE = qtcharts-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CHARTS_VERSION).tar.xz
+QT6CHARTS_INSTALL_STAGING = YES
+QT6CHARTS_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6CHARTS_CMAKE_BACKEND = ninja
+QT6CHARTS_LICENSE = GPL-3.0
+QT6CHARTS_LICENSE_FILES = LICENSES/GPL-3.0-only.txt
+
+QT6CHARTS_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6CHARTS_DEPENDENCIES = qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6CHARTS_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
