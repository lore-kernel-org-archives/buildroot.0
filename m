Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E31C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A619480D46;
	Mon, 13 Jan 2025 21:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-Uc2Jl3S04U; Mon, 13 Jan 2025 21:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B924580D76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B924580D76;
	Mon, 13 Jan 2025 21:57:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 807CCAF8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7969640586
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkM8-9zp6tKQ for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17764401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17764401D5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17764401D5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:57:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHoRK-1tk9kl1ili-00E2Cu; Mon, 13
 Jan 2025 22:57:53 +0100
Message-ID: <cbdc2f31-5569-44ae-977f-93f45a5c5c84@gmx.de>
Date: Mon, 13 Jan 2025 22:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-6-fiona.klute@gmx.de>
 <20250113213300.4ba5d4b8@windsurf>
 <096f7ff9-4032-40bc-9c03-cccbca4d675f@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <096f7ff9-4032-40bc-9c03-cccbca4d675f@gmx.de>
X-Provags-ID: V03:K1:1xyMqHAf2N1N/EjlO3lhLUB998f8tsYVtw3fV/rwQKwEoz6sar2
 eV8+X6iULEnaI/7iFV5pGPM0N175PON4/upW2HGGHo0ulpZQtvqBvngvy+TiH7n3e3I2VJQ
 42CYcbo2GdB+wFUsPFruaKEIOKVbUCzijAT984skz1vmKQ6ZRgoRTnYftzc/pwZB6DS12QZ
 k1AO7KzePAh8j7uNH4XiA==
UI-OutboundReport: notjunk:1;M01:P0:TbyHmfHBL7M=;qvJq4vazjHnmE+bkzPVQ47lHr1W
 Z1FM1sr4715Zwf9K2ZaNzRzvccKhYeGFCVkN30LPLXsq8VHRU44O00Qwe8zHuIiK1AYD24xV+
 LDc5FSP2dioVdgkdzrq7TAi5anfIF0kdTkY/A5mMqmp0x8yz7/fDnVXG6oEqKC0GQUWnyHkxy
 rXwdoK+p0M7I0zcmbzi2lLWZLMUw2iCjvGA8WFgkK1x8jpfVtyK5rWYuHGqt69xSF0BvGOhTf
 H2wiVGCGUYNO/RQvWN05JS8R7g+2S03PrIvIgST2lU253RJJt24WeZRe6CR97T7FxRixsg4JH
 PxK3XstUQAOd5YR645R0KcmzcFkY2sX9dA046fsQD51uFIu5YhecUFUY70ymvIUH1RVlu0ys2
 c2ce6b3vE5sbQeBCPXh01hVHtWWe6u4JgtFOcJ0BCHceaB2BYpumIQgGVOh8mXPTJ/FccVwOX
 g0Rur/W2s/1nW5kgx2Yp/+dnP6AR8HcNxnMjqVWfdV5NY+mhO9vp2YXkk35yTyjN6nup6jvTw
 cwzWo187QqHXImbHcixtORx/gNgT4msAu03kxlmp7Dum4SyOubUmPTpVAGk3B+mDIPFz4dGDe
 iSXBSc++649v5bDOQGKmdTFuTaL10AbtF4THgLf1qdPPm6yx2BoWat8iNiI6jsO28BGC57xVy
 BRJC/KE5ptX95nDtbR0citEck6dRO3A9GCUW+AKbFw6Ui038jw1wVlSe7qUvJxtMNVK2BgORC
 hMTpfMC6wBgLEsGTQc9XUbopSbM5H/hNE3Rrfdt6zk1L1TENuqVAx2QYbr65CCpU7JCShCBEq
 ebc1MMU0ZrbiDdzy5SLucF0SSfZD7JCTwAtDi9xV19MKYj6DScaFmT0BWPAu+by5fIafPCExa
 ZroECROvNmUVtvQ7ReT36q8tvohzEhignYMafMeybNeXZnzL47D5k9DL5mwhOJp9M11P/Rayk
 Mau+BeU14wxtt9fWhRKqZglh+TjWjn3gKQzWmGXvh1SJ6JNaLsDSohEgmxVXR2bbygS1AYnod
 a4LxK+CCcIMJ9abDeqcmJ/Q2I6HboazVKklAkYGaFahhaxndjROiphq6uHHyLXeyIaHmXS+Y5
 z8soLd28E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736805473; x=1737410273; i=fiona.klute@gmx.de;
 bh=3kYYD0xO5Pn5TIiSiMEb+OQgo8E3tdcIicEY1HvH1cY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NXrxFDMx8zKl5DIHG93POAGGoLd/QfQcX7rra5LqKL8v+i/EMQy4YNDvyNOjvrYB
 pJhjthjRSGTr2OpP0e228L0iEi7GtAEciJTEGUUuZPbRKT/8odLOtDpMcTOAGxGtH
 oRnUFCXY40ifefaeYQR42pD4A4NbNd+g0G1LYe5srs+nOZ/YLVii6RY8us1abhFsh
 d99KxfzdUGsX9TA0xzqVUghqfKEiN/ELEWuIx0IPOy/qnk3mOPcjFBJ8dDWj4KyFg
 K5bljiFzJ+kwS9wmYJNT0tMJfaaa4LJUNdRP/MNS1PJV9+ADHLi3lWapIbX5nTw3Z
 7LXULtH2cYG2+l1RsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NXrxFDMx
Subject: Re: [Buildroot] [PATCH v7 5/5] package/json-glib: bump to version
 1.10.6
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
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.01.25 um 22:07 schrieb Fiona Klute:
> Am 13.01.25 um 21:33 schrieb Thomas Petazzoni:
>> Hello,
>>
>> On Mon, 13 Jan 2025 21:04:54 +0100
>> Fiona Klute <fiona.klute@gmx.de> wrote:
>>
>>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>>
>>> Fixes a build failure due to warnings from g-ir-scanner:
>>
>> Does this happen due to the bump in PATCH 1/5 ? Does it happen already
>> before ? If it is happen due to the bump in PATCH 1/5, can this patch
>> be added *before* PATCH 1/5 in the series, i.e does it work with
>> earlier versions of glib/GOI ?
>
> I'll have to test a clean build to answer that, the upstream changelog
> doesn't mention a specific version dependency. My notes say the issue
> first appeared with the gobject-introspection update to 1.82.0, probably
> some checks became stricter there.
I did a test build with the json-glib bump only, it works. In that case
it becomes a "normal" version bump, though necessary to build with the
new GOI version.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
