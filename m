Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C817CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A588B85581;
	Tue,  9 Jun 2026 13:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAiEBqefcY8l; Tue,  9 Jun 2026 13:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E5418562A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010118;
	bh=GN9Nc5i88fzZsrE+GvECM+NWAgvU2/7o7LgJUARAehw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SgqvR64NRTtnSIb6Ie2MbEleMAKAkcF/GPDjMUVsf3pTuSAUNOgQec3GM900vb5t/
	 5paLcHkGby8CbVU82XAcjqclmH9Upxdmkjdmv6SiuRWP2/33niSPXUhPOO/qVhOP+M
	 PHxvX9d6Uhb+vjsLW3GjuMFShs75svRj6wKmvDcBcus4VVz+fw0zSxA8LD6R+Me/qC
	 42glZKwGD2JBrHLH4Ku+4SBmQoQq7bIo4im9Y4qsKY2EEnMa/ZvOVDat/GPeK2FnXW
	 r1/EbJ09ow0FvbWvGqVCClSJ4+ErKsdP6G+Cnv3wQxL1z90u7LKZ7eVpo6OLieYWsU
	 E7WgWrlZcAkUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5418562A;
	Tue,  9 Jun 2026 13:01:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 031592EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18597423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3tBEKIpabwN for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2761C423C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2761C423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63DE387E7E; Tue,  9 Jun 2026 13:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:21:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84dd56f072162552d9f196e19313fd9068d61fa4
X-Git-Newrev: 4dd918fab690037739d49c5f2ea2c5ebd8e7b82a
X-Patchwork-Hint: ignore
Message-Id: <20260609130114.63DE387E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add freedreno vulkan
 driver config
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4dd918fab690037739d49c5f2ea2c5ebd8e7b82a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 13 +++++++++++--
 package/mesa3d/mesa3d.mk |  3 ++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 40c3d25866..74c9f19487 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -363,6 +363,13 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	help
 	  Vulkan broadcom driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
+	bool "Vulkan freedreno driver (turnip)"
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan freedreno driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
@@ -438,10 +445,12 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
 
 config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
 	bool "freedreno-virtio"
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO
 	help
 	  Enable VirtIO support for freedreno native contexts
-	  used by the freedreno driver.
+	  used by the freedreno (OpenGL) and Turnip (Vulkan)
+	  drivers.
 
 	  Select this when running Mesa inside a virtual machine
 	  with virtio-gpu host native context support.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d9916ca359..a0be555860 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -130,6 +130,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD) += amd
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO) += freedreno
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
@@ -157,7 +158,7 @@ else
 MESA3D_CONF_OPTS += -Damdgpu-virtio=false
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO),)
 MESA3D_FREEDRENO_KMDS = msm
 ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
 MESA3D_FREEDRENO_KMDS += virtio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
