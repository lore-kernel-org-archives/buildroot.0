Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63160C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29DD4169B;
	Wed, 24 Aug 2022 11:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29DD4169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86NvjUSzUU90; Wed, 24 Aug 2022 11:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B33F4168B;
	Wed, 24 Aug 2022 11:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B33F4168B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 691011C2747
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2297C4167B
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2297C4167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDNcbIZsRPZY for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:12:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E78941684
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E78941684
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:12:58 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oQoJa-00HCOJ-6G; Wed, 24 Aug 2022 13:12:54 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4ddd9973;
 Wed, 24 Aug 2022 11:12:44 +0000 (UTC)
Date: Wed, 24 Aug 2022 14:12:44 +0300
Message-ID: <20220824141244.GB174898@kodama>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <aea5eb95-0596-bbe0-a57e-d5f8b60f6b1e@mind.be>
References: <20220601210939.2350383-1-aperez@igalia.com>
 <aea5eb95-0596-bbe0-a57e-d5f8b60f6b1e@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wKHA5KJaPykMjPBVJveLb7jxU6CtK/nLxwBABDPI1WE=; b=nRjSZUSsfkj0D/rygq3zjfCg6A
 7DhQNzbC3i2jdpHVLrwFc4AgXxKwOJPlHs1BaH2vD+N4EtabMDS0oB9MQ8+qM3xx8MqbEKOj3Is3F
 rHc7EFHfTH8iLz/5JzT/CSKXb5adQAYOIbPkNaYfaD94k4jW9FX1NKhxDhXO4qNjIjj0TdzAZxkyU
 H/XmxZqUhwy5HCkit4lUEgsRur81YW6SQDFP84JKG6HpnI01kC+3/lvrSclPR+PjnjdM1kIEXkP1Q
 a8zNguWTtTEN29ngEgT1jGfE6DVkqB6uPGO+utG6w/FrgqNmsl/ctffSAWB0T3RKckpf85ywrjEVx
 KA7ljFAw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=nRjSZUSs
