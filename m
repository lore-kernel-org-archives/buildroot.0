Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2345C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86951400EC;
	Sat, 18 Nov 2023 14:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86951400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TH7IMZsWdFS; Sat, 18 Nov 2023 14:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A38540467;
	Sat, 18 Nov 2023 14:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A38540467
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB37D1BF593
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C46FD608B7
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46FD608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmT3GFHkc6qY for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:53:50 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C37E8600B8
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C37E8600B8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B7CBE780389;
 Sat, 18 Nov 2023 15:53:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:53:43 +0100
Date: Sat, 18 Nov 2023 15:53:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20231118145343.GC996011@scaer>
References: <20231113005833.3858363-2-salvador.joseluis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113005833.3858363-2-salvador.joseluis@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700319226;
 bh=wgmGcFrgQMV6ps9YujwrkBjOFkV2mxawZ+gqVlAZOCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HquQoKxGadmbj0774IJyPeISe7dwwQsF86hYnW/5CkwwKSa5fp0YqgwaLTCy2jbzu
 SGmF7XqwYShC0U8NeZEPjsPXO4OdS5pBt9KLr3p7mfZhlBljX1OwUmr2RS1Y72HAGu
 lPWMZ8iaiguLlcSVCfxyQ5cld9tXUFlnC1Bya91hZZm7yrAuVKc0K9mcLW96sRcubW
 Dx/0NFEBdPOv862CNL2VOa871HoS11QR0nFB3Lyy5e/rCRADS5RobeT6C/ZoDwhDfK
 Q/GNxjKnmA9QDtsCNIXE1oNvombOFEKHchXmeZcyUOXPaukfTdQmsl1boe8bM/wF/R
 mgl/6oU8vzaJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HquQoKxG
