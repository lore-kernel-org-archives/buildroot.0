Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE88C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4752940B8E;
	Thu, 10 Mar 2022 20:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eiuVA_1ekwoc; Thu, 10 Mar 2022 20:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3D5940132;
	Thu, 10 Mar 2022 20:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3101BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C52847A9
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AG_jdx6dZX1v for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:58:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D1A84304
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:58:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 727D383BF5; Thu, 10 Mar 2022 20:49:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 21:47:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4616a195ea396e2113dcbb5dad373306036c1a8
X-Git-Newrev: 48bdd8374174494b5a1ae658edb32780e9f86052
X-Patchwork-Hint: ignore
Message-Id: <20220310204935.727D383BF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/andes: rearrange andes folder
 structure
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

commit: https://git.buildroot.net/buildroot/commit/?id=48bdd8374174494b5a1ae658edb32780e9f86052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to add ae350 RISC-V platform, rename ae3xx to ae300 for NDS32
architecture.

AE300 (NDS32):
- http://www.andestech.com/en/products-solutions/andeshape-platforms/ae300/
AE350 (RISC-V):
- http://www.andestech.com/en/products-solutions/andeshape-platforms/ae350-axi-based-platform-pre-integrated-with-n25f-nx25f-a25-ax25/

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                                     |  2 +-
 board/andes/{ae3xx/ae3xx.fragment => ae300/ae300.fragment}     |  0
 .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch   |  0
 ...-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch |  0
 board/andes/{ => ae300}/readme.txt                             | 10 +++++-----
 configs/{andes_ae3xx_defconfig => andes_ae300_defconfig}       |  4 ++--
 .../toolchain-external-andes-nds32/Config.in                   |  2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f213e054f..26bcb508e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2150,7 +2150,7 @@ F:	package/tcf-agent/
 N:	Nylon Chen <nylon7@andestech.com>
 F:	arch/Config.in.nds32
 F:	board/andes
-F:	configs/andes_ae3xx_defconfig
+F:	configs/andes_ae300_defconfig
 F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
diff --git a/board/andes/ae3xx/ae3xx.fragment b/board/andes/ae300/ae300.fragment
similarity index 100%
rename from board/andes/ae3xx/ae3xx.fragment
rename to board/andes/ae300/ae300.fragment
diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
similarity index 100%
rename from board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
rename to board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
diff --git a/board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
similarity index 100%
rename from board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
rename to board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
diff --git a/board/andes/readme.txt b/board/andes/ae300/readme.txt
similarity index 71%
rename from board/andes/readme.txt
rename to board/andes/ae300/readme.txt
index 0f95c65549..51c05c9235 100644
--- a/board/andes/readme.txt
+++ b/board/andes/ae300/readme.txt
@@ -1,10 +1,10 @@
 Intro
 =====
 
-Andestech(nds32) AE3XX Platform
+Andestech(nds32) AE300 Platform
 
-The AE3XX prototype demonstrates the AE3XX example platform on the FPGA. 
-It is composed of one Andestech(nds32) processor and AE3XX.
+The AE300 prototype demonstrates the AE300 example platform on the FPGA.
+It is composed of one Andestech(nds32) processor and AE300.
 
 How to build it
 ===============
@@ -12,10 +12,10 @@ How to build it
 Configure Buildroot
 -------------------
 
-The andes_ae3xx_defconfig configuration is a sample configuration with
+The andes_ae300_defconfig configuration is a sample configuration with
 all that is required to bring the FPGA Development Board:
 
-  $ make andes_ae3xx_defconfig
+  $ make andes_ae300_defconfig
 
 Build everything
 ----------------
diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae300_defconfig
similarity index 69%
rename from configs/andes_ae3xx_defconfig
rename to configs/andes_ae300_defconfig
index 52634caa50..ffcb4d7d38 100644
--- a/configs/andes_ae3xx_defconfig
+++ b/configs/andes_ae300_defconfig
@@ -1,10 +1,10 @@
 BR2_nds32=y
-BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
+BR2_GLOBAL_PATCH_DIR="board/andes/ae300/patches"
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae3xx/ae3xx.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae300/ae300.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
index 9c937b8c44..ecd50cc805 100644
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
@@ -12,4 +12,4 @@ config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
 	help
 	  nds32 toolchain for the nds32 architecture. It uses GCC
 	  8.2.1, GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates
-	  code that runs on ae3xx platform
+	  code that runs on ae300 platform
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
