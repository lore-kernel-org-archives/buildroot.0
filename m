Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67036C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 18:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50E5607B4;
	Sat, 20 Aug 2022 18:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A50E5607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKD8Qs5xtauW; Sat, 20 Aug 2022 18:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8897607A1;
	Sat, 20 Aug 2022 18:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8897607A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4AC1BF28B
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 18:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DC77607A1
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 18:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DC77607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHWhxP_SZuZD for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 18:38:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217A96077D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 217A96077D
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 18:38:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id ADD4C60129;
 Sat, 20 Aug 2022 20:38:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 20:38:03 +0200
Date: Sat, 20 Aug 2022 20:38:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunojpg@gmail.com>
Message-ID: <20220820183803.GP2167049@scaer>
References: <CAEXMXLT9gkCfFjEyR6=H6qaQ29wbLCJe=6cne9Kmw84KkbdfkQ@mail.gmail.com>
 <CAEXMXLSj4tsDDdHcidQo+kFy61TiB00GMfp9SSuewu5eMnA+wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEXMXLSj4tsDDdHcidQo+kFy61TiB00GMfp9SSuewu5eMnA+wQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661020686;
 bh=muWUR+XsAwzz2oGVDgSRsKw9z+jWHy7Yaue68/tS1Bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nhWg6NzavGvSHYURH/641rfKHOVC2UI4rVG7kU0GzHM4zIJ4SfVCrCd9i+iwTqyNq
 9gmB2JLtqfsoqxVgdHXlZtZU9rymBPo+AaEx6eQ/u2g3ftDs2dHOROY5DKZZGjEujl
 7fFNUqy5zpmk5PHstdANTtQAPKsU1LVAx9c2qEo6F/Ak2U5Drum/B/JJXkz+G0mcbB
 EPelq2NhOimjUInXA50uE9F9fD+78ZRqaQAalbyE2HJlHpU5GzD4NuEK1CsCMQfawm
 d6HpzWaDCDmvlaTdeS2AfTbY2nOLbAV9woizb4yWssHPyFbE7lKlKSfZNgn9X96po9
 shnrov8egbEJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nhWg6Nza
Subject: Re: [Buildroot] [PATCH] package/rpi-userland: support ARM64 build
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