Subject: Re: [Buildroot] [PATCH] package/zfs: bump version to 2.2.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjMtMTEtMTMgMDE6NTggKzAxMDAsIEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyBzcGFrZSB0aHVzbHk6Cj4gUmVtb3ZlZCBiYWNrcG9ydGVkIHBhdGNoOgo+IC0gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2NvbW1pdC9iYzNmMTJiZmFjMTUyYTBjMjg5NTFj
ZWM5MjM0MGJhMTRmOWNjZWU5LnBhdGNoCj4gCj4gVXBkYXRlZCBaRlMgdGVzdCB0byBwYXNzIHRo
aXMgbmV3IHZlcnNpb24uCgpJJ3ZlIGV4dGVuZGVkIHRoaXMgdG8gZXhwbGFpbiB3aHkgd2UgY2Fu
IGRyb3AgdGhlIGV4cGxpY2l0IC1tIG9wdGlvbi4KCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVp
cyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CgpBcHBsaWVkIHRv
IG5leHQsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdl
L3pmcy96ZnMuaGFzaCAgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0KPiAgcGFja2FnZS96
ZnMvemZzLm1rICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSB8IDQgKystLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAo+IGluZGV4IDNhNzNlNWU5NGYu
LmIwMmM0OTIzNGEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS96ZnMvemZzLmhhc2gKPiArKysgYi9w
YWNrYWdlL3pmcy96ZnMuaGFzaAo+IEBAIC0xLDYgKzEsNSBAQAo+IC0jIEZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0yLjEuMTIvemZzLTIu
MS4xMi5zaGEyNTYuYXNjCj4gLXNoYTI1NiAgNjRkYWEyNmFlZDNlMTJjOTMxZjZmNDQxM2Q3NTI3
YzRlYmRiOGRhMzU0MTZiMzU2MTUyYjVmOWZkZDRjNmU2ZCAgemZzLTIuMS4xMi50YXIuZ3oKPiAt
c2hhMjU2ICA5NmEyNzM1M2ZlNzE3ZmYyYzhiOTVkZWI4YjAwOWM0ZWI3NTAzMDNjNjQwMGUyZDhh
MjU4MmFiMWVjMTJiMjVhICBiYzNmMTJiZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNjZWU5
LnBhdGNoCj4gKyMgTG9jYWxseSBjb21wdXRlZAo+ICtzaGEyNTYgIDQyMDM1ZmQwNTlmYWEyNWEw
OWNkNTExYjI0YTU3YjhhZDEyODVjYjY5MTI3ZjJhMDA0M2I5ODU2MmM1ZWM2OTAgIHpmcy0yLjIu
MC50YXIuZ3oKPiAgCj4gICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlczoKPiAgc2hhMjU2ICAxZmZi
NzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUxZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5
NTIwICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2Uv
emZzL3pmcy5tawo+IGluZGV4IGYwNDYxZWE5ZWMuLmQ4NTk1NmM5OGIgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS96ZnMvemZzLm1rCj4gKysrIGIvcGFja2FnZS96ZnMvemZzLm1rCj4gQEAgLTQsOSAr
NCw4IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVpGU19WRVJTSU9O
ID0gMi4xLjEyCj4gK1pGU19WRVJTSU9OID0gMi4yLjAKPiAgWkZTX1NJVEUgPSBodHRwczovL2dp
dGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLSQoWkZTX1ZFUlNJT04p
Cj4gLVpGU19QQVRDSCA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9jb21taXQvYmMz
ZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaAo+ICBaRlNfU0VMSU5V
WF9NT0RVTEVTID0gemZzCj4gIFpGU19MSUNFTlNFID0gQ0RETAo+ICBaRlNfTElDRU5TRV9GSUxF
UyA9IExJQ0VOU0UgQ09QWVJJR0hUCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF96ZnMucHkKPiBpbmRleCAxZjAxZGRkNzY4Li4yN2RiYzI4NjliIDEwMDY0NAo+IC0tLSBhL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5Cj4gKysrIGIvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiBAQCAtNDAsMTEgKzQwLDExIEBAIGNs
YXNzIFRlc3RaZnNCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gIAo+ICAgICAgICAgIGNt
ZHMgPSBbCj4gICAgICAgICAgICAgICMgSW5pdAo+IC0gICAgICAgICAgICAibW9kcHJvYmUgemZz
IiwKPiArICAgICAgICAgICAgIm1vZHByb2JlIHpmcyAmJiBzbGVlcCAyIiwKPiAgICAgICAgICAg
ICAgIm1vdW50IC1vIHJlbW91bnQsc2l6ZT0xMzJNIC90bXAiLAo+ICAgICAgICAgICAgICAiZmFs
bG9jYXRlIC1sIDY0TSAvdG1wL2NvbnRhaW5lcjEucmF3IiwKPiAgICAgICAgICAgICAgImZhbGxv
Y2F0ZSAtbCA2NE0gL3RtcC9jb250YWluZXIyLnJhdyIsCj4gLSAgICAgICAgICAgICJ6cG9vbCBj
cmVhdGUgLW0gL3Bvb2wgcG9vbCByYWlkeiAvdG1wL2NvbnRhaW5lcjEucmF3IC90bXAvY29udGFp
bmVyMi5yYXciLAo+ICsgICAgICAgICAgICAienBvb2wgY3JlYXRlIHBvb2wgcmFpZHogL3RtcC9j
b250YWluZXIxLnJhdyAvdG1wL2NvbnRhaW5lcjIucmF3IiwKPiAgICAgICAgICAgICAgImRkIGlm
PS9kZXYvdXJhbmRvbSBicz0xTSBjb3VudD04IG9mPS9wb29sL3VyYW5kb20iLAo+ICAgICAgICAg
ICAgICAic2hhMjU2c3VtIC9wb29sL3VyYW5kb20gPiAvdG1wL3VyYW5kb20uc2hhMjU2IiwKPiAg
ICAgICAgICAgICAgIyBDaGVjayBaRlMKPiAtLSAKPiAyLjQyLjEKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
CnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERl
c2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2
MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8g
IFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
