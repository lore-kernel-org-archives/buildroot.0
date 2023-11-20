Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDBFC197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 15:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D41408FC;
	Mon, 20 Nov 2023 15:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D41408FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGKEDSNjqeHJ; Mon, 20 Nov 2023 15:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCBC240908;
	Mon, 20 Nov 2023 15:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCBC240908
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF3AE1BF2F1
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 15:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5BBE40908
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 15:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5BBE40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5ZhzZsUovfd for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 15:22:38 +0000 (UTC)
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com
 [203.205.221.205])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D41E3408FC
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 15:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D41E3408FC
Received: from localhost.localdomain ([59.66.138.28])
 by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
 id 539820A2; Mon, 20 Nov 2023 23:20:57 +0800
X-QQ-mid: xmsmtpt1700493659t6snew9so
Message-ID: <tencent_1F9B71C157A865DA66E2FF41C913C72A4006@qq.com>
X-QQ-XMAILINFO: OZsapEVPoiO6UJsHYHsAA/XreGI3BILjIgB2KIwX5+UcY4qWsIIIO5D2pKiOuc
 MSpQhrhFzq2ePLLO7rmcFGuErI74g+ps8KzAb4LyM5iZqZT/wwj6CmZrHBhwXQUugAtmzRBMuJTk
 xa1rvsu6S2t4J8AHgmDM/wlj1NBToQgLh5D9Fy+ng8WIXo94/3nNPnvY+f9M3c69yjgZcRZXkzMD
 Trik4ILbtKoTVz/j6ILp7KyC9DyZc0iv2iTwyFleWWMVDVaQ++bbKiJ+1Hhxczd4Is8HUxILm0tp
 2KZRJ2foekQrcLC4aTr1+Yx/m4IrO0WTbSAt0C5Rzae1ci5YFNOA1pCDoP2y6gKj7fOVHLZl9c5o
 gck9x7y+1bk3tNVb8WbhJy/hEuRpKRs2XY1S9F2ZA9Q7a/WvBdKk6ChFg8EobNQxYb1XNcyXX5Dy
 zDfwRfzw0p2t85c54oitckCgQUzkZp8fjBp4KngwQOAKp8I5rafCSutp6WeI6/8/OPBywyz2A5Xo
 LOTU9MRJMqylQ+vm9VktjDBg4AfWbTUpklbvPVklvrGd9PUX65Fy4w4lbFDUyF/8ZhU7b71AXU6C
 o6eu0etnR8V3982RPTZsFLfT4yw+3+LTnXVTGweRNnd2aFl+uzRYjPKeAoACY1R9yBR8lGkJFyr5
 aRjR2XoGH1MlUC4sxV1CHN13PvUR49x7H5uXz9vs5ZZZ9cazVWghLHd7+wesp7/mzrc7VfynfHIB
 XXAaJKLVabU//L0M114iXMQs33aN8zSJl4ueuYm6XXN7UsJ0IDuI4r8SkU8cYCJngA8sQiZo+t+l
 ok7GqWtgR9l7qd9eO85g4qkWDoWMUnxlB7nIjouP9/ec8h4IQMFtf61IN1wUveiAr6ax3XloZ4m4
 04WaXUjkQ3VfYwgQqR9Oy/GuCFZB7lSJXyPDPC4EUuF3/RiWR5GxrmyxC18TUJs5fTV761hdx5QP
 UWYHOiIrcG1gqB89V+QICHQ7Mdf/aonR8PJFQUv9JwL1u9aCK7VD1wjoseBnY5RlpxrrpWc+g=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
To: buildroot@buildroot.org
Date: Mon, 20 Nov 2023 23:20:09 +0800
X-OQ-MSGID: <20231120152009.17774-2-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120152009.17774-1-hanyuan-z@qq.com>
References: <20231120152009.17774-1-hanyuan-z@qq.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1700493748; bh=P3P46t5qsS1EakXdiCLiKKYN83sxU/P2y7vFszf9YK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jWuz4J9CvE3oSVe9s8KwvaFRBc0eeAtE8TemwohAxXVGK4C2J+ve950yV/MAWjjcO
 nLaMU4qo492neJZ5eM5i9MEJQzAeP5CCRy6nQbAe3xSKjPr+gseABFUy0ArNAGRShK
 SyzN9/YApNNptA8MgHVNcsPnnk8IuYMbIlVYpzPM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=jWuz4J9C
