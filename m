Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A1A60F9F;
	Tue, 10 May 2022 19:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvAOYLWts41V; Tue, 10 May 2022 19:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475E260F57;
	Tue, 10 May 2022 19:07:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BAC21BF307
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A3E2402AA
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcfraP57m3DY for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:07:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39B3C4029F
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:07:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id z2so33262745ejj.3
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e0Rvy2niGjL2Jsyp1LeU16e9Ol/MM2mXg0M8qHfA3/U=;
 b=I0D1r3TVKG0LB4DlWmlQar6Xbr1T/yHNGZQ4ZZRikfMYvWo0x9ht1KCB52gxPjDCO7
 t9PDgyciP7ZAYYI2HM/ZGMtb6GvpO9cCi9DvybjqiXgatvv1ipuDN4dC0B6UDxQrlYyo
 /8FClemgEXNCdTkeyL0z1qAcvP3eVtQpSsm9l2L/ZCavS4JcC+R0GSfjv2SJzZD+BDWl
 SESGKojrMbCP1Th1DLv34khueiSw1e5E1jAcfzdkOvpDdvEYZNvO++X6sa0nEwgZI5bt
 F004A92AUTSKWaZN+szqWGLwLmJ2BtCgWrebfIYUBOflJV5xAV//cyBbC06ZYOtsfXRV
 7v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e0Rvy2niGjL2Jsyp1LeU16e9Ol/MM2mXg0M8qHfA3/U=;
 b=n4uNa1iQeTomXkIe7IM+tMqncZtfHmI48ojqeU4cWLSF3eWKCr6iQzIoO+CFF3kZIT
 Q5uLlK+ynHqeVF8T7O340ylSBaT0VGCrUkrz6ojUrIqw8kGcnxxPQ/Rc7jFJKmlzrN6Z
 Ys71oBAGTa41pqUdWS68Uu2nUGPz3bk0ClVikemgq8Qh/U6AZQLYPiKoxF83F2PXf1C0
 2yq7ouquplZmrmQgeAet6+U4AWPyYAx9yg8UCu14EYTDK8MlYhHZbbEj1+PwXtnbFnc5
 +9lZkP/5DdkzPiWG0rS/2w3QrQsajHUgtcJiMIlKZ+a0u3jF6tNM6Nrxza4wOrBfc2xy
 iYcw==
X-Gm-Message-State: AOAM533fISDRNOSXtKBiQVxqYKN54SzWTNjDj95w88oJ6SCI7uo2nZok
 Sv5ljCOo1yfArmXcxlwJVmVghA==
X-Google-Smtp-Source: ABdhPJyBWBJiTGsjafsTODOk4YMC5MYj7q9VDP19QYFvOuTZZrEM+f/Jzo+lAcknduuCzPN4t8P2eg==
X-Received: by 2002:a17:906:6a29:b0:6f4:3389:9094 with SMTP id
 qw41-20020a1709066a2900b006f433899094mr21344043ejc.323.1652209652363; 
 Tue, 10 May 2022 12:07:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170906398800b006f3ef214e14sm58712eje.122.2022.05.10.12.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 12:07:31 -0700 (PDT)
Message-ID: <045e8c8e-7cba-5a78-4b4c-d0a5808d8f46@mind.be>
Date: Tue, 10 May 2022 21:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Yegor Yefremov <yegorslists@googlemail.com>,
 buildroot <buildroot@buildroot.org>
References: <CAGm1_kvHtN6OeeidGFfbnC2e-xvvg6MjnQFmkGPPCqoAwMb+YQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAGm1_kvHtN6OeeidGFfbnC2e-xvvg6MjnQFmkGPPCqoAwMb+YQ@mail.gmail.com>
Subject: Re: [Buildroot] Adding pylibfdt
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2022 11:56, Yegor Yefremov via buildroot wrote:
> Hi all,
> 
> What is the preferred way to add a host-pylibfdt package? Changing the
> dtc package to build and install Python bindings or to add the
> pylibfdt package [1] directly?

  Since the pylibfdt can be fetched from pypi, I think that's the easiest.

  Regards,
  Arnout

> 
> [1] https://github.com/devicetree-org/pylibfdt
> 
> Regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
