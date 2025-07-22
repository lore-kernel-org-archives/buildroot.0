Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12689C83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 16:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F9C606B1;
	Tue, 22 Jul 2025 16:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlEu24QWwA_K; Tue, 22 Jul 2025 16:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1BA0610F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1BA0610F5;
	Tue, 22 Jul 2025 16:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 414D8DA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2806940258
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVb8tK8No89g for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 16:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C56D840185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C56D840185
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C56D840185
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:33:19 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id eFvZum9JUX2UCeFvZuxayY; Tue, 22 Jul 2025 18:33:17 +0200
Message-ID: <645285ff-a58d-438a-b103-7741f6fa8702@benettiengineering.com>
Date: Tue, 22 Jul 2025 18:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedts.com>, Louis Aussedat
 <aussedat.louis@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
 <20250701190841.714026-4-giulio.benetti@benettiengineering.com>
 <95cd2991e059bd354fabe1244ec3b2b2@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <95cd2991e059bd354fabe1244ec3b2b2@free.fr>
X-CMAE-Envelope: MS4xfI/iadKlkGOIFd+PuDjHyiqHVu/g+IysGJvPgpREvUIJzUkzp+DgJ/W9cWePPXhQm2rxQQi4Mr4TbJBY9AMX2IWyB/zDi0PiGHfT9P9ML5UDm2xZTEKA
 uPGExzgIoA0wBEv9ss0DsLX/9KYvrrIj1j5qK+NFBtEJVGU4phtwITqmwm9hzoRtfjuXFkuBvhzLDm/3fprtMHrn9kBjlEHzL60+s/zIlW/yZLxc70vpHdkK
 MjFbDsTOP9yGNEaEaGRA5oh0K0WFXRyakp/L6Z6QjQfwUdL535J1tIfHJGPpeJRfwcfA+1iefKrtq4+BH4V0s5Cq+94nbki4KdxOYbksct9dDTWpXQXKooZM
 8nqdfR+CXcXqYrt4XzbjvfGFxiUFeg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753201997; bh=RAQnCNDl6PyLGelSepTCgbY6ep02yHQZulCE9v6ByM4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=SLHCVIWIVxi+OuuIY/O1Qpfvn4tosS33yetSuGQnabFvDAhiFAnnvODYpXFQKBA7n
 kEtsM5HZ/e53XwiZTEBNNMCl0oyFORyyCkZEec7YekXdiFEulbUZzTWK4oXLBIDsZw
 R2Xy8r+c/TLcLlGHMfFZloMD7farwmbZZUGqRur8VaOo9A4ixSVTELmrkH+/OoeaXb
 QKmoKUwhg4Frk9YUHZ7PhSMbGUPTns4XUO4uUT11EwmlJB4ffuNsBwQw1VnIn2rXD7
 F5qIc8vOSEX8kyb/5vlexay3FDYsbK6UspmSYhbp3wO/QFHvYemqZzSFkQf7gc4TIQ
 cUoBvjhyBcDbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=SLHCVIWI
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure with
 Linux 6.15
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gNy8yMS8yNSAyMjo1OSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkg
R2l1bGlvLAo+IAo+IE9uIDAxLzA3LzIwMjUgMjE6MDgsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+
PiBBZGQgbG9jYWwgcGF0Y2ggcGVuZGluZyB1cHN0cmVhbSB0byBmaXggYnVpbGQgZmFpbHVyZSB3
aXRoIExpbnV4IDYuMTUKPj4KPj4gRml4ZXM6Cj4+IHN0aWxsIG5vdCBvY2N1cmVkLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2lu
ZWVyaW5nLmNvbT4KPj4gLS0tCj4+IMKgLi4uLzAwMDEtRml4LWJ1aWxkLXdpdGgtTGludXgtNi4x
NS5wYXRjaMKgwqDCoMKgwqAgfCAzOCArKysrKysrKysrKysrKysrKysrCj4+IMKgMSBmaWxlIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKykKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS94
cjgxOS14cmFkaW8vMDAwMS1GaXgtYnVpbGQtd2l0aC0gCj4+IExpbnV4LTYuMTUucGF0Y2gKPj4K
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveHI4MTkteHJhZGlvLzAwMDEtRml4LWJ1aWxkLXdpdGgt
TGludXgtNi4xNS5wYXRjaCAKPj4gYi9wYWNrYWdlL3hyODE5LXhyYWRpby8wMDAxLUZpeC1idWls
ZC13aXRoLUxpbnV4LTYuMTUucGF0Y2gKPiAKPiBUaGUgcGF0Y2ggdGl0bGUgbWVudGlvbiAicGFj
a2FnZS9ydGw4MTg5ZXMiIGJ1dCB0aGUgcGFja2FnZSBwYXRjaAo+IGlzIGFkZGVkIGluICJwYWNr
YWdlL3hyODE5LXhyYWRpbyIuIENvdWxkIHlvdSBjbGFyaWZ5IG9yIHNlbmQgYW4gdXBkYXRlZAo+
IHBhdGNoIGlmIHRoaXMgaXMgYSBtaXh1cCwgcGxlYXNlPwoKSSd2ZSBjb25mdXNlZCBpdCB3aXRo
IGFsbCB0aGUgb3RoZXIgZHJpdmVycywgeWVzLiBJJ3ZlIGp1c3Qgc2VudCBhbm90aGVyCnBhdGNo
IHdpdGggcGF0Y2ggdXBzdHJlYW1lZDoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDcyMjE2MzA0OS4yNTg0Nzk4LTEtZ2l1bGlvLmJlbmV0
dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KCi0tIApHaXVsaW8gQmVuZXR0aQpDRU8mQ1RPQEJl
bmV0dGkgRW5naW5lZXJpbmcgc2FzCmh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L2Jl
bmV0dGktZW5naW5lZXJpbmctc2FzLwpodHRwczovL3d3dy5saW5rZWRpbi5jb20vaW4vZ2l1bGlv
LWJlbmV0dGktNzk5NzU5NTEvCgo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAw
MDAwMDAwLi5jZTBiM2YzOTA4Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvcGFja2FnZS94cjgx
OS14cmFkaW8vMDAwMS1GaXgtYnVpbGQtd2l0aC1MaW51eC02LjE1LnBhdGNoCj4+IEBAIC0wLDAg
KzEsMzggQEAKPj4gK0Zyb20gNmUxNzBjOTZiZjUwYTEwODhkNWRkODVmZGZkNjdkYzdmODNlNGVi
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPj4gK0Zyb206IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiArRGF0ZTogVHVlLCAxIEp1bCAy
MDI1IDIwOjUxOjQwICswMjAwCj4+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCB3aXRoIExp
bnV4IDYuMTUKPj4gKwo+PiArQ29tbWl0Ogo+PiAraHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0LyAKPj4gY29tbWl0Lz9pZD04
ZmE3MjkyZmVlNWM1MjQwNDAyMzcxZWE4OQo+PiArYWIyODVlYzg1NmM5MTYKPj4gK2Ryb3BzIGRl
bF90aW1lcl9zeW5jKCkgaW4gZmF2b3Igb2YgdGltZXJfZGVsZXRlX3N5bmMoKSBzbyBsZXQncyBi
YWNrcG9ydAo+PiArbG9jYWxseSBmdW5jdGlvbnMgZGVsX3RpbWVyX3N5bmMoKSB3aGVuIExpbnV4
IHZlcnNpb24gaXMgNi4xNS4wIG9yIAo+PiBsYXRlci4KPj4gKwo+PiArVXBzdHJlYW06IGh0dHBz
Oi8vZ2l0aHViLmNvbS9maWZ0ZWVuaGV4L3hyYWRpby9wdWxsLzI2Cj4+ICtTaWduZWQtb2ZmLWJ5
OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4K
Pj4gKy0tLQo+PiArIHhyYWRpby5oIHwgNyArKysrKysrCj4+ICsgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQo+PiArCj4+ICtkaWZmIC0tZ2l0IGEveHJhZGlvLmggYi94cmFkaW8uaAo+
PiAraW5kZXggZTdmNjBmNi4uOTUwNjk4NiAxMDA2NDQKPj4gKy0tLSBhL3hyYWRpby5oCj4+ICsr
KysgYi94cmFkaW8uaAo+PiArQEAgLTQ3LDYgKzQ3LDEzIEBACj4+ICsgI2luY2x1ZGUgInBtLmgi
Cj4+ICsgI2luY2x1ZGUgImZ3aW8uaCIKPj4gKwo+PiArKyNpZiAoTElOVVhfVkVSU0lPTl9DT0RF
ID49IEtFUk5FTF9WRVJTSU9OKDYsIDE1LCAwKSkKPj4gKytzdGF0aWMgaW5saW5lIGludCBkZWxf
dGltZXJfc3luYyhzdHJ1Y3QgdGltZXJfbGlzdCAqdGltZXIpCj4+ICsrewo+PiArK8KgwqDCoCBy
ZXR1cm4gdGltZXJfZGVsZXRlX3N5bmModGltZXIpOwo+PiArK30KPj4gKysjZW5kaWYKPj4gKysK
Pj4gKyAvKiAjZGVmaW5lIFJPQ19ERUJVRyAqLwo+PiArIC8qIGhpZGRlbiBzc2lkIGlzIG9ubHkg
c3VwcG9ydGVkIHdoZW4gc2VwYXJhdGUgcHJvYmUgcmVzcCBJRQo+PiArwqDCoMKgIGNvbmZpZ3Vy
YXRpb24gaXMgc3VwcG9ydGVkICovCj4+ICstLQo+PiArMi4zOS41Cj4+ICsKPj4gLS0gCj4+IDIu
MzkuNQo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
