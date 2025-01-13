Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED0AC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29FD880D01;
	Mon, 13 Jan 2025 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_E9tsw4nBcL; Mon, 13 Jan 2025 21:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4088780CCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4088780CCF;
	Mon, 13 Jan 2025 21:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD6C9940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 988FF80CA4
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rv83ovhh3ge0 for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F80680C83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F80680C83
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F80680C83
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:03:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp9i-1u3D201H12-00LiCl; Mon, 13
 Jan 2025 22:03:00 +0100
Message-ID: <932425e2-f575-44e2-965c-5131e1afc9b8@gmx.de>
Date: Mon, 13 Jan 2025 22:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-5-fiona.klute@gmx.de>
 <20250113213115.6e74bfb4@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250113213115.6e74bfb4@windsurf>
X-Provags-ID: V03:K1:x7sBIYSQt7M2cgWhQZsqciQAS9T6yFmoz1n594SMqgFcYni2Cnb
 HZVUgTyXhP68Ye9WvnC6ktzadYB/UTKVViMmmY/QmaZWRFK6mc+lpgP/ZQepi9R8rRIFITB
 jj6tCo4Oy3gW/3HRfcZkNn4R85ezzysdA6QnjDZ4UWAm5k1KDDXojYGdYVQuIOM/vNdsODI
 2WEMZ5gq8HmfIFKS5jKxg==
UI-OutboundReport: notjunk:1;M01:P0:Lo+SnhCGOBE=;R34Dwdq25i/DuV0+AlEO38JGWSl
 qF1dmZk5DUmS08MbuSZ8Ci0obWWh+Gj3knLOqMigieZ6XhqiUfVP6uZ8L8Kbbpn/iOB94kr78
 RGTH0rCPhkv/vo0XLhnWf6c9u/EHTeYFSwbhkPw/47QQmo48i3L7aMydEll/it5LrJv0CN5CL
 lcLrTGr22pLbZNI3SafpPsmA/Qh16uFnwulLKV/lNE7pvBAawpXiIeNP5UADVAkkX+hcmieDs
 k+MsXx+mn9+DxqGlcIOYhlz4ArujPNscvdwrpgAIkA3mKBgKYxX4YjHGke3hUDRzbgM0TYhpT
 k/FTiuTNuTJZd0Q4acAtD8ygBYwW94PctCoBsHZaR+ztTlBW51pBAfnsijZkoBQqXXD5v/Q+E
 bempBYqvFgVvYJflZobY5WpRWWGhMVl2mhIy6F3OIwI/Rs9fA7GQFdBC7tdS2EtYgXlrf76IK
 cHkTC03M7Ew8fGceD7AOy8SH/J9TXfUOjpjoEtwWEotoxkDRcvIqnV1vKVkR6lkZZ5KD3k4hX
 HbTv23BLfVrNsvZNlgDmK/O54w5IfmkkOc1J59i8PFBADHnm8Vd7CHGzByZFfm8S0Rx7aGUXQ
 A7+NPM+1uc4qUrm/LO3wJ2h09VP/k/W9/BbHscx14mG8Ehermtjsnr277B3qjrn1tISFqKSPF
 wx0eJM3O591aVjFXi/QedEqIj1zr10sCtzWaTr1M5Cg0vwwWAy3vz9Poe/B4V1l6pEx9rV2sG
 ayycEdEZHVzx28via0UCD1bCcVZfDBbL7aO2BqIjjTK34J08tJRgNW6fa83JOv1VnRxR13P/K
 SWRRROyFG3CMRNrS1/FP3nPxRxlw1jI6KaPiMgZK7ReJqLPrG5imSAR/SYnA68S8iXUuxLF8q
 wAPuR4SrYmbFzIPl78/AHyZAnVyBSavEOov5putVgsEflUXBI+NEm4fCD94FL1C0eNVVRiZxT
 /c06o/CiQ/bbJljmiyWOI1CoWXQV70SO2HOL525iQSmg+3tJPdxc69/6aph9q0nttIfuf7kuj
 DVSJPiTZ9gEf6IrpnshLBXP4QmhBC1F4JYWkChma+Iiv6UgSeMqFOzNBNGE9rJcXf3nO2zxn9
 eTTxroMdFvJUO7Ygt7+JILxahel3lW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736802180; x=1737406980; i=fiona.klute@gmx.de;
 bh=t8rpuNDycX/qUgx1KKGEaOrAcPbjmYXArxXZ4ggfJ2Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LX6uyUWGu/vuTk+11+mIaU3HOdEIbDzfww6MM5gAsDEAB8JKt6C6DL6rAM1OTtk/
 9yuWcGkKq9yJw4paE0A9KkSk15Y4f2IPovokJBUoSkLx9ocbQCqxMUrWEFswgvpSA
 FGliYXgY7q5KP6FIydQtaOJHu2+wfPlesbJW8WRTpiaIMdG2mwV3xoxA0FJmEsDWd
 ZeVTyvO8u1QUcuoY50peoth/GorFMlAAJ54ZjTeokDrnopq48roJqfXNpH1KsFPCU
 IhB3/pMDOKDusuWzgOgTqcbhuzIq1lxL0lXP0/eb+dYHzhmXdfnCxho+iuY/o6HEY
 1ohqhImOwx7VSxKZGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LX6uyUWG
Subject: Re: [Buildroot] [PATCH v7 4/5] package/network-manager: optional
 gobject-introspection
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

Am 13.01.25 um 21:31 schrieb Thomas Petazzoni:
> Hello,
>
> On Mon, 13 Jan 2025 21:04:53 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Introspection gets enabled if gobject-introspection is.
>
> Super minor nit: the commit title isn't "ideal", it might make one
> believe that the goal is to "make gobject-introspection optional",
> somewhat implying that it was mandatory before. A better commit title
> IMO:
>
> 	package/network-manager: add optional dependency on gobject-introspection
That would be incorrect: What the patch does is enable GOI support in NM
*if* the GOI package is enabled, when before it was disabled
unconditionally. How about:

package/network-manager: enable gobject-introspection support if available

That'd be correct, if a pretty long commit headline.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
