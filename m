Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D43AC0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14508848C0;
	Fri,  7 Feb 2025 21:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfmiLsciiooa; Fri,  7 Feb 2025 21:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0457A848A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0457A848A8;
	Fri,  7 Feb 2025 21:36:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1191AE4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BBC5848A8
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tjslbcMEg9s for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2C6C84849
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C6C84849
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C6C84849
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:36:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436249df846so17435755e9.3
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 13:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738964203; x=1739569003;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JPqNwwAm/KDXnCGl5QEkqM132WuUOzV6JYUNN+JDI2s=;
 b=M0gjWjTVpQXSogH827q+41/UWwKvlCK2UdKXEwPXgR/V6UQAXgM1Wn4LyRH3OerHTJ
 IqNMYjPJv6Fk27PT8J2r0+OV2MJIi6B3p4fKt3+Mm986JTKYTeHusUd1N38XX8YfsGCq
 V/lHg8M0UNgfxo9MNqtGk2VxeDhN0kvCExqDjeWefXtvarAWSjh3lU6hfFpksE/EY6Gr
 HmlaHfzq/Jkn0VMfU6C+v/TbCy91bqRLMw+rRu+ZGdAhiKpF/dYoieF2GFEgWPgqQOhj
 r391LQoyDC4EdVusJO9jNdJWBu743PPR6LKKeE/yvp/yJ43r6sNMJSmnzVS4kqlbaz9i
 XSiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6HUfhZ0CVdtkRMwtl5Zqr71vCccio6LBLhRkZE/M5EjfASQf1FcfAkCrOBxv48BOATuNaLCjlU7w=@buildroot.org
X-Gm-Message-State: AOJu0YytdO49DW7SlGNhWslXDzoX8aQeKiFFrMEL2ZNGTSyYbTNo9X1J
 nRVDvKmZKgsp3dFs7/NQF2gmsm+gww8ckresfzz7IWhaaOqor62vCC8P6vrimR8=
X-Gm-Gg: ASbGncsjg1zDSikUZ70aOJdyh8P02qwaiJwf3L2OfHm9CrqNorNesSqsgKiDWr+ombI
 +hq4HwLT/6NJIw/O7mtTTZotyfAUCJg9wVcGtqXu4qup2P3Sx2NM85ngOS52emhj7xOeCyoVMB1
 OpvlPdklusyQuPw7uZChepUNDEvsUsdamHSPLLNfWZg8MvKfFMaRDIpMKw9/REKUfzfJp9LOuXs
 SCxDc19zUBP6I6n9YJrlO9ZYg32I0v75TKc/64dOv/Vx/xoGlEwkRsgOZimkklPf7fgU0p7xXKG
 f5Wu45dEm2aN2zAkP7Pb3pnBHkkIgz2owqLAV0DiTi4wK3KEbzE2oKQxWEDPFeVOu0lo+yBZ3ZO
 i6N3IZTQyzYX40SNLhhFxVIv4K9QWokRcKN00tVniJGoHWg==
X-Google-Smtp-Source: AGHT+IGpz88ya1iey5Jvzs/e0n4u5+vLJ+hz1swCs53HWAspzfV2K327oXsXSi1PflWGdoAFirVyhg==
X-Received: by 2002:a5d:540c:0:b0:38d:c55e:ebcf with SMTP id
 ffacd0b85a97d-38dc9352269mr2495655f8f.52.1738964203531; 
 Fri, 07 Feb 2025 13:36:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d966faasm102201545e9.23.2025.02.07.13.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 13:36:42 -0800 (PST)
Message-ID: <da600884-960d-4deb-b776-cc78c49acce2@mind.be>
Date: Fri, 7 Feb 2025 22:36:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, =?UTF-8?Q?Jos=C3=A9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-4-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20250207171458.1127620-4-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738964203; x=1739569003; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JPqNwwAm/KDXnCGl5QEkqM132WuUOzV6JYUNN+JDI2s=;
 b=CebqTGB1x/43siRqxpwlMFmNMXj+t7uuwedUG+Qq9PYrpG2N7yjCiCwWP3562Trho6
 39YI9jrLXz4C4GSZMOVYee3Xvx5izUW9oVE0TSmYGjtom+owb/cT9TjNGmTDx6nun+OV
 8GyjJE0nwWKS6LWbwFoVai4iuFJQ6I4c6Z+ZPn6N1Ovl8e86c3Sf+47XDk4P3u0A8dwY
 8gyPknfsp0lS5I5I4IeF7mQUY0OM4Y/Mz2XZ/EwMBrgHKGEdGMgep/HxzXWHC0WxQKNe
 khO/kpcFcMwXf46pqNuSjwTEsE/h5W+R8Wfw4Ra64h049KyM6nJU1XQwo7F4eY8H+8he
 Al8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CebqTGB1
