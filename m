Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAAEC4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 22:21:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0BD360EBC
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 22:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0BD360EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA7A83981;
	Thu, 29 Jul 2021 22:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S87z_cv_xyLu; Thu, 29 Jul 2021 22:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FE5839E9;
	Thu, 29 Jul 2021 22:21:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0F7A1BF2A4
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 22:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DE2B839E9
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 22:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 425Qthp0i6_U for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 22:21:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CA6583981
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 22:21:08 +0000 (UTC)
Received: from [37.161.155.187] (port=5517 helo=[192.168.43.3])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1m9EOn-003MZX-Oh; Fri, 30 Jul 2021 00:21:06 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: Alvaro Gamez Machado <alvaro.gamez@hazent.com>,
 buildroot <buildroot@buildroot.org>
References: <20210715062814.8076-1-alvaro.gamez@hazent.com>
Message-ID: <6d922a5e-0796-2ba1-757b-91e6eb1892dc@lucaceresoli.net>
Date: Fri, 30 Jul 2021 00:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715062814.8076-1-alvaro.gamez@hazent.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH] configs/digilent_genesys_zu_defconfig: add
 Digilent Genesys ZU board (ZynqMP SoC)
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Alvaro,

thanks for your patch.

And apologies for the late reply -- vacation time.

On 15/07/21 08:28, Alvaro Gamez Machado wrote:
> This adds support the Digilent Genesys ZU development board.
> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
>  ...ve-redundant-YYLOC-global-declaratio.patch |    52 +
>  .../0001-uboot-add-genesys-zu.patch           |    10 +
>  board/digilent/genesys-zu/GenesysZU.dts       |  1655 +
>  board/digilent/genesys-zu/README.txt          |    92 +
>  board/digilent/genesys-zu/genimage.cfg        |    28 +
>  board/digilent/genesys-zu/image.its           |    59 +
>  board/digilent/genesys-zu/kernel_defconfig    |   414 +
>  board/digilent/genesys-zu/pm_cfg_obj.c        |   630 +
>  board/digilent/genesys-zu/post-image.sh       |    10 +
>  board/digilent/genesys-zu/psu_init_gpl.c      | 21818 +++++++++
>  board/digilent/genesys-zu/psu_init_gpl.h      | 37545 ++++++++++++++++

These files are huge! You should use the
tools/zynqmp_psu_init_minimize.sh tool in the U-Boot sources and submit
for Buildroot the reduced files.

> diff --git a/board/digilent/genesys-zu/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/digilent/genesys-zu/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> new file mode 100644
> index 0000000000..48f683afbe
> --- /dev/null
> +++ b/board/digilent/genesys-zu/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> @@ -0,0 +1,52 @@
> +From e33a814e772cdc36436c8c188d8c42d019fda639 Mon Sep 17 00:00:00 2001
> +From: Dirk Mueller <dmueller@suse.com>
> +Date: Tue, 14 Jan 2020 18:53:41 +0100
> +Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
> +
> +gcc 10 will default to -fno-common, which causes this error at link
> +time:
> +
> +  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
> +
> +This is because both dtc-lexer as well as dtc-parser define the same
> +global symbol yyloc. Before with -fcommon those were merged into one
> +defintion. The proper solution would be to to mark this as "extern",
> +however that leads to:
> +
> +  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
> +   26 | extern YYLTYPE yylloc;
> +      |                ^~~~~~
> +In file included from dtc-lexer.l:24:
> +dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
> +  127 | extern YYLTYPE yylloc;
> +      |                ^~~~~~
> +cc1: all warnings being treated as errors
> +
> +which means the declaration is completely redundant and can just be
> +dropped.
> +
> +Signed-off-by: Dirk Mueller <dmueller@suse.com>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +[robh: cherry-pick from upstream]
> +Cc: stable@vger.kernel.org
> +Signed-off-by: Rob Herring <robh@kernel.org>
> +Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>

