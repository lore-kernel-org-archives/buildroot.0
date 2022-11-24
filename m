Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44638C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC6D78206A;
	Thu, 24 Nov 2022 21:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC6D78206A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OV0TbAdfxoC2; Thu, 24 Nov 2022 21:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62C581FB9;
	Thu, 24 Nov 2022 21:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62C581FB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC89C1BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C83BF60B3B
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C83BF60B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7O4IGoxTs7UH for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:55:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E72A0607CA
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72A0607CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D408684608; Thu, 24 Nov 2022 21:55:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 22:52:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ad87a519cd3f75ce3a001aa47474f8056e89b275
X-Git-Newrev: 76f274063363f79c467c16452d0f1275f1d783c3
X-Patchwork-Hint: ignore
Message-Id: <20221124215506.D408684608@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-vpu-hantro: bump version to 1.27.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76f274063363f79c467c16452d0f1275f1d783c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Same version as NXP release 5.15.52_2.1.0
- EULA/COPYING: update to LA_OPT_NXP_Software_License v39
- No official changelog but the main addition is the support of skipped
  h.264 frames
- Add patch to fix kernel version test from the package
  - Yocto doesn't need that workaround as it installs the kernel headers
  - This is needed for NXP 5.15+ kernels (using DMABUF)

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Fix-Linux-kernel-version-header.patch     | 45 ++++++++++++++++++++++
 .../imx-vpu-hantro/imx-vpu-hantro.hash             |  6 +--
 .../freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk |  2 +-
 3 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/0003-Fix-Linux-kernel-version-header.patch b/package/freescale-imx/imx-vpu-hantro/0003-Fix-Linux-kernel-version-header.patch
new file mode 100644
index 0000000000..427ebeb38a
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro/0003-Fix-Linux-kernel-version-header.patch
@@ -0,0 +1,45 @@
+From 73cd57c18066ff863335a8616d0b348541d26118 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Tue, 15 Nov 2022 21:43:47 +0100
+Subject: [PATCH] Fix Linux kernel version header
+
+- Up to kernel 5.10, NXP was using ION for memory management
+- Starting with 5.15 kernels, NXP uses DMABUF and the ION header is no
+  longer in the kernel
+- So keep the previous patch for people using kernel <= 5.10
+- Add path to the version.h header as imx-vpu-hantro will only include
+  ion.h depending on the kernel version
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ Makefile_G1G2 | 1 +
+ Makefile_H1   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/Makefile_G1G2 b/Makefile_G1G2
+index 25884fa..8e03e91 100755
+--- a/Makefile_G1G2
++++ b/Makefile_G1G2
+@@ -11,6 +11,7 @@ INCLUDE_HEADERS = -I./decoder_sw -I$(SOURCE_ROOT)/source/inc -I$(SOURCE_ROOT)/so
+ INCLUDE_HEADERS += -I$(SOURCE_ROOT)/linux/memalloc
+ #INCLUDE_HEADERS += -I$(SOURCE_ROOT)/linux/ldriver
+ INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
++INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/include/generated/uapi
+ INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi
+ 
+ CFLAGS += -DDEC_MODULE_PATH=\"/dev/mxc_hantro\" -DUSE_FAKE_RFC_TABLE -DFIFO_DATATYPE=void* -DNDEBUG -DDOWN_SCALER \
+diff --git a/Makefile_H1 b/Makefile_H1
+index 479940a..7ac6f8d 100755
+--- a/Makefile_H1
++++ b/Makefile_H1
+@@ -18,6 +18,7 @@ ENV = -DENC_MODULE_PATH=\\\"/dev/mxc_hantro_h1\\\"
+ ENV += -DEWL_NO_HW_TIMEOUT
+ ENV += -DUSE_ION
+ ENV += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
++ENV += -I$(LINUX_KERNEL_ROOT)/include/generated/uapi
+ ENV += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi
+ 
+ ifeq ($(CFG_SECURE_DATA_PATH), y)
+-- 
+2.35.1
+
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index dd3b167e3e..637d7898cf 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  03c61dfb268b31a0d25a4d1387cb3ad0261029ad5de801f72224602e2b37da00  imx-vpu-hantro-1.22.0.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  7e9bcdbd067ce66a1247373cbf088945346feb0027deb61af541ebc1256277c3  imx-vpu-hantro-1.27.0.bin
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 9d34c7add7..4cfc8f41ff 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VERSION = 1.22.0
+IMX_VPU_HANTRO_VERSION = 1.27.0
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
