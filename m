Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271A8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 15:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D261E4260F;
	Fri, 10 Dec 2021 15:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPE3cM6qfoLh; Fri, 10 Dec 2021 15:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0553B425E8;
	Fri, 10 Dec 2021 15:00:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA9001BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 15:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B772E425E8
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 15:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEQ1TpQ1asyy for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 15:00:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E0DB424F9
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 15:00:02 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vhNRmWqMNYYTXvhNRmGsFx; Fri, 10 Dec 2021 16:00:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639148401; bh=TTkuw6O65bVo/CuQ1yw50FX93LJeCpzJXzeJzGtfa8E=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Xant991EHfn7ld6WqNFrHZ/HC1+xX0y5aEZHKsMzcswCfS3PCsn2xE/Pw/5kxxmeE
 gPZqbimlELGhWqOpCOk0Pn88lR7OPg70CPgf4LzmedAh75/QPR/ZSFg/guzIP7bkQd
 U1m5GL/2FUuEB7cP5crZ+ZmyKi0ir/FAav3lQe/1yfUzbZV3Di8jnoJyr2FnoktEId
 aWLKPSjl2nWso8ikgZ/Spa+WsVrPfDWn0HkOPjA6QFoZHIPZ8vMTQQ5nH+SN6hXNZt
 H5DEp39tPbVwkF5dBN73E3ndtoTWSo6bgYPuW9eymMUrqZFkF25WoZWuOfSi7WSwyC
 /1fzL/t1gb4HQ==
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-7-jose.pekkarinen@unikie.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <15eb0e0b-dca3-1958-4e94-6ea70c95aca6@benettiengineering.com>
Date: Fri, 10 Dec 2021 16:00:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141209.1812043-7-jose.pekkarinen@unikie.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCnRr7kmbGUTyu0PGIgZR+6xFggZFMH5AXT/px3WE1la8ALGWz7qP37ENIs98e4n3bh/M5HtxgDp2IxfqhcLkeYQyS5zobMFXex8Boci8TQUwEcNB0jA
 9QCsp0iDsWb8DWm4I/B8iDtalg63j5JEXC/aqkOBZiYh7qDpFYKuoJ0uuv+7TSoJvGN2wdQ92Kzp2cj+fj0oRxf6E8gav+YUovl2GNh3oXQChmYh6A5SDJtT
 oMVDfpNkjLfoNQqLUS5GMQ==
