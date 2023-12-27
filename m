Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D651AC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AFEA41C36;
	Wed, 27 Dec 2023 22:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AFEA41C36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzVSQ72qKk4s; Wed, 27 Dec 2023 22:31:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D7A41C2D;
	Wed, 27 Dec 2023 22:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3D7A41C2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFAF01BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A925E41C2D
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A925E41C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZXpxVcDirPJ for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:31:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD24441C21
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD24441C21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A293C83752; Wed, 27 Dec 2023 22:31:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 23:30:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5020985e392907c05a66ab7d12b0406fd74ab023
X-Git-Newrev: 3438a8869f97ad5051e9270ffebd73ecbbb4190d
X-Patchwork-Hint: ignore
Message-Id: <20231227223102.A293C83752@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: add i.MX8 ISI pipeline
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=3438a8869f97ad5051e9270ffebd73ecbbb4190d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add i.MX8 ISI pipeline option (introduced with upstream commit [1] (since
version v0.0.1).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=0ec982d210861cc6aaebb5d6e8f1a755a16c9792

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/Config.in    | 7 +++++++
 package/libcamera/libcamera.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 65d5fb37f8..ccb5281b4b 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -33,6 +33,13 @@ config BR2_PACKAGE_LIBCAMERA_V4L2
 config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	bool
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI
+	bool "imx8-isi pipeline"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
+	help
+	  Pipeline for i.MX8 SoC ISI capture interface.
+
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
 	bool "ipu3 pipeline"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index dd31d90e98..c9af90f35f 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -51,6 +51,7 @@ else
 LIBCAMERA_CONF_OPTS += -Dv4l2=false
 endif
 
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
