Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFDDC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 22:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2446E81E34;
	Sun, 17 Dec 2023 22:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2446E81E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Woeisl9JZccE; Sun, 17 Dec 2023 22:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2073A81A64;
	Sun, 17 Dec 2023 22:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2073A81A64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA69B1BF371
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91C7B60A84
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C7B60A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FU7AzuaYWb2 for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 22:03:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E15EA608A6
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15EA608A6
Received: by mail.gandi.net (Postfix) with ESMTPSA id E37EAFF805;
 Sun, 17 Dec 2023 22:03:04 +0000 (UTC)
Date: Sun, 17 Dec 2023 23:03:03 +0100
To: Ralf Dragon <hypnotoad@lindra.de>
Message-ID: <20231217230303.3200b052@windsurf>
In-Reply-To: <20231212160112.94272-1-hypnotoad@lindra.de>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702850585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoqAY/VlaJOXIIIIeOB9ojUQQtXPFIEuh9PFQtsJSCw=;
 b=gmGYgYi6NwsHMiI2S4UOEzFQ/PLhsPx4S6S9y8GyCAmcbvTD0cFTx3nHWzUxgoFqYUSyjs
 AcqzbqkhgcKTQVYYKUu7QbdWwxldj/igkPH6tmmFIO2F7ioCWkAKffjoAmxKrj3IPXIe+i
 34RAedaKl8jqFz9j+Hvgr3y9Iti1kYYgtPwxdcPrHWNLw2ffrtIS0FCtq4rA+x8VGe1ntH
 +0gh0zHxgvJH7IdhrMfc9IRpzt3o0IhodKQIdGWIWaui3loQlrZj0u86rTGf7PHA6LbOZB
 Zl4frHfPYLWAdQToNTQwOoz2Enaecuqoz+qpxXvy6ZLFaFjdaPMH32Tj+u6qig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gmGYgYi6
Subject: Re: [Buildroot] [PATCH 1/2] python-sip: fix compile error
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
Cc: gwenhael.goavec-merou@trabucayre.com, yann.morin.1998@free.fr,
 asafka7@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFsZiwKClRoYW5rcyBmb3IgdGhlIHBhdGNoISBJIGhhdmUgYXBwbGllZCBpdCwgd2l0
aCBzb21lIGNoYW5nZXMsIHNlZSBiZWxvdy4KCk9uIFR1ZSwgMTIgRGVjIDIwMjMgMTc6MDE6MTEg
KzAxMDAKUmFsZiBEcmFnb24gPGh5cG5vdG9hZEBsaW5kcmEuZGU+IHdyb3RlOgoKPiBXaXRob3V0
IHRoZSBwYXRjaCwgcHl0aG9uLXNpcCBmYWlscyB0byBjb21waWxlIHdpdGg6Cj4gCj4gc2lwbGli
LmM6IEluIGZ1bmN0aW9uIOKAmHNpcF9hcGlfZ2V0X2ZyYW1l4oCZOgo+IHNpcGxpYi5jOjEzNzUw
OjIyOiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgdW5kZWZpbmVkIHR5cGUg4oCYc3RydWN0IF9mcmFt
ZeKAmQo+IDEzNzUwIHwgICAgICAgICBmcmFtZSA9IGZyYW1lLT5mX2JhY2s7Cj4gCj4gVGhpcyBs
aWtlbHkgZml4ZXMgYnVnIDE1MjAxIFsxXS4KPiAKPiBbMV0gaHR0cHM6Ly9idWdzLmJ1aWxkcm9v
dC5vcmcvc2hvd19idWcuY2dpP2lkPTE1MjAxCgpJIGFtIG5vdCBzdXJlIGl0IGZpeGVzIHRoaXMg
YnVnLiBUaGlzIGJ1ZyBpcyBtb3JlIGFib3V0IHVwZ3JhZGluZwpweXRob24tc2lwLCB3aGljaCBp
bmRlZWQgd291bGQgYmUgdmVyeSBuaWNlIHRvIGRvIGFzIFNJUCA0LnggaXMgbm8KbG9uZ2VyIG1h
aW50YWluZWQsIGFzIHlvdSBwb2ludGVkIG91dC4KCkhvd2V2ZXIsIHlvdXIgcGF0Y2ggZml4ZXMK
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvN2IwMTczOWU3NTE0ZTQ4YzA2
MTgyYmMxODA0YjMyNDk3Y2UyZTQxNC8KZm9yIHN1cmUsIHNvIEkndmUgdXNlZCB0aGF0IGluIHRo
ZSBjb21taXQgbG9nLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2lwLzAwMDItZml4
ZnJhbWUucGF0Y2ggYi9wYWNrYWdlL3B5dGhvbi1zaXAvMDAwMi1maXhmcmFtZS5wYXRjaAo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYmVmZTc2ZmM3Mwo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zaXAvMDAwMi1maXhmcmFtZS5wYXRjaAo+
IEBAIC0wLDAgKzEsNTUgQEAKPiArc2lwbGliOiBmaXggYnVpbGQgd2l0aCBweXRob24gPj0gMy4x
MQo+ICsKPiArV2l0aCBweXRob24gMy4xMSwgdGhlIFB5RnJhbWVPYmplY3Qgc3RydWN0dXJlIG1l
bWJlcnMgaGF2ZSBiZWVuCj4gK3JlbW92ZWQgZnJvbSB0aGUgcHVibGljIEMgQVBJOgo+ICsKPiAr
aHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy4xMS93aGF0c25ldy8zLjExLmh0bWwjd2hhdHNuZXcz
MTEtYy1hcGktcG9ydGluZwo+ICtodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3
LzMuMTEuaHRtbCNweWZyYW1lb2JqZWN0LTMtMTEtaGlkaW5nCj4gKwo+ICtUaGlzIHBhdGNoIG1p
Z3JhdGVzIHRvIHRoZSBvcGFxdWUgUHlGcmFtZU9iamVjdC4KPiArCj4gK1NpZ25lZC1vZmYtYnk6
IFJhbGYgRHJhZ29uIDxoeXBub3RvYWRAbGluZHJhLmRlPgo+ICtVcHN0cmVhbTogTi9BIGFzIFNJ
UCB2NCBpcyBubyBsb25nZXIgc3VwcG9ydGVkLiA0LjE5LjI1IGlzIHRoZSBsYXN0IHJlbGVhc2Uu
CgpJIHJlZm9ybWF0dGVkIHRoaXMgcGF0Y2ggdXNpbmcgImdpdCBmb3JtYXQtcGF0Y2giIHRvIGJl
IGxpa2UgcGF0Y2gKMDAwMS4gSSBhbHNvIHNsaWdodGx5IGltcHJvdmVkIHRoZSBjb21taXQgbG9n
LgoKU2VlIHRoZSBmaW5hbCBjb21taXQ6CgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8zZWY2ODg0ZTZkNTk3NDRkODM2NDkxNzA4MjJhNDgyOWVl
ZDE0NmZjCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93
bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
