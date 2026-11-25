Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0638606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VDiiszQD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DCBD80D09;
	Wed, 25 Nov 2026 19:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkurlWLE8n47; Wed, 25 Nov 2026 19:10:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B0F080CD3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795633821;
	b=or8nsFqYWYp1n5prvqETmXP3bg+gHGCVTLjOVOCWZ9cdx6Gh1kYEoBhccmNCxYnNUYOU
	 dNlTUcwJ6XWMqdRuNnGt+8pNTWZhiyDfmMXq68dcDN0ZCeBu4Ac7exyfbZVv4+HhUgDb2
	 T/ivWPPhFFRHQxI2h38/Q+u+0q39EplfmAV3Yjapcuuzd/dppWutzpqGL9AgJMq233eMV
	 sXlpgBrTwkLUQmxBxULq1S9M1SKtFBeUM9GJD2STCFeaIEohgBGe4AY1AJpmP7jQkq/F/
	 REOWeNqnGkfeKbNYsEnV15UxB/UC/mvMCep5YcMKl1x+Th1DN/DDW5sSmxiEtBr/1ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795633821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=BP3/rMoyI0pT1UDtXvY1K22HW0fRSVDDW37ROirsnPE=;
	b=qA7HMGF4eDvS4hy9rqv37wjYHjDACSKlPH1nHWm2j5DqNgKKp7joznIyyaLZyKklzhAM
	 OUXgjaUE9I31ClfbaQbgSTNQUzmxYomfjAlSCfUzeQN5nFHV9zEvOAHe4alGdld+nIrub
	 FdRmrmwN351kzcYu02UT1Bd+gxapsNRTHn7TDncb1Xanf3qGJt6r6RYAqjgwzFmcnsEQH
	 QHa/U75SmBGwLwOkYBVukIJGcugFJKdXJNiY6q1LBx4bt0PLJH4t8PZlT1SEQBgmiXQ+f
	 i/ciQNwk5CtUqgRKa6rS/ZcAQOMBBvC6kbrYsW7kNfWpOg5bEt64M7H/YqYBsLQ7Osg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795633821;
	bh=BP3/rMoyI0pT1UDtXvY1K22HW0fRSVDDW37ROirsnPE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VDiiszQD/tVk6FLufukuyrmv3npXetjpcn8PHZocLFK7hretWJtxxBCvDtHqeH81o
	 yjfthcV0U0yc2crCGRK8agLATwriiSp4vMEWyfGjOlBKfun0JWQsjq8aLR4am59kVn
	 KnuwXGHPeof2e/tS+l/04UYRE0ryi4JYvNCU4CCBM8tpnbqMnKIIH2sw2FLSjD7HgS
	 L05YAjHEnXhvomIkEubxurM8WqWXZSpacTKk/PCh3Afua3TduG07PXUsYNGaFxZ1EC
	 siGGjakzpLecJDb9TjSvRy0z5qBbE82rVGtj49Plj2cQex7WAp5HKkGqtFMRb67Yv8
	 M+ci1pZHORmPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B0F080CD3;
	Wed, 25 Nov 2026 19:10:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E82F4325
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA1C560687
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78gVhPoBp1cM for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 19:10:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CCD0C6064E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCD0C6064E
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 19:10:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 88CD0780502;
 Wed, 25 Nov 2026 20:10:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 25 Nov 2026 20:10:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 20:10:13 +0100
To: Bert Outtier <outtierbert@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261124211312.2775532-1-outtierbert@gmail.com>
References: <20261124113103.2422768-1-outtierbert@gmail.com>
 <20261124211312.2775532-1-outtierbert@gmail.com>
User-Agent: Webmail Free/1.6.22
Message-ID: <0bceee38a6d7c086b2bddf555631560f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v3] configs/phyxbe_tess: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bert,

Thanks for the patch. I have few comments, see below.

On 24/11/2026 22:13, Bert Outtier wrote:
> Add support for the Phyx Tess board, an Adafruit Feather compatible
> board built around the Allwinner T113-S3 (2x Cortex-A7, 128 MB DDR3
> in package), with:
> - USB-C connector (USB device, FEL)
> - microSD card connector on SDC0
> - ESP32-C3 WiFi/BLE co-processor (SPI0 for WiFi with esp-hosted,
>   UART2 for BLE HCI)
> - MIPI DSI display connector
> - Adafruit Feather headers (UART5, SPI1, I2C3, GPIO, ADC)
> - USB1 host and UART3 console on extra header pins
> - Li-ion charger as a gpio-charger power supply: its status, and its
>   charge current, about 450 mA or about 1.2 A (PG13)
> 
> The board has no upstream device tree yet: it is shared between Linux
> and U-Boot (BR2_TARGET_UBOOT_CUSTOM_DTS_PATH). U-Boot uses the
> mangopi_mq_r defconfig (same SoC and DRAM) with a fragment for the
> device tree.
> 
> The kernel gets the gpio-charger driver from a fragment, and the 
> command
> line net.ifnames=0: esp-hosted reports the MAC address of the ESP32-C3
> as permanent, so eudev would rename wlan0. The ESP32-C3 comes up a few
> seconds after the network is started, so ifup waits for wlan0.
> 
> Signed-off-by: Bert Outtier <outtierbert@gmail.com>
> ---

[...]

> diff --git a/board/phyxbe/tess/patches/linux-headers/linux-headers.hash 
> b/board/phyxbe/tess/patches/linux-headers/linux-headers.hash
> new file mode 120000
> index 0000000000..5808d92afe
> --- /dev/null
> +++ b/board/phyxbe/tess/patches/linux-headers/linux-headers.hash

This linux-headers.hash can be removed, since the defconfig should
use a Bootlin glibc stable external toolchain. See below.

> @@ -0,0 +1 @@
> +../linux/linux.hash
> \ No newline at end of file

[...]

> diff --git a/configs/phyxbe_tess_defconfig 
> b/configs/phyxbe_tess_defconfig
> new file mode 100644
> index 0000000000..c70f938db8
> --- /dev/null
> +++ b/configs/phyxbe_tess_defconfig
> @@ -0,0 +1,46 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y

According to defconfig rules from:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

New defconfigs should now use a Bootlin glibc stable
external toolchain. The previous line should be removed,
and be replaced by:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y

> +BR2_GLOBAL_PATCH_DIR="board/phyxbe/tess/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_TARGET_GENERIC_HOSTNAME="tess"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Tess"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS3"
> +BR2_ROOTFS_OVERLAY="board/phyxbe/tess/rootfs_overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/phyxbe/tess/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"

Is there any specific reason to select 6.18.8, while the latest
6.18 series is 6.18.65 as of now?  If not, could you change it
to the latest 6.18 version available, please?

> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/phyxbe/tess/linux.fragment"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/phyxbe/tess/sun8i-t113s-tess.dts"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_ESP_HOSTED=y
> +BR2_PACKAGE_ESP_HOSTED_SPI=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
> +BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"

Same question: any specific reason to select 2026.01 while
there is 2026.10 available? See:
https://git.u-boot-project.org/u-boot/u-boot/-/tags
If not, could you change it to the latest version, please?

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mangopi_mq_r"
> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/phyxbe/tess/uboot.fragment"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/phyxbe/tess/sun8i-t113s-tess.dts"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.53.0

Could you send an updated patch addressing those comments, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
