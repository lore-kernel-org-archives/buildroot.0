Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760BFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B41B408CE;
	Sat,  5 Feb 2022 17:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3I8UZ796E3Jr; Sat,  5 Feb 2022 17:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA85408C3;
	Sat,  5 Feb 2022 17:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08F131BF30E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB4FA60B66
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUUjBcR5wjnp for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 17:40:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4E7860A90
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 17:40:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GP2hnHvSbNVvLGP2inOkFK; Sat, 05 Feb 2022 18:40:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644082812; bh=AkN0TzawJOOh1QAzIs9N6O97gXkFYhtkd3Xa08kMybI=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=Xz1O6HRJBhvTkotRVWPl3SDIzum7g8tX2AAMToZAunbQl50yp+B8VW4VW4VZb7jK+
 tMuxEqMAX9UYM0Jxg7vvgBc07jW0U2yFZy59GWC4aCRZKFvGtaqOuQeWP5IXoaNo4R
 IFZVZ8uDShI5J7jnff3ielDd/R0R96LSZiHT0aoCMOjL3kNcMrYhyiB+vpEE2t/NYS
 YBVv5S+UP/gWrifFGZx/27MkHVKxyzncGf5SV+P4T5/yw2IjN1OvcvVcCDSecX5xJ7
 PMBh6poZ1EhGkB3NT3XsMQLz+kdrr64vGy6ShKfXB9jwAiwdRC72tGd2/eHQLS7Ps7
 IxsBX72vSomjg==
Message-ID: <f1d2404e-a93d-c0e9-6c1d-a33a011fa1d4@benettiengineering.com>
Date: Sat, 5 Feb 2022 18:40:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <98670320-83fa-c6e9-9bc4-aa30d9deb6ff@mind.be>
 <34C01EB2-BB12-4DE4-BC53-0141B5DF491D@benettiengineering.com>
In-Reply-To: <34C01EB2-BB12-4DE4-BC53-0141B5DF491D@benettiengineering.com>
X-CMAE-Envelope: MS4wfGlorNGiTmysOKGeZXe+iLjsPJL4pWGfdG1FZWUwTQYZEEMBNzX6+sPgHDAa5B0Y4dHREtgn0KbIjwN3FUOwbSp25bmKxP+MUglqqGbb8pIlXIyHQmuT
 SVP5EDYML4Wb5QWu/lJFjwQ+IGoZX9W7I4yz+73PmfuVRiv4mDlYGXEtb05orOEgUwlt6yh08owbCJVraWz8d0aNJx4aYz6vQ4recLJREWn1DqZI/QceSuQz
