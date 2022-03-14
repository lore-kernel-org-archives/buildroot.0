Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903DAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 08:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BBA04026F;
	Mon, 14 Mar 2022 08:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7km5rmC6cm2P; Mon, 14 Mar 2022 08:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBFC240182;
	Mon, 14 Mar 2022 08:49:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F003D1BF38C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 08:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF042819B8
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 08:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WR1nDKZBKDJy for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 08:49:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7128B81854
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 08:49:21 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2337A100007;
 Mon, 14 Mar 2022 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647247758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqkCMtmo7bv16ioTQTjfVu0U510ZeksNE5Uytr5mcno=;
 b=hDnJhLnCkbL+aR3G4bZJJiXQhwMkJPJItayWfZZF8dqJeIHjpIHT1wz2Zw/6pDGnIHwzxe
 c9T3sAQ7ksQHnRgNyih9nyeQaLNUG1YVEFHVnsTyIPeFtRZjewZ3ur7qKpPJp35rLk+NTD
 dVIcX4qXLnDSDFY0M5HWRP8NsZxx8bbPaLyLs2fBdhrPYtr4QzNIrd7kQbkA8SvKKNa5ed
 dpQO4UZZwi171e+KNhByzZTVJADL1n1WRMxSINIxg7CKmjxMAj1vfaRTh3HlNzVxgOtXY6
 1ugEvI8yiEnaXlfHYj5qpdmYYxhm6Te/XI7h3YnFHwxzrlqufmJginBfPlljgQ==