Subject: Re: [Buildroot] [PATCH 1/2] package: Add libmanette
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0341071869753371039=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0341071869753371039==
Content-Type: multipart/signed; boundary="vIqvyXfio8QaOcVA"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--vIqvyXfio8QaOcVA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAyMyBBdWcgMjAyMiAyMjo0ODoxMiArMDIwMCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8
YXJub3V0QG1pbmQuYmU+IHdyb3RlOgoKPiBPbiAwMS8wNi8yMDIyIDIzOjA5LCBBZHJpYW4gUGVy
ZXogZGUgQ2FzdHJvIHdyb3RlOgo+ID4gbGlibWFuZXR0ZSBpcyBhIGxpYnJhcnkgd2hpY2ggcHJv
dmlkZXMgYSBoaWdoZXIgbGV2ZWwgaW50ZXJmYWNlIHRvCj4gPiBlbnVtZXJhdGUgYW5kIG1ha2Ug
dXNlIG9mIGdhbWUgY29udHJvbGxlcnMgKGdhbWVwYWRzLCBqb3lzdGlja3MpLgo+ID4gV2ViS2l0
R1RLIGNhbiB1c2UgbGlibWFuZXR0ZSB0byBleHBvc2UgY29udHJvbGxlcnMgdG8gd2ViIGNvbnRl
bnQsCj4gPiB3aGljaCB3aWxsIGJlIGVuYWJsZWQgb24gYSBmb2xsb3ctdXAgcGF0Y2guCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEu
Y29tPgo+IAo+ICAgQXBwbGllZCBib3RoIHRvIG5leHQsIGFmdGVyIGFkZGluZyB0aGUga2VybmVs
IGhlYWRlcnMgZGVwZW5kZW5jeSBhbmQgdXBkYXRpbmcgCj4gdGhlIGRlcGVuZGVuY3kgY29tbWVu
dHMgYXMgaW5kaWNhdGVkIGJ5IFJvbWFpbiwgdGhhbmtzLgoKVGhhbmtzIX4KCj4gICBSZWdhcmRz
LAo+ICAgQXJub3V0Cj4gCj4gPiAtLS0KPiA+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiA+ICAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8
ICAxICsKPiA+ICAgcGFja2FnZS9saWJtYW5ldHRlL0NvbmZpZy5pbiAgICAgICB8IDE1ICsrKysr
KysrKysrCj4gPiAgIHBhY2thZ2UvbGlibWFuZXR0ZS9saWJtYW5ldHRlLmhhc2ggfCAgNSArKysr
Cj4gPiAgIHBhY2thZ2UvbGlibWFuZXR0ZS9saWJtYW5ldHRlLm1rICAgfCA0MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAgNSBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25z
KCspCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYm1hbmV0dGUvQ29uZmlnLmlu
Cj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYm1hbmV0dGUvbGlibWFuZXR0ZS5o
YXNoCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYm1hbmV0dGUvbGlibWFuZXR0
ZS5tawo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiA+IGlu
ZGV4IDcxY2MzZGE2ZDcuLjc0MGU5YTNjYTcgMTAwNjQ0Cj4gPiAtLS0gYS9ERVZFTE9QRVJTCj4g
PiArKysgYi9ERVZFTE9QRVJTCj4gPiBAQCAtMzUsNiArMzUsNyBAQCBGOglwYWNrYWdlL2J1YmJs
ZXdyYXAvCj4gPiAgIEY6CXBhY2thZ2UvY2FnZS8KPiA+ICAgRjoJcGFja2FnZS9jb2cvCj4gPiAg
IEY6CXBhY2thZ2UvbGliZXBveHkvCj4gPiArRjoJcGFja2FnZS9saWJtYW5ldHRlLwo+ID4gICBG
OglwYWNrYWdlL2xpYnBzbC8KPiA+ICAgRjoJcGFja2FnZS9saWJ3cGUvCj4gPiAgIEY6CXBhY2th
Z2Uvd2Via2l0Z3RrLwo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiA+IGluZGV4IDAwZjA2MTAxNWYuLjIyNDJhZDQwOWUgMTAwNjQ0Cj4gPiAt
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiA+IEBA
IC01MDYsNiArNTA2LDcgQEAgZW5kbWVudQo+ID4gICAJc291cmNlICJwYWNrYWdlL2tiZC9Db25m
aWcuaW4iCj4gPiAgIAlzb3VyY2UgInBhY2thZ2UvbGNkcHJvYy9Db25maWcuaW4iCj4gPiAgIAlz
b3VyY2UgInBhY2thZ2UvbGliaWVjNjE4NTAvQ29uZmlnLmluIgo+ID4gKwlzb3VyY2UgInBhY2th
Z2UvbGlibWFuZXR0ZS9Db25maWcuaW4iCj4gPiAgIAlzb3VyY2UgInBhY2thZ2UvbGlidWJvb3Rl
bnYvQ29uZmlnLmluIgo+ID4gICAJc291cmNlICJwYWNrYWdlL2xpYnVpby9Db25maWcuaW4iCj4g
PiAgIAlzb3VyY2UgInBhY2thZ2UvbGludXgtYmFja3BvcnRzL0NvbmZpZy5pbiIKPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYm1hbmV0dGUvQ29uZmlnLmluIGIvcGFja2FnZS9saWJtYW5ldHRl
L0NvbmZpZy5pbgo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAu
LjgyOTdkOGM3ZjQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvbGlibWFuZXR0
ZS9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsMTUgQEAKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0Vf
TElCTUFORVRURQo+ID4gKwlib29sICJsaWJtYW5ldHRlIgo+ID4gKwlkZXBlbmRzIG9uIEJSMl9V
U0VfV0NIQVIgIyBnZXR0ZXh0Cj4gPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhS
RUFEUwo+ID4gKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCj4gPiArCXNlbGVjdCBC
UjJfUEFDS0FHRV9MSUJFVkRFVgo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCR0xJQjIKPiA+
ICsJaGVscAo+ID4gKwkgIEdPYmplY3QgbGlicmFyeSB3aGljaCBwcm92aWRlcyBhY2Nlc3MgdG8g
Z2FtZSBjb250cm9sbGVycy4KPiA+ICsKPiA+ICsJICBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcv
R05PTUUvbGlibWFuZXR0ZQo+ID4gKwo+ID4gK2NvbW1lbnQgImxpYm1hbmV0dGUgbmVlZHMgYSB0
b29sY2hhaW4gdy8gd2NoYXIsIHRocmVhZHMiCj4gPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUK
PiA+ICsJZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUiB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhS
RUFEUwo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWFuZXR0ZS9saWJtYW5ldHRlLmhhc2gg
Yi9wYWNrYWdlL2xpYm1hbmV0dGUvbGlibWFuZXR0ZS5oYXNoCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uOTYwODlmOTcxYQo+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gKysrIGIvcGFja2FnZS9saWJtYW5ldHRlL2xpYm1hbmV0dGUuaGFzaAo+ID4gQEAgLTAsMCAr
MSw1IEBACj4gPiArIyBGcm9tIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGli
bWFuZXR0ZS8wLjIvbGlibWFuZXR0ZS0wLjIuNi5zaGEyNTZzdW0KPiA+ICtzaGEyNTYgIDYzNjUz
MjU5YTgyMWVjN2Q5MGQ2ODFlNTJlNzU3ZTIyMTlkNDYyODI4YzlkNzRiMDU2YTVmNTMyNjc2MzZi
YWMgIGxpYm1hbmV0dGUtMC4yLjYudGFyLnh6Cj4gPiArCj4gPiArIyBMb2NhbGx5IGNhbGN1bGF0
ZWQKPiA+ICtzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRm
ZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYm1hbmV0dGUvbGlibWFuZXR0ZS5tayBiL3BhY2thZ2UvbGlibWFuZXR0ZS9saWJtYW5ldHRl
Lm1rCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMTBmMmI4
YTQ2Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9saWJtYW5ldHRlL2xpYm1h
bmV0dGUubWsKPiA+IEBAIC0wLDAgKzEsNDIgQEAKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ID4gKyMKPiA+ICsjIGxpYm1hbmV0dGUKPiA+ICsjCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiA+ICsKPiA+ICtMSUJNQU5FVFRFX1ZFUlNJT05fTUFKT1IgPSAwLjIKPiA+ICtMSUJN
QU5FVFRFX1ZFUlNJT04gPSAkKExJQk1BTkVUVEVfVkVSU0lPTl9NQUpPUikuNgo+ID4gK0xJQk1B
TkVUVEVfU09VUkNFID0gbGlibWFuZXR0ZS0kKExJQk1BTkVUVEVfVkVSU0lPTikudGFyLnh6Cj4g
PiArTElCTUFORVRURV9TSVRFID0gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9s
aWJtYW5ldHRlLyQoTElCTUFORVRURV9WRVJTSU9OX01BSk9SKQo+ID4gK0xJQk1BTkVUVEVfTElD
RU5TRSA9IExHUEwtMi4xKwo+ID4gK0xJQk1BTkVUVEVfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcK
PiA+ICtMSUJNQU5FVFRFX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gK0xJQk1BTkVUVEVfREVQ
RU5ERU5DSUVTID0gXAo+ID4gKwlsaWJldmRldiBcCj4gPiArCWxpYmdsaWIyIFwKPiA+ICsJJChU
QVJHRVRfTkxTX0RFUEVOREVOQ0lFUykKPiA+ICsKPiA+ICtMSUJNQU5FVFRFX0xERkxBR1MgPSAk
KFRBUkdFVF9MREZMQUdTKSAkKFRBUkdFVF9OTFNfTElCUykKPiA+ICsKPiA+ICtMSUJNQU5FVFRF
X0NPTkZfT1BUUyA9IFwKPiA+ICsJLURkZW1vcz1mYWxzZSBcCj4gPiArCS1EYnVpbGQtdGVzdHM9
ZmFsc2UgXAo+ID4gKwktRGluc3RhbGwtdGVzdHM9ZmFsc2UgXAo+ID4gKwktRGRvYz1mYWxzZSBc
Cj4gPiArCS1EdmFwaT1mYWxzZQo+ID4gKwo+ID4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfR09CSkVD
VF9JTlRST1NQRUNUSU9OKSx5KQo+ID4gK0xJQk1BTkVUVEVfQ09ORl9PUFRTICs9IC1EaW50cm9z
cGVjdGlvbj10cnVlCj4gPiArTElCTUFORVRURV9ERVBFTkRFTkNJRVMgKz0gZ29iamVjdC1pbnRy
b3NwZWN0aW9uCj4gPiArZWxzZQo+ID4gK0xJQk1BTkVUVEVfQ09ORl9PUFRTICs9IC1EaW50cm9z
cGVjdGlvbj1mYWxzZQo+ID4gK2VuZGlmCj4gPiArCj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9M
SUJHVURFVikseSkKPiA+ICtMSUJNQU5FVFRFX0NPTkZfT1BUUyArPSAtRGd1ZGV2PWVuYWJsZWQK
PiA+ICtMSUJNQU5FVFRFX0RFUEVOREVOQ0lFUyArPSBsaWJndWRldgo+ID4gK2Vsc2UKPiA+ICtM
SUJNQU5FVFRFX0NPTkZfT1BUUyArPSAtRGd1ZGV2PWRpc2FibGVkCj4gPiArZW5kaWYKPiA+ICsK
PiA+ICskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--vIqvyXfio8QaOcVA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYwYHrAAKCRCRxVnb5MkS
O7oLAJ0Y8iWVrsEwaACJPNQTRDW2EEjP0QCdEAODx7BWjhoV/j4/Y+gtNf10Qv8=
=IMvO
-----END PGP SIGNATURE-----

--vIqvyXfio8QaOcVA--

--===============0341071869753371039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0341071869753371039==--
