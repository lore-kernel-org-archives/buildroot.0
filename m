Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE85C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 19:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F7860C18;
	Fri, 13 May 2022 19:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id roG16uvhB2Dx; Fri, 13 May 2022 19:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA5860C30;
	Fri, 13 May 2022 19:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDCF01BF5B4
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 19:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C734060C30
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 19:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXlskW3LX8pa for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 19:51:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DE8460BE6
 for <buildroot@buildroot.org>; Fri, 13 May 2022 19:51:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id be20so11080480edb.12
 for <buildroot@buildroot.org>; Fri, 13 May 2022 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OHta98vYfG6ivm/cihkTqUI6dCK22yRRwy8+7BB4lTQ=;
 b=iG68eFPmtWSjb7ywQ/O/xJt35vYER+lo+KOKDjA0CVKCA2t1BUtgDWWnN+KD/4yISy
 e76wTrU5wi32atMsmu9WD4upYHe7a4PeQCPHWGuOp+fNP0xEo1MnUVRcStlQqlMxCCwb
 S3AhBnujE41DYHKC1oIOK83CXPuV2iKLMvOdc70KlGPbNwPY7Wanmpn2pIXgKZACqzd3
 UhjTUgHmlkd6EtYRz3QyG8f8KguJwY68fohdv/T690kTrjrZo0aEhBBzyBkwsNuwInSG
 qfoCFLaoCgVPSfY2UHNTugT52AGN56jW2wn5FyB1OUrEI6c2txhOfgLOaVhcftoHdWIW
 08hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OHta98vYfG6ivm/cihkTqUI6dCK22yRRwy8+7BB4lTQ=;
 b=Oq9wEnhjzUxV+uB7lU3f5XwbPu1fBrwLtBdyO7ie4a20wnMiGv51iC7+Kcvb4/todo
 C14N2vhwoehjzjI5j7T4KkYiLl6Po2CW6cjsfLHeYR72/MpJXD8Is+CdpBBNA/98Jx91
 ifjkYfOcmZmiBPlW16nBNO1lyq2mbsi/ANd/KAWzNswtrvO7qr6yhax8jBQT4lcgESCs
 zquO702Ck1d+RrDtrSORsfbEM/aIRP/lil3DAVbcbAntpHs/0up1JKu7Q2nX5TuTlpqj
 tThESTG0IFG6t14VWHhK3JjixGLU74zFcD1qtiQHqBs9RY9KiPI3DiVpSIIAndw/y0qV
 PsCw==
X-Gm-Message-State: AOAM531+0+V5lvdQmwlw/U1Sj8GdKpBOx4wUar3yvBld+z8d/4CUdCAQ
 pGaBadge4xlV7RkyDv2xELoe8g==
X-Google-Smtp-Source: ABdhPJydCf2E9HHETkYfdYmBUqKb6x04lzzh/j9bdm73n5jhH4QJepQNIu75QHhBM665AShClMxF4Q==
X-Received: by 2002:a05:6402:2932:b0:425:d7b3:e0d1 with SMTP id
 ee50-20020a056402293200b00425d7b3e0d1mr290665edb.141.1652471490678; 
 Fri, 13 May 2022 12:51:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a17090629cb00b006f3ef214e7bsm1041972eje.225.2022.05.13.12.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 12:51:30 -0700 (PDT)
Message-ID: <b4bd78a6-f9d4-dba4-22f8-6fb276cdc054@mind.be>
Date: Fri, 13 May 2022 21:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
 <20220512185355.873825-17-bernd.kuhls@t-online.de>
 <20220512194821.GB1597494@scaer> <87pmkh94s7.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87pmkh94s7.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 17/25] package/x11r7/xapp_xsm: bump version
 to 1.0.5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/05/2022 11:10, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>   > Bernd, All,
>   > +Arnout +Peter +Luca
> 
>   > On 2022-05-12 20:53 +0200, Bernd Kuhls spake thusly:
>   >> Release notes:
>   >> https://lists.x.org/archives/xorg-announce/2022-April/003152.html
>   >>
>   >> Updated license hash due to upstream commit:
>   >> https://gitlab.freedesktop.org/xorg/app/xsm/-/commit/e552f2d4980d41d7a219dbe0c5dbaf33c4d752f3
> 
>   > I was a bit surprised that the new licensing terms are not really those
>   > of the MIT license, so I checked, and that's what SPDX knows as the MIT
>   > license:
>   >     https://spdx.org/licenses/MIT.html
> 
>   > However, the license for the xsm is not exactly those terms, but is
>   > known by SPDX as MIT-open-group (MIT Open Group variant):
>   >     https://spdx.org/licenses/MIT-open-group.html
> 
>   > So I had a quick look at a few other xapps, and they all use that same
>   > license.

  I also had a look at the ones that for whatever reason are present on my 
laptop, and e.g. xeyes is MIT. And in xlibs it's a mixed bag, e.g. libICE and 
libXau are MIT-open-group but all others I checked are MIT.

  The good news is that licensecheck recognizes the difference (though it calls 
MIT X11). So we have a somewhat automated way of discovering the correct license.

>   > Wikipedia still lists it as MIT:
>   >     https://en.wikipedia.org/wiki/X.Org_Server
> 
>   > And the Xorg website also insists it is MIT:
>   >     https://www.x.org/wiki/
> 
>   > So, I am not sure. I would tend to think we should switch listing them
>   > as MIT-open-group.
> 
>   > Thoughts?
> 
> It is a bit pedantic as there's no real functional difference, but yeah
> - Would be more correct.

  I just checked and IMHO IANAL opinion there are functional differences. E.g. 
MIT-open-group doesn't mention permission to sublicense.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
