Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C161EC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 17:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B07B405BF;
	Tue,  4 Jun 2024 17:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id th_PJrEYm1DP; Tue,  4 Jun 2024 17:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B94D4065B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B94D4065B;
	Tue,  4 Jun 2024 17:12:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62B171BF292
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 17:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E87A4065B
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 17:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIlkl4LK5FaN for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 17:12:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D063405BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D063405BF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D063405BF
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 17:12:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.83]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8QWA-1sA9zs2O36-004S0F; Tue, 04
 Jun 2024 19:12:32 +0200
Message-ID: <264e5017-0f29-4527-8d8b-4e7320c684ee@gmx.de>
Date: Tue, 4 Jun 2024 19:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Athaariq Ardhiansyah <foss@athaariq.my.id>, buildroot@buildroot.org
References: <20240603074049.28426-1-foss@athaariq.my.id>
 <20240603084617.38508-1-foss@athaariq.my.id>
 <20240603084617.38508-2-foss@athaariq.my.id>
 <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <3e31a13f-ae2c-4469-b275-9007ac82d17f@athaariq.my.id>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <3e31a13f-ae2c-4469-b275-9007ac82d17f@athaariq.my.id>
X-Provags-ID: V03:K1:hJXI9KbcbkVtRmo2hdNW3C6GbqTi6AqPmUCEav/FUdK9j45RtVt
 82VqbiRk95BZMquxVsLtEz/Hn082i/9WuPcBwgRDXyqbIQ0miJMZAO94Yk4NmgS81K/cFDm
 vrpD46kSzjf14MgFTjjSGzNLdTrPIsnChw7xh6cbOdksd9JsX51ItWbntQUz7FLO65QAPhG
 jS+IHKbP9p3Ac9eyByNVw==
UI-OutboundReport: notjunk:1;M01:P0:20GHj0m8D54=;S8xLgux+/xHkbgCpJxtb0OCLre8
 FCLmy2T1heYvnhJPzUji0jdgW7VBdYPbbnayzg4YdgLWztuCTHoP9Zp2JrJMCNunvt6EfWURF
 xT4YH7MyixPBx+CNabZ8JTLW0yMtk1lRrv4OfkoMGwDRAmIxO964c9kT3Bj1ZmVxjtIw0LQHk
 I/w2E1xQsVcmq0WZHR7RDMvvydm/VsX4CVKAPxxNj2mBYyiZI5dtKCcQhbGpX1836ZoU95kv2
 nByuXGPp70Ng4Y3Mpfqeds+60tygP8B3sFqxe0tUajs14/Td2FAniOqdbbVV9btJdYM/ksMNs
 vxrWzzX7G8qDgNZ5jupopLD9ih0IQsss7eQu0IREjzaCFHV7KA87EsO1Q0eAS3Gb/8BFKEEsl
 f8kUA3LBDJbKFLztGEtNJJiRH8jaiakIcvVGi1CGOxmZcAtjmElF0kDh/Tfjt1sFXi7qjUzEj
 IxAQVeEO8DpOEQPK6FRfDNIy9F2BnGZTCVO9HJ8OKfU2nl0KnUQh9dGRo26KuTnGDaA1w+iqw
 6tIZYvEhYxLOaWUKlOdfu1ard2JjplmvGYMQ8kPeoHeIHKAkCfkTUCNm3S3Yv8hXpGmZsLkuH
 7SypYS8uMZCM4tfVy6ma5TOtsE20P1X5fmd+97qbGoa0njZQZxeEN1FVlNAzpQeWM3JmjseT+
 HNM7N666z6Dhesk1V0OCkJDtXK/0UHezoHkigAVBrdIj2GIAZ+jmv8Qat6Gp0iZk1HPqGdqBX
 /6I1SefNUxV1yljmU788Pm2wryDI69ueQnSe/BE0JpxnbxTKoo62uYN1oEImYNZHkSO6qmdu2
 CrOTiD1S1fVWi+xRZpFXIhMTNpmjNuOH/Ko9BX2H9sMY0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717521152; x=1718125952; i=fiona.klute@gmx.de;
 bh=0C21c7JQTgrzrUOFoenoB58gAih3HLa9wQLjf7NDTqM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DLI60g8UZl+J1XXvxc/AgyFMG9ZGkSsh8uWgfmYj6yifoziS0nJqvPaf4h+q661b
 6iabLXOSCWtdnNY1LcqRepkrgiFUCBSD7WX5RMeKIlETLyKEfauS2TasDMezDbYjS
 75XCFUPOIUiYnajYu8DyoBdRVZOT8KT0tUClY6lOdm4LWeTVYfPSzV+89FUFmS6iv
 0bZubXtMn/BLzpukjDAXu1++an4SFioUGddhlVS4MVenPrjBCzMLZE8jJt0w3EMY4
 G7qwBA6Xz77UPK1G2XjLiiCCNnapl4T0x5fRm11GeVl/yNnFpWTYdiYw/6GeE9XCT
 xIEPN84kJOSqNUAYag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=DLI60g8U
Subject: Re: [Buildroot] [PATCH v2 2/3] package/raspberrypi-usbboot: bump
 version to 20221215-105525
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.06.24 um 00:58 schrieb Athaariq Ardhiansyah:
>  > the commit message should mention the actual version.
>
> The upstream maintainer won't tag the version anymore since December
> 18th, 2022. So, I have no idea what version of the latest commit. Last
> tagged version has no Raspberry Pi 5 support, unfortunately.

I hope one of the Buildroot maintainers can clarify what you should do
here. Personally, I'd probably use the commit as version in the commit
message too, and mention the reason (upstream hasn't done tags, this
commit adds RPi 5 support, something like that).

> From your
> perspective, should we ask the maintainer to tag again or we can safely
> use the latest commit possible similar as rpi-firmware? Thanks.

Can't hurt, but I have no idea if they'll follow the request, and
Buildroot shouldn't depend on it either way. The commit ID and source
hash will ensure it's well-defined what version you're using.

Mostly I just want an update that supports the CM4 version I have here
merged ASAP so I can drop the patch from my work branch. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
