Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77834C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 09:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21059607FC;
	Sat,  4 Dec 2021 09:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_DWu8SOzeg7; Sat,  4 Dec 2021 09:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F9860727;
	Sat,  4 Dec 2021 09:18:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8231BF5DC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C6C0402E7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjUqb4-MmYXT for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 09:18:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0925440287
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 09:17:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C9CE85FFC1;
 Sat,  4 Dec 2021 10:17:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638609477;
 bh=O3v8VoGetKUsJVtygbQdru7xZsSo/n70ver1j3F2nRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TeIHcpByhf06QiVQxAKmdQTX6O8xVaskBYCflEXX3uBVQEq9jzepehv8WK5lHokUt
 BfiFK0mmR3wXzzNnGyObaAcosLWRHrYg65uuFcML2FSZ/8rPs8yCi5A5A99gTNLkSJ
 EvsN5GXJQvT+6aLsL+W9s0LVHyu4RI+tflh2S76pebS5zvgnI01MPstObxB7sDABms
 TIMXbXJIzJp6/Jvgg2W4/J1KaHWrxi+Ak9elCak2n2aZlkv/owBnIlJ0iosC/nTumn
 9k0PZQxoc2hn3lj3nJDHrz48vgXn5gHogo3mc8bO7K8RH8afPhRrF7uNuy5BDVGq5c
 tpcwIDMuveLOQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 10:17:50 +0100
