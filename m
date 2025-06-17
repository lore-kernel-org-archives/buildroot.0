Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E0C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E1F40569;
	Tue, 17 Jun 2025 19:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHb7MmHi3kwc; Tue, 17 Jun 2025 19:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E877404EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E877404EE;
	Tue, 17 Jun 2025 19:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5D0ED8B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97C38413D5
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6LgiNnz7mXs for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B2A40614
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0B2A40614
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDB6483C5A; Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 21:06:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1ed04aa0bab16aea022a3f55bf61adbce3e24e0
X-Git-Newrev: c6c559aaeee2d0844ec30a53946ef2bfd7a88cb9
X-Patchwork-Hint: ignore
Message-Id: <20250617190744.BDB6483C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynq: update custom board
 documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6c559aaeee2d0844ec30a53946ef2bfd7a88cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The readme.txt file for zynq boards has some outdated information for the
custom board section.  The custom ps7_init_gpl.c is now defined by
CONFIG_XILINX_PS_INIT_FILE and Buildroot always puts the Xilinx u-boot builds
in the output/build/uboot-custom directory.

This patch updates the instructions in the readme.txt file accordingly.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/zynq/readme.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index b2a4cefedd..87df7236f0 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -62,7 +62,7 @@ the U-Boot source tree. Without those files, boot.bin will be built
 successfully but it will not be functional at all. Those files are
 output from the Xilinx tools, but for convenience, U-Boot includes the
 default ps7_init_gpl.c/h of popular boards. Those files may need to be
-updated for any programmable logic customizations which impact
+updated for any programmable logic or DDR customizations which impact
 ps7_init (clock/pin setup & mapping/AXI bridge setup/etc). See
 board/xilinx/zynq/ directory of U-Boot for natively supported ps7_init
 files. If the ps7_init files for your board are not found in U-Boot,
@@ -72,13 +72,13 @@ you need to add them by yourself.
     make zynq_zed_defconfig
 
 2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_ZYNQ_CUSTOM_INIT.
+    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
 
     ARM architecture  --->
-       [*] Use custom ps7_init provided by Xilinx tool
+       [*] Zynq/ZynqMP PS init file(s) location
 
-3) Copy ps7_init_gpl.c/h generated by the Xilinx tools into
-   output/build/uboot-xilinx-<pkg version>/board/xilinx/zynq/custom_hw_platform/
+3) Copy ps7_init_gpl.c/h generated by the Xilinx Vivado tools into
+   output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
 
 4) make
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
