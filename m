Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C14C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 16:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 873D341498;
	Tue, 29 Aug 2023 16:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 873D341498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YnHQ3AWX_Lh3; Tue, 29 Aug 2023 16:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C575041494;
	Tue, 29 Aug 2023 16:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C575041494
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A51F1BF28D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11BB141830
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BB141830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYiGO-AXmDDm for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 16:46:59 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C50EC41809
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 16:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C50EC41809
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7926a450a0aso149436139f.3
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 09:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693327617; x=1693932417;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrzlWwM5EORZvP8Ym5vkonHGhOKPySEWJCeoD+ee5CM=;
 b=YNIPLYKogRjLDBkYWmGPk94tt8j375owMEx4moLh9MWQ+LzMNskyO9jBL5v3QmAtYj
 w/Kp5IcLovl1uKaSnD7COgEzWVZSk3oySWg8hGUr6wbPr+4+V5J65i9OfwdGG+dCKOTa
 WJG3TOUGPVPRn6ASIwTWKbPREcpElE14LxXX0ubyPKdxHKaimusKqovCRcAVgFYZeAFX
 CglKgjn+InmxDb7HEz4qNs7Zf5tCDPlU4Guwg/0ES/RmpsHnBr2x9JPMt21Vu9MvyHgM
 zWSWk+3d2OFIslQNbChMPIUBqTt9Ly3JF48266QB6DEy03ksiWjc4h242ZQxnj2/8Xu4
 Sseg==
X-Gm-Message-State: AOJu0YzsU8IgUMDd/r7UiIb9P5si/m03FHezJMW4A15/FivuBgzYGTqZ
 3O64RC9vrsDVsIyK7qQBJY5ohd9SV37FKsKzYhAaWA==
X-Google-Smtp-Source: AGHT+IH66x28k5ThQCpU1+MbZNiIh8n1Juwv0nZUIMNB+LY/zjMMLxpLFBKhaOkVEgWbiZxm6zGf5A==
X-Received: by 2002:a6b:fd07:0:b0:792:881d:c6ab with SMTP id
 c7-20020a6bfd07000000b00792881dc6abmr12094646ioi.18.1693327617407; 
 Tue, 29 Aug 2023 09:46:57 -0700 (PDT)
Received: from [10.194.0.4] (62.192.160.108.in-addr.arpa. [108.160.192.62])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a056602219300b0077e35ffac2fsm3342076iob.32.2023.08.29.09.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 09:46:56 -0700 (PDT)
Message-ID: <df72c469-d914-2f2e-92fa-b4e65793c783@instrumental.com>
Date: Tue, 29 Aug 2023 11:46:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <ad574a2a-a776-d7e5-8dcb-f3693d222558@carnegierobotics.com>
 <64c2a692-7d66-d6ff-522e-a66fb8752eb9@carnegierobotics.com>
From: Kristopher Adler <kris@instrumental.com>
In-Reply-To: <64c2a692-7d66-d6ff-522e-a66fb8752eb9@carnegierobotics.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=instrumental-com.20221208.gappssmtp.com; s=20221208; t=1693327617;
 x=1693932417; 
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NrzlWwM5EORZvP8Ym5vkonHGhOKPySEWJCeoD+ee5CM=;
 b=pQB5VlIE+tlsRGVCxns3bpdha7BPyv0nRgFwPS0en9eQPrP+Bt83Om9c93/8uh4GmM
 51p68i9VJymuXwpWHo4ggvjrLwve9CKOgQ0UCT7XndQ45Z54S/W5IPCZla0eJCIxvp3D
 3zfSOGtGobfGdeYxRuyHVTAcoyjBNdzkRu1ptNg7ZJDrh+wiYe6IH6at0jgxQfEyj0xW
 Zy5J30ahjiiigobYe+WltRjlbPOtl6S9sLpuF3SDNR6Lrg10lirEGfd+KjfkHnyWiDUj
 S9IK8K+sjGFBvW5BPw/RyjNv4oPU5BmIfkPQ6z5IoGUUEmtNeoM/7xoiCl0AyvLn61IQ
 gX3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=instrumental-com.20221208.gappssmtp.com
 header.i=@instrumental-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=pQB5VlIE
Subject: Re: [Buildroot] Github download helper possibly not working
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
Cc: Woody Douglass <wdouglass@carnegierobotics.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Woodrow,

I experienced the same issue yesterday. There's a community discussion 
on GitHub about this that explains what went wrong:

https://github.com/orgs/community/discussions/65227#discussioncomment-6848413

Requests using auto TLS protocol selection (wget's default behavior) 
were inadvertently blocked by GitHub servers, because some changes the 
GitHub team made to block a scraper were overly broad.

I was able to workaround the issue temporarily by adding 
"secure-protocol=TLSv1_2" to a ~/.wgetrc file. Fortunately, the GitHub 
team resolved the issue, so the workaround is no longer necessary.

Best wishes,
Kris Adler

On 8/28/23 15:45, Woody Douglass via buildroot wrote:
> To follow up,
> 
> It seems if I uninstall wget, and install busybox, and use busybox's
> version of wget, downloads are successful. I'm not sure what, in the
> confluence of wget and github.com, causes this issue, but I have a
> workaround for now. I'm not sure if/how the buildroot project should
> respond to this issue, but that's the information I have.
> 
> Thanks again,
> Woodrow Douglass
> 
> On 8/28/23 16:02, Woodrow Douglass wrote:
>> Hello all,
>>
>> I've noticed that packages that use the `github` download helper are
>> falling over to buildroot mirrors. I've tried with packages
>> `yaml-cpp`, `zlog`, `swupdate`, and `pcm-tools` -- all are redirected
>> before eventually getting a 403 from codeload.github.com and falling
>> back to sources.buildroot.net. Is anyone else seeing this behavior?
>> I'm trying to find a workaround now, but I'd appreciate any help!
>>
>> Thank you very much,
>>
>> Woodrow Douglass
>>
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
