Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9396C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:01:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016FB61027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 016FB61027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C650C60690;
	Sun, 14 Nov 2021 13:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMw9XD3BPpzW; Sun, 14 Nov 2021 13:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E4160687;
	Sun, 14 Nov 2021 13:01:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44DF91BF228
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4101760687
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTZ_FBtQAg-O for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:01:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E24DF60667
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:00:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F3003240004;
 Sun, 14 Nov 2021 13:00:56 +0000 (UTC)
Date: Sun, 14 Nov 2021 14:00:55 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211114140055.61997bd6@windsurf>
In-Reply-To: <20211113180206.GT247986@scaer>
References: <20211113141703.1124706-1-thomas.petazzoni@bootlin.com>
 <20211113180206.GT247986@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: reduce the maximum
 "size" of random configurations
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTYXQsIDEzIE5vdiAyMDIxIDE5OjAyOjA2ICswMTAwCiJZYW5uIEUuIE1PUklO
IiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiBPbiBJUkMsIHdlIGRpc2N1c3Nl
ZCBhYm91dCB1c2luZyBhIG5vcm1hbCBkaXN0cm9idXRpb24gcmF0aGVyIHRoYW4gdGhlCj4gdW5p
Zm9ybSBkaXN0cmlidXRpb24gdGhhdCByYW5kaW50KCkgcHJvdmlkZXMuCgpZZWFoLCBidXQgYWZ0
ZXIgdGhpbmtpbmcgbW9yZSBhYm91dCBpdCwgSSdtIHdvbmRlcmluZyB3aGV0aGVyIHRoaXMKbWFr
ZXMgc2Vuc2Ugb3Igbm90LiBJbmRlZWQsIHdoeSBhcmUgd2UgbW9yZSBpbnRlcmVzdGVkIGJ5CmNv
bmZpZ3VyYXRpb25zIGhhdmluZyB+MTAlIG9mIG9wdGlvbnMgZW5hYmxlZCBjb21wYXJlZCB0byB0
aGUgb25lcwpoYXZpbmcgMSUgb3IgMjAlID8gQWxsIG9mIHRoZW0gYXJlIGVxdWFsbHkgaW50ZXJl
c3RpbmcsIGFyZW4ndCB0aGV5PwoKPiBBbmQgaGVyZSBpcyB0aGUgKDEwLDcpIGdhdXNzaWFuICh3
aGljaCBoYXMgbXkgcHJlZmVyZW5jZSk6Cj4gCj4gICAgICAxOiAjIyMjIyMjIyMjIyMjIyMgICAg
MyUKPiAgICAgIDI6ICMjIyMjIyMjIyMjIyMjIyMjICAgIDMlCj4gICAgICAzOiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyAgICA0JQo+ICAgICAgNDogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMgICAgNCUK
PiAgICAgIDU6ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMgICAgNSUKPiAgICAgIDY6ICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAgICA1JQo+ICAgICAgNzogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMgICAgNSUKPiAgICAgIDg6ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyAgICA2JQo+ICAgICAgOTogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAgICA2JQo+
ICAgICAxMDogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAgICA2JQo+ICAgICAxMTog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjICAgIDYlCj4gICAgIDEyOiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyAgICA1JQo+ICAgICAxMzogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjICAgIDUlCj4gICAgIDE0OiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjICAgIDUlCj4g
ICAgIDE1OiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAgICA0JQo+ICAgICAxNjogIyMjIyMjIyMj
IyMjIyMjIyMjIyMgICAgNCUKPiAgICAgMTc6ICMjIyMjIyMjIyMjIyMjIyMjICAgIDMlCj4gICAg
IDE4OiAjIyMjIyMjIyMjIyMjIyMgICAgMyUKPiAgICAgMTk6ICMjIyMjIyMjIyMjIyAgICAyJQo+
ICAgICAyMDogIyMjIyMjIyMjIyAgICAyJQo+ICAgICAyMTogIyMjIyMjIyMgICAgMSUKPiAgICAg
MjI6ICMjIyMjIyAgICAxJQo+ICAgICAyMzogIyMjIyAgICAwJQo+ICAgICAyNDogIyMjICAgIDAl
Cj4gICAgIDI1OiAjIyAgICAwJQo+ICAgICAyNjogIyAgICAwJQo+ICAgICAyNzogIyAgICAwJQoK
SSB0aGluayB0aGUgcmVhbGl0eSBvZiBCdWlsZHJvb3QgY29uZmlndXJhdGlvbnMgaXMgcHJvYmFi
bHkgZXZlbiBtb3JlCmJpYXNlZCB0b3dhcmRzIGhhdmluZyBqdXN0IGEgZmV3IHBlcmNlbnRzIG9m
IG9wdGlvbnMgZW5hYmxlZC4KCj4gU2luY2UgYSBnYXVzc2lhbiBjYW4gb3V0cHV0IHZhbHVlcyBh
bGwgb3ZlciDihJ0sIHdlIG11c3QgbGltaXQgdGhlIHJhbmdlCj4gZXhwbGljaXRseSAobm90ZSB0
aGF0IHRoZSAwJSBhYm92ZSBhcmUgbm90IHJlcHJlc2VudGluZyAwIG9jY3VyZW5jZXMhKToKPiAK
PiAgICAgcHJvYmEgPSAwCj4gICAgIHdoaWxlIHByb2JhIDwgMSBvciBwcm9iYSA+IDEwMDoKPiAg
ICAgICAgIHByb2JhID0gaW50KHJhbmRvbS5nYXVzcygxNSwgNSkpCgpIb3cgbXVjaCBDUFUgaXMg
dGhpcyBsb29wIGdvaW5nIHRvIGNvbnN1bWUgYmVmb3JlIGl0IGdpdmVzIGEgdmFsdWUgdGhhdApp
cyB3aXRoaW4gMSBhbmQgMTAwID8gV291bGQgYSAlIDEwMCBiZSBiZXR0ZXIgPwoKQmVzdCByZWdh
cmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
