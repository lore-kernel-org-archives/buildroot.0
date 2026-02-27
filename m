Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7510DEEF317
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D5680F0B;
	Thu,  5 Mar 2026 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Au_glIboy1_d; Thu,  5 Mar 2026 08:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052C380E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697760;
	bh=L8ld7ESI4Bq3o8mhBtrDcH06Mzfyge9/KQZaKgwnZfs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UBQZk4Pbknhxin7sLUDslMyTn8eh8D+CE/SiHLZPXYt6ltE0LFFH/vL4xsg7INxtD
	 MYuaHm3RsqwCJPN3JLWEqFHgw83JaMm8Gkaw2C7biGPTwu3LWfqtBXuPFpSNT6TwC9
	 Lp72Qv/C5T6eIFVmkGHpqYX9fKZhAiHd2QEd5fLEPrsALvgy6KMoAaQwtvrP5DIK2c
	 sois5uV2eI6NFV7hg9oPO3j/xfwtdvFlNtCCYsRVeaBIew8jKZVEBPrRW/6diaTnlu
	 NceP+DJR00P3sgYfipVeCAhKEBtYmAxkKjqcaj/0UFyMzPORYy0ingqwyK/PTpmYgO
	 2kYzZ5CWDTysA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052C380E64;
	Thu,  5 Mar 2026 08:02:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD2434F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F659606DF
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFbad5Ot9C7I for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0273760619
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0273760619
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E66885EEB; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 18:54:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06c64513668c6ccccd4c53c35f5fc141554d77d8
X-Git-Newrev: 250a4cd4cf39ce36829b2268a6176c68f94b7280
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.0E66885EEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add panfrost vulkan driver
 config
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/250a4cd4cf39ce36829b2268a6176c68f94b7280
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Joseph Kogut <joseph@anodize.com>
[Julien: add libxshmfence comment in Config.in]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 14 ++++++++++++++
 package/mesa3d/mesa3d.mk |  6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e1faea95d5..a7af0af052 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -59,6 +59,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST || \
 		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
 		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
 	select BR2_PACKAGE_LLVM_RTTI
@@ -365,6 +366,19 @@ comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
+	bool "Vulkan panfrost driver"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan panfrost driver.
+
+comment "panfrost vulkan needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
 	bool "Vulkan swrast driver"
 	depends on BR2_PACKAGE_MESA3D_LLVM
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 42693ce928..027ddf5133 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -131,6 +131,8 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
+HOST_MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
 
@@ -284,7 +286,7 @@ else
 MESA3D_CONF_OPTS += -Dglvnd=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST),)
 HOST_MESA3D_TOOLS += panfrost
 endif
 
@@ -315,7 +317,7 @@ HOST_MESA3D_DEPENDENCIES = \
 	host-python-pyyaml \
 	host-spirv-tools
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST),)
 HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/panfrost/clc/panfrost_compile $(HOST_DIR)/bin/panfrost_compile
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