TnVubywgQWxsLAoKT24gMjAyMi0wOC0yMCAxODozNSArMDEwMCwgTnVubyBHb27Dp2FsdmVzIHNw
YWtlIHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBOdW5vIEdvbsOnYWx2ZXMgPG51bm9qcGdAZ21h
aWwuY29tPgoKVGhhbmtzIGZvciBzdWJtaXR0aW5nIHRoaXMgcGF0Y2guCgpUaGlzIGhhcyBiZWVu
IHByb3Bvc2VkIHF1aXRlIGEgZmV3IHRpbWVzIGFscmVhZHk6CgogICAgaHR0cDovL2xpc3RzLmJ1
c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMC1BdWd1c3QvMjg5NTU5Lmh0bWwKICAg
IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjAtSmFudWFy
eS8yNzE1NzcuaHRtbAogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjAx
MDE3MDgyNTI1LkdGMzQ2NkBzY2Flci8KCkFuZCB0aGVyZSB3ZXJlIGF0IHRoZSB0aW1lIHF1aXRl
IGEgbG90IG9mIGNvbmNlcm5zIGFib3V0IGl0LCBhbmQgYQpjb25jbHVzaW9uIHRoYXQgYXJtNjQg
d2FzIGluIGZhY3Qgbm90IHRydWxlIHN1cHBvcnRlZC4KCkluIHNob3J0LCBvbiBhcm02NCwgdGhl
IHNldCBvZiBsaWJyYXJpZXMgd2FzIG5vdCB0aGUgc2FtZSBhcyB0aGF0IG9uCmFybTMyLCBhbmQg
c28gcnBpLXVzZXJsYW5kIGNvdWxkIG5vdCBiZSwgaW4gYXJtNjQsIGEgcHJvdmlkZXIgZm9yCk9w
bmVHTEVTLCBPcGVuR0wtRUdMLCBvciBPcGVuTUFYLgoKQW5kIEknbGwgcXVvdGUgbXkgcHJldmlv
dXMgcmVwbHk6CgpIYXMgdGhhdCBzaXR1YXRpb24gaW1wcm92ZWQgbm93PwoKSWYgdGhlIHNpdHVh
dGlvbiBpcyBiZXR0ZXIgbm93LCB0aGVuIHBsZWFzZSBhZGRyZXNzIHRoYXQgaW4gdGhlIGNvbW1p
dApsb2cuIElmIG5vdCwgcGxlYXNlIHNlZSB0aGUgdGhlIGFmb3JlbWVudGlvbmVkIHRocmVhZHMg
Zm9yIHN1Z2dlc3RlZAppbXByb3ZlbWVudHMgKGxpa2UgbWFraW5nIHRoZSBFR0wvR0xFUy9PUEVO
TUFYIHByb3ZpZGVyIGNvbmRpdGlvbmFsKS4KClBsZWFzZSBub3RlIHRoYXQgdGhlcmUgaXMgb25l
IGJpZyBxdWVzdGlvbiwgYWJvdXQgbGliZmR0LCBpbiBvbmUgb2YKdGhvc2UgdGhyZWFkcywgd2hp
Y2ggbXVzdCBiZSBhZGRyZXNzZWQgdG9vIChhbHRob3VnaCBpdCBkb2VzIG5vdCBzZWVtIHRvCmJl
IEFBcmNoNjQtcmVsYXRlZD8pLgoKRm9yIG5vdywgSSd2ZSBtYXJrZWQgdGhpcyBwYXRjaCBhcyBj
aGFuZ2VzIHJlcXVlc3RlZC4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNr
YWdlL3JwaS11c2VybGFuZC9Db25maWcuaW4gICAgICAgfCAyICstCj4gIHBhY2thZ2UvcnBpLXVz
ZXJsYW5kL3JwaS11c2VybGFuZC5tayB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS11
c2VybGFuZC9Db25maWcuaW4gYi9wYWNrYWdlL3JwaS11c2VybGFuZC9Db25maWcuaW4KPiBpbmRl
eCAzNDJmYWYyNmUzLi44MDllYzZhNmEyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnBpLXVzZXJs
YW5kL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvcnBpLXVzZXJsYW5kL0NvbmZpZy5pbgo+IEBA
IC0xLDYgKzEsNiBAQAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfUlBJX1VTRVJMQU5ECj4gICBib29s
ICJycGktdXNlcmxhbmQiCj4gLSBkZXBlbmRzIG9uIEJSMl9hcm0KPiArIGRlcGVuZHMgb24gQlIy
X2FybSB8fCBCUjJfYWFyY2g2NAo+ICAgZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAK
PiAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwo+ICAgZGVwZW5kcyBvbiAh
QlIyX1NUQVRJQ19MSUJTCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXVzZXJsYW5kL3JwaS11
c2VybGFuZC5tawo+IGIvcGFja2FnZS9ycGktdXNlcmxhbmQvcnBpLXVzZXJsYW5kLm1rCj4gaW5k
ZXggMTIwNDE5NmUxOS4uNGVhNTFmYTdmNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3JwaS11c2Vy
bGFuZC9ycGktdXNlcmxhbmQubWsKPiArKysgYi9wYWNrYWdlL3JwaS11c2VybGFuZC9ycGktdXNl
cmxhbmQubWsKPiBAQCAtMTcsNiArMTcsMTAgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJFWEVD
SU5GTykseSkKPiAgUlBJX1VTRVJMQU5EX0RFUEVOREVOQ0lFUyArPSBsaWJleGVjaW5mbwo+ICBl
bmRpZgo+IAo+ICtpZmVxICgkKEJSMl9hYXJjaDY0KSx5KQo+ICtSUElfVVNFUkxBTkRfQ09ORl9P
UFRTICs9IC1EQVJNNjQ9MQo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9SUElf
VVNFUkxBTkRfSEVMTE8pLHkpCj4gCj4gIFJQSV9VU0VSTEFORF9DT05GX09QVFMgKz0gLURBTExf
QVBQUz1PTgo+IC0tCj4gMi4zNy4yCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
