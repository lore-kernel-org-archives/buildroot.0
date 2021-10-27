Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C52C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 09:36:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C38A61052
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 09:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C38A61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A040F404FC;
	Wed, 27 Oct 2021 09:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPFDc8-pMq9f; Wed, 27 Oct 2021 09:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A524038F;
	Wed, 27 Oct 2021 09:36:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B967F1BF5B5
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 09:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7D2F401DB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 09:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYa6HYCaopGZ for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 09:36:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C69FE401A2
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 09:36:52 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 30556121E05;
 Wed, 27 Oct 2021 11:36:50 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 27 Oct 2021 09:36:50 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <CAPi7W83RQx7p7mbfuA4nqEM2+xR3kJ4uL2egPmmmymcfie80nA@mail.gmail.com>
References: <mailman.3672.1635273538.103149.buildroot@buildroot.org>
 <170e09cd599fceea54a6bac8ae1fea5d@umbiko.net>
 <CAPi7W83RQx7p7mbfuA4nqEM2+xR3kJ4uL2egPmmmymcfie80nA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7cf50fdc809a3e1c48fb391d0cebb2f7@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: fix build on musl
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwKCk9uIDIwMjEtMTAtMjcgMDc6MjcsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6
Cj4gSGkgQW5kcmVhcywKPiAKPiBMZSBtZXIuIDI3IG9jdC4gMjAyMSDDoCAwNjo1OCwgQW5kcmVh
cyBaaWVnbGVyIDxicjAxNUB1bWJpa28ubmV0PiBhIAo+IMOpY3JpdCA6Cj4+IAo+PiBIaSBGYWJy
aWNlLAo+PiAKPj4gT24gMjAyMS0xMC0yNiAxODozOCwgRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Cj4+IHdyb3RlOgo+PiAKPj4gPiBGaXggdGhlIGZvbGxvd2lu
ZyBidWlsZCBmYWlsdXJlIG9uIG11c2wgcmFpc2VkIHNpbmNlIGJ1bXAgdG8gdmVyc2lvbgo+PiA+
IDEuNC42MCBpbiBjb21taXQgZDYyYjdmNTRmMDAyOTFhNTAyNzQ0MDlmYjU1MTA1MjdmZDcyNWZm
ZToKPj4gPgo+PiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBidWZmZXIuaDo0MDQsCj4+ID4gICAg
ICAgICAgICAgICAgICBmcm9tIGFycmF5Lmg6NSwKPj4gPiAgICAgICAgICAgICAgICAgIGZyb20g
YXJyYXkuYzozOgo+PiA+IGNrLmg6MjQ6MTQ6IGVycm9yOiBleHBlY3RlZCAnOycgYmVmb3JlICd0
eXBlZGVmJwo+PiA+ICAgIDI0IHwgX19CRUdJTl9ERUNMUwo+PiA+ICAgICAgIHwgICAgICAgICAg
ICAgIF4KPj4gPiAgICAgICB8ICAgICAgICAgICAgICA7Cj4+ID4gLi4uLi4uCj4+ID4gICAgMjkg
fCB0eXBlZGVmIHNpemVfdCByc2l6ZV90Owo+PiA+ICAgICAgIHwgfn5+fn5+fgo+PiA+Cj4+ID4g
Rml4ZXM6Cj4+ID4gIC0KPj4gPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy8wZDU2YTQ0NDQ5ZTg5NzczNDk5MDUxYjM1ZjIxZWM4M2JmYWI0Y2E2Cj4+ID4KPj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
Pj4gPiAtLS0KPj4gPiAgLi4uLV9fQkVHSU5fREVDTFMtX19FTkRfREVDTFMtaWYtbmVlZGVkLnBh
dGNoIHwgMzkgKysrKysrKysrKysrKysrKysrKwo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5z
ZXJ0aW9ucygrKQo+PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPj4gPiBwYWNrYWdlL2xpZ2h0dHBk
LzAwMDItY29yZS1kZWZpbmUtX19CRUdJTl9ERUNMUy1fX0VORF9ERUNMUy1pZi1uZWVkZWQucGF0
Y2gKPj4gPgo+PiA+IGRpZmYgLS1naXQKPj4gPiBhL3BhY2thZ2UvbGlnaHR0cGQvMDAwMi1jb3Jl
LWRlZmluZS1fX0JFR0lOX0RFQ0xTLV9fRU5EX0RFQ0xTLWlmLW5lZWRlZC5wYXRjaAo+PiA+IGIv
cGFja2FnZS9saWdodHRwZC8wMDAyLWNvcmUtZGVmaW5lLV9fQkVHSU5fREVDTFMtX19FTkRfREVD
TFMtaWYtbmVlZGVkLnBhdGNoCj4+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gPiBpbmRleCAw
MDAwMDAwMDAwLi5jZDY0ZjE4Nzk0Cj4+ID4gLS0tIC9kZXYvbnVsbAo+PiA+ICsrKwo+PiA+IGIv
cGFja2FnZS9saWdodHRwZC8wMDAyLWNvcmUtZGVmaW5lLV9fQkVHSU5fREVDTFMtX19FTkRfREVD
TFMtaWYtbmVlZGVkLnBhdGNoCj4+ID4gQEAgLTAsMCArMSwzOSBAQAo+PiA+ICtGcm9tIGNmNGRm
YmUxNWVmOGVhZDNhN2VkYTk3NGFmN2Q4MDRkNDQ3ZjAwZGIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4+ID4gK0Zyb206IEdsZW5uIFN0cmF1c3MgPGdzdHJhdXNzQGdsdWVsb2dpYy5jb20+Cj4+
ID4gK0RhdGU6IE1vbiwgNCBPY3QgMjAyMSAwOTo1MToyMiAtMDQwMAo+PiA+ICtTdWJqZWN0OiBb
UEFUQ0hdIFtjb3JlXSBkZWZpbmUgX19CRUdJTl9ERUNMUywgX19FTkRfREVDTFMgaWYgbmVlZGVk
Cj4+ID4gKwo+PiA+ICtbUmV0cmlldmVkIGZyb206Cj4+ID4gK2h0dHBzOi8vZ2l0aHViLmNvbS9s
aWdodHRwZC9saWdodHRwZDEuNC9jb21taXQvY2Y0ZGZiZTE1ZWY4ZWFkM2E3ZWRhOTc0YWY3ZDgw
NGQ0NDdmMDBkYl0KPj4gPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Cj4+ID4gKy0tLQo+PiA+ICsgc3JjL2ZpcnN0LmggfCAxNiAr
KysrKysrKysrKysrKysrCj4+ID4gKyAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+
PiA+ICsKPj4gPiArZGlmZiAtLWdpdCBhL3NyYy9maXJzdC5oIGIvc3JjL2ZpcnN0LmgKPj4gPiAr
aW5kZXggZGY3NDdiYTQ2Li45ZDA0MjhhZTYgMTAwNjQ0Cj4+ID4gKy0tLSBhL3NyYy9maXJzdC5o
Cj4+ID4gKysrKyBiL3NyYy9maXJzdC5oCj4+ID4gK0BAIC0zOSw2ICszOSwyMiBAQAo+PiA+ICsg
I2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+PiA+ICsgI2luY2x1ZGUgPHN0ZGRlZi5oPgo+PiA+ICsK
Pj4gPiArKyNpZm5kZWYgX19CRUdJTl9ERUNMUwo+PiA+ICsrI2lmZGVmIF9fY3BsdXNwbHVzCj4+
ID4gKysjZGVmaW5lIF9fQkVHSU5fREVDTFMgZXh0ZXJuICJDIiB7Cj4+ID4gKysjZWxzZQo+PiA+
ICsrI2RlZmluZSBfX0JFR0lOX0RFQ0xTCj4+ID4gKysjZW5kaWYKPj4gPiArKyNlbmRpZgo+PiAK
Pj4gSW5zdGVhZCBvZiBjcmVhdGluZyB5b3VyIG93biBkZWNsYXJhdGlvbnMgb2YgXypfREVDTFMs
IHlvdSBtaWdodCBqdXN0Cj4+IGFkZCB0aGUgbWlzc2luZyA8c3lzL2NkZWZzLmg+IHRvIGNrLmg7
IHRoaXMgc2VlbXMgdG8gYmUgdGhlIG9ubHkgcGxhY2UKPj4gdGhlIHByb2JsZW0gb2NjdXJzLgo+
PiAKPj4gVGhlIGhlYWRlciBpcyBwYXJ0IG9mIGdsaWJjLCBidXQgbm90IG9mIG11c2w7IHdpdGhp
biBCdWlsZHJvb3QgaXQgaXMKPj4gYXV0b21hdGljYWxseSBhZGRlZCBieSBtdXNsLWNvbXBhdC1o
ZWFkZXJzLCB3aGljaCBpcyBzZWxlY3RlZCBpZiB5b3UgCj4+IHVzZQo+PiBtdXNsLgo+IFRoaXMg
aXMgYW4gdXBzdHJlYW0gcGF0Y2ggYW5kIEkgZG9uJ3Qga25vdyBpZiB0aGV5IHdpbGwgYWNjZXB0
IHRvCj4gcmVwbGFjZSBpdCB3aXRoIHlvdXIgcHJvcG9zYWwgZXZlbiBpZiBpdCBzZWVtcyBiZXR0
ZXIuCj4gRmVlbCBmcmVlIHRvIHNlbmQgYSBQUiB0byBodHRwczovL2dpdGh1Yi5jb20vbGlnaHR0
cGQvbGlnaHR0cGQxLjQgYW5kCj4gYSB2MiBvZiB0aGlzIHBhdGNoLgoKTm8sIHByb2JhYmx5IG5v
dC4gTXkgaWRlYSBpcyBoaWdobHkgQnVpbGRyb290IHNwZWNpZmljIGFuZCB3aWxsIG5vdCB3b3Jr
IApvdXRzaWRlIG9mIHRoaXMgZW52aXJvbm1lbnQuIFNpbmNlIHRoZSBjaGFuZ2Ugd2lsbCBiZSBp
bmNvcnBvcmF0ZWQgaW4gCnRoZSBuZXh0IGxpZ2h0dHBkIHJlbGVhc2UgYW55d2F5LCBJIHdpdGhk
cmF3IGFueSBvYmplY3Rpb25zLgoKVGVzdGVkLWJ5OiBBbmRyZWFzIFppZWdsZXIgPGJyMDE1QHVt
Ymlrby5uZXQ+Cgo+PiAKPj4gS2luZCByZWdhcmRzLAo+PiBBbmRyZWFzCj4+IAo+PiA+ICsrCj4+
ID4gKysjaWZuZGVmIF9fRU5EX0RFQ0xTCj4+ID4gKysjaWZkZWYgX19jcGx1c3BsdXMKPj4gPiAr
KyNkZWZpbmUgX19FTkRfREVDTFMgfQo+PiA+ICsrI2Vsc2UKPj4gPiArKyNkZWZpbmUgX19FTkRf
REVDTFMKPj4gPiArKyNlbmRpZgo+PiA+ICsrI2VuZGlmCj4+ID4gKysKPj4gPiArICNpZiBkZWZp
bmVkIEhBVkVfU1RESU5UX0gKPj4gPiArICMgaW5jbHVkZSA8c3RkaW50Lmg+Cj4+ID4gKyAjZWxp
ZiBkZWZpbmVkIEhBVkVfSU5UVFlQRVNfSAo+PiA+IC0tCj4+ID4gMi4zMy4wCj4gQmVzdCBSZWdh
cmRzLAo+IAo+IEZhYnJpY2UKCktpbmQgcmVnYXJkcywKQW5kcmVhcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
