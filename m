Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEDDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A4A9404FF;
	Thu, 24 Mar 2022 20:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJtbGqQ6IlV5; Thu, 24 Mar 2022 20:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E322401E1;
	Thu, 24 Mar 2022 20:43:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 946C41BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81FF8401E1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqApbVU6X46d for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:43:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A06ED4011A
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:43:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id lr4so3116910ejb.11
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=SSngYpQp1lM3/uFLsORqbsBxEpQoAayRwAeUpiQ/Qrc=;
 b=NtkzRNM9bqAPcPZoL7z8ok5YO0fV7+qdvRqOcl0n7Pl8smDnpPicdX1m6xSsKx1+fQ
 3IZKyyLzF1g8bOOayWFk7KR+Hcq0A8JZPRddH3GNK1VoSnGO46qtFhquKRegtD4DdFXA
 c/cZU2O1tsHGrE1NAH5ZaanNpZCj7wvdRq/j2j5rIdb82YE5E4lI/unayoeXUQiACmeM
 nsOAdBdXhGoMNiKEoJI84egPcMaPuEZRoahmM7fXwTdiyro0bkZPYLbOCSr4gzgZIBuf
 bx0k3hqvzJuwWd3yLpH7kPW5KGe6/8rHxurK3g8dB7+AvT5g6l/9p9EFPYyKY7Tc1QDU
 4tTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SSngYpQp1lM3/uFLsORqbsBxEpQoAayRwAeUpiQ/Qrc=;
 b=GIWnzpKjsLCsOEPzarD8jkPQ5B449VGYJLMOSQV1J9HMNp3RlN/lydCoZp8TbHSOIO
 0vTEKVykc+9TLg8pFbJxhFabmbq9TiKVceGHB7ReFMla+bIi/MVukODPJMk+lkSmkZUq
 2ac4SopD/lHR4POBFecCUQWE6iEIdDYrDoNnzVkT4/PHhoaNvoRLolf8TpEVuhxme89/
 3pItZcmHwQ9uo0vxRhvmCNZEFv4bmrtXExhWPM84FbtcWDG/symVVMxZm0KhRudQqVxj
 m0l1vwOIT9o2wa7k0WrHTevYe3mu6fP+n6/t4eZTlz+G4XXEoD9jk5OLYNc0cRlyl0QX
 nVoQ==
X-Gm-Message-State: AOAM532Xv/w4F5KNy8OyNVOZvtbslinD0KcbXpQTFob6Gfeqg5yAXzVn
 dKY0d0c6qviIkAdg2AeTgADgTQIEHd41aw==
X-Google-Smtp-Source: ABdhPJxq6vdGhoWNDC4XsGhEstCcrV32YxoNMT2iIoxtHwuYzWX2X2m5Afz0juHlwltWYJqm299hjg==
X-Received: by 2002:a17:906:a0ce:b0:6d1:cb30:3b3b with SMTP id
 bh14-20020a170906a0ce00b006d1cb303b3bmr7681831ejb.582.1648154580869; 
 Thu, 24 Mar 2022 13:43:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 mp19-20020a1709071b1300b006dfdfe15cf8sm1661163ejc.196.2022.03.24.13.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:43:00 -0700 (PDT)
Message-ID: <d48f2d2b-5533-d5e4-2c5e-d234e061d4af@mind.be>
Date: Thu, 24 Mar 2022 21:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Thomas Huth <huth@tuxfamily.org>, buildroot@buildroot.org
References: <20220314203226.4481-1-huth@tuxfamily.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220314203226.4481-1-huth@tuxfamily.org>
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: Add some more entries for
 Thomas Huth
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



On 14/03/2022 21:32, Thomas Huth wrote:
> I'm involved in the upstream kvm-unit-tests and the mcf5208 QEMU
> machine, so I could help to have a look on these files, too.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 70d71186ed..4083e87d30 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2753,8 +2753,11 @@ F:	utils/size-stats-compare
>   F:	toolchain/
>   
>   N:	Thomas Huth <huth@tuxfamily.org>
> +F:	board/qemu/m68k-mcf5208/
> +F:	configs/qemu_m68k_mcf5208_defconfig
>   F:	package/ascii-invaders/
>   F:	package/frotz/
> +F:	package/kvm-unit-tests/
>   F:	package/xorcurses/
>   
>   N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
