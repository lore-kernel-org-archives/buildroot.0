Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE544C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 19:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379AC402C2;
	Mon, 17 Jan 2022 19:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6IJJprdwnNb; Mon, 17 Jan 2022 19:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5563A402A9;
	Mon, 17 Jan 2022 19:21:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9621BF395
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 19:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E300402A9
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 19:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLJ0JFb67vFV for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 19:21:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8100402A6
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 19:21:14 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4FB6DC0455
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 19:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1642447273; bh=ZHQj2OWVrMupMmpduQq/CVfa/ZyJ/Cz6tuEd3JLzrj8=;
 h=From:To:Cc:Subject:Date:From;
 b=gXfqloZjUlYLfhmqJPYfnsjmgoi/sqUAORQYn1pe7cYMe64s/yjUaTEGMOZukPCpr
 QxnHZeZNpWCRT/BcD1P6W4tHT1XD6NcrWBcM8MS5/92kWjZVJ0ek7A425l6eGiXzUB
 yvRS7OFf5AEGX5fwnO1/KJpQ+Loxlesl1txh7BrRxLn1VyZPkoAQplHnU8zyzsLwxF
 cQElmF87ZLHxOxTmT9FSj+BUCOZXZXV43+01hAhjYdtoNOjlEGqjuNFQxW+DTBkin9
 w8EztmTnB975pdvABr6x+NvEx6dQ22akcA0hohI4FRibJB/PsnRPIUPknadXgOUupT
 1XC0Z4zR0UUQQ==
Received: from abrodkin-5550.internal.synopsys.com (unknown [10.121.15.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 199FAA005C;
 Mon, 17 Jan 2022 19:21:10 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Mon, 17 Jan 2022 22:20:17 +0300
Message-Id: <20220117192017.8841-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/cubieboard2: U-Boot needs Python3 &
 OpenSSL
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After update of the U-Boot [1] we were missing dependency on Python3,
and so were seeing failures like in [2]:
------------------------->8--------------------
  HOSTLD  scripts/dtc/dtc
scripts/dtc/pylibfdt/libfdt_wrap.c:154:11: fatal error: Python.h: No such file or directory
  154 | # include <Python.h>
      |           ^~~~~~~~~~
compilation terminated.
error: command '/usr/bin/gcc' failed with exit code 1
------------------------->8--------------------

So that get fixed with "BR2_TARGET_UBOOT_NEEDS_PYTHON3=y".
And then once we use Python3, we also need OpenSSL, similarly to [3]
and the likes. So do it with "BR2_TARGET_UBOOT_NEEDS_OPENSSL=y".

Hopefully now all starts to build w/o any issues.

And while at it let's add a bit more structure to the config!

[1] https://git.buildroot.net/buildroot/commit/?id=06f10a88f30b73aaea5c0e0888d7ba9d9a6420f3
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1946650570
[3] https://git.buildroot.net/buildroot/commit/?id=cf2a7663ccc6089e98e0d6ec39fa8623749c0c24

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

---

P.S. I didn't see that problem on the U-Boot bump, as I built all
locally and quite obviously had Python3 and all the headers installed
in the system.

---
 configs/cubieboard2_defconfig | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index a9356295c1..18337fac72 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,32 +1,42 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
+
 # Linux headers same as kernel, a 5.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
