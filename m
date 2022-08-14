Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57C2C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 09:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8673F4019B;
	Sun, 14 Aug 2022 09:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8673F4019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLVqCx3ZqIaK; Sun, 14 Aug 2022 09:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C8524017E;
	Sun, 14 Aug 2022 09:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C8524017E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E578C1BF361
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC5DE83EC5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC5DE83EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ySMDdExLJUn for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 09:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 918C383EBE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 918C383EBE
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 09:41:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AFD556013E;
 Sun, 14 Aug 2022 11:41:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 11:41:35 +0200
Date: Sun, 14 Aug 2022 11:41:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814094135.GE2854108@scaer>
References: <20220814090639.1226553-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814090639.1226553-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660470097;
 bh=pxb/up5bHCPRyXhO8ArcWrPaTWcDeiDvOwJWOy0wA4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=un8QmjPBXqlWx0F5IKqmZGtTHWrH+z2cwZ9SAC6kOmK7S9Jq3rmAOK5THfgVlc50S
 gxui7qkNAXThlBQZ+Wp7+DZBm+JqCMGXkY9KtKbyaLM6lfEBlikCBrG4slUHmnCxq2
 a3zNweVl9xPKjDLHfXrQU6UHOD6CsCXT90GeQPt/aLEmo7G0F6laxXQxcRuDU3RkaY
 bJSpSbfWNB9jtqiCVCe+7B4crSk3aUoD7fKm/gCPiFyhaNKKmah8DS+W9XSOopIhG8
 mqqy3c1R0Q5Rj+eAJ5MmrPsSMhrjhJ5pGxKR6tboyFU7LKewWhd1LV27iT3jHtaDra
 Y8Rx7j76XE6eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=un8QmjPB
Subject: Re: [Buildroot] [PATCH] package/gnutls: security bump to version
 3.7.7
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE0IDExOjA2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IGZpeCBHTlVUTFMtU0EtMjAyMi0wNy0wNwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBw
YWNrYWdlL2dudXRscy9nbnV0bHMuaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL2dudXRscy9nbnV0
bHMubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ251dGxzL2dudXRscy5oYXNoIGIv
cGFja2FnZS9nbnV0bHMvZ251dGxzLmhhc2gKPiBpbmRleCBmZjE5MTI3OGMuLjQ2ZGQ5OTI5MSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dudXRscy9nbnV0bHMuaGFzaAo+ICsrKyBiL3BhY2thZ2Uv
Z251dGxzL2dudXRscy5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gICMgTG9jYWxseSBjYWxjdWxh
dGVkIGFmdGVyIGNoZWNraW5nIHBncCBzaWduYXR1cmUKPiAtIyBodHRwczovL3d3dy5nbnVwZy5v
cmcvZnRwL2djcnlwdC9nbnV0bHMvdjMuNy9nbnV0bHMtMy43LjYudGFyLnh6LnNpZwo+IC1zaGEy
NTYgIDc3MDY1NzE5YTM0NWJmYjE4ZmFhMjUwMTM0YmU0YzUzYmVmNzBjMWJkNjFmNmMwYzIzY2Vi
OGI0NGYwMjYyZmYgIGdudXRscy0zLjcuNi50YXIueHoKPiArIyBodHRwczovL3d3dy5nbnVwZy5v
cmcvZnRwL2djcnlwdC9nbnV0bHMvdjMuNy9nbnV0bHMtMy43LjcudGFyLnh6LnNpZwo+ICtzaGEy
NTYgIGJlOTE0M2QwZDU4ZWFiNjRkYmE5Yjc3MTE0YWFhZmFjNTI5YjZjMGQ3ZTgxZGU2YmRmMWM5
YjU5MDI3ZDIxMDYgIGdudXRscy0zLjcuNy50YXIueHoKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
PiAgc2hhMjU2ICBlNzllOWM4YTBjODVkNzM1ZmY5ODE4NTkxOGVjOTRlZDdkMTc1ZWZjMzc3MDEy
Nzg3YWViY2YzYjgwZjBkOTBiICBkb2MvQ09QWUlORwo+ICBzaGEyNTYgIDYwOTVlOWZmYTc3N2Rk
MjI4MzlmNzgwMWFhODQ1YjMxYzllZDA3ZjNkNmJmOGEyNmRjNWQyZGVjOGNjYzBlZjMgIGRvYy9D
T1BZSU5HLkxFU1NFUgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dudXRscy9nbnV0bHMubWsgYi9w
YWNrYWdlL2dudXRscy9nbnV0bHMubWsKPiBpbmRleCBjZDJjNmI0NWIuLjU2ZGFlNGM2YiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2dudXRscy9nbnV0bHMubWsKPiArKysgYi9wYWNrYWdlL2dudXRs
cy9nbnV0bHMubWsKPiBAQCAtNiw3ICs2LDcgQEAKPiAgCj4gICMgV2hlbiBidW1waW5nLCBtYWtl
IHN1cmUgKmFsbCogLS13aXRob3V0LWxpYmZvby1wcmVmaXggb3B0aW9ucyBhcmUgaW4gR05VVExT
X0NPTkZfT1BUUwo+ICBHTlVUTFNfVkVSU0lPTl9NQUpPUiA9IDMuNwo+IC1HTlVUTFNfVkVSU0lP
TiA9ICQoR05VVExTX1ZFUlNJT05fTUFKT1IpLjYKPiArR05VVExTX1ZFUlNJT04gPSAkKEdOVVRM
U19WRVJTSU9OX01BSk9SKS43Cj4gIEdOVVRMU19TT1VSQ0UgPSBnbnV0bHMtJChHTlVUTFNfVkVS
U0lPTikudGFyLnh6Cj4gIEdOVVRMU19TSVRFID0gaHR0cHM6Ly93d3cuZ251cGcub3JnL2Z0cC9n
Y3J5cHQvZ251dGxzL3YkKEdOVVRMU19WRVJTSU9OX01BSk9SKQo+ICBHTlVUTFNfTElDRU5TRSA9
IExHUEwtMi4xKyAoY29yZSBsaWJyYXJ5KQo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19f
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
