Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9648AC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 12:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3090B41770;
	Sun, 25 Sep 2022 12:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3090B41770
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ViiL5faXOiG; Sun, 25 Sep 2022 12:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 010BC416F6;
	Sun, 25 Sep 2022 12:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 010BC416F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 804EA1BF5A1
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B43660BBE
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B43660BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxhbZnVW1mOC for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 12:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B51960759
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B51960759
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 12:41:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 37E4E13F8AF;
 Sun, 25 Sep 2022 14:40:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 14:40:55 +0200
Date: Sun, 25 Sep 2022 14:40:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Message-ID: <20220925124055.GY1419013@scaer>
References: <20220924214110.3490682-1-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924214110.3490682-1-clg@kaod.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664109659;
 bh=xjgg4bw+0pC+FIn6wm1tnh8KWI8hS4Munmgk+XL16R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sstzOjqjszOZaTHhsaC4Fi5Sz6iBsTvnmJMl1JYwMphzmJZzwX60K3fOi15Iz+3Bn
 ulLUv6S/eQZhzFtmi3CC6YO15NBwpkahIHbtdcwq9vBMCEM3wAyQU3oUtDJzlGhYP0
 dncyTVRJjPFgaUOcW+wm4Wc+mW/e2/xezgtcQzlNN9hdLSt3pYdlacRP2MNXu2Ckzz
 HJ9LEG8wD8fn3qLcePt7NDLGAXOjMUwlQ8+E+BZ3vmpBZWw1tc7wAyShEeU29bYFys
 okHEij6MVsnjfUXBXwQmXv82skq5Ii8cURTDyY66Ge6O37Wrm+4WJ1+AxExvErIzJU
 eCQQS1P0qbUPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sstzOjqj
Subject: Re: [Buildroot] [PATCH] Revert "configs/qemu_ppc64*: downgrade
 binutils to 2.36.1"
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q8OpZHJpYywgQWxsLAoKT24gMjAyMi0wOS0yNCAyMzo0MSArMDIwMCwgQ8OpZHJpYyBMZSBHb2F0
ZXIgc3Bha2UgdGh1c2x5Ogo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMWUyZmU4NjBmM2EyNjFmYzg3
NzU5MWMwNTY4MDhkNmZiMzBlMjVkNC4KClRoaXMgaXMgbm90IHJlYWxseSBhIHJldmVydCwgc28g
SSBkaWQgc29tZSBjaGFuZ2VzOgoKICAtIGV4cGxpY3RpbHkgZm9yY2UgYmludXRpbHMgMi4zOAog
IC0gcmV3b3JkIGNvbW1pdCBsb2cgdG8gZXhwbGFpbiB3aHkKICAtIHJld29yZCBjb21taXQgbG9n
OiBpdCdzIG5vdCByZWFsbHkgYSByZXZlcnQKCj4gVGhlIGRlZmF1bHQgMi4zOC54IGhhcyB0aGUg
cmVxdWlyZWQgZml4ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4KCkFwcGxpZWQgdG8gbWFzdGVyIHdpdGggdGhlIGFib3ZlIGNoYW5nZXMsIHRo
YW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+IAo+ICBodHRwczovL2dpdGxh
Yi5jb20vbGVnb2F0ZXIvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzY0OTcyMzU5OAo+ICAKPiAgY29u
Zmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZyAgICAgIHwgMSAtCj4gIGNvbmZpZ3MvcWVt
dV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZyAgICB8IDEgLQo+ICBjb25maWdzL3FlbXVfcHBjNjRs
ZV9wb3dlcm52OF9kZWZjb25maWcgfCAxIC0KPiAgY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmll
c19kZWZjb25maWcgIHwgMSAtCj4gIDQgZmlsZXMgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZyBiL2NvbmZp
Z3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcKPiBpbmRleCA4NDU4ZjI3MzlhNjYuLjA4MjVk
MGFiOWIzMCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmln
Cj4gKysrIGIvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZwo+IEBAIC0zLDcgKzMs
NiBAQCBCUjJfcG93ZXJwYzY0PXkKPiAgQlIyX3Bvd2VycGNfZTU1MDA9eQo+ICAKPiAgIyBTeXN0
ZW0KPiAtQlIyX0JJTlVUSUxTX1ZFUlNJT05fMl8zNl9YPXkKPiAgQlIyX1NZU1RFTV9ESENQPSJl
dGgwIgo+ICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5UzAiCj4gIAo+IGRpZmYg
LS1naXQgYS9jb25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcgYi9jb25maWdzL3Fl
bXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcKPiBpbmRleCA0ODBlYmVhMjlkNzAuLmM0NTAxNGYy
YWMzZiAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcK
PiArKysgYi9jb25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcKPiBAQCAtMyw3ICsz
LDYgQEAgQlIyX3Bvd2VycGM2ND15Cj4gIEJSMl9wb3dlcnBjX3Bvd2VyNz15Cj4gIAo+ICAjIFN5
c3RlbQo+IC1CUjJfQklOVVRJTFNfVkVSU0lPTl8yXzM2X1g9eQo+ICBCUjJfU1lTVEVNX0RIQ1A9
ImV0aDAiCj4gIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJodmMwIgo+ICAKPiBkaWZm
IC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnIGIvY29uZmln
cy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCj4gaW5kZXggOGRlNGNmNTE4OWI1Li44
MjIxNDVlOTI3YTEgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhf
ZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmln
Cj4gQEAgLTMsNyArMyw2IEBAIEJSMl9wb3dlcnBjNjRsZT15Cj4gIEJSMl9wb3dlcnBjX3Bvd2Vy
OD15Cj4gIAo+ICAjIFN5c3RlbQo+IC1CUjJfQklOVVRJTFNfVkVSU0lPTl8yXzM2X1g9eQo+ICBC
UjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKPiAgQlIyX1NZU1RFTV9ESENQPSJl
dGgwIgo+ICAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZj
b25maWcgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZwo+IGluZGV4IDk4
YzZhZmRmOTM5OS4uNWVhYTNlOTUzZjc4IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2
NGxlX3BzZXJpZXNfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmll
c19kZWZjb25maWcKPiBAQCAtMyw3ICszLDYgQEAgQlIyX3Bvd2VycGM2NGxlPXkKPiAgQlIyX3Bv
d2VycGNfcG93ZXI4PXkKPiAgCj4gICMgU3lzdGVtCj4gLUJSMl9CSU5VVElMU19WRVJTSU9OXzJf
MzZfWD15Cj4gIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJodmMwIgo+ICBCUjJfU1lT
VEVNX0RIQ1A9ImV0aDAiCj4gIAo+IC0tIAo+IDIuMzcuMwo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
