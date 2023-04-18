Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98D0C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 17:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 196D2614DC;
	Tue, 18 Apr 2023 17:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 196D2614DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITKG62rERqi4; Tue, 18 Apr 2023 17:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B44614E7;
	Tue, 18 Apr 2023 17:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B44614E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F04F1C4303
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 17:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3742061140
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 17:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3742061140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B68wfVjvq7OA for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 17:45:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08A1860E7A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08A1860E7A
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 17:45:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 997615FFA3;
 Tue, 18 Apr 2023 19:44:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 18 Apr 2023 19:44:52 +0200
Date: Tue, 18 Apr 2023 19:44:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230418174452.GP2819@scaer>
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20230415212933.GU2819@scaer>
 <CADvTj4o4dPhWnKiQ0dvm6cJSqwY+ZtbyE0Gwhh8A5Nc5dKPYOQ@mail.gmail.com>
 <20230416082556.GW2819@scaer> <20230416111659.GY2819@scaer>
 <CADvTj4q-qJ6EiYxOcNfgQRL1q7UPNp9SC7s_CwBVeCk=6PrMqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4q-qJ6EiYxOcNfgQRL1q7UPNp9SC7s_CwBVeCk=6PrMqw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681839897;
 bh=gEBemgRrxLS9f8CsPSZmldlDAs2ktlPLNRS276wio9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/4ASQgTUdkVLWdiyUXtHalr0jF4j3QIK5P7wKnWqXIcFl94/3SzIcE/tYeDCsotQ
 2PYGNGXhGJCcFXsFZ2RJ+y8TCqAN8oPyKYCEp/X9fQ4IMnWOnh1z41hfPKeohL8/Dz
 T8u6A3J4LgNXSa+yGa8CKoT8y9sMOOKV9pKbpiYhrMsJNthBV23N7uwDs3hJ64XIaP
 hcSPkYh5Buwbsuik/T1ZSLdnI94aiF0MPxyEt9ExcGxxF5m9o13PXdxSO1gJNDNdGh
 LjzzSzCKb8FGQpfisw6S/otZC6i4av/2yrSwBWdqZihiVgvhuRNKZJaGgdv80H9aTL
 2p5A2z6vvijqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h/4ASQgT
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDQtMTggMDI6MDMgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIEFwciAxNiwgMjAyMyBhdCA1OjE34oCvQU0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4gT24gMjAyMy0wNC0xNiAx
MDoyNSArMDIwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gPiA+IE9uIDIwMjMtMDQt
MTUgMjA6NDQgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+ID4gPiBPbiBT
YXQsIEFwciAxNSwgMjAyMyBhdCAzOjMw4oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4gPiBbLS1TTklQLS1dCj4gPiA+ID4gPiBIb3dldmVyLCBJ
IHdvdWxkIHJlYWxseSBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IHdlIGRvbid0IGhhdmUgbW9yZQo+
ID4gPiA+ID4gcGFja2FnZXMgdGhhdCBhcmUgYnJva2VuLiBJcyBpdCBiZWNhdXNlIHBvcHBsZXIg
aXMgdGhlIG9ubHkgb25lIHdpdGgKPiA+ID4gPiA+IGluY2x1ZGUgZGlyZWN0aXZlcyBpbiBoaXMg
Z2lyIGZpbGUsIHdoaWNoIG1lYW5zIGl0IG5lZWRzIGFjY2VzcyB0byB0aGUKPiA+ID4gPiA+IGlu
c3RhbGxlZCBnaXIgZmlsZXMgZnJvbSBvdGhlciBwYWNrYWdlcyAodGhvc2UgZnJvbSBnb2kpPwo+
ID4gPiA+ID4KPiA+ID4gPiA+IE9yIGlzIGl0IGJlY2F1c2UgaXQgaXMgdGhlIG9ubHkgb25lIHRo
YXQgYWxyZWFkeSBwYXNzZXMgYW4gZXhwbGljaXQKPiA+ID4gPiA+IC0taW5jbHVkZWRpciBvcHRp
b24gdG8gZy1pci1jb21waWxlciwgYW5kIHRoYXQgZGlzYWJsZXMgc2VhcmNoaW5nIHRoZQo+ID4g
PiA+ID4gc3RhbmRhcmQgZGlyZWN0b3J5Pwo+ID4gPiA+IEZyb20gdGhlIGxvb2tzIG9mIGl0IG1v
c3Qgb2Ygb3VyIHBhY2thZ2VzIHdpdGggYSBnb2JqZWN0LWludHJvc3BlY3Rpb24KPiA+ID4gPiBk
ZXBlbmRlbmN5IGFyZSBtZXNvbiBiYXNlZCB3aGljaCB1c2UgdGhlIG5hdGl2ZSBtZXNvbiBpbnRl
Z3JhdGlvbi4KPiA+ID4gQWgsIGdvb2QgcG9pbnQsIHRoYXQgd291bGQgZXhwbGFpbi4KPiA+IFVu
Zm9ydHVhbnRlbHksIHRoYXQgYXNzdW1wdGlvbiBpcyB3cm9uZzogZ3Jhbml0ZSB1c2VzIG1lc29u
LCBidXQgZmFpbHMKPiA+IGluIHRoZSBzYW1lIHdheToKPiBXaGlsZSBpdCdzIHRydWUgaXQgZG9l
cyB1c2UgbWVzb24uLi5pdCBkb2VzIG5vdCBpbiBmYWN0IHVzZSB0aGUgbmF0aXZlIG1lc29uCj4g
aW50ZWdyYXRpb24gYnV0IHJhdGhlciB1c2VzIGEgcHJvamVjdCBzcGVjaWZpYyBnb2JqZWN0LWlu
dHJvc3BlY3Rpb24gZ2VuZXJhdG9yOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9lbGVtZW50YXJ5L2dy
YW5pdGUvYmxvYi82LjAuMC9saWIvbWVzb24uYnVpbGQjTDEwMi1MMTIxCgpTdXJlLCBidXQgdGhl
biBtYXliZSBpdCBiZWdzIGZvciBhIGdlbmVyaWMgc29sdXRpb24sIHRoYXQgd29ya3MgZm9yIGFs
bApwYWNrYWdlcz8KCk1heWJlIHNvbWV0aGluZyBsaWtlIHdlIHVzZWQgR0lSX0VYVFJBX0xJQlNf
UEFUSCBmcm9tIHRoZSBlbnZpcm9ubWVudCwKd2UgY291bGQgYWxsb3cgcGFjbGFnZXMgdG8gc3Bl
Y2lmeSBhZGRpdGlvbmFsIGluY2x1ZGUgZGlyZWN0b3JpZXMgd2l0aApHSVJfRVhUUkFfSU5DTFVE
RV9QQVRIID8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
