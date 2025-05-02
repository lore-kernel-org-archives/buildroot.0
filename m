Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DFDC3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF9208404A;
	Fri,  2 May 2025 11:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8VU0TLcFAwM; Fri,  2 May 2025 11:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C19F88404E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C19F88404E;
	Fri,  2 May 2025 11:12:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F491229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21591419E7
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yADX_TWOAJLz for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 131CA419D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131CA419D4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 112DA860E9; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:11:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fa460ee87336b692a7b1fa4582326bfc15a7c6c2
X-Git-Newrev: fa0ee12fcc20a63fb3f8ee2f462d14a41ccab086
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.112DA860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/raspberrypi5:
 install Raspberry Pi 500 device-tree blob
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3371826958247536673=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3371826958247536673==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fa0ee12fcc20a63fb3f8ee2f462d14a41ccab086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This installs the device-tree blob for the Raspberry Pi 500.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ace394e91143dfb9d069eaff878e7db3170e36b2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/raspberrypi/readme.txt   | 4 +++-
 configs/raspberrypi5_defconfig | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index a110934ec1..47814736bd 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -19,6 +19,7 @@ These instructions apply to all models of the Raspberry Pi:
   - the model CM4 (aka Raspberry Pi Compute Module 4 and IO Board).
   - the model CM4s (aka Raspberry Pi Compute Module 4s).
   - the model B5 (aka Raspberry Pi 5).
+  - the model 500 (aka Raspberry Pi 500).
 
 How to build it
 ===============
@@ -77,7 +78,7 @@ or for CM4 (on IO Board - 64 bit):
 
   $ make raspberrypicm4io_64_defconfig
 
-For model 5 B:
+For model 5 B and 500:
 
   $ make raspberrypi5_defconfig
 
@@ -117,6 +118,7 @@ After building, you should obtain this tree:
     +-- bcm2711-rpi-cm4s.dtb        [1]
     +-- bcm2712-rpi-5-b.dtb         [1]
     +-- bcm2712d0-rpi-5-b.dtb       [1]
+    +-- bcm2712-rpi-500.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 8cbd533eee..25c574d0df 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc1
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b broadcom/bcm2712-rpi-500"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y

--===============3371826958247536673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3371826958247536673==--
