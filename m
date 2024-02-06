Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46D2C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B56B41F8A;
	Tue,  6 Feb 2024 15:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B56B41F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v--6vgOWRsm4; Tue,  6 Feb 2024 15:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2894441F94;
	Tue,  6 Feb 2024 15:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2894441F94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B88361BF423
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A363382064
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaFmwDJDV6Sg for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:02:46 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F22A082276
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F22A082276
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F22A082276
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:02:44 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XMy9rJqALoTDCXMy9r0AgT; Tue, 06 Feb 2024 16:02:41 +0100
Message-ID: <987c773c-fb81-4d09-afab-6657773ce26b@benettiengineering.com>
Date: Tue, 6 Feb 2024 16:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hanyuan Zhao <hanyuan-z@qq.com>, buildroot@buildroot.org
References: <tencent_C1B8E4EBC03278F3FE3FA504818319E0C005@qq.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <tencent_C1B8E4EBC03278F3FE3FA504818319E0C005@qq.com>
X-CMAE-Envelope: MS4xfKQPKTmQQEpZHfo3y1/nd8BBuLZguW9VdVM6cv7SwSgqvDu7llDvONBkKPHNcMkPZpxDZ1IdtdiYsJuAtuHwFfRhbi8U+QQJ0eGnE1kIGptU+EwnslRa
 Iq0XGyPWV64TJcUlYrec2+H7viIEPJuGd4sqXQr7DJTsWNo0NuVyxJkkd3ynqBUspcK3EFD/nvcY4HhvyK2JnvAxCCEzxA5AuHc7Wc3KibgXWSDqeuLni0Gm
 WQbW9UBdkNWLbvZinPv445R36e9lxCF20X6fi6eQgoacbkPPBoy/0gxPzkztf2kR6rGBFbsDB4ztrC/3qUEnC7/a3a2lA32BkN6AV29wjPk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707231762; bh=sP60T+B+5OcxJj9+byk1RCnsF09BDXIJwPs8VtGRTBk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FPa9+ceb6MIZNTwOvbiZMWPnWJ6RXikDygiWDnIY88p6fegjAs4HfZMXG3a0prsP+
 zXDTDc51tunQV8lrTRdLPyCBWFIGvZCwXIrvbGWokQtZV7CIBedaKAzfFKn+QNDXk2
 YGiDCMD8v6WQdgNIysCykgBLn693GBVHGB+2B1Mt7SKjTqdaiyISQxjkTA9qBRklWq
 2socnyukCRLwTYfEuNurZZamYV03YHM7hd1toMUq/CvtgEj6O6yH6SKHfQ0OgacLFx
 iDLBkTFyfSrl8xHuqH3Bn9SUJ916kZweSLIHH9Dt5j48OCRfoqWuh0BMWLoM+a6Dy9
 50K50DSDPb3wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FPa9+ceb
Subject: Re: [Buildroot] [PATCH v3 1/2] package/milkv-duo: add packages for
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
Cc: Emil S <emil.soltys@outlook.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Hanyuan,

please split this patch into 2 separate patches, one per package:
- milkv-duo-libraries
- milkv-duo-smallcore-freertos

On 06/02/24 09:06, Hanyuan Zhao via buildroot wrote:
> This commit adds the packages that are necessary for milkv-duo image's
> generating and configurations.
> 
> https://github.com/milkv-duo/duo-buildroot-sdk/

This ^^^ should be part of a cover letter and instead per package you
should point what the package does

> 
> Co-authored-by: Emil S <emil.soltys@outlook.com>
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
> ---
>   package/Config.in                             |   2 +
>   package/milkv-duo-libraries/Config.in         |  63 ++++++++++
>   .../milkv-duo-libraries.mk                    |  51 +++++++++
>   .../milkv-duo-smallcore-freertos/Config.in    |  21 ++++
>   .../milkv-duo-smallcore-freertos.mk           | 108 ++++++++++++++++++
>   5 files changed, 245 insertions(+)
>   create mode 100644 package/milkv-duo-libraries/Config.in
>   create mode 100644 package/milkv-duo-libraries/milkv-duo-libraries.mk
>   create mode 100644 package/milkv-duo-smallcore-freertos/Config.in
>   create mode 100644 package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7fc383da83..2c560377b4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -564,6 +564,8 @@ endmenu
>   	source "package/memtester/Config.in"
>   	source "package/memtool/Config.in"
>   	source "package/mhz/Config.in"
> +	source "package/milkv-duo-libraries/Config.in"
> +	source "package/milkv-duo-smallcore-freertos/Config.in"
>   	source "package/minicom/Config.in"
>   	source "package/msr-tools/Config.in"
>   	source "package/nanocom/Config.in"
> diff --git a/package/milkv-duo-libraries/Config.in b/package/milkv-duo-libraries/Config.in
> new file mode 100644
> index 0000000000..ea4d0aadac
> --- /dev/null
> +++ b/package/milkv-duo-libraries/Config.in
> @@ -0,0 +1,63 @@
> +config BR2_PACKAGE_MILKV_DUO_LIBRARIES
> +	bool "milk-v duo libraries"
> +	depends on BR2_riscv
> +	help
> +	  Those packages provide board-specific firmware and
> +	  hardware tools for the Milk-V Duo platform.