Date: Sat, 4 Dec 2021 10:17:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20211204091750.GD50662@scaer>
References: <cover.1638573387.git.yann.morin.1998@free.fr>
 <82bf2ffa3ad531e8e93cf4b2f65193438b8b7199.1638573387.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82bf2ffa3ad531e8e93cf4b2f65193438b8b7199.1638573387.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] package/mender-grubenv: fix grub module
 checks
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
Cc: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWUsIEFsbCwKCk9uIDIwMjEtMTItMDQgMDA6MTcgKzAxMDAsIFlhbm4gRS4gTU9SSU4gc3Bha2Ug
dGh1c2x5Ogo+IEZyb206IEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29tPgo+IENvbW1p
dCBiNjg4MTBlNzBjYmQgKGJvb3QvZ3J1YjI6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIG11bHRpcGxl
IEdydWIyCj4gY29uZmlndXJhdGlvbnMgaW4gdGhlIHNhbWUgYnVpbGQpIGJyb2tlIG1lbmRlci1n
cnViZW52IGJ5IHNwbGl0aXRuZyB1cAo+IEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9NT0RVTEVT
IGludG8gdHdvIHNlcGFyYXRlIHN5bWJvbHMsIG9uZSBmb3IKPiBsZWdhY3kgYm9vdCBhbmQgb25l
IGZvciBFRkkgYm9vdC4KPiAKPiBUaGlzIGNoYW5nZSBjYXVzZXMgYSBzeXN0ZW1hdGljIGJ1aWxk
IGZhaWx1cmUgbm93LCBhcyB0aGUgbGVnYWN5IHZhcmlhYmxlCj4gQlIyX1RBUkdFVF9HUlVCMl9C
VUlMVElOX01PRFVMRVMgaXMgbm93IGFsd2F5cyBlbXB0eSAoZHVyaW5nIGJ1aWxkKS4KPiAKPiBX
ZSBmaXggdGhhdCBieSBzdXBwbGljYXRpbmcgdGhlIG1pc3NpbmcgbW9kdWxlcyB0byBjaGVjazog
b25lIGZvciBFRkkgYW5kCj4gb25lIGZvciBsZWdhY3kgYm9vdC4KPiAKPiBUaGUgRUZJIGNoZWNr
IGlzIHRyaWNreTogSW5kZWVkLCB0aGVyZSBjYW4gYmUgbW9yZSB0aGFuIG9uZSBFRkkgcGxhdGZv
cm0KPiBlbmFibGVkIHNpbXVsdGFuZW91c2x5OyBpbmRlZWQsIG9uIHg4Nl82NCwgd2UgY2FuIGhh
dmUgYm90aCB0aGUgMzItYml0Cj4gYW5kIDY0LWJpdCBFRkkgcGxhdGZvcm1zIGVuYWJsZWQuIFNv
IHRoZSBjaGVjayBpcyBpbnZlcnRlZCwgYW5kIHdlIGNoZWNrCj4gdGhhdCBubyBwbGF0Zm9ybSBp
cyBub3QgZW5hYmxlZCAoeWVhaCwgZG91YmxlIG5lZ2F0aW9uKS4gRm9yIGNvbnNpc3RlbmN5LAo+
IHdlIGRvIHRoZSBzYW1lIGZvciB0aGUgbGVnYWN5IGJvb3QsIGV2ZW4gdGhvdWdoIGluIHRoYXQg
Y2FzZSwgdGhlcmUgY2FuCj4gb25seSBldmVyIGJlIG9ubHkgb25lIGVuYWJsZWQgYXQgb25jZSBh
dCBtb3N0Lgo+IAo+IEZ1cnRoZXJtb3JlLCBtZW5kZXItZ3J1YmVudiBkb2VzIG5vdCBzdXBwb3J0
IG11bHRpcGxlIGluc3RhbGxhdGlvbnMgb2YKPiBncnViIGNvbmN1cnJlbnRseTsgaXQgY2FuIG9u
bHkgYmUgaW5zdGFsbGVkIGZvciBlaXRoZXIgbGVnYWN5IG9yIEVGSSwKPiBub3QgYm90aCBhdCB0
aGUgc2FtZSB0aW1lOiAvZXRjL21lbmRlci1ncnViZW52LmNmZywgaXRzIGNvbmZpZ3VyYXRpb24K
PiBmaWxlLCBjYW4gb25seSBjb250YWluIHNldHRpbmdzIGZvciBvbmUgb3IgdGhlIG90aGVyLCBu
b3QgYm90aC4KPiAKPiBTbyB3ZSBhZGQgYSBuZXcgY2hlY2sgdG8gQ29uZmlnLmluIHRvIHN1cHBv
cnQgb25seSBvbmUgZ3J1YiBpbnN0YWxsYXRpb24KPiB0eXBlIGF0IGEgdGltZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkdXNrZXR0QGdtYWlsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogS8O2cnkg
TWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+ClstLVNOSVAtLV0KPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tZW5kZXItZ3J1YmVudi9Db25maWcuaW4gYi9wYWNrYWdlL21lbmRlci1n
cnViZW52L0NvbmZpZy5pbgo+IGluZGV4IDM4ZGE1Yjg0ZmUuLjMzZDYzZmJmYTMgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9tZW5kZXItZ3J1YmVudi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL21l
bmRlci1ncnViZW52L0NvbmZpZy5pbgpbLS1TTklQLS1dCj4gQEAgLTM0LDMgKzM2LDYgQEAgY29t
bWVudCAibWVuZGVyLWdydWJlbnYgbmVlZHMgYSBncnViMiBib290bG9hZGVyIgo+ICAJZGVwZW5k
cyBvbiBCUjJfVEFSR0VUX0dSVUIyX0FSQ0hfU1VQUE9SVFMKPiAgCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfTUVOREVSCj4gIAlkZXBlbmRzIG9uICFCUjJfVEFSR0VUX0dSVUIyCj4gKwo+ICtjb21t
ZW50ICJtZW5kZXItZ3J1YmVudiBkb2VzIG5vdCBzdXBwb3J0IGJvdGggbGVnYWN5IGFuZCBFRkkg
Z3J1YjIgYm9vdGxvYWRlcnMgYXQgdGhlIHNhbWUgdGltZSIKPiArCWRlcGVuZHMgb24gQlIyX1RB
UkdFVF9HUlVCMl9IQVNfTEVHQUNZX0JPT1QgJiYgQlIyX1RBUkdFVF9HUlVCMl9IQVNfRUZJX0JP
T1QKCk1pc3NpbmcgZGVwZW5kZW5jeSBvbiBCUjJfUEFDS0FHRV9NRU5ERVIKCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbWVuZGVyLWdydWJlbnYvbWVuZGVyLWdydWJlbnYubWsgYi9wYWNrYWdlL21l
bmRlci1ncnViZW52L21lbmRlci1ncnViZW52Lm1rCj4gaW5kZXggZDdiZGNjOTllYi4uZGQwY2Y3
ZTRmOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lbmRlci1ncnViZW52L21lbmRlci1ncnViZW52
Lm1rCj4gKysrIGIvcGFja2FnZS9tZW5kZXItZ3J1YmVudi9tZW5kZXItZ3J1YmVudi5tawo+IEBA
IC0xMyw3ICsxMyw3IEBAIE1FTkRFUl9HUlVCRU5WX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4g
IE1FTkRFUl9HUlVCRU5WX0RFUEVOREVOQ0lFUyA9IGdydWIyCj4gIE1FTkRFUl9HUlVCRU5WX0lO
U1RBTExfSU1BR0VTID0gWUVTCj4gIAo+IC1pZmVxICgkKEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9Q
QykkKEJSMl9UQVJHRVRfR1JVQjJfQVJNX1VCT09UKSx5KQo+ICtpZmVxICgkKEJSMl9UQVJHRVRf
R1JVQl9MRUdBQ1kpJChCUjJfVEFSR0VUX0dSVUIyX0FSTV9VQk9PVCkseSkKClRoZSBBUk0gVS1C
b290IHBhcnQgaXMgc3VwZXJmbHVvdXMsIG5vdy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
