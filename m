Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1204AC54E94
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 18:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75E3F82200;
	Tue, 24 Jan 2023 18:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75E3F82200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gADsUthpJ7tT; Tue, 24 Jan 2023 18:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA77821A0;
	Tue, 24 Jan 2023 18:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA77821A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B05E1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 18:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5204C60D4B
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 18:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5204C60D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZx0eKhIAP-3 for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 18:37:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0776060BEA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0776060BEA
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 18:37:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail ([87.123.196.227]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf078-1ojhuU3fru-00gWJb for
 <buildroot@buildroot.org>; Tue, 24 Jan 2023 19:37:28 +0100
Message-ID: <6e0a1eb8-4495-76a4-63a9-852fccbb9a79@carrier-2>
Date: Tue, 24 Jan 2023 19:37:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: buildroot@buildroot.org
References: <21929154-7cb8-31ff-20de-d48d25e53423@carrier-2>
From: Stefan Kuhne <Stefan.Kuhne@gmx.net>
In-Reply-To: <21929154-7cb8-31ff-20de-d48d25e53423@carrier-2>
X-Provags-ID: V03:K1:djnh6VntzpdvVLzdeLJ7TSJ15GGw4V4O8OHqytee3ZZ/UhsjNQR
 jxZygdo7l5vcWPm/n7X/wvfKXXm2ohtS3wIYAeoDxGNQ8iU2uGYhEGAsbV4wuG+d8r/OWoT
 IrYEDJpJ9+Orrl3tEp60AxPJ8FBRrS5xjODu+bNz98Vpp2KG/o2f8NEBmT1PG6uWOIkrZql
 5hY58j1gU6rUr+wUce9rQ==
UI-OutboundReport: notjunk:1;M01:P0:RakGpeGMjT8=;ThOdVc11AaMw1AYTg6qvqBHyKiw
 r0fGGlByRKya6BzfU7a6bZ/1i4qE6qzhTWiipV8l3+cJy8AzIrR7Iei60LWem/o4yvaL6dL/G
 EIvE0C2Fb6cYy112jSC4j3LYdFLScqBQAZli/Q2RBsTa+m7W3yJvosfoUYBeS7RwQ8FgKtF7u
 xoMC/e761g8yeyQaYN3Iwnm9quc1I9Toq1hIk6Bih5Y8LmC1fImbDURaxIBr9u2oQMxTksDvg
 kvWLbbgpheQc/NWjIy6R99ImF5y4rX1oyJvSCDhBadS3TVrUTVATgJEWFQBAzdWMRVdsLJ8Ec
 ubrKPjASlE87qUjKn8tJpC8/wOTZYxdGPwbIJDy2S2gvoTJFAkDAnlg+QSmgYbEf7JtpV6Qt9
 CdqxZRPfZYLXoSZIVTKeIwydFzZ5TQQFKePlNsCplbyHIYkU7+df2A0WLLgYYg7Qew2S4ZLO/
 r1pvwRKSveQhudTQs72EMb8g97movoAfqhu2CafYVzFyz9XhU5Ib5e1XRLHKD2uScp2TLBueC
 zKBuN2BSE8oLKOW+CKT/rP7nhMPapM87uRSAKsbtf8oQHBMx7mcXAQ9wOZVNJd/cPFfrEkxjx
 hazm9g38dq5DGXpDP57ZFIOucq/auiwbJJ2/sCFVXCR5vMLNlu01/bP2O77lrL68B9oaJ02fx
 +vCGEkBrx58IFywjqob2Ui+LrNvE2/rPozki9osfO8o5J8SrNi77eGRlnyaDGCBOpFHnFvM4f
 /V2lwZGAVHk6DXLGjp7ewTtHvSB5MRpFUe9waXW91qzcWVgwj8iVV5l5Bx8ITjy74WQMz/NBu
 m6SpyoTr3cz3P/sOUKOBaQ95umcBH4pXOhfk+E4jEWWWrefCJVeBNMpSsknUUzHZE8duSsqOg
 MMM1ir+0/ymRGCHs705fSGIIYqbovs6029mapKF/OmPbmqyF2E95Il+FWPdGZP+/6iqpNy6+X
 qhG3J8bJef0a39Uwm67TABOgeFc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1674585448; bh=IlRdJi0r3hizEVYZ7u8aidSVDmoNF269fZ9k4NIYwAY=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=IrHXzfpYiHJgZLsw5CbrCoKEsQ0hQsFYdBisWYFTND9kfo6hk1g+armBofvP8vXRO
 49iwe41RxzoK8sZECx2LlZ8njDKs87rjHsHJfg4EMvNkXRv8VIwWTd/cWeq2dOF72U
 A10qotk5lkHle+idNJ8uLl0TTXRngkbGRMm/1ivmcWBR2SYQHKP8C+BZAcTmoQeIcH
 RmQmMbvdYRBws+ig0HL+32fzFzyv58c6impqfVpDiC6h1r7NHTk0T3VHQqrQ7bCdIU
 5T6cXGP8r5Jwn8pQdG+dZbUc9fg0ngDV/wABSyL9mQxOycuk25m8egGwcaXgQjEjyZ
 Zb7nkBsalltVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=IrHXzfpY
Subject: Re: [Buildroot] Build of glib2 failed
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
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 23.01.2023 um 20:32 schrieb Stefan Kuhne:

Hello.

> I've a problem to build glib2:
>
> ...
> Library m found: YES
> Run-time dependency libffi found: YES 3.4.4
> Run-time dependency zlib found: YES 1.2.13
> Checking for function "ngettext" : NO
> Library intl found: NO
>
> output/build/libglib2-2.72.3/meson.build:2102:4: ERROR: Automatic
> wrap-based subproject downloading is disabled
>
I missed UCLIBC_HAS_INTL and UCLIBC_HAS_ICONV in uclibc config.

Best regards
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
