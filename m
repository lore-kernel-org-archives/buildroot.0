Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC45C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 07:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AE3416AD;
	Sun, 16 Oct 2022 07:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08AE3416AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfeqFMRuZD7q; Sun, 16 Oct 2022 07:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54ABD41696;
	Sun, 16 Oct 2022 07:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54ABD41696
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B40541BF294
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 07:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BBFB817A5
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 07:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BBFB817A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-QDmpn3XAD9 for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 07:51:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2664F817A4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2664F817A4
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 07:51:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4689013F895;
 Sun, 16 Oct 2022 09:50:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Oct 2022 09:50:56 +0200
Date: Sun, 16 Oct 2022 09:50:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221016075056.GI2503@scaer>
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665906660;
 bh=i89Kn84C5Fqe3CxdDyEPDynIlUvPQY9ZrxHsrvBonsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E//bhAnsWFF/8WgveL5/OVCXRnB4ClAbQ+KSNB4Kaf8xezP89UbuLqlZw9/5qaUs+
 8t24mtbEwSlVhFQs13jsJKCHjWFOBDDvnTv1FVSk2UIWcZzvGOY58ML6s5KKzYhg7U
 uDLJdoBzZ5C2Gh60uT8snTyv+AE5hdh6SI9qWnFQnVfxdK5emLz7ONg965UYySnTBl
 YBhsfDhnoYZ3Lk1C2+eefJE64/rnVZdMLxvmwoZngmvJRLECKLYo9cJ+vxYky9pGe0
 n4NSTqc0+QRUueg1VN+LsgrgOSfw84qxbfF6BFq73S+VyjiCz4LyAYcZGD7b7Ybr9v
 CHcEbVYgVB/NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E//bhAns
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjItMTAtMTUgMTk6MjEgLTA0MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTYXQsIE9jdCAxNSwgMjAyMiBhdCA2OjE0IFBNIEZhYnJpY2UgRm9u
dGFpbmUKPiA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gTGUgc2FtLiAx
NSBvY3QuIDIwMjIgw6AgMDI6NTgsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tPiBhIMOpY3JpdCA6Cj4gPj4gVGhlIGJlYXJzc2wgcGFja2FnZSBpcyBub3QgY29tcGF0
aWJsZSB3aXRoIHBhcmFsbGVsIGJ1aWxkcy4KPiA+IGJlYXJzc2wgd2FzIGJ1aWxkaW5nIHBlcmZl
Y3RseSBmaW5lIHVwIHVudGlsIG5vdyBhbmQgaXQgc2VlbXMgdGhlcmUKPiA+IGFyZSBhIGxvdCBv
ZiBwYWNrYWdlcyB0aGF0IGFyZSBhZmZlY3RlZCBieSBwYXJhbGxlbCBidWlsZCBpc3N1ZXMKPiA+
IChlLmcuIGRtcmFpZCwgbXVzZXBhY2ssIHNsYW5nLCBldGMpLgo+IAo+IFNvbWUgcGFyYWxsZWwg
YnVpbGQgYnVncyBkb24ndCByZXByb2R1Y2UgcmVsaWFibHkgZHVlIHRvIHRpbWluZywgSSBtYWRl
IGEgY2hhbmdlCj4gdG8gbXkgYXV0b2J1aWxkZXJzIHdoaWNoIG1hc3NpdmVseSBpbmNyZWFzZXMg
dGhlIGNoYW5jZSBvZiB0cmlnZ2VyaW5nCj4gYnVpbGQgZmFpbHVyZXMKPiBpbiBwYWNrYWdlcyB3
aGljaCBoYXZlIGRlcGVuZGVuY3kgZ3JhcGggYnVncy4gVGhpcyB0cmlnZ2VycyBidWlsZCBidWls
ZCBmYWlsdXJlcwo+IGluIC1qMSBidWlsZHMgd2hpY2ggd291bGQgb3RoZXJ3aXNlIG9ubHkgYXBw
ZWFyIHdoZW4gcnVubmluZyBwYXJhbGxlbCBidWlsZHMobXkKPiBhdXRvYnVpbGRlcnMgYXJlIGdl
bmVyYWxseSBydW5uaW5nIHdpdGggLWoxIHRvIG1ha2UgdGhlIGxvZ3MgbW9yZSByZWFkYWJsZSku
Cj4gCj4gPiBEaWQgd2UgY2hhbmdlIHNvbWV0aGluZyByZWNlbnRseSBvbiB0aGUgYXV0b2J1aWxk
ZXJzPwo+IAo+IFllcywgYWxsIG15IGF1dG9idWlsZGVycyB3ZXJlIHJlY2VudGx5IGNoYW5nZWQg
dG8gdXNlIG1ha2UgbWFzdGVyKHdpbGwgYmUKPiBtYWtlIHZlcnNpb24gNC40IG9uY2UgcmVsZWFz
ZWQpIHdpdGggdG9wIGxldmVsIC0tc2h1ZmZsZT1yYW5kb20uCgpCeSBkaXNhYmxpbmcgcGFyYWxs
ZWwgYnVpbGQgYmVjYXVzZSB5b3UgYXJlIHVzaW5nIGFuYSBhcyB5ZXQgdW5yZWxlYXNlZAp2ZXJz
aW9uLCB3ZSByZW1vdmUgdGhlIHBhcmFsbGVsIGJ1aWxkIGZvciBldmVyeW9uZSwgd2hpY2ggaXMg
bm90IHZlcnkKbmljZSBhdCBhbGwuCgpJbnN0ZWFkLCB3ZSBzaG91bGQgcmVhbGx5IHRyeSBhbmQg
Zml4IHRoZSBwYWNrYWdlcyByYXRoZXIgdGhhbiBwYXBlcmluZwpvdmVyIHRoZSBpc3N1ZS4KCk5v
dGVzOgogIC0gaXQgKmlzKiBpbnRlcmVzdGluZyB0byBmaW5kIHRob3NlIGJ1Z3M7CiAgLSBpdCBp
cyBzYWQgdGhhdCB0aGUgZGVmYXVsdCBtb2RlIGZvciAtLXNodWZmbGUgd2lsbCBiZSByYW5kb20s
IG5vdAogICAgbm9uZS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IERldGFpbHM6Cj4gaHR0
cHM6Ly9naXRodWIuY29tL21pcnJvci9tYWtlL2Jsb2IvM2UyMGUzNzZiN2FhMjZmYTQzZjgxZjIz
MzIzYzcxN2M0Y2FlMWJmYi9ORVdTI0wxMjMtTDEyOAo+IGh0dHBzOi8vdHJvZmkuZ2l0aHViLmlv
L3Bvc3RzLzIzOC1uZXctbWFrZS1zaHVmZmxlLW1vZGUuaHRtbAo+IGh0dHA6Ly90cm9maS5naXRo
dWIuaW8vcG9zdHMvMjQ5LWFuLXVwZGF0ZS1vbi1tYWtlLXNodWZmbGUuaHRtbAo+IAo+IE5vdGUg
dGhhdCBNQUtFMSBpcyBjdXJyZW50bHkgYnJva2VuIGl0c2VsZiB3aXRob3V0IHRoaXMgd2hlbiB1
c2luZyBzaHVmZmxlIG1vZGU6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDIyMTAxNTAwNTYxMS40MDU0OTMzLTEtamFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbS8KPiAKPiA+Cj4gPj4KPiA+Pgo+ID4+IEZpeGVzOgo+ID4+ICAtIGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzVlMS81ZTFiNzJkYjIwNmIyZDE3ZmE1Y2Uz
NzhhNzBmZGMyZjNmNWJmNzczCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+PiAtLS0KPiA+PiAgcGFja2FnZS9iZWFy
c3NsL2JlYXJzc2wubWsgfCAyICstCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmVhcnNzbC9i
ZWFyc3NsLm1rIGIvcGFja2FnZS9iZWFyc3NsL2JlYXJzc2wubWsKPiA+PiBpbmRleCBmZjVmNGU4
N2I3Li5jMmE1NzYwYWY1IDEwMDY0NAo+ID4+IC0tLSBhL3BhY2thZ2UvYmVhcnNzbC9iZWFyc3Ns
Lm1rCj4gPj4gKysrIGIvcGFja2FnZS9iZWFyc3NsL2JlYXJzc2wubWsKPiA+PiBAQCAtMjQsNyAr
MjQsNyBAQCBCRUFSU1NMX1RBUkdFVFMgKz0gbGliCj4gPj4gIGVuZGlmCj4gPj4KPiA+PiAgZGVm
aW5lIEJFQVJTU0xfQlVJTERfQ01EUwo+ID4+IC0gICAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQo
TUFLRSkgJChCRUFSU1NMX01BS0VfT1BUUykgLUMgJChARCkgXAo+ID4+ICsgICAgICAgJChUQVJH
RVRfTUFLRV9FTlYpICQoTUFLRTEpICQoQkVBUlNTTF9NQUtFX09QVFMpIC1DICQoQEQpIFwKPiA+
PiAgICAgICAgICAgICAgICAgJChCRUFSU1NMX1RBUkdFVFMpCj4gPj4gIGVuZGVmCj4gPj4KPiA+
PiAtLQo+ID4+IDIuMzQuMQo+ID4+Cj4gPiBCZXN0IFJlZ2FyZHMsCj4gPgo+ID4gRmFicmljZQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAv
IlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYg
fCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAg
ICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
