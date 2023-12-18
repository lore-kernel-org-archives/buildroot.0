Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16DAC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 20:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48969400AB;
	Mon, 18 Dec 2023 20:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48969400AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2ptebb4vRMI; Mon, 18 Dec 2023 20:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16226408D5;
	Mon, 18 Dec 2023 20:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16226408D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73B3B1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CC288228D
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 20:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CC288228D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJTG3Hhp_tCO for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 20:44:20 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50C6382277
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 20:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C6382277
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 244D4B0053E;
 Mon, 18 Dec 2023 21:44:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 21:44:13 +0100
Date: Mon, 18 Dec 2023 21:44:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <ZYCvHTVVUdZBg8hD@landeda>
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
 <20231102184154.46185-2-adam.duskett@amarulasolutions.com>
 <ZYCB3EqymtRdzOzd@landeda>
 <CAFSsvmpgYLmbpY0ppv1kWG-P7yyE7G5EJC9UHjo1=inmcZYEsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFSsvmpgYLmbpY0ppv1kWG-P7yyE7G5EJC9UHjo1=inmcZYEsQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702932257;
 bh=aeSf1D5z6JS+p2DIm2jtONYdXlKfaP0BFvVrmBNiOjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wgx3VEhfKfcsL2/Y3tGg1nDNtov3dTqAlCAoUTtKqbR4H5fY4r4AXfZOJr2sPPgik
 HgRz0cQUNMzQBv+mbYqlgXoXQwdu/AoC9nch6t2mU+iyQNk+Mec9gKDL1AkarErZLc
 MPgZUGpdJYyQn+6RBqZMmgoqB2cdd2RcQiIhmYE5tFXom/BO1rG4pXvP0m/1AUdAYZ
 0FVszWJiNNVsVk5GmQaEGNtu1ZLONn8ROuCyIS092nSX8xiHEpG9jNVcBRr9s5n1dp
 K6ZlqbJTJl4/nCl9ml8g78K25H2L19B06JNfdNCT+bv1vfcifl1A9AY9qLWbz394kV
 iVPv28f3pxmsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wgx3VEhf
