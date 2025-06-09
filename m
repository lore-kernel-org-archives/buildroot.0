Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A78C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 19:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CB141D96;
	Mon,  9 Jun 2025 19:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McGDASshWQjs; Mon,  9 Jun 2025 19:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73D2341DAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D2341DAD;
	Mon,  9 Jun 2025 19:50:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E331A4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82AB84002D
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LesKFGGXb8DX for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C094540071
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C094540071
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B000987B05; Mon,  9 Jun 2025 19:50:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 19:02:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0a92928dbbfa17e054208c6156e65b70ac5380b
X-Git-Newrev: 3ee8569037b278ea9d19b9a22a9fc7aab964b0d2
X-Patchwork-Hint: ignore
Message-Id: <20250609195051.B000987B05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/versal: change pdi
 filename to boot.pdi
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ee8569037b278ea9d19b9a22a9fc7aab964b0d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the Segmented Configuration, the Versal PDI files will have new names:
<design>_boot.pdi - Minimal DDR and PS config for booting
<design>_pld.pdi - Remainder of FPGA design to be loaded at run-time

Since this will be the new default, this patch aligns the Buildroot file
naming by replacing the obscure vpl_gen_fixed.pdi filename with a simpler
boot.pdi filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/versal/post-image.sh              | 2 +-
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 22367d5028..b5ce2e3f0c 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -17,7 +17,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
 	  image {
-	    { type=bootimage, file=${BINARIES_DIR}/vpl_gen_fixed.pdi }
+	    { type=bootimage, file=${BINARIES_DIR}/boot.pdi }
 	    { type=bootloader, file=${BINARIES_DIR}/plm.elf }
 	    { core=psm, file=${BINARIES_DIR}/psmfw.elf }
 	  }
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 4d1dfc5ca0..05dc9aebe8 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -37,7 +37,7 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 # psm*fw.elf is used.
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "_boot.pdi" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
@@ -46,13 +46,13 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
 			$(@D)/*_boot.pdi, \
 			$(@D)/*.pdi \
 		) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+		$(BINARIES_DIR)/boot.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
-# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
+# different boards, and it has to be named boot.pdi when installed.
 # If Segmented Configuration is used, there will be two pdi files and we need
 # the file that has "_boot.pdi" in the filename.
 define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
@@ -61,7 +61,7 @@ define XILINX_PREBUILT_INSTALL_VERSAL_BOOT_PDI
 			$(XILINX_PREBUILT_BOARD_DIR)/*_boot.pdi, \
 			$(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
 		) \
-		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+		$(BINARIES_DIR)/boot.pdi
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
