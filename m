Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D78C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F8C414C6;
	Sat, 12 Feb 2022 13:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ns74NI0DKjT; Sat, 12 Feb 2022 13:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A5F4414CC;
	Sat, 12 Feb 2022 13:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13DC91BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0848E40272
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kop7R0MtJVOb for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:40:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3E6B40227
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:40:29 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y17so18440886edd.10
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9RvRpDPwIFxHK1Vv0bN/r3q7U0sgy0YdB/NKyh6ALd4=;
 b=SGffH71xSaLQZzAIORmvr24XDuG3trOdnRKyumYyS2/bp3dvSXuA09DwgYdaWvdQu5
 LmVSL+bSr/duVleos/Dzyb8byyEetuLgANHB4ZkgHv0TKNBkaVZqxynICSMwNkRYU5d5
 o3S6/IuA+lcaeh4mYuibqVyykh9XUv3mJeBBFCPclW36SFFWyhSYA8ue5aPRkMcVE12k
 ql+3MeOyEn1V5u8Is8SP32p65PI++DO6Wf6c4t8eeN4qOxmUuAlh05gl7KAqhivlwbXu
 XtTZ38KTuXsl8Q7OwYrcwp7gfxXd4QWncCSvucBEmNabmiw32MtvSxj05Pr7gmYqazPW
 YjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9RvRpDPwIFxHK1Vv0bN/r3q7U0sgy0YdB/NKyh6ALd4=;
 b=iZDUPDYsQI5QNWEnjwE5FyiNOy72KzIhrbjyd0PdhDtbENDOe03ckXcby13p2aeFMg
 G1ZEmciOXHejcCNy+rFPM4v7RAMtKD8BdqYBNqXu3Qymqx2gLdoQ8B1BjY3pTGTKo7lP
 Gt3Ks1J0cVM+vCRkWQh/mX3cOlgnpXMqoVAL514d+w540U+r2NGAOrrz5d8ccuXxjK+V
 VuDyG2r8cNH731nZLxsH0hoMHhoTLjUdYW+1b3SFrkJgsp3C69Ji3jFpV7XUpVlIKpO6
 8EHhD7pxns1r5R0nlB12ygPi5VlHDMDN7TcgyG5VIo/31k2pVkB5b7p/6SC1Ty1Bnq9r
 B8EQ==
X-Gm-Message-State: AOAM5337i5QjD4b53xRQ2O0mzIAJUKr0eIWzYqGo3m+OONeK1ItB/RYy
 0+8SdUTwYYlV2bN26r8Vj9ATVXBqOyiuBw==
X-Google-Smtp-Source: ABdhPJx0TV3iCxoXfZFN7GIOGb4kKIyZZdzL2H+M0oowO9HbxmnsbAbuCsCiwlbk4ax1oTzlUuJq+g==
X-Received: by 2002:a05:6402:424f:: with SMTP id
 g15mr6778840edb.158.1644673227824; 
 Sat, 12 Feb 2022 05:40:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s18sm2730431ejm.17.2022.02.12.05.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:40:27 -0800 (PST)
Message-ID: <e768b057-28bf-d866-c0ec-4cc04abb54a0@mind.be>
Date: Sat, 12 Feb 2022 14:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20220131153022.351662-1-heiko.thiery@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131153022.351662-1-heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH v5] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 16:30, Heiko Thiery wrote:
> The BL i.MX8M Mini is a baseboard that includes the SoM SL i.MX8M Mini.
> 
> https://www.kontron.com/produkte/baseboard-bl-i.mx8m-mini/p158549
> 
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
