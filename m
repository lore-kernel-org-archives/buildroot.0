Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B254C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC74940F69;
	Sun,  3 Aug 2025 14:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKxAt_QLE1FN; Sun,  3 Aug 2025 14:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96674102F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C96674102F;
	Sun,  3 Aug 2025 14:42:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F36211A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D4F60F77
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciVSqxvknyXD for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82F9C60F2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82F9C60F2C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82F9C60F2C
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1v51vJ031a-00Z9hT; Sun, 03
 Aug 2025 16:42:11 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>, Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Aug 2025 16:42:06 +0200
Message-ID: <20250803144208.195144-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:oydToXLengtJbvKBURK/J4AMLL/ofHBetcAZqLdCxmUKcfdKhtA
 RA+c7A5wXvnAsKp5uCwvOHqMJX7PRRmo22wyLoAu2++8TrUWCzO4scfxK/k+UfLMT3tbjtV
 bXz+Mr5+A2W/+MeR0Q/xdwJ+mMG7MzBCU+nW/LIKkGCraZkATm9fbmWy3RiD8TC1KAPyVM4
 7XpzIjpIGAt0Zj+7w/MKA==
UI-OutboundReport: notjunk:1;M01:P0:3AOIFgaCgH0=;n1ceflGRjvqBQwGAeTarWFYunGC
 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
 xmVxVlr7LIWXzqCGmgfvrp0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754232131; x=1754836931; i=ps.report@gmx.net;
 bh=7VW2Uofxijvj/FsrCm+pz3+1HW3XoJxh2i/MIMeRNjI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YlRdtJt1RNyt8yzdzNhmlBUt4SL096G4Lizp5C7Sj7Lj/6cGEzmr7C7z/AjtrnRD
 8SgT/lDN9rNfIfPZgrI4p3pCB3MSy7T0Uv7fWCPMuyM4DXwcgnH6fVUxtrbkQA91z
 E78lbwUBP7/5ytbzCJFtP4N9/jr07O22spvM4PoZCV51Bm6NljXDCjwbvlwucZmMY
 upBep7wTttnWLZp2pSYEHsKoY48mdM8QNhlSF+p5h8fGy+bzlPZqfc/YFVvMuMX/f
 i/NuLDljU2iP7OCY4GXxZOtE98C8Qy5AmSbjN0UYqP3URoEUeetwNmaLGr45LIAzG
 dK2vcu1LgN1Jis8ddw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=YlRdtJt1
Subject: [Buildroot] [PATCH 1/3] configs/raspberrypi*: bump kernel version
 to ac69f09 (6.12.41)
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now based on 6.12.41 (from 6.12.20)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 board/raspberrypi/patches/linux/linux.hash | 2 +-
 configs/raspberrypi0_defconfig             | 2 +-
 configs/raspberrypi0w_defconfig            | 2 +-
 configs/raspberrypi2_64_defconfig          | 2 +-
 configs/raspberrypi2_defconfig             | 2 +-
 configs/raspberrypi3_64_defconfig          | 2 +-
 configs/raspberrypi3_defconfig             | 2 +-
 configs/raspberrypi3_qt5we_defconfig       | 2 +-
 configs/raspberrypi4_64_defconfig          | 2 +-
 configs/raspberrypi4_defconfig             | 2 +-
 configs/raspberrypi5_defconfig             | 2 +-
 configs/raspberrypi_defconfig              | 2 +-
 configs/raspberrypicm4io_64_defconfig      | 2 +-
 configs/raspberrypicm4io_defconfig         | 2 +-
 configs/raspberrypicm5io_defconfig         | 2 +-
 configs/raspberrypizero2w_64_defconfig     | 2 +-
 configs/raspberrypizero2w_defconfig        | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
index 3f278cb885..51b0684b20 100644
--- a/board/raspberrypi/patches/linux/linux.hash
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e7b484dc66565e8ea7b2792eea864c7c5ba6d8d0f6ea65288e701e03befec33f  linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz
+sha256  afc44e2899a3c32a1b968272a5816e5c90bea346341153807553396621e65dde  linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index ffd1ef78c1..1be48c32dc 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 45dab555d3..c7803c5af6 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_64_defconfig b/configs/raspberrypi2_64_defconfig
index 211e8470b4..57f98c7396 100644
--- a/configs/raspberrypi2_64_defconfig
+++ b/configs/raspberrypi2_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-2-b"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index d19a64ce11..60eb62b473 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 927f82a4cb..59b8b3fc6f 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 9342bc4b6a..3f7fdeb3ab 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index dc8160711d..8cbb8b0d41 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 2e2c52e5c9..c0a33c3eb5 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index d7229b66f2..75078a3c2c 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index d18f2ff480..6928e2ba0f 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 90a5240bd8..00525e050e 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 1e5915c287..648740c273 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 51400f9217..e5bbff76c1 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypicm5io_defconfig b/configs/raspberrypicm5io_defconfig
index 9bfde8f501..122a25ed92 100644
--- a/configs/raspberrypicm5io_defconfig
+++ b/configs/raspberrypicm5io_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm5io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm5io/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
index a3c5b586a3..7a00fa14ac 100644
--- a/configs/raspberrypizero2w_64_defconfig
+++ b/configs/raspberrypizero2w_64_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 4385c7bdd6..36e66676fa 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
