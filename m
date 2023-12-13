Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 21:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEC2340399;
	Wed, 13 Dec 2023 21:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC2340399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWZncBNc8IR4; Wed, 13 Dec 2023 21:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78EAF404B9;
	Wed, 13 Dec 2023 21:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78EAF404B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B48E71BF475
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 21:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D273617B2
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 21:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D273617B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6g09E0vwdM3 for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 21:01:48 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D06C61628
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 21:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D06C61628
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e0bf:72a9:b9c2:ca5c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 26D985FFBA;
 Wed, 13 Dec 2023 22:01:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Dec 2023 22:01:41 +0100
Date: Wed, 13 Dec 2023 22:01:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christophe Blaess <christophe.blaess@logilin.fr>,
 =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZXobtaqzrUQ3eXLw@landeda>
References: <20231211081730.1406640-1-christophe.blaess@logilin.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211081730.1406640-1-christophe.blaess@logilin.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702501305;
 bh=tcGdPxVfoq2vemQBM6AvL8HFqndVE4L09qAJuGmEAos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aMe7DpKgQ6BzKE7e9sJDSvUhwZxbMXYo66PvWZiWBxgr1tdJV93y6N9Hqa9RNFLx/
 wpDUpWGYABcgFcHn1buFXB3rC9fftUT0FgZIxdRawwOFKtWLlFrcsdUPXyTHyb/5ZP
 qUIiGwWZNyoZWo9Et4QUiGV+P/4ELR6dVPZJKGfhbIKNyb6VP6JOiqN1NEsUbFM6NW
 Ty9adHLFbsnnM9/td8Sa+z7GeP6ZMABmdgBJwWWUJehD/9dlocnDgdPH+gtXpqWlHS
 g7i+Ump0eLjLylImUx45FNUBNwqy2b+4cDpfqYVv/FJEP5QAnMVNZyKr5DnmU52pkl
 r3/sJ7V+L1tjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aMe7DpKg
Subject: Re: [Buildroot] [PATCH 1/3] configs: add support for the Raspberry
 Pi 5 board.
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0b3BoZSwgQWxsLAoKK0dhw6tsIGZvciBhbG1vc3Qgc2ltdWx0YW5lb3VzIHNpbWlsYXIg
c3VibWlzc2lvbi4KCk9uIDIwMjMtMTItMTEgMDk6MTcgKzAxMDAsIENocmlzdG9waGUgQmxhZXNz
IHNwYWtlIHRodXNseToKPiBUaGUgUmFzcGJlcnJ5IFBpIDUgZGVmY29uZmlnIGlzIG1vc3RseSBp
bnNwaXJlZCBieSB0aGUgUmFzcGJlcnJ5Cj4gUGkgNCA2NC1iaXRzIGRlZmNvbmZpZy4KPiAKPiAK
PiAoc29ycnkgZm9yIHBvc3NpYmxlIGRvdWJsZSBwb3N0LCBJIGhhZCBzb21lIGlzc3VlcyB3aXRo
IHRoZSBlbWFpbCBJCj4gdXNlZCBmb3Igc3Vic2NyaWJpbmcgdG8gdGhlIG1haWxpbmcgbGlzdCku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBCbGFlc3MgPGNocmlzdG9waGUuYmxhZXNz
QGxvZ2lsaW4uZnI+CgpUaGlzIHNlcmllcyBpcyBub3QgY29ycmVjdDogaWYgd2UgYXBwbHkganVz
dCB0aGUgZmlyc3QgcGF0Y2gsIHRoZW4gdGhlCmNvbmZpZyBmaWxlIHdpbGwgYmUgbWlzc2luZzog
aXQgc2hvdWxkIGhhdmUgYmVlbiBhIHNpbmdsZSBjb21taXQuCgpCZXNpZGVzLCB0aGUgY2hhbmdl
IHRvIHJwaS1maXJtd2FyZSBzaG91bGQgaGF2ZSBjb21lIGZpcnN0LgoKR2HDq2wgaGFzIHNlbnQg
YW5vdGhlciBzZXJpZXMgYWJvdXQgdGhlIHJwaTU6CiAgICBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zODYxNDQKCkNhbiB5b3UgbG9v
ayBhdCBoaXMgcGF0Y2ggYW5kIHNlZSB3aGF0IGlzIG1pc3NpbmcgY29tcGFyZWQgdG8gd2hhdCB5
b3UKZGlkPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIGNvbmZpZ3MvcmFzcGJl
cnJ5cGk1X2RlZmNvbmZpZyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGNvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdz
L3Jhc3BiZXJyeXBpNV9kZWZjb25maWcgYi9jb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjAzMWYyNGE5NzcKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvY29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29uZmlnCj4gQEAg
LTAsMCArMSw0NSBAQAo+ICtCUjJfYWFyY2g2ND15Cj4gK0JSMl9jb3J0ZXhfYTc2PXkKPiArQlIy
X0FSTV9GUFVfVkZQVjQ9eQo+ICsKPiArQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hYPXkKPiAr
Cj4gK0JSMl9TWVNURU1fREhDUD0iZXRoMCIKPiArCj4gKyMgTGludXggaGVhZGVycyBzYW1lIGFz
IGtlcm5lbCwgYSA2LjEgc2VyaWVzCj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19D
VVNUT01fNl8xPXkKPiArCj4gK0JSMl9MSU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9UQVJCQUxMPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NB
VElPTj0iJChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSxsaW51eCwxN2YxMzViNzQyYzRlZGIzNDBh
ZmIzNjU4NzNjM2E1NzRmN2UxNmNiKS9saW51eC0xN2YxMzViNzQyYzRlZGIzNDBhZmIzNjU4NzNj
M2E1NzRmN2UxNmNiLnRhci5neiIKPiArQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3
MTIiCj4gKwo+ICsjIEJ1aWxkIHRoZSBEVEIgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMKPiArQlIy
X0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RU
U19OQU1FPSJicm9hZGNvbS9iY20yNzEyLXJwaS01LWIiCj4gKwo+ICtCUjJfTElOVVhfS0VSTkVM
X05FRURTX0hPU1RfT1BFTlNTTD15Cj4gKwo+ICtCUjJfUEFDS0FHRV9SUElfRklSTVdBUkU9eQo+
ICtCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QSTQ9eQo+ICtCUjJfUEFDS0FHRV9S
UElfRklSTVdBUkVfQ09ORklHX0ZJTEU9ImJvYXJkL3Jhc3BiZXJyeXBpNS9jb25maWdfNS50eHQi
Cj4gKwo+ICsjIFJlcXVpcmVkIHRvb2xzIHRvIGNyZWF0ZSB0aGUgU0QgaW1hZ2UKPiArQlIyX1BB
Q0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPiArQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4g
K0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKPiArCj4gKyMgRmlsZXN5c3RlbSAvIGltYWdlCj4g
K0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQo+
ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCj4gKyMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKPiArQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQv
cmFzcGJlcnJ5cGk1L3Bvc3QtYnVpbGQuc2giCj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJ
UFQ9ImJvYXJkL3Jhc3BiZXJyeXBpNS9wb3N0LWltYWdlLnNoIgo+ICsKPiArIyBFbmFibGUgY29t
cHJlc3NlZCBrZXJuZWwgbW9kdWxlIHN1cHBvcnQKPiArQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9X
X09USEVSUz15Cj4gK0JSMl9QQUNLQUdFX0tNT0RfVE9PTFM9eQo+ICtCUjJfUEFDS0FHRV9YWj15
Cj4gK0JSMl9QQUNLQUdFX0tNT0Q9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0tNT0RfWFo9eQo+IC0t
IAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
