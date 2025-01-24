Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF215C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B8F17047C;
	Fri, 28 Feb 2025 17:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgllbWyOY5gw; Fri, 28 Feb 2025 17:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C0C7086D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C0C7086D;
	Fri, 28 Feb 2025 17:03:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17E5268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EABC49B86
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFlpHZAC2-Xn for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F699426C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F699426C0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C5AF867B4; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 19:24:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1cbd22215010660116263ccb8f666ec6dfd601cd
X-Git-Newrev: a5b360e53f864ac10f9a93182f89c8b2bde2797c
X-Patchwork-Hint: ignore
Message-Id: <20250228163017.8C5AF867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/uboot.mk: new zynqmp
 pmufw embeddedsw option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5b360e53f864ac10f9a93182f89c8b2bde2797c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option will enable u-boot to
use the xilinx-embeddedsw package for building a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw from a
custom location will be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Luca: Tested on Kria KV260 starter kit]
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in | 44 ++++++++++++++++++++++++++++++++++++++------
 boot/uboot/uboot.mk  |  5 ++++-
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b6ac2f9380..13d45140eb 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -572,23 +572,55 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
-config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
-	bool "xilinx-prebuilt pmufw.elf"
+choice
+	prompt "PMUFW origin"
+	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	help
+	  Choose between the following options:
+	  1) Build from source via xilinx-embeddedsw
+	  2) Official prebuilt via xilinx-prebuilt
+	  3) Prebuilt from custom location
+
+	  U-Boot build process will generate a boot.bin (to be loaded
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and
+	  the PMU firmware in the Xilinx-specific boot format.
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
+	bool "Build from source via xilinx-embeddedsw"
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+	help
+	  Use xilinx-embeddedsw boot package for building
+	  zynqmp pmufw.elf from
+	    https://github.com/Xilinx/embeddedsw repo.
+
+comment "To build from source, xilinx-embeddedsw needs to be enabled with zynqmp_pmufw option."
+	depends on !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	bool "Prebuilt via xilinx-prebuilt"
 	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
 	help
 	  Use xilinx-prebuilt boot package for downloading prebuilt
 	  zynqmp pmufw.elf from
 	    https://github.com/Xilinx/soc-prebuilt-firmware repo.
 
-	  U-Boot build process will generate a boot.bin (to be loaded by
-	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
-	  PMU firmware in the Xilinx-specific boot format.
+comment "To use official prebuilt, xilinx-prebuilt needs to be enabled with zynqmp or kria option."
+	depends on !BR2_TARGET_XILINX_PREBUILT_KRIA
+	depends on !BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
+	bool "Prebuilt from custom location"
+	help
+	  Location of a PMU firmware binary defined by:
+	  BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+
+endchoice # PMUFW origin
 
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	string "Custom PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
-	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	depends on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_CUSTOM
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b3094029e7..cb745413e4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -453,7 +453,10 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
-ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW),y)
+UBOOT_DEPENDENCIES += xilinx-embeddedsw
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
 UBOOT_DEPENDENCIES += xilinx-prebuilt
 UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
