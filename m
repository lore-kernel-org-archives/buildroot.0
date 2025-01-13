Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62B5C02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E427605CD;
	Mon, 13 Jan 2025 20:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZM4_Zshj5J3; Mon, 13 Jan 2025 20:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9337160017
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9337160017;
	Mon, 13 Jan 2025 20:56:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FFEE942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D4EF4067C
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJfzOXEWawJp for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:56:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2078B405D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2078B405D5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2078B405D5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:56:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1tazqw398R-00ALNn; Mon, 13
 Jan 2025 21:56:01 +0100
Message-ID: <fceab6bb-68fe-4c29-8faa-415d1c7ac99a@gmx.de>
Date: Mon, 13 Jan 2025 21:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-3-fiona.klute@gmx.de>
 <20250113212917.5ed56ab5@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250113212917.5ed56ab5@windsurf>
X-Provags-ID: V03:K1:AukFvzkKKkGeei3BZDTupQiNP8Yw9y9B4y1FFr0/JWDH04jwuyf
 G/nI1Pp6EcxFsFc0scaBxZ16B5wBf0vm/HqSF6gPH6AWVmKlHtKfu8txQwWjE7qPiYvStSc
 LTOM+5pmlYTTOxFYVZ/drLAGWAcwGiaDW5EfxUIrFwmEzlMjjw0pNmiZ1w0W5gjkL5EyHpq
 xvKcsd1wSm8Rbc1sins8g==
UI-OutboundReport: notjunk:1;M01:P0:g3MChkKTYJk=;NadQ+bWQXevs6+/eH8SKq8mS4RB
 oAqkHidu4kvMxkHi02T3vHRIKFyUb2D4eGXPfO4rCsZuG3B0s03QKzCR7pSFOQgGXrl2ad94M
 psEqhUxQwgA8fwmloL6uYWFWNEkL5ytN9lp/O7JYsx+aj1gj7EXK4OSyl4kIVgIJ+/aezHolH
 loDpHbExYY6QqPwt3r+BH/rX/Z/HeJJrJpubfjqhJK8HnH6I94es5teOdy3mj9j+K9FNHZToS
 BmR7ZR839UUmIVSfMuCIIRa+5cfdw8JzJnwvotpaSYjkiwsjgfk6HBo1yav9I/xujQ0oeS18e
 4GgAmQoBs4azwJVXAEfHx0jvTiVzK86vthWAk/1BjkN3KckGy/PMyluiO8EUJBZV8vNMYfrxx
 pvhXBFNoKvS+1c+CK4zGTlHGMv6yx2LzMuOuRL/l3SfaZysWZWHjISUZqpMo2MeIc/GZ5xBZH
 j7mB6bsOfKYCRvAKTkYVNCYer3s8JaU+JmMPsKGxhhiH4znwufvEgWelLgAmz+qR9H3sK1oj3
 EBuTHgD9n0bYvhiI4Kmpzf20Xw9bs8UcbY+4HmZmHdRVrK1FtvJ31UJSi8VW1SBspwZ4ckbwZ
 2JPy7P/bSV1F9/+qT7CLtOlb5lU6txSnBvYZF1/5AWpawDEx/xmNnrEdghiPrBs6uvjPf8JaU
 TJ6C3w/EHBQWEMdmXfYKuR2T4JPdE3BiYqP4i98+oMaUYRUpB8o6EX/xrl3FOzi2g1jETcgl0
 bXj9t6O1AyK96ZpXtR4kBI/V3mgKvMaPF1SZiWr+u1E2qAfla3FcqwaoYqStEQQys/q+91HBg
 Itv/I/ojVlVBQ3jExjZeISDMW8bGxknrNa1GyiYbRqdRcURSxpDu3HJLoHnhr4wdT4hq94zZ3
 m4fgDbC3c8m+GZ6iKqFkGkK4woqVtXxOIHsDs32SFZcWK3rgZaool5/cfXNwWp0apib21se0e
 /TU1YX67a7OO09tsQTIRSHTAqdV9ZzHE5ThnS8W1bnGQj++4MWLDxdKsKA18LWb0ijMOD1Voy
 Y886MLk45KbnVUp5TvJmTN5Y36u/cboleDe7CbWkLceH6h/MUYNIvl3s4BsBZeH46n31BVubY
 q2UZZG11K5iRbazD0j42In+VHvd6W0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736801762; x=1737406562; i=fiona.klute@gmx.de;
 bh=ps7AmctnHex956zKY8XjUx3LLySOV1xn25ie1uP6lLc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AyOqSFn0NQpl43VyXohf+oSmj18UtzHo7Vo+jwutkQAz2xaYurph1DKxsoR7+WuR
 sl0lDEMhAc3ojYl7ZTCcAo2KtzxHEJarCGOcYIhW47NLvzNG1n7VkC1Her3t0Qhwn
 g3zL3/xCyH1briDogaTz0Mv7KlPRZfb9Q1OTtUjZ/yiCpLIR1lG0RRus4+mRVuCU1
 wENI6blzOHbJoB+aKX2KSnHmpK0HgcZyky7IBaWM2PuRl4tA3ZJg90RqvqKGpzSvv
 Qa0b/20Ty8h6knlDAQGKezDHcpWhmXTHIzoo7cCSBPgE22QMrSAHXwz8I2+ZwMtB5
 005Lvc2T3Dcj6FOxQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=AyOqSFn0
Subject: Re: [Buildroot] [PATCH v7 2/5] package/gobject-introspection: works
 with musl now
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.01.25 um 21:29 schrieb Thomas Petazzoni:
> Hello,
>
> On Mon, 13 Jan 2025 21:04:51 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> Current versions of gobject-introspection build with musl (Alpine
>
> When you say "current", is this after the version bump of the previous
> patch?
Yes, since the first iteration of this series. Any version from 1.80.1
should work.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
