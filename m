Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E56C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F84419D4;
	Thu,  5 May 2022 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 962opjPYiVnv; Thu,  5 May 2022 21:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58293419A7;
	Thu,  5 May 2022 21:30:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C072A1BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE9D1404C8
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKW33V9EEAng for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:30:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B80E04011F
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:30:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id dk23so11065230ejb.8
 for <buildroot@buildroot.org>; Thu, 05 May 2022 14:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Hg+NTkFO9Y6kH0nQJ6Ei7hyqynvE5tVNKNeRq4fAQig=;
 b=WVLKG8RQYwpAhVYpMo9QoWmxl/ZpyK5XdlUJQ5zWPVjDPSWJ7TLOV7roX2vZ/VnaDK
 HS/xQLKnHk7cftpa9PrSC8uFpZKK7juovvz9wqbGlydYN/pYKp9mhhzVF7iEt8SarL+Y
 Qp8zrOFKmuBd6jL/XkMKuSIvqxkwUsCEilxMHIaiDtiCY/Mj4dt3+I8K4Ak+Rxf+ogrc
 uLY7paHw4/ac22j82H3DTNMHq9tidcyHtSvSzogkUzXavHAAXoSKc2glhKuUWZ8II/if
 zn2frnDkXAx2Qeo87NIk+YJjm+pns3QYSN44e2CS2CMscRUt8ad40H4pub36v3Q3SMVa
 gZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hg+NTkFO9Y6kH0nQJ6Ei7hyqynvE5tVNKNeRq4fAQig=;
 b=JHp05s+CTW8oSFbCBXfXikXcQzwK0w8e95CQXf6b54d0vGXx2yhfuEJcxc3A78N9Vi
 55/BHkmsgOo7I5y4KB7neJ1UsWEDEFUU1V5nt7qLilA1nOamWNmjOxa0U5oPgsYlv8iA
 RM6eSWmmmdGxWPJJxskydwT8c4/2ZR8kZo87B9HSSRO1f5rw41f8qbSLU1wVn32oAo4d
 S7/Hp8fXVGYxB88GebK0L0YPG0A4S63cEi78ETYZrdwcRTuUVPNAAlCrDPs184I2meHi
 QknnpSwY8g115A7FCADOQMEMO/WZ5cVxGjLHsCdXZTBW7QaE63Uc++3JDR6eCeoE/vz5
 Kt9A==
X-Gm-Message-State: AOAM532WKkHEppy3vnbd+EPNMxuF77NjJMHCZDKpOQroKXk/IkMSe0kR
 DwUdgnLnveneacY309G5+fZFehO+F5g3Tw==
X-Google-Smtp-Source: ABdhPJwmOIAQNKWTOBJP84C8p0z0KtJAb5TM7dpduYBDmZT08QrfMl+oMgMvBI94gawa9m821uCN5g==
X-Received: by 2002:a17:907:8a06:b0:6f4:922b:4b91 with SMTP id
 sc6-20020a1709078a0600b006f4922b4b91mr145651ejc.670.1651786214975; 
 Thu, 05 May 2022 14:30:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v23-20020aa7dbd7000000b00428493ac4ddsm513151edt.55.2022.05.05.14.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 14:30:14 -0700 (PDT)
Message-ID: <2aacc9d4-5df6-6ccf-ad6c-ae8afe2d9d8a@mind.be>
Date: Thu, 5 May 2022 23:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Leger Charlie <c.leger@borea-dental.com>, buildroot@buildroot.org
References: <20220504094006.1541643-1-c.leger@borea-dental.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504094006.1541643-1-c.leger@borea-dental.com>
Subject: Re: [Buildroot] [PATCH 1/1] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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



On 04/05/2022 11:40, Leger Charlie wrote:
> Since SDMA firmwares for imx[6,7,8] are now provided only by firmware-imx package and not linux-firmware package [1].
> Linux build can failed if depending on firmware imx, so add firmware-imx dependency on linux if package is checked.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html
> 
> Signed-off-by: Leger Charlie <c.leger@borea-dental.com>

  Applied to master, thanks, after adding a note about CONFIG_EXTRA_FIRMWARE and 
wrapping at 72 columns.

  Regards,
  Arnout

> ---
>   linux/linux.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7ff7b05042..e40672ceca 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -73,6 +73,7 @@ LINUX_INSTALL_IMAGES = YES
>   LINUX_DEPENDENCIES = host-kmod \
>   	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
>   	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
> +	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
>   	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
>   
>   # Starting with 4.16, the generated kconfig paser code is no longer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
