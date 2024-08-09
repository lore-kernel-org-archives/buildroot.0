Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A67CC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A0A80B2A;
	Fri,  9 Aug 2024 22:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfGo0u-haqs9; Fri,  9 Aug 2024 22:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6728C80B5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6728C80B5D;
	Fri,  9 Aug 2024 22:00:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6C691BF286
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A8C80B5D
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mY7GgKX9Ohht for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD09C80B2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD09C80B2A
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B787184F7A; Fri,  9 Aug 2024 22:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 23:59:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32161a3c4e0c238e0e44ccfcadffc62f72f5c4e4
X-Git-Newrev: 33557477c06bbbb24754210b7606c186f1e8a31e
X-Patchwork-Hint: ignore
Message-Id: <20240809220011.B787184F7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_zcu106_defconfig: move to
 board rev1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33557477c06bbbb24754210b7606c186f1e8a31e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate the zynqmp_zcu106_defconfig to rev1.0 ddr memory, since all new boards
will be using the rev1.0 ddr memory.

This patch also adds documentation in the board/zynqmp/readme.txt explaining
the issue related to the change in ddr memory.  Should users not see anything
printing from the board during boot, the most likely issue is that the board
has the original ddr memory and the u-boot device tree needs to be configured
accordingly to revA.

Original DDR Memory:
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"

More information regarding this issue can be found here:
https://support.xilinx.com/s/article/71961?language=en_US

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynqmp/readme.txt         | 26 ++++++++++++++++++++++++++
 configs/zynqmp_zcu106_defconfig |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index 3a8a9b03ac..3f1b3a80c2 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -64,3 +64,29 @@ card:
 Where 'sdX' is the device node of the SD.
 
 Eject the SD card, insert it in the board, and power it up.
+
+==============
+Important Note
+==============
+
+The DDR memory on the original ZCU102 and ZCU106 boards is EOL.
+The Buildroot defconfigs for these boards use the new DDR memory
+which is configured by the u-boot spl initialization with the
+Buildroot config options below.
+
+New DDR Memories:
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
+
+If nothing is printing upon boot, most likely it is because the
+board has the original DDR memories.  To fix the problem, modify
+the Buildroot defconfig file to use the u-boot spl initialization
+for the original DDR memory using the config below for the target
+board.
+
+Original DDR Memories:
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-revA"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
+
+For more information on this issue:
+https://support.xilinx.com/s/article/71961?language=en_US
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index c10ec70ed8..970ed40d2c 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
