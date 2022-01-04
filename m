Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74191C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2556281AEF;
	Tue,  4 Jan 2022 17:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQ3ouuArQO0e; Tue,  4 Jan 2022 17:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EFCE818D0;
	Tue,  4 Jan 2022 17:59:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6C2E1BF27A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3E2A40924
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61kbZ9kFL8Xy for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E674640920
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:59:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b13so151527164edd.8
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GOrrvtwQjwlsVHRQdsIRRZSjO9f6m2lF8/ViuGMWhzM=;
 b=baAejuS+0elozVVf3cz1jA/ok0om2L/rXscsuXVz//TXDzmaMCLPytdMI/ir5BNMqn
 r6pDGC6+qIXzyAnK2H3PbxGV3llJAlW2isUIZgt6snunLHrxqMmiXWyCJLOLwK/vD+F2
 TQjilQqiDtcqZpWPQcA0eyrYPtJhgMTg5uMyoWvVGYBI8vGrMPgdZePtA5m9NrzYJTNM
 UXNkV8NYzaoSSvlRYUCaGw8v6VZZGmSKxcxwhDMolsDYwSzOUxF19WH0g9HmXtyPEQgj
 mWI9ODOc1R7TEfvKQC9h4HYLCYp0T8c0JaL/hlotemJKrL1EvG/kn63v2zelQsIYdyQ9
 ODrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GOrrvtwQjwlsVHRQdsIRRZSjO9f6m2lF8/ViuGMWhzM=;
 b=pRAxPfcWix2vIX31Z/ofznADk1SO+3uOnXz3Vk014/d59/fvzSJdmU9EDZsJL+w4dN
 vFxLWPG0rrVYXJ8/D0IxE/5bB9tY1gZvKug5sGVCKHGDxQesF7tCTcQ2ySxhufvbTu0b
 2B/QBeFB6Vn1JrvWLCvMI8aizxyXUoOlgp8HOB/zvovM9WP2rWNW8SNpk8cXYeFmu/fi
 /fimBCWkgYOGMfs7xd7piOfriM9n7wB89AhMFPvCSLbxaQs1xg6l0uyiVyQnSmyxbVNS
 Dc7jTUHRK4g2M/0mSLHaCoTfvyl1wL19NPZsD+eMtBgP9HPwuhlMgephC5i83BbFnRNZ
 jSTQ==
X-Gm-Message-State: AOAM533Uy3USbpE2Go10A9dBrmZTbwTuRzk/nzvi+yfST1PqM4mFao6O
 vYNueVkeMzl4kC1VTxu1JpNR5JRT9OiyCg==
X-Google-Smtp-Source: ABdhPJwUeJwz1Qpq66M/OHaOhnlrYYJ31JkTAW/MEirHSzhZNRi0/g+yXelMtmtw6ZCFqAX8LnL8qg==
X-Received: by 2002:aa7:cc83:: with SMTP id p3mr49071689edt.382.1641319149257; 
 Tue, 04 Jan 2022 09:59:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g18sm3474871ejo.218.2022.01.04.09.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:59:08 -0800 (PST)
Message-ID: <cb58c03b-bc87-0a4d-a2c6-5c97fdaf90c9@mind.be>
Date: Tue, 4 Jan 2022 18:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20220102165849.1653228-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102165849.1653228-1-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 1/2] configs/stm32f469_disco_xip: remove
 BR2_LINUX_KERNEL_XZ
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 17:58, Dario Binacchi wrote:
> This is a XIP kernel, so it shouldn't be compressed.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/stm32f469_disco_xip_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
> index f3d333278a53..6c4f227f582d 100644
> --- a/configs/stm32f469_disco_xip_defconfig
> +++ b/configs/stm32f469_disco_xip_defconfig
> @@ -7,7 +7,6 @@ BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> -BR2_LINUX_KERNEL_XZ=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
