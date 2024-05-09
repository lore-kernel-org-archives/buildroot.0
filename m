Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC278C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B84A683C72;
	Thu,  9 May 2024 15:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7DsW2az4UMq; Thu,  9 May 2024 15:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBAA783C84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBAA783C84;
	Thu,  9 May 2024 15:56:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 812591BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DE9C606C2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NFInAnR9aGP for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD27860692
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD27860692
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:56:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9856C86C55; Thu,  9 May 2024 15:56:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:56:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b45a3a144767bde38f1fcd0ac97c788a383685c
X-Git-Newrev: c107dd33e679becf8b58d78d088b5320734d3e31
X-Patchwork-Hint: ignore
Message-Id: <20240509155636.9856C86C55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: add
 qt5tools as a dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c107dd33e679becf8b58d78d088b5320734d3e31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
