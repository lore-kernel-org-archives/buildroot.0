Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B1C87FDA
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 06:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7306F83CAA;
	Mon, 11 Aug 2025 06:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rn0BM8MSFq4C; Mon, 11 Aug 2025 06:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3C683CA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C3C683CA8;
	Mon, 11 Aug 2025 06:10:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46932154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 06:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3851441142
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 06:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOeAjIwloV39 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 06:10:41 +0000 (UTC)
X-Greylist: delayed 1989 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 11 Aug 2025 06:10:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2E6F4113E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E6F4113E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2E6F4113E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 06:10:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 94CF4581468
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 05:24:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67ECF1F47E;
 Mon, 11 Aug 2025 05:24:08 +0000 (UTC)
Mime-Version: 1.0
Date: Mon, 11 Aug 2025 07:24:07 +0200
Message-Id: <DBZCJ6MUT01E.IED2BZIAW291@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806-php-lua-v2-1-a73faad939e9@bootlin.com>
 <e0045fd1-40e1-4af8-8031-9e051aff6833@smile.fr>
In-Reply-To: <e0045fd1-40e1-4af8-8031-9e051aff6833@smile.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeduiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejieevgeejveefffekkeejhfeiteefkeekffduleefvdduudffvdejleffgefgvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754889848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n94TTyZN+bJNwsDQNZYW5AurAOo6B284ZMRusRY2YEI=;
 b=b5vWqgXlIWDk3rqUGd8/ce50/Sj6pe2isYcRY+Gx6lGwzA+WzvdkZVR/a6F460NDy9OTOP
 ZW7L66hJpSLb+zqJsgaWNHYyikXLPw6zchR65a8nVdcpwpLcqFfNZHZ30eHXs6imz7fgTI
 1Ncm/jJed5ST99qNBklw/lHxEAoqN4GgkVxjfLoDuKiqgDA+d4nXJLp1c8xXwByc1pZzAF
 1dMZPm7zPJzoOhZwDbDbGrgWiCZjKRIPfKwXdPyOS7Q+lv2xXKzF4xvwJuZh8E/Kw3HS3x
 MFQT3j4sQCe85ycGwBKzj0YJqWslQ3LLQpcbPJisoWnU4lIZlCzM561GNFi6Ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b5vWqgXl
Subject: Re: [Buildroot] [PATCH v2] package/php-lua: fix build with
 PHP8/GCC14
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gU2F0IEF1ZyA5LCAyMDI1IGF0IDEwOjQyIFBNIENFU1QsIFJvbWFpbiBO
YW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+IEhlbGxvIEFsZXhpcywgQWxsLAo+Cj4gTGUgMDYv
MDgvMjAyNSDDoCAyMjo0MiwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTC
oDoKClsuLi5dCgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9waHAtbHVhLzAwMDMtcGhwOC1TaWdu
YXR1cmUtb2Ytd3JpdGUtcHJvcGVybHktcmVhZC1wcm9wZXJ0eS13YXMtY2hhbmdlZC5wYXRjaCBi
L3BhY2thZ2UvcGhwLWx1YS8wMDAzLXBocDgtU2lnbmF0dXJlLW9mLXdyaXRlLXByb3Blcmx5LXJl
YWQtcHJvcGVydHktd2FzLWNoYW5nZWQucGF0Y2gKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4g
aW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMGM2OGE3MDYy
NDUxZDQwYTJkNjMwYzI0MjQ0YWIwMDNiZGZiOTM5Ngo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBi
L3BhY2thZ2UvcGhwLWx1YS8wMDAzLXBocDgtU2lnbmF0dXJlLW9mLXdyaXRlLXByb3Blcmx5LXJl
YWQtcHJvcGVydHktd2FzLWNoYW5nZWQucGF0Y2gKPj4gQEAgLTAsMCArMSw3NyBAQAo+PiArRnJv
bSBkZTEwNjhkNjM0NTE5YWJmMjQ2MWRhYzk0MjdiNWZmMjRiNjYwM2FmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+PiArRnJvbTogTWlraGFpbCBHYWxhbmluIDxtaWtoYWlsLmdhbGFuaW5AdGVh
bS5idW1ibGUuY29tPgo+PiArRGF0ZTogVHVlLCAyNCBBdWcgMjAyMSAwODoyODo0NyArMDEwMAo+
PiArU3ViamVjdDogW1BBVENIXSBwaHA4OiBTaWduYXR1cmUgb2Ygd3JpdGVfcHJvcGVydHkvcmVh
ZF9wcm9wZXJ0eSB3YXMgY2hhbmdlZAo+PiArIGluIGh0dHBzOi8vZ2l0aHViLmNvbS9waHAvcGhw
LXNyYy9jb21taXQvOTFlZjQxMjRlNTYKPj4gKwo+PiArVGFrZW4gZnJvbSBodHRwczovL2dpdGh1
Yi5jb20vYmFkb28vcGhwLWx1YS9wdWxsLzgKPgo+IENoZWNrLXBhY2thZ2Ugd2FybiBhYm91dCBt
aXNzaW5nICJVcHN0cmVhbToiIGxpbmsuCj4KPiBTaW5jZSB0aGUgcGF0Y2ggY29tZSBmcm9tIGEg
Zm9yaywgdXNpbmcgIlVwc3RyZWFtIiBsb29rcyB3cm9uZyBoZXJlLgo+IE1heWJlIFVwc3RyZWFt
OiBuL2EgPwoKU3VyZSwgSSBjYW4gYWRkIHRoaXMgZW1wdHkgVXBzdHJlYW0gaW4gdGhlIG5leHQg
cmV2aXNpb24uCgpBbGV4aXMKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgoKLS0gCkFsZXhp
cyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
