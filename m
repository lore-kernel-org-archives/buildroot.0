Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6D9C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5312D41903;
	Tue,  7 Jun 2022 19:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmkcJwI3ojht; Tue,  7 Jun 2022 19:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB15415D6;
	Tue,  7 Jun 2022 19:29:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2DD1BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3B9983E6A
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phZrtGoVPvcB for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C11983E6C
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3F8A686E21; Tue,  7 Jun 2022 19:05:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 22:36:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bf8497621bf43570e9fb6e2295a9fdbea9f59db
X-Git-Newrev: 34d157af56c74cd69bd6a6472d1e2f571161a8d7
X-Patchwork-Hint: ignore
Message-Id: <20220607190500.3F8A686E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-nouveau:
 switch dependency from mesa3d to libgl
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
From: "Arnout Vandecappelle \(Essensium/Mind\) via buildroot"
 <buildroot@buildroot.org>
Reply-To: "Arnout Vandecappelle \(Essensium/Mind\)" <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=34d157af56c74cd69bd6a6472d1e2f571161a8d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DRI support for this driver is provided by the xserver_xorg-server
package when BR2_PACKAGE_HAS_LIBGL is enabled:
https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n91

Change the dependency to follow the logic of xserver_xorg-server.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xdriver_xf86-video-nouveau/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/Config.in b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
index c9fd2e3d2f..5b266b1b4a 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
 	bool "xf86-video-nouveau"
-	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
+	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_XORGPROTO
@@ -10,5 +9,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
 
 	  http://nouveau.freedesktop.org
 
-comment "xf86-video-nouveau needs mesa3d"
-	depends on !BR2_PACKAGE_MESA3D
+comment "xf86-video-nouveau needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
