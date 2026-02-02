Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C73E7DF0F
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71B2283613;
	Mon,  2 Feb 2026 18:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-axGBjOVqBP; Mon,  2 Feb 2026 18:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C9D48376D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056599;
	bh=eV5r8iH/WVGJspCG2mGGLxqJfhtjiQablifv64B5o20=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=tG4rBSSWcDFkYxd3jyDHhswC63MIZHomPg3Lpemi0RsWZL2LNuKmsKW0lIWABHlSu
	 nJhKh1KNG2K0HwroFTJEajP+uMSMaJe/sLs9MXNcEsBCmv38PJ0/Fn90Hu9/iXYL1Z
	 Aff8A7EA++W67FtOLFKIytkgmhVwahFUVfAkw7l7U3V6IGdnpaF2z7IqHbflM9AhB1
	 x7Pz7remJK8waEa62Xj4RJAdNUBIRGsIisvQPLrzyRJr455dJSFKxKp0VxELdqTUIu
	 BFds9R5YwFVYNuh+ami63mqNEYUS34hYy9AguLf/Icjl0WgCx2zGyr0luWVX5ud4Uz
	 iK7exdZWJuTVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9D48376D;
	Mon,  2 Feb 2026 18:23:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A739CF5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DE1D40244
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ofYkSyOVocb for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:23:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE92E400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE92E400C5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE92E400C5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:23:16 +0000 (UTC)
Received: from [172.16.2.205] (host-109-89-232-55.dynamic.voo.be
 [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7BE342C82ED6;
 Mon, 02 Feb 2026 19:23:14 +0100 (CET)
Message-ID: <2397b442-5407-49bc-803d-35725fb8fa4c@bubu1.eu>
Date: Mon, 2 Feb 2026 19:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
References: <20260202150143.3996204-1-buildroot@bubu1.eu>
 <20260202150143.3996204-2-buildroot@bubu1.eu>
 <CADvTj4qKJ05RgzwhQ=Ado-e=q8mb02wrXsUu43scugyE+OcEQg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADvTj4qKJ05RgzwhQ=Ado-e=q8mb02wrXsUu43scugyE+OcEQg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770056594; bh=Mo+V+Rq8ykkENkuAzZ2yaf1nIOpEdSSa7xtd2ZGaqp4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rGdLdjulhlLeHNzco+z+/JziLi8i2dML6x2qhG8khNWwSQwP/OhfNd/RZ3v3Fopm6
 y2gNvgK12sRFuvZjKkVhsPmxqFd6QRGRDAX7RuwMBi4P7v5TCl5j5ery8ahtzlYktr
 pbmIuOkn/fxA7OCXj2lPm9pM2mZCY4KwKb5wFIVQmfTzyd0c2pPnyBtU9nqCW1vMO8
 AGghT/Vzp1ehie7KNqtHZfQI1kpaUepOJt4r3UCHvK1oRkhfDPvtmaNIPes7xYz+6V
 TYyzXgLk8iNbO3L5bCOj9gNEvcVbogMVUmXgCWG024dCx1sQWFHun91ciZoru+XnHc
 Ia2nzW1hwFoSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=rGdLdjul
Subject: Re: [Buildroot] [PATCH 2/2] package/python-requests: depend on
 system certificates instead of python-certifi
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <bubu@bubu1.eu>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiAyLzIvMjYgMTg6MjcsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+IE9uIE1v
biwgRmViIDIsIDIwMjYgYXQgODowMeKAr0FNIE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1
YnUxLmV1PiB3cm90ZToKPj4KPj4gQWRkIHBhdGNoIGZyb20gYXJjaGxpbnV4IGRpc3RyaWJ1dGlv
blsxXSB0aGF0IHJlZmVyZW5jZXMgc3lzdGVtCj4+IGNlcnRpZmljYXRlIHN0b3JlIGluc3RlYWQg
b2YgdXNpbmcgdGhlIHB5dGhvbiBjZXJ0aWZpIHBhY2thZ2UuCj4+Cj4+IEFzIGEgdXNlciBvZiB0
aGUgcmVxdWVzdHMgcGFja2FnZSwgSSdkIGV4cGVjdCB0aGlzIHRvIHVzZSB0aGUgc3lzdGVtCj4+
IGNlcnRpZmljYXRlIHN0b3JlIGFuZCBub3QgcHVsbCBpbiBhbm90aGVyIGNlcnRpZmljYXRlIHN0
b3JlIHRoYXQgbXVzdCBiZQo+PiBrZXB0IHVwLXRvLWRhdGUgc2VwYXJhdGVseSAoYW5kIGlzIGN1
cnJlbnRseSBvdXRkYXRlZCBpbiBidWlsZHJvb3QpLgo+IAo+IEkgZ2VuZXJhbGx5IGRvIHRyeSB0
byBrZWVwIHRoZSBweXRob24gY2VydGlmaSBwYWNrYWdlIHVwIHRvIGRhdGUgYXMKPiBJIHRoaW5r
IHF1aXRlIGEgZmV3IGRpZmZlcmVudCBweXRob24gcGFja2FnZXMgdXNlIGl0IGZvciBjZXJ0aWZp
Y2F0ZXMuCgpUaGF0J3MgZmFpciBhbmQgaXMgaGFzIGJlZW4gZmFpcmx5IHVwIHRvIGRhdGUgcmVj
ZW50bHksIEkgYWN0dWFsbHkgaGFkIAp0aGlzIHBhdGNoIGx5aW5nIGFyb3VuZCBmb3IgYSB3aGls
ZS4gKEFuZCBJIGNoZWNrZWQgYmVmb3JlIHNlbmRpbmcgYXMgCndlbGwsIGJ1dCBtaXNzZWQgdGhl
IHJlY2VudCBidW1wIHNvbWVob3csIHNvcnJ5ISkKCj4gCj4+Cj4+IFRoZSBmaWxlIHRoYXQgaXMg
cGF0Y2hlZCBleHBsaWNpdGx5IG1lbnRpb25zIHRoYXQgYXMgYW4gb3B0aW9uIGZvcgo+PiBkaXN0
cmlidXRpb25zLiBUaGlzIGFwcHJvYWNoIGlzIHRha2VuIGJ5IEZlZG9yYVsyXSBhbmQgQXJjaGxp
bnV4IGJ1dCBub3QKPj4gYnkgb3RoZXIgZGlzdHJpYnV0aW9ucyAoYWxwaW5lLCBvcGVuZW1iZWRk
ZWQsIGRlYmlhbiwgbml4LCBndWl4KS4KPiAKPiBJJ20gYSBiaXQgc2tlcHRpY2FsIHRoaXMgaXMg
YSBnb29kIGlkZWEsIG1vc3RseSBiZWNhdXNlIG90aGVyIHB5dGhvbgo+IHBhY2thZ2VzIHVzaW5n
IGNlcnRpZmkgd291bGQgdGhlbiBiZWhhdmUgZGlmZmVyZW50bHkgZnJvbSByZXF1ZXN0cy4KPiAK
PiBJdCdzIGtpbmQgb2Ygc3ViamVjdGl2ZSBob3dldmVyIHNvIEknbSBub3Qgc3VyZSB3aGF0J3Mg
YWN0dWFsbHkgYmVzdC4KCkkgbW9zdGx5IGxvb2tlZCBpbnRvIHRoaXMgYmVjYXVzZSBJIGFsd2F5
cyBmb3VuZCBpdCBzdHJhbmdlIHRoYXQgCnJlcXVlc3RzIHdvdWxkIGRlcGVuZCBhbiBhIHNlcGFy
YXRlIGNvcHkgb2YgdGhlIGNlcnRpZmljYXRlIHN0b3JlLCB3aGVuIApvbmUgaXMgYWxyZWFkeSBp
bnN0YWxsZWQgaW4gdGhlIHN5c3RlbSBhbmQgdXNlZCBieSBhbGwgdGhlIG90aGVyIHN5c3RlbSAK
bGV2ZWwgdGhpbmdzLCBsaWtlIGxpYmN1cmwsIGV0Yy4KQWxzbyBhaW9odHRwIGRlZmF1bHRzIHRv
IHRoZSBzeXN0ZW0gQ0Egc3RvcmUuCgpJJ2QgcHJlZmVyIHN3aXRjaGluZyByZXF1ZXN0cyB0byBh
bHNvIHVzZSB0aGUgc3lzdGVtIGNhIHN0b3JlIGFuZCBhbHNvIApub3QgcHVsbCBpbiBjZXJ0aWZp
LCBidXQgaXQncyBzb21ld2hhdCBhIG1lc3MgaW4gdGhlIGVjb3N5c3RlbSBlaXRoZXIgd2F5LgoK
Wy4uLl0KCk1hcmN1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
