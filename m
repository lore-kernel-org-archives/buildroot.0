Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BE7C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E37441E1A;
	Wed, 10 Jan 2024 15:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E37441E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzKi6kuOvRYF; Wed, 10 Jan 2024 15:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A945C42210;
	Wed, 10 Jan 2024 15:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A945C42210
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 044B01BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D980B436F9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D980B436F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQf0UQ8kxe5G for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:41:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE63C43706
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE63C43706
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC556856C7; Wed, 10 Jan 2024 15:41:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 16:40:46 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c7b77dfa8556c84ea6a6b31de005469b2e3a678c
X-Git-Newrev: c5a72c5a22023f9d69547567926c0d07cc81f04c
X-Patchwork-Hint: ignore
Message-Id: <20240110154131.AC556856C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcamera: add
 i.MX8 ISI pipeline option
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5a72c5a22023f9d69547567926c0d07cc81f04c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add i.MX8 ISI pipeline option (introduced with upstream commit [1] (since
version v0.0.1).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=0ec982d210861cc6aaebb5d6e8f1a755a16c9792

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3438a8869f97ad5051e9270ffebd73ecbbb4190d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/Config.in    | 7 +++++++
 package/libcamera/libcamera.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 63c06173db..e2c992e7c2 100644
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
index 7981c7d3bf..550ae0289d 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -51,6 +51,7 @@ else
 LIBCAMERA_CONF_OPTS += -Dv4l2=false
 endif
 
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
 LIBCAMERA_PIPELINES-y += raspberrypi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
