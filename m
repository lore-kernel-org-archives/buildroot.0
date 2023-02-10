Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C483FC636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 13:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D50E8211D;
	Fri, 10 Feb 2023 13:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D50E8211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_Z_bc-M-Nw2; Fri, 10 Feb 2023 13:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 901568212A;
	Fri, 10 Feb 2023 13:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 901568212A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EB9D1BF303
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 13:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4303D4192C
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 13:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4303D4192C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8fRAsQd-Gwj for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 13:12:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C484192B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C484192B
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 13:12:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso6278241wms.0
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 05:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=39V+G+KNQS9FdXJkfeH4lM3TKpEM5glYr9e/0QEkjYY=;
 b=zvGqxvb3Pdz1Ym1ozbnffbeiNQKVYwD0Qx4B9VPrESgHWYHsaJtVQY0z8kZ2Yj8uJl
 1I/tU3/1TeMvMg0upXVeSARgzI28CRog9wKmMDNnWnls6Pzkp+ld7lmuMJj0dCYxKLU8
 88pEpjbtelJ085BwbEAzbFlV5IAWAeRwKA0+YzCw77tEFmG2Yx6Bh1gIEq9FMh3kwD+B
 6gZtVRFNFbTm998DlJQWa9nbvWGXQ0SWTuCcAAd6ohnaU1snV4hdogI+gB1/WjeqNg+f
 3YEwGPATq05Mj0ujH4KUenWMJldy1iUofkJyN8eXm8Jw0ayTmv5iV8hDkjdq84AUzKwC
 DztA==
X-Gm-Message-State: AO0yUKUqcizzVekBvfPZs22VfmwvjH0YeW87o6tvrmdBmjxtiepVBl58
 A8ryqWtvzhF5hepdX/H+5FZyfQ==
X-Google-Smtp-Source: AK7set+dXrEmOIlyhkbDhTsso2vacR0m0p4V1yKz9Eph3mhsUTGZjn8GyMreOnjzmnqMtzGe2bjFgQ==
X-Received: by 2002:a05:600c:81b:b0:3c6:e63e:23e9 with SMTP id
 k27-20020a05600c081b00b003c6e63e23e9mr16254083wmp.24.1676034748990; 
 Fri, 10 Feb 2023 05:12:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05600c475300b003dc433355aasm5935075wmo.18.2023.02.10.05.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:12:28 -0800 (PST)
Message-ID: <ec7ec881-a6f6-12cc-4f3f-b9c1ff2d077c@mind.be>
Date: Fri, 10 Feb 2023 14:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
 <fce2f167-bd7a-8b93-41ec-c7c339ec070f@mind.be>
 <b98c7a16-ea21-c398-4045-0edbf46caa40@synopsys.com>
 <1750a14f-36a1-fe51-1452-3a72b84979c5@mind.be>
 <9a8b4ac5-6ffb-e8d8-3587-2768e004780e@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <9a8b4ac5-6ffb-e8d8-3587-2768e004780e@synopsys.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=39V+G+KNQS9FdXJkfeH4lM3TKpEM5glYr9e/0QEkjYY=;
 b=USkDu/KrUW4aquCfgJzJEXoLagqPOg8Y2ZRqhK6CJ97itdwOo2JASZ+kL9KfkXJU8R
 B5bafILnXaormADmyR3IAMMs7wppUymGXuNsB9SzqIlcq8SfCWPl7WdYd8oBMgW8Tt2s
 uW1khQazdWKK2O7twjKHnjVfGJZhrKJwURCZ0kRpcK2avG3CJMjyvOZ4ho0U8gMw1G5N
 4o+LSFYhGK0sVuUMzvitSYlzNNbAXZjCIavcYiAtjdw3sBk+eVlsS41Y9NRZayXhq0D6
 vBRIwzIAVriDP8Z5jbAwZqZ0mB/MTqGjK1V2z1TsZ9ObvuHnFXVzY5TmEMT4hZGrlWeI
 TgKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=USkDu/Kr
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/02/2023 10:17, Shahab Vahedi wrote:
> On 2/9/23 21:27, Arnout Vandecappelle wrote:
>>
>> On 09/02/2023 13:23, Shahab Vahedi wrote:
>>>
>>> On 2/8/23 17:36, Arnout Vandecappelle wrote:
>>>>
>>>> It's not clear to me why you did a revert of the cookie feature rather than
>>>> using those patches. I think the first two or three should be sufficient to
>>>> fix your issue?
>>>
>>> Ideally, the correct way would be applying that pending series. But since
>>> there were comments that some of the patches might need reworking [1], I did
>>
>>   I don't see anything in that thread about rework being needed, only some
>>   complaints about some mail gateway encrypting messages so they can't be
>>   read by some recipients...
> See this [1] and the response here [2]. Having read it again, apparently it is

  Ah, but I guessed that that patch was not relevant for the issue you are 
facing. I had the impression only the first two or three patches of the series 
are relevant.

> not such a big deal. Alexander, the author, mentioned that he will redo that
> part in v3 of the patch the way David suggested. So either, I can make that
> change when submitting to Buildroot, or take it as it is. Your call.
> 
> [1]
> https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#m42db58567febf12040f6ba0478e1a6148c284c55
> 
> [2]
> https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#m293896646128262621c83e8c15c4d977f92ad0d2
> 
>>> not feel confident to add them. Therefore, I tried to keep my solution minimal
>>> and solve it by eliminating the problem. I know, it is not appealing.
>>
>>   The problem with your patch is that it is very difficult to decide if it
>>   should be kept or not when bumping the version. Plus, some people (or other
>>   packages) may rely on the feature that you remove.
> 
> I can try to apply that patch series on top of bpftool-v7.1.0-br1.tar.gz in
> buildroot. If it can be done fairly easily, I will submit it on a different
> thread.

  Thanks!

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
