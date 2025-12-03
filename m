Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE71D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9338583F97;
	Fri, 12 Dec 2025 07:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsvYuWnHyrlL; Fri, 12 Dec 2025 07:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0613F83ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526258;
	bh=jWGcI/rK8d7JXMo8XcTztj6oWwisB83L8+X44FVFBSk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qkf3ClMNtnjmOlTW/SWTp/Qd/QKwowoL0CTYWQTBLwREUJmRREHFzO7SYj2dEendi
	 cxRj71x4QVYJFiWt7rwaMlhzGwFGxZ7g9vuB3bhP3ZUjC8U2lRqA3lhDoDojmSvdd+
	 CsDN9+NOdake05ULeihEr5A+Gk60451/X0xstbncVGj3B3JQNk+mRIP30rLyfAEwZy
	 8+20vu6L3VkANIRPdPOBkII+iws4/yJy4CKPRI0XyrMvM2ytZtSqJU6hmYxFSs1Ktv
	 oObGNKGEos1T+tOZEwMBfGOiE31J7LkHBZaLPhAfNj2y/kcsrbvSQsrI2OY4Fvf1zy
	 zE3BYsNSJHGxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0613F83ED6;
	Fri, 12 Dec 2025 07:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C442C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C0F41160
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8-jtCv0GYw8 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E6D41109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4E6D41109
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3FCD86C93; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 19:27:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f42fc940e9df62fdd47f9adb8ccb374886e812ce
X-Git-Newrev: c7d703b2025b5731e5d0b9334dfd9410070c5865
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.B3FCD86C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-embeddedsw: add versal2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7d703b2025b5731e5d0b9334dfd9410070c5865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for Xilinx versal2 devices which include two new applications
for the xilinx-embeddedsw package.

BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
There is a new PLM (platform loader and manager) application for versal2
devices. The purpose of the PLM is to act as the bootloader for loading the
boot.pdi to configure the DDR memory and then loading arm-trusted-firmware and
u-boot on the Cortex-A78 core 0.

BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW
Included with versal2 devices is a risc-v based security accelerator called
the ASU (application security unit). The ASUFW is the open-source application
which runs on the ASU.

Versal2 devices simplified the boot process by getting rid of the second
microblaze core called the PSM (processor system manager). There is thus no
longer a need for a separate psmfw application like with the original versal
devices, as this functionality is now fully included in the new PLM for
versal2.

For more information about the Xilinx Versal Gen2 series:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/ai-edge-series.html
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/prime-series.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/Config.in                              |  2 +-
 boot/xilinx-embeddedsw/Config.in            | 23 ++++++++++++++++++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 36 +++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/boot/Config.in b/boot/Config.in
index 08a6c8353d..d3e1b9c055 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -4,7 +4,7 @@ config BR2_TARGET_XILINX_FIRMWARE_ARCH_SUPPORTS
 	# All Xilinx SoCs using this package are aarch64 only
 	depends on BR2_aarch64
 	# only CPUs with corresponding firmwares:
-	depends on BR2_cortex_a53 || BR2_cortex_a72
+	depends on BR2_cortex_a53 || BR2_cortex_a72 || BR2_cortex_a78
 
 menu "Bootloaders"
 
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 526c7adf07..674238fd0a 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,5 +1,6 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf riscv32-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
@@ -26,6 +27,28 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
 	  Release version of Xilinx/embeddedsw.
 	  Must be xilinx_v2023.1 or newer.
 
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW
+	bool "versal2 asufw"
+	depends on BR2_cortex_a78
+	help
+	  Build versal2 asufw application from Xilinx/embeddedsw
+	  repo.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/asufw
+	  Version must be xilinx_v2025.2 or newer.
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
+	bool "versal2 plm"
+	depends on BR2_cortex_a78
+	help
+	  Build versal2 plm application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the plm.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm
+	  Version must be xilinx_v2025.2 or newer.
+
 config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
 	bool "versal plm"
 	depends on BR2_cortex_a72
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index abcfee255d..5fb442ee2a 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -30,6 +30,38 @@ XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS = \
 	"-Os -flto -ffat-lto-objects $(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS)"
 
 XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
+XILINX_EMBEDDEDSW_ASUFW_CFLAGS = "-O2 -ffat-lto-objects -fno-lto"
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL2_ASUFW
+	$(MAKE) -C $(@D)/lib/sw_apps/asufw/src \
+		COMPILER=$(HOST_DIR)/bin/riscv32-buildroot-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/riscv32-buildroot-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/riscv32-buildroot-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_ASUFW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL2_ASUFW
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/asufw/src/asufw.elf \
+		$(BINARIES_DIR)/asufw.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL2_PLM
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal_2ve_2vm \
+		COMPILER=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		ARCHIVER=$(XILINX_EMBEDDEDSW_MICROBLAZE_AR) \
+		CC=$(XILINX_EMBEDDEDSW_MICROBLAZE_CC) \
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL2_PLM
+	$(INSTALL) -D -m 0755 \
+		$(@D)/lib/sw_apps/versal_plm/src/versal_2ve_2vm/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
 
 ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
 define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
@@ -77,12 +109,16 @@ endef
 endif # BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 
 define XILINX_EMBEDDEDSW_BUILD_CMDS
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL2_ASUFW)
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL2_PLM)
 	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM)
 	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW)
 	$(XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW)
 endef
 
 define XILINX_EMBEDDEDSW_INSTALL_IMAGES_CMDS
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL2_ASUFW)
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL2_PLM)
 	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PLM)
 	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PSMFW)
 	$(XILINX_EMBEDDEDSW_INSTALL_ZYNQMP_PMUFW)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