Subject: Re: [Buildroot] [PATCH v2 2/2]
 support/testing/tests/package/test_postgresql.py: new test
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRhbSwgQWxsLAoKT24gMjAyMy0xMi0xOCAxMDo0MSAtMDcwMCwgQWRhbSBEdXNrZXR0IHNwYWtl
IHRodXNseToKPiBPbiBNb24sIERlYyAxOCwgMjAyMyBhdCAxMDozMeKAr0FNIFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKWy0tU05JUC0tXQo+ID4gSSB0aGlu
ayB0aGF0IHdlIGFscmVhZHkgY29uY2x1ZGVkIHRoYXQgdGVzdGluZyBpZiBhIHVuaXQgd2FzIGFj
dGl2ZSBvcgo+ID4gbm90IHdhcyBub3QgcmVwcmVzZW50aW5nIHdoZXRoZXIgdGhlIHNlcnZpY2Ug
d2FzIGFjdHVhbGx5IHJ1bm5pbmcuIEluCj4gPiB0aGUgZnVsdHRlciB0ZXN0IGNhc2UgZm9yIGV4
YW1wbGUsIHRoZSB1bml0IHdhcyBhY3RpdmUsIGJ1dCB0aGUgZmx1dHRlcgo+ID4gYXBwIHdhcyBq
dXN0IGtlZXBpbmcgY3Jhc2hpbmcgYWdhaW4gYW5kIGFnYWluLCBzbyB0aGUgdGVzdCB3c2EgZmFp
bGluZwo+ID4gdG8gZGV0ZWN0IGZhaWx1cmUuLi4KPiB0ZXN0X2ZsdXR0ZXIucHk6Cj4gY21kID0g
InN5c3RlbWN0bCBpcy1hY3RpdmUgZmx1dHRlci1nYWxsZXJ5Igo+IEkgYW0gZm9sbG93aW5nIHdo
YXQgaXMgaW4gdGVzdF9mbHV0dGVyLnB5Li4uCgpFeGFjdGx5LCBhbmQgYXMgSSBleHBsYWluZWQg
b24gSVJDIChhbmQgYWxyZWFkeSBleHBsYWluZWQsIGFuZCByZXBvcnRlZAp3aXRoIFswXSksIGl0
IGRvZXMgbm90IHdvcms6IHRoZSB1bml0IGlzIGFjdGl2ZSwgYnV0IHRoZSBhcHBsaWNhdGlvbiB0
aGUKc2VydmljZSBydW5zIGlzIGNvbnN0YW50bHkgY3Jhc2hpbmcuCgpTbyBubywgaGF2aW5nIGEg
dW5pdCByZXBvcnRlZCBhcyBhY3RpdmUgaXMgbm90IGFuIGluZGljYXRpb24gb2Ygc3VjY2Vzcy4K
SXQgaXMgbWVyZWx5IGFuIGluZGljYXRpb24gdGhhdCBzeXN0ZW1kIGRpZCBzY2hlZHVsZSBhbmQg
c3RhcnQgdGhhdAp1bml0LCBub3QgdGhhdCB0aGUgc2VydmljZSBpcyBydW5uaW5nIGFwcHJvcHJp
YXRlbHkuCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzdjZjg3NGYxMjdm
NTZjODEzMjg2MjE2M2FhMmM0ZDQ0ZjZmMzllZmUuMTY5NjA5MTI5NS5naXQueWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnIvCgo+ID4gPiAgIC0gRHJvcCBCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMg
KFRob21hcykKPiA+IEFjdHVhbGx5LCBJIGRpc2FncmVlIHdpdGggVGhvbWFzIGhlcmU6IHdlIGFk
ZGVkIHN1cHBvcnQgZm9yIFBQRCBpbiB0aGUKPiA+IGluZnJhLCBzbyB0aGF0IGlmIFBQRCBpcyBl
bmFibGVkIGluIGEgdGVzdCwgdGhlbiBUTFBCIGlzIGRvbmUgdG8gc3BlZWQKPiA+IHVwIHRoZSB0
ZXN0Lgo+IFdlIG5lZWQgYSBjb25zZW5zdXMgb24gdGhpcy4gVGhpcyBzaG91bGRuJ3QgaGFwcGVu
LiBFaXRoZXIgaXQgaXMgT0sgdG8KPiBlbmFibGUgUFBEIGluIHRlc3RzIG9yIGl0IGlzbid0LgoK
SSB3b3VsZCBzYXkgd2UgdXN1YWxseSBkbyBub3Qgd2FudCBpdCwgdW5sZXNzIHRoZSBydW50aW1l
IHRlc3QgInRha2UgdG9vCmxvbmcgdG8gcnVuIiBhbmQgdGh1cyB3ZSBlbmFibGUgUFBELiBCdXQg
aXQgaGFzIHRvIGJlIGp1c3RpZmllZCAoZXZlbgpicmllZmx5KSBpbiB0aGUgY29taXQgbG9nIChl
LmcuICJlbmFibGVkIFBQRCB0byBkaXZpZGUgdGhlIGJ1aWxkIHRpbWUgYnkKTiI7IE49MyBzZWVt
cyB0aGUgbWluaW11bSB0byBqdXN0aWZ5IFBQRCwgSSdkIHNheSkKClstLVNOSVAtLV0KPiA+ID4g
KyAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygic3UgcG9zdGdyZXMgLWMgXCJwc3FsIC1jICdTSE9X
IHNlcnZlcl92ZXJzaW9uOydcIiIpCj4gPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQg
dG8gdGVzdCBmb3IgdGhlIFBJRCBmaWxlIGJlZm9yZSB3ZQo+ID4gY29ubmVjdCB0byB0aGUgZGFl
bW9uLiBJZiB0aGUgZGFlbW9uIGlzIG5vdCBydW5uaW5nLCB3ZSB3b24ndCBiZSBhYmxlIHRvCj4g
PiBjb25uZWN0IHRvIGl0LCBzbyB0aGUgdGVzdCB3aWxsIGZhaWwsIHNvIHRoZSBQSUQgZmlsZSB0
ZXN0IGlzIHJlZHVuZGFudCwKPiA+IG5vPwo+IEkgYW0gYmVpbmcgdGhvcm91Z2guIEkgY2FuIHJl
bW92ZSB0aGUgY2hlY2sgZm9yIHRoZSBQSUQgZmlsZSBpZiB5b3Ugd2FudC4KCkkgc2VlLiBIb3dl
dmVyLCB3aGF0IEkgd29uZGVyIGlzOiB3aGF0IGRvZXMgaXQgYnJpbmcsIGZyb20gdGhlCmludGVn
cmF0aW9uIGluIEJ1aWxkcm9vdCBwZXJzcGVjdGl2ZT8gV2hhdCBJIG1lYW4gaXM6CgogIC0gYSBy
dW50aW1lIHRlc3QgaXMgbWVhbnQgdG8gdmFsaWRhdGUgdGhhdCB0aGUgaW50ZWdyYXRpb24gaW4K
ICAgIEJ1aWxkcm9vdCBpcyBkZWxpdmVyaW5nIGEgcGFja2FnZSB0aGF0IGlzIHdvcmtpbmcsIGFu
ZCB3b3JraW5nIGFzCiAgICBleHBlY3RlZCwgYXQgbGVhc3QgaW4gaXRzIGJhc2ljIGZlYXR1cmVz
OwoKICAtIGEgcnVudGltZSB0ZXN0IHNoYWxsIGZhaWwgd2hlbiB0aGUgZXhwZWN0YXRpb25zIGFy
ZSBub3QgbWV0LCB3aXRoIGEKICAgIHByb3BlciByZXBvcnQgb2Ygd2hhdCBpcyBicm9rZW4uCgpT
bywgaW4gdGhpcyBjYXNlLCBxdWVyeWluZyB0aGUgREIgc2hvdWxkIGJlIGVub3VnaCB0byBjaGVj
ayB0aGF0IHRoZQpkYWVtb24gaXMgcnVubmluZzogaWYgaXQgaXMgbm90IHJ1bm5pbmcsIHRoZW4g
dGhlIHF1ZXJ5IHdpbGwgZmFpbCB3aXRoCnRoZSBhcHByb3ByaWF0ZSBtZXNzYWdlLCB3aGljaCBp
cyBnb2luZyB0byBiZSBkaWZmZXJlbnQgZnJvbSB0aGUgY2FzZQp3aGVyZSB0aGUgREIgZG9lcyBu
b3QgZXhpc3QsIG9yIHdoZXJlIHRoZSBhY2Nlc3MgdG8gdGhlIERCIGhhcyBiZWVuCmRlbmllZCBi
eSBsYWNrIG9mIHByb3BlciBjcmVkZW50aWFscywgb3IuLi4KCklmIGEgZmFpbHVyZSB0byBxdWVy
eSB0aGUgREIgY2FuJ3QgaW5kZWVkIGRpZmZlcmVudGlhdGUgdGhlIGRhZW1vbi1pcy0Kbm90LXJ1
bm5pbmcgY2FzZSBmcm9tIHRoZSBvdGhlcnMsIHRoZW4gaW5kZWVkIHdlIG5lZWQgYW5vdGhlciB3
YXkuIEJ1dAp0aGVuIHdlIG5lZWQgZXhwbGFuYXRpb25zIGFib3V0IHRoYXQsIGhvd2V2ZXIgYnJp
ZWYgdGhleSBiZS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
