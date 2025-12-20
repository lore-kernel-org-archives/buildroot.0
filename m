Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAF9E668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E2C6084B;
	Sat, 20 Dec 2025 15:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofNr0sDZ1cvv; Sat, 20 Dec 2025 15:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD03060DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766245514;
	bh=xuqP7SDpxZLiQGZ77vfWqfHseXPLLAWBqKbwWuw/wnQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LJ5HcBjHM0RjqZoRxt78BLxoCWr6k5IKEuLKVRfYxKFqsx5BN9bREpF63Xny0+5Iv
	 Yr3QqtoExsimplmYIIj4fM2cHCGsPBpKxXkqjcG1yuegcw9vA8bOmkzk4zoc4Ilr4d
	 Tq82RWd26aPNAA14GTJTNziRH85uuzbsVorwDaiipNE1I+4GMdOg5e0e3bZhURfVI0
	 DKp14eYeyIZSKxV3z2ZyRwNdnHtf83RyidoS/gPrlYvahYsujXR75DWxjMJBrpkTQ9
	 6Pu4PtDTi2gY90CCHCgUZxnxMpzJMZNNeXt3dqeDQjKD5ZRhwTkmx8I721BBhYUqOc
	 FxaGvSSPnp+ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD03060DAD;
	Sat, 20 Dec 2025 15:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 231361A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15C40822AD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qIgu2qbNV2E for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D64822B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D64822B0
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7AB98751A; Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 12:54:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9f030668cbfd11e54164886aa4e6cbb317360f0
X-Git-Newrev: e1d159c5d5dc00233c74a2bc24994bc194e4e177
X-Patchwork-Hint: ignore
Message-Id: <20251220154508.A7AB98751A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add missing dependencies
 for imagination driver
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1d159c5d5dc00233c74a2bc24994bc194e4e177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/mesa3d/Config.in |  6 ++++++
 package/mesa3d/mesa3d.mk | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 89e40d47b1..e1faea95d5 100644
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
@@ -336,10 +337,15 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
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
index c054f7617e..3e48c795c4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -284,9 +284,18 @@ else
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
+	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
 	-Dinstall-mesa-clc=true \
 	-Dmesa-clc=enabled \
 	-Dplatforms= \
@@ -294,10 +303,6 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dglx=disabled \
 	-Dvulkan-drivers=""
 
-ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
-HOST_MESA3D_CONF_OPTS += -Dtools=panfrost
-endif
-
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
@@ -310,10 +315,16 @@ HOST_MESA3D_INSTALL_PANFROST_COMPILE = \
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
