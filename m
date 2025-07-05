Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C07EC83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 19:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E6F40CDF;
	Sat,  5 Jul 2025 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qy10jMglbW_y; Sat,  5 Jul 2025 19:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7745240C51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7745240C51;
	Sat,  5 Jul 2025 19:46:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AFE515F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CBCC610FD
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLoecoXsX64D for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 19:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 681DF610F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 681DF610F6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 681DF610F6
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:46:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3823C19F593;
 Sat,  5 Jul 2025 21:46:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Jul 2025 21:46:27 +0200
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 21:46:27 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dick Olsson <hi@senzilla.io>, xry111@xry111.site, jeffbai@aosc.io
In-Reply-To: <7b67757c-fe17-4570-ac54-800272c4d0cc@app.fastmail.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
 <20250618-loongarch-v3-2-d11baae32eea@flygoat.com>
 <3f1060fd8783b35211b3de718d350dd1@free.fr>
 <dbf55473-aede-485c-a896-8d014d103d06@app.fastmail.com>
 <ecc1d845fa77dc51dc67bf25fe08de42@free.fr>
 <7b67757c-fe17-4570-ac54-800272c4d0cc@app.fastmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <915b80cfd83cf94c71581c4b1080da3b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751744795;
 bh=du4f4QgmjeUXHbpDkfUCw27CBewWbGZrdgNbxhMV2aU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tfYHRCPH7HpfYvWFXpCjiIZDP7ibgXRfWtdya7DQ0dzEPdC7fGOaSvZT4JJAnZAUE
 6u9loJcsdinRkY2U8NuI0+MjOTBZyVaVNa8yGvwWKRVI0KlUwWsnrvQqSuT47E9pzt
 2lkRQmUT/V9OGkCTOiUfNnZ5FMY5n4SvwRTaca5RZ57yZrKdaYindlzUZw0Ck3nkKT
 B7OoJ79eNKXPzsD+mLF4MHGhAzZiBFi8XtkMDpWVxKlkyQ+C5d5kbF/OARnDFiI1OS
 R73xhLE9hvk7iaG9kqWgENrAaOUPwgdDKNTSZWowe19bTKxm+qa5DZrYqeUpE8/qNs
 xaboMn6wkn8AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tfYHRCPH
Subject: Re: [Buildroot] [PATCH v3 02/11] arch: Introduce LoongArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmlheHVuLAoKT24gMDUvMDcvMjAyNSAyMDoxNCwgSmlheHVuIFlhbmcgd3JvdGU6Cj4g5Zyo
MjAyNeW5tDfmnIg15pel5ZGo5YWtIOS4i+WNiDY6NTDvvIxKdWxpZW4gT2xpdmFpbuWGmemBk++8
mgo+IEhpIEp1bGlhbiwKPiAKPiBbLi4uXQo+IAo+PiBUaGFua3MgZm9yIHlvdXIgY29uZmlybWF0
aW9uLgo+PiAKPj4gV2l0aCB0aGF0LCBJIGp1c3QgbWVyZ2VkIHRoaXMgc2VyaWVzIGludG8gbWFz
dGVyLgo+IAo+IFRoYW5rcyBmb3IgYWNjZXB0aW5nIGl0IQo+IAo+PiAKPj4gTGV0J3Mgc2VlIGhv
dyBpdCBnb2VzIHdpdGggdGhlIGF1dG9idWlsZGVycy4KPiAKPiBJIGp1c3QgaGFkIGEgdGFsayB3
aXRoIExvb25nc29uIGZvbGtzIGFuZCB0aGV5IGFncmVlZCB0bwo+IHRha2UgY2FyZSBvZiB0aGUg
cG9ydCB0b2dldGhlciB3aXRoIG1lLgo+IAo+IFRoZXkgc2VudCB0d28gZGV2ZWxvcGVycyB0byBo
ZWxwIHdpdGggdXM6Cj4gWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+Cj4gTWluZ2Nvbmcg
QmFpIDxqZWZmYmFpQGFvc2MuaW8+Cj4gCj4gVGhleSBhcmUgYm90aCBMaW51eCBkaXN0cm8gdmV0
ZXJhbnMsIHNvIGl0IHNob3VsZCBiZSBlYXN5Cj4gZm9yIHRoZW0gdG8gbWFpbnRhaW4gdGhlIGFy
Y2hpdGVjdHVyZS4KPiAKPiBTaG91bGQgSSBkcmFmdCBhIHBhdGNoIHRvIGFkZCB0aGVtIHRvIGBE
RVZFTE9QRVJTYD8KClllcywgcGxlYXNlIQoKQW55Ym9keSB3aWxsaW5nIHRvIGhlbHAgaXMgZnJl
ZSB0byByZWdpc3RlciBpbiBERVZFTE9QRVJTLgoKVGhlIHJlZ2lzdGVyZWQgZW1haWxzIHdpbGwg
YmUgcmV0dXJuZWQgdGhlICJ1dGlscy9nZXQtZGV2ZWxvcGVycyIKc2NyaXB0LiBUaG9zZSBlbWFp
bHMgd2lsbCByZWNlaXZlIG5vdGlmaWNhdGlvbnMgYW5kIHBhdGNoZXMuCgpTZWU6Cmh0dHBzOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI0RFVkVMT1BFUlMKYW5k
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNS4w
NS9ERVZFTE9QRVJTI0wxNwoKPiAKPiBUaGFua3MhCj4+IAo+Pj4+IAo+IFsuLi5dCj4+IAo+PiBK
dWxpZW4uCj4gCj4gLS0KPiAtIEppYXh1bgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
