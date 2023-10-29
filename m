Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3776CC4167B
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 18:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB6ED70812;
	Sun, 29 Oct 2023 18:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB6ED70812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23tTIXjstMWs; Sun, 29 Oct 2023 18:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC2F70827;
	Sun, 29 Oct 2023 18:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC2F70827
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52BEA1BF33E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3547C70815
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3547C70815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLTUymK-lXjg for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 18:43:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 468D67080F
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 18:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 468D67080F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15E7F8612E; Sun, 29 Oct 2023 18:43:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 19:42:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffe48fac1d0144fb591241103a5c8d6a75df8610
X-Git-Newrev: 72c653367daaccb47089bfed4ca7ce459a75bde7
X-Patchwork-Hint: ignore
Message-Id: <20231029184356.15E7F8612E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/licheepi_zero: move board files to
 their own directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=72c653367daaccb47089bfed4ca7ce459a75bde7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Group files for board licheepi_zero under the existing manufacturer
directory, like all the other boards by Sipeed.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
[yann.morin.1998@free.fr: use the manufacturer sub-dir]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/{licheepi => sipeed/licheepi_zero}/boot.cmd     | 0
 board/{licheepi => sipeed/licheepi_zero}/genimage.cfg | 0
 board/{licheepi => sipeed/licheepi_zero}/readme.txt   | 2 +-
 configs/licheepi_zero_defconfig                       | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/licheepi/boot.cmd b/board/sipeed/licheepi_zero/boot.cmd
similarity index 100%
rename from board/licheepi/boot.cmd
rename to board/sipeed/licheepi_zero/boot.cmd
diff --git a/board/licheepi/genimage.cfg b/board/sipeed/licheepi_zero/genimage.cfg
similarity index 100%
rename from board/licheepi/genimage.cfg
rename to board/sipeed/licheepi_zero/genimage.cfg
diff --git a/board/licheepi/readme.txt b/board/sipeed/licheepi_zero/readme.txt
similarity index 97%
rename from board/licheepi/readme.txt
rename to board/sipeed/licheepi_zero/readme.txt
index 6b8bf94b45..2f122125b7 100644
--- a/board/licheepi/readme.txt
+++ b/board/sipeed/licheepi_zero/readme.txt
@@ -10,7 +10,7 @@ How to build it
 Configure Buildroot
 -------------------
 
-  $ make licheepi_zero_defconfig
+  $ make sipeed_licheepi_zero_defconfig
 
 Build the rootfs
 ----------------
diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 0d3115a996..1fa76923c8 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/licheepi_zero/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -45,7 +45,7 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/licheepi/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sipeed/licheepi_zero/boot.cmd"
 
 # Required host utilities for building an SDCard image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
