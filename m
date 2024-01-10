Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5E0C4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CFE44175B;
	Wed, 10 Jan 2024 15:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CFE44175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLYMCGY_DIqv; Wed, 10 Jan 2024 15:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF66D418AD;
	Wed, 10 Jan 2024 15:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF66D418AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6A41BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 803CB82EB4
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 803CB82EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3orpKw_fs5jH for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BBF382ECF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBF382ECF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FEE9856C7; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 16:40:41 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f7474d10659cef1e6c48e2e38fa596908f2af09b
X-Git-Newrev: c6a59147acb5149f411466b74501f6bf071427a4
X-Patchwork-Hint: ignore
Message-Id: <20240110154603.6FEE9856C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcamera: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6a59147acb5149f411466b74501f6bf071427a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
