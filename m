Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A9FC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D37A060A5B;
	Wed, 16 Apr 2025 20:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAxDgpkO6c5o; Wed, 16 Apr 2025 20:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249DD617BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 249DD617BB;
	Wed, 16 Apr 2025 20:29:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0327D159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7177417A2
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTnZaQB_HIeU for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 120C740BCE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 120C740BCE
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3F768516B; Wed, 16 Apr 2025 20:29:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 22:13:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3f41a4a79ed0287eb800fdb210ea2b44e617ebd
X-Git-Newrev: ace394e91143dfb9d069eaff878e7db3170e36b2
X-Patchwork-Hint: ignore
Message-Id: <20250416202931.F3F768516B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi5: install Raspberry Pi
 500 device-tree blob
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
Content-Type: multipart/mixed; boundary="===============2783027169451727310=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2783027169451727310==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ace394e91143dfb9d069eaff878e7db3170e36b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This installs the device-tree blob for the Raspberry Pi 500.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
index 5fa1d779e5..358f9e9506 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b broadcom/bcm2712d0-rpi-5-b broadcom/bcm2712-rpi-500"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y

--===============2783027169451727310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2783027169451727310==--
