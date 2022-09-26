Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F2C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 05:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D48ED826B4;
	Mon, 26 Sep 2022 05:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D48ED826B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPz74WDiqFC1; Mon, 26 Sep 2022 05:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA0A82505;
	Mon, 26 Sep 2022 05:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA0A82505
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF021BF473
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 05:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 386D760ADD
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 05:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 386D760ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vehO8wF-JHt7 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 05:25:22 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C67606F2
Received: from xtrwsqbh.outbound-mail.sendgrid.net
 (xtrwsqbh.outbound-mail.sendgrid.net [167.89.100.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5C67606F2
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 05:25:21 +0000 (UTC)
Received: by filterdrecv-bcb4b6ff5-7v7hx with SMTP id
 filterdrecv-bcb4b6ff5-7v7hx-1-6331368F-5
 2022-09-26 05:20:15.232941196 +0000 UTC m=+544003.617447700
Received: from athaariq.my.id (unknown) by geopod-ismtpd-5-1 (SG) with ESMTP
 id hOLRv52eTj2fqYto30tYKA Mon, 26 Sep 2022 05:20:14.638 +0000 (UTC)
Received: from athaariq.my.id (unknown
 [IPv6:2404:8000:1015:179d:8909:4a3c:8b10:a97a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by athaariq.my.id (Postfix) with ESMTPSA id 50262FC89F;
 Mon, 26 Sep 2022 12:14:00 +0700 (WIB)
From: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
Date: Mon, 26 Sep 2022 05:20:15 +0000 (UTC)
Message-Id: <20220926051956.3272067-1-buildroot@athaariq.my.id>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?iwEO1kVhUXaWaYvxfXXvBV=2F1Fo0xvv4Xx00290SD89LhbjIh9fYZVxq2H7yHHE?=
 =?us-ascii?Q?F0=2F8vX15aFtJF6VrmsuLc+KLC1C1zDWqH1FIslD?=
 =?us-ascii?Q?c2g+GoDDoU7cx07KmzYDFwe3IQYhRu4SQZB7iTI?=
 =?us-ascii?Q?3wkLC94mP6DDjAobhMzHToOd0ChHDOFXdlXtTGE?=
 =?us-ascii?Q?tjh1aJEqtpfZuN+dsGO1rdKdUxa58JiGXrrkfvR?=
 =?us-ascii?Q?0kLQgu4tcueyKSCK4vnxE7kT0pS82L4941vfuzi?=
 =?us-ascii?Q?iDx3Nyfzm4CoB0kDNCCDw=3D=3D?=
To: buildroot@buildroot.org
X-Entity-ID: 8hTT1BSDhM31GKM3tJ7/LQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=athaariq.my.id; 
 h=from:subject:mime-version:to:cc:content-transfer-encoding:
 content-type;
 s=s1; bh=Z2bzrRK+aRtng4oBAjni1TMmzLNPNb8GGcrIRblove0=;
 b=VeIXFNISI7YwisRYacX3ixkt4H2MKXuLgZc8YdDUFnshE92ax1zI7gcPzJBLbfuWZ0Eh
 lO5wxAuoaD39HRAVWCKCvBq+Cp+vUwOMytIRK17eIewZcunPGthDHfYQRl7G25B9oiqpBL
 XfRl3NY9Y2ZhrDNKy50gEQ5iiCY4VryUSmyAnOkIUCOtcPOUbl1pvLNXgD1tciwnVhIdna
 IBtrJrH7CHBJcVmQ9V+iaJuB0mnQ60j6q6K9JJ5EwrFQONTxaclkchGNsvlwUgP1cCqHfZ
 2j4Ob45+rF1BBTKcellvUsqteDKVC66dSu1LD87dOHPGluUclk7iPv0WzVVUzdGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=s1 header.b=VeIXFNIS
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi4: bump kernel version to
 5.15.68
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

First of all, kernel support for Raspberry Pi is way too old relative to stable version. Second, we actually have several bug fixes regarding the kernel including HDMI hotplug and more problems on graphic stacks. However, I only have Raspberry Pi 4B so I cannot test the changes for other Raspberry Pi models. For anyone who has those boards, please help us to bump and test the kernel.

Signed-off-by: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
---
 board/raspberrypi/linux.fragment       |  7 +++++++
 configs/raspberrypi4_64_defconfig      | 10 +++++++---
 configs/raspberrypi4_defconfig         | 11 ++++++++---
 package/rpi-firmware/rpi-firmware.hash |  2 +-
 package/rpi-firmware/rpi-firmware.mk   |  2 +-
 package/rpi-userland/rpi-userland.hash |  2 +-
 package/rpi-userland/rpi-userland.mk   |  2 +-
 7 files changed, 26 insertions(+), 10 deletions(-)
 create mode 100644 board/raspberrypi/linux.fragment

diff --git a/board/raspberrypi/linux.fragment b/board/raspberrypi/linux.fragment
new file mode 100644
index 0000000000..798b2e91da
--- /dev/null
+++ b/board/raspberrypi/linux.fragment
@@ -0,0 +1,7 @@
+# Dynamic CPU Clock
+CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=n
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+
+# Fix Kernel Module won't Load
+CONFIG_MODULE_COMPRESS_XZ=n
+CONFIG_MODULE_COMPRESS_NONE=y
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 5942f7c4e1..6d90a8f004 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -6,13 +6,14 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,155b736f0ff883415d374ba743473f5ef146814b)/linux-155b736f0ff883415d374ba743473f5ef146814b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi4-64/linux.fragment"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -23,6 +24,9 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
 BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4-64/config_4_64bit.txt"
+BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI=y
+BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT=y
+BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI=y
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 4e5580c140..f0947c329c 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -6,13 +6,14 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,155b736f0ff883415d374ba743473f5ef146814b)/linux-155b736f0ff883415d374ba743473f5ef146814b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi4/linux.fragment"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -23,6 +24,10 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
 BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
+BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI=y
+BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT=y
+BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI=y
+BR2_PACKAGE_RPI_USERLAND=y
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index ec13115f3b..46acc06176 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33aea2cb9c3be94c3dd6a96fbb3443eee5af1dc5fc9140e1fadc50832983064e  rpi-firmware-3f20b832b27cd730deb6419b570f31a98167eef6.tar.gz
+sha256  f4da50526880b0731ef38d0d4fd3de8b80354f3b2c6bfceacd4f7861af8eafad  rpi-firmware-ff5eaaa640ff1620b9eeff6650548eab619ae53a.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d4d1d07b3f..c1128b4228 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 3f20b832b27cd730deb6419b570f31a98167eef6
+RPI_FIRMWARE_VERSION = ff5eaaa640ff1620b9eeff6650548eab619ae53a
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index b837cfe709..c35fbe4977 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bb682f3c20bc5c7877531d5666c8dcc674a2f347aa792cf979dc0b07b6261e77  rpi-userland-14b90ff9d9f031391a299e6e006965d02bfd1bb1.tar.gz
+sha256  b5718b34730069b7c3748cefb528696267c5bf9ba1e12df4f668640c50849125  rpi-userland-54fd97ae4066a10b6b02089bc769ceed328737e0.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1204196e19..8552b6aa11 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 14b90ff9d9f031391a299e6e006965d02bfd1bb1
+RPI_USERLAND_VERSION = 54fd97ae4066a10b6b02089bc769ceed328737e0
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
