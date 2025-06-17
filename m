Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D05C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08C4880B95;
	Tue, 17 Jun 2025 19:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9Q5vnEikcRj; Tue, 17 Jun 2025 19:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E25680BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E25680BB4;
	Tue, 17 Jun 2025 19:07:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A28BF16B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 944FB60B05
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCqhKLn1eJLn for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE5E60D8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFE5E60D8C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE27783C5D; Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 21:06:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6c559aaeee2d0844ec30a53946ef2bfd7a88cb9
X-Git-Newrev: 4ad9c49ec8a444aa56bc9c9758b69d9147f61e94
X-Patchwork-Hint: ignore
Message-Id: <20250617190744.CE27783C5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp: add custom board
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ad9c49ec8a444aa56bc9c9758b69d9147f61e94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The readme.txt file for zynqmp boards does not have documentation for working
with custom boards.  This patch adds documentation for custom board support.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/zynqmp/readme.txt | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index 3f1b3a80c2..a98ff78f6f 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -65,6 +65,47 @@ Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
 
+Support for other boards:
+=========================
+
+If you want to build a system for other boards based on the same SoC, and the
+board is already supported by the upstream kernel and U-Boot, you simply need
+to change the following Buildroot options:
+
+ - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
+
+Custom psu_init_gpl.c/h support:
+
+To generate a working boot.bin image, psu_init_gpl.c/h are required in
+the U-Boot source tree. Without those files, boot.bin will be built
+successfully but it will not be functional at all. Those files are
+output from the Xilinx tools, but for convenience, U-Boot includes the
+default psu_init_gpl.c/h of popular boards. Those files may need to be
+updated for any programmable logic or DDR customizations which impact
+psu_init (clock/pin setup & mapping/AXI bridge setup/etc). See
+board/xilinx/zynqmp/ directory of U-Boot for natively supported psu_init
+files. If the psu_init files for your board are not found in U-Boot,
+you need to add them by yourself.
+
+1) Start with a defconfig supported by Buildroot (e.g. ZCU106)
+    make zynqmp_zcu106_defconfig
+
+2) make uboot-menuconfig
+    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
+
+    ARM architecture  --->
+       [*] Zynq/ZynqMP PS init file(s) location
+
+3) Copy psu_init_gpl.c/h generated by the Xilinx Vivado tools into
+   output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/
+
+4) make
+
+Note: The files in step 3 will need to be re-copied after cleaning the
+output directory and at this time, there is no way to save them as
+part of the buildroot configuration, except as a U-Boot patch.
+
 ==============
 Important Note
 ==============
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
