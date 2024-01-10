Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56F4C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF584223D;
	Wed, 10 Jan 2024 15:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF584223D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncW-JlVoKCht; Wed, 10 Jan 2024 15:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C8142211;
	Wed, 10 Jan 2024 15:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C8142211
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80CEC1BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4687D41823
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4687D41823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOU1STUFi0Y7 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FA0A41710
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA0A41710
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CC54856C8; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 16:38:43 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 773db648fb04726ff71f92d9aae72100aacab361
X-Git-Newrev: a2c303136ff005d49370ad2850736075413e8290
X-Patchwork-Hint: ignore
Message-Id: <20240110154603.4CC54856C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcamera:
 pipeline option 'raspberrypi' changed to 'rpi/vc4'
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2c303136ff005d49370ad2850736075413e8290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

With upstram commit [1] (since version v0.1.0) the pipeline option 'raspberrypi'
was renamed to 'rpi/vc4'.

Change the buildroot option name from BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
to BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4 (and add Config.in.legacy entry
accordingly) and move handling in Config.in/libcamer.mk to follow alphabetic
ordering.

Fixes:

  .../build/libcamera-v0.1.0/meson.build:3:0: ERROR: Options "raspberrypi" are not in allowed choices: "all, auto, imx8-isi, ipu3, rkisp1, rpi/vc4, simple, uvcvideo, vimc"

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=726e9274ea95fa46352556d340c5793a8da51fcd

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 782d268abadc2541953d1782d79d142a7b6f07b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy               | 10 ++++++++++
 package/libcamera/Config.in    | 16 ++++++++--------
 package/libcamera/libcamera.mk |  6 +++---
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 312d53943c..ebd2c5d8d4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
+	bool "libcamera pipeline 'raspberrypi' was renamed to 'rpi/vc4'"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_USE_WCHAR
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
+	help
+	  Since version 0.1.0 the libcamera pipeline option
+	  'raspberrypi' was renamed to 'rpi/vc4'.
+
 config BR2_PACKAGE_PYTHON_PYXB
 	bool "python-pyxb removed"
 	select BR2_LEGACY
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 63c06173db..65d5fb37f8 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -40,21 +40,21 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
 	help
 	  Pipeline for Intel IPU3.
 
-config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
-	bool "raspberrypi pipeline"
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
+	bool "rkisp1 pipeline"
 	depends on BR2_arm || BR2_aarch64
-	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
-	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
-	  Pipeline for Raspberry Pi devices.
+	  Pipeline for Rockchip ISP1.
 
-config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
-	bool "rkisp1 pipeline"
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
+	bool "rpi/vc4 pipeline"
 	depends on BR2_arm || BR2_aarch64
+	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
+	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
-	  Pipeline for Rockchip ISP1.
+	  Pipeline for Raspberry Pi devices.
 
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE
 	bool "simple pipeline"
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8dce67f60f..c1c8bb7b33 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -51,11 +51,11 @@ LIBCAMERA_CONF_OPTS += -Dv4l2=false
 endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
-ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
-LIBCAMERA_PIPELINES-y += raspberrypi
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
+ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4),y)
+LIBCAMERA_PIPELINES-y += rpi/vc4
 LIBCAMERA_DEPENDENCIES += boost
 endif
-LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO) += uvcvideo
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
