Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5D6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:08:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD3960F3A
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 14:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CD3960F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464DC403E2;
	Sun, 25 Jul 2021 14:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xwN26lYtli8; Sun, 25 Jul 2021 14:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45965403DA;
	Sun, 25 Jul 2021 14:08:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34E3B1BF34C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23684403DA
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 14:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6MCe6hmAi_i for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 14:08:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C3CC403C9
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:08:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A0538240003;
 Sun, 25 Jul 2021 14:08:34 +0000 (UTC)
Date: Sun, 25 Jul 2021 16:08:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20210725160833.4d86c502@windsurf>
In-Reply-To: <1626872348-69423-1-git-send-email-gwenj@trabucayre.com>
References: <1626872348-69423-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] board: Add support for terasic DE10 Nano
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Wed, 21 Jul 2021 14:59:08 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Terasic DE10 Nano is an SoCFPGA cycloneV based board.
> References:
> - https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=205&No=1046
> - https://rocketboards.org/foswiki/Documentation/DE10NanoDevelopmentBoard
> 
> Note: there is no dts in kernel (mainline or intel), but since DE0 Nano Soc is
> similar, the corresponding dts is usually used
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Thanks for the patch. It looks mostly good, expect for a few details,
see below.

> diff --git a/board/terasic/de10nano_cyclone5/genimage.cfg b/board/terasic/de10nano_cyclone5/genimage.cfg
> new file mode 100644
> index 0000000000..3261c62741
> --- /dev/null
> +++ b/board/terasic/de10nano_cyclone5/genimage.cfg
> @@ -0,0 +1,57 @@
> +image boot.vfat {
> +	vfat {
> +		file zImage {
> +            image = "zImage"
> +        }

Starting from here the indentation is not correct.

> +
> +        file socfpga_cyclone5_de0_nano_soc.dtb {
> +            image = "socfpga_cyclone5_de0_nano_soc.dtb"
> +        }
> +
> +        file barebox.bin {
> +            image = "barebox-socfpga-de10_nano.img"
> +        }
> +
> +        file barebox.env {
> +            image = "barebox-env"
> +        }
> +	}
> +	size = 8M

Could you fix the indentation in this block ?

> +}
> +
> +image boot.img {
> +	hdimage {
> +		partition-table = "no"
> +	}
> +
> +	partition spl {
> +		in-partition-table = "no"
> +		image = "barebox-socfpga-de10_nano-xload.img"
> +		offset = 0
> +		size = 64k
> +	}
> +
> +	size = 1M
> +}

I don't understand why you have a boot.img, which apparently only
contains the raw contacts of this xload.img file. Why not use this
xload.img file directly...

> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition spl {
> +		partition-type = 0xa2
> +		image = "boot.img"

.. here ?

Example from another genimage.cfg:

        partition spl {
                in-partition-table = "no"
                image = "sunxi-spl.bin"
                offset = 8192
        }

        partition u-boot {
                in-partition-table = "no"
                image = "u-boot.itb"
                offset = 40K
                size = 1M # 1MB - 40K
        }

> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext2"
> +		size = 500M

I'd suggest to not put a size here, and instead tweak the size of the
ext2 filesystem in the defconfig. Indeed, having a larger partition but
not a larger filesystem is kind of useless (or requires a resize of the
filesystem when booting).

> diff --git a/configs/terasic_de10nano_cyclone5_defconfig b/configs/terasic_de10nano_cyclone5_defconfig
> new file mode 100644
> index 0000000000..4a356f31a8
> --- /dev/null
> +++ b/configs/terasic_de10nano_cyclone5_defconfig
> @@ -0,0 +1,28 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_NEON=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_ARM_FPU_NEON=y
> +BR2_KERNEL_HEADERS_5_11=y

Could you use:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y

instead ?

Could you adjust those small details and send a v4?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
