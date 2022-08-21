Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E7CC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 11:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CAA14018F;
	Sun, 21 Aug 2022 11:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CAA14018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbmWi-ILxwLG; Sun, 21 Aug 2022 11:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 424DA400E2;
	Sun, 21 Aug 2022 11:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 424DA400E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54ABE1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C2E181B7B
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C2E181B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPYcYn7OAO6u for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 11:30:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C9E81B48
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04C9E81B48
 for <buildroot@busybox.net>; Sun, 21 Aug 2022 11:30:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 05BD113F8AE;
 Sun, 21 Aug 2022 13:30:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 13:30:45 +0200
Date: Sun, 21 Aug 2022 13:30:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220821113045.GS2775145@scaer>
References: <20220821092924.1620008-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821092924.1620008-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661081448;
 bh=ThQ4VVA0CkfvC4rsFODuvgwhMPGv8Oe6u8rva+do8h8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZS4DOm8ULj+VSvGnb896x20z561lEVpaYzcDUIWdwALRQib0XuPsO24nLjQlAOqKw
 bI4j1IrgkkaPP0X3ranUSiiQraKNBkbJbUpxHrFm/li3oO7+MRdm7p02OKGzeAVYyx
 lK5krTiZU+nARzsuOz/6atOqoZwAIv4ADlMuMjr4p3dZ6xr8VUzcXTlRbhjNYSa4jg
 OBf3ZGxIwrRMXp0mtw31aQAM9EcbfwsFS007mjofCmjYhMLLEkji9p/VTJjlByI8ET
 fem0sZGogLYro0LEjrI0F7+lW34P2FYaR8Z67IYjJcuHW0XR59Ng9MQdjH6Wao7cAJ
 WwIu+evsfaMDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZS4DOm8U
Subject: Re: [Buildroot] [PATCH 1/2] package/tzdata: bump to version 2022c
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTIxIDExOjI5ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IHVwZGF0ZSBob21lcGFnZSB3aXRoIGh0dHBzCj4gCj4gU2lnbmVk
LW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+CgpCb3Ro
IEFwcGxpZWQgdG8gbmV4dCwgYnV0IGluIHRoZSByZXZlcnNlIG9yZGVyICh6aWMgdGhlbiB0emRh
dGEpLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS90
emRhdGEvQ29uZmlnLmluICAgfCAyICstCj4gIHBhY2thZ2UvdHpkYXRhL3R6ZGF0YS5oYXNoIHwg
NCArKy0tCj4gIHBhY2thZ2UvdHpkYXRhL3R6ZGF0YS5tayAgIHwgMiArLQo+ICAzIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS90emRhdGEvQ29uZmlnLmluIGIvcGFja2FnZS90emRhdGEvQ29uZmlnLmluCj4gaW5k
ZXggMWU2Y2MwZmM2Li4zMTA3MWFmYjAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS90emRhdGEvQ29u
ZmlnLmluCj4gKysrIGIvcGFja2FnZS90emRhdGEvQ29uZmlnLmluCj4gQEAgLTYsNCArNiw0IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9UWkRBVEEKPiAgCWhlbHAKPiAgCSAgVGltZSB6b25lIGRhdGFi
YXNlCj4gIAo+IC0JICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS90
ei1saW5rLmh0bWwKPiArCSAgaHR0cHM6Ly9kYXRhLmlhbmEub3JnL3RpbWUtem9uZXMvdHotbGlu
ay5odG1sCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdHpkYXRhL3R6ZGF0YS5oYXNoIGIvcGFja2Fn
ZS90emRhdGEvdHpkYXRhLmhhc2gKPiBpbmRleCA1NTM0NjUzOWEuLmIyMDNlNWJmNSAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL3R6ZGF0YS90emRhdGEuaGFzaAo+ICsrKyBiL3BhY2thZ2UvdHpkYXRh
L3R6ZGF0YS5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gLSMgRnJvbSBodHRwczovL21tLmljYW5u
Lm9yZy9waXBlcm1haWwvdHotYW5ub3VuY2UvMjAyMS1PY3RvYmVyLzAwMDA2OS5odG1sCj4gLXNo
YTUxMiAgYzFlOGQwNGUwNDkxNTdlZDVkNGFmMDg2ODg1NWJiZDc1NTE3ZTNkN2UxZGI5YzQxZDUy
ODNmZjI2MDEwOWRlNDZiNmZhYzZiZTk0ODI4MjAxZDA5M2UxNjNkODY4MDQ0YWMyYTlkYjJiZjBh
ZWFiODAwZTI2NGQwYzczYTkxMTkgIHR6ZGF0YTIwMjFlLnRhci5nego+ICsjIEZyb20gaHR0cHM6
Ly9tbS5pY2Fubi5vcmcvcGlwZXJtYWlsL3R6LWFubm91bmNlLzIwMjItQXVndXN0LzAwMDA3Mi5o
dG1sCj4gK3NoYTUxMiAgZTJhZTkyYWJhYzZkODdjZTRhYjRiYTkwMTJlODY4ZTE3OTFiODQyZTA4
MzI5MzQ4OWRlYmMwYzY3MWI5Y2YxMzViNWI3MDQyNmRhY2I2ZGJlYmJmNmViYTI0NDYzMjA1MjI1
YWU0NWJiN2RmODkxYTA4NmIyNTQ3NWY4NWVlMGIgIHR6ZGF0YTIwMjJjLnRhci5nego+ICAjIExv
Y2FsbHkgY29tcHV0ZWQ6Cj4gIHNoYTI1NiAgMDYxMzQwODU2ODg4OWY1NzM5ZTVhZTI1MmI3MjJh
MjY1OWMwMjAwMjgzOWFkOTcwYTYzZGM1ZTkxNzRiMjdjZiAgTElDRU5TRQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3R6ZGF0YS90emRhdGEubWsgYi9wYWNrYWdlL3R6ZGF0YS90emRhdGEubWsKPiBp
bmRleCA5Y2Y4YzJlYTQuLjIxZWE5NGVjYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3R6ZGF0YS90
emRhdGEubWsKPiArKysgYi9wYWNrYWdlL3R6ZGF0YS90emRhdGEubWsKPiBAQCAtNCw3ICs0LDcg
QEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtVFpEQVRBX1ZFUlNJT04g
PSAyMDIxZQo+ICtUWkRBVEFfVkVSU0lPTiA9IDIwMjJjCj4gIFRaREFUQV9TT1VSQ0UgPSB0emRh
dGEkKFRaREFUQV9WRVJTSU9OKS50YXIuZ3oKPiAgVFpEQVRBX1NJVEUgPSBodHRwczovL3d3dy5p
YW5hLm9yZy90aW1lLXpvbmVzL3JlcG9zaXRvcnkvcmVsZWFzZXMKPiAgVFpEQVRBX1NUUklQX0NP
TVBPTkVOVFMgPSAwCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
