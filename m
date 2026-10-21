Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5EF606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KAHsd9Et
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D8240AF8;
	Wed, 21 Oct 2026 20:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRQhJqEllQzp; Wed, 21 Oct 2026 20:10:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 152F440EF2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613412;
	b=WEd/l8eoF9vgmae7GnoYf+RL9FUv6seGHYzqAxSMiyo989aFuppqDkIehimbsneKelRx
	 xsiigIYkVjgaGeopCAB6QyyG0ZTgSP4M+kyGnYmsu8118ZAMStqBbwcbKCQOsPYrBelKY
	 IvqwMwXfbsw2eA+DAZe95NkeKz5aLSeYx5xPBA6WiTnqhINGX4Yr0Wyx+bW/6qiLik3VT
	 oDtJxpUdkaAa0FJqD7dMzw6pyDq3JPVg6N/Za+IdRSs/xjk2taVE3NSk8LkDlmQSG107L
	 8jWPxIc8OZJ2fvE4/y5c0bTJQ134hJOPdAHVaD6Eftc/167Ezj38L+5+bNAp7PeYyzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=+ZTzDu7/1ZkrKCykfYQUwITJFa2ohdRYbj2NfFLl9U8=;
	b=WEQZIXoyD4oGYjpNKJHf9JPb7MO6VSI84ZkLhTilUoyHv7WLpKjOLqc311FdiFGMve2G
	 nusQJjmEyqylcWIuAEDIrwdjYvoXycW+IfzHMDY9AjRrjbZth2vO9QUSgG540qmHfntAz
	 RySVlLDji4dR0iuzX6xKaqhRKdsSrK73iLbFXZTz5ZHPnAfWzZ4mHHt/NWRmv83RQ0wWg
	 zJ067oZD3SA759R0Dn1bgn+0KSy/zGsQ0p1y8DJ2ZYXP4yJiv2D8knh9i3sbbodVUHLAF
	 v6BYrlrRod9Tx7F9JalucNJQgtQsDLOw7DcRtTQrdZG0FeWw67WxOB4hdIclbpbr6tA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613412;
	bh=+ZTzDu7/1ZkrKCykfYQUwITJFa2ohdRYbj2NfFLl9U8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KAHsd9EtMmJgGMiG4Udv76v+tgDgNkqxTlxy//TB0JU3IGLmgm9pFFZv5i21Xg207
	 Q80Y+C3hvGMSbTj1c5YjwTIM/GlhmM5TYsXhoTNZCQsA8kq7ZE/Cmr/SgxrL3rwdEq
	 q20Q5+4te6lcpi9H9EmI2Shbo8oMJEH73+YETSnsKHQN76e7i5Oy8Qns9o/Qp2aEcu
	 OFf4P1jlbzVhtdqgXlzSOuNor0HFvdxMlnL/1HRmc0KUxu0XbT+WnaMO8tcYdMqkSg
	 XvZ+BXxF8QhKqSwnmubNzGt8RLiDP2bIbHYw/U+gadbfWZAefaUn6iFlFmm5YsL2KK
	 TWnETzfN2h1ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152F440EF2;
	Wed, 21 Oct 2026 20:10:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8B9B95C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A6D04016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rnt-s3MZSXrW for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:10:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6A59A40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613409;
 b=QpcGJwcy3hIIkga7XRttMGIXnw0hYK5tTLDMsud2FljYJ3t4dD4N3HRabIUUTmspldt0
 L29+QI4LHzkbnwQvmMtWmPGF81tzVCVg+wHa2WEiHYpZ6SCu5cy5owibgXkGdQ4z6VGni
 Z+Yyt6k17/mTrTyIz8VcBrjLNf+5Y6fAG3cEYMza8QgSUAQWwwM6CVcZPyP25rdM2Ew39
 0lJ6jrT7QIgWLgY440ZLS/l13EHz/Y+utUWXhbgN6luE6qsixbrgEr9VI/ww6eekVO4aA
 UIO8J++c4xMmR+cRi5KgH0gb1NgkQ1CGS7VQANVZ5CjIagMGjNuhXh/+apxT9LU3NYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613409;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=K3SxhpQHE0PjZv59/Y53aJzgADsJi+GNNLoSsxmTdVw=;
 b=s2VWlTF4JiseJUWTnUMXDw9tQE/U3RSw8vFoB6ovMUwO4VIOw9AT9EaGYDSu0A3zP/G1
 pfFtkVJBctL5Gr8vMCa64vBHopqJbI2ToJGQeJMCrZzVomQ5ZVeCHO5LxLJHoiOFyrLl6
 T5TqwijGcJ8sqH8c4CWhJEsgCEKPBkoiI2e8ff4dVn9yN80WCqcCclgW34xdWsMYfr85L
 UtIXQikeyTH6mV3IOIWnXxobRbN9L0xjljJ/f/vIzkXEFTUxXNS1hUAnp1+tmPDA8OzQi
 6+/PLA3bIo2+DWBgEdhYjQWZR1QtfTpoVmnwyFfrMFqUWTAJyWHPLSaafjBp4XEZ7Qw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="p/RvMNKm"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A59A40042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:10:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D3B587808F9;
 Wed, 21 Oct 2026 22:10:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 21 Oct 2026 22:10:05 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 22:10:05 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261020192623.1982867-1-thomas.petazzoni@bootlin.com>
