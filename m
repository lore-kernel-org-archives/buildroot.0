Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC5CC4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 03:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EAC242420;
	Sat,  2 Dec 2023 03:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EAC242420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9Bz-8t0Tykm; Sat,  2 Dec 2023 03:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED66342440;
	Sat,  2 Dec 2023 03:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED66342440
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5861BF2CD
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 03:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E99EB40363
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 03:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E99EB40363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fe4pnttP_02A for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 03:02:38 +0000 (UTC)
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com
 [203.205.221.210])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4A92400A4
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 03:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A92400A4
Received: from localhost.localdomain ([183.172.149.93])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id F2544B; Sat, 02 Dec 2023 11:00:15 +0800
X-QQ-mid: xmsmtpt1701486017t34f1fzvp
Message-ID: <tencent_B943890EC722C096B1ED978065E266E63F06@qq.com>
X-QQ-XMAILINFO: NKv2G1wnhDBnNG4pXCsQrFV1My6xJm0rll2g8o3iTZGVVLEIm7JrtdQ1XDToGf
 wCQUp7HOGrc0t84Yg7Qr9q+OJGq8oDvwJ01FdG5wHGu1UBJe/+chlfVVTiIjwHscCaQhlAVW3KYY
 +SDRFM06zp1dzmGSvAFjya/1htWAZ+8qMy7k7ngFyoLkxtX7Qj8iD9eoHaQISfFlLy3Ov0ge+12D
 gJubnuOOtTyjdTxYD/PZeYds9N64xAf/EwqjW3zPvutRf+02y1pgkSEXkr38R0zDASZPJOTuhLht
 6vMnWIXc4jgb7W9Ma/VccIeAUfBEo4C+vTbxGGN0Hs1bMfp06dVHn0nqc4PIxX3/QRo4PFHY2ha/
 y67QLH45n7kYE29kqIBQuosm3l8zKZyVW2sCQIqC57BKBtdt6DS0tUxGqWo93Z/EZYRUIwOdf6Fj
 JFYpQNhGczCDRaJrgPwDOWyVW4dTGvsxBRhlVPVed7c5O86rtZgkHXO+/axh+jKtzKDaO5n2iNGi
 mavqPAoIJwsJgNpsQBXicEfPvvBwM9/osYrYlxJI6mp9neTtpPzlG+Btz9vQPcJcfTQbKLkmKPKU
 cb9rh14MV11KcQJ/2qGmnXpC/e3a9e8U/EK8Fw4C25jy5T5drHaBn5dTz8MI7bwS2vdYXF54k1wZ
 ammifR2Z9peVXBAI7VI7Tk0vc9YVOkfKJGwv2kL0slJNpGg/FQCeajik9xRrg9YTImxCse2G2ag3
 Ww1iD7qnfRPSZT761mL4QLTaJcyMQi0eRejAeF7Y+FHQy9UAYm+Zm3MeTuhaCPhkdQHX5/XvZz1K
 CUFZcTIcRS4oeK75Z9VmvqA/opzUtG6zrbz/IauOaM+I1RB0CubD1YD51RCBzRNTkSRToNPM02fI
 V5uxGU9EHElwiJdX6dB2GaFlGJ2+xNFZJEuo2uFWFx9LBv4rcD/DoCsjP5OsF6FrDcqaQnaEqAp0
 uN2b2eLO/VInDhWfOozizZH1AbR/pJeKtLh1SjAfI2oUgOzxlUomN+dIeXDKJj
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 10:57:47 +0800
X-OQ-MSGID: <20231202025745.11752-2-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231202025745.11752-1-hanyuan-z@qq.com>
References: <20231202025745.11752-1-hanyuan-z@qq.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1701486149; bh=XxUPthMXhCOjDva9cgMHh4A4YSSTdU9FngJ7tw2MrtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=otDmbTmwmSLSb2gs0ClqUxFEhs6Msu7yTRCAPXj6FD8RLWp+n+ENhtswIESsbUqWW
 QkWD3G3W602yfvy9TW1SOfjl0+lBO8J7TQT5J6DlVBlxILHbtxxMZkodK4Bu+RMxXx
 mJLJPMfZyPpeds5/Idgl2EMKv9spk4UNPf7Ze5nk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=otDmbTmw
Subject: [Buildroot] [PATCH v2 2/2] package/milkv-duo: add packages for
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

This commit adds the packages that are necessary for milkv-duo image's
generating and configurations.

Co-authored-by: Emil S <emil.soltys@outlook.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
---
 package/Config.in                             |   2 +
 package/milkv-duo-libraries/Config.in         |  65 +++++++++++
 .../milkv-duo-libraries.mk                    |  51 +++++++++
 .../milkv-duo-smallcore-freertos/Config.in    |  21 ++++
 .../milkv-duo-smallcore-freertos.mk           | 108 ++++++++++++++++++
 5 files changed, 247 insertions(+)
 create mode 100644 package/milkv-duo-libraries/Config.in
 create mode 100644 package/milkv-duo-libraries/milkv-duo-libraries.mk
 create mode 100644 package/milkv-duo-smallcore-freertos/Config.in
 create mode 100644 package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..5acd6fce31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -560,6 +560,8 @@ endmenu
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
 	source "package/mhz/Config.in"
