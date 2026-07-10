Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8F7C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 23:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8263C60A90;
	Fri, 10 Jul 2026 23:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWvb1gAcEhOW; Fri, 10 Jul 2026 23:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E1DC60A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783724654;
	bh=GaTWy4akZggBDYrm6iRF47lSN5LDWnDT2OG+uyQfDJI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C3bn7qJfjkimTMdoieF7Urxg8WnjORys7uIQQSCRvc+Q+pG4lBt8F7m4x6BAJjvh/
	 8UmA0IB26jaC7jkUnycgNfr2WMtqrBAQoQ59baGRgrCmcys6L7LN8DBFisZut9PYdq
	 CRI/Nlm75xjqahQYgakC+MoI6Oohvq0coDjYyxgRMSsZPf3XdUIyQ2ux817VLOCtWw
	 nEx/36lBvFYSIkUXu2RuO0Fl+ItjIVDu6iexi02njl1OE3CvkK5p30oKe2BEmJLDWp
	 BfEMK/B1m/Kxid7EphwraFaDvciHRrRdRi08G1trlhkpoVaSUkNcJy4TcsopdxmcUn
	 GDMnAbM01743Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1DC60A98;
	Fri, 10 Jul 2026 23:04:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86CF3372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CF9040AD0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4DiVQ0-6UYY for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 23:04:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1F4240AC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F4240AC7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1F4240AC7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:04:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1OXT-1xBDwB3m15-0163cn; Sat, 11
 Jul 2026 01:04:09 +0200
Message-ID: <c0070672-b8e2-4074-bba6-5aaea533386e@gmx.de>
Date: Sat, 11 Jul 2026 01:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260605-p11-v1-0-f3a206958d94@arm.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20260605-p11-v1-0-f3a206958d94@arm.com>
X-Provags-ID: V03:K1:/k8CHV5laSyBQ3g8YsqccTGhd/07rKROumTQzQl+qA/D04xbMlT
 4tzB9kVTF4g4wCAnZzSdPlKcHVMxh/HwIJlQ9uose2safUTTUmt86rM3K9gNTRDHe+ltNX4
 hOHkZk5ICvdmJGAWisRwssY4rBRtsVxgU6taXPM/Ca//KDOsUbgYcsfmy2FPIhv4OGUmokt
 pkZeuQG+DKbbmUmKAVheQ==
UI-OutboundReport: notjunk:1;M01:P0:mkE+8NxwC0k=;yQOee7BuFj5pphi/0gknVcC6IB+
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783724649; x=1784329449; i=fiona.klute@gmx.de;
 bh=/Y/UpTRH0ym0xbHiDbagZw7pnoYAkvv6B4Do0ualE00=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=f1BIlVkC/0I0Kj8kN3sw33UWt1INfxNWmIYOEd7PXKuxiySka7Tf9+cetxZtbsd2
 oJFrfZALmMSzQSnrCj6TziYQ++X1iJH65NWYaJu9em3T2h+C54E/tm9g7rHRBj/KD
 l8LQgF/EDNqmDOj+PtZJywgN+OYbUfWqIB8MAbk1bxfLUs3UIqeyGd0/OpylCttOu
 IQKZgrlP2Hpz8dq4f0d80lr4vRjR3ZyZ6PiMNeej6WumG+oQPLnEqCnPJBZmuDhCb
 Ee1Zv8oo70ERk9QQYLFZGqvW8AkfuUXHHPargavEmT2j0XJYLOP00UoO5pkeKo6JL
 y0d7RmuYfAqs7DTnmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=f1BIlVkC
