Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248AEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B825461163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B825461163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B7F60F3E;
	Wed,  6 Oct 2021 20:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7A3UtpO-jNe7; Wed,  6 Oct 2021 20:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F6460F4C;
	Wed,  6 Oct 2021 20:42:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6B201BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A23E4407F9
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0nLVmXHuOtH for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A6A740DA9
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:56 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so3368391pji.2
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sQZado1cwpWvd2ITttbXQ7v5RmWRqREKRS3qd0jgyj0=;
 b=K9tBBS0hIOvfS3tGzGEWx/8brJ6H9QJ6y+W/R1BX08oVhtJrhqLh2MliAxkgtqoJzu
 xT2jedis/rpzBdlMG6mtk1W19gL54pFty9FJy8fW/8etin2DxTyLNfsw0zwOMM6Nz5Sk
 vP6MziauEcaktkST+iBKpkzckABQ3GQGV8n1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sQZado1cwpWvd2ITttbXQ7v5RmWRqREKRS3qd0jgyj0=;
 b=3DqWJzoR5zBQZBCvQqHrAm6QRI3cmm5p+KVLAta5png1ebc56YQ/m2CAD8FgdNT2f/
 lmmllgqcTQoZgwrqErmqvze4au5k2tzkk5iiN1+wOn2hDvSvz1/YoBbdW3P46G1KUBgT
 EC28B1EH+4jEOiytP9s8gyh4oAAXfBBkzsUqeozM8A8V+BqBMndGPNefqpldu5s9rgm7
 5Ct7AuzzSg2mxu1lB6wZM8dPtZ4Wyc/itH7+8Zl4aQyIAUIcbja9l+mHf8EHATTQxv6R
 uO7xXADcSo81G+K7x/hU5eaObOpV7yarYUxscEPi6NxVs359MSCZesn84FJ0msFUO0Ey
 sPng==
X-Gm-Message-State: AOAM5335n9KLsO5TQWR05TMQqSme8FV472ad6QSsnqRvobC4xrclWsB3
 VEe0JOFZnnaiM38RAoeOTyE/Cl/fjlDCWQVv
X-Google-Smtp-Source: ABdhPJwOkH+KYULW0tZIQAF76Es8zxi1fDA+h+Fu2rBTwjjaWZW6xhQdXc49/c0pM3mxLTeAiOfVoQ==
X-Received: by 2002:a17:90a:460a:: with SMTP id
 w10mr952347pjg.132.1633552915210; 
 Wed, 06 Oct 2021 13:41:55 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:54 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:26 -0700
Message-Id: <20211006204135.2813745-3-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/12] package/freescale-imx/imx-vpu-hantro:
 bump version to 1.22.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To match NXP 5.10.35-2.0.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 ...on.h-header-inclusion-to-be-standard.patch | 47 ++++++++++---------
 .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 +--
 .../imx-vpu-hantro/imx-vpu-hantro.mk          |  2 +-
 3 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
index f5a67cd514..43ccb1dfec 100644
--- a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
+++ b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
@@ -1,13 +1,14 @@
-From e776e7360f80da9ac03f81a5df27d8b7fabc7ac7 Mon Sep 17 00:00:00 2001
-From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Thu, 26 Mar 2020 16:00:33 +0100
-Subject: [PATCH] Fix ion.h header inclusion to be standard
+From dfe8ef9123936d2c1d5da34f63f661849171d5ef Mon Sep 17 00:00:00 2001
+From: Chris Dimich <chris.dimich@boundarydevices.com>
+Date: Sun, 3 Oct 2021 16:39:29 -0700
+Subject: [PATCH 1/1] Fix ion.h header inclusion to be standard
 
 NXP "solution" was to manually copy the header to include/linux.
 Let's point the Makefile to the proper (mainline) location instead:
 https://elixir.bootlin.com/linux/v4.17/source/drivers/staging/android/uapi/ion.h
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
 ---
  Makefile_G1G2                                             | 4 ++--
  Makefile_H1                                               | 4 ++--
