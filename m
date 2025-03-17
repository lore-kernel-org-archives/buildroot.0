Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F22C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 17:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB4C98142B;
	Mon, 17 Mar 2025 17:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1Aj2RvZpwCy; Mon, 17 Mar 2025 17:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3447B8136D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3447B8136D;
	Mon, 17 Mar 2025 17:41:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E66EC12E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 832B860AED
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVOXro38I6GG for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 17:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B610B60A61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B610B60A61
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B610B60A61
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:40:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A45C4434D;
 Mon, 17 Mar 2025 17:40:28 +0000 (UTC)
Date: Mon, 17 Mar 2025 18:40:24 +0100
MIME-Version: 1.0
Message-Id: <20250317-bootloaders-menuconfig-v1-2-8f893d3bcf5f@bootlin.com>
References: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
In-Reply-To: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Neal Frager <neal.frager@amd.com>, 
 Alistair Francis <alistair@alistair23.me>, Anand Gadiyar <gadiyar@ti.com>, 
 Bryan Brattlof <bb@ti.com>, Dick Olsson <hi@senzilla.io>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Lee Jones <lee.jones@linaro.org>, Sergey Matyukevich <geomatsi@gmail.com>, 
 Simon Dawson <spdawson@gmail.com>, Xuanhao Shi <X15000177@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhisehsvghniihilhhlrgdrihhopdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehgrgguihihrghrs
 ehtihdrtghomhdprhgtphhtthhopegiudehtddttddujeejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1742233229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXQA0Kxwf7gwCbxlNbIaD0FUgVUBesMsSX5++d/Rulk=;
 b=lC8wjYijgm/O+SLE+RAlxfxNY0/AoZZ9WpZRrkVxrCUAYeIWPu8o9UNE6SiW+AuGEv8Y4b
 kL3wOELSywuvGEVJGKgKey5JOHHf0cQ2PhURhQ24GqHaqjTXg1GOTNmqb6fzqlHtE5gQeK
 CdxEuttblwZjW6oBggrxiYS07Q6UDH0AF49Gti/4TsDFEoZrG6OcQg9VF6KJ79VitLi3Sm
 LZ45sy7Ndp5FsmSLQLtsVjctbNnNPTl38vWfwU5i8kX1iBqjZUAAeRZ/1fyFhZ1m/6ZaA6
 o90Tol+Q/T+j4gyNbLvcT1/5xuxPUFxiHEvEpNk4UHE1ARtTHDP961FPB/7O3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lC8wjYij
Subject: [Buildroot] [PATCH 2/2] boot: move package options to a submenu
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change all Kconfig entries for packages in the "Bootloaders" menu to
submenus.

Currently many bootloaders and firmwares in this menu use a 'config'
keyword and thus menuconfig presents their sub-options as a flat list in
the same menu. This is not very convenient as some have a lot of
sub-options, and in (more and more common) configurations with multiple
such packages enabled the menuconfig screen becomes very crowded. Moreover
options of 'string' type don't have a visible indentation when their value
exceeds a few characters, thus making it visually hard to grasp which
package the various options belong to.

Non-bootloader packages having suboptions usually use a 'menuconfig'
keywork to have sub-options in a submenu. Do the same for packages in the
"Bootloaders" menu which have more than one sub-option.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 boot/afboot-stm32/Config.in         | 2 +-
 boot/arm-trusted-firmware/Config.in | 2 +-
 boot/at91bootstrap3/Config.in       | 2 +-
 boot/barebox/Config.in              | 2 +-
 boot/boot-wrapper-aarch64/Config.in | 2 +-
 boot/grub2/Config.in                | 2 +-
 boot/mxs-bootlets/Config.in         | 2 +-
 boot/opensbi/Config.in              | 2 +-
 boot/optee-os/Config.in             | 2 +-
 boot/syslinux/Config.in             | 2 +-
 boot/ti-k3-r5-loader/Config.in      | 2 +-
 boot/uboot/Config.in                | 2 +-
 boot/xilinx-embeddedsw/Config.in    | 2 +-
 boot/xilinx-prebuilt/Config.in      | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/boot/afboot-stm32/Config.in b/boot/afboot-stm32/Config.in
index 23372705ad161fac957045dc4348e41c7e9fdde6..23d6eda5d4744bd6a73d5e8ee0bac4d65f1a5465 100644
--- a/boot/afboot-stm32/Config.in
+++ b/boot/afboot-stm32/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_AFBOOT_STM32
+menuconfig BR2_TARGET_AFBOOT_STM32
 	bool "afboot-stm32"
 	depends on BR2_arm
 	help
diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index c8deede9cd750d9642e84eb66a386e0af07d114a..869763384b887c77bd4218c25dae2e019a4c3bd9 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_ARM_TRUSTED_FIRMWARE
+menuconfig BR2_TARGET_ARM_TRUSTED_FIRMWARE
 	bool "ARM Trusted Firmware (ATF)"
 	depends on (BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A)
 	help
diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index b3e18fce7cd15f903777df5b8b3b368712c39f1d..35bdb28162beda956ff4ffd17772b491bf5f5ca0 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_AT91BOOTSTRAP3
+menuconfig BR2_TARGET_AT91BOOTSTRAP3
 	bool "AT91 Bootstrap 3+"
 	depends on BR2_arm926t || BR2_cortex_a5 || BR2_cortex_a7
 	help
diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 0bd3386795c534a95d9e3e998352f9a56379099b..c3cb0b33325328415349408f5be01a4a32dfcf12 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_BAREBOX
+menuconfig BR2_TARGET_BAREBOX
 	bool "Barebox"
 	help
 	  The Barebox bootloader, formerly known as U-Boot v2.
diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
index cf7389282f2fe4710aea5f018a9a066877a262ac..dfefb7a9fd1d044411b1208655b094b24ae36878 100644
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -2,7 +2,7 @@ comment "boot-wrapper-aarch64 needs a Linux kernel to be built"
 	depends on BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
-config BR2_TARGET_BOOT_WRAPPER_AARCH64
+menuconfig BR2_TARGET_BOOT_WRAPPER_AARCH64
 	bool "boot-wrapper-aarch64"
 	depends on BR2_aarch64
 	depends on BR2_LINUX_KERNEL
diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e1f2fc105e464d85da2443b4dab1e53559fde513..ecee9ef74cdca0847d4ad386a0dc281ced07725b 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -7,7 +7,7 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	default y if BR2_RISCV_64
 	depends on BR2_USE_MMU
 
-config BR2_TARGET_GRUB2
+menuconfig BR2_TARGET_GRUB2
 	bool "grub2"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR
diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index 8f9334b610bc37f446e7805b033bb8af6a345058..00819c5ad6fa4827729e6f4dcf48cef015738d9e 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_MXS_BOOTLETS
+menuconfig BR2_TARGET_MXS_BOOTLETS
 	bool "mxs-bootlets"
 	depends on BR2_arm
 	depends on BR2_TARGET_BAREBOX || BR2_LINUX_KERNEL || \
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 98d6103ed6bd81a8293edde07724c0aee8bad3d3..37f06cd99dbed43edf47e2682af965cef637ea51 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_OPENSBI
+menuconfig BR2_TARGET_OPENSBI
 	bool "opensbi"
 	depends on BR2_riscv
 	help
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 6c4afccc7ade6396dc20855a4837d30dbf4f8467..563f192b187ef32c215fb450c695629c008edc42 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_OPTEE_OS
+menuconfig BR2_TARGET_OPTEE_OS
 	bool "optee_os"
 	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A || BR2_RISCV_64
 	help
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index c95dac1804a88b534dc86dc5a7fa92389141a6c8..2891eae013846b57d5353f7b56b4fbf943776add 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_SYSLINUX
+menuconfig BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
 	# Make sure at least one of the flavors is installed
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index fe429bb8b4e518e802bb81757dafcec2f57f590b..b4fb46e55b83b47f72971168ab1acd964ff390e3 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_TI_K3_R5_LOADER
+menuconfig BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
 	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 10098ed227b6d6b22be7bfe1a1e73b307e242dfa..6739d53cb8fe418c9f0061455081a48483d2b8fa 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_UBOOT
+menuconfig BR2_TARGET_UBOOT
 	bool "U-Boot"
 	help
 	  Build "Das U-Boot" Boot Monitor
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 007b24e6685b63c15aed417e396e3320fe7bfb28..a27253d594b70a871ddd49fca411daef9488ef06 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,7 +1,7 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
-config BR2_TARGET_XILINX_EMBEDDEDSW
+menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
 	depends on BR2_aarch64
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 4e0850f3ce588084c2a21a5c47846abefca15b6a..b95df5cbf483ddc152c3ae50746fd6bcba9dce9e 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_XILINX_PREBUILT
+menuconfig BR2_TARGET_XILINX_PREBUILT
 	bool "xilinx-prebuilt"
 	depends on BR2_aarch64
 	help

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