Subject: [Buildroot] [PATCH 2/2] package/milkv-duo: add packages for
 milkv-duo
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
From: Hanyuan Zhao via buildroot <buildroot@buildroot.org>
Reply-To: Hanyuan Zhao <hanyuan-z@qq.com>
Cc: Emil S <emil.soltys@outlook.com>, Hanyuan Zhao <hanyuan-z@qq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the packages that are necessary for milkv-duo image's generating and configurations.

Co-authored-by: Emil S <emil.soltys@outlook.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
---
 package/Config.in                             |   3 +
 package/milkv-duo-firmware-fsbl/Config.in     |  29 +++++
 .../milkv-duo-firmware-fsbl.mk                |  34 ++++++
 package/milkv-duo-pinmux/Config.in            |  12 ++
 package/milkv-duo-pinmux/milkv-duo-pinmux.mk  |  19 +++
 .../milkv-duo-smallcore-freertos/Config.in    |  21 ++++
 .../milkv-duo-smallcore-freertos.mk           | 108 ++++++++++++++++++
 7 files changed, 226 insertions(+)
 create mode 100644 package/milkv-duo-firmware-fsbl/Config.in
 create mode 100644 package/milkv-duo-firmware-fsbl/milkv-duo-firmware-fsbl.mk
 create mode 100644 package/milkv-duo-pinmux/Config.in
 create mode 100644 package/milkv-duo-pinmux/milkv-duo-pinmux.mk
 create mode 100644 package/milkv-duo-smallcore-freertos/Config.in
 create mode 100644 package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..9c037f2ef4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,8 @@ menu "Firmware"
 	source "package/b43-firmware/Config.in"
 	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
 	source "package/linux-firmware/Config.in"
+	source "package/milkv-duo-firmware-fsbl/Config.in"
+	source "package/milkv-duo-smallcore-freertos/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
@@ -560,6 +562,7 @@ endmenu
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
 	source "package/mhz/Config.in"