What about:
`
Package providing board-specific firmware and hardware tools for Milk-V
Duo platform.
`

> +
> +	  https://github.com/milkv-duo/milkv-duo-buildroot-libraries
> +
> +if BR2_PACKAGE_MILKV_DUO_LIBRARIES
> +
> +config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
> +	bool "milkv-duo-firmware-fsbl"
> +	select BR2_PACKAGE_HOST_MTOOLS
> +	help
> +	  This package is obtained from
> +	  https://github.com/milkv-duo/duo-buildroot-sdk,
> +	  from which we download the first stage bootloader source and
> +	  compile it, generating the ATF bl2.bin. At the mean time, we
> +	  will use the fiptool.py in this package to create the binary
> +	  file fip.bin to pack the opensbi, u-boot and so on.
> +
> +	  If you intend to generate the whole sdcard image or the
> +	  fip.bin for milk-v duo, you must say Y to this package!
> +
> +config BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB
> +	bool "64 MiB free ram"
> +	default n
> +	depends on BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
> +	help
> +	  Say Y to this will disable the ION in order to
> +	  have the all 64MiB Free memory.

Please add ...the ION(Camera Memory) in order...

This ^^^ is my understanding at least, of what ION is,

> +
> +config BR2_PACKAGE_MILKV_DUO_PINMUX
> +	bool "duo-pinmux tool"
> +	default n
> +	help
> +	  Say Y to this will compile the duo-pinmux, which can
> +	  get or set function of any Milk-V Duo GPIO Pin. More info at
> +
> +	  https://milkv.io/docs/duo/application-development/pinmux
> +
> +config BR2_PACKAGE_MILKV_DUO_FEATURES
> +	bool "duo usb features"
> +	default n
> +	select BR2_PACKAGE_DHCPCD
> +	select BR2_PACKAGE_DNSMASQ
> +	select BR2_PACKAGE_DROPBEAR
> +	select BR2_PACKAGE_LRZSZ
> +	select BR2_PACKAGE_HTOP
> +	help
> +	  Say Y to this will copy the cvitek usb shell scripts to have
> +	  the USB features. The role could be configured at
> +
> +	  /etc/milkv-duo.conf
> +
> +	  Supported usb functions are rndis, host and mass-storage.
> +	  By default Duo has the LED blinking. It could be configured
> +	  in that conf file as well. Say Y to this will also select
> +	  some packages automatically, to have the same experience
> +	  with the official release.
> +
> +endif
> diff --git a/package/milkv-duo-libraries/milkv-duo-libraries.mk b/package/milkv-duo-libraries/milkv-duo-libraries.mk
> new file mode 100644
> index 0000000000..a5cf40a764
> --- /dev/null
> +++ b/package/milkv-duo-libraries/milkv-duo-libraries.mk
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +# milkv-duo-libraries
> +#
> +################################################################################
> +
> +MILKV_DUO_LIBRARIES_VERSION = f359994bd497f942bb67734280d81f6640c7c168
> +MILKV_DUO_LIBRARIES_SITE = $(call github,milkv-duo,milkv-duo-buildroot-libraries,$(MILKV_DUO_LIBRARIES_VERSION))
> +MILKV_DUO_LIBRARIES_INSTALL_STAGING = YES
> +MILKV_DUO_LIBRARIES_DEPENDENCIES = host-python3 host-mtools
> +MILKV_DUO_LIBRARIES_FSBL_64MB = ION
> +
> +ifeq ($(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB),y)
> +MILKV_DUO_LIBRARIES_FSBL_64MB = 64MB
> +endif
> +
> +define MILKV_DUO_LIBRARIES_BUILD_CMDS
> +	if [ $(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL) = y ]; then \
> +		$(MAKE) -C $(@D)/firmware \
> +		ARCH=riscv BOOT_CPU=riscv CHIP_ARCH=cv180x \
> +		PROJECT_FULLNAME=cv1800b_milkv_duo_sd \
> +		CROSS_COMPILE=$(TARGET_CROSS) \
> +		FREE_RAM_SIZE=$(MILKV_DUO_LIBRARIES_FSBL_64MB) \
> +		bl2; \
> +	fi

