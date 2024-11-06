Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFCD59F74
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E53D80C78;
	Wed,  6 Nov 2024 20:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQPT8157on9e; Wed,  6 Nov 2024 20:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B519480C79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B519480C79;
	Wed,  6 Nov 2024 20:45:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7819D4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7241240396
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLsD-sVACwKI for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E235740260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E235740260
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E235740260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:45:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXuH-1tK11p1nyx-00RNcM; Wed, 06
 Nov 2024 21:45:14 +0100
Message-ID: <cf2fd687-9343-4d75-8e37-2510ec03fad6@gmx.de>
Date: Wed, 6 Nov 2024 21:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon
 <asafka7@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
 <20241010135318.3064224-4-fiona.klute@gmx.de>
 <20241028220010.23cbd668@windsurf>
 <e7853850-e246-46f3-8701-cf1117bcdb9e@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <e7853850-e246-46f3-8701-cf1117bcdb9e@gmx.de>
X-Provags-ID: V03:K1:WUGOwwWbA28nTtWHKItIfaopSRKBS3Wam4++NiUEYZX3kC8BJDi
 NKfMKcBUnIQxEcmj6vLlzjDRFHRm/KtW43m/CEq7wB/UIKJjsLnSnatH6Ch/NRXZB8i4Xgj
 HxJk6S9N3GXdUNgBLuucdxbLy9d8ho/487a6vOFHClkz5RihvS8aY3Tiy8wMY9NH62Ed/wu
 eV0kyqYvYb2bpXDkWlVuA==
UI-OutboundReport: notjunk:1;M01:P0:0xNajve9xj8=;ikKysWnDF6MxcPTnkA/PdIooBxI
 q3qFVnxj8vOwtBgx1q6+6ZJLoRLnuZsDrkyQPmxzjTSna5SQxJ9ijz4W+Ke/GxlSuWqLKTJ0u
 2bC/n7tcxur3uzHnJW+kE8gUv6i7PAJhXhgmPhlWrG+UMADvFfTxqXvUIuc1MKFPiPjmzg/8Q
 M212+/VuD/2kA2miMAHN4bFX/rxjjDcVoB8E0aF9lDGLxJfP1+EMHvooSbYyt6yLjIFzoi5L3
 K6fpFMNPJEJld28Pv1riDUrCOHzGAvdBkPmFf7NnKe5TdnR/xQlrRmVOvQxGi+YAVfNpgd0hZ
 AQBW1gPWkysl+k132skjBO1qOHIIVkSQnn8zCkBCHzIGrz5cRn//yJFO8DDw0Y4UJDd8F2cPE
 GYIroJzjxqCb6lARuvLLWr1oa6wfhMvWGG6TjNAsEN/95H+niMz9QiMpRsE5QizZ0doQGjRbb
 W4uNz8JKwRccWIr4l8vOtR2Q2gknBBD8ZLCso13XIUohS/84CuJnE2w+p1hFly/y8b8rAinnI
 58g0FlhZqYMnzd5FQAqWwJRxaB8jxExGUnssTpR1AUfUlWqZxSJTAqIMb7uc1mZdp7drt/NVF
 n/7GnCPnorYwi2+RuG4S5W9+KyCK/d8zuzQh3VIX8L9C85om3OCSwm4NT7a8h0hQ9QjtOFf0x
 xCcTPFHGmGpSEYscwYJTP95zF3tKkGPqn/oqzSqOaLCZOmha86RDp9Q4pOAqH1bq/yEgdGqfE
 syL7JhD0aEycXt8c1GbxUmjUiJWSZJVszj21RqNaYxaIonMUvAmO0NAW2YsEJYC/SStBMZ4Sz
 lzAo8bPiGYdSvrHkLIXmx0/A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730925914; x=1731530714; i=fiona.klute@gmx.de;
 bh=H+ez4yo09pZpV+ysu2y7fuielRyKMgcEF8+72CZ3C/0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=f1TSvkWiWHfLbH/ojRn9coSj5D5RdxXOSLJDLEUwbE6KrC0HRCnbJHNnMX3zoK5k
 YWLwGB+O3qNM3TVa2XlMa6eeP3VhLq5s77bHZxlgU7ZqzB1u5CzCR6J2jRxm+/cjR
 //uGpgGNmww3d2SwGr1D+dCsDaBuX6ElQpf0ScbqSqfCRMjenV9zouBQBwEwBuMEN
 wvz1C05nIqyrGtOAkgZ0z4fn3ymC6wFXeIEo4flEKJNAumKVpY8IRTLxQjvZx7zIN
 Q1D6ckv5PQZPmZHGfGlSc2k+9QxOU5gXYWKGHKogeC8dKKWaGLdStcNwgU10YHbsn
 QaNCAbD/6U9XhWWDUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=f1TSvkWi
Subject: Re: [Buildroot] [PATCH v5 3/7] package/{gobject-introspection,
 libglib2}: bump to {1.82.0, 2.82.0}
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

I've just sent v6 that does the host-libglib2 bootstrap only if GOI is
actually built for the host. Any package that needs host-libglib2 with
introspection (currently only target gobject-introspection) now needs to
select BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION. I hope that helps!

Best regards,
Fiona

Am 29.10.24 um 14:42 schrieb Fiona Klute:
> Hi Thomas!
>
> Am 28.10.24 um 22:00 schrieb Thomas Petazzoni:
>> Hello Fiona,
>>
>> On Thu, 10 Oct 2024 15:53:10 +0200
>> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>>
>>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>>
>>> There are a lot of interconnected changes in these releases:
>>>
>>> Since 2.79.0, the introspection (i11n) data for libglib2 was moved out
>>> of gobject-introspection (GOI) and into libglib2 itself, thus building
>>> libglib2 with i11n needs tools provided by GOI [0].
>>
>> [...]
>>
>> I finally had a look at this patch, and I have one concern with it: if
>> I'm not mistaken, host-libglib2 will now always build
>> host-gobject-introspection, even if we don't care at all about
>> introspection support.
>>
>> Why is host-gobject-introspection an unconditional dependency of
>> HOST_LIBGLIB2_DEPENDENCIES ?
>
> Basically for simplicity. For the target we can use
> BR2_PACKAGE_GOBJECT_INTROSPECTION to decide whether to build libglib2
> with introspection, but we don't currently have a
> BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION config option. And the bootstrap
> doesn't slow down the build that much, so I assumed doing it
> unconditionally would be fine.
>
> I can add BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION if you think we should
> support building without introspection.
>
> Currently (target) gobject-introspection seems to be the only package
> that depends on host-gobject-introspection, so theoretically I could
> also use BR2_PACKAGE_GOBJECT_INTROSPECTION, but that would be messy and
> likely cause trouble if anything else ever came to rely on host GOI.
>
> Or do you see a better option?
>
> Best regards,
> Fiona
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
