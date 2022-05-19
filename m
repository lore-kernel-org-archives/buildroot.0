Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5704C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 17:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6402D8444D;
	Thu, 19 May 2022 17:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKfmdXG5y3TP; Thu, 19 May 2022 17:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3773E84366;
	Thu, 19 May 2022 17:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B67351BF3AB
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 17:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B279E612E9
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 17:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-Ws6yQXm1vI for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 17:12:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8784760C24
 for <buildroot@buildroot.org>; Thu, 19 May 2022 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FcGg9qcODMC40gundV9QY8f+b3i9W3XXQ6nt2ecpl6c=; b=EqSDhsn+yBCPOK7fgqZK5GMrjr
 ZmMOSB/455UbnwvYmzpjAaVDs21tBtIj6LNIDcadmZWQPt6HDXVkiv/ab7KlJAEuxp61rgAmugv9O
 uc6Eux/pAeoPePBwEqdBGl3FhcpB7apwDQFBWM/hx/b1ZiQSAS2PDZGHcnwqQ0qlHkTZafg/yUIhu
 m+QZAmqukTqePljZCA+P6rvWrasJxH+YvXVDqZD7d9Y3LrFlqN3kwSmGz2px8boOeQR1rpcF9rIxh
 D6vGzZmI3Fhiknfsc06mUTr1m7oYW/g+1/iOF7p+YIw+OanxAzgjeTmsyAWhWtw9akCmLHubxe4zE
 k9wTipUg==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nrjhU-00BTt8-3Y; Thu, 19 May 2022 19:12:36 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id e35c4dcc;
 Thu, 19 May 2022 17:12:24 +0000 (UTC)
