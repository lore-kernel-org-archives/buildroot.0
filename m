Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092A8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC40361196;
	Mon,  6 Jun 2022 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBYGs-mhbrow; Mon,  6 Jun 2022 20:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D16A160D4C;
	Mon,  6 Jun 2022 20:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 082CF1BF297
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8CB483EAB
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmAx0JLhb1yA for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:37:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A1984017
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1629686DDD; Mon,  6 Jun 2022 20:25:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 22:36:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 82fb054745f8b3fa126be6b5b5506fca0ea999ea
X-Git-Newrev: 05b6f15ae82d926b016c32e0f60bfd0b4463f27e
X-Patchwork-Hint: ignore
Message-Id: <20220606202540.1629686DDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-imx-viv: switch dependency from mesa3d to
 libgl
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

commit: https://git.buildroot.net/buildroot/commit/?id=05b6f15ae82d926b016c32e0f60bfd0b4463f27e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

DRI support for this driver is provided by the xserver_xorg-server
package when BR2_PACKAGE_HAS_LIBGL is enabled:
https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n91

Change the dependency to follow the logic of xserver_xorg-server.

Also fix a typo in the Config.in help text while being at it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index 13cee14deb..984f63d6d3 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	bool "xf86-video-imx-viv"
+	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	depends on BR2_PACKAGE_IMX_GPU_G2D
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
-	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XORGPROTO
 	help
@@ -26,7 +25,12 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 
 	  Don't forget to load galcore.ko and create /dev/galcore
 	  before using this driver (else, Xorg will exit with an
-	  obscur message like "Segmentation fault at address 0xc").
+	  obscure message like "Segmentation fault at address 0xc").
+
+comment "xf86-video-imx-viv needs an OpenGL backend"
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 
 comment "xf86-video-imx-viv depends on imx-gpu-viv with X11 output"
 	depends on BR2_arm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
