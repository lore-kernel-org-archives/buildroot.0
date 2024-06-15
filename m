Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F8DC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 21:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6904481182;
	Sat, 15 Jun 2024 21:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6HZDvJ33FCz; Sat, 15 Jun 2024 21:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109738113C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109738113C;
	Sat, 15 Jun 2024 21:19:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6E391BF2F8
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0CB940675
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qP6NJDyv6AR4 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 21:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C286A40666
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C286A40666
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 21:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8A51874EC; Sat, 15 Jun 2024 21:19:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 23:09:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6648ad8dacc4d40ead5e54aeb5be9969b1e8529
X-Git-Newrev: 35a4ec05533b97bdff48a6f2c07e4b8bb1074467
X-Patchwork-Hint: ignore
Message-Id: <20240615211915.B8A51874EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot.mk: new zynqmp pmufw prebuilt
 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=35a4ec05533b97bdff48a6f2c07e4b8bb1074467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option will enable u-boot to
use the xilinx-prebuilt package for downloading a pmufw.elf that gets included
in the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr:
  - add 'custom' to prompt for BR2_TARGET_UBOOT_ZYNQMP_PMUFW
  - fix checkpackage
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 16 +++++++++++++++-
 boot/uboot/uboot.mk  |  9 ++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d0901edc9d..f37040a28a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -512,9 +512,23 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	bool "xilinx-prebuilt pmufw.elf"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
+	help
+	  Use xilinx-prebuilt boot package for downloading prebuilt
+	  zynqmp pmufw.elf from
+	    https://github.com/Xilinx/soc-prebuilt-firmware repo.
+
+	  U-Boot build process will generate a boot.bin (to be loaded by
+	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
+	  PMU firmware in the Xilinx-specific boot format.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
-	string "PMU firmware location"
+	string "Custom PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	help
 	  Location of a PMU firmware binary.
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b9f165f041..19f4cdb557 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -436,6 +436,10 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT),y)
+UBOOT_DEPENDENCIES += xilinx-prebuilt
+UBOOT_ZYNQMP_PMUFW_PATH = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
@@ -444,7 +448,10 @@ BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
 UBOOT_ZYNQMP_PMUFW_PATH = $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))
 else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
 UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
-endif
+endif #ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
+
+endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+
 UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
 
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
