Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D24CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 12:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D6C60839;
	Mon,  2 Sep 2024 12:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWAdbJT86INq; Mon,  2 Sep 2024 12:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D865E6082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D865E6082E;
	Mon,  2 Sep 2024 12:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E105E1BF40F
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49FB84060E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 12:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0IY7FPJXvVA for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 12:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3568940131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3568940131
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 12:08:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F13B869AD; Mon,  2 Sep 2024 12:08:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 14:02:29 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: d5fb36257b0e1b507c627b5c4f0e026d70584e44
X-Git-Newrev: f10881b5b08784c4b31f1f2a49af99173e5b6a00
X-Patchwork-Hint: ignore
Message-Id: <20240902120806.1F13B869AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x]
 board/udoo/neo/readme.txt: provide more details
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
Content-Type: multipart/mixed; boundary="===============3209724659102721601=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3209724659102721601==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f10881b5b08784c4b31f1f2a49af99173e5b6a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This patch adds more information to the Udoo Neo's readme, e.g., UART
pins and baudrate.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 008e37b3aeb304919a3eb4d1c47b2b4d49ec49db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/udoo/neo/readme.txt | 54 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/board/udoo/neo/readme.txt b/board/udoo/neo/readme.txt
index 94ebcc12f2..e9f9fbac1c 100644
--- a/board/udoo/neo/readme.txt
+++ b/board/udoo/neo/readme.txt
@@ -1,12 +1,36 @@
 MX6X Udoo Neo board
-
+===================
 http://www.udoo.org/udoo-neo/
 
+Build:
+======
+
 To build a minimal support for these boards:
 
     $ make mx6sx_udoo_neo_defconfig
     $ make
 
+Files created in the output directory:
+======================================
+
+output/images
+.
+├── boot.scr
+├── imx6sx-udoo-neo-basic.dtb
+├── imx6sx-udoo-neo-extended.dtb
+├── imx6sx-udoo-neo-full.dtb
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── SPL
+├── u-boot.bin
+├── u-boot.img
+└── zImage
+
+Creating bootable SD card:
+==========================
+
 Buildroot prepares a bootable "sdcard.img" image in the output/images/
 directory, ready to be dumped on an SD card:
 
@@ -14,3 +38,31 @@ dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 For details about the medium image layout, see the definition in
 board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl.
+
+Booting:
+========
+
+Serial console:
+---------------
+The Udoo Neo features the serial console "UART1" on the pin header "P7". The
+Uart pins are as follows (see board labels):
+
+pin 46: rx
+pin 47: tx
+
+Baudrate for this board is 115200.
+
+Login:
+------
+Enter 'root' as login user, and the prompt is ready.
+
+Documentation:
+==============
+
+documentation link:
+-------------------
+https://www.udoo.org/docs-neo/Introduction/Introduction.html
+
+forum link:
+-----------
+https://www.udoo.org/forum/forums/udoo-neo.39/

--===============3209724659102721601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3209724659102721601==--