Subject: Re: [Buildroot] [PATCH next 0/2] Add support for pkcs11 to
 host-gnutls
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDUuMDYuMjYgdW0gMTE6NDMgc2NocmllYiBWaW5jZW50IFN0ZWhsw6k6Cj4gRnV0dXJlIFUt
Qm9vdCAyMDI2LjA3IHdpbGwgYnVpbGQgbWtlZmljYXBzdWxlIHdpdGggcGtjczExIHN1cHBvcnQu
IFsxXQo+IAo+IFRoaXMgY2F1c2VzIGxpbmsgZXJyb3JzIHdpdGggQnVpbGRyb290LCBzdWNoIGFz
IHRoZSBmb2xsb3dpbmcgb25lOgo+IAo+ICAgIG1rZWZpY2Fwc3VsZS5jOigudGV4dC5zdGFydHVw
KzB4Y2QzKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZ251dGxzX3BrY3MxMV9pbml0Jwo+IAo+
IChPdGhlciBzeW1ib2xzIHRoZSBsaW5rZXIgY29tcGxhaW5zIGFib3V0IGFyZTogZ251dGxzX3Br
Y3MxMV9hZGRfcHJvdmlkZXIsCj4gZ251dGxzX3BrY3MxMV9vYmpfbGlzdF9pbXBvcnRfdXJsNCwg
Z251dGxzX3g1MDlfY3J0X2ltcG9ydF9wa2NzMTEgYW5kCj4gZ251dGxzX3BrY3MxMV9kZWluaXQu
KQo+IAo+IFRoZSBmb2xsb3dpbmcgZXhhbXBsZSBjb21tYW5kcyBjYW4gYmUgdXNlZCB0byByZXBy
b2R1Y2UgdGhlIGlzc3VlOgo+IAo+ICAgIG1ha2UgcWVtdV9hYXJjaDY0X2ViYnJfZGVmY29uZmln
Cj4gICAgZWNobyAnQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNi4w
Ny1yYzMiJyA+Pi5jb25maWcKPiAgICBlY2hvICdCUjJfVEFSR0VUX1VCT09UX05FRURTX0dOVVRM
Uz15JyA+Pi5jb25maWcKPiAgICBlY2hvICcjIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNI
RVMgaXMgbm90IHNldCcgPj4uY29uZmlnCj4gICAgbWFrZSBvbGRkZWZjb25maWcKPiAgICBtYWtl
IHVib290Cj4gCj4gVGhpcyBzZXJpZXMgZG9lcyB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8gc29s
dmUgdGhpcyBpc3N1ZToKPiAxLiBFbmFibGUgaG9zdCBjb21waWxhdGlvbiBmb3IgcDExLWtpdAo+
IDIuIEJ1aWxkIGhvc3QtZ251dGxzIHdpdGggcGtjczExIHN1cHBvcnQsIGxldmVyYWdpbmcgdGhl
IG5ldyBob3N0LXAxMS1raXQuCj4gCj4gRm9yIHRoZSBzYWtlIG9mIHNpbXBsaWNpdHksIHBrY3Mx
MSBzdXBwb3J0IGlzIGFkZGVkIHVuY29uZGl0aW9uYWxseSB0bwo+IGhvc3QtZ251dGxzLiBJZiB0
aGlzIGlzIHByZWZlcnJlZCwgYSBjb25maWcgb3B0aW9uIGNvdWxkIGJlIGFkZGVkIGluc3RlYWQu
Cj4gCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvY29tbWl0LzBjNzE2
YTE1N2JlNDYwMDA2YTRiNzYyNjI1ZGUzMjliNWUzNmRiZjkgWzFdCj4gU2lnbmVkLW9mZi1ieTog
VmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgoKU2VyaWVzIGFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFuayB5b3UhCgo+IC0tLQo+IFZpbmNlbnQgU3RlaGzDqSAoMik6Cj4gICAg
ICAgIHBhY2thZ2UvcDExLWtpdDogZW5hYmxlIGhvc3QgYnVpbGQKPiAgICAgICAgcGFja2FnZS9n
bnV0bHM6IGFkZCBob3N0IHN1cHBvcnQgZm9yIHBrY3MxMQo+IAo+ICAgcGFja2FnZS9nbnV0bHMv
Z251dGxzLm1rICAgfCA1ICsrKy0tCj4gICBwYWNrYWdlL3AxMS1raXQvcDExLWtpdC5tayB8IDkg
KysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IDMyMzUxZjk3OTgyMmEwYjNhNDViODJjMmQ4MmJk
YjIzMjhiMDJmNWEKPiBjaGFuZ2UtaWQ6IDIwMjYwNjAzLXAxMS01M2E2Zjg3YzdkMmUKPiAKPiBC
ZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