Please for all occurences use Makefile "$(if ...)" statement instead of
"if [ ... = y ]"

> +
> +	if [ $(BR2_PACKAGE_MILKV_DUO_PINMUX) = y ]; then \
> +		$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-I $(@D)/pinmux/include $(@D)/pinmux/src/*.c -o $(@D)/pinmux/duo-pinmux; \
> +	fi
> +endef
> +
> +define MILKV_DUO_LIBRARIES_INSTALL_STAGING_CMDS
> +	if [ $(BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL) = y ]; then \
> +		$(INSTALL) -D -m 0755 $(@D)/firmware/build/cv180x/bl2.bin $(BINARIES_DIR)/bl2.bin; \
> +		$(INSTALL) -D -m 0755 $(@D)/firmware/plat/cv180x/chip_conf.bin $(BINARIES_DIR)/chip_conf.bin; \
> +		$(INSTALL) -D -m 0755 $(@D)/firmware/plat/cv180x/fiptool.py $(BINARIES_DIR)/fiptool.py; \
> +		$(INSTALL) -D -m 0644 $(@D)/firmware/plat/cv180x/multi.its $(BINARIES_DIR)/multi.its; \
> +		$(INSTALL) -D -m 0755 $(@D)/firmware/test/cv181x/ddr_param.bin $(BINARIES_DIR)/ddr_param.bin; \
> +	fi
> +
> +	if [ $(BR2_PACKAGE_MILKV_DUO_PINMUX) = y ]; then \
> +		$(INSTALL) -D -m 0755 $(@D)/pinmux/duo-pinmux $(TARGET_DIR)/usr/bin/; \
> +	fi
> +
> +	if [ $(BR2_PACKAGE_MILKV_DUO_FEATURES) = y ]; then \
> +		cp $(@D)/overlay/* -r $(TARGET_DIR); \
> +	fi
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/milkv-duo-smallcore-freertos/Config.in b/package/milkv-duo-smallcore-freertos/Config.in
> new file mode 100644
> index 0000000000..8503932461
> --- /dev/null
> +++ b/package/milkv-duo-smallcore-freertos/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS
> +	bool "milkv-duo-smallcore-freertos"
> +	depends on BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL
> +	select BR2_PACKAGE_HOST_CMAKE
> +	help
> +	  This package is obtained from
> +	  https://github.com/milkv-duo/duo-buildroot-sdk,
> +	  from which we download the FreeRTOS ported to Milk-V Duo
> +	  into the Buildroot. This FreeRTOS will run in the small core
> +	  and will not do anything because it is simply a template
> +	  with some basic UART demos. You can realize your own ideas
> +	  by adding code to
> +
> +	  output/build/milkv-duo-smallcore-freertos-hash/cvitek/task
> +	  /comm/src/riscv64/comm_main.c
> +
> +	  If you say Y, then every time you make Buildroot, it will
> +	  automatically compile and include the FreeRTOS into the
> +	  fip.bin, which will then be packed into sdcard.img
> +
> +	  https://github.com/milkv-duo/milkv-duo-smallcore-freertos
> diff --git a/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
> new file mode 100644
> index 0000000000..52028f3c90
> --- /dev/null
> +++ b/package/milkv-duo-smallcore-freertos/milkv-duo-smallcore-freertos.mk
> @@ -0,0 +1,108 @@
> +################################################################################
> +#
> +# milkv-duo-smallcore-freertos
> +#
> +################################################################################
> +
> +MILKV_DUO_SMALLCORE_FREERTOS_VERSION = 1dac21ade58b0f9a0a531cfe93ee319337a88d80
> +MILKV_DUO_SMALLCORE_FREERTOS_SITE = $(call github,milkv-duo,milkv-duo-smallcore-freertos,$(MILKV_DUO_SMALLCORE_FREERTOS_VERSION))
> +MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING = YES
> +MILKV_DUO_SMALLCORE_FREERTOS_DEPENDENCIES = host-cmake host-ninja
> +MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV = CROSS_COMPILE=$(TARGET_CROSS)
> +
> +define MILKV_DUO_SMALLCORE_FREERTOS_BUILD_CMDS
> +	if [ ! -d $(@D)/cvitek/build/arch ]; then \
> +		mkdir -p $(@D)/cvitek/build/arch; \
> +	fi

mkdir -p will create new folder if it's not already there, so no need to
check for $(@D)/cvitek/build/arch

> +
> +	cd $(@D)/cvitek/build/arch && \
> +	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
> +		-DTOP_DIR=$(@D)/cvitek \
> +		-DRUN_TYPE=CVIRTOS \
> +		-DRUN_ARCH=riscv64 \
> +		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
> +		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
> +		$(@D)/cvitek/arch
> +	cd $(@D)/cvitek/build/arch && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
> +
> +	if [ ! -d $(@D)/cvitek/build/kernel ]; then \
> +		mkdir -p $(@D)/cvitek/build/kernel; \
> +	fi

Ditto

> +
> +	cd $(@D)/cvitek/build/kernel && \
> +	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
> +		-DRUN_ARCH=riscv64 \
> +		-DTOP_DIR=$(@D)/cvitek \
> +		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
> +		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
> +		$(@D)/cvitek/kernel
> +	cd $(@D)/cvitek/build/kernel && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
> +
> +	if [ ! -d $(@D)/cvitek/build/common ]; then \
> +		mkdir -p $(@D)/cvitek/build/common; \
> +	fi

Ditto

> +
> +	cd $(@D)/cvitek/build/common && \
> +	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
> +		-DRUN_ARCH=riscv64 \
> +		-DTOP_DIR=$(@D)/cvitek \
> +		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
> +		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
> +		$(@D)/cvitek/common
> +	cd $(@D)/cvitek/build/common && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
> +
> +	if [ ! -d $(@D)/cvitek/build/hal ]; then \
> +		mkdir -p $(@D)/cvitek/build/hal; \
> +	fi

Ditto

> +
> +	cd $(@D)/cvitek/build/hal && \
> +	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
> +		-DRUN_ARCH=riscv64 \
> +		-DTOP_DIR=$(@D)/cvitek \
> +		-DRUN_TYPE=CVIRTOS \
> +		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
> +		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
> +		-DBOARD_FPGA=n \
> +		$(@D)/cvitek/hal/cv180x
> +	cd $(@D)/cvitek/build/hal && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
> +
> +	if [ ! -d $(@D)/cvitek/build/driver ]; then \
> +		mkdir -p $(@D)/cvitek/build/driver; \
> +	fi

Ditto

> +
> +	cd $(@D)/cvitek/build/driver && \
> +	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
> +		-DRUN_ARCH=riscv64 \
> +		-DTOP_DIR=$(@D)/cvitek \
> +		-DRUN_TYPE=CVIRTOS \
> +		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
> +		-DBOARD_FPGA=n \
> +		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \
> +		$(@D)/cvitek/driver
> +	cd $(@D)/cvitek/build/driver && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
> +
> +	if [ ! -d $(@D)/cvitek/build/task ]; then \
> +		mkdir -p $(@D)/cvitek/build/task; \
> +	fi

Ditto

> +
> +	cd $(@D)/cvitek/build/task && \
> +	$(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) -G Ninja -DCHIP=cv180x \
> +		-DRUN_ARCH=riscv64 \
> +		-DRUN_TYPE=CVIRTOS \
> +		-DTOP_DIR=$(@D)/cvitek \
> +		-DBUILD_ENV_PATH=$(@D)/cvitek/build \
> +		-DBOARD_FPGA=n \
> +		-DCMAKE_TOOLCHAIN_FILE=$(@D)/cvitek/scripts/toolchain-riscv64-elf.cmake \

The build command is common for every "target", so please declare it
into a variable on the top.

> +		$(@D)/cvitek/task
> +	cd $(@D)/cvitek/build/task && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target install -- -v
> +	cd $(@D)/cvitek/build/task && $(TARGET_MAKE_ENV) $(MILKV_DUO_SMALLCORE_FREERTOS_CONF_ENV) $(BR2_CMAKE) --build . --target cvirtos.bin -- -v

To tell the truth all the points above can be shrinked using a foreach
loop through all the build directories since they all look the same
except directory name. Can you provide such change?

> +endef
> +
> +define MILKV_DUO_SMALLCORE_FREERTOS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/cvitek/install/bin/cvirtos.bin $(BINARIES_DIR)/cvirtos.bin
> +	if [ ! -e $(BINARIES_DIR)/empty.bin ]; then \
> +		touch $(BINARIES_DIR)/empty.bin; \
> +	fi

if you touch an empy file again it recreates an empty file again,
so you can remove the if check.

> +endef
> +
> +$(eval $(generic-package))

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
