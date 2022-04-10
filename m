Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E512C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13A58404FE;
	Sun, 10 Apr 2022 14:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImvAvYByKcsa; Sun, 10 Apr 2022 14:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E60540119;
	Sun, 10 Apr 2022 14:51:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 495291BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36A7D80B85
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYOUT2uvV8if for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:51:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75956817D3
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:51:46 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z99so6740522ede.5
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MHvUNwBL1++hyDLQLXpGYDG73m67j5DnQ5DfZyGgdLQ=;
 b=PPVWztmkTPRfhl1X8ZKBA1akX6v6RSIKTX4dHCtHHGZZZSpYZzhiO7fnjnXlbKP4xI
 PgjBMOKBpXdYp3jSjE5L0i3KQy7ps0XeBxjOAuTV4z4iycXNx+2ulQoTuQDdKry/+Nw8
 Kj1lKkiDyAlLZJITRQy004/w6v226eMHWlsGnr/KrpQjTZP7egL9y02IIezcu3+3oyej
 rt2R0kV8izRmWgJxCCTTX0hGx1JLbppeR5yatJ3tBhkY05qqED7rQujuXqcNOM0ZgN3x
 7CgFSIuJn/74HbTPg+ZMSzdazX8dSwI/RYmsgwia7hw/7EgwIuz09ahCECpWvzhLbz7W
 e+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MHvUNwBL1++hyDLQLXpGYDG73m67j5DnQ5DfZyGgdLQ=;
 b=ido/8mtOIQfuKk7ofF+SrRkuUmiohJEewBvNPGlUDY9mhyyjsRtdLoiz/37raxyCrT
 Cq11D27mtsWD1HMcNY9g5CLhDsRU6W9a5XvW0DKH5VKM6VN8/8qb161JjLeo4bmU7spd
 JiyeLr/NuxY1iorB6w25N4c0XByvJyUfKOU9ZPDkfib1AqaSDWpPz1jSd6vDukappDfE
 IKZXR/MgwSbEseyYp/++ECiR+8lyVthDI7Ew5dbv6fi+x9kLrrTzbePKBGRhpDU7E/pu
 sv0+S+PSNlp9Nhqr2sLZvH6XIm73D+7NaC61CoRUWR1chjjyeqh+eLQNB20OXg7Zfnnu
 clyg==
X-Gm-Message-State: AOAM532Kv/NJT4Atp4KaizRm6AyfJWm0Hy2O4JGBsA+hL8PX+8qVOf6u
 e2nMiKY2DHwPn0PktoZZ861loA==
X-Google-Smtp-Source: ABdhPJzSYF9u0iDWRQ+KqLHYWySqph7qyF7Uyf9D7n21BDS7Zd4fx7tn0zOLiW1MPbXZ+xtOtgb1Cg==
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr28855343edz.13.1649602304396; 
 Sun, 10 Apr 2022 07:51:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm10947073ejk.119.2022.04.10.07.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:51:43 -0700 (PDT)
Message-ID: <85a9a09f-7df2-e409-0ce3-486beaa65022@mind.be>
Date: Sun, 10 Apr 2022 16:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20220405084929.2755-1-yegorslists@googlemail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405084929.2755-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/wpa_supplicant: enable SAE-PK
 option for WPA3
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 10:49, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This enables a new security feature "SAE Public Key".
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wpa_supplicant/wpa_supplicant.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index f0eb36e083..a2ca8a0b30 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -112,11 +112,13 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
>   WPA_SUPPLICANT_CONFIG_ENABLE += \
>   	CONFIG_DPP \
>   	CONFIG_SAE \
> +	CONFIG_SAE_PK \
>   	CONFIG_OWE
>   else
>   WPA_SUPPLICANT_CONFIG_DISABLE += \
>   	CONFIG_DPP \
>   	CONFIG_SAE \
> +	CONFIG_SAE_PK \
>   	CONFIG_OWE
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
