Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8CC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39CB41DE9;
	Tue,  6 Feb 2024 08:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39CB41DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3caV3Gg2PuUd; Tue,  6 Feb 2024 08:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5565B41DED;
	Tue,  6 Feb 2024 08:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5565B41DED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E86AF1BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id E3167820A9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id cvtWf4Zcg-1P for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.190;
 helo=out203-205-221-190.mail.qq.com; envelope-from=hanyuan-z@qq.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BC9881FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC9881FA2
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com
 [203.205.221.190])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 8BC9881FA2
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:14:07 +0000 (UTC)
Received: from localhost.localdomain ([36.101.134.205])
 by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
 id 1F32BCBA; Tue, 06 Feb 2024 16:07:51 +0800
X-QQ-mid: xmsmtpt1707206871txqcjnily
Message-ID: <tencent_C1B8E4EBC03278F3FE3FA504818319E0C005@qq.com>
X-QQ-XMAILINFO: NoSKVpKsmOWebW6ecxX5CQsRZfjtotxGlYmWLddMA9WEM6W3EYRh8oh+7ExY+k
 ZAQZcMHfQtriWJV6jO9A5/WWEpWsJufvgumEYnaSwaAoovey2v7mfPvWL7Xav9Jl60imq3W60cti
 j58CPcy4EGPTX9nlhmilIgYTz7kMdPmS5F84/W6DFqxGS3q2KTINjzWVCYcaQ8Ka5kVDcLInla07
 8vI9LycZ5tATfB1grCQqY8GvgBKdZoLD5b5Nhovl34+Jw583x9F+DPGdq2U5xjCto31eaY4bINfG
 7YzHnd5hJmEBwRfMgJczp6RiB+A5ahB1BEzSmOw8cS6FAURR+/MDAjZQq0bK3uJt16A8WEHEo0OV
 8URetqqx5n/UPI8ChnE3pxtkVSnnxWjL8v+OhtmJJCjZJzUcgVXL6eyhm7d3O+4XoJNeJ8GsKnqv
 YllAtQ4o9zwy7QncaoIzZoS9KmHtP2Ejx2QIuqx6c657ceTYWokw+w5sIqJ98AUBX7+emj0drjVN
 mgw/4HGMAnujz9NEQA+wZNx8p4nrKl8GMLy+VMv3M1fqBv6oKiamYBcIp2zhz12FbP1mUpDVVnlf
 miQ8FQxsaOFx9jvDkI44coAAvTVDiNxLD6fcihoKUNzEqGauGEsQhuTU4CvAYgssY0U2V6i5p5NG
 gZgrnm9wCnQy9nrqbNB6RKLTGEoLvMsxxdqlI9mbXApAZmtvSPzfkLTcp/+4PgQKUrH2vOfFc07Y
 esw05o3NfF+lmWW663f1NMXnVog1U5NjZ26h905PgcDR/DDuNaKOPtgb0i115QpxC5KZvBhG+8GJ
 G+6TW48bEv5KdhJYJu21X0cdq4882E22TgfsRSXU8XDo8Kula6HKlfrw5eSMZD5OuelO6YOTcgSv
 y7T9+9K+/fp0GoeQi4wN7JyoswlqqZDCfJUw4NNjqIs3S2AFCNY61OXFDOcgtanFQcWqcns3Ak79
 QLuo4MZwPDi2TBRstx4RJvt+sa9uVTsMfdrxOJlRlKZc56hV8AhU+pgyZxO0X2
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 16:06:02 +0800
X-OQ-MSGID: <20240206080603.28916-1-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1707207243; bh=60LLN9tnNirtMsji4+NCKRNvLRPZQI4gHDcde4VLprk=;
 h=From:To:Cc:Subject:Date;
 b=HQafHgsXhiJ25WvDpHDudek7/UzVf3auQwq1yPl3qHgUS+CTn+aAkPg4GjnH/Hup5
 pLbWNdxAkNCWkU6FlPKUp2vyK/2ED9OwHmAAU0qnZCZeT0sI71hOaJDuXKy/+bRomS
 ADzvSO8c8ce3zzP6VEawlWYxclomcAesy0mXlcbs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qq.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=HQafHgsX
Subject: [Buildroot] [PATCH v3 1/2] package/milkv-duo: add packages for
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
Cc: Emil S <emil.soltys@outlook.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Hanyuan Zhao <hanyuan-z@qq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the packages that are necessary for milkv-duo image's
generating and configurations.

https://github.com/milkv-duo/duo-buildroot-sdk/

Co-authored-by: Emil S <emil.soltys@outlook.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
---
 package/Config.in                             |   2 +
 package/milkv-duo-libraries/Config.in         |  63 ++++++++++
 .../milkv-duo-libraries.mk                    |  51 +++++++++
 .../milkv-duo-smallcore-freertos/Config.in    |  21 ++++
 .../milkv-duo-smallcore-freertos.mk           | 108 ++++++++++++++++++
 5 files changed, 245 insertions(+)
 create mode 100644 package/milkv-duo-libraries/Config.in
 create mode 100644 package/milkv-duo-libraries/milkv-duo-libraries.mk
 create mode 100644 package/milkv-duo-smallcore-freertos/Config.in
 create mode 100644 package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk

diff --git a/package/Config.in b/package/Config.in
index 7fc383da83..2c560377b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -564,6 +564,8 @@ endmenu
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
index 0000000000..ea4d0aadac
--- /dev/null
+++ b/package/milkv-duo-libraries/Config.in
@@ -0,0 +1,63 @@
+config BR2_PACKAGE_MILKV_DUO_LIBRARIES
+	bool "milk-v duo libraries"
+	depends on BR2_riscv
+	help
+	  Those packages provide board-specific firmware and
+	  hardware tools for the Milk-V Duo platform.
+
+	  https://github.com/milkv-duo/milkv-duo-buildroot-libraries
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
+	  compile it, generating the ATF bl2.bin. At the mean time, we
+	  will use the fiptool.py in this package to create the binary
+	  file fip.bin to pack the opensbi, u-boot and so on.
+
+	  If you intend to generate the whole sdcard image or the
+	  fip.bin for milk-v duo, you must say Y to this package!
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
index 0000000000..8503932461
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
+	  https://github.com/milkv-duo/milkv-duo-smallcore-freertos
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
