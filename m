Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D4DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 15:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32399408B2;
	Sat,  5 Mar 2022 15:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lZ1d1IALCWV; Sat,  5 Mar 2022 15:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 533D140347;
	Sat,  5 Mar 2022 15:02:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAD3B1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 15:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3FD5812C0
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 15:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G60FbWJsfqgs for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 15:02:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D1B58129D
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 15:02:00 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id qa43so23125586ejc.12
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=93T/ge4qpNwY1ppmb3lHNz5Af8SNcFxt2q8pCvu2l1M=;
 b=d+U3UTnM8hT1ZwC0ZDnJ+TdZ55HLU9+iMBitt/kYSzhHJ5iiY8ElbZCM8W+fp1Pm2v
 Fn7/cxs0CS7pFjrI/f1AsicXaulKWu6kChgdYWRcqqTb05Rh81tzxLHRcDAiQtaOEZk8
 12vOqkxMeZw9fmzlkrpUKgckilNkeJOThSbMRsbgwiv2NckMp8m27iAqIj7WzYY4TKyj
 mlaWHLIQQwcDkenOnidlkNHeuztQVBu254SyxSx3dzY6tREDugc6QJcB0dIj6Noveb3l
 sQAkDpQPsISOZDQOm8prgH4LFhOyhSZb5yifAGFgclBYuVzqDZVWDPAcZXxCI8vWbqKB
 byzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=93T/ge4qpNwY1ppmb3lHNz5Af8SNcFxt2q8pCvu2l1M=;
 b=gMwRHczU1NBy0M5OfEVYCKPp1KH6DtesdHjgBs5hrl+D+BrpyH5LsNbdKCZdthZeiy
 Yeq6s9WQALSLamgT045Q0t8Us1PnRSuCPPK+WBJ+3lEGB8KCj64bTp3F0F5ONI1xD1cv
 0ytF57se2365Ir0x0mPbDmExXqqhfa8M1lTNnDUV/QzHQyxwv9fjx+ZJraBP0V90Iaa0
 NyxAkjVvyVY42ocbcBMKT4vbHat76lYJTInm0D62G6IeSIPODxUD9XSitSet5nKaGQiy
 R5g4PLivuzjPgOxTyrrxDs7MQf2SLsmcLZuFC5do+FBwckwyGMItsyQIN3WPBa5kg38s
 whrw==
X-Gm-Message-State: AOAM531N0929rOn5o8COVa5ECJBCIL0139Zq6K0xjG4yMAS2aEalEpbY
 DxHIyp/yucEqeK8Yk6nsZU6a5z1QK5J4NQ==
X-Google-Smtp-Source: ABdhPJza9vL3b6wX7TCjiP39b+6i7jqBOjDw8388fa0zyLvd2Us2x1n57pPMgB4yqXP/ezwAR66GeQ==
X-Received: by 2002:a17:907:7ba6:b0:6d7:1888:d553 with SMTP id
 ne38-20020a1709077ba600b006d71888d553mr3121546ejc.98.1646492518772; 
 Sat, 05 Mar 2022 07:01:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 cy1-20020a0564021c8100b003e359e4f54asm3548023edb.43.2022.03.05.07.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 07:01:58 -0800 (PST)
Message-ID: <863fa1b5-dd78-2643-580e-fb5b231e5da1@mind.be>
Date: Sat, 5 Mar 2022 16:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
 <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
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



On 17/02/2022 16:55, Marcus Hoffmann wrote:
> Fixes the following error during image generation:
>    ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
>    for mbr and hybrid partition-table-type
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

  Applied to master, thanks.

  Regards,
  Arnout

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