Subject: Re: [Buildroot] [PATCH v3 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Fiona,

On 07/02/2025 18:14, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The new config deviates from the existing
> configs/raspberrypicm4io_64_defconfig only as far as necessary to
> demonstrate booting through U-Boot instead of having the firmware load
> the kernel directly. The sample boot script loads the kernel from the
> rootfs and uses the device tree provided by the firmware, and should
> be compatible with any RPi device that runs U-Boot.

  Looks good at first sight. I'm thinking though: wouldn't it be easier if we 
convert all RPi configs (gradually) to U-Boot, and mention in the readme (and 
config.txt comments) how to boot without U-Boot?

> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> The config I'm usually using is a bit different, including using a
> mainline kernel (which seems strongly preferable to me), but for
> defconfig maintenance staying close to the other RPi defconfigs is
> probably easiest.

  We actually discussed the "rule" for whether or not to use upstream kernels in 
the Vienna dev days last year [1]. This hasn't made it into the manual yet 
unfortunately.

 >>>> There is often a choice between vendor kernel (and U-Boot, and graphics) or
 >>>> mainline kernel (and U-Boot, and mesa3d). It's up to the contributor to
 >>>> choose. We can also have two defconfigs for the same board, one vendor and
 >>>> one mainline. In that case, the vendor variant should be called
 >>>> <board>_vendor_defconfig. Nobody volunteered to do this rename for the
 >>>> existing defconfigs.

  I don't know if nowadays there is still a need to use vendor kernels on the 
RPies. In the past it used to be the case that the RPi used all kinds of 
non-standard userspace APIs with the result that all online guides stop working 
if you use a mainline kernel - I don't know if that is still the case. But 
anyway, adding a mainline defconfig is certainly a good idea IMHO.

  Regards,
  Arnout

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs


> 
> Changes v2 -> v3:
> * Regenerate defconfig according to current standards
> * Modify boot.scr.in so the script should work on any RPi device
> 
>   board/raspberrypi/boot.scr.in                 | 18 +++++++++
>   .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++++++
>   board/raspberrypi/readme.txt                  |  4 ++
>   configs/raspberrypicm4io_64_uboot_defconfig   | 40 +++++++++++++++++++
>   4 files changed, 85 insertions(+)
>   create mode 100644 board/raspberrypi/boot.scr.in
>   create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
>   create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig
> 
> diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
> new file mode 100644
> index 0000000000..1ba733ceaa
> --- /dev/null
> +++ b/board/raspberrypi/boot.scr.in
> @@ -0,0 +1,18 @@
> +# Please note that this is only a sample, we recommend you to change
> +# it to fit your needs. You should override this file using
> +# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
> +
> +# On most Raspberry Pi boards UART0 is ttyAMA0, Raspberry Pi 5 is
> +# different.
> +if test "$board_name" = "5 Model B"; then
> +    env set serial_uart "ttyAMA10,115200"
> +else
> +    env set serial_uart "ttyAMA0,115200"
> +fi
> +env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=${serial_uart}"
> +
> +# load kernel from the root partition
> +load mmc 0:2 ${kernel_addr_r} boot/Image
> +
> +# boot using the FDT provided by firmware
> +booti ${kernel_addr_r} - ${fdt_addr}
> diff --git a/board/raspberrypi/config_cm4io_64bit_uboot.txt b/board/raspberrypi/config_cm4io_64bit_uboot.txt
> new file mode 100644
> index 0000000000..eef929186c
> --- /dev/null
> +++ b/board/raspberrypi/config_cm4io_64bit_uboot.txt
> @@ -0,0 +1,23 @@
> +# Please note that this is only a sample, we recommend you to change it to fit
> +# your needs.
> +# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
> +# See http://buildroot.org/manual.html#rootfs-custom
> +# and http://elinux.org/RPiconfig for a description of config.txt syntax
> +
> +start_file=start4.elf
> +fixup_file=fixup4.dat
> +
> +kernel=u-boot.bin
> +
> +# Enable UART0 for serial console on ttyAMA0
> +dtoverlay=miniuart-bt
> +
> +# enable RTC
> +dtparam=i2c_vc=on
> +dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
> +
> +# enable dwc2 USB controller (USB 2.0)
> +dtoverlay=dwc2,dr_mode=host
> +
> +# enable 64bits support
> +arm_64bit=1
> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index 64f0e2a26f..6bf76df2ef 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
> @@ -69,6 +69,10 @@ or for CM4 (on IO Board - 64 bit):
>   
>     $ make raspberrypicm4io_64_defconfig
>   
> +or to boot CM4 (on IO Board - 64 bit) using U-Boot:
> +
> +  $ make raspberrypicm4io_64_uboot_defconfig
> +
>   For model 5 B:
>   
>     $ make raspberrypi5_defconfig
> diff --git a/configs/raspberrypicm4io_64_uboot_defconfig b/configs/raspberrypicm4io_64_uboot_defconfig
> new file mode 100644
> index 0000000000..056c9051b6
> --- /dev/null
> +++ b/configs/raspberrypicm4io_64_uboot_defconfig
> @@ -0,0 +1,40 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> +BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_RPI_FIRMWARE=y
> +BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
> +BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io_64bit_uboot.txt"
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_arm64"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/raspberrypicm4io-64/boot.scr.in"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
