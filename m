Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4776C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C83830A8;
	Fri, 28 Feb 2025 17:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRNBuWj3pflv; Fri, 28 Feb 2025 17:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0526C83336
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0526C83336;
	Fri, 28 Feb 2025 17:25:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BDD1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D54CE49475
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5G8O4ONjHVG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEB6F42DF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEB6F42DF9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B90D884094; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 14:52:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 97f8ba4ea240733f3403583b19a83b427da5a143
X-Git-Newrev: b71d7eae59f82683e547b60f06538c4a2af8c5d3
X-Patchwork-Hint: ignore
Message-Id: <20250228163050.B90D884094@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/octavo: Add
 FORCE_CHECK_HASHES config and custom hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=b71d7eae59f82683e547b60f06538c4a2af8c5d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable FORCE_CHECK_HASHES to ensure that all hashes are valid even
from custom packages.
Add custom version package hashes of Linux, U-boot and TF-A.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 ++
 board/octavo/osd32mp1-brk/patches/linux/linux.hash                      | 2 ++
 board/octavo/osd32mp1-brk/patches/uboot/uboot.hash                      | 2 ++
 .../osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 ++
 board/octavo/osd32mp1-red/patches/linux/linux.hash                      | 2 ++
 board/octavo/osd32mp1-red/patches/uboot/uboot.hash                      | 2 ++
 configs/octavo_osd32mp1_brk_defconfig                                   | 1 +
 configs/octavo_osd32mp1_red_defconfig                                   | 1 +
 8 files changed, 14 insertions(+)

diff --git a/board/octavo/osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/octavo/osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..2ba1cc0972
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  83d744c155097f27682a06fdba5f7e976fde6edf61474d40a5a44e71862a3822  arm-trusted-firmware-v2.4-stm32mp-r1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-brk/patches/linux/linux.hash b/board/octavo/osd32mp1-brk/patches/linux/linux.hash
new file mode 100644
index 0000000000..ec9218e388
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c2e22c6d13e5970839231ca29cfbe3bb66ef4d4d1cd3c2b5afb61f591f89d71a  linux-v5.10-stm32mp-r2.1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-brk/patches/uboot/uboot.hash b/board/octavo/osd32mp1-brk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..6b51c2685b
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  49a2470ecd29c29cc712861372335c9e2020e5c56392c6417faf66dc7a782261  uboot-v2020.10-stm32mp-r2.1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/octavo/osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..2ba1cc0972
--- /dev/null
+++ b/board/octavo/osd32mp1-red/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  83d744c155097f27682a06fdba5f7e976fde6edf61474d40a5a44e71862a3822  arm-trusted-firmware-v2.4-stm32mp-r1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-red/patches/linux/linux.hash b/board/octavo/osd32mp1-red/patches/linux/linux.hash
new file mode 100644
index 0000000000..ec9218e388
--- /dev/null
+++ b/board/octavo/osd32mp1-red/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c2e22c6d13e5970839231ca29cfbe3bb66ef4d4d1cd3c2b5afb61f591f89d71a  linux-v5.10-stm32mp-r2.1-git4.tar.gz
diff --git a/board/octavo/osd32mp1-red/patches/uboot/uboot.hash b/board/octavo/osd32mp1-red/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..6b51c2685b
--- /dev/null
+++ b/board/octavo/osd32mp1-red/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  49a2470ecd29c29cc712861372335c9e2020e5c56392c6417faf66dc7a782261  uboot-v2020.10-stm32mp-r2.1-git4.tar.gz
diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
index e8857f3649..2a6d794722 100644
--- a/configs/octavo_osd32mp1_brk_defconfig
+++ b/configs/octavo_osd32mp1_brk_defconfig
@@ -4,6 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-brk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-brk/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/octavo/osd32mp1-brk/genimage.cfg"
diff --git a/configs/octavo_osd32mp1_red_defconfig b/configs/octavo_osd32mp1_red_defconfig
index d179e0a27e..3646e2d04f 100644
--- a/configs/octavo_osd32mp1_red_defconfig
+++ b/configs/octavo_osd32mp1_red_defconfig
@@ -4,6 +4,7 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-red/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-red/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/octavo/osd32mp1-red/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
