Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D37C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AEA741622;
	Sat, 14 May 2022 09:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDaH8GgiFQL2; Sat, 14 May 2022 09:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58369403C5;
	Sat, 14 May 2022 09:48:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C558A1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C275460B42
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHTWNgKz2JPD for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:48:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 009BB60AE5
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:48:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id be20so12511293edb.12
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Ym1oYRjUFn8kl7it6ynOdO00BoQ5/bBEySRSHo1YQfc=;
 b=DmkJP9Lcmz66NmGnEMNF9Stov2qAT5kKtE+IhkdOfPNUD1oeofxkboi3OcLq8ltWqx
 5cLR50xaDpZsyCQd0ghQbBARjtL/mwonIKgqPUxQ2jSmWx8rxIoRceIqKTYAMXhmnlQP
 2KEURKIp7OV+Sf0YGCIDVYNke59oLzLtxadUqAYpHymZX7KF0Plj0tRJq5QHP/NH2zyo
 SdaGI1P5Zr3XGF89cfvQd6hLLZyJwoI8a6Hs5AEPTrB+WlPbO0Iu/nzGEBBwWYHJ4ron
 s/f/0sTUdwfiFgFU55PinsYmcOJEnZtwBFHEBSTrFP7wx06IR3syz2Cda8KY/M6cLtF8
 yxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ym1oYRjUFn8kl7it6ynOdO00BoQ5/bBEySRSHo1YQfc=;
 b=PxdQo8MBCTTYVuGh9PL47C2RHEKiRq1Hk1z2t4S8630QU6W8HMOLDhhwqpfb68W1wM
 Zw7Q36VJkR3hJAOrvwJxhK06wlcUqAS/Sl4lT7eHpvluGx5usAAPlo1oCLuveiaeEOI2
 36geb1P6P0izmgCTDDvIUhVgiNbP83hXWsgBla41DYwLtfM3CWNvOU5j40TbmL0AlJFE
 hzxRBFMQRHsnVryS177xjeTev7RcoF8vlPmHSga90Ydtm34NBXnuQmClVLxObnp9gHDV
 +CtAWBOiiubadvBb/zweWQXg2Rbp43nOh/5A8ZAI783K6x0pCAMKzPsLFL1049Th6/4e
 yEUw==
X-Gm-Message-State: AOAM530d37PTIWnbFXxQ5eqmc4mxaOCG2wa5nbVbW/CcToUc63fZ/Vea
 OAp/ypjFDorBhpoYSD6tr05gThtJm3BcTg==
X-Google-Smtp-Source: ABdhPJyDt2XCaPPV6OuGBBrrDV+LhYH7DjMmzkMBKjD6LHSq7eUUWo6EcoTIuoD0bfrrwHecaV9wTQ==
X-Received: by 2002:a05:6402:f1d:b0:42a:a08a:c7d9 with SMTP id
 i29-20020a0564020f1d00b0042aa08ac7d9mr76781eda.159.1652521733238; 
 Sat, 14 May 2022 02:48:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qz24-20020a170907681800b006f3ef214e68sm1494305ejc.206.2022.05.14.02.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:48:52 -0700 (PDT)
Message-ID: <8fa10c1b-5342-db2d-584e-cbe43f8b3de8@mind.be>
Date: Sat, 14 May 2022 11:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220512205732.2739449-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512205732.2739449-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for nut
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



On 12/05/2022 22:57, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 53efd608f5..ea68ba10d4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -406,6 +406,7 @@ F:	package/libyuv/
>   F:	package/mesa3d/
>   F:	package/minidlna/
>   F:	package/mjpg-streamer/
> +F:	package/nut/
>   F:	package/perl-crypt-openssl-guess/
>   F:	package/perl-crypt-openssl-random/
>   F:	package/perl-crypt-openssl-rsa/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
