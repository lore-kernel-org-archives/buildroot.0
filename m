Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDE9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 12:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB40383180;
	Sat, 22 Jan 2022 12:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tpJa4-kb5Iq; Sat, 22 Jan 2022 12:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C0A83112;
	Sat, 22 Jan 2022 12:17:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2F11BF2AF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2953983112
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQlF7c-nLVfn for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 12:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7739A8272C
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 12:17:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BF43B81970; Sat, 22 Jan 2022 12:10:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 13:17:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aab9cb163ece16b5e10a3e3fb14ced6c11f98913
X-Git-Newrev: 944eb00fd16b471432ee7cb4106ab9a82a2e57a5
X-Patchwork-Hint: ignore
Message-Id: <20220122121045.BF43B81970@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pcengines_apu2_defconfig: bump
 kernel to 5.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=944eb00fd16b471432ee7cb4106ab9a82a2e57a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the compile errors that were present with the previous
kernel version (4.19):

https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084022

Additionally, the defconfig file was refactored: Configuration
values are now grouped logically, thus increasing readability and
maintainability.

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pcengines_apu2_defconfig | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
index 68cebb8f6a..0792c93c19 100644
--- a/configs/pcengines_apu2_defconfig
+++ b/configs/pcengines_apu2_defconfig
@@ -1,16 +1,27 @@
+# Architecture
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_TARGET_GENERIC_HOSTNAME="apu2"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_SYSTEM_DHCP="eth0"
+
+# Kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
+
+# Default hostname and TTY
+BR2_TARGET_GENERIC_HOSTNAME="apu2"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Networking
+BR2_SYSTEM_DHCP="eth0"
+
+# Rootfs
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_ISO9660=y
 BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="board/pcengines/apu2/isolinux.cfg"
 BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
 BR2_TARGET_SYSLINUX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
