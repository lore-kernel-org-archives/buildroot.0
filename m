Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08538C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA2281311;
	Wed, 18 Jan 2023 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DA2281311
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqHvjF-EsfNM; Wed, 18 Jan 2023 21:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B30FA812FC;
	Wed, 18 Jan 2023 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B30FA812FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32B2F1BF308
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E617812FC
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 21:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E617812FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Btn36TOXr_V1 for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 21:23:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9F6812D7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE9F6812D7
 for <buildroot@busybox.net>; Wed, 18 Jan 2023 21:23:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 773C05FFA0;
 Wed, 18 Jan 2023 22:23:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 22:23:46 +0100
Date: Wed, 18 Jan 2023 22:23:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230118212346.GN2770@scaer>
References: <20230118154614.2103-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118154614.2103-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674077029;
 bh=kAMVace2xS4JGJx3d122bDML2XmiAcXunN//xml3BWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j2az9IxS7J/mWYWJLM+1/kf/OEr6cw0AODafvkyDpUAMIr0txohlRopMlImBiFc+g
 dkJ8/HbLEMNwZ/5puhxgCM+WICXfMiiikBcUbCqhe0h3eyJvMm0CgDjXYLzqbUIaJE
 nHbQxI1uRbEQT9CIGgLgePoakuWWuPZUS/gPOYIpnEfmYTbbY22bx2M/n2IWTsi91Q
 oRutVfg3sjJRGb30KRqjryY8PB2ES1g8K1gcSBN9CE32YhmOvnv2GTowAgC03bLgNS
 fNRJnT1XjpuQcs8IxfcdpVf64aDwpF3q3iM92MAuL0V2DiXKi32SMUqN68ocj22qR4
 Aeit8zrWuqnoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j2az9IxS
