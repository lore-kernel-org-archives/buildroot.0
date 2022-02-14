Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683AAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1152E40529;
	Mon, 14 Feb 2022 20:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMTgs-tQUl6A; Mon, 14 Feb 2022 20:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9F24052A;
	Mon, 14 Feb 2022 20:02:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D03E1BF316
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88066404F3
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OiQYwv-1Ncq for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:01:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A17C9404DB
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:01:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h6so28641745wrb.9
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dsnBO1bJlXTvMGE+BRKTQi/HTMhBsfU3IuYrCIhqFbY=;
 b=Tq6AEaJGsoqBuF1FQryD4xMdSjGjfFXY7EkN/TK3WCxHkx0sRWZDGDkjj9sPdEvxQr
 nFtdpGSLO25CvT36luGCJ2cw3j5uf5b3cP1jm/fQXCO+94R7wuusgFQdYIrP7J0dsXNt
 tigORIJk+YqVbGUozmBy9KbrjIqmXgI3Rgt7GZKNzNr+FVjf5GjUhOGNYGq7d1R4bAwN
 ReXfbpFEc5mwEAIseigcpkZvFmqN+hu0RvJAqZaxUpIeOqc8AxnsIMNRCCMt4gndYCzQ
 foL7Zp+7SaoBVTTJrO9tgG9jXVXoc/bKChcff3DjgmKPoLARrAy1LlWeW13ls1VPJkJW
 S65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dsnBO1bJlXTvMGE+BRKTQi/HTMhBsfU3IuYrCIhqFbY=;
 b=lgxiUrLcZmmNNCX+FvdR46gc2uMDfRk94LoYuZ2kXA01xVmRBHRud9zaxsxb+F9Igd
 Y2v+KFSpyS0A4sWygiettQkEZy1+3SV/F+cBd4NyC4BB9Ruk/FdPjf8OUKtipfvSGnon
 RfSljr5BWDwRvstJuWsSxVYIN+7k3HcY5R/n+xQnc9rZeatNWcGi7r4xAy+EG8l+6yaR
 XPe74aCM+ZGXUI5GeXUAee0jYIcskW0GJUkbw9wAYE112TXZi49BAWWANxy7fNJIrMUg
 /gmdTVRf2Sl/QiDX6osZL/QhlDKIzswsFUdsh78kF/chI6CkNCc0swv9hG8hfdBNUSqf
 5Rtg==
X-Gm-Message-State: AOAM530wMhBWUGgBdWmKQR9d/HwrdnUUAUcRe4eqfgbyM0QbEgRlgv1b
 QWCHTWJQEOz7wfdKud6poiHW7qRX9VHSyQ==
X-Google-Smtp-Source: ABdhPJxQWj4m+DTucNs+S2UXRL2/vgwckM6f3bIFjqYzT+wAJ0XzFCpf0Qw9ph4NoslrCu0Jn001ig==
X-Received: by 2002:a05:6000:1e0a:: with SMTP id
 bj10mr491606wrb.161.1644868889819; 
 Mon, 14 Feb 2022 12:01:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t18sm9079536wmq.2.2022.02.14.12.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:01:29 -0800 (PST)
Message-ID: <e036bebb-b147-bbbb-7842-ff76046daa45@mind.be>
Date: Mon, 14 Feb 2022 21:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] configs/pcengines_apu2_defconfig: linux
 needs host libelf
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
Cc: Danilo Bargen <mail@dbrgn.ch>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 18:10, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/pcengines_apu2_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
> index 0792c93c19..a85808554c 100644
> --- a/configs/pcengines_apu2_defconfig
> +++ b/configs/pcengines_apu2_defconfig
> @@ -8,6 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
> +BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
>   
>   # Default hostname and TTY
>   BR2_TARGET_GENERIC_HOSTNAME="apu2"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
