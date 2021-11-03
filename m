Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4469BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:49:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABF960EE9
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ABF960EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA0D2403EE;
	Wed,  3 Nov 2021 17:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoovGBDd3R3i; Wed,  3 Nov 2021 17:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26FF3404E4;
	Wed,  3 Nov 2021 17:49:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D895E1BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C76204039A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIB1HB4_IQQF for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:49:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E55A403AB
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:49:11 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 66A201BF207;
 Wed,  3 Nov 2021 17:49:09 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:49:07 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211103184907.4e98fe3a@bootlin.com>
In-Reply-To: <20211103165000.2b694680@windsurf>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
 <20211103073656.1689919-5-herve.codina@bootlin.com>
 <20211103165000.2b694680@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/libshdata: new package
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

SGksCgpPbiBXZWQsIDMgTm92IDIwMjEgMTY6NTA6MDAgKzAxMDAKVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+IAo+IE9uIFdl
ZCwgIDMgTm92IDIwMjEgMDg6MzY6NTUgKzAxMDAKPiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGlu
YUBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGUgbGlic2hkYXRhIGxpYnJhcnkgcHJvdmlk
ZXMgbG9jayBmcmVlIHNoYXJlZC1tZW1vcnkgdG9vbHMuCj4gPiAKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9QYXJyb3QtRGV2ZWxvcGVycy9saWJzaGRhdGEKPiA+IAo+ID4gVGhlIHByb3ZpZGVkIHBh
dGNoIHdhcyBzdWJtaXR0ZWQgdXBzdHJlYW0uCj4gPiBodHRwczovL2dpdGh1Yi5jb20vUGFycm90
LURldmVsb3BlcnMvbGlic2hkYXRhL2lzc3Vlcy8xICAKPiAKPiBUaGlzIHNob3VsZCByYXRoZXIg
Z28gaW4gdGhlIHBhdGNoIGl0c2VsZi4KCldpbGwgYmUgbW92ZWQgdG8gdGhlIHBhdGNoIGluIHYy
LgoKPiAKPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNoZGF0YS9Db25maWcuaW4gYi9w
YWNrYWdlL2xpYnNoZGF0YS9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwMDAwLi43MzBmYjM0ZGZmCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9w
YWNrYWdlL2xpYnNoZGF0YS9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsMjMgQEAKPiA+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfTElCU0hEQVRBCj4gPiArCWJvb2wgImxpYnNoZGF0YSIKPiA+ICsJZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQKPiA+ICsJZGVwZW5kcyBvbiBCUjJfVE9P
TENIQUlOX0hBU19BVE9NSUMgIyBsaWJmdXRpbHMKPiA+ICsJZGVwZW5kcyBvbiBCUjJfSU5TVEFM
TF9MSUJTVERDUFAgIyBsaWJmdXRpbHMKPiA+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTICMgbGliZnV0aWxzCj4gPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJGVVRJTFMK
PiA+ICsJaGVscAo+ID4gKwkgIFRoaXMgbGlicmFyeSBwcm92aWRlcyBsb2NrIGZyZWUgc2hhcmVk
LW1lbW9yeSB0b29scwo+ID4gKwo+ID4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9QYXJyb3QtRGV2
ZWxvcGVycy9saWJzaGRhdGEKPiA+ICsKPiA+ICtjb21tZW50ICJsaWJzaGRhdGEgbmVlZHMgYSB0
b29sY2hhaW4gdy8gQysrLCB0aHJlYWRzIgo+ID4gKwlkZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9M
SUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIAo+IAo+IFRoaXMgbmVlZHMg
dG8gZ28gKmFmdGVyKiB0aGUgaWYgLi4uIGVuZGlmIGJsb2NrLCBvciB0aGUgaW5kZW50YXRpb24g
b2YKPiB0aGUgaWYgLi4uIGVuZGlmIGJsb2NrIGlzIGJyb2tlbiBpbiBtZW51Y29uZmlnLiBBbHNv
LCB5b3UgbmVlZCB0bwo+IGFjY291bnQgZm9yIHRoZSBIQVNfU1lOQ180IGFuZCBIQVNfQVRPTUlD
IGRlcGVuZGVuY2llcy4KCk9rLApXaWxsIGJlIGNoYW5nZWQgaW4gdjIuCgo+IAo+IAo+ID4gK2Rl
ZmluZSBMSUJTSERBVEFfQlVJTERfQ01EUwo+ID4gKwkkKEFMQ0hFTVlfVEFSR0VUX0NPTkZJR1VS
RV9FTlYpIFwKPiA+ICsJJChjYWxsIEFMQ0hFTVlfVEFSR0VUX0NPTkZJR1VSRV9TREtTLCBsaWJm
dXRpbHMpIFwKPiA+ICsJJChMSUJTSERBVEFfQ09ORl9FTlYpIFwKPiA+ICsJJChBTENIRU1ZX01B
S0UpICQoTElCU0hEQVRBX1RBUkdFVFMpICAKPiAKPiBJbmRlbnRhdGlvbi4KCldpbGwgYmUgY2hh
bmdlZCBpbiB2Mi4KCj4gCj4gPiArZW5kZWYKPiA+ICsKPiA+ICtkZWZpbmUgTElCU0hEQVRBX0lO
U1RBTExfU1RBVElDX0xJQlMKPiA+ICsJJChJTlNUQUxMKSAtbSA2NDQgJChARCkvYWxjaGVteS1v
dXQvc3RhZ2luZy91c3IvbGliL2xpYnNoZGF0YS5hICQoc3RyaXAgJCgxKSkvdXNyL2xpYi8KPiA+
ICsJJChJTlNUQUxMKSAtbSA2NDQgJChARCkvYWxjaGVteS1vdXQvc3RhZ2luZy91c3IvbGliL2xp
YnNoZGF0YS1zZWN0aW9uLWxvb2t1cC5hICQoc3RyaXAgJCgxKSkvdXNyL2xpYi8KPiA+ICtlbmRl
Zgo+ID4gKwo+ID4gK2RlZmluZSBMSUJTSERBVEFfSU5TVEFMTF9IRUFERVJTCj4gPiArCWNwIC1S
YWYgJChARCkvaW5jbHVkZS8qICQoc3RyaXAgJCgxKSkvdXNyL2luY2x1ZGUvCj4gPiArZW5kZWYK
PiA+ICsKPiA+ICtpZmVxICgkKEJSMl9TVEFUSUNfTElCUyksKQo+ID4gK2RlZmluZSBMSUJTSERB
VEFfSU5TVEFMTF9TSEFSRURfTElCUwo+ID4gKwkkKElOU1RBTEwpIC1tIDc1NSAkKEBEKS9hbGNo
ZW15LW91dC9zdGFnaW5nL3Vzci9saWIvbGlic2hkYXRhLnNvKiAkKHN0cmlwICQoMSkpL3Vzci9s
aWIvICAKPiAKPiBTb3QgaGVyZSBhcmUgdHdvIHNlcGFyYXRlIHN0YXRpYyBsaWJyYXJpZXMsIGJ1
dCBvbmx5IG9uZSBzaGFyZWQgbGlicmFyeSA/CgpZZXMsIHRoYXQncyB3aGF0IGxpYnNoZGF0YSBw
cm92aWRlcy4KbGlic2hkYXRhLXNlY3Rpb24tbG9va3VwIGlzIG9ubHkgYSBzdGF0aWMgbGliIChp
bmNsdWRlICQoQlVJTERfU1RBVElDX0xJQlJBUlkpIGluIGF0b20ubWspLgoKPiAKPiBUaG9tYXMK
ClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkhlcnbDqQoKCi0tIApIZXJ2w6kgQ29kaW5hLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
