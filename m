Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA70C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F2841BC3;
	Thu, 17 Feb 2022 15:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DT57vTFh5oaz; Thu, 17 Feb 2022 15:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13ED441843;
	Thu, 17 Feb 2022 15:58:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B59BB1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C6F41843
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYX7uH27T0t0 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:58:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99C22417F6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:58:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KjB9ntO79vHpTKjBAn015R; Thu, 17 Feb 2022 16:58:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645113528; bh=NNvM5Jtp3a+GZIoUnv0sW0NfLy/DVscv1Eyd5i2rEtA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jX0NkyEI0Oig92QD41gL6hx58b+9AnycVkE42eE0EKSVmjKkS28qTT4g64ATbbv3y
 5RQdoElRTU/F2U//Ajs9/vah8LtzjOB4ccA23TG482VCb9lJaKrNxtaRsOR7nm5wrC
 PQLj9dLnKENsINAk5q7drXLa3AjAL+QExvA9bb0eY2r2wpzgrRvyAHju4gXftC2eql
 yf9UvkZyhXpFszhNnL1uL1Wa8KCd8z1Mcvu2xZrgqSTXCNck3psYfYFBj5GcesS3WO
 I4OgP5VrUbcYqXtgc9xVE8pGdFKezTz/iY4Kdy+UmrvE8nOxlfZBX1OzgMupvS/wgB
 z6yTw/8jEY2/A==
Message-ID: <918b0f89-7e30-bb9e-1d33-118001bb2846@benettiengineering.com>
Date: Thu, 17 Feb 2022 16:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
 <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
X-CMAE-Envelope: MS4wfCbFC1YIqgRtNUkivmywJM3O4U7+j57IiqId+xT1rNgxTyeUy0SLG9Deyoiv9j+Wg7r5KvJCjIrsddOxcV0Q1UuCU8Tp58HA/BO64NeEKWXr3BEYsWrm
 UWVkIjGr2diwSmu3NtRYVSUQfZZrPGGj73P6ZUKajcQfwjSerbYbVyXjm4ohfLP0IqOe8cD30w2fy2Uaghv4gPNiVZ7O7ccpq4YmSq9JPtzy4tGNCdUmwKJw
 bChv21SXH5K96tovnEGXWzg+TKkBOpJfw7zz41QMSTr0FKbjCozyPxEiP2e3tzH8
Subject: Re: [Buildroot] [PATCH v2 2/2]
 board/orangepi/orangepi-rk3399/genimage: fix partition types for gpt
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/02/22 16:55, Marcus Hoffmann wrote:
> Fixes the following error during image generation:
>    ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
>    for mbr and hybrid partition-table-type
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
> index c94e0bc7cc..a02166172f 100644
> --- a/board/orangepi/orangepi-rk3399/genimage.cfg
> +++ b/board/orangepi/orangepi-rk3399/genimage.cfg
> @@ -26,14 +26,13 @@ image sdcard.img {
>   	}
>   
>   	partition boot {
> -		partition-type = 0xC
> +		partition-type-uuid = F
>   		bootable = "true"
>   		image = "boot.vfat"
>   		offset = 16M
>   	}
>   
>   	partition rootfs {
> -		partition-type = 0x83
>   		image = "rootfs.ext4"
>   	}
>   }

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