If this patch comes from upstream it would be nice to add an URL of
where it can be found.

> diff --git a/board/digilent/genesys-zu/GenesysZU.dts b/board/digilent/genesys-zu/GenesysZU.dts
> new file mode 100644
> index 0000000000..ddeba4b715
> --- /dev/null
> +++ b/board/digilent/genesys-zu/GenesysZU.dts

Do you plan to submit this DTS to mainline Linux? It would be nice to do
it and, in that process, have it properly reviewed. After that it can be
removed from Buildroot.

> diff --git a/board/digilent/genesys-zu/README.txt b/board/digilent/genesys-zu/README.txt
> new file mode 100644
> index 0000000000..2a7a86a3ab
> --- /dev/null
> +++ b/board/digilent/genesys-zu/README.txt
> @@ -0,0 +1,92 @@
> +********************************
> +Digilent Genesys ZU - ZynqMP SoC
> +********************************
> +
> +This document describes the Buildroot support for the Genesys ZU board
> +by Digilent, based on the Zynq UltraScale+ MPSoC (aka ZynqMP).
> +
> +How to build it
> +===============
> +
> +Configure Buildroot:
> +
> +    $ make digilent_genesys_zu_defconfig
> +
> +Compile everything and build the rootfs image:
> +
> +    $ make
> +
> +Result of the build
> +-------------------
> +
> +After building, you should get a tree like this:
> +
> +    output/images/
> +    +-- bl31.bin
> +    +-- boot.bin
> +    +-- u-boot.itb
> +    +-- uboot-env.bin
> +    +-- GenesysZU.dtb
> +    +-- Image
> +    +-- image.ub
> +    +-- rootfs.ext2
> +    +-- rootfs.ext4 -> rootfs.ext2
> +    +-- boot.vfat
> +    `-- sdcard.img
> +
> + * bl31.bin: Compiled xilinx' ARM Trusted Firmware, version xilinx-2020.1.
> + * boot.bin: U-boot SPL binary image. This is the file the zynqmp boots first.
> + * u-boot.itb: FIT Image containing both u-boot proper and ATF bl31.bin
> +               SPL image will load these and will run BOTH.
> + * uboot-env.bin: U-boot environment
> + * GenesysZU.dtb: Device tree blob, compiled from source GenesysZU.dts
> + * Image: Kernel image
> + * image.ub: FIT Image containing kernel image, device tree blob and, optionally,
> +             FPGA bitfile image
> + * rootfs.ext4: filesystem image
> + * boot.vfat: FAT partition to be written to SD.
> +              Contains boot.bin, u-boot.itb, uboot-env.bin and image.ub
> + * sdcard.img: SD image with two partitions: boot.vfat and rootfs.ext4

These descriptions are useful!

> +
> +ZynqMP "community workflow" boot summary
> +========================================
> +
> +No Xilinx utils are used to generate the resulting binaries, but several Xilinx
> +source code modules are used indeed.
> +
> +The SoC will look for boot.bin image. In this case, this is U-boot SPL image.
> +This will load u-boot proper and ARM Trusted Firmware binary from a FIT image,
> +but also loads PMU firmware to the PMU processor, which is a Microblaze.
> +
> +U-boot proper can then run linux or anything else, but before any of this, it
> +configures the SoC using provided pm_cfg_obj.c and psu_init_gpl.c

Both psu_init_gpl.c and pm_cfg_obj are part of SPL, not U-Boot proper.

> +If a BIT file is provided in the FIT image, it will also configure the PL section
> +of the SoC.
> +
> +Ideally all firmware should be taken from a single Xilinx release, i.e,
> +2019.1, 2019.2, 2020.1... etc. However, this configuration uses modules from
> +different release versions. Kernel is Xilinx version 2019.2, while u-boot is
> +mainstream 2021.04 and ATF is version 2020.1. The reason for this is that
> +kernel version 2019.2 implements correctly the tested firmware, while

What do you mean here? Which firmware?

> +mainstream u-boot is the only one that supports full "community workflow"
> +mode. ATF version has been chosen to be 2020.1 because this version compiles
> +using gcc-11 without any additional patches.
> +
> +This set of different versions is the most stable and easy to compile on
> +buildroot that the author has found, but there may be some incompatibilities
> +on subsystems that have not been tested.
> +
> +How to write the SD card
> +========================
> +
> +WARNING! This will destroy all the card content. Use with care!
> +
> +The sdcard.img file is a complete bootable image ready to be written
> +on the boot medium. To install it, simply copy the image to an SD
> +card:
> +
> +    # dd if=output/images/sdcard.img of=/dev/sdX
> +
> +Where 'sdX' is the device node of the SD.
> +
> +Eject the SD card, insert it in the board, and power it up.

...

> diff --git a/board/digilent/genesys-zu/image.its b/board/digilent/genesys-zu/image.its
> new file mode 100644
> index 0000000000..2ec472553b
> --- /dev/null
> +++ b/board/digilent/genesys-zu/image.its
> @@ -0,0 +1,59 @@
> +/dts-v1/;
> +  
> +/ {
> +	description = "U-Boot fitImage";
> +	#address-cells = <1>;
> +  
> +	images {
> +		kernel {
> +			description = "Linux Kernel";
> +			data = /incbin/("Image");
> +			type = "kernel";
> +			arch = "arm64";
> +			os = "linux";
> +			compression = "none";
> +			load = <0x00080000>;
> +			entry = <0x00080000>;
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};
> +/*
> +		fpga {
> +			description = "FPGA bitfile";
> +			data = /incbin/("system.bit");
> +			type = "fpga";
> +			arch = "arm64";
> +			compression = "none";
> +			load = <0x4000000>;
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};
> +*/

Unmotivated commented code is not nice. I suggest explaining what
it is used for:

 /* Enable this section to load a bitstream during boot

> +		fdt {
> +			description = "DTB";
> +			data = /incbin/("GenesysZU.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};
> +	};
> +	configurations {
> +		default = "conf";
> +		conf {
> +			description = "Boot Linux kernel with FDT blob";
> +			kernel = "kernel";
> +			fdt = "fdt";
> +/*
> +			fpga = "fpga";
> +*/

Ditto.

> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};
> +	};
> +};
> diff --git a/board/digilent/genesys-zu/kernel_defconfig b/board/digilent/genesys-zu/kernel_defconfig
> new file mode 100644
> index 0000000000..5778417e7e
> --- /dev/null
> +++ b/board/digilent/genesys-zu/kernel_defconfig

As above: are you submitting this file for mainline Linux?

> diff --git a/board/digilent/genesys-zu/pm_cfg_obj.c b/board/digilent/genesys-zu/pm_cfg_obj.c
> new file mode 100644
> index 0000000000..a537a05493
> --- /dev/null
> +++ b/board/digilent/genesys-zu/pm_cfg_obj.c
> @@ -0,0 +1,630 @@

Uhm, maybe we need a minimizer tool for pm_cfg_obj too... But for now
it's OK to commit this file.

> diff --git a/board/digilent/genesys-zu/uboot-env.txt b/board/digilent/genesys-zu/uboot-env.txt
> new file mode 100644
> index 0000000000..7eb312f4a1
> --- /dev/null
> +++ b/board/digilent/genesys-zu/uboot-env.txt

No way to use the standard U-Boot boot process? Why?

> diff --git a/board/digilent/genesys-zu/uboot_defconfig b/board/digilent/genesys-zu/uboot_defconfig
> new file mode 100644
> index 0000000000..f22856e184
> --- /dev/null
> +++ b/board/digilent/genesys-zu/uboot_defconfig

As above: any plan to submit this to mainline U-Boot?

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
