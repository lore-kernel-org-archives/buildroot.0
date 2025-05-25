Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2C7C54F30
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 21:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E9680C99;
	Sun, 25 May 2025 21:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrnUE0yFfwk0; Sun, 25 May 2025 21:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B360280B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B360280B5B;
	Sun, 25 May 2025 21:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0406319D
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA04D40121
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKmzmhjiIOOO for <buildroot@buildroot.org>;
 Sun, 25 May 2025 21:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF340400F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF340400F4
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF340400F4
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:47:12 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id JJBWu79eLRBkHJJBWuqmfj; Sun, 25 May 2025 23:47:10 +0200
Message-ID: <5eab1f88-5b7d-415e-bbc6-4cd37374ee10@benettiengineering.com>
Date: Sun, 25 May 2025 23:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250521224556.560897-1-giulio.benetti@benettiengineering.com>
 <339ce3be0a9df37991aaa4daca9a75d2@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <339ce3be0a9df37991aaa4daca9a75d2@free.fr>
X-CMAE-Envelope: MS4xfKl5fdxm3xdnddLYzarbl423s0yBWHHUlxyhqJ3GhFa5zHNEavnh03wWcimIMVA9O/aKlf3x8V8SQ6OSwdVSWvehBxf6DSHOYia8WKSxqqTXb+KIcVw4
 TLZ6f2cMMoSe5DOyQdDHUdBQFReDHmDZxI/9cVyqmCLGCS0w77MH5sFXsscZ+BVUy29q8aXE4jhtbg2fgA9UdCljoM4Wi/3hGrCpFcjPw9rZYpMC0jBdtMuT
 SbiX3HEBxCWlyisgtHjvo1VZ3HwYsgonO0atl2Z+hd4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1748209630; bh=ZEfGk6zyclYJSCmqz/FAjjL0M08u55Y+JpUAIa76qP8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JFmA0o1kdOcPGjinmPbvynC490ij/M305clnJN9wOBMY6cSatLbDXtiHVPXC6zvTb
 NTDBlB5fXul3E9bVy5tJgVzko9HWGI63jcobF0DYseaQnTeZbmYbOWnp0XQTZZ6E+/
 4vsfke6GKa/WmTqyfaHQA3xLzHzEvmZEPpQ/M0NKUJdY28hUl3yjza4eTCPouKtHEt
 A0v9zeeeCz0ZdMksL47yokIB+WYXqxeIDWRLyMLxwxX3FbNcfER6Fyk7v0xPIiSUpy
 Bu4SzLYw965My23L8VSqC2eO0YQI3ZRSeuP1WM6BAF0UvMDkHYuA9lrXZ1PGM+5s3n
 +jMKAdlfQ/Qpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JFmA0o1k
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 1.0.4.0.0
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

