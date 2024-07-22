Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4957CC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E29402BB;
	Mon, 22 Jul 2024 16:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYIKtmuDrpZR; Mon, 22 Jul 2024 16:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C796C40331
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C796C40331;
	Mon, 22 Jul 2024 16:32:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B61491BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3BA76059E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OHiHVbctiDs for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AECD6058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AECD6058B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AECD6058B
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:32:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41F47C000C;
 Mon, 22 Jul 2024 16:31:58 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:31:57 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240722183157.103992e5@windsurf>
In-Reply-To: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
References: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LndIfHHL92muuzY0YtuGAkXyhX0pbXTrD4ZDTt4JMk=;
 b=Wo9PYHm2+Eri+HYtH7dYHgq6YKV2dcT9vq91m8z2ifuqrwIuZrziMoEonBH6b1VIxFKMyG
 Phu+5PpU1MUOlUCdO0g9CrGu5+TIUaDgpwtQrnpNTsAksqsPFDS8r/bg6RIy84rj0u+P/f
 F0Wco7xlf7aUREg6y57PXkEI/SIiE3wcXYkW4wx/VYMZ9lAid+Mf4dTcio7uB7lGWlufyl
 nyFkYCpmvvu14AFSASc/0MkeS7W2s76ItB1mCpzWJWc36f38lQPpr/ZUiQAbV+9C0jTJmM
 IB8ch5oRxEC2VrJFvKq5QxT9HZVXQR2qrtKogf0EEK2604EJOAh/dV/pNUQRdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wo9PYHm2
Subject: Re: [Buildroot] [PATCH v5] Config.in: ban textrels on musl
 toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSiwKCk9uIEZyaSwgMTkgSnVsIDIwMjQgMTc6Mjc6MTkgKzAyMDAKSi4gTmV1c2Now6Rm
ZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBtdXNs
LWxpYmMgZG9lc24ndCBzdXBwb3J0IFRFWFRSRUxzWzFdIGFuZCBwcm9ncmFtcyB3aXRoIFRFWFRS
RUxzIHdpbGwKPiBjcmFzaCBvbiBzdGFydC11cCB1bmRlciBtdXNsLgo+IAo+IFRoaXMgcGF0Y2gg
Zm9yYmlkcyB0aGUgdXNlIG9mIFRFWFRSRUxzIG9uIG11c2wgdG9vbGNoYWlucyB3aXRoIGR5bmFt
aWMKPiBsaW5raW5nLgo+IAo+IFRvIHZlcmlmeSB0aGlzIHBhdGNoOgo+IAo+IC0gRGVsZXRlIHBh
Y2thZ2UvbWljcm9weXRob24vMDAwMS1weS1ubHJ0aHVtYi1NYWtlLW5vbi1UaHVtYjItbG9uZy1q
dW1wLXdvcmthcm91bmQtb3B0LnBhdGNoCj4gLSBCdWlsZCBtaWNyb3B5dGhvbiAoYmVmb3JlIHYx
LjIzKSB3aXRoIGEgbXVzbCB0b29sY2hhaW4gYW5kCj4gICBCUjJfU0hBUkVEX0xJQlMuIFRoZSBi
dWlsZCBzaG91bGQgYWJvcnQgd2hpbGUgbGlua2luZyBtaWNyb3B5dGhvbi4KPiAKPiBbMV06IGh0
dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0cy9tdXNsLzIwMjAvMDkvMjUvNAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gLS0tCj4g
Q2hhbmdlcyBpbiB2NToKPiAtIEZpeCBib29sZWFuIGxvZ2ljIChpZmVxLi4uKQo+IC0gTGluayB0
byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDcxOC16dGV4dC12NC0xLTE1YTk3
NDRmMWVkYkBnbXgubmV0CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLiBJZiB5b3UgY291bGQK
bW9uaXRvciBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvP2xpYmM9bXVzbCBpbiB0aGUg
bmV4dApmZXcgZGF5cyB0byBjaGVjayBmb3IgYW55IGlzc3VlIHJlbGF0ZWQgdG8gdGhpcyBjaGFu
Z2UsIGl0IHdvdWxkIGJlCm5pY2UuIFRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
