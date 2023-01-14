Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72894C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1564141D86;
	Mon, 20 Feb 2023 21:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1564141D86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kq8Gx1xQKwY1; Mon, 20 Feb 2023 21:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F22EE42CC7;
	Mon, 20 Feb 2023 21:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F22EE42CC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 490A81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30A8141947
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A8141947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSWa-7IeWHl0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B65B4192D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B65B4192D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19B2B8648F; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 23:09:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 424f53ac0730ea8e8aac4f3341f25a9829582cbb
X-Git-Newrev: 838c9a33be603e59ff7f65041bbcc138e573d13f
X-Patchwork-Hint: ignore
Message-Id: <20230220205233.19B2B8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-viv: add platform specific drivers
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

commit: https://git.buildroot.net/buildroot/commit/?id=838c9a33be603e59ff7f65041bbcc138e573d13f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
the archive contains platform specific drivers that need to be copied
and included.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in      |  8 ++++++++
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 9372b6313f..3e095b730c 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -77,6 +77,14 @@ if BR2_aarch64
 config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "imx-gpu-viv"
 
+config BR2_PACKAGE_IMX_GPU_VIV_PLATFORM
+	string
+	default "mx8mn" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default "mx8mp" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "mx8mq" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default "mx8qm" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	default "mx8qxp" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
 endif
 
 config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index e0e8a31533..f72735e093 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -49,6 +49,13 @@ define IMX_GPU_VIV_FIXUP_PKGCONFIG
 endef
 endif
 
+IMX_GPU_VIV_PLATFORM_DIR = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_PLATFORM))
+ifneq ($(IMX_GPU_VIV_PLATFORM_DIR),)
+define IMX_GPU_VIV_COPY_PLATFORM
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_PLATFORM_DIR)/* $(@D)/gpu-core/usr/lib/
+endef
+endif
+
 # Instead of building, we fix up the inconsistencies that exist
 # in the upstream archive here. We also remove unused backend files.
 # Make sure these commands are idempotent.
@@ -57,6 +64,10 @@ define IMX_GPU_VIV_BUILD_CMDS
 	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
+	$(IMX_GPU_VIV_COPY_PLATFORM)
+	$(foreach platform,mx8mn mx8mp mx8mq mx8qm mx8qxp mx8ulp, \
+		$(RM) -r $(@D)/gpu-core/usr/lib/$(platform)
+	)
 	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
