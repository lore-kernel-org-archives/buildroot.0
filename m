Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA699CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 11:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91E2561546;
	Fri, 15 May 2026 11:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sSwutT0o3mZ; Fri, 15 May 2026 11:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB11C612E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778846218;
	bh=7o7f42JPQ3DSCS/DJLOpSVxAuFcW1vxFqa5vH0W7DMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I3hrJ6QqyRqR79ZYnOUPKTMjAfTJuPT5AuBUvdVvTvdCAqU6gBHRorbM9XaE9gg89
	 LYbbKjRCfFiExxSCgpjB9cQjSo6qp2ZNhIZvwoZhQaYLmNO12H08qa8Hqi5Ud3bHmX
	 tFw/elIaUj2QBa5QNPbaJcedY2HQpW2G7X0OmBIEtPdzXLhHHHQqYusFsKDXfx+H/V
	 EBmV3fWOukt4YaBaVekjzq8uYqmQSSVj1xO4SdBSUjbc6CmVGDuZt/oOQ0xBRRZno2
	 IKZ8y6yXSa60jdHXve1xC43Plpk0KursP5emnb7Olg0rsu6o7RXuLx7o3frDd6Q3fP
	 phA/SqPR3B9kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB11C612E5;
	Fri, 15 May 2026 11:56:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4039336E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25F56404E4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MddvYtiJqTFP for <buildroot@buildroot.org>;
 Fri, 15 May 2026 11:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6821B40236
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6821B40236
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B224E86334; Fri, 15 May 2026 11:56:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:21:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ab1de2ec7f6b6efb90cf84f1a56d5caa27ea7bc5
X-Git-Newrev: 84dd56f072162552d9f196e19313fd9068d61fa4
X-Patchwork-Hint: ignore
Message-Id: <20260515115650.B224E86334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: add
 freedreno-virtio config
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84dd56f072162552d9f196e19313fd9068d61fa4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add a config for enabling the freedreno virtio KMD backend, in the same
pattern as amdgpu-virtio.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 11 +++++++++++
 package/mesa3d/mesa3d.mk | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 32d13bc747..40c3d25866 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -150,6 +150,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	# the toolchain having sync4 primitives, which is always a given
 	# for arm/aarch64.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	help
 	  Mesa driver for Freedreno GPUs.
@@ -435,6 +436,16 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 	  Select this when running Mesa inside a virtual machine
 	  with virtio-gpu host native context support.
 
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
+	bool "freedreno-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	help
+	  Enable VirtIO support for freedreno native contexts
+	  used by the freedreno driver.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	bool
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 34597966af..d9916ca359 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -157,6 +157,16 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+MESA3D_FREEDRENO_KMDS = msm
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
+MESA3D_FREEDRENO_KMDS += virtio
+endif
+
+MESA3D_CONF_OPTS += \
+	-Dfreedreno-kmds=$(subst $(space),$(comma),$(MESA3D_FREEDRENO_KMDS))
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