Date: Thu, 19 May 2022 20:12:19 +0300
Message-ID: <20220519201219.GB3682468@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: =?UTF-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
In-Reply-To: <CAB0FRssx+9pJoLhn8DB6LvKRLcZMnaHEyU+gA6q_K22kbBsNBg@mail.gmail.com>
References: <20220518141927.554571-1-aperez@igalia.com>
 <CAB0FRssx+9pJoLhn8DB6LvKRLcZMnaHEyU+gA6q_K22kbBsNBg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.2
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2306908810096357395=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2306908810096357395==
Content-Type: multipart/signed; boundary="BySGKIzcA967hhlT"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--BySGKIzcA967hhlT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBUaHUsIDE5IE1heSAyMDIyIDE4OjMxOjMwICswMjAwIEZyYW7Dp29pcyBQZXJyYWQg
PGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cj4gTGUgbWVyLiAxOCBtYWkgMjAyMiDD
oCAxNjoxOSwgQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IGEKPiDD
qWNyaXQgOgo+IAo+ID4gQnVnZml4IHJlbGVhc2UsIG1vc3RseSB3aXRoIGJ1aWxkIGZpeGVzLCBh
bmQgYW4gaW1wb3J0YW50IGZpeCBmb3IKPiA+IHdoZW4gdXNpbmcgdGhyZWFkZWQgcmVuZGVyaW5n
LiBSZWxlYXNlIG5vdGVzOgo+ID4KPiA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uv
d3Bld2Via2l0LTIuMzYuMi5odG1sCj4gPgo+ID4gVGhpcyByZWxlYXNlIGZhaWxzIHRvIGJ1aWxk
IHdoZW4gWDExIGhlYWRlcnMgYXJlIG5vdCBwcmVzZW50LCBidXQgdGhlcmUKPiA+IGlzIGFscmVh
ZHkgYSBmaXggYWNjZXB0ZWQgdXBzdHJlYW0gYW5kIHNsYXRlZCBmb3IgaW5jbHVzaW9uIGluIHRo
ZSBuZXh0Cj4gPiByZWxlYXNlIGluIHRoZSBzZXJpZXMsIHNvIGluIHRoZSBtZWFudGltZSBpbXBv
cnRlZCBpdCBsb2NhbGx5Lgo+ID4KPiA+Cj4gd2Via2l0Z3RrIDIuMzYuMSAoZnJvbSBCUiAyMDIy
LjA1LXJjMSkgaGFzIGFsc28gdGhpcyBpc3N1ZS4KPiBwYXRjaCBmcm9tIGh0dHBzOi8vYnVncy53
ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yMzkwMzkgc29sdmVzIGl0LgoKSSB3YXMgaW4gdGhl
IG1pZGRsZSBvZiBwcmVwYXJpbmcgdGhlIDIuMzYuMiB1cGRhdGUgZm9yIHdlYmtpdGd0aywgd2hp
Y2gKd291bGQgaW5jbHVkZSB0aGlzIHBhdGNoIGFzIHdlbGw7IGJ1dCB0aGVuIEkgZm91bmQgYSBk
aWZmZXJlbnQgYnVpbGQKaXNzdWUuIFRoZW4gd2hpbGUgbG9va2luZyBpbnRvIGl0IEFwcGxlIHB1
Ymxpc2hlZCBhIG5ldyBsaXN0IG9mIHNlY3VyaXR5CmJ1Z3MsIHdoaWNoIG1lYW5zIHdlIG5lZWQg
dG8gbWFrZSBhIG5ldyAod2hpY2ggd2lsbCBiZSAyLjM2LjMpIGZvciBib3RoCnBvcnRzIGluY2x1
ZGluZyB0aGUgZml4ZXMuLi4gc28gSSBoYXZlIG1lcmdlZCB0aGUgYnVpbGQgZml4IGZvciB0aGUg
WDExCmhlYWRlcnMgaW4gdGhlIHJlbGVhc2UgYnJhbmNoIGFuZCB3ZSB3b24ndCBldmVuIG5lZWQg
dG8gaW1wb3J0IHRoZSBwYXRjaAppbiBCdWlsZHJvb3QuCgpGV0lXOiBsZXQncyBub3QgbWVyZ2Ug
dGhlIDIuMzYuMiB1cGRhdGUgZm9yIHdwZXdlYmtpdCwgYmVjYXVzZSBpbiBhIGZldwpkYXlzIEkg
d2lsbCBzZW5kIGFueXdheSBwYXRjaGVzIHRvIGdvIGRpcmVjdGx5IHRvIDIuMzYuMwoKOC0pCgo+
IAo+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxp
YS5jb20+Cj4gPiAtLS0KPiA+ICAuLi5HTEUtd2l0aC10aGUtRUdMX05PX1BMQVRGT1JNX1NQRUNJ
RkkucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysrCj4gPiAgcGFja2FnZS93cGV3ZWJraXQv
d3Bld2Via2l0Lmhhc2ggICAgICAgICAgICAgIHwgIDggKystLQo+ID4gIHBhY2thZ2Uvd3Bld2Vi
a2l0L3dwZXdlYmtpdC5tayAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NAo+ID4gcGFja2FnZS93cGV3ZWJraXQvMDAwMS1HVEstV1BFLUJ1aWxkLUFOR0xFLXdpdGgt
dGhlLUVHTF9OT19QTEFURk9STV9TUEVDSUZJLnBhdGNoCj4gPgo+ID4gZGlmZiAtLWdpdAo+ID4g
YS9wYWNrYWdlL3dwZXdlYmtpdC8wMDAxLUdUSy1XUEUtQnVpbGQtQU5HTEUtd2l0aC10aGUtRUdM
X05PX1BMQVRGT1JNX1NQRUNJRkkucGF0Y2gKPiA+IGIvcGFja2FnZS93cGV3ZWJraXQvMDAwMS1H
VEstV1BFLUJ1aWxkLUFOR0xFLXdpdGgtdGhlLUVHTF9OT19QTEFURk9STV9TUEVDSUZJLnBhdGNo
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMGI2ZGQ5YmNi
MQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrCj4gPiBiL3BhY2thZ2Uvd3Bld2Via2l0LzAwMDEt
R1RLLVdQRS1CdWlsZC1BTkdMRS13aXRoLXRoZS1FR0xfTk9fUExBVEZPUk1fU1BFQ0lGSS5wYXRj
aAo+ID4gQEAgLTAsMCArMSwzOSBAQAo+ID4gK0Zyb20gMzIxMzVhNGFmN2MyZWExZGIyZWE1Mjhk
ZjlhZjBhMzMxY2E4OGRiYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+ICtGcm9tOiAiemFu
QGZhbGNvbnNpZ2gubmV0Igo+ID4gKyA8emFuQGZhbGNvbnNpZ2gubmV0QDI2OGY0NWNjLWNkMDkt
MDQxMC1hYjNjLWQ1MjY5MWI0ZGJmYz4KPiA+ICtEYXRlOiBUdWUsIDEyIEFwciAyMDIyIDA2OjM0
OjQ0ICswMDAwCj4gPiArU3ViamVjdDogW1BBVENIXSBbR1RLXVtXUEVdIEJ1aWxkIEFOR0xFIHdp
dGggdGhlCj4gPiArIEVHTF9OT19QTEFURk9STV9TUEVDSUZJQ19UWVBFUyBkZWZpbmUKPiA+ICsg
aHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcuY2dpP2lkPTIzOTAzOQo+ID4gKwo+ID4g
K1Jldmlld2VkIGJ5IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8uCj4gPiArCj4gPiArU3BlY2lmeSB0
aGUgRUdMX05PX1BMQVRGT1JNX1NQRUNJRklDX1RZUEVTIGRlZmluZSB3aGVuIGJ1aWxkaW5nIEFO
R0xFCj4gPiArc3VicHJvamVjdCBmb3IgdGhlIEdUSyBhbmQgV1BFIHBvcnRzLiBUaGlzIHNob3Vs
ZCBhdm9pZCBzZWFyY2hpbmcgZm9yCj4gPiArcGxhdGZvcm0tc3BlY2lmaWMgaGVhZGVycyB0aGF0
IG1pZ2h0IG5vdCBiZSBhdmFpbGFibGUgYXQgYWxsIGR1cmluZwo+ID4gK2J1aWxkLCBlLmcuIHRo
ZSBYMTEgaGVhZGVycyB3aGljaCBhcmUgdXNlZCBieSBkZWZhdWx0IG9uIFVOSVggcGxhdGZvcm1z
Lgo+ID4gKwo+ID4gKyogUGxhdGZvcm1HVEsuY21ha2U6Cj4gPiArKiBQbGF0Zm9ybVdQRS5jbWFr
ZToKPiA+ICsKPiA+ICtTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVy
ZXpAaWdhbGlhLmNvbT4KPiA+ICtVcHN0cmVhbSBzdGF0dXM6IGh0dHBzOi8vYnVncy53ZWJraXQu
b3JnL3Nob3dfYnVnLmNnaT9pZD0yMzkwMzkKPiA+ICstLS0KPiA+ICsgU291cmNlL1RoaXJkUGFy
dHkvQU5HTEUvQ2hhbmdlTG9nICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysKPiA+ICsgU291
cmNlL1RoaXJkUGFydHkvQU5HTEUvUGxhdGZvcm1HVEsuY21ha2UgfCAgMiArLQo+ID4gKyBTb3Vy
Y2UvVGhpcmRQYXJ0eS9BTkdMRS9QbGF0Zm9ybVdQRS5jbWFrZSB8ICAyICstCj4gPiArIDMgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ICsKPiA+ICtk
aWZmIC0tZ2l0IGEvU291cmNlL1RoaXJkUGFydHkvQU5HTEUvUGxhdGZvcm1XUEUuY21ha2UKPiA+
IGIvU291cmNlL1RoaXJkUGFydHkvQU5HTEUvUGxhdGZvcm1XUEUuY21ha2UKPiA+ICtpbmRleCBh
NGQwYjk1OWM2Mi4uOGY1YmZmN2YxOWEgMTAwNjQ0Cj4gPiArLS0tIGEvU291cmNlL1RoaXJkUGFy
dHkvQU5HTEUvUGxhdGZvcm1XUEUuY21ha2UKPiA+ICsrKysgYi9Tb3VyY2UvVGhpcmRQYXJ0eS9B
TkdMRS9QbGF0Zm9ybVdQRS5jbWFrZQo+ID4gK0BAIC0xLDQgKzEsNCBAQAo+ID4gKy1saXN0KEFQ
UEVORCBBTkdMRV9ERUZJTklUSU9OUyBBTkdMRV9QTEFURk9STV9MSU5VWCkKPiA+ICsrbGlzdChB
UFBFTkQgQU5HTEVfREVGSU5JVElPTlMgQU5HTEVfUExBVEZPUk1fTElOVVgKPiA+IEVHTF9OT19Q
TEFURk9STV9TUEVDSUZJQ19UWVBFUykKPiA+ICsgaW5jbHVkZShsaW51eC5jbWFrZSkKPiA+ICsK
PiA+ICsgaWYgKFVTRV9PUEVOR0wpCj4gPiArLS0KPiA+ICsyLjM2LjEKPiA+ICsKPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQuaGFzaAo+ID4gYi9wYWNrYWdlL3dw
ZXdlYmtpdC93cGV3ZWJraXQuaGFzaAo+ID4gaW5kZXggMzkyM2MzMjExMS4uZDUwOWFiMDkxZiAx
MDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5oYXNoCj4gPiArKysg
Yi9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQuaGFzaAo+ID4gQEAgLTEsNyArMSw3IEBACj4g
PiAtIyBGcm9tIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcy93cGV3ZWJraXQtMi4zNi4x
LnRhci54ei5zdW1zCj4gPiAtbWQ1IDxodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMvd3Bl
d2Via2l0LTIuMzYuMS50YXIueHouc3Vtcy1tZDU+Cj4gPiA3YmExYzdmZDBmNjc4OTFhZDEzN2Qx
MWNhYzEyZjdhOSAgd3Bld2Via2l0LTIuMzYuMS50YXIueHoKPiA+IC1zaGExICAwOTE4YTRkYWRl
ZDAxZjQyZTY1ZWMwMmE2OWYyMWNkNjcwNTMxMWRiICB3cGV3ZWJraXQtMi4zNi4xLnRhci54ego+
ID4gLXNoYTI1NiAgZWM4M2Q4YjJmOGMzNDc5Y2U5OTUwZDY5NDQwZjNiOTg3NmFiNzAyMDBmZTZm
NGUwNzY4NjA1NGEwY2JhNTcyMwo+ID4gd3Bld2Via2l0LTIuMzYuMS50YXIueHoKPiA+ICsjIEZy
b20gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2VzL3dwZXdlYmtpdC0yLjM2LjIudGFyLnh6
LnN1bXMKPiA+ICttZDUgPGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcy93cGV3ZWJraXQt
Mi4zNi4yLnRhci54ei5zdW1zK21kNT4KPiA+IGJjZmI0NjVhZTA4NTgzNWFlOTZjNjhmZGRjODVj
YTQ0ICB3cGV3ZWJraXQtMi4zNi4yLnRhci54ego+ID4gK3NoYTEgIDFhNWE2YjdiNWU5NGY0ZWE3
ZTM0NjJkNmJkYjVkZTdlZmE2NzhmNzQgIHdwZXdlYmtpdC0yLjM2LjIudGFyLnh6Cj4gPiArc2hh
MjU2ICA5NTk1MTk1NjI3MDFlMjAwNWYyNzY3YTYyZTg1OTc3ZDZjM2U2NTg1ODcwOWIzNzZjODlk
OGUzMzUwMmZlYmI5Cj4gPiB3cGV3ZWJraXQtMi4zNi4yLnRhci54ego+ID4KPiA+ICAjIEhhc2hl
cyBmb3IgbGljZW5zZSBmaWxlczoKPiA+ICBzaGEyNTYgIDBiNWQzYTdjYzMyNTk0MjU2NzM3M2Iw
ZWNkNzU3ZDA3YzEzMmUwZWJkN2M5N2JmYzYzZjdlMWE3NjA5NGVkYjQKPiA+IFNvdXJjZS9XZWJD
b3JlL0xJQ0VOU0UtQVBQTEUKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3
ZWJraXQubWsgYi9wYWNrYWdlL3dwZXdlYmtpdC8KPiA+IHdwZXdlYmtpdC5tawo+ID4gaW5kZXgg
OWM5YTlhMjgzOC4uY2EyNmNiM2Y2NSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0
L3dwZXdlYmtpdC5tawo+ID4gKysrIGIvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rCj4g
PiBAQCAtNCw3ICs0LDcgQEAKPiA+ICAjCj4gPgo+ID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gPgo+ID4gLVdQRVdFQktJVF9WRVJTSU9OID0gMi4zNi4xCj4gPiArV1BFV0VCS0lUX1ZFUlNJ
T04gPSAyLjM2LjIKPiA+ICBXUEVXRUJLSVRfU0lURSA9IGh0dHA6Ly93d3cud3Bld2Via2l0Lm9y
Zy9yZWxlYXNlcwo+ID4gIFdQRVdFQktJVF9TT1VSQ0UgPSB3cGV3ZWJraXQtJChXUEVXRUJLSVRf
VkVSU0lPTikudGFyLnh6Cj4gPiAgV1BFV0VCS0lUX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4g
LS0KPiA+IDIuMzYuMQo+ID4KPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCkNoZWVycywK4oCUQWRyacOhbgo=

--BySGKIzcA967hhlT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYoZ6cwAKCRCRxVnb5MkS
O7bwAJ9UDmgz12NO6bdEZogD/1+qupbjZACfa7gs0FY8GdWmc4ADExOeitgAHWs=
=vIoR
-----END PGP SIGNATURE-----

--BySGKIzcA967hhlT--

--===============2306908810096357395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2306908810096357395==--
