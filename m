Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550F4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E82560C18;
	Sun, 29 May 2022 08:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hg32chj5bB5t; Sun, 29 May 2022 08:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C86760E8D;
	Sun, 29 May 2022 08:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42B2B1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 314A160E8D
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfiMmMmFwd2E for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 959B660DB2
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1BA2386577; Sun, 29 May 2022 08:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:45:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b6ab73fe1f466c0e30171b59ef3cdfcaeed16e5c
X-Git-Newrev: 60eba210cdeddc2498d523fbae1eed80aa2caa63
X-Patchwork-Hint: ignore
Message-Id: <20220529084303.1BA2386577@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/gstreamer1/gst1-imx: add missing BR2_INSTALL_LIBSTDCPP dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=60eba210cdeddc2498d523fbae1eed80aa2caa63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BAD
  Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
  Selected by [y]:
  - BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_IMX [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 198244b3c31029aa16ae69e1661f1e1cd173b03f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
