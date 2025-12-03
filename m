Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76979D1BDCC
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 18:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBAE8421B;
	Wed,  3 Dec 2025 18:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewTYrF9Hnnpd; Wed,  3 Dec 2025 18:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E72B84213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764786786;
	bh=mlA+yDkSnfG7EJLQjhJejcv1iM+PHfrqBaSRrwx9abg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O/IEm1Iw2GOAErBJEt97YCXNuUjEg2RDaq1aRzlFEEl6f2TYBthWw96geoU7z/2Uz
	 OuexaeWMBiniDssSviYEZx7vOSiokRX1EXb9hijFYNJmm1NJNsZLkE0lEsetXxZ20U
	 IL5Taq/TOUfphUO6YFYIl/8Uoua7r/l9PtzCcIBjuidAtnXz+tbaNDCN1Y0DuDZlQf
	 JYHckGqPOYA7TKmfA8mft6a/wNifdYOFdHapOn1h9JTv3YZMyQ22ktKUtWHe6ZT54m
	 rGs2+uuMhbiiooCFb2X3JuecQ72R/NmMzIp49OUP/u62Skg3C0CbhsiHvh7usSy+P2
	 Dcsy7noE8vG7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E72B84213;
	Wed,  3 Dec 2025 18:33:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F09111BD
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3FE983EDD
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ue8zQq_marK for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 18:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 930B283EC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 930B283EC9
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:33:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80D8A86450; Wed,  3 Dec 2025 18:33:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 19:27:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7d703b2025b5731e5d0b9334dfd9410070c5865
X-Git-Newrev: 1609e853229553243b4feda455a403a2158e66a2
X-Patchwork-Hint: ignore
Message-Id: <20251203183300.80D8A86450@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-prebuilt: add
 versal2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=1609e853229553243b4feda455a403a2158e66a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support for Xilinx versal2 devices to download the boot.pdi, pld.pdi and
plm.elf files from the Xilinx/soc-prebuilt-firmware repo.

Since the psmfw.elf does not exist for versal2 devices, the installation of
this image has been split out for original versal devices only, whereas the
other images are all common between versal and versal2 device families.

For more information about the Xilinx Versal Gen2 series:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/ai-edge-series.html
https://www.amd.com/en/products/adaptive-socs-and-fpgas/versal/gen2/prime-series.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-prebuilt/Config.in          | 17 +++++++++++++++--
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 26 ++++++++++++++++++--------
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index e742a66ca7..a1e711e6cf 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -26,6 +26,7 @@ choice
 	bool "family variant"
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_PACKAGE_VERSAL_FIRMWARE  # legacy
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_cortex_a72
+	default BR2_TARGET_XILINX_PREBUILT_VERSAL2 if BR2_cortex_a78
 	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
@@ -40,14 +41,21 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL
 	bool "versal"
 	depends on BR2_cortex_a72
 
+config BR2_TARGET_XILINX_PREBUILT_VERSAL2
+	bool "versal2"
+	depends on BR2_cortex_a78
+	help
+	  Version must be xilinx_v2025.2 or newer.
+
 endchoice
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 	bool "download a prebuilt Versal XSA"
-	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL || BR2_TARGET_XILINX_PREBUILT_VERSAL2
 	help
 	  The Xilinx Support Archive (XSA) provides custom Xilinx
 	  firmware files generated by the AMD Vivado Design Suite.
+	  This option applies to either versal or versal2.
 
 	  https://docs.amd.com/r/en-US/ug1400-vitis-embedded/Creating-a-Hardware-Design-XSA-File
 
@@ -64,28 +72,33 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
 	  use a make variable like $(TOPDIR) to reference the root of
 	  the Buildroot tree.
 
+	  This option applies to either versal or versal2.
+
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 config BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 	bool "install versal pld.pdi"
-	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
+	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL || BR2_TARGET_XILINX_PREBUILT_VERSAL2
 	help
 	  When using the Versal Segmented Configuration, there is a
 	  pld.pdi file containing the FPGA bitstream which can be
 	  loaded at run-time.  By enabling this option, the pld.pdi
 	  will be installed to the target /lib/firmware/xilinx dir.
+	  This option applies to either versal or versal2.
 
 config BR2_TARGET_XILINX_PREBUILT_FAMILY
 	string
 	default "zynqmp" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	default "kria" if BR2_TARGET_XILINX_PREBUILT_KRIA
 	default "versal" if BR2_TARGET_XILINX_PREBUILT_VERSAL
+	default "versal_2ve_2vm" if BR2_TARGET_XILINX_PREBUILT_VERSAL2
 
 config BR2_TARGET_XILINX_PREBUILT_BOARD
 	string "board name"
 	default "zcu102" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 	default "kr260" if BR2_TARGET_XILINX_PREBUILT_KRIA
 	default "vck190" if BR2_TARGET_XILINX_PREBUILT_VERSAL
+	default "vek385" if BR2_TARGET_XILINX_PREBUILT_VERSAL2
 	help
 	  Name of Xilinx target board.
 	  Used for installing the appropriate firmware.
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 95b656cdde..6bd16d663a 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -26,16 +26,11 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
 
 XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
 
-ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
+# Common Files for All Versal Families
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL)$(BR2_TARGET_XILINX_PREBUILT_VERSAL2),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 # Supports either plm.elf or plmfw.elf filenames
 XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm*.elf
-# Unlike the psmfw.elf file for Xilinx development boards,
-# AMD Vivado Design Suite currently generates a file named psm_fw.elf.
-# Future versions of AMD Vivado will generate a file named psmfw.elf,
-# so to support current and future AMD Vivado versions, the filename
-# psm*fw.elf is used.
-XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
@@ -63,7 +58,6 @@ endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 # Supports either plm.elf or plmfw.elf filenames
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm*.elf
-XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
@@ -91,11 +85,27 @@ endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM),y)
 define XILINX_PREBUILT_INSTALL_VERSAL_PLM
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PLM) \
 		$(BINARIES_DIR)/plm.elf
 endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL | BR2_TARGET_XILINX_PREBUILT_VERSAL2
+
+# Files specific to Versal Gen1
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
+# Unlike the psmfw.elf file for Xilinx development boards,
+# AMD Vivado Design Suite currently generates a file named psm_fw.elf.
+# Future versions of AMD Vivado will generate a file named psmfw.elf,
+# so to support current and future AMD Vivado versions, the filename
+# psm*fw.elf is used.
+XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
+else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
 define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
