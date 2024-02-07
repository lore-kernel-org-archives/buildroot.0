Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1C3C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6872D83880;
	Wed,  7 Feb 2024 11:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfdAEyQdTxuH; Wed,  7 Feb 2024 11:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3069A8399B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3069A8399B;
	Wed,  7 Feb 2024 11:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 757161BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FEA04221D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FX-NyRVNHBbr for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:31:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97A3D4220D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A3D4220D
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97A3D4220D
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:31:29 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Xg9Hrn9GkWf5XXg9HrkOkN; Wed, 07 Feb 2024 12:31:27 +0100
Message-ID: <0ae0fea1-c044-4016-85e2-cf7090ce8905@benettiengineering.com>
Date: Wed, 7 Feb 2024 12:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hanyuan Zhao <hanyuan-z@qq.com>, buildroot@buildroot.org
References: <tencent_8285BE4A2D0B360BFED14B9C383000EA8C09@qq.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <tencent_8285BE4A2D0B360BFED14B9C383000EA8C09@qq.com>
X-CMAE-Envelope: MS4xfHtIwEJMHEC3a5gGfisNRQJNTzO1coePuhxAbo8rHyp6toB1b6uKajg6ZGgnx7DJKdbNljzKvOng1cFVY0So0Kr2du2av4GeA5ec9js9y0aZCLf9VDwI
 GO399dxDx6BTp2Yxhuz/vWUHZH0iprqSynZ6hqXdr0JSfrYs+FsfgG/uwGF2GlH+db4M5rFOCKDOAxPHuGXkp1gI49PNWhK3+0XuYIyyP5UPOY8iMCL8LAmf
 2LwR40mjt9q+QH/Z2p9C5hIuJ36VGldNSXXdDTqDZZijMgkSjyG/9f31NNVQpgTo+YRW1FwH+JzCueYJRpJyrDa6DMDOpzFjLikU+DxVw08=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707305487; bh=pc5CYtPFxR62kLgguciPi9zwHC6Vumt8fP0LpDHrHHU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=lZ+qdkudP2x2YhFAkYCOi0NYIr2OMWSK9Gp4zLK4mAvnT+00CjdgeUrBTVSvbMsZS
 x3Z2EHuymJaY2rLgx9G9+wPAt75gEhd+iWI0vsSFVoAwQbK/63Z73ZWYPWIqmn4uGF
 Lb0HOw0b9DLgQg9QGKvvpqchn+JURWu12u3SWXQiTqP9iawuCNuHXWTuBe73e0K9Z8
 iUxXIaB2BNxAAk4n3MWu0Jy90kir3qmI6csg40Fjo4s2y6ZHB8BYqEVpDP92Z/EJ2a
 GT0RZsS8Eq/tmeJpSctxtznZ8T09l0I5EKkwwYJ6QMDAZH1a3nFtZmP286GfOMDSQP
 r/q0fs+UMWm1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lZ+qdkud
Subject: Re: [Buildroot] [PATCH v4 1/3] package/milkv-duo-libraries: new
 package
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

On 07/02/24 08:49, Hanyuan Zhao wrote:
> This commit adds the libraries for RISC-V dev board
> milk-v duo, containing board-specific firmware and
> hardware tools.
> 
> https://github.com/milkv-duo/milkv-duo-buildroot-libraries
> 
> Co-authored-by: Emil S <emil.soltys@outlook.com>
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>

It looks good to me:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> 
> ---
> Changes v3 -> v4:
>    - Update the info in help section
>    - Provide more info about ION (camera memory use)
> 
> Changes v2 -> v3:
>    - Update the desc's repo url
> 
> Changes v1 -> v2:
>    - Lint the code
>    - Refactor the select and depend logic
> ---
>   package/Config.in                             |  1 +
>   package/milkv-duo-libraries/Config.in         | 63 +++++++++++++++++++
>   .../milkv-duo-libraries.mk                    | 51 +++++++++++++++
>   3 files changed, 115 insertions(+)
>   create mode 100644 package/milkv-duo-libraries/Config.in
>   create mode 100644 package/milkv-duo-libraries/milkv-duo-libraries.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 047877c960..322aba90b8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -564,6 +564,7 @@ endmenu
>   	source "package/memtester/Config.in"
>   	source "package/memtool/Config.in"
>   	source "package/mhz/Config.in"
> +	source "package/milkv-duo-libraries/Config.in"
>   	source "package/minicom/Config.in"
>   	source "package/msr-tools/Config.in"
>   	source "package/nanocom/Config.in"
> diff --git a/package/milkv-duo-libraries/Config.in b/package/milkv-duo-libraries/Config.in
> new file mode 100644
> index 0000000000..047b78fb7b
> --- /dev/null
> +++ b/package/milkv-duo-libraries/Config.in
> @@ -0,0 +1,63 @@
> +config BR2_PACKAGE_MILKV_DUO_LIBRARIES
> +	bool "milk-v duo libraries"
> +	depends on BR2_riscv
> +	help
> +	  Package providing board-specific firmware and hardware tools
> +	  for Milk-V Duo platform.
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
> +	  Say Y to this will disable the ION (Camera Algorithm Memory)
> +	  in order to have the all 64MiB Free memory.
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
