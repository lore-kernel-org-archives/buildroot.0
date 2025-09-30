Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66989CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38FB541522;
	Wed,  1 Oct 2025 21:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lo2tHE_S3lPN; Wed,  1 Oct 2025 21:00:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD1041515
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD1041515;
	Wed,  1 Oct 2025 21:00:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0349572
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01E07614D4
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptUC1oRkksqe for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591E8614CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 591E8614CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56E028131F; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:31:58 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 713f7c47f8b893d3779543cba44d702dcd6b23ba
X-Git-Newrev: d747b7aae11475d16424013c58ac7d2ba5d934d4
X-Patchwork-Hint: ignore
Message-Id: <20251001210011.56E028131F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] boot/xilinx-prebuilt: add
 support for plmfw.elf filename
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d747b7aae11475d16424013c58ac7d2ba5d934d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

AMD / Xilinx has made the decision to change the name of plm.elf to plmfw.elf
in the prebuilt binaries repo starting with the next update.

This patch updates the xilinx-prebuilt package to support either the old
plm.elf filename or the new plmfw.elf filename.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6f435187c6a9c5d847003e40c584c82a5db61dfd)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 62b60b88fa..5d984c4f82 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -28,7 +28,8 @@ XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAM
 
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
-XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm*.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
 # AMD Vivado Design Suite currently generates a file named psm_fw.elf.
 # Future versions of AMD Vivado will generate a file named psmfw.elf,
@@ -60,7 +61,8 @@ define XILINX_PREBUILT_INSTALL_VERSAL_XSA_PLD_PDI
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_PLD_PDI
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
-XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm*.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 # We need the *.pdi glob, because the file has different names for the
 # different boards, and it has to be named boot.pdi when installed.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
