Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72663C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BB24415BA;
	Tue, 15 Mar 2022 21:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvPJykMzwS8Y; Tue, 15 Mar 2022 21:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E144087D;
	Tue, 15 Mar 2022 21:48:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1CB71BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C02CF60B83
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ieOCb_Ed77kS for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:48:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3C91605AC
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:48:15 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qx21so345359ejb.13
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xgBaW011DKIiMirUcfb0mh0cVzD8C+/D5pgAMCLiXW4=;
 b=Sm/rFBRZ5WcW+16PTUktUli3QSItIYZUpes2si27LV8JtMmHj7DztoVJoV5YtNX2Vh
 z9ylZa5y5WH13XzNCBTAY+ix5mKrsmdmNMi0zlY4a2I52DgiT46+ZLWMGIBqpV0Kc5Mp
 vpp2a+8Ys6/IIisMxDeEzCSVenBFua+s2SaThO6RYttHTd1KNB9tkhdWH3wsrvQbiHzU
 x5ajIXSSFQkDCicqIR7KhA0BEkgoisq22fGO0J3nPkp9vs6NnSGatZrdUlMYXZiwyDai
 5MijQ8llyuxLxg5CyR+8UwMNACgqozr8skw5RCPJ6f29MeKFuIYUM3agh6es6j8A6bmK
 zqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xgBaW011DKIiMirUcfb0mh0cVzD8C+/D5pgAMCLiXW4=;
 b=ElNs2/CqUuR9loZVvVD4cIZQWY0Amsb9FxvLUxmRBNwXyA58ZiorV1IDs2LimsbTCd
 rYt1G0phEW9DZ9m6xBVs+R47QAKQ6zpCTNkeJ8oHn/22J2K9TfgeIqVXfz8xdDsQ8lbW
 kGX1vtMWY4T7zDlQ9JYZHalz81Kb6rRhf0jS8Pt8Gsu1xITjr8vHUrk+v5pbrJ1PveB2
 IVMPTP9qis6Y17ijXftMjJqbbIQ5RmtO/Yz/vSIGkbnz4g8rrlveSMJyRfnwS5hXWWSA
 8buxy/Z3+iKXCGVJ+p1yVaL06+Ay3RZr7xl39iA5V+oMXUEZFw7RAyGMXIJJgXN8/VtJ
 ak8A==
X-Gm-Message-State: AOAM532pb/fg5Bg+dgfNHdY1ZnPTbYWRQAeCzEEYW4o7fHdaoy7DtH+p
 3U0AN7wcKGPBR1vlR8gW142u0A==
X-Google-Smtp-Source: ABdhPJwo4x1jSKI6MVjCDO79YQ/86XPx1hCS50wKK7HwPh04RjUVeRWGakq2WuRB3Uz0KEltID+pvQ==
X-Received: by 2002:a17:906:7246:b0:6d6:e43a:e487 with SMTP id
 n6-20020a170906724600b006d6e43ae487mr25333417ejk.455.1647380893942; 
 Tue, 15 Mar 2022 14:48:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q5-20020aa7cc05000000b004129baa5a94sm78086edt.64.2022.03.15.14.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:48:13 -0700 (PDT)
Message-ID: <3f1330db-ce9e-dfa5-4b61-beba3b200ebe@mind.be>
Date: Tue, 15 Mar 2022 22:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Yannick Brosseau <yannick.brosseau@gmail.com>, buildroot@buildroot.org
References: <20220309215531.638593-1-yannick.brosseau@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309215531.638593-1-yannick.brosseau@gmail.com>
Subject: Re: [Buildroot] [PATCH] docs/manual: Remove link to emdebian and
 replace with debian port page
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



On 09/03/2022 22:55, Yannick Brosseau wrote:
> In the list of full distribution, the FAQ contains a link to Emdebian.
> This project stopped receiving updates in 2014 and the main web page does not exist anymore.
> This replace the entry with a link to the Debian ports page.
> 
> Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/faq-troubleshooting.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index 5adf3fa6ce..b08bf9bc4a 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -45,7 +45,7 @@ distribution_ and you should opt for something like:
>   
>   * http://www.openembedded.org[openembedded]
>   * https://www.yoctoproject.org[yocto]
> -* http://www.emdebian.org[emdebian]
> +* https://www.debian.org/ports/[Debian]
>   * https://fedoraproject.org/wiki/Architectures[Fedora]
>   * http://en.opensuse.org/Portal:ARM[openSUSE ARM]
>   * http://archlinuxarm.org[Arch Linux ARM]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
