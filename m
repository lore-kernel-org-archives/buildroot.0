Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C487C7115B
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4153880E51;
	Tue, 17 Jun 2025 19:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZxl4HjJF4pS; Tue, 17 Jun 2025 19:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA1180EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA1180EC4;
	Tue, 17 Jun 2025 19:07:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9381F16B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B2F40614
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92G5TGHUcuSt for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C45F240340
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C45F240340
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB8C783C57; Tue, 17 Jun 2025 19:07:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 21:06:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98cf601d0f2d4881c298e3f8c5fc2957e29ad369
X-Git-Newrev: c1ed04aa0bab16aea022a3f55bf61adbce3e24e0
X-Patchwork-Hint: ignore
Message-Id: <20250617190744.AB8C783C57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal: add custom board
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1ed04aa0bab16aea022a3f55bf61adbce3e24e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The readme.txt file for versal boards does not have documentation for working
with custom boards.  This patch adds documentation for custom board support.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/versal/readme.txt | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 4d8406fb1f..cd308a1226 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -60,3 +60,49 @@ card:
 Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
+
+Support for other boards:
+=========================
+
+If you want to build a system for other boards based on the same SoC, and the
+board is already supported by the upstream kernel, U-Boot, and
+xilinx-prebuilt, you simply need to change the following Buildroot options:
+
+ - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
+ - xilinx-prebuilt (BR2_TARGET_XILINX_PREBUILT_BOARD)
+
+Custom versal board support:
+
+To generate a boot.bin image, Versal boards require a PDI (Programmable Device
+Image) generated by Xilinx Vivado which contains all the hardware specific
+boot information, such as clock, MIO and DDR initializations as well as any
+customizations in the programmable logic. Since this PDI can only be generated
+by Xilinx Vivado, Buildroot needs access to the prebuilt image. The Buildroot
+xilinx-prebuilt package has support for Versal XSA files exported from Xilinx
+Vivado.
+
+Using the option BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA, Buildroot can obtain
+the prebuilt PDI from the XSA file.
+
+1) Start with a defconfig supported by Buildroot (e.g. VCK190)
+    make versal_vck190_defconfig
+
+2) make menuconfig
+    Visit the following menu and enable BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            [*] download a prebuilt Versal XSA
+
+3) Within the same menuconfig, configure location of XSA. It can be in the
+   local file system or downloadable from an https:// location.
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            (<path to XSA>) URL of custom XSA
+
+4) make
+
+The resulting output/images will contain a boot.bin that includes the custom
+PDI file extracted from the Xilinx Vivado exported XSA file.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