+	source "package/milkv-duo-libraries/Config.in"
+	source "package/milkv-duo-smallcore-freertos/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/milkv-duo-libraries/Config.in b/package/milkv-duo-libraries/Config.in
new file mode 100644
index 0000000000..783e98560b
--- /dev/null
+++ b/package/milkv-duo-libraries/Config.in
@@ -0,0 +1,65 @@
+config BR2_PACKAGE_MILKV_DUO_LIBRARIES
+	bool "milk-v duo libraries"
+	depends on BR2_riscv
+	help
+	  Those packages provide board-specific hardware tools and
+	  firmware for the Milk-V Duo platform.
+
+if BR2_PACKAGE_MILKV_DUO_LIBRARIES
+
+config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+	bool "milkv-duo-firmware-fsbl"
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
+config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB
+	bool "64 MiB free ram"
+	default n
+	depends on BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
+	help
+	  Say Y to this will disable the ION in order to
+	  have the all 64MiB Free memory.
+
+config BR2_PACKAGE_MILKV_DUO_PINMUX
+	bool "duo-pinmux tool"
+	default n
+	help
+	  Say Y to this will compile the duo-pinmux, which can
+	  get or set function of any Milk-V Duo GPIO Pin. More info at
+
+	  https://milkv.io/docs/duo/application-development/pinmux
+
+	  https://github.com/shodan8192/milkv-duo-pinmux
+
+config BR2_PACKAGE_MILKV_DUO_FEATURES
+	bool "duo usb features"
+	default n
+	select BR2_PACKAGE_DHCPCD
+	select BR2_PACKAGE_DNSMASQ
+	select BR2_PACKAGE_DROPBEAR
+	select BR2_PACKAGE_LRZSZ
+	select BR2_PACKAGE_HTOP
+	help
+	  Say Y to this will copy the cvitek usb shell scripts to have
+	  the USB features. The role could be configured at
+
+	  /etc/milkv-duo.conf
+
+	  Supported usb functions are rndis, host and mass-storage.
+	  By default Duo has the LED blinking. It could be configured
+	  in that conf file as well. Say Y to this will also select
+	  some packages automatically, to have the same experience
+	  with the official release.
+
+endif
diff --git a/package/milkv-duo-libraries/milkv-duo-libraries.mk b/package/milkv-duo-libraries/milkv-duo-libraries.mk
new file mode 100644
index 0000000000..a5cf40a764
--- /dev/null
+++ b/package/milkv-duo-libraries/milkv-duo-libraries.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# milkv-duo-libraries
+#
+################################################################################
+
+MILKV_DUO_LIBRARIES_VERSION = f359994bd497f942bb67734280d81f6640c7c168
+MILKV_DUO_LIBRARIES_SITE = $(call github,milkv-duo,milkv-duo-buildroot-libraries,$(MILKV_DUO_LIBRARIES_VERSION))
+MILKV_DUO_LIBRARIES_INSTALL_STAGING = YES
+MILKV_DUO_LIBRARIES_DEPENDENCIES = host-python3 host-mtools
+MILKV_DUO_LIBRARIES_FSBL_64MB = ION
+
+ifeq ($(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB),y)
+MILKV_DUO_LIBRARIES_FSBL_64MB = 64MB
+endif
+
+define MILKV_DUO_LIBRARIES_BUILD_CMDS
+	if [ $(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL) = y ]; then \
+		$(MAKE) -C $(@D)/firmware \
+		ARCH=riscv BOOT_CPU=riscv CHIP_ARCH=cv180x \
+		PROJECT_FULLNAME=cv1800b_milkv_duo_sd \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		FREE_RAM_SIZE=$(MILKV_DUO_LIBRARIES_FSBL_64MB) \
+		bl2; \
+	fi
+
+	if [ $(BR2_PACKAGE_MILKV_DUO_PINMUX) = y ]; then \
+		$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-I $(@D)/pinmux/include $(@D)/pinmux/src/*.c -o $(@D)/pinmux/duo-pinmux; \
+	fi
+endef
+
+define MILKV_DUO_LIBRARIES_INSTALL_STAGING_CMDS
+	if [ $(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL) = y ]; then \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/build/cv180x/bl2.bin $(BINARIES_DIR)/bl2.bin; \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/plat/cv180x/chip_conf.bin $(BINARIES_DIR)/chip_conf.bin; \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/plat/cv180x/fiptool.py $(BINARIES_DIR)/fiptool.py; \
+		$(INSTALL) -D -m 0644 $(@D)/firmware/plat/cv180x/multi.its $(BINARIES_DIR)/multi.its; \
+		$(INSTALL) -D -m 0755 $(@D)/firmware/test/cv181x/ddr_param.bin $(BINARIES_DIR)/ddr_param.bin; \
+	fi
+
+	if [ $(BR2_PACKAGE_MILKV_DUO_PINMUX) = y ]; then \
+		$(INSTALL) -D -m 0755 $(@D)/pinmux/duo-pinmux $(TARGET_DIR)/usr/bin/; \
+	fi
+
+	if [ $(BR2_PACKAGE_MILKV_DUO_FEATURES) = y ]; then \
+		cp $(@D)/overlay/* -r $(TARGET_DIR); \
+	fi
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
