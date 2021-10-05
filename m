Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AB7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:15:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B05D61373
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B05D61373
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4771C40801;
	Tue,  5 Oct 2021 16:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDWhh_ZHLObw; Tue,  5 Oct 2021 16:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891BE407F3;
	Tue,  5 Oct 2021 16:15:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFB41BF2F2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ED6E407FB
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1zO0NnvXwFj for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:15:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3557407F3
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:15:29 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5DA39E0010;
 Tue,  5 Oct 2021 16:15:26 +0000 (UTC)
Date: Tue, 5 Oct 2021 18:15:23 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211005181523.085d94b8@bootlin.com>
In-Reply-To: <20211005155310.7832c4e4@windsurf>
References: <20211005131122.3070186-1-herve.codina@bootlin.com>
 <20211005155310.7832c4e4@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pecl-dbus: new package
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

SGksCgpPbiBUdWUsIDUgT2N0IDIwMjEgMTU6NTM6MTAgKzAyMDAKVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIEhlcnbDqSwKPiAK
PiBUaGFua3MgZm9yIHRoaXMgY29udHJpYnV0aW9uIQo+IAo+IE9uIFR1ZSwgIDUgT2N0IDIwMjEg
MTU6MTE6MjEgKzAyMDAKPiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4g
d3JvdGU6Cj4gCj4gPiBUaGUgcGVjbC1kYnVzIHBhY2thZ2UgcHJvdmlkZXMgYSBQSFAgZXh0ZW5z
aW9uIGZvciBpbnRlcmFjdGlvbgo+ID4gd2l0aCBELUJ1cyBidXNzZXMuCj4gPiAKPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9kZXJpY2tyL3BlY2wtZGJ1cwo+ID4gCj4gPiBCYXNlZCBvbiBpbml0aWFs
IHdvcmsgZnJvbSBOaWNvbGFzIENhcnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9saWEuY29tPgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGlu
LmNvbT4KPiA+IC0tLQo+ID4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgNiArCj4gPiAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKPiA+ICBwYWNrYWdlL3BlY2wtZGJ1cy8wMDAxLXBocDgtY29tcGF0
LnBhdGNoICAgICAgfCAxNjEgKysrKysrKysrKysrKysrKysrCj4gPiAgLi4ubGl0eS13aXRoLXBo
cDgtY2FsbF91c2VyX2Z1bmN0aW9uX2V4LnBhdGNoIHwgIDMxICsrKysKPiA+ICBwYWNrYWdlL3Bl
Y2wtZGJ1cy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgfCAgMTUgKysKPiA+ICBwYWNrYWdl
L3BlY2wtZGJ1cy9wZWNsLWRidXMuaGFzaCAgICAgICAgICAgICAgfCAgIDMgKwo+ID4gIHBhY2th
Z2UvcGVjbC1kYnVzL3BlY2wtZGJ1cy5tayAgICAgICAgICAgICAgICB8ICAyNSArKysKPiA+ICAu
Li4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGVjbF9kYnVzLnB5ICAgfCAgMzIgKysrKwo+
ID4gIDggZmlsZXMgY2hhbmdlZCwgMjc0IGluc2VydGlvbnMoKykgIAo+IAo+IFRoYW5rcyBmb3Ig
dGhpcyBuZXcgcGFja2FnZS4gSSdtIGp1c3Qgd29uZGVyaW5nIGFib3V0IHRoZSBwYWNrYWdlIG5h
bWUuCj4gVGhlIHVwc3RyZWFtIHByb2plY3QgaXMgaW5kZWVkIG5hbWVkIHBlY2wtZGJ1cywgd2hl
cmUgcGVjbCBzdGFuZHMgZm9yCj4gIlBIUCBFeHRlbnNpb24gQ29tbXVuaXR5IExpYnJhcnkiLiBC
dXQgYWxsIG91ciBvdGhlciBQSFAgcGFja2FnZXMgYXJlCj4gbmFtZWQgInBocC08c29tZXRoaW5n
PiIuIFNob3VsZCB3ZSBuYW1lIHRoaXMgcGFja2FnZSAicGhwLWRidXMiID8KPiAicGhwLXBlY2wt
ZGJ1cyIgPwoKInBocC1wZWNsLWRidXMiIHNvdW5kcyBnb29kLgpJZiBpdCdzIG9rIGZvciBldmVy
eW9uZSwgSSB3aWxsIGNoYW5nZSBpbiB2Mi4KCj4gCj4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9wZWNsLWRidXMvMDAwMS1waHA4LWNvbXBhdC5wYXRjaCBiL3BhY2thZ2UvcGVjbC1kYnVzLzAw
MDEtcGhwOC1jb21wYXQucGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAw
MDAwMDAwMDAwLi5iZWY5YTFmYTA1Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdl
L3BlY2wtZGJ1cy8wMDAxLXBocDgtY29tcGF0LnBhdGNoCj4gPiBAQCAtMCwwICsxLDE2MSBAQAo+
ID4gK0Zyb20gN2ZkZTRkZDRkMjZkMmE0Yjc5NTdhMTAxMGM2ZWE5ZTRiOTQwZmM2MiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiA+ICtGcm9tOiBTdGVmYW4gU2FyYWV2IDxzdGVmYW5Ac2FyYWV2
LmNhPgo+ID4gK0RhdGU6IE1vbiwgMTggSmFuIDIwMjEgMjM6MjI6NTIgKzAyMDAKPiA+ICtTdWJq
ZWN0OiBbUEFUQ0hdIHBocDggY29tcGF0Cj4gPiArCj4gPiArVGhpcyBwYXRjaCB3YXMgcmV0cmll
dmVkIGZyb20gdGhlIHBlbmRpbmcgdXBzdHJlYW0gcHVsbCByZXF1ZXN0Cj4gPiArZG9uZSBieSBT
dGVmYW4gU2FyYWV2Lgo+ID4gK2h0dHBzOi8vZ2l0aHViLmNvbS9kZXJpY2tyL3BlY2wtZGJ1cy9w
dWxsLzgKPiA+ICsKPiA+ICtTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGlu
YUBib290bGluLmNvbT4gIAo+IAo+IFBlcmhhcHMgeW91IGNvdWxkIGp1c3QgcGluZyBvbiB0aGlz
IHB1bGwgcmVxdWVzdCwgdG8gc2F5IHRoYXQgaXQgYWxzbwo+IHNvbHZlZCB0aGUgcHJvYmxlbSBm
b3IgeW91PwoKSSBkaWQuCgo+IAo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGVjbC1kYnVzLzAw
MDItRml4LWNvbXBhdGliaWxpdHktd2l0aC1waHA4LWNhbGxfdXNlcl9mdW5jdGlvbl9leC5wYXRj
aCBiL3BhY2thZ2UvcGVjbC1kYnVzLzAwMDItRml4LWNvbXBhdGliaWxpdHktd2l0aC1waHA4LWNh
bGxfdXNlcl9mdW5jdGlvbl9leC5wYXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAuLjFlNTc5ZTQyNzIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3Bh
Y2thZ2UvcGVjbC1kYnVzLzAwMDItRml4LWNvbXBhdGliaWxpdHktd2l0aC1waHA4LWNhbGxfdXNl
cl9mdW5jdGlvbl9leC5wYXRjaAo+ID4gQEAgLTAsMCArMSwzMSBAQAo+ID4gK0Zyb20gOGNmNjZj
NGI1ZGQ2NTdjYTE0NTUyYjI3YTQyOTAxZGIwYTVlOTI4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPiA+ICtGcm9tOiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiA+
ICtEYXRlOiBNb24sIDQgT2N0IDIwMjEgMTc6MTM6NDUgKzAyMDAKPiA+ICtTdWJqZWN0OiBbUEFU
Q0hdIEZpeCBjb21wYXRpYmlsaXR5IHdpdGggcGhwOCAtIGNhbGxfdXNlcl9mdW5jdGlvbl9leAo+
ID4gKwo+ID4gK1RoaXMgcGF0Y2ggZml4IGNvbXBhdGliaWxpdHkgd2l0aCBwaHA4IHJlcGxhY2lu
Zwo+ID4gK2NhbGxfdXNlcl9mdW5jdGlvbl9leCBieSBjYWxsX3VzZXJfZnVuY3Rpb24uCj4gPiAr
Cj4gPiArU2lnbmVkLW9mZi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5j
b20+ICAKPiAKPiBBbmQgc3VibWl0IHRoaXMgdXBzdHJlYW0gPwoKSSBkaWQgdG9vLgoKPiAKPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BlY2wtZGJ1cy9Db25maWcuaW4gYi9wYWNrYWdlL3BlY2wt
ZGJ1cy9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAw
MDAwLi5hNTMxMzk3NzU0Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3BlY2wt
ZGJ1cy9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsMTUgQEAKPiA+ICtjb25maWcgQlIyX1BBQ0tB
R0VfUEVDTF9EQlVTCj4gPiArCWJvb2wgInBlY2wtZGJ1cyIKPiA+ICsJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTICMgZGJ1cwo+ID4gKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1V
ICMgZGJ1cwo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfREJVUwo+ID4gKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCWE1MMgo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUEhQX0VYVF9MSUJYTUwyICMg
UnVudGltZSBkZXBlbmRlbmN5ICAKPiAKPiBJIHdhcyB3b25kZXJpbmcgaWYgeW91IG5lZWQgYm90
aCBCUjJfUEFDS0FHRV9MSUJYTUwyIGFuZAo+IEJSMl9QQUNLQUdFX1BIUF9FWFRfTElCWE1MMiwg
aS5lIGRvZXMgcGVjbC1kYnVzIGxpbmsgZGlyZWN0bHkgd2l0aCB0aGUKPiBsaWJ4bWwyIG5hdGl2
ZSBsaWJyYXJ5ID8KCmxpYnhtbDIgaXMgbmVlZGVkLiBJbiBkYnVzLmMgc291cmNlIGZpbGUsIHdl
IGhhdmUKICAjaW5jbHVkZSAibGlieG1sL3BhcnNlci5oIgogICNpbmNsdWRlICJsaWJ4bWwvcGFy
c2VySW50ZXJuYWxzLmgiCmFuZCBjYWxscyB0byBsaWJ4bWwyIGZ1bmN0aW9ucyBzdWNoIGFzICd4
bWxQYXJzZU1lbW9yeSgpJwoKPiAKPiAKPiA+ICtQRUNMX0RCVVNfVkVSU0lPTiA9IDMxNWQxNzU1
OGM3NjE0ZDAyZTkyM2Q4OTgyMzFlNTFjODZhMjU3ODkKPiA+ICtQRUNMX0RCVVNfU0lURSA9ICQo
Y2FsbCBnaXRodWIsZGVyaWNrcixwZWNsLWRidXMsJChQRUNMX0RCVVNfVkVSU0lPTikpCj4gPiAr
UEVDTF9EQlVTX0xJQ0VOU0UgPSBQSFAtMy4wMQo+ID4gK1BFQ0xfREJVU19MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQo+ID4gK1BFQ0xfREJVU19ERVBFTkRFTkNJRVMgPSBwaHAgZGJ1cyBsaWJ4bWwy
IGhvc3QtYXV0b2NvbmYgaG9zdC1wa2djb25mCj4gPiArCj4gPiArUEVDTF9EQlVTX0NPTkZfT1BU
UyA9IFwKPiA+ICsJLS13aXRoLXBocC1jb25maWc9JChTVEFHSU5HX0RJUikvdXNyL2Jpbi9waHAt
Y29uZmlnIFwKPiA+ICsJLS1lbmFibGUtZGJ1cyAgCj4gCj4gcGVjbC1kYnVzIGNhbiBidWlsZCB3
aXRob3V0IGRidXMgPyE/CgpJbmRlZWQsICctLWVuYWJsZS1kYnVzJyBpcyBub3QgbmVlZGVkIGFu
ZCB3aWxsIGJlIHJlbW92ZWQgaW4gdjIuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcsCgpIZXJ2w6kK
Ci0tIApIZXJ2w6kgQ29kaW5hLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
