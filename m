Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB591C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 20:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4406FBBC;
	Wed,  5 Jan 2022 20:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TaSGIKCJm6t; Wed,  5 Jan 2022 20:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD5906FBB5;
	Wed,  5 Jan 2022 20:41:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40D6A1BF407
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D56340998
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBB39LkBNj08 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 20:41:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBB7C4091C
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 20:41:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 384911C0002;
 Wed,  5 Jan 2022 20:41:30 +0000 (UTC)
Date: Wed, 5 Jan 2022 21:41:29 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220105214129.2f5fffae@windsurf>
In-Reply-To: <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDEwIERlYyAyMDIxIDE2OjEyOjA0ICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRj
aCBhZGRzIGEgbmV3IHBhY2thZ2UgZm9yIG1pbmlqYWlsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpv
c8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgoKSSB3YW50ZWQgdG8g
YXBwbHkgYWZ0ZXIgZml4aW5nIHRoZSBpc3N1ZXMgcG9pbnRlZCBieSBvdGhlcnMsIGJ1dCB0aGVy
ZQphcmUgaW4gZmFjdCBvdGhlciBpc3N1ZXMsIHdoaWNoIEkgY2Fubm90IHJlc29sdmUgZGlyZWN0
bHkuIFNlZSBiZWxvdy4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWluaWphaWwvMDAwMS1GaXgt
cHJsaW1pdC1jYWxsLnBhdGNoIGIvcGFja2FnZS9taW5pamFpbC8wMDAxLUZpeC1wcmxpbWl0LWNh
bGwucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjlmNjkw
MmVkNDMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9taW5pamFpbC8wMDAxLUZpeC1w
cmxpbWl0LWNhbGwucGF0Y2gKPiBAQCAtMCwwICsxLDI5IEBACj4gK0Zyb20gMDkzNDhmMDYxMDRi
ZjgxMDFhMjRhMGJjZTIzNWE3NWEyMTRlMTM4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAr
RnJvbTogPT9VVEYtOD9xP0pvcz1DMz1BOT0yMFBla2thcmluZW4/PSA8am9zZS5wZWtrYXJpbmVu
QHVuaWtpZS5jb20+Cj4gK0RhdGU6IEZyaSwgMTAgRGVjIDIwMjEgMTQ6MjA6MzAgKzAyMDAKPiAr
U3ViamVjdDogW1BBVENIXSBGaXggcHJsaW1pdCBjYWxsCgpXaGF0IGFyZSB5b3UgImZpeGluZyI/
IFlvdSdyZSByZXBsYWNpbmcgYSBwcmxpbWl0KCkgY2FsbCBieSBieQpzZXRybGltaXQoKSwgYnV0
IHdoeT8gV2hhdCBwcm9ibGVtIGRvZXMgaXQgc29sdmU/IFdoeSBpcyBpdCBjb3JyZWN0IHRvCmRv
IHRoYXQ/Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmlqYWlsLzAwMDItRml4LXN0YXRpYy1h
c3NlcnQucGF0Y2ggYi9wYWNrYWdlL21pbmlqYWlsLzAwMDItRml4LXN0YXRpYy1hc3NlcnQucGF0
Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQ4MTM5ZThiYWEK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9taW5pamFpbC8wMDAyLUZpeC1zdGF0aWMt
YXNzZXJ0LnBhdGNoCj4gQEAgLTAsMCArMSwzMCBAQAo+ICtGcm9tIGI1ZDkxYjc5Mzk0Mjc0N2U1
MTI2ZTc1YWJjYTJlZWJhZDYwYWI0NzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206
ID0/VVRGLTg/cT9Kb3M9QzM9QTk9MjBQZWtrYXJpbmVuPz0gPGpvc2UucGVra2FyaW5lbkB1bmlr
aWUuY29tPgo+ICtEYXRlOiBGcmksIDEwIERlYyAyMDIxIDE0OjIxOjM4ICswMjAwCj4gK1N1Ympl
Y3Q6IFtQQVRDSF0gRml4IHN0YXRpYyBhc3NlcnQKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpv
c2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+ICstLS0KPiArIGxpYm1pbmlqYWlsLmMgfCAzIC0t
LQo+ICsgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEv
bGlibWluaWphaWwuYyBiL2xpYm1pbmlqYWlsLmMKPiAraW5kZXggNDVmMTMzZS4uODMyMzc0MiAx
MDA2NDQKPiArLS0tIGEvbGlibWluaWphaWwuYwo+ICsrKysgYi9saWJtaW5pamFpbC5jCj4gK0BA
IC0yNjIwLDkgKzI2MjAsNiBAQCBzdGF0aWMgaW50IGZkX2lzX29wZW4oaW50IGZkKQo+ICsgCXJl
dHVybiBmY250bChmZCwgRl9HRVRGRCkgIT0gLTEgfHwgZXJybm8gIT0gRUJBREY7Cj4gKyB9Cj4g
KyAKPiArLXN0YXRpY19hc3NlcnQoRkRfU0VUU0laRSA+PSBNQVhfUFJFU0VSVkVEX0ZEUyAqIDIg
LSAxLAo+ICstCSAgICAgICJJZiB0cnVlLCBlbnN1cmVfbm9fZmRfY29uZmxpY3Qgd2lsbCBhbHdh
eXMgZmluZCBhbiB1bnVzZWQgZmQuIik7CgpZb3UncmUgbm90IGZpeGluZyB0aGUgc3RhdGljX2Fz
c2VydCgpIGhlcmUgYnV0IHNpbXBseSBkcm9wcGluZyBpdC4gV2h5PwpXaGVuIGRvZXMgaXQgZmFp
bD8gV2hhdCBpcyB0aGUgcHJvYmxlbSB3aXRoIGl0PyBXaHkgaXMgaXQgc2FmZSB0byBkcm9wCml0
PwoKQ291bGQgeW91IHRha2UgaW50byBhY2NvdW50IHRoZXNlIGNvbW1lbnRzIGFzIHdlbGwgYXMg
dGhlIG90aGVycwpyZWNlaXZlZCwgYW5kIHNlbmQgYW4gdXBkYXRlIHBhdGNoPwoKVGhhbmtzIGEg
bG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