Subject: Re: [Buildroot] [PATCH 7/7] package/avocado-vt: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMTIvMjEgMTU6MTIsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBh
ZGRzIGEgYmFzaWMgcGFja2FnZSBmb3IgYXZvY2Fkby12dAo+IHBsdWdpbi4KClJld29yZAoKPiBT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNv
bT4KPiAtLS0KPiAgIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAgcGFja2FnZS9h
dm9jYWRvLXZ0L0NvbmZpZy5pbiAgICAgICB8IDEzICsrKysrKysrKysrKysKPiAgIHBhY2thZ2Uv
YXZvY2Fkby12dC9hdm9jYWRvLXZ0Lmhhc2ggfCAgNCArKysrCj4gICBwYWNrYWdlL2F2b2NhZG8t
dnQvYXZvY2Fkby12dC5tayAgIHwgMTQgKysrKysrKysrKysrKysKPiAgIDUgZmlsZXMgY2hhbmdl
ZCwgMzMgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYXZvY2Fk
by12dC9Db25maWcuaW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2F2b2NhZG8tdnQv
YXZvY2Fkby12dC5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hdm9jYWRvLXZ0
L2F2b2NhZG8tdnQubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMK
PiBpbmRleCAzZmY2YWJiMmFmLi5kMjU4YjQ2MTE3IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMK
PiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTE0NjcsNiArMTQ2Nyw3IEBAIE46CUpvc8OpIFBla2th
cmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+ICAgRjoJcGFja2FnZS9hZXhwZWN0
Lwo+ICAgRjoJcGFja2FnZS9hbGZyZWQvCj4gICBGOglwYWNrYWdlL2F2b2NhZG8vCj4gK0Y6CXBh
Y2thZ2UvYXZvY2Fkby12dC8KPiAgIEY6CXBhY2thZ2UvYm14Ny8KPiAgIEY6CXBhY2thZ2UvbWlu
aWphaWwvCj4gICBGOglwYWNrYWdlL29wZW5zYy8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25m
aWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IGM1ZDI3MGE3ZmQuLmNkYzBiNDM3YjMg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5p
bgo+IEBAIC0xNTYsNiArMTU2LDcgQEAgZW5kbWVudQo+ICAgbWVudSAiRGV2ZWxvcG1lbnQgdG9v
bHMiCj4gICAJc291cmNlICJwYWNrYWdlL2FleHBlY3QvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAi
cGFja2FnZS9hdm9jYWRvL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9hdm9jYWRvLXZ0
L0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvYmF0cy1jb3JlL0NvbmZpZy5pbiIKPiAg
IAlzb3VyY2UgInBhY2thZ2UvYmludXRpbHMvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2Fn
ZS9iaXR3aXNlL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdm9jYWRvLXZ0L0Nv
bmZpZy5pbiBiL3BhY2thZ2UvYXZvY2Fkby12dC9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjVmYmZkMjc4Y2QKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9hdm9jYWRvLXZ0L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTMgQEAKPiArY29u
ZmlnIEJSMl9QQUNLQUdFX0FWT0NBRE9fVlQKPiArCWJvb2wgImF2b2NhZG8tdnQiCj4gKwlkZXBl
bmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBkbG9wZW4oKQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdF
X0xJQkZGSQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTjMKPiArCWhlbHAKPiArCSAgQXZv
Y2FkbyBWVCBpcyBhIHZpcnR1YWxpemF0aW9uIHRlc3QgcGx1Z2luIGZvciBhdm9jYWRvIHRlc3QK
PiArCSAgZnJhbWV3b3JrLgo+ICsKPiArCSAgaHR0cHM6Ly9hdm9jYWRvLXZ0LnJlYWR0aGVkb2Nz
LmlvLwo+ICsKPiArY29tbWVudCAiYXZvY2Fkby12dCBuZWVkcyBhIHRvb2xjaGFpbiB3aXRoIGR5
bmFtaWMgbGlicmFyeSBzdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9hdm9jYWRvLXZ0L2F2b2NhZG8tdnQuaGFzaCBiL3BhY2thZ2Uv
YXZvY2Fkby12dC9hdm9jYWRvLXZ0Lmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLmY1YjhhMjJmMDgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9h
dm9jYWRvLXZ0L2F2b2NhZG8tdnQuaGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsjIEZyb20gaHR0
cHM6Ly9naXRodWIuY29tL2F2b2NhZG8tZnJhbWV3b3JrL2F2b2NhZG8tdnQvYXJjaGl2ZS9yZWZz
L3RhZ3MKCnNoYTI1NiBmaWxlIF5eXgoKPiArc2hhMjU2ICA1MGI1NzM1YTliNDQ1Y2VhNjRmZmE3
OTI5Y2E5OTBiNjNhNTU5NzY0MTJhOTQ1NmU2NWNiMmQzNjVlMDE3N2ZjICA5My4wLnRhci5nego+
ICsjIExvY2FsbHkgY29tcHV0ZWQKPiArc2hhMjU2ICAxN2JlNmI1YzRhN2VjNjM5YWUzY2UxYTVj
MGE1YTYxZDYwMjM2NWUzYzRiYjM1Njg0OTM5NDgzOTIwNTNiNzBjICBMSUNFTlNFCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvYXZvY2Fkby12dC9hdm9jYWRvLXZ0Lm1rIGIvcGFja2FnZS9hdm9jYWRv
LXZ0L2F2b2NhZG8tdnQubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmQ1NGEyMDdkYTAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9hdm9jYWRvLXZ0
L2F2b2NhZG8tdnQubWsKPiBAQCAtMCwwICsxLDE0IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gKyMKPiArIyBhdm9jYWRvLXZ0Cj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiArCj4gK0FWT0NBRE9fVlRfVkVSU0lPTiA9IDkzLjAKPiArQVZPQ0FET19WVF9TT1VSQ0UgPSAk
KEFWT0NBRE9fVlRfVkVSU0lPTikudGFyLmd6Cj4gK0FWT0NBRE9fVlRfU0lURSA9IGh0dHBzOi8v
Z2l0aHViLmNvbS9hdm9jYWRvLWZyYW1ld29yay9hdm9jYWRvLXZ0L2FyY2hpdmUvcmVmcy90YWdz
Cj4gK0FWT0NBRE9fVlRfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiArQVZPQ0FET19WVF9MSUNF
TlNFID0gQXBhY2hlLTIuMAo+ICtBVk9DQURPX1ZUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4g
Kwo+ICskKGV2YWwgJChweXRob24tcGFja2FnZSkpCj4gCgpIYXZlIHlvdSBnaXZlbiBhIGdvIHdp
dGggIi4vdXRpbHMvdGVzdC1wa2cgLXAgPHBhY2thZ2U+IC1hIiBmb3IgZXZlcnkgCnBhY2thZ2Ug
aW4gdGhlIHBhdGNoc2V0PyBJdCB0YWtlcyBzb21lIHRpbWUgYnV0IHRoaXMgd2F5IHdlIHNob3Vs
ZCBiZSAKc2FmZXIgdGhhbiB0ZXN0aW5nIHdpdGhvdXQgIi1hIiBmbGFzaCBvciB3aXRob3V0IHRl
c3QtcGtnIGF0IGFsbC4KCk5vdyBsZXQncyB3YWl0IGZvciBzb21lb25lJ3MgZWxzZSBjb21tZW50
IDotKQoKVGhhbmsgeW91IQoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRp
IEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
