Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2193CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA14E60AE6;
	Sun, 13 Feb 2022 15:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvPkkX5EDKKl; Sun, 13 Feb 2022 15:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0218160A9C;
	Sun, 13 Feb 2022 15:25:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A693A1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 962FE401B8
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6K0W-1xJdss for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:23:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A09F54011D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:23:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id e7so28504249ejn.13
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aKl6xwK5zS/b5TzXwmXFCnLFFDaXONuoepGm2lFH61s=;
 b=DiEJrndw/5+aoMFfAlkHVdrK/PN/Ln/ldXSA+K4wgig5Z3nr70s7VpQmou3PnazrVE
 a9DUnivJcfDLJmzoeGMTa1uIO2nCgtLmczh0b7BYSuG4EpludlpvgToIgGrpTR9QX2yQ
 SMlRHH1IdhjV1DOhCG4ii4ZHWUEFxY8jrDtSxXqSzwEmv3b7SiHvr4JisRizoGsXJWnd
 /LH0i1tMHH6FcCpvwDNs8xSN0TeF5poM0cQ4zSJhKyskgD4nogTEqo6xcJPzwZJNi+EV
 X419LUEmjCagKn/rIdpWwxYVICBSmuNH8cg6ZGHMMiRoUQsY3cInamV7SR+jE1A9MrPv
 H3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aKl6xwK5zS/b5TzXwmXFCnLFFDaXONuoepGm2lFH61s=;
 b=XZ8M3haAb5ebpcMi7FwxxrQEam5Pj6PAMB96dgUwTn/1Aon+N8XiJ2jq1ByTsBlpxi
 0DZQouLcQRePwLCzQ5RXyDUAxltPPyiky6DM1I+idL6iDfNTqAIMUrC1Fal6cBU/kMNt
 gDUM+Bk+QXbyHgbNZwrejcnvgBTSRi4dpwUkcdNGlkZ/8+usdpmzWAoFufWbVuMhJb13
 JE+z/fQzih/InP9MWpQOm/vtswbWZnmeEbfMkOFegyzCNxH9bvI3NW8kXp4Vz/oaTasc
 qVnupK9jGXv9YZOLyW2CZSC4z4L1pzRPTg3NtEZEFL4Jp6QzFhOfZil0Jt5ZIJHPBBh8
 QFmg==
X-Gm-Message-State: AOAM532rOI7Xdv9dcA/DBF/ZXVJgQGzp+ZlS4M10vFfgCM00qERTMLe9
 yfV2tFWuq6udNZn5m1heSkUvZw==
X-Google-Smtp-Source: ABdhPJyb9MUZPMQocv/T48rn6KW/mS1+vw0GruRrgqqanq2u8NNoF31h7g/Z56njN/ZDURUmxLxyvg==
X-Received: by 2002:a17:906:5d0f:: with SMTP id
 g15mr8420054ejt.751.1644765798910; 
 Sun, 13 Feb 2022 07:23:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o3sm8803064edt.67.2022.02.13.07.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:23:18 -0800 (PST)
Message-ID: <09ecf96b-e69d-c143-d37b-f32681c3cd5c@mind.be>
Date: Sun, 13 Feb 2022 16:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220204000657.747245-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220204000657.747245-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] board/radxa/rockpi-n8:use
 partition-type-uuid for genimage-15
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



On 04/02/2022 01:06, Giulio Benetti wrote:
> Genimage 15 restricted the partition-type option to mbr and hybrid
> partition-table-type and now prints a warning when it is used [1]:
> 
> ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> 
> [1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876
> 
> So let's use for EFI System partition:
> 'partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
> and for Root partition (32-bit ARM):
> 'partition-type-uuid = 69DAD710-2CE4-4E3C-B16C-21A1D49ABED3'
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717242
> 
> FTR, the magic UUID are from:
>      https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  I considered squashing it with the patch in the partition-type-uuid 
abbreviation series, but since that's still a bit in the air: applied to master, 
thanks.

  Regards,
  Arnout

> ---
>   board/radxa/rockpi-n8/genimage.cfg | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
> index 2e064d48c0..909a646499 100644
> --- a/board/radxa/rockpi-n8/genimage.cfg
> +++ b/board/radxa/rockpi-n8/genimage.cfg
> @@ -26,14 +26,14 @@ image sdcard.img {
>   	}
>   
>   	partition boot {
> -		partition-type = 0xC
> +		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
>   		bootable = "true"
>   		image = "boot.vfat"
>   		offset = 16M
>   	}
>   
>   	partition rootfs {
> -		partition-type = 0x83
> +		partition-type-uuid = 69dad710-2ce4-4e3c-b16c-21a1d49abed3
>   		image = "rootfs.ext4"
>   	}
>   }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
