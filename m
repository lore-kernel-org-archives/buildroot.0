Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53582C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 16:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E207442114;
	Sat,  2 Dec 2023 16:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E207442114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHLrmxB_wVib; Sat,  2 Dec 2023 16:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EDB341A60;
	Sat,  2 Dec 2023 16:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDB341A60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10BA51BF5A5
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 16:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2E560DA0
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 16:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2E560DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNzn6uTJQTbF for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 16:28:24 +0000 (UTC)
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCC7C60D80
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 16:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCC7C60D80
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9Sqpranpc7U3P9Sqpr70TD; Sat, 02 Dec 2023 17:28:19 +0100
Message-ID: <8227916b-b81e-4740-9d32-cc1fb66cebd4@benettiengineering.com>
Date: Sat, 2 Dec 2023 17:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: nigel_wang <asd617140123@gmail.com>, buildroot@buildroot.org
References: <20231127064349.12099-1-asd617140123@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231127064349.12099-1-asd617140123@gmail.com>
X-CMAE-Envelope: MS4xfNnDwOQkFEK9eH7rdqYTe5Hw7nDnmHNI4rVov+JUQtYGRPIJguod/0wdpE4D85JagURb7h0Bxu3hAShZ6BktDmXmeahFEvaYmB6l5UyLF7/iQK5swuas
 xRlKDrseh0/rC0kXEcG6FM770iJlysUIH7j8wtPNx6FhnIxL6fodik0TmfN3owujeHzVDpebsz6HOnElOqu/ifGO3e5vrip85z7i2V++t5J5agrVVSYw/Yf+
 7pu5cnJwyKJqRY5JtzfybLl1uHIdW66CI2hgDmOIbWoV/0xW8Xku+w4uFG0gzwcrjCVXgiQQ1gmSjTzSAF1HVg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701534499; bh=qQTpH5CYd7cOrTP03KwuQNVIhwVKwPWmomFEa8ickko=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=E/tF01KIWsae0s3tD3JtEikjibIt7mtqaCEXgrU7rblYFMDbUWCEsyEh5K6E2wx5o
 AMRsgD57o1YzAeXzG6XCbaz/93jD+Tml7Ww1w1uytKBbHwB6Dcrcp3VgWXvTG7ZkNQ
 X/25t88MaO/G778vpBlmsgGBhED8rYuEHg3c+4e4xsqgC2CASOtgm3T0zZiU3GkUUj
 3qZwQVPxYNlw1OvddMe37J8QmA/G1z2eb0GjeGHATURVS0wAyXTGsjn78PZYoH6IPO
 Jr1iudj4oIuBCMYW80HlSaPkmthTSJPZStHI8M98oGEegHsm/t1qtiexv/1J2Q3VUY
 a0rHY7GD/sO5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=E/tF01KI
Subject: Re: [Buildroot] [PATCH 1/2] board/cubietech/cubieboard4 : Add
 config file for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nigel,

thanks for contributing, please squash this and the next patch,

On 27/11/23 07:43, nigel_wang wrote:

Please provide a commit log here, take a look to the other boards'
initial adding commit logs,

> Signed-off-by: nigel_wang <asd617140123@gmail.com>

Here you need to provide your "Name Surname", so it should be like:
"Nigel Wang <asd617140123@gmail.com>"

> ---
>   board/cubietech/cubieboard4/boot.cmd      |  5 +++
>   board/cubietech/cubieboard4/genimage.cfg  | 38 +++++++++++++++++++++++
>   board/cubietech/cubieboard4/post-image.sh | 16 ++++++++++
>   3 files changed, 59 insertions(+)
>   create mode 100644 board/cubietech/cubieboard4/boot.cmd
>   create mode 100644 board/cubietech/cubieboard4/genimage.cfg
>   create mode 100755 board/cubietech/cubieboard4/post-image.sh
> 
> diff --git a/board/cubietech/cubieboard4/boot.cmd b/board/cubietech/cubieboard4/boot.cmd
> new file mode 100644
> index 0000000000..6521243696
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/boot.cmd
> @@ -0,0 +1,5 @@
> +setenv fdt_high ffffffff
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +fatload mmc 0 $kernel_addr_r zImage
> +fatload mmc 0 $fdt_addr_r sun9i-a80-cubieboard4.dtb
> +bootz $kernel_addr_r - $fdt_addr_r

Please use extlinux.conf instead of boot.cmd since it's easier to use
for debugging,

> diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietech/cubieboard4/genimage.cfg
> new file mode 100644
> index 0000000000..5d5488bcf9
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/genimage.cfg
> @@ -0,0 +1,38 @@
> +# Minimal SD card image for the Cubieboard2
> +# Based in the Orange Pi genimage.cfg
> +
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"sun9i-a80-cubieboard4.dtb",
> +			"boot.scr"
> +		}
> +	}
> +
> +	size = 10M

Can you please use a value that is a power of 2 here? Like 16M if really
needed or 8M(the smaller the better)

> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot-sunxi-with-spl.bin"
> +		offset = 8K
> +		size = 1016K # 1MB - 8KB
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC

Check Buildroot manual for partition-type notation

> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83

same here,

> +		image = "rootfs.ext4"
> +		size = 512M
> +	}
> +}
> diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubietech/cubieboard4/post-image.sh
> new file mode 100755
> index 0000000000..9cca1b1789
> --- /dev/null
> +++ b/board/cubietech/cubieboard4/post-image.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?

I review the 2/2 patch now

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