SGkgSnVsaWVuLAoKT24gNS8yMi8yNSAyMjo0MSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkg
R2l1bGlvLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+IAo+IFVuZm9ydHVuYXRlbHksIEkg
d2FzIG5vdCBhYmxlIHRvIGRvd25sb2FkIHRoZSBhcmNoaXZlIHdpdGggdGhpcyBwYXRjaC4KPiBT
ZWUgYmVsb3cuCj4gCj4gT24gMjIvMDUvMjAyNSAwMDo0NSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6
Cj4+IEVzcC1ob3N0ZWQgcHJvamVjdCByZWxlYXNlZCBhIG5ldyB0YXJiYWxsIGFmdGVyIGFsbW9z
dCAzIHllYXJzIHdoZXJlIHRoZXkKPj4gb25seSBjb21taXR0ZWQgcGF0Y2hlcyB0byBnaXQgcmVw
b3NpdG9yeS4gVGhleSBhbHNvIGRlZmluZWQgYSB0ZW1wbGF0ZSAKPj4gZm9yCj4+IHJlbGVhc2Vz
WzFdCj4+Cj4+IFJlbGVhc2Ugbm90ZXM6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9lc3ByZXNzaWYv
ZXNwLWhvc3RlZC9yZWxlYXNlcy90YWcvcmVsZWFzZSUyRm5nLSAKPj4gdjEuMC40LjAuMAo+Pgo+
PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9lc3ByZXNzaWYvZXNwLWhvc3RlZC9jb21taXQvIAo+
PiBjZWQ4MzgzYzJiOGQ0NGIwZDE1ZTA0ZGJiNDI0ZDVhNTFlN2Y0NjhjI2RpZmYtMmU4Y2IxN2Q2
ZTg0MTYxYmM1YTIzMmZiZGY0YzBiODg5M2M0MzMwZjE4NWM2NmM1NjRlMzNjZWQ2ZmZjODY0Zgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+IMKgcGFja2FnZS9lc3AtaG9zdGVkL2VzcC1ob3N0
ZWQuaGFzaCB8IDIgKy0KPj4gwqBwYWNrYWdlL2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5ta8KgwqAg
fCA1ICsrKy0tCj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5o
YXNoIGIvcGFja2FnZS9lc3AtaG9zdGVkLyAKPj4gZXNwLWhvc3RlZC5oYXNoCj4+IGluZGV4IDhk
ZTNjMDAxOTAuLjhiMGIzZTVmOTAgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvZXNwLWhvc3RlZC9l
c3AtaG9zdGVkLmhhc2gKPj4gKysrIGIvcGFja2FnZS9lc3AtaG9zdGVkL2VzcC1ob3N0ZWQuaGFz
aAo+PiBAQCAtMSwzICsxLDMgQEAKPj4gwqAjIExvY2FsbHkgY2FsY3VsYXRlZAo+PiAtc2hhMjU2
IAo+PiA2NmMwN2UyZjY5ZDhhMTBmYjExMWI2ZGYyN2ZiZTM1NTg3MzRkNjYwMjA3YTU0MzkxYzQ2
ZWVhM2UxMmIyOWVlIGVzcC0gCj4+IGhvc3RlZC05YTIzMTJiMGIyNjMwZTQxYmFjYjMwOTFmYWFi
YTQ4OWNiNDNiMGFiLnRhci5nego+PiArc2hhMjU2IAo+PiAxMDI1YjhjOGQ5ODJiYWIwM2ViZWM5
ODU5ZjgyOGExYzgxMjE4MDc3MjQ1YjYwMjYyMWViNGYwN2MxNjliYWM4IG5nLSAKPj4gdjEuMC40
LjAuMC50YXIuZ3oKPj4gwqBzaGEyNTYgCj4+IGVkNTdkOTZkMjdiZTc3NWIyMmY5NTcxZDM3MjRl
Zjg0ZTBkMGI4ZjI0YjgwNWVjN2Y4N2EzMjE4OWRlMTlhOWMgTElDRU5TRQo+PiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9lc3AtaG9zdGVkL2VzcC1ob3N0ZWQubWsgYi9wYWNrYWdlL2VzcC1ob3N0ZWQv
IAo+PiBlc3AtaG9zdGVkLm1rCj4+IGluZGV4IDRjMjQ5ZWVjNDYuLjRkMDIyNGJiOTUgMTAwNjQ0
Cj4+IC0tLSBhL3BhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1rCj4+ICsrKyBiL3BhY2th
Z2UvZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1rCj4+IEBAIC00LDggKzQsOSBAQAo+PiDCoCMKPj4K
Pj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4KPj4gLUVTUF9IT1NURURfVkVSU0lPTiA9IDlh
MjMxMmIwYjI2MzBlNDFiYWNiMzA5MWZhYWJhNDg5Y2I0M2IwYWIKPj4gLUVTUF9IT1NURURfU0lU
RSA9ICQoY2FsbCBnaXRodWIsZXNwcmVzc2lmLGVzcC1ob3N0ZWQsIAo+PiAkKEVTUF9IT1NURURf
VkVSU0lPTikpCj4+ICtFU1BfSE9TVEVEX1ZFUlNJT04gPSAxLjAuNC4wLjAKPj4gK0VTUF9IT1NU
RURfU0lURSA9ICQoY2FsbCBnaXRodWIsZXNwcmVzc2lmLGVzcC1ob3N0ZWQsbmctIAo+PiB2JChF
U1BfSE9TVEVEX1ZFUlNJT04pKQo+IAo+IFRyeWluZyB0byBkb3dubG9hZCB0aGUgYXJjaGl2ZSB3
aXRoIHRoZSAibWFrZSBlc3AtaG9zdGVkLXNvdXJjZSIgZmFpbHMKPiB3aXRoIDQwNCBub3QgZm91
bmQgZXJyb3JzLgo+IAo+IFRoaXMgaXMgYmVjYXVzZSB0aGUgdGFnIG5hbWUgaXMgInJlbGVhc2Uv
bmctdjEuMC40LjAuMCIgYW5kIG5vdCBqdXN0Cj4gIm5nLXYxLjAuNC4wLjAiLiBJIGJlbGlldmUs
IF9TSVRFIHNob3VsZCB0aGVuIGJlOgo+IAo+IEVTUF9IT1NURURfU0lURSA9ICQoY2FsbCBnaXRo
dWIsZXNwcmVzc2lmLGVzcC1ob3N0ZWQscmVsZWFzZS9uZy0gCj4gdiQoRVNQX0hPU1RFRF9WRVJT
SU9OKSkKPiAKPiBDb3VsZCB5b3UgY2hlY2sgYW5kIHRlc3Qgb24geW91ciBzaWRlIGFuZCBzZW5k
IGFuIHVwZGF0ZWQgcGF0Y2ggcGxlYXNlPwoKUGFyZG9uLCBkdXJpbmcgdGVzdGluZyBJIGhhZCBj
YWNoZWQgdGFyYmFsbCBhbmQgc28gaXQgc2VlbWVkIHRvIHdvcmsgYXQKYSBjZXJ0YWluIHBvaW50
LiBJJ20gcmV3b3JraW5nIGl0LgoKQW5kIHRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIQotLSAKR2l1
bGlvIEJlbmV0dGkKQ0VPJkNUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPj4gK0VTUF9IT1NU
RURfU09VUkNFID0gbmctdiQoRVNQX0hPU1RFRF9WRVJTSU9OKS50YXIuZ3oKPj4gwqBFU1BfSE9T
VEVEX0RFUEVOREVOQ0lFUyA9IGxpbnV4Cj4+IMKgRVNQX0hPU1RFRF9MSUNFTlNFID0gR1BMLTIu
MAo+PiDCoEVTUF9IT1NURURfTElDRU5TRV9GSUxFID0gTElDRU5TRQo+PiAtLSAKPj4gMi4zOS41
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
