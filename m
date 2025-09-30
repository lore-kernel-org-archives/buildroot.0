Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD76CCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208CA41411;
	Wed,  1 Oct 2025 20:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xotodWNCKjV; Wed,  1 Oct 2025 20:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2376341419
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2376341419;
	Wed,  1 Oct 2025 20:02:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BABC8ED
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F341841201
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_QK1Y01usNY for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C18EC411FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C18EC411FC
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFA158668C; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:05:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 151a96a20f8faa7e4e87c1dce7f00cc15db29863
X-Git-Newrev: fdfd0486c5859faca6a88ec8c9869473bc867e19
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.BFA158668C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/xilinx-prebuilt: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdfd0486c5859faca6a88ec8c9869473bc867e19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index d0817d3cc7..0be4f0aabe 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -32,7 +32,8 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 # different boards, but there is only one, and it has to be named
 # vpl_gen_fixed.pdi when installed.
 ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
-XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm*.elf
 # Unlike the psmfw.elf file for Xilinx development boards,
 # AMD Vivado Design Suite currently generates a file named psm_fw.elf.
 # Future versions of AMD Vivado will generate a file named psmfw.elf,
@@ -41,7 +42,8 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
 XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
 XILINX_PREBUILT_PDI = $(@D)/*.pdi
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
-XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm.elf
+# Supports either plm.elf or plmfw.elf filenames
+XILINX_PREBUILT_PLM = $(XILINX_PREBUILT_BOARD_DIR)/plm*.elf
 XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
