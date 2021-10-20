Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D027C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 15:58:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE51611B0
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 15:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAE51611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 350A8401BE;
	Wed, 20 Oct 2021 15:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhp3BGWPJzcf; Wed, 20 Oct 2021 15:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C2534058A;
	Wed, 20 Oct 2021 15:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBC281BF426
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 15:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7DFA82861
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 15:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjFPQ5PMlnm0 for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 15:58:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C886682CDE
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 15:58:05 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2DDB51BF207;
 Wed, 20 Oct 2021 15:58:03 +0000 (UTC)
Date: Wed, 20 Oct 2021 17:58:02 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211020175802.133eef9b@kmaincent-XPS-13-7390>
In-Reply-To: <CAFSsvmrWN=1MgFFO-O6NWG__tb2QXGMpfo+riFQfCpGfCrUK8g@mail.gmail.com>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
 <20211011122736.3b0df127@kmaincent-XPS-13-7390>
 <20211014200207.GC368016@scaer> <20211015205044.GF368016@scaer>
 <CAFSsvmrWN=1MgFFO-O6NWG__tb2QXGMpfo+riFQfCpGfCrUK8g@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWRhbSwKCk9uIFR1ZSwgMTkgT2N0IDIwMjEgMDk6MzA6MTAgLTA3MDAKQWRhbSBEdXNr
ZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+IHdyb3RlOgoKPiBIZXkgS29yeTsKPiAKPiBEbyB5b3Ug
cGxhbiBvbiBzdWJtaXR0aW5nIGEgcGF0Y2ggdG8gZml4IHRoaXM/IElmIG5vdCwgSSBjYW4gZG8g
c28uCj4gSnVzdCBsZXQgbWUga25vdyEKCkkgd2FzIGFib3V0IHRvIGRvIGl0IGJlZm9yZSBZYW5u
IHNwb3QgdGhlIHBhcmFsbGVsIGJ1aWxkIGVycm9yLiBBcyBJIGRpZCBub3QKbWFuYWdlZCB0byBm
YWNlIHRoZSBlcnJvciBJIGhhdmUgc3RvcHBlZCBteSBhY3Rpb24gb24gdGhlIHBhdGNoLiBJIGNh
biBob3dldmVyCnNlbmQgdGhlIGZpcnN0IHBhcnQgb2YgaXQgdGhhdCBmaXhpbmcgdG9vbHMgaW5z
dGFsbCwgdGhlbiB3YWl0IHRoZSBmaXggZm9yIHRoZQpwYXJhbGxlbCBidWlsZCBpc3N1ZS4KClJl
Z2FyZHMsCkvDtnJ5Cgo+IAo+IEFkYW0KPiAKPiBPbiBGcmksIE9jdCAxNSwgMjAyMSBhdCAxOjUw
IFBNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+Cj4g
PiBLw7ZyeSwgQWxsLAo+ID4KPiA+IE9uIDIwMjEtMTAtMTQgMjI6MDIgKzAyMDAsIFlhbm4gRS4g
TU9SSU4gc3Bha2UgdGh1c2x5Ogo+ID4gWy0tU05JUC0tXSAgCj4gPiA+IFNpZGUgbm90ZSwgdW5y
ZWxhdGVkIHRvIHRoaXMgaXNzdWU6IHdlIGhhdmUgYSBwYXJhbGxlbCBidWlsZCBpc3N1ZSB3aXRo
Cj4gPiA+IGdydWIyOgo+ID4gPiAgICAgMjAyMS0xMC0xNCAyMTo0NTo1Mgo+ID4gPiAvaG9tZS95
bW9yaW4vZGV2L2J1aWxkcm9vdC9PL2hvc3QvYmluL2k2ODYtbGludXgtZ2NjIC1FIC1ESEFWRV9D
T05GSUdfSAo+ID4gPiAtSS4gLUkuLiAgLVdhbGwgLVcgLURHUlVCX1VUSUw9MSAtRF9GSUxFX09G
RlNFVF9CSVRTPTY0IC1JLi9pbmNsdWRlCj4gPiA+IC1ER1JVQl9GSUxFPSJ1dGlsL2dydWItZnN0
ZXN0LmMiIC1JLiAtSS4uIC1JLiAtSS4uIC1JLi4vaW5jbHVkZQo+ID4gPiAtSS4vaW5jbHVkZSAt
SS4uL2dydWItY29yZS9saWIvbGliZ2NyeXB0LWdydWIvc3JjLwo+ID4gPiAtSS4vZ3J1Yi1jb3Jl
L2xpYi9nbnVsaWIgLUkuLi9ncnViLWNvcmUvbGliL2dudWxpYiAgLURfTEFSR0VGSUxFX1NPVVJD
RQo+ID4gPiAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtT3Mg
LWZuby1zdGFjay1wcm90ZWN0b3IKPiA+ID4gLURfRklMRV9PRkZTRVRfQklUUz02NCAgIC1EJ0dS
VUJfTU9EX0lOSVQoeCk9QE1BUktFUkB4QCcKPiA+ID4gLi4vdXRpbC9ncnViLWZzdGVzdC5jIC4u
L2dydWItY29yZS9rZXJuL2VtdS9ob3N0ZnMuYyAuLi8KPiA+ID4gZ3J1Yi1jb3JlL2Rpc2svaG9z
dC5jIC4uL2dydWItY29yZS9vc2RlcC9pbml0LmMgPiBncnViX2ZzdGVzdC5wcCB8fCAocm0KPiA+
ID4gLWYgZ3J1Yl9mc3Rlc3QucHA7IGV4aXQgMSkgMjAyMS0xMC0xNCAyMTo0NTo1Mgo+ID4gPiAu
Li9ncnViLWNvcmUva2Vybi9lbXUvaG9zdGZzLmM6MjA6MTA6IGZhdGFsIGVycm9yOiBjb25maWct
dXRpbC5oOiBObyBzdWNoCj4gPiA+IGZpbGUgb3IgZGlyZWN0b3J5IDIwMjEtMTAtMTQgMjE6NDU6
NTIgICAgMjAgfCAjaW5jbHVkZSA8Y29uZmlnLXV0aWwuaD4KPiA+ID4gMjAyMS0xMC0xNCAyMTo0
NTo1MiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fiAgCj4gPiBbLS1TTklQLS1dICAK
PiA+ID4gQnV0IGZvcnR1bmF0ZWx5LCBpdCBsb29rcyBsaWVrIGl0IGlzIGZpeGVkIHdpdGggdXBz
dHJlYW0gY29tbWl0Cj4gPiA+IDQyZjQwNTRmYWYzYyAoTWFrZWZpbGU6IE1ha2UgbGliZ3J1Yi5w
cCBkZXBlbmQgb24gY29uZmlnLXV0aWwuaCkuICAKPiA+Cj4gPiBBbmQgYXBwYXJlbnRseSwgdGhp
cyBpcyBub3QgZW5vdWdoLCBiZWNhdXNlIEkgc3RpbGwgaGl0IHRoZSBpc3N1ZSwgYWJvdXQKPiA+
IG9uZSBpbiBmaXZlIGJ1aWxkcywgYWx3YXlzIHdoZW4gYnVpbGRpbmcgaTM4Ni1lZmkuLi4gOi0o
Cj4gPgo+ID4gQnV0IGdpdmVuIGhvdyBpbnZlbnRpdmUgdGhlIGdydWIgYnVpbGRzeXN0ZW0gaXMs
IEkgZHJlYWQgdG8gZXZlciBoYXZlIHRvCj4gPiBsb29rIGF0IGl0IG9uY2UgbW9yZS4uLiA6LSgK
PiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
