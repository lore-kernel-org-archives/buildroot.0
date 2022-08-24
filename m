Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E322CECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E608175F;
	Sun, 11 Sep 2022 09:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84E608175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1X6I78oLxmp6; Sun, 11 Sep 2022 09:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8888F81448;
	Sun, 11 Sep 2022 09:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8888F81448
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AEC91BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D3FE6FB39
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D3FE6FB39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pxAqJSwElxCw for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32CAF6106A
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32CAF6106A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2C82F8361F; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:23:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86ec2b57f48f90b0d7625c4b2cb25ef7c0047a05
X-Git-Newrev: 7f67bd1ca68f0449435c8d31c4ee99e85d156c22
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.2C82F8361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6serialport: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7f67bd1ca68f0449435c8d31c4ee99e85d156c22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  3 +++
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6serialport/Config.in          | 11 ++++++++
 package/qt6/qt6serialport/qt6serialport.hash |  9 +++++++
 package/qt6/qt6serialport/qt6serialport.mk   | 38 ++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 07d719984a..08d24fba5c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1468,6 +1468,9 @@ F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
+N:	Jesse Van Gavere <jesseevg@gmail.com>
+F:	package/qt6/qt6serialport/
+
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
 F:	package/libuwsc/
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 86394f49ba..4b2b9a1174 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -39,5 +39,6 @@ menuconfig BR2_PACKAGE_QT6
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
+source "package/qt6/qt6serialport/Config.in"
 
 endif
diff --git a/package/qt6/qt6serialport/Config.in b/package/qt6/qt6serialport/Config.in
new file mode 100644
index 0000000000..f1fd844f56
--- /dev/null
+++ b/package/qt6/qt6serialport/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6SERIALPORT
+	bool "qt6serialport"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Serial Port provides the basic functionality, which
+	  includes configuring, I/O operations, getting and setting
+	  the control signals of the RS-232 pinouts.
+
+	  https://doc.qt.io/qt-6/qserialport.html
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
new file mode 100644
index 0000000000..9780eb86fe
--- /dev/null
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -0,0 +1,9 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtserialport-everywhere-src-6.3.1.tar.xz.sha256
+sha256  4eb6d80e65799dd2e0318df4dfba14173c1929e861718cda9bedca24253b616e  qtserialport-everywhere-src-6.3.1.tar.xz
+
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
new file mode 100644
index 0000000000..01763657b8
--- /dev/null
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# qt6serialport
+#
+################################################################################
+
+QT6SERIALPORT_VERSION = $(QT6_VERSION)
+QT6SERIALPORT_SITE = $(QT6_SITE)
+QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
+QT6SERIALPORT_INSTALL_STAGING = YES
+QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
+QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT6SERIALPORT_CONF_OPTS = \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SERIALPORT_DEPENDENCIES = \
+	host-pkgconf \
+	host-ninja \
+	qt6base
+
+define QT6SERIALPORT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALPORT_BUILDDIR)
+endef
+
+define QT6SERIALPORT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR) --prefix $(STAGING_DIR)/usr
+endef
+
+define QT6SERIALPORT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR) --prefix $(TARGET_DIR)/usr
+endef
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