Date: Mon, 14 Mar 2022 09:47:52 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220314094752.7ea852c1@fixe.home>
In-Reply-To: <20220312155913.280739e0@windsurf>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
 <20220311123636.13415-2-clement.leger@bootlin.com>
 <20220312155913.280739e0@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/7] package/python-cryptography: enable
 host package
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgU2F0LCAxMiBNYXIgMjAyMiAxNTo1OToxMyArMDEwMCwKVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgoKPiBIZWxsbywKPiAKPiBPbiBG
cmksIDExIE1hciAyMDIyIDEzOjM2OjMwICswMTAwCj4gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50
LmxlZ2VyQGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiA+IEVuYWJsZSBob3N0IHBhY2thZ2UgYW5k
IGFkZCBuZWVkZWQgZGVwZW5kZW5jaWVzLgo+ID4gCj4gPiBBY2tlZC1ieTogRXRpZW5uZSBDYXJy
aWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgcGFj
a2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsgfCA3ICsrKysr
KysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayBi
L3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gPiBp
bmRleCBhNTI0ZjcyOWM4Li40ZmY2MWM3Zjg2IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9weXRo
b24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsKPiA+ICsrKyBiL3BhY2thZ2Uv
cHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gPiBAQCAtMTcsNiAr
MTcsMTEgQEAgUFlUSE9OX0NSWVBUT0dSQVBIWV9ERVBFTkRFTkNJRVMgPSBcCj4gPiAgCWhvc3Qt
cHl0aG9uLWNmZmkgXAo+ID4gIAlob3N0LXJ1c3RjIFwKPiA+ICAJb3BlbnNzbAo+ID4gK0hPU1Rf
UFlUSE9OX0NSWVBUT0dSQVBIWV9ERVBFTkRFTkNJRVMgPSBcCj4gPiArCWhvc3QtcHl0aG9uLXNl
dHVwdG9vbHMtcnVzdCBcCj4gPiArCWhvc3QtcHl0aG9uLWNmZmkgXAo+ID4gKwlob3N0LXJ1c3Rj
IFwKPiA+ICsJb3BlbnNzbCAgCj4gCj4gQWxzbywgSSBhbSBhY3R1YWxseSBzdXJwcmlzZWQgdGhp
cyBpcyBlbm91Z2guIEluZGVlZCwgdGhlcmUgYXJlIHNvbWUKPiBwYXJ0cyBpbiBSdXN0IGluIHB5
dGhvbi1jcnlwdG9ncmFwaHksIHNvIHdlIGhhdmUgcXVpdGUgc29tZSBleHRyYQo+IHZhcmlhYmxl
cyBmb3IgdGhlIHRhcmdldCBwYWNrYWdlcyB0byBoYW5kbGUgdGhpczoKPiAKPiBQWVRIT05fQ1JZ
UFRPR1JBUEhZX0VOViA9IFwKPiAgICAgICAgICQoUEtHX0NBUkdPX0VOVikgXAo+ICAgICAgICAg
UFlPM19DUk9TU19MSUJfRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9O
M19WRVJTSU9OX01BSk9SKSIKPiAjIFdlIG5lZWQgdG8gdmVuZG9yIHRoZSBDYXJnbyBjcmF0ZXMg
YXQgZG93bmxvYWQgdGltZQo+IFBZVEhPTl9DUllQVE9HUkFQSFlfRE9XTkxPQURfUE9TVF9QUk9D
RVNTID0gY2FyZ28KPiBQWVRIT05fQ1JZUFRPR1JBUEhZX0RPV05MT0FEX0RFUEVOREVOQ0lFUyA9
IGhvc3QtcnVzdGMKPiBQWVRIT05fQ1JZUFRPR1JBUEhZX0RMX0VOViA9IFwKPiAgICAgICAgIEJS
X0NBUkdPX01BTklGRVNUX1BBVEg9c3JjL3J1c3QvQ2FyZ28udG9tbAo+IAo+IEZvciB0aGUgbGFz
dCAzIHZhcmlhYmxlcywgSSBjYW4gZXhwbGFpbiB0aGF0IGl0IHBvc3NpYmx5IHdvcmtlZCBmb3Ig
eW91Cj4gYmVjYXVzZSB5b3UgcGVyaGFwcyBhbHJlYWR5IGhhZCB0aGUgcHl0aG9uLWNyeXB0b2dy
YXBoeSB0YXJiYWxsIGluCj4gRExfRElSIGRvd25sb2FkZWQgYnkgdGhlIGhvc3QgdmFyaWFudCBv
ZiB0aGUgcGFja2FnZS4gQnV0IGlmIHlvdSByZW1vdmUKPiB0aGlzIHRhcmJhbGwsIGFuZCBidWls
ZCBqdXN0IHRoZSBob3N0IHZhcmlhbnQsIEkgd291bGQgc3VzcGVjdCB0aGF0IGl0Cj4gd2lsbCBm
YWlsIHRvIGJ1aWxkLgoKSW5kZWVkLCBJJ20gdXNpbmcgYSBzaGFyZWQgQlIyX0RMX0RJUiB3aGlj
aCBtaWdodCBleHBsYWluIHdoeSBpdCB3b3JrZWQuCgo+IAo+IEhvd2V2ZXIsIEkgY2FuJ3QgcmVh
bGx5IGV4cGxhaW4gd2h5IHlvdXIgcGFja2FnZSB3b3JrcyB3aXRob3V0Cj4gSE9TVF9QWVRIT05f
Q1JZVE9HUkFQSFlfRU5WLgo+IAo+IE1ha2Ugc3VyZSB0byBkbyBhIGNsZWFuIGJ1aWxkIGluIGEg
RG9ja2VyIGNvbnRhaW5lciB0aGF0IGRvZXNuJ3QgaGF2ZQo+IFJ1c3QgaW5zdGFsbGVkICh0aGVy
ZSBpcyBhbiBvZmZpY2lhbCBCdWlsZHJvb3QgRG9ja2VyIGltYWdlIHRoYXQgaXMKPiBhdmFpbGFi
bGUgZm9yIHRoaXMga2luZCBvZiB0ZXN0aW5nKS4KCk9rLCBJJ2xsIGRvIHRoYXQuCgo+IAo+IFRo
YW5rcyEKPiAKPiBUaG9tYXMKCgoKLS0gCkNsw6ltZW50IEzDqWdlciwKRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlciBhdCBCb290bGluCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