Subject: Re: [Buildroot] [PATCH v2] package/lua: add options for coercion
 between number and string
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTAxLTE4IDE2OjQ2ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IHRoZSBkZWZhdWx0IGJlaGF2aW9yIG9mIEx1YSA1LjMvNS40IGlu
dGVycGVydGVyCj4gKGFuZCB0aGUgb25seSB3YXkgd2l0aCBMdWEgNS4xKSBpcyB0aGUgYXV0b21h
dGljIGNvZXJjaW9uLgoKVGhlbiB3ZSBzaG91bGQgbWFrZSB0aGF0IG9idmlvdXMgYnkgZW90aGVy
IGhpZGluZyB0aGUgb3B0aW9ucyB3aGVuIGx1YQo1LjEgaXMgc2VlbGVjdGVkLCBvZiB0byBtYWtl
IGx1YSA1LjEgZm9yY2libHkgZW5hYmxlIHRob3NlIG9wdGlvbnMsIG5vPwoKT3RoZXJ3aXNlLCBh
IHBhY2thZ2UgdGhhdCBkZXBlbmRzIG9uIGF1dG9tYXRpYyBjb2VyY2lvbiwgYW5kIGhhcyBubyBs
dWEKdmVyc2lvbiByZXF1aXJlbWVudCwgd291bGQgbm90IGJlIHNlbGVjdGFibGUgb24gbHVhIDUu
MSwgYmVjYXVzZSBzdWNoIGEKcGFja2FnZSB3b3VsZCBiZSBkZWZpbmVkIHdpdGggc29tZXRoaW5n
IGxpa2U6CgogICAgY29uZmlnIEJSMl9QS0dfTFVBX0ZPTwogICAgICAgIGJvb2wgImx1YS1mb28i
CiAgICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MVUFfQ1ZUX1MyTiAmJiBCUjJfUEFDS0FH
RV9MVUFfQ1ZUX1MyTgoKU2luY2UgYm90aCBCUjJfUEFDS0FHRV9MVUFfQ1ZUX1MyTiBhbmQgQlIy
X1BBQ0tBR0VfTFVBX0NWVF9OMlMgYXJlIG9ubHkKc2VsZWN0YWJsZSBmb3IgNS4zIG9yIDUuNCwg
dGhleSB3b3VsZCBmb3JjaWJseSBuZXZlciBiZSBzZXQgZm9yIGx1YSA1LjEsCmV2ZW4gdGhvdWdo
IHRoYXQgaXMgYWN0dWFsbHkgd2hhdCBsdWEgNS4xIGRvZXMuCgpTbywgSSBtb3ZlZCB0aGUgb3B0
aW9ucyBvdXQgb2YgdGhlIDUuM3x8NS40IGNvbmRpdGlvbiwgYW5kIG1hZGUgbHVhIDUuMQpmb3Jj
aWJseSBzZWxlY3QgdGhlbS4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiB0aGlzIGRlZmF1bHQgYmVoYXZpb3IgY291bGQgY2hhbmdlIGluIGZ1
dHVyZSB2ZXJzaW9uIChpZS4gTHVhIDUuNSkuCj4gCj4gZGlzYWJsaW5nIGF1dG9tYXRpYyBjb2Vy
Y2lvbiBpbmNyZWFzZXMgdGhlIHBlcmZvcm1hbmNlIG9mIHRoZSBpbnRlcnByZXRlci4KPiAKPiBj
dXJyZW50bHksIHVzaW5nIGF1dG9tYXRpYyBjb2VyY2lvbiBpcyBub3QgYSBnb29kL3JlY29tbWVu
ZGVkIHByYWN0aWNlLAo+IGJ1dCB0aGVyZSBhcmUgbm8gd2F5IChleHBlY3QgdGVzdGluZykgdG8g
c2F5IGlmIGEgTHVhIG1vZHVsZSByZWxpZXMgb24gaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Cj4gLS0tCj4gIHBhY2thZ2Uv
bHVhL0NvbmZpZy5pbiB8IDE0ICsrKysrKysrKysrKysrCj4gIHBhY2thZ2UvbHVhL2x1YS5tayAg
ICB8ICA4ICsrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS9Db25maWcuaW4gYi9wYWNrYWdlL2x1YS9Db25maWcu
aW4KPiBpbmRleCAzMDlkZDZlZWMuLmFjMzBjZmRkZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1
YS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2x1YS9Db25maWcuaW4KPiBAQCAtNDEsNiArNDEs
MjAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xVQV8zMkJJVFMKPiAgCSAgZGVmYXVsdCA2NCBiaXQg
dHlwZS4gVGhpcyBvcHRpb24gaXMgcGFydGljdWxhcmx5IGF0dHJhY3RpdmUKPiAgCSAgZm9yIHNt
YWxsIG1hY2hpbmVzIGFuZCBlbWJlZGRlZCBzeXN0ZW1zLgo+ICAKPiArY29uZmlnIEJSMl9QQUNL
QUdFX0xVQV9DVlRfTjJTCj4gKwlib29sICJhdXRvbWF0aWMgY29lcmNpb24gZnJvbSBudW1iZXIg
dG8gc3RyaW5nIgo+ICsJZGVmYXVsdCB5Cj4gKwloZWxwCj4gKwkgIElmIHVuc3VyZSwgc2F5IHks
IHRoaXMgaXMgdGhlIGRlZmF1bHQgYmVoYXZpb3Igb2YgdGhlIEx1YQo+ICsJICBpbnRlcnByZXRl
ci4gU2VlIExVQV9OT0NWVE4yUyBpbiBsdWFjb25mLmgKPiArCj4gK2NvbmZpZyBCUjJfUEFDS0FH
RV9MVUFfQ1ZUX1MyTgo+ICsJYm9vbCAiYXV0b21hdGljIGNvZXJjaW9uIGZyb20gc3RyaW5nIHRv
IG51bWJlciIKPiArCWRlZmF1bHQgeQo+ICsJaGVscAo+ICsJICBJZiB1bnN1cmUsIHNheSB5LCB0
aGlzIGlzIHRoZSBkZWZhdWx0IGJlaGF2aW9yIG9mIHRoZSBMdWEKPiArCSAgaW50ZXJwcmV0ZXIu
IFNlZSBMVUFfTk9DVlROMlMgaW4gbHVhY29uZi5oCj4gKwo+ICBlbmRpZgo+ICAKPiAgY2hvaWNl
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhL2x1YS5tayBiL3BhY2thZ2UvbHVhL2x1YS5tawo+
IGluZGV4IDAxYjU1NGViNi4uMTYwODZlN2JmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhL2x1
YS5tawo+ICsrKyBiL3BhY2thZ2UvbHVhL2x1YS5tawo+IEBAIC0zMSw2ICszMSwxNCBAQCBlbHNl
IGlmZXEgKCQoQlIyX1BBQ0tBR0VfTFVBXzVfMykseSkKPiAgTFVBX0NGTEFHUyArPSAtRExVQV9D
T01QQVRfNV8yCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xVQV9DVlRfTjJT
KSwpCj4gK0xVQV9DRkxBR1MgKz0gLURMVUFfTk9DVlROMlMKPiArZW5kaWYKPiArCj4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfTFVBX0NWVF9TMk4pLCkKPiArTFVBX0NGTEFHUyArPSAtRExVQV9OT0NW
VFMyTgo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4gIExVQV9C
VUlMRE1PREUgPSBzdGF0aWMKPiAgZWxzZQo+IC0tIAo+IDIuMzcuMgo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
