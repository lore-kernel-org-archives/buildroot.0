Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A988C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 20:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65E242979;
	Thu,  6 Jan 2022 20:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6yuUuWZH-3D; Thu,  6 Jan 2022 20:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA3D42954;
	Thu,  6 Jan 2022 20:38:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B74891BF3A4
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 20:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A557660D93
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNF3_g776uFZ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 20:38:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C20E260C2F
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 20:38:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k18so7076501wrg.11
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 12:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ttzJc8NqKE5kis7tj5nRL4f1Iv/MfS5iLVqnU4W6nAI=;
 b=hgzIViy8MPihM7L3xGrW8wUEeKHFloTBPd6zR4KfmxOjXXCur4nPefnsadbk3n4cd/
 jDt7ARbq1d412blEi6N2UDvAzu2Tz3JwXyfF2w3Q85xQjx6+ZlSZy1zu/HRd4HoS+aE/
 3qqTyl2roOkNX7Kve9o+KxEp9vg/DWkGe+wBoAMvqZp+bbQdfLvYD2aGHMvMbnC6xYt+
 GFTxIRQngeXF5FTMYJgwEvz0sE+aniwH0rDV7LK6/sbI180GH7l2jGIxinXdkbYHKtOJ
 tFAT3QDV7xWy42aBuDidOlFTpG/dbR5JMZm6iREFkGePUv3nVODS34nH07me9DxdZi+Q
 AC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ttzJc8NqKE5kis7tj5nRL4f1Iv/MfS5iLVqnU4W6nAI=;
 b=H3cigDk6impmApruRx5S30LrQRT4GirFEhCMurosNP+YqtetV4c07WNdvvEXwLeiFV
 aGvSLQkAWWJUdtVP8KJUdxW5nFXuTm+ITcExnZnDXo5aZINwWJzq43s3J6VbwDu6hPad
 +ayhDab6TnOUS3h5DHJBfg2pqeImnE00q72wmOx9lW61+3OAixRdhvqeMDIUmmdxJgeK
 tvfgSrCSdCnA3vTvvgzwBLBkN/Jwy6IwHTOIEtlr6ZS6xjFrIQXDPt9F3smIn6VPXqsC
 NJfbBg/WfcsMKHXoxdBaYQTO0gWOjZ57x5Os/WPbvrV0raF99qPLVXVhow1Qoj4MiLZe
 xJVg==
X-Gm-Message-State: AOAM533uGqDet59A1GZ+dl+AneNkt4/zyZ/1Pwd1TbtzZ4buKhNWjI7I
 /iDUYR711hzE/gDheYKDmPSPoLCWJiG2Z7Eg
X-Google-Smtp-Source: ABdhPJyqca8MZqSUO7uFbFquaMa03hsju66YuR13aKuU+9Rai6CSh1zc40Pgq/FxzC6ejd1nucx77w==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr55214510wri.45.1641501515986; 
 Thu, 06 Jan 2022 12:38:35 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id bg12sm3613817wmb.5.2022.01.06.12.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 12:38:35 -0800 (PST)
Message-ID: <2f267f86-8749-8a23-e7eb-aee39e6641c9@mind.be>
Date: Thu, 6 Jan 2022 21:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106185923.0cb1bb9c@windsurf>
 <CADvTj4q5R0TweMiHhtk_7XM6XT3u5mQ3_TF+m_M_D34Or6r1iQ@mail.gmail.com>
 <de9d6912-6bbd-4412-47f7-094d1ea7fe0b@mind.be>
 <CADvTj4otRbTpruWEZF=FcYH20x72_wi98A2_WTDYzSKH0Q0mrA@mail.gmail.com>
 <20220106201925.GP614810@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220106201925.GP614810@scaer>
Subject: Re: [Buildroot] [PATCH v2 1/4] Makefile: only check
 _FINAL_DEPENDENCIES are selected
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/01/2022 21:19, Yann E. MORIN wrote:
[snip]
> we already have for a few packages in that situation, that are not
> user-selectable but are still target packages: glibc, mesa3d-headers,
> bluez5_utils-headers and a few others... Most interestingly, though, is
> that we already have a similar situation with linux extensions: they are
> packages that are present only to provide files that are copied into the
> kernel tree, like ev3dev-linux-drivers or fbtft.

  Yeah, true. I find that solution ugly but for those there really is no other way.

  But Yann is right, I'm putting a bit too much stress on dropping those 
additional packages and using EXTRA_DOWNLOADS instead. I won't mention it again.

  Regards,
  Arnout

> So, in your case, I believe that qt5webengine-chromium-catapult.mk is
> basically correct, but a simple Config.in is missing:
> 
>      # Not user-selectable, it is only needed to be copied
>      # into the chromium source tree.
>      config BR2_PACKAGE_QT5WEBENGINE_CHROMIUM_CATAPULT
>          bool
> 
> And then you should not have any issue anymore with patch-depednencies.
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
