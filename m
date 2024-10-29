Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B296D2AB3C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 13:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF34606F8;
	Tue, 29 Oct 2024 13:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6di_ppH2LueB; Tue, 29 Oct 2024 13:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B0C60707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B0C60707;
	Tue, 29 Oct 2024 13:42:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CB51112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E2EF40308
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yaD22JI70bd for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 13:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C1854007E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C1854007E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C1854007E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:42:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.191]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1tF1cK1Y7m-00MskG; Tue, 29
 Oct 2024 14:42:30 +0100
Message-ID: <e7853850-e246-46f3-8701-cf1117bcdb9e@gmx.de>
Date: Tue, 29 Oct 2024 14:42:29 +0100
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
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241028220010.23cbd668@windsurf>
X-Provags-ID: V03:K1:+UFiWSRpde2HaHprZEpJxrAQbnDXuZGbwyWwPnLj+b6ZXg9vblu
 q+T099LXbX/lmqKAoX5sUbsr+x4w+Ot4Q5J4xBdnyXp22x7n2ADxH2s5LhQ/WU5e5EuMkwp
 kA8jMPIOFr4H8OJp4Cs6IBN3csjfZvkBVh2Jm99Zn6rMTkpjs2RkRvmKj7HuvI+zfJhdznc
 4BT9+2l0jBWuxTFn/o+tg==
UI-OutboundReport: notjunk:1;M01:P0:wxXXFShFvRs=;7XNeg50mVH6MIjMdcYbtMU9OCSN
 z2zQh9xdZKJHvRlMlmK6J2f41/YS0tneJtkBFP/L4pcHSpcSEXazGwFclylvzLMPqyd3bVox2
 wEbOLHS6lhPDNmZzrCqXEq0xCLyoRm+zM6xI4derZwsIALcDjloxUNpVyoVlukSuKLsOQYx66
 f8gXpyQgagoOB1e/XM1eWPytwLzYFm2wRPFRrZzbbhHOWeXDhQIqcOgzFkAcNse5eMYGhQm8C
 Q4maNiD80sahtM499bTTB3KU+BI0V22209jSNWewaym+pie0EeurXAQxWUnoxKKb7cYiyqhfs
 QhMDpMyOACQZo3a/4baN3jviaOk7NcaOGb4IGEY5+QUEGzL+/dlsaCR/OzMRkeDwerirQnd+O
 d/AAXtQ6eOpjQw0i1YV2NRR1RfBp/NvNSALFs4d0VDiy6e3HuQAQQDwIcds+XjXjY+djFxuvF
 OfP5Lx2lK7uyZvm3MMBJOgUiNDGslFJKstk2C1WLOMRVZ3zi3BAP+Um8fgkn84S5A0jbAyeUC
 lBO7urJIAbJRO9sRm386eoaOcVGx8ncHdlt2/STvsbl89neJ8nd6dSMtidB+qAudMyic1nAz2
 6zKOSgpsYx12k2VTjV3l/W1sJlbwF0IS/NdYYHSv0mndC5SnsgPBxY25dogNuG43KIa7J3738
 4kNrCNsOigvtg60pK+sUDlYZ+OtiCleYG/fMW1oqdNPQoXfO5u4oDBLmeb0jD1zsPaE0nf9jf
 3EL9azLqUYLzRRSwWpvsvVdAs5fdWg+LAYZvSNEgpBhLRDKcjYQLdlco1zSoeXbcY47erJWyn
 dwlo/qYrdBjFKIpv5hPSaJ7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730209350; x=1730814150; i=fiona.klute@gmx.de;
 bh=pDTswLk+fwsbIT+QNXlSDgnEcKb95mVy9DkfuWG+Gxo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=RcnH6VMP4fWgOg/CGtiacrdT49ed7GHTe1KJytYRnfs3m/ddBfW8mGfiKizx5Sh0
 9vLU53KghAxH5xh2bAbIUdaPuXGE/5ZPO/3hf3BnziGPT5ffNRlIDtb7RkmRT3kFU
 VNxcfiJwxfvgdYPSgYFyTFvduATP0U1eZ2njuB+Poqsec2qhX9/qmylEC96t5W1p4
 Jv99lRSsUGKcAdIOyvCew524KBfDU9yIlqmpCta3KkQaOXpqWr9lSyMs/39b9Ttsm
 zYYeYQXNpUBNOFf1OgDZCe6rXAstDSeiP+o57gBQgXzRjgneSjOYikSivh+kDVYiM
 EnczCqayVRN3HPY5cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=RcnH6VMP
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

Hi Thomas!

Am 28.10.24 um 22:00 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Thu, 10 Oct 2024 15:53:10 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> There are a lot of interconnected changes in these releases:
>>
>> Since 2.79.0, the introspection (i11n) data for libglib2 was moved out
>> of gobject-introspection (GOI) and into libglib2 itself, thus building
>> libglib2 with i11n needs tools provided by GOI [0].
>
> [...]
>
> I finally had a look at this patch, and I have one concern with it: if
> I'm not mistaken, host-libglib2 will now always build
> host-gobject-introspection, even if we don't care at all about
> introspection support.
>
> Why is host-gobject-introspection an unconditional dependency of
> HOST_LIBGLIB2_DEPENDENCIES ?

Basically for simplicity. For the target we can use
BR2_PACKAGE_GOBJECT_INTROSPECTION to decide whether to build libglib2
with introspection, but we don't currently have a
BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION config option. And the bootstrap
doesn't slow down the build that much, so I assumed doing it
unconditionally would be fine.

I can add BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION if you think we should
support building without introspection.

Currently (target) gobject-introspection seems to be the only package
that depends on host-gobject-introspection, so theoretically I could
also use BR2_PACKAGE_GOBJECT_INTROSPECTION, but that would be messy and
likely cause trouble if anything else ever came to rely on host GOI.

Or do you see a better option?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
