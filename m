Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E75C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1C5D400C4;
	Tue,  1 Feb 2022 18:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_Nctm6vAx1s; Tue,  1 Feb 2022 18:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE9B40186;
	Tue,  1 Feb 2022 18:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 836D11BF287
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7143060C03
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbIJW_vVDdnC for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:00:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 330B760BDB
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:00:55 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ExSXnfvaMQUuPExSYnjPIm; Tue, 01 Feb 2022 19:00:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643738454; bh=M/gfepWyou+/XdqGRH1TmxELUH96qlhGx71bib1p8I0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=LgyGizNVCfqC9tyZSSh+on5zewraXu5nWiImKBc2iALHsQv8JtpS136gC3n4uPOyp
 7mJxh/R0VkCXZM23HTvSQW6rwphh9IRJ2VDOYZ8urPMlJcTFbrvcauO1hv6YE40v4D
 0Q1SkiMEBoayIWKww/V3f1TZup8jDCpz5LCDs2yN8OX1TF3aMi7gRJzp2zwHjcaKek
 T9j2H5zMaW9gp/N2pz7akryb+wUOHQEWgLpbc/a33Y3cEAFEjfIsMls+4RWxIwYx9n
 FZvtG8Ou+a4WjDdDUTYnd5cQK7fDqfdjHGwzz/tkMrXOpPO9pkihw2qKpR71oI6+S3
 iuQ5t59SXAm9A==
Message-ID: <df90dc24-b44e-fcb9-ed82-7b517604f4b0@benettiengineering.com>
Date: Tue, 1 Feb 2022 19:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220131212456.3176156-1-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220131212456.3176156-1-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfMRAOTDf77u3mucGkc7sJjWomjBKQKS9FZlI0mzv1pSXUumJMmsCn8SAKed3PaOv3Ceqz8W9q+rq3dJwi3Z2ZwiCyZsiynfy5rt2wlW4EmlfwjHqB1QG
 q/ZZGLuO1+xXS8nBZnDR5fvIBPYlipaE9QH8hNqAURrKe38BM7Y/sewZxY1iC94RiV0LokQzOfpyq2Z5AgX3rZecGzRvRRxm9+7X5Vnl6n52cXuXx01/b32H
 hYxGcSaXhhdf3AF0Q8h/+BsZ8bNw1oeyU7YIiMg6luo=
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-zero-plus2: fix
 build after genimage update
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On 31/01/22 22:24, Sergey Matyukevich wrote:
> ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> 
> To fix the first genimage error report, change 'partition-type' entries
> to the appropriate 'partition-type-uuid'. Then genimage starts to
> complain about overlaps:
> 
> ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
> ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> 
> To fix the second genimage error report, update the size of bootloader
> file. Do not reserve additional space for GPT partition table since
> new genimage is able to keep track of it.

Here we need a:
Fixes:
url where you point the failure

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>   board/orangepi/orangepi-zero-plus2/genimage.cfg | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> index aee9719ae4..5a7ee7707a 100644
> --- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
> +++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> @@ -22,11 +22,11 @@ image sdcard.img {
>   		in-partition-table = "no"
>   		image = "u-boot-sunxi-with-spl.bin"
>   		offset = 8K
> -		size = 1032K # 1MB - 8KB + 16KB(GPT)
> +		size = 1016K # 1MB - 8KB
>   	}
>   
>   	partition boot {
> -		partition-type = 0xC
> +		partition-type-uuid = "F"
>   		bootable = "true"
>   		image = "boot.vfat"
>   	}
> @@ -34,7 +34,7 @@ image sdcard.img {
>   	# 'rootfs' will be used as the partition label, used
>   	# with root=PARTLABEL=rootfs kernel command line
>   	partition rootfs {
> -		partition-type = 0x83
> +		partition-type-uuid = "L"
>   		image = "rootfs.ext4"
>   		size = 256M
>   	}

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
