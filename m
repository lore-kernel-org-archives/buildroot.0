Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB2FC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D309084AB6;
	Mon, 19 May 2025 11:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yt18d7ed-z4i; Mon, 19 May 2025 11:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCBDC84AB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCBDC84AB8;
	Mon, 19 May 2025 11:06:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C23C9D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF0E040E33
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHOaGRwJ3XyW for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13736423F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13736423F2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10E6B82A2E; Mon, 19 May 2025 10:40:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 22:41:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c84fcef123b94a2f66226bc946dbe251126393a7
X-Git-Newrev: c8adccf8df811b850c718c7659b26af420207bb9
X-Patchwork-Hint: ignore
Message-Id: <20250519104011.10E6B82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-gpu-viv: rename IMX_GPU_VIV_LIB_TARGET to
 IMX_GPU_VIV_OUTPUT
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8adccf8df811b850c718c7659b26af420207bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for some rework of the package, let's rename the
IMX_GPU_VIV_LIB_TARGET variable to IMX_GPU_VIV_OUTPUT to make it match
the BR2_PACKAGE_IMX_GPU_VIV_OUTPUT config option it corresponds to.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 8744ff1bc9..14bcbb99d3 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -25,14 +25,14 @@ ifeq ($(BR2_aarch64),y)
 IMX_GPU_VIV_PROVIDES += libgbm
 endif
 
-IMX_GPU_VIV_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
+IMX_GPU_VIV_OUTPUT = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT))
 
 # Libraries are linked against libdrm, except framebuffer output on ARM
-ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
+ifneq ($(IMX_GPU_VIV_OUTPUT)$(BR2_arm),fby)
 IMX_GPU_VIV_DEPENDENCIES += libdrm
 endif
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
+ifeq ($(IMX_GPU_VIV_OUTPUT),wayland)
 IMX_GPU_VIV_DEPENDENCIES += wayland
 endif
 
@@ -40,11 +40,11 @@ define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
+ifeq ($(IMX_GPU_VIV_OUTPUT),fb)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
-else ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
+else ifeq ($(IMX_GPU_VIV_OUTPUT),wayland)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_wayland.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
 endef
@@ -61,7 +61,7 @@ endif
 # in the upstream archive here. We also remove unused backend files.
 # Make sure these commands are idempotent.
 define IMX_GPU_VIV_BUILD_CMDS
-	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_LIB_TARGET)/* $(@D)/gpu-core/usr/lib/
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_OUTPUT)/* $(@D)/gpu-core/usr/lib/
 	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
