Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06951C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 12:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83175400DC;
	Mon,  4 Dec 2023 12:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83175400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OapAusvsroh0; Mon,  4 Dec 2023 12:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72C894012F;
	Mon,  4 Dec 2023 12:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72C894012F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18AA01BF349
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 12:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1CAE4012F
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 12:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1CAE4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYe-4KjEsIR1 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 12:09:20 +0000 (UTC)
Received: from linux1801mail.webawere.nl (linux1801mail.webawere.nl
 [185.158.164.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99597400DC
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 12:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99597400DC
Received: from [185.47.134.76] (helo=share.bybram.com)
 by linux1801.webawere.nl with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2-12-g29d01ae2a)
 (envelope-from <dev@bybram.com>) id 1rA7lE-007NYw-1p;
 Mon, 04 Dec 2023 13:09:16 +0100
From: Bram Oosterhuis <dev@bybram.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Peter Korsgaard
 <peter@korsgaard.com>
References: <87sf4l4r2g.fsf@48ers.dk>
In-Reply-To: <87sf4l4r2g.fsf@48ers.dk>
Message-ID: <20231204120912.Horde.MiMZD2QDgDP7hfNUa962ceB@share.bybram.com>
User-Agent: Horde Application Framework 5
Date: Mon, 04 Dec 2023 12:09:12 +0000
MIME-Version: 1.0
X-Authenticated-Id: dev@bybram.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=bybram.com; 
 s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:
 In-Reply-To:References:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HhN3fs1WGOehOXvecb1t1cJjEtd7ve+PkCftXVlKLSs=; b=WSaKac4gQ57T0/odL3ABwAhLSc
 SaCEycxy6kZKf13snXJJfn14j55fIgNCcx+RD3f5Jroj3K9h/L/DRvx4aS6jHqcvHXVcHC+h4P2pu
 2PhbGvb1z2/evq/KiW9hrvszX+kxKslFIXLRSG79mjG+qtTnyaVD8YaJnxnO1ygGUuMc+S872zmTH
 heWJy+OKYLTvnGfIyvwuSkLb1MAD9vgmrflfKgGNpqKfU+soEw4OV3ejLZN6c+IB5p1AwT4xbpwxK
 aMDVKfPiVtY/yG4Qqg2a8rxU6iC7TJuixu2VXDu6JsfE+hHHERP6qgmCIAeKIxlNaPrUP/Rx4ntcD
 fDE/mVLw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bybram.com header.i=@bybram.com
 header.a=rsa-sha256 header.s=x header.b=WSaKac4g
Subject: Re: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump Linux version
 to 6.1.61
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
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCsKgClJlYWRpbmcgdGhlIFBSIChodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5
cGkvbGludXgvaXNzdWVzLzQ5NjYpIFRoZSBSUEkgdGVhbSBkaWQgbWVhc3VyZW1lbnRzIGl0IHJl
ZHVjZXMgZmxhc2ggc3BhY2Ugd2hpbGUgbm90IHJlYWxseSBpbXBhY3RpbmcgYm9vdCB0aW1lLiBC
YXNlZCBvbiB0aGUgY29tbWVudHMgSSB0aGluayBpdCB0ZWNobmljYWxseSBhIGdvb2Qgc29sdXRp
b24sIGJ1dCB0aGUgY29uZmlnIGluIGJ1aWxkcm9vdCBnZXRzIGEgYml0IG1vcmUgY29tcGxleC4g
VGhlIGtlcm5lbCBtb2R1bGVzIHdpbGwgbm90IGV4Y2VlZCB0aGUgZGVmYXVsdCByb290ZnMgc2l6
ZS4KwqAKR29pbmcgZm9yIGttb2Qgb3IgZm9yIGEga2VybmVsIGZyYWdtZW50IGlzIEkgdGhpbmsg
YSBwZXJzb25hbCBjaG9pY2UuIEkgd29ya2VkIHdpdGggYm90aCBzb2x1dGlvbnMgYW5kIGJvdGgg
d29yayBmaW5lLiBBbHNvIEkgY2hlY2tlZCB0aGUgWW9jdG8vT0UgUlBJIEJTUCBhbmQgdGhlcmUg
dGhlIGRlZmF1bHQgaW50cmVlIGtlcm5lbCBkZWZjb25maWcgaXMgYnVpbGQsIGFsc28gd2l0aCBj
b21wcmVzc2VkIGtlcm5lbCBtb2R1bGVzLiBJbiB0aGUgZW5kIEkgZGVjaWRlZCB0aGF0IGZvbGxv
d2luZyB0aGUgUlBJIHRlYW0vY29tbXVuaXR5IHdvdWxkIG1ha2Ugc2Vuc2UuwqAKwqAKSWYgeW91
IG9yIHNvbWVvbmUgZWxzZSBoYXMgYSB0ZWNobmljYWwgYXJndW1lbnQgY2hvb3NpbmcgdG8gc3dp
dGNoIGNvbXByZXNzZWQga2VybmVsIG1vZHVsZXMgb2ZmLCBJJ20gZmluZSB0byBjaGFuZ2UgdGhl
IGNvbmZpZ3MgYWNjb3JkaW5nbHkuCsKgCkNoZWVycyzCoApCcmFtCsKgCiJQZXRlciBLb3JzZ2Fh
cmQiIHBldGVyQGtvcnNnYWFyZC5jb20g4oCTIDEgZGVjZW1iZXIgMjAyMyAyMToxNQo+ID4+Pj4+
ICJZYW5uIiA9PSBZYW5uIEUgTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cml0ZXM6
Cj7CoAo+ID4gQnJhbSwgQWxsLAo+ID4gT24gMjAyMy0xMS0wNCAyMzowMSArMDEwMCwgQnJhbSBP
b3N0ZXJodWlzIHNwYWtlIHRodXNseToKPiA+PiBMaW51eCA2LjEgaGFzIGJlZW4gbWFya2VkIExU
UyBmb3IgYSBsb25nIHRpbWUgbm93LiBUaW1lIHRvIGJ1bXAKPiA+PiBMaW51eCBmb3IgUmFzcGJl
cnJ5UGkncyB0byB0aGUgbGF0ZXN0IDYuMS42MSBTaW5jZSBBcHJpbCAyMDIyCj4gPj4gdGhlIFJh
c3BiZXJyeVBpIGRlZmNvbmZpZ3MgaGF2ZSBjb21wcmVzc2VkIGtlcm5lbCBtb2R1bGUgZW5hYmxl
ZAo+ID4+IGJ5IGRlZmF1bHQuIChzZWUgWzFdIGFuZCBbMl0pLgo+ID4+wqAKPiA+PiBUbyBsb2Fk
IGNvbXByZXNzZWQga2VybmVsIG1vZHVsZXMga21vZCBhbmQgeHogcGFja2FnZXMgYXJlIG5lZWRl
ZAo+ID4+IGJlY2F1c2UgYnVzeWJveCBkb2Vzbid0IHN1cHBvcnQgaXQuCj4gPj7CoAo+ID4+IEZv
ciB0ZXN0aW5nIEkgdXNlZCBSYXNwYmVycnlQaSAyLCAzKDMyKzY0Yml0KSBhbmQgNCgzMis2NGJp
dCksIGFsbCB3aXRoIG1kZXYgZW5hYmxlZC4KPiA+PsKgCj4gPj4gWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXNwYmVycnlwaS9saW51eC9jb21taXQvYzQ1YjQyMjNhNGU0YThjZmUzOWVkYmI0OTQ5
MzI5ZWE0NzhmYTRlMgo+ID4+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGlu
dXgvaXNzdWVzLzQ5NjYKPiA+PsKgCj4gPj4gU2lnbmVkLW9mZi1ieTogQnJhbSBPb3N0ZXJodWlz
IDxkZXZAYnlicmFtLmNvbT4KPsKgCj4gPiBBcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4KPsKgCj4g
U29ycnkgZm9yIHRoZSBzbG93IHJlc3BvbnNlLCB0aGUgeHogY29tcHJlc3NlZCBtb2R1bGVzIHNl
ZW1zIGEgYml0IG9mIGEKPiByYW5kb20gY2hvaWNlIGJ5IHRoZSBycGkgcGVvcGxlLiBJIHdvbmRl
ciBpZiBpdCB3b3VsZG4ndCBtYWtlIG1vcmUgc2Vuc2UKPiB0byB1c2UgYSBrZXJuZWwgY29uZmln
IGZyYWdtZW50IHRvIGp1c3QgZGlzYWJsZSB0aGF0IHJhdGhlciB0aGFuCj4gZW5mb3JjaW5nIGtt
b2Q/Cj7CoAo+IE9yIGRvIHRoZXkgZW5hYmxlIHNvIG1hbnkgbW9kdWxlcyB0aGF0IHRoZXkgcmVh
bGx5IHRha2UgdXAgYSBodWdlIHNwYWNlCj4gKGFuZCBub3QgZml0dGluZyBpbiBvdXIgZGVmYXVs
dCByb290ZnMgc2l6ZSk/Cj7CoAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
