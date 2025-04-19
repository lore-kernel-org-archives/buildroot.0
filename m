Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4923AC369D1
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 045FE60642;
	Sat, 19 Apr 2025 20:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nq9PS5ny0fsz; Sat, 19 Apr 2025 20:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB9360858
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB9360858;
	Sat, 19 Apr 2025 20:25:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58EAF68
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DC654021C
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9_kbXy2zPTj for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D15A34024E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D15A34024E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC91585CB9; Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 22:21:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 028bdac7edf02820209c82f134744f0138f1da5b
X-Git-Newrev: 3913cebc51f547fed924f51d1df2999696d71122
X-Patchwork-Hint: ignore
Message-Id: <20250419202542.CC91585CB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: add support for Arm
 Mali-C55 ISP pipeline
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

commit: https://git.buildroot.net/buildroot/commit/?id=3913cebc51f547fed924f51d1df2999696d71122
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support was added in v0.4.0 so let's add the knobs for building the
pipeline.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/Config.in    | 7 +++++++
 package/libcamera/libcamera.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 086a5b3758..92361bbade 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -60,6 +60,13 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
 	help
 	  Pipeline for Rockchip ISP1.
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55
+	bool "mali-c55 pipeline"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
+	help
+	  Pipeline for Arm Mali-C55 ISP.
+
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
 	bool "rpi/vc4 pipeline"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index b5b17a5c94..449f66ee36 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -58,6 +58,7 @@ endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55) += mali-c55
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4) += rpi/vc4
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