Subject: Re: [Buildroot] [PATCH] board/pc: fix build failure due to new
 genimage 15
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWdhaW4gQXJub3V0LAoKT24gMDUvMDIvMjIgMTY6MzYsIEdpdWxpbyBCZW5ldHRpIHdyb3Rl
Ogo+IEhpIEFybm91dCwKPiAKPj4gSWwgZ2lvcm5vIDUgZmViIDIwMjIsIGFsbGUgb3JlIDE1OjEx
LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IGhhIHNjcml0dG86Cj4+Cj4+
IO+7vyBIaSBHaXVsaW8sCj4+Cj4+PiBPbiAwNC8wMi8yMDIyIDAxOjU2LCBHaXVsaW8gQmVuZXR0
aSB3cm90ZToKPj4+IEFjdHVhbGx5IGdlbmltYWdlIGZhaWxzIHRvIGNyZWF0ZSBmaW5hbCBpbWFn
ZSB3aXRoOgo+Pj4gYGBgCj4+PiBFUlJPUjogaGRpbWFnZShkaXNrLmltZyk6IHBhcnRpdGlvbiBb
TUJSXSAob2Zmc2V0IDB4MWI4LCBzaXplIDB4NDgpIG92ZXJsYXBzIHByZXZpb3VzIHBhcnRpdGlv
biBib290IChvZmZzZXQgMHgwLCBzaXplIDB4MjAwKQo+Pj4gRVJST1I6IGhkaW1hZ2UoZGlzay5p
bWcpOiBib290bG9hZGVycywgZXRjLiB0aGF0IG92ZXJsYXAgd2l0aCB0aGUgcGFydGl0aW9uIHRh
YmxlIG11c3QgZGVjbGFyZSB0aGUgb3ZlcmxhcHBpbmcgYXJlYSBhcyBhIGhvbGUuCj4+PiBgYGAK
Pj4+IFRoaXMgaXMgYmVjYXVzZSBnZW5pbWFnZSAxNSBpcyBsZXNzIHBlcm1pc3NpdmUgdGhhbiBi
ZWZvcmUsIHNvIGxldCdzIGFkZAo+Pj4gaG9sZXMgPSB7Iig0NDA7IDUxMikifSB0byBsZWF2ZSBy
b29tIHRvIE1CUi4KPj4+IEZpeGVzOgo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xODY1OTM1MjQ5Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4+IC0tLQo+
Pj4gICBib2FyZC9wYy9nZW5pbWFnZS1iaW9zLmNmZyB8IDEgKwo+Pj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPj4+IGRpZmYgLS1naXQgYS9ib2FyZC9wYy9nZW5pbWFnZS1iaW9z
LmNmZyBiL2JvYXJkL3BjL2dlbmltYWdlLWJpb3MuY2ZnCj4+PiBpbmRleCAyNmQxMmQ5YWIzLi41
NDAyNmY2NTI3IDEwMDY0NAo+Pj4gLS0tIGEvYm9hcmQvcGMvZ2VuaW1hZ2UtYmlvcy5jZmcKPj4+
ICsrKyBiL2JvYXJkL3BjL2dlbmltYWdlLWJpb3MuY2ZnCj4+PiBAQCAtNyw2ICs3LDcgQEAgaW1h
Z2UgZGlzay5pbWcgewo+Pj4gICAgICAgICAgIGltYWdlID0gImJvb3QuaW1nIgo+Pj4gICAgICAg
ICAgIG9mZnNldCA9IDAKPj4+ICAgICAgICAgICBzaXplID0gNTEyCj4+PiArICAgICAgICBob2xl
cyA9IHsiKDQ0MDsgNTEyKSJ9Cj4+Cj4+IEhhdmUgeW91IHRlc3RlZCB0aGlzIGNoYW5nZSBvbiBh
biBhY3R1YWwgYm9hcmQgKGkuZS4gYSBQQyA6LSk/Cj4gCj4gSeKAmXZlIHRlc3RlZCBpdCB3aXRo
IHFlbXUgYW5kIGl0IGJvb3RzIHRoZSBrZXJuZWwgY29ycmVjdGx5KHRoYXQgaXMgaW4gcm9vdGZz
KSwgb25seSB0aGluZyBpcyB0aGF0IGl0IGNhbuKAmXQgbW91bnQgdGhlIHJvb3RmcyBhbmQgSSBk
b27igJl0IHVuZGVyc3RhbmQgd2h5Lgo+IEkgd2FudGVkIHRvIGFzayBhYm91dCB0aGlzIGJ1dCBJ
4oCZdmUgZ290IGxvc3QgYW1vbmcgYWxsIHRoZSBvdGhlciBwYXRjaGVzIDotKQoKSSd2ZSBjb21w
YXJlZCB0aGUgMiBkaXNrLmltZyBmaWxlcywgb25lIGdlbmVyYXRlZCB3aXRoIGdlbmltYWdlIDE0
IAp3aXRob3V0ICJob2xlcy4uLiIgYW5kIHRoZSBvdGhlciBnZW5lcmF0ZWQgd2l0aCBnZW5pbWFn
ZSAxNSBhbmQgdGhleSBhcmUgCnRoZSBzYW1lLgoKVGhlIHByb2JsZW0gaGVyZSBpcyBub3QgdGhh
dCBpdCBjYW4ndCBtb3VudCB1c2luZyBxZW11LCBidXQgaXQgZG9lc24ndCAKc2hvdyB0aGUgc2hl
bGwuCgpIZXJlIGlzIHRoZSBxZW11IGNvbW1hbmQ6CnFlbXUtc3lzdGVtLXg4Nl82NCAtTSBwYyAt
ZHJpdmUgCmZpbGU9aW1hZ2VzL2Rpc2suaW1nLGlmPXZpcnRpbyxmb3JtYXQ9cmF3IC1uZXQgbmlj
LG1vZGVsPXZpcnRpbyAtbmV0IHVzZXIKCmFuZCB0aGlzIGlzIHRoZSBvdXRwdXQ6Cmh0dHBzOi8v
aW1ndXIuY29tL2EvZmZaQmxKUgoKU28gaXQgc2VlbXMgbGlrZSBhIGJ1c3lib3gvaW5pdCBzeXN0
ZW0gaXNzdWUgd2l0aCB0dHkxLiBJJ20gZGlnZ2luZy4KCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlv
IEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gQ291bGQgc29tZW9uZSBkb3VibGUg
Y2hlY2sgaWYgaXQgbW91bnRzPwo+IAo+IEJlc3QgcmVnYXJkcwo+IEdpdWxpbwo+IAo+Pgo+PiBS
ZWdhcmRzLAo+PiBBcm5vdXQKPj4KPj4+ICAgICAgIH0KPj4+ICAgICAgICAgcGFydGl0aW9uIGdy
dWIgewo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