References: <20261020192623.1982867-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <4b2a2805c277ca677fb0f8715f6f990e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/libfm: fix build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjAvMTAvMjAyNiAyMToyNiwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IFRoZSBidWlsZCBmYWlscyB3aXRoIGdjYyAxNCwgZmlyc3Qgd2l0aDoKPiAKPiBhY3Rpb24u
YzogSW4gZnVuY3Rpb24g4oCYZm1fbG9hZF9hbGxfYWN0aW9uc+KAmToKPiBhY3Rpb24uYzoyMDUw
OjI1OiBlcnJvcjogYXNzaWdubWVudCB0byDigJhnY2hhciAqKuKAmSB7YWthIOKAmGNoYXIgKiri
gJl9IGZyb20gCj4gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSDigJhjb25zdCBnY2hhciAqIGNv
bnN0KuKAmSB7YWthIOKAmGNvbnN0IGNoYXIgKiAKPiBjb25zdCrigJl9Cj4gWy1XaW5jb21wYXRp
YmxlLXBvaW50ZXItdHlwZXNdCj4gIDIwNTAgfCAgICAgICAgIF90bXAyXyA9IF90bXAxXyA9IGdf
Z2V0X3N5c3RlbV9kYXRhX2RpcnMgKCk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICBeCj4gCj4gVGhpcyBpcyBhbiBpc3N1ZSBpbiB0aGUgcHJlLWdlbmVyYXRlZCBDIGNvZGUsIGdl
bmVyYXRlZCBmcm9tIFZhbGEgc28KPiB3ZSBjYW5ub3QgZWFzaWx5IGZpeCBpdC4gU2luY2UgaXQn
cyBhcHBhcmVudGx5IHVzZWQgZm9yIHNvbWUgIm9sZAo+IGFjdGlvbnMiIGNvZGUsIHdlIHNpbXBs
eSBkaXNhYmxlIGl0Lgo+IAo+IFRoZW4gdGhlIGJ1aWxkIGZhaWxzIHdpdGg6Cj4gCj4gZ3RrL2Zt
LWRuZC1kZXN0LmM6NDYxOjEzOiBlcnJvcjogYXNzaWdubWVudCB0byDigJhHdGtNZW51ICrigJkg
e2FrYSDigJhzdHJ1Y3QgCj4gX0d0a01lbnUgKuKAmX0gZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRl
ciB0eXBlIOKAmEd0a1dpZGdldCAq4oCZIHtha2Eg4oCYc3RydWN0IAo+IF9HdGtXaWRnZXQgKuKA
mX0gWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gICAgICAgfCAgICAgICAgICAgICBe
Cj4gCj4gYW5kOgo+IAo+IGJhc2UvZm0tZHVtbXktbW9uaXRvci5jOjQ4OjIyOiBlcnJvcjogYXNz
aWdubWVudCB0byDigJhnYm9vbGVhbiAKPiAoKikoR0ZpbGVNb25pdG9yICop4oCZIHtha2Eg4oCY
aW50ICgqKShzdHJ1Y3QgX0dGaWxlTW9uaXRvciAqKeKAmX0gZnJvbSAKPiBpbmNvbXBhdGlibGUg
cG9pbnRlciB0eXBlIOKAmGdib29sZWFuICgqKSh2b2lkKeKAmSB7YWthIOKAmGludCAoKikodm9p
ZCnigJl9IAo+IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgXgo+IAo+IEJvdGggb2Ygd2hpY2ggYXJlIGZpeGVkIGJ5IGJhY2twb3J0
aW5nIHVwc3RyZWFtIHBhdGNoZXMuCj4gCj4gVGhlcmUgYXJlIG5vIGF1dG9idWlsZGVyIGZhaWx1
cmVzLCBidXQgdGhlIGJ1aWxkIGZhaWx1cmUgY2FuIGJlCj4gcmVwcm9kdWNlZCB1c2luZzoKPiAK
PiAgQlIyX2FhcmNoNjQ9eQo+ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiAgQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9DVVNUT009eQo+ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0RPV05MT0FE
PXkKPiAgCj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9VUkw9Imh0dHA6Ly90b29sY2hhaW5zLmJv
b3RsaW4uY29tL2Rvd25sb2Fkcy9yZWxlYXNlcy90b29sY2hhaW5zL2FhcmNoNjQvdGFyYmFsbHMv
YWFyY2g2NC0tZ2xpYmMtLXN0YWJsZS0yMDI1LjA4LTEudGFyLnh6Igo+ICBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMX0dDQ18xND15Cj4gIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfSEVBREVSU181XzQ9
eQo+ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0NVU1RPTV9HTElCQz15Cj4gICMgQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9JTkVUX1JQQyBpcyBub3Qgc2V0Cj4gIEJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQ1hYPXkKPiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9PUEVOTVA9eQo+ICBCUjJfUEFDS0FH
RV9NRVNBM0Q9eQo+ICBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfU09GVFBJUEU9
eQo+ICBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0dMWD15Cj4gIEJSMl9QQUNLQUdFX1hPUkc3
PXkKPiAgQlIyX1BBQ0tBR0VfUENNQU5GTT15Cj4gCj4gV2l0aCB0aGlzIGZpeCwgbGliZm0gYnVp
bGRzIGZpbmUgdXAgdG8gYW5kIGluY2x1ZGluZyBnY2MgMTYuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KClNlcmllcyBh
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
