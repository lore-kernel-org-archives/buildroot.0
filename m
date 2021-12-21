Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A67AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 21:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C499541592;
	Tue, 21 Dec 2021 21:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ab7dedEsE8s3; Tue, 21 Dec 2021 21:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2404B4156D;
	Tue, 21 Dec 2021 21:46:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F6BE1BF40B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C03060F6F
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxXizkdWkj8d for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 21:46:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 042BE60F66
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 21:46:34 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j21so473576edt.9
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 13:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2n25o3S80xi5y8MzAMkJPSW+o1uBzGYBRA7BWhIo+jY=;
 b=SHLKAU4S5r9HLdXZNbvynjXSn1qafhJK+eGRyc9LdQ9tgikU2G2V2ugvIRR/BLhO3P
 xYQtxOGwXCOXLyJxV2i+X8BuRbz3vvRg0VmgjqnXbNK+si9gt5P+Rl9v+job2N8xix5R
 y3wwA+FrYFdVV0rMXxA6bbmV81q5ZMaH6i+kij9DHWCRw4Kms+3KmJak2ULCO+KqJKfL
 G1eBR5+aSSvKj0nddHCKshDihqPNaUuTDtGpSVBVMHvTdtB8cna0NN1PYYltixJFs/2n
 PzwNZNVWyjfyrLoaGh6/fW30D44yzpHuvdUNaVheO0XKhACEJEMaZeSe6Sli4p4BbMEn
 y7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2n25o3S80xi5y8MzAMkJPSW+o1uBzGYBRA7BWhIo+jY=;
 b=luXt176TZoCCgKCzVNIgw1hLjoTcNc/cLh63C8+rZx4Zwj8cHC2QAztsI3NA0HEzpF
 bCciyme6R7Ul7LhqwZY3AeGh1NSnp4hSMrLMwuCCfQAzyl/vSoynZ4+kOb9MCAIbO9QM
 3g05oICWeLylY/yVe0CQiQL1QwCm9YSmLFdm+fr8ocEbo441hv7umfCAPSPY2+oUOc5A
 LDYZHh4KzZwS1F5cJ/YaFiSpw5EuSxwbEAd1NwEG2YNgFlUIowZD8qE7hIq18vom6ind
 B/ZbELpm08BEdQhAqMahIbwsX1RsYEmbFJBL5lJcR86nv3cWklBVRJgfCsXA7GdDDQ4z
 F7FA==
X-Gm-Message-State: AOAM530IfXgEa05pfP39CQFR880hdL90Eqfodf/8LbhQ7khDtLMdzdu6
 oQ8dojyt0K3jKV8Hdl/+C6drwA==
X-Google-Smtp-Source: ABdhPJxrxlGauHmYn3a5voDvcuif6JaOoHpTMZDhibiIk3q7tcQZLupA9Q8Ej+7l/BChiov3JzGY7w==
X-Received: by 2002:a17:906:eb83:: with SMTP id
 mh3mr167547ejb.451.1640123193227; 
 Tue, 21 Dec 2021 13:46:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm28015ejv.178.2021.12.21.13.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 13:46:32 -0800 (PST)
Message-ID: <ac8abed8-83b6-56b5-0d3f-ad284a2e21b1@mind.be>
Date: Tue, 21 Dec 2021 22:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211219110405.2233620-1-yann.morin.1998@free.fr>
 <e3d18846-7065-2665-984f-03685b0b3ab0@mind.be> <20211220220807.GJ2603@scaer>
 <62ca9c6d-42c5-d5b4-c423-6d050fdf6ae1@mind.be> <20211221211914.GK2603@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211221211914.GK2603@scaer>
Subject: Re: [Buildroot] [PATCH] package/libopenaptx: drop package
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
Cc: Yunhao Tian <t123yh.xyz@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/12/2021 22:19, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-12-20 23:30 +0100, Arnout Vandecappelle spake thusly:
>> On 20/12/2021 23:08, Yann E. MORIN wrote:
> [--SNIP--]
>>> However, the LGPLv2.1+ does not allow one to *strip* the code of its
>>> license and *replace* it with another license, even if the LGPLV2.1+ can
>>> be "upgraded" to that other license.
>>
>>   Yes it does. As I wrote, section 3:
> [--SNIP--]
>> I.e. anyone (not the copyright holders, but anyone) can apply GPL-2.0+ to
>> the code instead of LGPL-2.1+ and continue distributing it under GPL-2.0+.
>> Note the irreversible as well.
> 
> Indeed. This is something that completely eluded me. Thanks for poking
> it at my nose! :-)
> 
> [--SNIP--]
>>   Bottom line: *we're* definitely doing nothing wrong by keeping the package,
>> and I don't think we're creating problems for our users either. We're
>> creating more problems by removing the package, IMHO.
> 
> OK-ish.
> 
> Though, if we were to roll back to 0.2.0, or switch to the 0.2.0-forked
> libfreeaptx, we would not have any issue.

  Absolutely, either of those options would suit me fine. But I think deleting 
the package is going too far.

  Regards,
  Arnout

> 
> Thanks for bearing with me.
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
