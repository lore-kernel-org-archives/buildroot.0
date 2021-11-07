Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6409FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 17:26:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40CE561355
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 17:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40CE561355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1E0E400D0;
	Sun,  7 Nov 2021 17:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Suu1Ohv9V6of; Sun,  7 Nov 2021 17:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C467D40249;
	Sun,  7 Nov 2021 17:26:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4006C1BF293
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 17:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B6EE40249
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 17:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tomRthdB-kD6 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 17:26:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5839F400D0
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 17:26:21 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jlvumvINtueW5jlvum3Ucr; Sun, 07 Nov 2021 18:26:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636305979; bh=/UYoP3wUiEc+4PAIQ9zXyh7ARKNhrkz/Ynkw3gR++V4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=FdmwfEv7sBurlZx2VRbE+GtCcCQFbBZvW8SkMdn842wngBavHS3l2xSXPsmW4ExGq
 LK21VgHwqeVlxn+Xsdordq/sMlb6/EIKXw7zIRCVm0+p01v+8SQAD3LOj412/qD/E8
 RAew2T5xv4ZrBIyylqx539hH/njYrEgUmU0NPYaEdRE/XkpIp+rpGAnLTnSIbyfoW/
 FFaKxDq1csleeOa0EnkX/F2BI3FgziO9QbFlrJWQHbMxiqBn5ZSdIYOJ+WmaXrLcfY
 vAAOcOVs4UPrMmAiJz4JfN7UfjuhkWlGXSjdwV/du91+/y18Zl+B7etRXdwvEBD/7D
 S97jnH75UMX6w==
To: buildroot@buildroot.org
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
 <20211107024330.3061378-18-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <e1797aae-0eab-97c3-73c9-cb43fba7ca99@benettiengineering.com>
Date: Sun, 7 Nov 2021 18:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211107024330.3061378-18-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfL25ti5Xr2qijpffJWFVNOUg/bLfdlFFUlwXqWY+IMJhu2gPLWQVbZl+VIB0iPI5Pg3WILAZWRNNGzH49ff5CvF+9Ksy5uVgY9OEpy7KnQMWALqtWdAR
 gYjZ8bjY4ULpmNLcXHPlxiRt7OCLKc/GYM2CsTxUsyDD2IzraJW6E5bt3zyWJQVqPkHEuhBGCdA2lhPdOq4sUJpqdwvu6l50CzI=
Subject: Re: [Buildroot] [PATCH 077/102]
 board/qemu/aarch64-sbsa/genimage.cfg: beautify file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 11/7/21 3:43 AM, Giulio Benetti wrote:
> Beatify this genimage .cfg file to have consistency with all genimage .cfg
> files in Buildroot.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/qemu/aarch64-sbsa/genimage.cfg | 42 +++++++++++++++-------------
>   1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
> index c75d9fcca1..0d916e6b28 100644
> --- a/board/qemu/aarch64-sbsa/genimage.cfg
> +++ b/board/qemu/aarch64-sbsa/genimage.cfg
> @@ -1,27 +1,29 @@
>   image efi-part.vfat {
> -  vfat {
> -    file EFI {
> -      image = "efi-part/EFI"
> -    }
> -    file Image {
> -      image = "Image"
> -    }
> -  }
> -  size = 32M
> +	vfat {
> +		file EFI {
> +			image = "efi-part/EFI"
> +		}
> +
> +		file Image {
> +			image = "Image"
> +		}
> +	}
> +
> +	size = 32M

Here it must be 64M after commit:
https://git.buildroot.net/buildroot/commit/?id=2c525794515fdbf6232bb8c8dd918c93cd12d2f0

Would it be possible to correct while committing? Otherwise I should 
send a v2 series of 102 patches(maybe?).

Thanks in advance
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>   }
>   
>   image disk.img {
> -  hdimage {
> -    gpt = true
> -  }
> +	hdimage {
> +		gpt = true
> +	}
>   
> -  partition boot {
> -    partition-type = 0xEF
> -    image = "efi-part.vfat"
> -  }
> +	partition boot {
> +		partition-type = 0xEF
> +		image = "efi-part.vfat"
> +	}
>   
> -  partition root {
> -    partition-type = 0x83
> -    image = "rootfs.ext2"
> -  }
> +	partition root {
> +		partition-type = 0x83
> +		image = "rootfs.ext2"
> +	}
>   }
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
