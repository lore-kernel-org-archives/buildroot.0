Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C84C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F201F41706;
	Wed,  5 Feb 2025 12:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84DRzVWuJYD7; Wed,  5 Feb 2025 12:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BF44176D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BF44176D;
	Wed,  5 Feb 2025 12:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A882CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D50C41781
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuCwDlAokU_1 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E582141706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E582141706
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E582141706
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:14:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.32]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKm0-1u3Db63giY-00IW8Y; Wed, 05
 Feb 2025 13:14:26 +0100
Message-ID: <51e532ed-9c27-4bbd-9ed2-58044082c4c1@gmx.de>
Date: Wed, 5 Feb 2025 13:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <20250205113531.4161633-1-fiona.klute@gmx.de>
 <20250205113531.4161633-2-fiona.klute@gmx.de> <Z6NTRZe6pNcyMvRn@yd-6wlzhs3>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <Z6NTRZe6pNcyMvRn@yd-6wlzhs3>
X-Provags-ID: V03:K1:mDmmMSqkz8yz8PgcPd9DSQ+z2sJotbGmZqHa0Fi5wZWcyozckAg
 zlVpMFRSbRhBD2cZVOkO1CBEGei3l+ADkhnzGWoxL5/cfQvVJNT9I8RpQ6AjWJ8qzhCT0H7
 sUxRadomP0P1TrFXL2xwwRBDIy9S/icV2Phq68nnpXJ4N8PXzGVDSr6A2WUkO08hQ0D2V4I
 jmXKQ+JRSSAeF3BboEVCQ==
UI-OutboundReport: notjunk:1;M01:P0:OxbQpxMkZRA=;vm6/YR3oKcRvm0VkL3TkqaPwx9K
 UO/HUJ6KjtCZnAfGCxm8wj0l7awqc/GChrPfoGqGcACAr4+mYC0MhEOD0TklyUkQB5DyZZdW5
 ubNIft1+zZ35C6FbOwlkqZvGGhGfCKtmz8TWfxOpaTASEnbsiwyG81byziEEGj/dLqy68714v
 fZpJxB5QETiqAZMqEOy64TQZKeMYsS++HWdTFd2Y0aklA5sYxVjetkm4vseCFx3m+w5rbp8R0
 mKrqgBHQuLflBTnc6YI3O4cjl05jteLcw0Rgy3iwZ810B3BOPgw+PmypFXjcXyZQTZ2rLQ0bK
 2bAhOtbXcTGSf9EthGOHJ6blpzopfjani2yNnx+G+gwf+sn14OSxng2hiw5pMc1bJln8TEAsv
 l3vUdtTqG0rRu2qDzD86QhISoABRiXgGUKFZoB2a1Cp2W0WHwT7efYjqxFfJzUPYABWxSllYL
 BM+O2LTI/2iWBMYv7ZUtSQnZ42yxM8JlftwIfn9yE5EOhd95KwirGOv9v308ugkewEg6fnzlY
 VA/2ivA2Wgr/ikw8Ht1yzIsua4Tm8ArRQJjihIynvhI7AMUq1JDVwkOmcqZfWyPCZg+XvFISP
 86Qmpx/svgGWkGEV9n6njlVoID1vDUpa8MQL88ZPjZ6QHdaj3qhlGdidRVbSPlJBhktxwQQ+z
 CSHlWZVfsD1+5JMO66lZT01rZ9jhZjMWwDiq3LhaNN6hhKR6xJVzNf1x4jkw+00QMDwRmA9Fe
 Sejxl1IckTEsO6PZC8RDp4gnJO5DeuDONT5ZwaDRKZ0rtRHQYKXEH9PiTW3FB8FfyHk1vtH8L
 EjLmBpwXgtY2evVj4OPcHCZa+fAlmCgrIkDtDRWZwSFk+thIZ4XENAEDv6K1ZDHWXPmzw5R3Y
 zElaPycO7xpBjLTCWFjAhUgKbqj/Xi87b0F6RmdkVXksgJlrLJaexA+6G7AO4sCjI9MFVI8AO
 Or+r0rL2MgDQgp+i4Xy7lkUDqZ4wdWBfMtPMtpZlNCNPvFQTy6baxldnTUREgS5e+KsRSiE/0
 IIZv+/v9BY8f6X/QYTtEt++uyHTkF/ayzAiMcUvvI8TIlwUWiiyEr+hoc7+4aWYVmHPghGiER
 Q8NOcLAtL3x6zYzz9Q5qE8BDjP2JTjSE6WDXSMS/Y2HzcqP6QubnXVp6i4j4a7UxW+XGCFhYn
 8Rfnk6JgY0OZxtiIIpfGZ16tjDdsgw+DYEckKZph5qLya0QQWW2SqNK1/DFk0HRpIznv+yy8A
 nm3SkA2HmELmho0mNPUYlqMsIBqpnkC6UUwqZwCPLlKvIaSn7arPtzxks2+8Jl9crRlU5QO9y
 Lmujq1Q4D8PvztZE+WGtfw8BTPmncvwEMN8ITZtO4eEOww=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738757667; x=1739362467; i=fiona.klute@gmx.de;
 bh=NLjbD2etq8CCFAW+KCZtTtv3ubZR/QDKK/3ZI2SAEtY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QLuUeJPhR8faVAH8MeIMKCRsU/nqfewLIIeSQgitV+lX7ro/nMXgotoUkvLQMMul
 XVc52wbHULhscAHk8JH9Vv3lz5+992VdAPiY1XX1qeVxcxc07gXQjKbKWGO0rn9c2
 WUNeq4HzKSEXfASeEyEE9JKJ0NSw11H5NNGTuhu8kND6hH1EL56l17Q7E+/yBICWx
 C7qrbMreFswYE0ojQ39sGuRfrzkuXIc/g1sOLu8vSfQArBH3AMx3X1+UFCgN4/h7Z
 zEyMBB0RJwd258RgcmfnMg16maks8dRF+Fc61nOZATnexiWCLuEiTcfMoCcseDxe7
 yW6IZjTirwNVw60rAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QLuUeJPh
Subject: Re: [Buildroot] [PATCH v2 2/3] package/pkg-golang: do not force
 ld.gold on aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann!

Am 05.02.25 um 13:02 schrieb yann.morin@orange.com:
> Fiona, All,
>
> On 2025-02-05 12:35 +0100, Fiona Klute spake thusly:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Go forces use of the Gold linker on aarch64 due to a bug in BFD that
>> is fixed in Binutils >= 2.41 (that includes all versions provided by
>> Buildroot). Forcing Gold will break with toolchains that don't provide
>> it (like the Buildroot toolchains), so override the flag and use BFD.
>
> It is worth mentionning that toolchains using a binutils version where
> gold does not even exist (e.g. old versions of binutils, or future ones
> where it got dropped) would lack 'ld.bfd' as well, and would only have
> 'ld'. That change would break for those toolchains; for the old
> versions, that would not be an issue in practice, as they would be
> broken because binutils had an issue anyway; for future versions, we'll
> handle that at times, as usual! ;-)
I wouldn't expect the ld.bfd name to go away if/when Binutils drops
ld.gold, because there still are other linkers people might want to use
and switch between, e.g. ld.lld from LLVM. But I agree we can handle
that if it happens, ideally Go would stop forcing ld.gold soon enough so
we can just drop the override. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
