Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9E4C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F1540302;
	Mon,  3 Jun 2024 15:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0WTDqkveR2V; Mon,  3 Jun 2024 15:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365ED408B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 365ED408B1;
	Mon,  3 Jun 2024 15:57:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0661BF868
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C4D60A5C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8bwFVIHcSSW for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C74D2607CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C74D2607CC
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B296A85E50; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 17:22:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 107b3cb91c72e2ac498356407ad60667d61c897a
X-Git-Newrev: 72ca72c4b9d7eeb5046d2ebb8783ce7ddcc53c77
X-Patchwork-Hint: ignore
Message-Id: <20240603155719.B296A85E50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/gstreamer1/gst1-plugins-good: add qt5tools as a dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=72ca72c4b9d7eeb5046d2ebb8783ce7ddcc53c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The following defconfig:

 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_GSTREAMER1=y
 BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=y
 BR2_PACKAGE_GST1_PLUGINS_GOOD=y
 # BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AVI is not set
 # BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4 is not set
 # BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPARSE is not set
 BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_WAYLAND=y
 # BR2_TARGET_ROOTFS_TAR is not set

fails to build in gst1-plugins-good, with:

    build/gst1-plugins-good-1.22.9/ext/qt/meson.build:48:4: ERROR: Problem encountered: qt5 qmlglsink plugin is enabled, but qt specific tools were not found

This is due to qt5tools being missing. This commit adds this missing
dependency.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c107dd33e679becf8b58d78d088b5320734d3e31)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 2 ++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index e1e2674a4a..3cf227b78d 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -293,6 +293,8 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5TOOLS
+	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
 	select BR2_PACKAGE_QT5X11EXTRAS if BR2_PACKAGE_QT5BASE_XCB
 	help
 	  QT5 plugin which includes elements qmlglsrc and qmlglsink
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index a1ad63915d..2bb826d807 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -357,7 +357,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dqt5=enabled
-GST1_PLUGINS_GOOD_DEPENDENCIES += qt5declarative
+GST1_PLUGINS_GOOD_DEPENDENCIES += qt5declarative qt5tools
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += qt5x11extras
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
