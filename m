Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D2C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DAA381A4E;
	Wed, 31 Jul 2024 16:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmSxyUypKSgd; Wed, 31 Jul 2024 16:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943AF8136B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 943AF8136B;
	Wed, 31 Jul 2024 16:54:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E0F1BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A82240E1C
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCNr4EDf1ORy for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55272408A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55272408A8
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5022B8376F; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 18:44:31 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: b72162e8068f2e611e4d692afb6da840cd969a08
X-Git-Newrev: 0eb1ea8cb52cd9ea080aa113646e3656ce66b97f
X-Patchwork-Hint: ignore
Message-Id: <20240731165429.5022B8376F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] configs/stm32mp157a_dk1:
 add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eb1ea8cb52cd9ea080aa113646e3656ce66b97f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The patch adds .hash files for Arm trusted firmware, Linux, Linux headers
and U-Boot and then enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we
can now drop the defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 751228436a4c68bc440a2f9dd1ef12ceb861765c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                     | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash              | 2 ++
 .../stm32mp157a-dk1/patches/linux-headers/linux-headers.hash            | 1 +
 board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash       | 2 ++
 board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash       | 2 ++
 configs/stm32mp157a_dk1_defconfig                                       | 2 ++
 6 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ee44e82f5b..631e1d9da5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -331,7 +331,6 @@ configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
-configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..97c4500711
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  068325043b7c8ecc47ebb8b4f241f01e86d3f69dc49a63f340aa94bd41a9e6df  arm-trusted-firmware/arm-trusted-firmware-lts-v2.8.16.tar.gz
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
new file mode 100644
index 0000000000..8b7624cceb
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9  linux-5.13.tar.xz
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..7cef5b688e
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index aed6cfad34..38f7bc8946 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -6,6 +6,8 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
