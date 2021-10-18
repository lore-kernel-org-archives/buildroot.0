Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD99AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4602A610C9
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4602A610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE5781B36;
	Mon, 18 Oct 2021 19:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuD_JPXb6UcL; Mon, 18 Oct 2021 19:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A0980F62;
	Mon, 18 Oct 2021 19:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF2221BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D531B402AB
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wizI7JkmHr3 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:47:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14CD9400EF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:47:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C03D787691; Mon, 18 Oct 2021 19:44:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:46:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c729278df90c296e2a28378dad976d73c28f5b22
X-Git-Newrev: 97408545ad05344cf8a4194d72ba8c6b876795ea
X-Patchwork-Hint: ignore
Message-Id: <20211018194408.C03D787691@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-mali-mainline-driver: update
 help section to make it work on Linux >= 4.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=97408545ad05344cf8a4194d72ba8c6b876795ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Linux version >= 4.20 in order to have mali working we need to pass
drm_kms_helper.drm_leak_fbdev_smem=1 and at least
drm_kms_helper.drm_fbdev_overalloc=200 to have a double buffer fbdev.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline-driver/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
index 5db66c5bf6..90bc308bc5 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -26,4 +26,14 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	  enabled:
 	  - CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
 
+	  The following kernel command line options must be passed:
+
+	  - drm_kms_helper.drm_leak_fbdev_smem = 1
+	    since drm_kms_helper.drm_leak_fbdev_smem is set to 0 by
+	    default
+
+	  - drm_kms_helper.drm_fbdev_overalloc >= 200
+	    since the driver requires at least double buffering and
+	    fails to work with the default value(100).
+
 	  https://github.com/mripard/sunxi-mali/blob/master/README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