@@ -16,7 +17,7 @@ Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
  4 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile_G1G2 b/Makefile_G1G2
-index 8280cce..4c9fc34 100755
+index 8f83391..25884fa 100755
 --- a/Makefile_G1G2
 +++ b/Makefile_G1G2
 @@ -10,8 +10,8 @@ INCLUDE_HEADERS = -I./decoder_sw -I$(SOURCE_ROOT)/source/inc -I$(SOURCE_ROOT)/so
@@ -31,10 +32,10 @@ index 8280cce..4c9fc34 100755
  CFLAGS += -DDEC_MODULE_PATH=\"/dev/mxc_hantro\" -DUSE_FAKE_RFC_TABLE -DFIFO_DATATYPE=void* -DNDEBUG -DDOWN_SCALER \
             -DUSE_EXTERNAL_BUFFER -DUSE_FAST_EC -DUSE_VP9_EC -DGET_FREE_BUFFER_NON_BLOCK \
 diff --git a/Makefile_H1 b/Makefile_H1
-index 9ab62e1..8d366e3 100755
+index 0979571..479940a 100755
 --- a/Makefile_H1
 +++ b/Makefile_H1
-@@ -17,8 +17,8 @@ ENV += -DMEMALLOC_MODULE_PATH=\\\"/dev/ion\\\"
+@@ -17,8 +17,8 @@ ENV = -DENC_MODULE_PATH=\\\"/dev/mxc_hantro_h1\\\"
  #ENV += -DSDRAM_LM_BASE=0x00000000
  ENV += -DEWL_NO_HW_TIMEOUT
  ENV += -DUSE_ION
@@ -43,34 +44,34 @@ index 9ab62e1..8d366e3 100755
 +ENV += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
 +ENV += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi
  
- LIBENCNAME = libcodec_enc
- LIBSENC = -L./ -lhantro_h1 -lpthread
+ ifeq ($(CFG_SECURE_DATA_PATH), y)
+ ENV += -DCFG_SECURE_DATA_PATH
 diff --git a/decoder_sw/software/linux/dwl/dwl_linux.c b/decoder_sw/software/linux/dwl/dwl_linux.c
-index 9b057f0..43225f6 100755
+index 7d5e33b..c0e5727 100755
 --- a/decoder_sw/software/linux/dwl/dwl_linux.c
 +++ b/decoder_sw/software/linux/dwl/dwl_linux.c
-@@ -41,7 +41,7 @@
- #include "dwl.h"
- #include <linux/hantrodec.h>
- #ifdef USE_ION
+@@ -50,7 +50,7 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+ #include <linux/dma-heap.h>
+ #else
 -#include <linux/ion.h>
 +#include <ion.h>
- #include <linux/dma-buf.h>
- #include <linux/version.h>
+ #endif
  #ifdef ANDROID
+ #include <linux/mxc_ion.h>
 diff --git a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
-index fef1307..20b6f95 100755
+index 312e4cc..70630c3 100755
 --- a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
 +++ b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
-@@ -49,7 +49,7 @@
- 
- #include "linux/hx280enc.h"
- #ifdef USE_ION
+@@ -52,7 +52,7 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+ #include <linux/dma-heap.h>
+ #else
 -#include <linux/ion.h>
 +#include <ion.h>
+ #endif
  #include <linux/dma-buf.h>
  #include <linux/version.h>
- #ifdef ANDROID
 -- 
-2.25.1
+2.31.1
 
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index e9df63bfca..dd3b167e3e 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  419725f0c09f5939c88cd234b729c3943cbd37e53db7352b02c8d6cc05b939b9  imx-vpu-hantro-1.21.0.bin
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
+sha256  03c61dfb268b31a0d25a4d1387cb3ad0261029ad5de801f72224602e2b37da00  imx-vpu-hantro-1.22.0.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index 0d075c49c0..360591b444 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VERSION = 1.21.0
+IMX_VPU_HANTRO_VERSION = 1.22.0
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
