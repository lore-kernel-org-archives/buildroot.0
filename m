Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50FFC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 14:56:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366A0608FE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 14:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 366A0608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB78E40209;
	Sat, 24 Jul 2021 14:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDkNtnX3RV2W; Sat, 24 Jul 2021 14:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22F79400C7;
	Sat, 24 Jul 2021 14:56:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F26D1BF32E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 14:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F01E4400C7
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 14:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jq_n3N5gYvkg for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 14:56:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3500C40001
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:56:32 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id nd39so8198866ejc.5
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fs3G0F6Yi+zaxtjHRQawchdrZ5CDEA4aqgw1nsazM9k=;
 b=Jci0ZDxP4Oh64ufuuHXh+mkV6EHZ4J1AmK0TMNPe24H2o7oB00qptmAGSZL7/Z5r1h
 YFf0rKiuUM8Va5Rtw0Xra/2k8gyq3TsGa6yzEgqS+a7D0j4xSqtm4PHVyMIxaAb1ImXr
 fPrN27PbHp+9sQIykGNXdW9OG0SpskNppwzSam4pf9vC+TCc3RQsV65yxqr5t4zsE8JV
 hoZjLZrbnzUKa7+dwVOcx6xSFKKk/bRhCAsC05WbHRj9DQEDEd02sodQRTmYeteOcBOM
 w0ZHigVg5mf/7gImLc6dwywfo8eIpD42FLGP5OgypkpZ3bMBFuBt8fqPFrfxo3VH5z3e
 dSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Fs3G0F6Yi+zaxtjHRQawchdrZ5CDEA4aqgw1nsazM9k=;
 b=g5kDVXoD60ydCylKmhZx2OFtvt+YO9XJh7cvjdRBJ0C5fEMvf0JzvRJxx1EzhawhRa
 jeJ30IGFRHYaPEgTU1fBTF7/k46L6lSL6aL4gTDzLY3SP6/UJJhRPt11vaEEJgZVwLpQ
 TlNt+1hRBlAGqQhNK2fZxN/w2tschnp4fl82Tfxv0qJfGLBpbm4ooAP1xEKMtTg5dVJW
 lL5CXJOxe7y5ZmDVqThdIVeL7XE9JTSlXrdv9roP1hxkLSoAygK+vyjCeFNsyZdlhiSq
 N/4FctSQgODA7K9fbTI6o5dj+ncsi5FhADux9IL8YYbMWFmkdi0IWqOYFVbKICJQBZhR
 Uycg==
X-Gm-Message-State: AOAM530pltAfVaPPzIz+6a20v5tUIPZjHF02kxXrYBBSV2yWsfx4b7K/
 ugtt5sXr6OWsdlWJQI/nLohvog==
X-Google-Smtp-Source: ABdhPJwiEnuQKxk4XNiRIgY8P9jXhR8OpUoFLfq1wOVFVrN1CkXAXGaHoW7tTdgIJQIxBDpyvIcbOQ==
X-Received: by 2002:a17:906:580c:: with SMTP id
 m12mr7269727ejq.32.1627138590454; 
 Sat, 24 Jul 2021 07:56:30 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s18sm12667271ejh.12.2021.07.24.07.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 07:56:30 -0700 (PDT)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-5-damien.lemoal@wdc.com>
 <6a1b7aba-9fe8-d0ab-ffda-b24167b0cfce@mind.be>
 <20210724003514.4da0f292@windsurf>
 <DM6PR04MB70817A36892EBB84C44ED189E7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <7f382c2b-4fc7-6aed-0803-37665b874ba3@mind.be>
Date: Sat, 24 Jul 2021 16:56:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR04MB70817A36892EBB84C44ED189E7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/07/2021 00:43, Damien Le Moal wrote:
> On 2021/07/24 7:35, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sat, 24 Jul 2021 00:25:27 +0200
>> Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>>> +++ b/board/canaan/k210-common/busybox-tiny-initramfs.config  
>>>
>>>  Wouldn't it be better to start from busybox-minimal.config and just add a
>>> fragment that removes the unnecessary options?
>>
>> Also, we already have a package/busybox/busybox-minimal.config. I'm not
>> sure we want to add zillions of "minimal" Busybox configurations.
> 
> OK. In this case, this is all about saving memory and getting that busybox
> process as small as possible, given the super low amount of free memory
> available after boot.

 Yes indeed - in this case it's even more about RAM than about flash space, right?

 So that's why I proposed to make a config fragment that disables some things
from busybox-minimal.config. Note that you can use utils/diffconfig to generate
that fragment.

 Note to Thomas: the other configs do use busybox-minimal.config, so Damien was
aware of its existence.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
