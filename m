Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93166C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 11:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4435060EC2;
	Sun, 20 Jul 2025 11:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxaOUWh7x-cM; Sun, 20 Jul 2025 11:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D816108F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D816108F;
	Sun, 20 Jul 2025 11:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA0E22F
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C92B40099
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ux1dVqJ1fHV for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 11:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601CE40093
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 601CE40093
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:26:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B99B83ACB; Sun, 20 Jul 2025 11:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:25:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90aa3e120d1ee2829deb2bc7cc538e37d0bfad14
X-Git-Newrev: c52d711923d6e8bab0618e043fa0261457cb76b9
X-Patchwork-Hint: ignore
Message-Id: <20250720112605.4B99B83ACB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp: update custom board
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c52d711923d6e8bab0618e043fa0261457cb76b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the zynqmp readme.txt file to use BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
option for configuring custom zynqmp boards with Buildroot.  There is no need
for any custom / manual steps since the support is included with Buildroot.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/zynqmp/readme.txt | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index a98ff78f6f..242c643480 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -86,25 +86,19 @@ updated for any programmable logic or DDR customizations which impact
 psu_init (clock/pin setup & mapping/AXI bridge setup/etc). See
 board/xilinx/zynqmp/ directory of U-Boot for natively supported psu_init
 files. If the psu_init files for your board are not found in U-Boot,
-you need to add them by yourself.
+you need to add them using BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE.
 
 1) Start with a defconfig supported by Buildroot (e.g. ZCU106)
     make zynqmp_zcu106_defconfig
 
-2) make uboot-menuconfig
-    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
+2) make menuconfig
+    Visit the following menu to configure BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 
-    ARM architecture  --->
-       [*] Zynq/ZynqMP PS init file(s) location
+    Bootloaders  --->
+       U-Boot  --->
+          (<Path to psu_init_gpl.c>) Custom psu_init_gpl file
 
-3) Copy psu_init_gpl.c/h generated by the Xilinx Vivado tools into
-   output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/
-
-4) make
-
-Note: The files in step 3 will need to be re-copied after cleaning the
-output directory and at this time, there is no way to save them as
-part of the buildroot configuration, except as a U-Boot patch.
+3) make
 
 ==============
 Important Note
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
