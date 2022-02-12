Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC29FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9CC60B3A;
	Sat, 12 Feb 2022 11:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uq_DyOeXr0IL; Sat, 12 Feb 2022 11:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA1AA60ACB;
	Sat, 12 Feb 2022 11:54:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 553741BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44082817AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeZgyBM9JlkS for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:54:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 836F581516
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:54:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9BFDC8284B; Sat, 12 Feb 2022 11:46:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 12:50:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 697acda00d9f6fc601e6724da36f0e0b96aeee09
X-Git-Newrev: 758a3dffd2769ee2fe27bd50f2a0ec7175c69f75
X-Patchwork-Hint: ignore
Message-Id: <20220212114631.9BFDC8284B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/snps_arc700_axs101: bump kernel
 and u-boot versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=758a3dffd2769ee2fe27bd50f2a0ec7175c69f75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump versions:
- use U-Boot 2022.01
- use Linux kernel v5.16

Add U-Boot configuration fragment increasing early malloc pool size.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/synopsys/axs10x/uboot-fragment.config |  1 +
 configs/snps_arc700_axs101_defconfig        | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/board/synopsys/axs10x/uboot-fragment.config b/board/synopsys/axs10x/uboot-fragment.config
new file mode 100644
index 0000000000..92fe20f463
--- /dev/null
+++ b/board/synopsys/axs10x/uboot-fragment.config
@@ -0,0 +1 @@
+CONFIG_SYS_MALLOC_F_LEN=0x0500
diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index 080250e92b..3a6bd5c0d3 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+# Linux headers same as kernel, a 5.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -22,6 +22,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/synopsys/axs10x/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
