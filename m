Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5D9CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 11:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80E7E41A63;
	Fri, 15 May 2026 11:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pftK2rIzInZU; Fri, 15 May 2026 11:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9759F41A58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778846221;
	bh=yOxxazIxfn5UkWgbwqSJ0W2HN0lZuQE9twga1VUxc+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XUHOnaCXh1pVdIL1emDwAIaN5JvjWsm8eJx8TM+tMlb/17px1k2ew6tDsVryZ9yov
	 qPfploGmrjtom0UTSTHbwsMcXWvTiiuNc7Ck9fmVlVn2/v+EGmCzi06V7GWd8EDkes
	 sQomsaciWAaN2t321tpkgZdIn1e+VPAVhrcn60xi7Ta1Tjtn1Um/7tSuBEdjYdWURS
	 SHulcaz4qi4VlStvxWd1MmwDm0dyLftp4JJDg4RznFmSYulQ4gy2SO7zxie+Ox8Spf
	 iEOrjEcVeNFF3drmzzry7usuO0cX/2c76KWys/WKKcYdOwQDYrYljZhKZLZnzhdnIV
	 g5sGO9BmYen3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9759F41A58;
	Fri, 15 May 2026 11:57:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ECF649E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F20D60F29
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6NMvYJJH0VF for <buildroot@buildroot.org>;
 Fri, 15 May 2026 11:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F31612E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57F31612E5
 for <buildroot@buildroot.org>; Fri, 15 May 2026 11:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1BAD86327; Fri, 15 May 2026 11:56:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:21:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a24698054b4cf6c994c91d49513bbe5e7b270201
X-Git-Newrev: ab1de2ec7f6b6efb90cf84f1a56d5caa27ea7bc5
X-Patchwork-Hint: ignore
Message-Id: <20260515115650.A1BAD86327@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: add
 amdgpu-virtio config
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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
