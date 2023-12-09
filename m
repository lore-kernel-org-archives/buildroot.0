Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118E1C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 17:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B643F42577;
	Sat,  9 Dec 2023 17:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B643F42577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjNGwZIezZZY; Sat,  9 Dec 2023 17:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BAF41969;
	Sat,  9 Dec 2023 17:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08BAF41969
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA801BF20D
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 17:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1440A60FAE
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 17:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1440A60FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMrqUGEau34g for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 17:36:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 346AA60FB2
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 17:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 346AA60FB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22E44878FB; Sat,  9 Dec 2023 17:36:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 18:35:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f3261bca9f34061653433d2a0f98d3311494b49
X-Git-Newrev: 9675f6150cf01dfe0dc7a862a794b93e4caea840
X-Patchwork-Hint: ignore
Message-Id: <20231209173632.22E44878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynq/readme.txt: update doc for zc702
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

commit: https://git.buildroot.net/buildroot/commit/?id=9675f6150cf01dfe0dc7a862a794b93e4caea840
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the zynq readme.txt to add documentation for the zc702 and correct
documentation that was no longer up to date.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynq/readme.txt | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index 162734963a..b2a4cefedd 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -1,7 +1,8 @@
 This is the Buildroot support for Zynq boards.  Zynq boards are available from
 Xilinx and some third party vendors, but the build procedure is very similar.
 
-Currently, three boards are natively supported by Buildroot:
+Currently, four boards are natively supported by Buildroot:
+ - Xilinx ZC702 board (zynq_zc702_defconfig)
  - Xilinx ZC706 board (zynq_zc706_defconfig)
  - Avnet ZedBoard (zynq_zed_defconfig)
  - Avnet MicroZed (zynq_microzed_defconfig)
@@ -9,6 +10,7 @@ Currently, three boards are natively supported by Buildroot:
 Steps to create a working system for a Zynq board:
 
 1) Configuration (do one of the following)
+    make zynq_zc702_defconfig     (ZC702)
     make zynq_zc706_defconfig     (ZC706)
     make zynq_zed_defconfig       (Zedboard)
     make zynq_microzed_defconfig  (MicroZed)
@@ -31,12 +33,11 @@ kernel_image=myimage
 modeboot=myboot
 myboot=...
 
-Note:
-The DTB for MicroZed is the same as the one for the Zedboard (zynq-zed.dtb),
-and this is the recommended solution, see
-https://forums.xilinx.com/t5/Embedded-Linux/Microzed-default-device-tree-dts/td-p/432856.
-
 References:
+ - ZC702 information including schematics, reference designs, and manuals are
+   available from
+   https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html
+
  - ZC706 information including schematics, reference designs, and manuals are
    available from
    http://www.xilinx.com/products/boards-and-kits/ek-z7-zc706-g.html.
@@ -52,7 +53,7 @@ the upstream kernel and U-Boot, you simply need to change the
 following Buildroot options:
 
  - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
- - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_DEFCONFIG)
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
 
 Custom ps7_init_gpl.c/h support:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
