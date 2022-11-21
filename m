Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A89DC433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D334481E80;
	Mon, 21 Nov 2022 21:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D334481E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id giNJNWTCpr54; Mon, 21 Nov 2022 21:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF9981E7A;
	Mon, 21 Nov 2022 21:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF9981E7A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E046A1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3E2E60F58
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3E2E60F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtROMNJ0Au8k for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:17:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC78060F2E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC78060F2E
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:17:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D61AE13F854;
 Mon, 21 Nov 2022 22:17:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 22:17:07 +0100
Date: Mon, 21 Nov 2022 22:17:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Anisse Astier <anisse@astier.eu>
Message-ID: <20221121211707.GN2516@scaer>
References: <20221120181955.851456-1-anisse@astier.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120181955.851456-1-anisse@astier.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669065429;
 bh=QZ4qRpnx38QNigD4AEGV9u/OhdQLiYamCtfA07cDjIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIkDaDtRCIk7ka2CAQzg+e8w4IEMjokQosXZJMeQWUNHzaKYK8oaLp+ndQKPZOEC4
 nviREzGmqAbdcAVkbqVITxqwAVmIOzsgojL8DtpczFDjuU2s0Ye76rZWIASWCfxxrr
 Ub0/oBWYs0rNeKK7BWcy9YXb15MLNdiua7okb0W8ZlQwJsInw+VjsWOSEC4f0IMXqK
 2ROFkftJS89ezpACx9kTWxUhCGrdnfWuExpK0wQadKcmh4yA8V+IY14rePCtHN1utG
 v0LypuzcEDCnV/GVF9mv7VM7lw7IVyGbIQK5JtXyMneqn13DJuvBwsZ7dzEyKD4hQk
 oi4SK+PpV4TYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LIkDaDtR
Subject: Re: [Buildroot] [PATCH RFC] package/go: disable cgo support with
 static libs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW5pc3NlLCBBbGwsCgpJbiBhZGRpdGlvbiB0byB0aGUgZmVlZGJhY2sgZnJvbSBCYXJ1Y2gsIHNl
ZSBiZWxvdy4uLgoKT24gMjAyMi0xMS0yMCAxOToxOSArMDEwMCwgQW5pc3NlIEFzdGllciBzcGFr
ZSB0aHVzbHk6Cj4gVGhlIGdvIHN0ZGxpYiAicGx1Z2luIuKAr3BhY2thZ2UgcmVsaWVzIG9uIGRs
ZmNuLmggd2hpY2ggaXNuJ3QgYXZhaWxhYmxlCj4gd2hlbiB3ZSBoYXZlIEJSMl9TVEFUSUNfTElC
Uz15Lgo+IAo+IFRoaXMgc2hvdWxkIGZpeCB0aGlzIGJ1aWxkIGVycm9yIGZyb20gYXV0b2J1aWxk
ZXJzOgo+IAo+IC9idWlsZHJvb3QvaTY4Ni1ob3N0Z28tZmFpbC9idWlsZC9ob3N0LWdvLTEuMTku
My9zcmMvcGx1Z2luL3BsdWdpbl9kbG9wZW4uZ286MTE6MTA6IGZhdGFsIGVycm9yOiBkbGZjbi5o
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgMTEgfCAjaW5jbHVkZSA8ZGxmY24uaD4K
PiAKPiBUaGUgbW9yZSBsb25ndGVybSBhcHByb2FjaCB3b3VsZCBiZSB0byBhc2sgdXBzdHJlYW0g
Zm9yIGEgYnVpbGQgdGFnIHRvCj4gZGlzYWJsZSB0aGUgcGx1Z2luIHBhY2thZ2UsIGFraW4gdG8g
dGhlIG9zdXNlcmdvIG9yIG5ldGdvIHRhZ3M6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2dvbGFu
Zy9nby9pc3N1ZXMvMjMyNjUKPiAKPiBXaGlsZSBpdCB3b3VsZCBiZSBxdWl0ZSBzaW1wbGUsIEkg
ZG9uJ3QgdGhpbmsgYSBidWlsZHJvb3QgcGF0Y2ggZm9yIHRoaXMKPiB3aXRob3V0IHVwc3RyZWFt
IHN1cHBvcnQgd291bGQgYmUgaWRlYWwuCgpObyBmaXJzdC1wZXJzb24gc2VudGVuY2VzIGluIGNv
bW1pdCBsb2cuIEluc3RlYWQ6CgogICAgV2hpbGUgaXQgd291bGQgYmUgcXVpdGUgc2ltcGxlLCB3
ZSBkbyBub3Qgd2FudCB0byBjYXJyeSBzdWNoIGEKICAgIGZlYXR1cmUgcGF0Y2ggaW4gQnVpbGRy
b290LCBlc3BlY2lhbGx5IHNpbmNlIG5vbmUgaGFzIHlldCBiZWVuCiAgICBzdWJtaXR0ZWQgdXBz
dHJlYW0uCgpCdXQgYXMgeW91IHN0YXRlIHRoYXQgaXQgc2hvdWxkIGJlIHJsYXRpdmVseSBlYXN5
LCBtYXliZSB5b3UgY2FuIHB1c2gKc3VjaCBhIHBhdGNoIHVwc3RyZWFtPyBUaGVuLCBkZXBlbmRp
bmcgb24gdXBzdHJlYW0ncyBmZWVkYmFjaywgd2UgY291bGQKYmFja3BvcnQgaXQuLi4KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2dvL2dvLm1rIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9nby9nby5tayBiL3BhY2thZ2UvZ28vZ28ubWsKPiBpbmRleCBmZDRjYWEy
ZTVhLi4xYzNjZmE5NGQ0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ28vZ28ubWsKPiArKysgYi9w
YWNrYWdlL2dvL2dvLm1rCj4gQEAgLTg3LDcgKzg3LDcgQEAgSE9TVF9HT19UQVJHRVRfRU5WID0g
XAo+ICAjIHNldCwgYnVpbGQgaW4gY2dvIHN1cHBvcnQgZm9yIGFueSBnbyBwcm9ncmFtcyB0aGF0
IG1heSBuZWVkIGl0LiAgTm90ZSB0aGF0Cj4gICMgYW55IHRhcmdldCBwYWNrYWdlIG5lZWRpbmcg
Y2dvIHN1cHBvcnQgbXVzdCBpbmNsdWRlCj4gICMgJ2RlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUycgaW4gaXRzIGNvbmZpZyBmaWxlLgo+IC1pZmVxICgkKEJSMl9UT09MQ0hBSU5f
SEFTX1RIUkVBRFMpLHkpCj4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUykkKEJS
Ml9TVEFUSUNfTElCUykseW4pCj4gIEhPU1RfR09fQ0dPX0VOQUJMRUQgPSAxCj4gIGVsc2UKPiAg
SE9TVF9HT19DR09fRU5BQkxFRCA9IDAKPiAtLSAKPiAyLjM4LjEKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
CnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERl
c2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2
MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8g
IFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
