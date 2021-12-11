Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB31C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 10:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF76D61CB5;
	Sat, 11 Dec 2021 10:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MRmrWCEbxS6; Sat, 11 Dec 2021 10:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FE4C61C4B;
	Sat, 11 Dec 2021 10:01:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5AB1BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B17361C4B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rujHN9ef6GdI for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 10:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12913611DD
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:01:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r11so36523687edd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 02:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=WxCv615wIiVB5NdM2THo2vzdreGkaInWnWn2cnix7/E=;
 b=PBpTVesgS/JoZAQm8f5WeUvDmUMdWO7bNiMeivYa9r+VQhHRTDs7y/E/7H1OCjKEd8
 CVWU+mjSUVqZq3l97DEEnaU3rhA15JwkzbaWiTt1zbsiKbzvqyfGCRqul40dX1oJEKy8
 SFO+NlqueI/0H3wBGpkmPsNBOViYt8FED9FdFHu0V/288KILLqHzDryiCtzhzC4bt+Ns
 KRvdI7dgQgEMNIK8itEu+gAcA1cJrHR5aQO34MRXlf+z0pwDfQFZcU5N68jGPRTWx9PM
 1yP+vatSDKKMohDTwWPMYP3RKHiyTTPEAYsnK5w6i5fcjKWC810nd+YKtYT7ob1SPOgB
 +CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WxCv615wIiVB5NdM2THo2vzdreGkaInWnWn2cnix7/E=;
 b=Nqu6j7CtpVuMlCDosr8oVcBDMYJJyQcmabAAk5/k9gF94tczgnKl+lGJHyh8JoWj9e
 fRRqn806iB4ofLijjFitoboDXtQvZuU+r52Bv1pob01RC9RiQHDYB6LhNTF7ovOt1z78
 A0LyvTwEKR/PhiUSrCaEW6NMBsVV/BTocOsLfUlYlG5/oTuQ0tKCylPPDEfv1r+NKrsV
 cOMohxDpkurYaNvqQQY+7CSiN1Scy3UK9EwpSyx22qRvWITsNjLpz9sVTlOFe15fpXAi
 MjZFEEis564O6NoxnqgjlOoDAE3NgEA42FYCDFaKRHdhIuFpcnIgBMWclAYzMuV7MHpN
 5N0Q==
X-Gm-Message-State: AOAM533I6MeBFaVaqgXdCS0U3EOMORAKxi20PJvxgORl1vYKRYhAs1N5
 6o2AUAd+U+hbbPzAKSPkE1ITjkyWgL9ijFvml/0=
X-Google-Smtp-Source: ABdhPJw5n16KRsRX2t5mtyXre36Nht6+3cqEOs6m6OMxb71wdx/EvGVwEE4bH9Z6hDIZo1gTXMcvTQ==
X-Received: by 2002:a17:906:55d7:: with SMTP id
 z23mr30298096ejp.393.1639216910144; 
 Sat, 11 Dec 2021 02:01:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hu7sm2696398ejc.62.2021.12.11.02.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 02:01:49 -0800 (PST)
Message-ID: <ebb7d992-b502-c414-3c5d-b914449d07fc@mind.be>
Date: Sat, 11 Dec 2021 11:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20211120225903.28937-1-kuzminov.sergey81@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211120225903.28937-1-kuzminov.sergey81@gmail.com>
Subject: Re: [Buildroot] [PATCH] ARM: dts: orange-pi-zero: enable uart
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

  Hi Sergey,

  The summary line should mention the file (or most important file) that is 
being modified. In this case, I changed it to:

board/orangepi/orangepi-zero: enable uart

  Applied to master with that change.

On 20/11/2021 23:59, Sergey Kuzminov wrote:
> Enable uart1 and uart2 on orange-pi-zero board.
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> ---
>   ...4-ARM-dts-orange-pi-zero-enable-uart.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
> 
> diff --git a/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
> new file mode 100644
> index 0000000000..839bc16087
> --- /dev/null
> +++ b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
> @@ -0,0 +1,35 @@
> +From e8768cc1f0f1231cbd4864417de629330e21222d Mon Sep 17 00:00:00 2001
> +From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> +Date: Sun, 21 Nov 2021 00:58:32 +0300
> +Subject: [PATCH] ARM: dts: orange-pi-zero: enable uart
> +
> +Enable uart1 and uart2 on orange-pi-zero board.
> +
> +Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

  Ideally you should reference the upstream submission here. I was too lazy to 
look it up so I left it as is for now.

  Regards,
  Arnout

> +---
> + arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> +index f19ed981da9d..03acf166ab70 100644
> +--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> ++++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> +@@ -184,13 +184,13 @@ &uart0 {
> + &uart1 {
> + 	pinctrl-names = "default";
> + 	pinctrl-0 = <&uart1_pins>;
> +-	status = "disabled";
> ++	status = "okay";
> + };
> +
> + &uart2 {
> + 	pinctrl-names = "default";
> + 	pinctrl-0 = <&uart2_pins>;
> +-	status = "disabled";
> ++	status = "okay";
> + };
> +
> + &usb_otg {
> +--
> +2.32.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
