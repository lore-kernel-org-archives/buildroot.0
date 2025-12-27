Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F90D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF1D8116F;
	Wed,  7 Jan 2026 18:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXfVADmefTgo; Wed,  7 Jan 2026 18:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A1748145A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808904;
	bh=0sHf0jxrzATrmNJle5stFHpdn4p5khTsAyVPekV2J3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gMuwWdS1bi5UdHuaYhknQ50y4kHm3x2Mz6tx/oX0n7Ae1f0NMuuQe6SrGKs7ZJTAx
	 QNbX4M9ERXhNkuz3Ros2hAuKsj0R0jbpX7xuNPju0wrX1H10Fs1t4CnBQ9tteUYN3Y
	 a+s4lA58n18oVI5AeH4HkOKx/oNiiajTYTFAZ3Lr9RsW1baTSTBtyxpA5SH0W1Acmk
	 GifmXGUQvDbPlTMx+FhsXsN7XREqczgsV3mZCXfO6p6/xbg60CG5zowwnFr9RGXvih
	 dg4dr5RzxFvJ9UV1aDtl41RP4Op+XwY5df/t0gTbRMVBe0oJAkIGEmHKkpV1kxIAHi
	 73P/XHgDpSUyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A1748145A;
	Wed,  7 Jan 2026 18:01:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC5AA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F43B40A41
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGZu7FAnN-RP for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0844340981
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0844340981
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 076AC873D4; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 17:32:52 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b9238d89a4e732f3bd4abd6918ebacdc29070998
X-Git-Newrev: 45e06e7e5721334ebf378f4e587fc85acc8c1afb
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.076AC873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mesa3d: add
 missing dependencies for imagination driver
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=45e06e7e5721334ebf378f4e587fc85acc8c1afb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The build of the following basic configuration enabling the
imagination Vulkan driver

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION=y

fails with:

meson.build:847:3: ERROR: Feature llvm cannot be disabled: CLC requires LLVM

Adding just LLVM as a dependency is not enough, as then libclc is
needed, then LLVMSPIRVLib, then clangBasic, then the pco_clc tool.

In fact, like the Panfrost driver, building the Imagination driver
requires building host tools using host-mesa3d. To fix this we:

- Make the BR2_PACKAGE_MESA3D_OPENCL option selectable

- Make sure that BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION depends
  on BR2_PACKAGE_MESA3D_LLVM and select
  BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER (the latter being needed to
  build host-mesa3d)

- Make sure the host-mesa3d builds imagination
  tools (-Dtools=imagination) and install
  pco_clc (HOST_MESA3D_INSTALL_PCO_CLC). This requires introducing
  HOST_MESA3D_TOOLS as a list of tools to build, which then gets used
  to construct the -Dtools argument, as we can now have both
  "panfrost" and "imagination" in this list.

With all this, the defconfig above builds successfully.

This has been broken since Buildroot commit
5e818c16a31a902ec29a250f920f43c76e2d9868, which introduced the vulkan
driver support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e1d159c5d5dc00233c74a2bc24994bc194e4e177)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mesa3d/Config.in |  6 ++++++
 package/mesa3d/mesa3d.mk | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d2003fce42..0b5d883bd1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -58,6 +58,7 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
 		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
 		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
 		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
 	select BR2_PACKAGE_LLVM_RTTI
@@ -354,10 +355,15 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver (experimental)"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan imagination driver.
 
+comment "imagination vulkan needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5305ea2de1..6bcaf226ae 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -284,10 +284,19 @@ else
 MESA3D_CONF_OPTS += -Dglvnd=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+HOST_MESA3D_TOOLS += panfrost
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
+HOST_MESA3D_TOOLS += imagination
+endif
+
 HOST_MESA3D_CONF_OPTS = \
 	-Dglvnd=disabled \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
 	-Dgallium-vdpau=disabled \
+	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
 	-Dinstall-mesa-clc=true \
 	-Dmesa-clc=enabled \
 	-Dplatforms= \
@@ -295,10 +304,6 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dglx=disabled \
 	-Dvulkan-drivers=""
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
-HOST_MESA3D_CONF_OPTS += -Dtools=panfrost
-endif
-
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
@@ -311,10 +316,16 @@ HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/panfrost/clc/panfrost_compile $(HOST_DIR)/bin/panfrost_compile
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION),y)
+HOST_MESA3D_INSTALL_PCO_CLC = \
+	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/imagination/pco/uscgen/pco_clc $(HOST_DIR)/bin/pco_clc
+endif
+
 define HOST_MESA3D_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/clc/mesa_clc $(HOST_DIR)/bin/mesa_clc
 	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/compiler/spirv/vtn_bindgen2 $(HOST_DIR)/bin/vtn_bindgen2
 	$(HOST_MESA3D_INSTALL_PANFROST_COMPILE)
+	$(HOST_MESA3D_INSTALL_PCO_CLC)
 endef
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
