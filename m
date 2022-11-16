Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5AFC43217
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 09:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB57840B39;
	Wed, 16 Nov 2022 09:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB57840B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOYT--B7D3Q8; Wed, 16 Nov 2022 09:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C110A403A2;
	Wed, 16 Nov 2022 09:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C110A403A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8591BF59B
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 09:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B11A81EBC
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 09:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B11A81EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7hBeDKz57WU for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 09:12:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 312CE81EBA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 312CE81EBA
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 09:12:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so980832wmg.2
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 01:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=40a98ACxwOxKjSAej1lV33a+BeUgkE5Snnl4pxu9ySo=;
 b=P72hmvaOcGLYidBHQdbW0v0yeO/SqTAcqIXZSddHlstkGQu8Zqo2JBn5pSnGKEH3Ee
 J1bEWVdIaAfNWUImrng1FXZT5LIAjQkt9ahfZpyGMEOVJhFOsY026WcUpHduXoWW6qnx
 2bXC+/ru8CX0srXFKfQhud2Fbo8K5sh7R3B2tZKxevWggO4qT/7rGfnFuKRbHZfDx7qr
 KggSlFwKURqVZ7AuTdgQFHYkDKmhjjZiXC2pQtowogkGSVh7oHIgJ9I0vP72BKVMSAx6
 n+8B9dlIhSuutlNJvd8Py1RDXgdo6e8mYouA5B0FNbaaQct7H8O1JH36qeFJY1snjICl
 PjVg==
X-Gm-Message-State: ANoB5pnfxxJjCoImcYj/Lm9yFwrTi0XkVeGMT5KMDAU+V1kAupiCWL8J
 NL9/aFRHmX9Kfc9gfvTZWG7zUJlWXJanMA==
X-Google-Smtp-Source: AA0mqf5HYiu0MwI/ADYrd/e5Iq+uPw+C5h/+lGRyjq+hWD3dJTQM1pDaH19ITSdHtG3TG+wr+J5GwQ==
X-Received: by 2002:a05:600c:6029:b0:3cf:baef:e92a with SMTP id
 az41-20020a05600c602900b003cfbaefe92amr1369284wmb.178.1668589972087; 
 Wed, 16 Nov 2022 01:12:52 -0800 (PST)
Received: from p1g2.home (2a01cb000f892400bac0522898b75ff0.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f89:2400:bac0:5228:98b7:5ff0])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a7bc38f000000b003cf6a55d8e8sm1362479wmj.7.2022.11.16.01.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 01:12:51 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 10:12:48 +0100
Message-Id: <20221116091248.755689-1-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=40a98ACxwOxKjSAej1lV33a+BeUgkE5Snnl4pxu9ySo=;
 b=SscwZ4HqzpWJSXPk2s7dhcx2d4cuJsUR17MjP+XmNmBK7W0B9JmLfnuQKFCxAKKJdC
 ff+GDwcZaGzNODiJJ66nP54s+G+Bmm8P2703B0UHRr1sX7LqAgNp0S0wBHocJ0xO7oRQ
 K7q0RZzL59ae2vFZPCn0fbwgQplVZIY6qkuDM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=SscwZ4Hq
Subject: [Buildroot] [PATCH] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.27.0
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
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Same version as NXP release 5.15.52_2.1.0
- EULA/COPYING: update to LA_OPT_NXP_Software_License v39
- No official changelog but the main addition is the support of skipped
  h.264 frames
- Add patch to fix kernel version test from the package
  - Yocto doesn't need that workaround as it installs the kernel headers
  - This is needed for NXP 5.15+ kernels (using DMABUF)

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 ...0003-Fix-Linux-kernel-version-header.patch | 45 +++++++++++++++++++
 .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 +--
 .../imx-vpu-hantro/imx-vpu-hantro.mk          |  2 +-
 3 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 package/freescale-imx/imx-vpu-hantro/0003-Fix-Linux-kernel-version-header.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
