Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C53C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 07:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7CD825E6;
	Wed, 23 Feb 2022 07:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vv7uWCSr1eYZ; Wed, 23 Feb 2022 07:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50223813D7;
	Wed, 23 Feb 2022 07:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9B21BF85D
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 255FD813D7
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XV0g2gPBoLMA for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 07:11:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC45880C35
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 07:11:24 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 21N7B72N017017;
 Wed, 23 Feb 2022 15:11:07 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 23 Feb 2022 15:11:05 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Wed, 23 Feb 2022 15:10:47 +0800
Message-ID: <20220223071049.21153-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 21N7B72N017017
Subject: [Buildroot] [PATCH v4 1/3] board/andes: rearrange andes folder
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, alankao@andestech.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rename ae3xx to ae300 for nds32 architecture and add ae350 platform.

AE300 (NDS32):
- http://www.andestech.com/en/products-solutions/andeshape-platforms/ae300/
AE350 (RISC-V):
- http://www.andestech.com/en/products-solutions/andeshape-platforms/ae350-axi-based-platform-pre-integrated-with-n25f-nx25f-a25-ax25/

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
---
Changes v1 -> v2:
   - move linux source code and its patches to AndesTech Github repo
   - rename ae350_andestar45_defconfig to andes_ae350_45_defconfig
   - change C library to uClibc
   - remove OpenSSL package
   - remove rootfs.cpio and rootfs.tar
   - update DEVELOPERS
Changes v2 -> v3:
   - specifiy branch to download from AndesTech linux repo
   - change boot.cmd to extlinux.conf
   - add post-build.sh for extlinux.conf to retrieve Image and DTB
   - fix format and update genimage_sdcard.cfg
   - update readme.txt
   - add packages (python3, pylibfdt and openssl) for u-boot binman
   - reorder item in DEVELOPERS
Changes v3 -> v4:
   - rename ae3xx folder to ae300
   - rename andes_ae3xx_defconfig to andes_ae300_defconfig
   - update readme.txt and item in DEVELOPERS
---
 .../{ae3xx/ae3xx.fragment => ae300/ae300.fragment}     |  0
 .../linux/0001-nds32-Fix-boot-messages-garbled.patch   |  0
 ...-dtc-Remove-redundant-YYLOC-global-declaratio.patch |  0
 board/andes/{ => ae300}/readme.txt                     | 10 +++++-----
 .../{andes_ae3xx_defconfig => andes_ae300_defconfig}   |  4 ++--
 .../toolchain-external-andes-nds32/Config.in           |  2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename board/andes/{ae3xx/ae3xx.fragment => ae300/ae300.fragment} (100%)
 rename board/andes/{ => ae300}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
 rename board/andes/{ => ae300}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
 rename board/andes/{ => ae300}/readme.txt (71%)
 rename configs/{andes_ae3xx_defconfig => andes_ae300_defconfig} (69%)

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
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
