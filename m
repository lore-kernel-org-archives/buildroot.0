Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA53AFEFB70
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 17:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F31160B56;
	Fri, 27 Feb 2026 17:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JgbPhgW0eiQ; Fri, 27 Feb 2026 17:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C75A60B66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772214948;
	bh=6cvaXTaAUcB16WBDCsMWSRfh8S8yj7XYGbZA5lRUvqI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ho/CUaW9RtumrcV7mZbPgKnlxMWcINsT/m2nuvc+Z/QtlHO6N8A3jeapuUU23cvaH
	 Rs/nELKHD/LxO5ziJLYkoZRSzjtO6epXbJSzHI5HlE0M9/0oUgvebFhRwnh0U/aQsi
	 MIakYZxrD3+euxubfczJnUZ777AAcTlaJAUbSYwppbEOsLKCLGHVewg3IAhmPtKzY0
	 FOqSaFGga8pCJ9JZoYKGusHFE4YTpxbUzovcdYSI2paNkf/NA6qq5ATPuBLBnoArTu
	 k2CTequJyeDNO50Yr6JxCazI8/lbLJ6vbthWZRFDOUPRV6R96K1Ar1mGg5z+jq+Zxd
	 dzv7gUoKVT/YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C75A60B66;
	Fri, 27 Feb 2026 17:55:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E61F131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6038B40C70
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kYRdR-rCvmS for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 17:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A0040C6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73A0040C6F
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:55:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CA958108B; Fri, 27 Feb 2026 17:55:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 18:54:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 250a4cd4cf39ce36829b2268a6176c68f94b7280
X-Git-Newrev: 1cc6279d1144c0b61dc6051eb57ab8800931c96c
X-Patchwork-Hint: ignore
Message-Id: <20260227175546.5CA958108B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: add amd vulkan
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1cc6279d1144c0b61dc6051eb57ab8800931c96c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 13 +++++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 14 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a7af0af052..63acf0cc6e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -57,6 +57,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST || \
@@ -326,6 +327,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK
 
 comment "Vulkan drivers"
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD
+	bool "Vulkan AMD driver (radv)"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_LIBDRM_AMDGPU
+	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  RADV is a userspace driver that implements the
+	  Vulkan API on most modern AMD GPUs.
+
+	  https://docs.mesa3d.org/drivers/radv.html
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	bool "Vulkan broadcom driver"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 027ddf5133..e5880cc995 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -128,6 +128,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD) += amd
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