+	source "package/milkv-duo-pinmux/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/milkv-duo-firmware-fsbl/Config.in b/package/milkv-duo-firmware-fsbl/Config.in
new file mode 100644
index 0000000000..e84914d487
--- /dev/null
+++ b/package/milkv-duo-firmware-fsbl/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+	bool "milkv-duo-firmware-fsbl"
+	depends on BR2_riscv
+	select BR2_PACKAGE_HOST_MTOOLS
+	help
+	  This package is obtained from
+	  https://github.com/milkv-duo/duo-buildroot-sdk,
+	  from which we download the first stage bootloader source and
+	  compile it, generating the atf bl2.bin. At the mean time, we
+	  will use the fiptool.py in this package to create the binary
+	  file fip.bin to pack the opensbi, u-boot and so on.
+
+	  If you are using Buildroot to generate the whole SD card
+	  Image or the fip.bin, you must say Y to this package!
+
+	  https://github.com/gtxzsxxk/milkv-duo-firmware-fsbl
+
+if BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+
+config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB
+	bool "64 MiB Free RAM"
+	default n
+	help
+	  Say Y to this will disable the ION in order to
+	  have the all 64MiB Free memory. Note that this
+	  is only an option for fsbl. You should also
+	  set the u-boot repo version to v2021.10_64mb.
+
+endif
diff --git a/package/milkv-duo-firmware-fsbl/milkv-duo-firmware-fsbl.mk b/package/milkv-duo-firmware-fsbl/milkv-duo-firmware-fsbl.mk
new file mode 100644
index 0000000000..c507361c0c
--- /dev/null
+++ b/package/milkv-duo-firmware-fsbl/milkv-duo-firmware-fsbl.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# milkv-duo-firmware-fsbl
+#
+################################################################################
+
+MILKV_DUO_FIRMWARE_FSBL_VERSION = c0d279ad5f2432ad62a4da6b7f42f0e0aa389d5c
+MILKV_DUO_FIRMWARE_FSBL_SITE = $(call github,milkv-duo,milkv-duo-firmware-fsbl,$(MILKV_DUO_FIRMWARE_FSBL_VERSION))
+MILKV_DUO_FIRMWARE_FSBL_INSTALL_STAGING = YES
+MILKV_DUO_FIRMWARE_FSBL_DEPENDENCIES = host-python3 host-mtools
+MILKV_DUO_FIRMWARE_FSBL_64MB = ION
+
+ifeq ($(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB),y)
+	MILKV_DUO_FIRMWARE_FSBL_64MB = 64MB
+endif
+
+define MILKV_DUO_FIRMWARE_FSBL_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+	ARCH=riscv BOOT_CPU=riscv CHIP_ARCH=cv180x \
+	PROJECT_FULLNAME=cv1800b_milkv_duo_sd \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	FREE_RAM_SIZE=$(MILKV_DUO_FIRMWARE_FSBL_64MB) \
+	bl2
+endef
+
+define MILKV_DUO_FIRMWARE_FSBL_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/build/cv180x/bl2.bin $(BINARIES_DIR)/bl2.bin
+	$(INSTALL) -D -m 0755 $(@D)/plat/cv180x/chip_conf.bin $(BINARIES_DIR)/chip_conf.bin
+	$(INSTALL) -D -m 0755 $(@D)/plat/cv180x/fiptool.py $(BINARIES_DIR)/fiptool.py
+	$(INSTALL) -D -m 0644 $(@D)/plat/cv180x/multi.its $(BINARIES_DIR)/multi.its
+	$(INSTALL) -D -m 0755 $(@D)/test/cv181x/ddr_param.bin $(BINARIES_DIR)/ddr_param.bin
+endef
+
+$(eval $(generic-package))
diff --git a/package/milkv-duo-pinmux/Config.in b/package/milkv-duo-pinmux/Config.in
new file mode 100644
index 0000000000..0a34d1434c
--- /dev/null
+++ b/package/milkv-duo-pinmux/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MILKV_DUO_PINMUX
+	bool "milkv-duo-pinmux"
+	help
+	  This package is obtained from
+	  https://github.com/milkv-duo/duo-buildroot-sdk
+	  from which we download source code of duo-pinmux.
+	  This tool can get or set function of any Milk-V Duo
+	  GPIO pin. More info at
+
+	  https://milkv.io/docs/duo/application-development/pinmux
+
+	  https://github.com/shodan8192/milkv-duo-pinmux
diff --git a/package/milkv-duo-pinmux/milkv-duo-pinmux.mk b/package/milkv-duo-pinmux/milkv-duo-pinmux.mk
new file mode 100644
index 0000000000..9749c49b4f
--- /dev/null
+++ b/package/milkv-duo-pinmux/milkv-duo-pinmux.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# milkv-duo-pinmux
+#
+################################################################################
+
+MILKV_DUO_PINMUX_VERSION = c0e32327aaf13490437f485a3fb04bbb4c60f00f
+MILKV_DUO_PINMUX_SITE = $(call github,milkv-duo,milkv-duo-pinmux,$(MILKV_DUO_PINMUX_VERSION))
+
+define MILKV_DUO_PINMUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-I $(@D)/include $(@D)/src/*.c -o $(@D)/duo-pinmux
+endef
+
+define MILKV_DUO_PINMUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/duo-pinmux $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
diff --git a/package/milkv-duo-smallcore-freertos/Config.in b/package/milkv-duo-smallcore-freertos/Config.in
new file mode 100644
index 0000000000..5a76b7e3d7
--- /dev/null
+++ b/package/milkv-duo-smallcore-freertos/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS
+	bool "milkv-duo-smallcore-freertos"
+	depends on BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+	select BR2_PACKAGE_HOST_CMAKE
+	help
+	  This package is obtained from
+	  https://github.com/milkv-duo/duo-buildroot-sdk,
+	  from which we download the FreeRTOS ported to Milk-V Duo
+	  into the Buildroot. This FreeRTOS will run in the small core
+	  and will not do anything because it is simply a template
+	  with some basic UART demos. You can realize your own ideas
+	  by adding code to
+
+	  output/build/milkv-duo-smallcore-freertos-hash/cvitek/task
+	  /comm/src/riscv64/comm_main.c
+
+	  If you say Y, then every time you make Buildroot, it will
+	  automatically compile and include the FreeRTOS into the
+	  fip.bin, which will then be packed into sdcard.img
+
+	  https://github.com/gtxzsxxk/milkv-duo-smallcore-freertos
diff --git a/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
new file mode 100644
index 0000000000..52028f3c90
--- /dev/null
+++ b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
@@ -0,0 +1,108 @@
+################################################################################
+#
+# milkv-duo-smallcore-freertos
+#
+################################################################################
+
+MILKV_DUO_SMALLCORE_FREERTOS_VERSION = 1dac21ade58b0f9a0a531cfe93ee319337a88d80
+MILKV_DUO_SMALLCORE_FREERTOS_SITE = $(call github,milkv-duo,milkv-duo-smallcore-freertos,$(MILKV_DUO_SMALLCORE_FREERTOS_VERSION))
+MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING = YES
+MILKV_DUO_SMALLCORE_FREERTOS_DEPENDENCIES = host-cmake host-ninja
+MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV = CROSS_COMPILE=$(TARGET_CROSS)
+
+define MILKV_DUO_SMALLCORE_FREERTOS_BUILD_CMDS
+	if [ ! -d $(@D)/cvitek/build/arch ]; then \
+		mkdir -p $(@D)/cvitek/build/arch; \
+	fi
+
+	cd $(@D)/cvitek/build/arch && \
+	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
+		-DTOP_DIR=$(@D)/cvitek \
+		-DRUN_TYPE=CVIRTOS \
+		-DRUN_ARCH=riscv64 \
+		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
+		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
+		$(@D)/cvitek/arch
+	cd $(@D)/cvitek/build/arch && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
+
+	if [ ! -d $(@D)/cvitek/build/kernel ]; then \
+		mkdir -p $(@D)/cvitek/build/kernel; \
+	fi
+
+	cd $(@D)/cvitek/build/kernel && \
+	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
+		-DRUN_ARCH=riscv64 \
+		-DTOP_DIR=$(@D)/cvitek \
+		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
+		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
+		$(@D)/cvitek/kernel
+	cd $(@D)/cvitek/build/kernel && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
+
+	if [ ! -d $(@D)/cvitek/build/common ]; then \
+		mkdir -p $(@D)/cvitek/build/common; \
+	fi
+
+	cd $(@D)/cvitek/build/common && \
+	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
+		-DRUN_ARCH=riscv64 \
+		-DTOP_DIR=$(@D)/cvitek \
+		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
+		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
+		$(@D)/cvitek/common
+	cd $(@D)/cvitek/build/common && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
+
+	if [ ! -d $(@D)/cvitek/build/hal ]; then \
+		mkdir -p $(@D)/cvitek/build/hal; \
+	fi
+
+	cd $(@D)/cvitek/build/hal && \
+	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
+		-DRUN_ARCH=riscv64 \
+		-DTOP_DIR=$(@D)/cvitek \
+		-DRUN_TYPE=CVIRTOS \
+		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
+		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
+		-DBOARD_FPGA=n \
+		$(@D)/cvitek/hal/cv180x
+	cd $(@D)/cvitek/build/hal && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
+
+	if [ ! -d $(@D)/cvitek/build/driver ]; then \
+		mkdir -p $(@D)/cvitek/build/driver; \
+	fi
+
+	cd $(@D)/cvitek/build/driver && \
+	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
+		-DRUN_ARCH=riscv64 \
+		-DTOP_DIR=$(@D)/cvitek \
+		-DRUN_TYPE=CVIRTOS \
+		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
+		-DBOARD_FPGA=n \
+		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
+		$(@D)/cvitek/driver
+	cd $(@D)/cvitek/build/driver && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
+
+	if [ ! -d $(@D)/cvitek/build/task ]; then \
+		mkdir -p $(@D)/cvitek/build/task; \
+	fi
+
+	cd $(@D)/cvitek/build/task && \
+	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
+		-DRUN_ARCH=riscv64 \
+		-DRUN_TYPE=CVIRTOS \
+		-DTOP_DIR=$(@D)/cvitek \
+		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
+		-DBOARD_FPGA=n \
+		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
+		$(@D)/cvitek/task
+	cd $(@D)/cvitek/build/task && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
+	cd $(@D)/cvitek/build/task && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target cvirtos.bin -- -v
+endef
+
+define MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/cvitek/install/bin/cvirtos.bin $(BINARIES_DIR)/cvirtos.bin
+	if [ ! -e $(BINARIES_DIR)/empty.bin ]; then \
+		touch $(BINARIES_DIR)/empty.bin; \
+	fi
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
