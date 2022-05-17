Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4435FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 062AA40CEB;
	Tue, 17 May 2022 20:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZZaRQo4DCS3; Tue, 17 May 2022 20:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B29140133;
	Tue, 17 May 2022 20:00:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33C3E1BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30BF8404CC
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALDf_aCpBE4H for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:00:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6344032D
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:00:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 46B8385F51; Tue, 17 May 2022 19:49:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:00:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 770c9e5ce3de4ef1743948898a37e9a2ad76ca8f
X-Git-Newrev: 198244b3c31029aa16ae69e1661f1e1cd173b03f
X-Patchwork-Hint: ignore
Message-Id: <20220517194939.46B8385F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-imx: add missing
 BR2_INSTALL_LIBSTDCPP dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=198244b3c31029aa16ae69e1661f1e1cd173b03f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BAD
  Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
  Selected by [y]:
  - BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_IMX [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-imx/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 41ef8548c5..bd1f8d41f2 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -81,10 +81,14 @@ comment "imxvpu needs the VPU imxvpuapi library"
 
 config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 	bool "imxv4l2videosrc"
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	help
 	  Elements for V4L2 capture
 
+comment "imxv4l2videosrc needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
 	bool "imxv4l2videosink"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 # V4L2_COLORSPACE_DEFAULT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
