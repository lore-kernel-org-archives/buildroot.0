Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B386C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:31:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B255761101
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B255761101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C0204037B;
	Wed,  3 Nov 2021 17:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKS0shIOR-Ev; Wed,  3 Nov 2021 17:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D3D64013B;
	Wed,  3 Nov 2021 17:31:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF161BF3EA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180EA60AD8
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTtRkXjyH7Jl for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:31:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19BB760ABD
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:31:48 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 686AA1BF205;
 Wed,  3 Nov 2021 17:31:47 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:31:45 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211103183145.2814c8fb@bootlin.com>
In-Reply-To: <20211103164756.5ebdc1ec@windsurf>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
 <20211103073656.1689919-4-herve.codina@bootlin.com>
 <20211103164756.5ebdc1ec@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/libfutils: new package
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

SGksCgpPbiBXZWQsIDMgTm92IDIwMjEgMTY6NDc6NTYgKzAxMDAKVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+IAo+IE9uIFdl
ZCwgIDMgTm92IDIwMjEgMDg6MzY6NTQgKzAxMDAKPiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGlu
YUBib290bGluLmNvbT4gd3JvdGU6Cj4gIgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZnV0
aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGliZnV0aWxzL0NvbmZpZy5pbgo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjAzMjlkZDA2NWMKPiA+IC0tLSAvZGV2
L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvbGliZnV0aWxzL0NvbmZpZy5pbgo+ID4gQEAgLTAsMCAr
MSwxNCBAQAo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJGVVRJTFMKPiA+ICsJYm9vbCAibGli
ZnV0aWxzIgo+ID4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX0FUT01JQwo+ID4gKwlk
ZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIHVsb2cKPiA+ICsJZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgdWxvZwo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
VUxPRwo+ID4gKwloZWxwCj4gPiArCSAgVGhpcyBsaWJyYXJ5IGNvbnRhaW5zIHNvbWUgY29tbW9u
IHVzZWZ1bCBmdW5jdGlvbnMgKGxpc3QsCj4gPiArCSAgaGFzaCwgdGltZSkKPiA+ICsKPiA+ICsJ
ICBodHRwczovL2dpdGh1Yi5jb20vUGFycm90LURldmVsb3BlcnMvbGliZnV0aWxzCj4gPiArCj4g
PiArY29tbWVudCAibGliZnV0aWxzIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcyIg
IAo+IAo+IFlvdSBuZWVkOgo+IAo+IAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX0FUT01J
QwoKSW5kZWVkLgpXaWxsIGJlIGFkZGVkIGluIHYyLgoKPiAKPiA+ICsJZGVwZW5kcyBvbiAhQlIy
X0lOU1RBTExfTElCU1REQ1BQIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJmdXRpbHMvbGliZnV0aWxzLmhhc2ggYi9wYWNrYWdlL2xpYmZ1
dGlscy9saWJmdXRpbHMuaGFzaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAuLjFmZGNkODRiMTMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2Uv
bGliZnV0aWxzL2xpYmZ1dGlscy5oYXNoCj4gPiBAQCAtMCwwICsxLDMgQEAKPiA+ICsjIExvY2Fs
bHkgY29tcHV0ZWQ6Cj4gPiArc2hhMjU2ICBiMzhkNDBjNDZiODNlNDQ4ZDhjMTcxNmRkZmIwNGI3
ZWNkMzg0ZjVjZDJjYjc3M2RiNWMyNmMwNTg5YWNjZGIzICBsaWJmdXRpbHMtYzMyNmNlMGNjMmE3
MzU0MzgxMjY1YTc2NjRiYjIxNWJlNTg3ZmFjNi50YXIuZ3oKPiA+ICtzaGEyNTYgIGVjYTExYTFj
NjJmYWU4ZDY0YTEyNDdkOTMyNzEzNzViYWVjZmY4Mzk2MTQxZDdmZjhkODk2NzFlZTdlM2VkMGQg
IENPUFlJTkcKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmZ1dGlscy9saWJmdXRpbHMubWsg
Yi9wYWNrYWdlL2xpYmZ1dGlscy9saWJmdXRpbHMubWsKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4yMDQ4MjQ3ZGI2Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiAr
KysgYi9wYWNrYWdlL2xpYmZ1dGlscy9saWJmdXRpbHMubWsKPiA+IEBAIC0wLDAgKzEsNTAgQEAK
PiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKyMKPiA+ICsjIGxpYmZ1dGlscwo+ID4g
KyMKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKwo+ID4gK0xJQkZVVElMU19WRVJT
SU9OID0gYzMyNmNlMGNjMmE3MzU0MzgxMjY1YTc2NjRiYjIxNWJlNTg3ZmFjNgo+ID4gK0xJQkZV
VElMU19TSVRFID0gJChjYWxsIGdpdGh1YixQYXJyb3QtRGV2ZWxvcGVycyxsaWJmdXRpbHMsJChM
SUJGVVRJTFNfVkVSU0lPTikpCj4gPiArTElCRlVUSUxTX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UK
PiA+ICtMSUJGVVRJTFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiA+ICtMSUJGVVRJTFNfREVQ
RU5ERU5DSUVTID0gdWxvZyBob3N0LWFsY2hlbXkKPiA+ICtMSUJGVVRJTFNfSU5TVEFMTF9TVEFH
SU5HID0gWUVTCj4gPiArCj4gPiAraWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19MSUJBVE9NSUMp
LHkpCj4gPiArTElCRlVUSUxTX0NPTkZfRU5WICs9IFRBUkdFVF9HTE9CQUxfTERMSUJTPSctbGF0
b21pYycKPiA+ICtlbmRpZgo+ID4gKwo+ID4gK2RlZmluZSBMSUJGVVRJTFNfQlVJTERfQ01EUwo+
ID4gKwkkKEFMQ0hFTVlfVEFSR0VUX0NPTkZJR1VSRV9FTlYpIFwKPiA+ICsJJChjYWxsIEFMQ0hF
TVlfVEFSR0VUX0NPTkZJR1VSRV9TREtTLCB1bG9nKSBcCj4gPiArCSQoTElCRlVUSUxTX0NPTkZf
RU5WKSBcCj4gPiArCSQoQUxDSEVNWV9NQUtFKSBsaWJmdXRpbHMgIAo+IAo+IEluZGVudGF0aW9u
IG9mIGNvbnRpbnVhdGlvbiBsaW5lcy4KCldpbGwgYmUgY2hhbmdlZCBpbiB2Mi4KCj4gCj4gVGhv
bWFzCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpIZXJ2w6kKCi0tIApIZXJ2w6kgQ29kaW5hLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290
bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
