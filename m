Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2BAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F5CA4014B;
	Thu, 16 Dec 2021 18:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwAUugO_Sett; Thu, 16 Dec 2021 18:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81F3D4017B;
	Thu, 16 Dec 2021 18:33:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC63E1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B98464017B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8Da-FbvVDO1 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76DB54014B
 for <buildroot@uclibc.org>; Thu, 16 Dec 2021 18:33:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g14so89204966edb.8
 for <buildroot@uclibc.org>; Thu, 16 Dec 2021 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=RNue1Qp0dTRT+8mLgqo0b2z2ETJBTlAzt+BuVnHxpgQ=;
 b=ia1g1jjl3HJOUK6AV8iI8F2T7DH3FPbcndeMlSt5UWItu2UBPGJXmXZ6mahTPJemTl
 M/L76o6kV1fyMRnJJla90s7Q3HmhCE+Ny2ziQsCHm54S9T2AwpuQzJLDAlRS3BWNvVUI
 V6PyaZZOff5hyxaCqwMemi7JZd37yeDkdJjs1oSTtSWKEmOSpfkEATkr1cCbCMtiei7K
 s+y6e4m3py13HsciVliuqifR5op6mUleavTnti5joHKUUgrIP7FuI/uNmv1FBL4HmpR/
 DNIWx2WszHTFaZAHGkYdsD/8IfkyTfOT7Age6Wbgzk+t+leZ7+cKlZq66zOtyKttZCTx
 OaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RNue1Qp0dTRT+8mLgqo0b2z2ETJBTlAzt+BuVnHxpgQ=;
 b=wH0dN+QtK3BVf1We/NZGRKEBtkyr5/+b8rXmJK++6QWutTY4a5aSRxHbZRL6AL+tIi
 1gN8TFjk1B1Fr1MlrJlRKXXIrESAyDAnMg/cZxZGgqBPsINKcMaApMq1RGFbNhl+z7W2
 lFczx9D63GqxJhx4rjgJECywflYh6Ve1H+jxQIltsSQoBUku4HaUTxbiyDt4+Ik8Drth
 f7FYtpWMw2O0EVZhFQg+S/oExY81w14pbp+1VnhfFnsnZttrsOfgLo8jm9d0VZxQ+qkh
 szkEPTRKker8w10Qao6GLQ35zezGqPC6ftvQsxLDOf0JQ3IWFVIUCZ8vOUKAMphA8UJl
 NROQ==
X-Gm-Message-State: AOAM533uTl2odXj8LJyyhaGWM512aOf31JFFEk0bG8ikiXX5RbzO6m5S
 JTgcxmIc0sJxN/CEErdc5RjACw==
X-Google-Smtp-Source: ABdhPJzGHZy98EaUca22N2hcIb8+A1xekzHfWtqI2qeqg9VNg5izG6lJ7ZxXhzjy9Ba/uG1UeXgJTg==
X-Received: by 2002:a05:6402:8:: with SMTP id d8mr21912318edu.61.1639679601305; 
 Thu, 16 Dec 2021 10:33:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j11sm2664292edv.0.2021.12.16.10.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:33:20 -0800 (PST)
Message-ID: <1084ea3f-802f-d24b-f613-7bc74c7a1800@mind.be>
Date: Thu, 16 Dec 2021 19:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org,
 Peter Seiderer <ps.report@gmx.net>, Michael Taubert <info@arachnodroid.de>
References: <bug-14451-163@https.bugs.busybox.net/>
 <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
 <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
 <aafcded5-c0f4-4745-a226-da57d0e7a805__41403.4441857197$1639675757$gmane$org@mind.be>
 <pan$6da85$57c98f32$8301c983$a5945ee7@ID-313208.user.individual.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <pan$6da85$57c98f32$8301c983$a5945ee7@ID-313208.user.individual.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: don't disable DRI3 for
 some Gallium drivers
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



On 16/12/2021 19:12, Bernd Kuhls wrote:
> Am Thu, 16 Dec 2021 18:28:56 +0100 schrieb Arnout Vandecappelle:
> 
>>    Bernd, can you comment?
> 
> Hi Arnout,
> 
> no, because I do not use buildroot on rbpi hardware.
> 
> But the topic was already discussed this summer, with no solution afaics:
> https://patchwork.ozlabs.org/project/buildroot/list/?
> series=248555&submitter=&state=*&q=&archive=&delegate=

  Good find, thanks!

  Michael, can you try that patch [1] and see if it works for you?

  Peter, I think I'm just going to apply []] except that I'll make 
BR2_PACKAGE_MESA3D_DRI3 a blind option (i.e. not user visible, only selected 
automatically by the drivers, much like BR2_PACKAGE_MESA3D_DRI).

  My other major comment about that patch was that I suspected that it would 
need some 'select' statements, but I guess the autobuilders will inform us of 
that, so we can go ahead and merge it.

  Does that sound OK to you?

  Regards,
  Arnout


[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20210612223011.26118-1-ps.report@gmx.net/


> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
