Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A483CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99735856D5;
	Tue,  9 Jun 2026 13:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jcv2VirxPQJn; Tue,  9 Jun 2026 13:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 534BE8569C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010121;
	bh=1YiQUjHMQtZ+im0h2rBTumrmQz+gBKao1kl3vb/EwI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DZdxCkoH3XO00xco2Hddq/fCW2u3KbNt7E5tywyn6Yv5TYO2f0O9S1FAYKQ0Q22xN
	 8BkePDKdUZF6QAME/g10NC+DxPD5cLUsDzWYE2HwWKxg7k8qs18qAm4/jFaC08vmtC
	 F3Z9vQfICI/TN/5GKGuBd26PeiJUICXfEfLngLNBo9H8cZ6Lge6qHgks7+kImlqLPb
	 /Rx7m80RlwfIb5pVrevEhEN8w8c1hpldZDahka6MSvXlvFJ8XoS4ezfZgBoMUJapPA
	 XBxzYzakewXhtStbOO0bADIACsSbq6XKlBSUVRdygRlqE5n9/RS1MaOmwCqby7tY53
	 ZfST+Y8OymznA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 534BE8569C;
	Tue,  9 Jun 2026 13:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D45B190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37C08855DA
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUFp_6P071LG for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED93E855BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED93E855BD
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80B9887E7E; Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:21:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a24698054b4cf6c994c91d49513bbe5e7b270201
X-Git-Newrev: ab1de2ec7f6b6efb90cf84f1a56d5caa27ea7bc5
X-Patchwork-Hint: ignore
Message-Id: <20260609130113.80B9887E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add amdgpu-virtio config
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab1de2ec7f6b6efb90cf84f1a56d5caa27ea7bc5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add a config section for host native context drivers, which currently
use virtio-gpu as a backend to mediate access to the host kernel's DRM
uAPI.

https://www.collabora.com/news-and-blog/blog/2025/01/15/the-state-of-gfx-virtualization-using-virglrenderer/

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 19 +++++++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8cdb548fb6..32d13bc747 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -253,6 +253,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
@@ -345,6 +346,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  RADV is a userspace driver that implements the
@@ -419,6 +421,23 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO
 	help
 	  Vulkan VirtIO (venus) driver.
 
+comment "Host native context drivers"
+	depends on BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU
+	bool "amdgpu-virtio"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
+	help
+	  Enable VirtIO support for AMDGPU native contexts
+	  used by the radeonsi (OpenGL) and RADV (Vulkan) drivers.
+
+	  Select this when running Mesa inside a virtual machine
+	  with virtio-gpu host native context support.
+
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
+	bool
+
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "OpenGL API Support"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1eaa4c577e..34597966af 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -151,6 +151,12 @@ ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
 MESA3D_DEPENDENCIES += host-python-pycparser
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_AMDGPU),y)
+MESA3D_CONF_OPTS += -Damdgpu-virtio=true
+else
+MESA3D_CONF_OPTS += -Damdgpu-virtio=false
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
