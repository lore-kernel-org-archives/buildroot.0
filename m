Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC21C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 12:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E645407E8;
	Sun,  5 Jul 2026 12:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgag-4XzqMWr; Sun,  5 Jul 2026 12:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2FBB407F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783255935;
	bh=aodqhLkNJPxMf1wlvD5TcBQUwkZQG5usuO8GYIZe0nc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vzns9rmvN6pZ51cqdWAoyochgFpMaEpHq+Utq9lQHewxpD+SaMqfrZiX1L5EeT8t8
	 QPI6hW425RRjUB77S/uc9pJObXIzY86NUAnuWMpE1oFy3Xse/1DPY7fad6Ly5T2O0a
	 zrhbHAx438U8U29QdMrBLsG2pZ4saiFyhhQOKB42GgWsvO03iDnvwO2ByE50wWkCZu
	 ole3jRpWmTYxqg5IfVJEqfxYvG9PaWHTJ7i2Gu8KXkGqTn6feYsEkqOamFXSijBwHR
	 8npA6oFWA1sa50Pb3wahgQWAZR77CkDznlAGmCXnEcGIdrKkOGtc9GagphGNbKmNq/
	 YGFtWpQXHORew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2FBB407F7;
	Sun,  5 Jul 2026 12:52:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED28D2A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEA7D80AE6
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKjFqbSSp1wb for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 12:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D17BF80AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D17BF80AC5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D17BF80AC5
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:52:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EEB01B00572;
 Sun,  5 Jul 2026 14:52:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 14:52:08 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 14:52:08 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
In-Reply-To: <20260617-pmem-v1-2-bac54881145c@arm.com>
References: <20260617-pmem-v1-0-bac54881145c@arm.com>
 <20260617-pmem-v1-2-bac54881145c@arm.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <97ad31a7ec85178d511d669de397c62d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783255931;
 bh=nmnT/ZXLmu//54dLuBnRCuGaoJqnzzo60rcxrTURgT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IUKVYljWFeE03jKA8BJDyvoKx+90LharHD+mhiB99Brdb8lvtdYRwuV6BWh94VxRp
 Kg68jXWJMJjWEPonIOI2rXwfkl4hGtH3jG59P9ikgcUFP1I6zZEX8b0h5pkZ9dj9gH
 wd9FRpFaAJXqatigWd2LgL0kyAdRKltJHyjcFwNEoCZMWUOxyj+ChNOWDoJjrryVMg
 3EBcPIkCt9K6t35BPbv319/YM8TyVtKl524xTJDr7lbhON5+ar7eNUnyDi8AERJbgc
 PkGsS6rxSDI8UsSFwjZRlI6BcJrbFHVc1UYIyugfIXjTQiMwdq0gJ+T1x/rTbeWw6G
 3MarUiuIMTX0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IUKVYljW
Subject: Re: [Buildroot] [PATCH 2/2] configs/aarch64_efi: support net boot
 with devicetree
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIDE3LzA2LzIwMjYgMTk6MTAsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToK
PiBVRUZJIHBsYXRmb3JtcyB3aXRoIGEgRGV2aWNldHJlZSBoYXZlIHJlY2VudGx5IGdhaW5lZCBz
dXBwb3J0IGZvciBzb21lIAo+IGZvcm0KPiBvZiBuZXR3b3JrIGJvb3RpbmcuIFsxXVsyXQo+IAo+
IE9uIHRob3NlIHBsYXRmb3JtcywgdGhlIFVFRkkgZmlybXdhcmUgZG93bmxvYWRzIHRoZSBkaXNr
IGltYWdlIG92ZXIgdGhlCj4gbmV0d29yayBhbmQgcHJlc2VudHMgaXQgdG8gVUVGSSBhcHBsaWNh
dGlvbnMgdXNpbmcgdGhlIHNpbXBsZSAKPiBmaWxlc3lzdGVtCj4gcHJvdG9jb2wuIFRoaXMgaXMg
c3VmZmljaWVudCBmb3IgT1MgbG9hZGVycyBzdWNoIGFzIGUuZy4gR1JVQiB0byBmaW5kIAo+IHRo
ZWlyCj4gY29uZmlndXJhdGlvbiBhbmQgbG9hZCB0aGUga2VybmVsIGltYWdlLgo+IAo+IFRoZSBm
aXJtd2FyZSBtdXN0IGFsc28gZGVzY3JpYmUgdGhlIHJhbWRpc2sgdG8gdGhlIE9TLCBzbyB0aGF0
IGl0IGZpbmRzIAo+IGl0cwo+IHJvb3QgZmlsZXN5c3RlbS4gT24gQUNQSSBiYXNlZCBwbGF0Zm9y
bXMgdGhpcyBpcyBkb25lIHdpdGggYW4gTlZESU1NCj4gRmlybXdhcmUgSW50ZXJmYWNlIFRhYmxl
IChORklUKS4gT24gRGV2aWNldHJlZSBiYXNlZCBwbGF0Zm9ybXMsIHRoaXMgCj4gY2FuIGJlCj4g
ZG9uZSB3aXRoIGEgcG1lbSBub2RlLiBbM10KPiAKPiBBZGQgYSBrZXJuZWwgY29uZmlnIGZyYWdt
ZW50IHRvIGFkZCBwbWVtIHN1cHBvcnQsIHdoaWNoIGVuYWJsZXMgbmV0d29yawo+IGJvb3Qgb24g
VUVGSSBwbGF0Zm9ybXMgd2l0aCBEZXZpY2V0cmVlLgo+IEFsc28sIGJyaWVmbHkgbWVudGlvbiB0
aGF0IHdlIHN1cHBvcnQgdGhpcyBzY2VuYXJpbyBpbiB0aGUgcmVhZG1lLgo+IAo+IFRoaXMgY2Fu
IGJlIHRlc3RlZCBvbiBRZW11LCB3aXRoIHRoZSBmb2xsb3dpbmcgcHJvY2VkdXJlOgo+IAo+IEJ1
aWxkIGFhcmNoNjRfZWZpX2RlZmNvbmZpZyBpbiBhIGZvbGRlciwgdG8gb2J0YWluIAo+IG91dHB1
dC9pbWFnZXMvZGlzay5pbWcsCj4gYW5kIHNlcnZlIHRoZSBpbWFnZSBvdmVyIEhUVFAgd2l0aCBw
eXRob246Cj4gCj4gICAkIHB5dGhvbiAtbSBodHRwLnNlcnZlciAtZCBvdXRwdXQvaW1hZ2VzLwo+
IAo+IEluIGFub3RoZXIgdGVybWluYWwgYW5kIGFub3RoZXIgZm9sZGVyLCBjb25maWd1cmUgYSBV
LUJvb3QgYmFzZWQgCj4gZmlybXdhcmUKPiBzdGFydGluZyBmcm9tIHFlbXVfYWFyY2g2NF9lYmJy
X2RlZmNvbmZpZywgYW5kIHdpdGggdGhlIGZvbGxvd2luZwo+IGFkZGl0aW9uYWwgY29uZmlndXJh
dGlvbnM6Cj4gCj4gICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI2
LjA0Igo+ICAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+IAo+IEFkZCB0aGUgZm9sbG93
aW5nIFUtQm9vdCBjb25maWd1cmF0aW9ucyB0bwo+IGJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL3Ut
Ym9vdC5mcmFnbWVudDoKPiAKPiAgIENPTkZJR19FRklfSFRUUF9CT09UPXkKPiAgIENPTkZJR19O
RVRfTFdJUD15CgpNYXliZSB0aG9zZSBjb25maWcgY2hhbmdlcyBpbiBxZW11X2FhcmNoNjRfZWJi
cl9kZWZjb25maWcgYW5kCmJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL3UtYm9vdC5mcmFnbWVudCB5
b3UgYXJlIG1lbnRpb25pbmcgaGVyZQpjb3VsZCBiZSBpbmNsdWRlZCBpbiBhIGZvbGxvd3VwIHVw
ZGF0ZSBvZiBxZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcuCldoYXQgZG8geW91IHRoaW5rPwoK
SWYgeW91IGRvIHNvLCB5b3UgY291bGQgcHJvYmFibHkgYWRkIGEgc21hbGwgc2VjdGlvbiBpbgpi
b2FyZC9xZW11L2FhcmNoNjQtZWJici9yZWFkbWUudHh0CnF1aWNrbHkgZGVzY3JpYmluZyB0aGlz
IG5ldyBjYXBhYmlsaXR5LCBzYW1lIGFzIHlvdSBkaWQgaGVyZS4KCj4gQnVpbGQgZXZlcnl0aGlu
ZzsgeW91IHNob3VsZCBvYnRhaW4gb3V0cHV0L2ltYWdlcy9mbGFzaC5iaW4uCj4gCj4gU3RhcnQg
UWVtdSBhcyBwZXIgYm9hcmQvcWVtdS9hYXJjaDY0LWViYnIvcmVhZG1lLnR4dCwgYnV0IG9taXR0
aW5nIHRoZSAKPiBoZDAKPiAtZGV2aWNlIGFuZCAtZHJpdmUgc3Rhbnphcy4KPiBVLUJvb3Qgc2hv
dWxkIHN0YXJ0OyBpbnRlcnJ1cHQgaXQgd2l0aCBlbnRlci4KPiAKPiBBdCBVLUJvb3QgcHJvbXB0
LCB0eXBlIHRoZSBmb2xsb3dpbmcgY29tbWFuZHM6Cj4gCj4gICA9PiBzZXRlbnYgbG9hZGFkZHIg
MHg0MzAwMDAwMAo+ICAgPT4gZWZpZGVidWcgYm9vdCBybSAwCgpXaGlsZSB0ZXN0aW5nLCB0aGlz
IGNvbW1lbnQgcmVwb3J0ZWQgYSBtZXNzYWdlIHRoYXQgbG9va2VkIGxpa2UgYW4gCmVycm9yOgoK
ICAgICA9PiBlZmlkZWJ1ZyBib290IHJtIDAKICAgICBDYW5ub3QgcGVyc2lzdCBFRkkgdmFyaWFi
bGVzIHdpdGhvdXQgc3lzdGVtIHBhcnRpdGlvbgogICAgIE1pc3NpbmcgVFBNdjIgZGV2aWNlIGZv
ciBFRklfVENHX1BST1RPQ09MCiAgICAgQ2Fubm90IHJlbW92ZSBCb290MDAwMAoKQnV0IHRoZSB3
aG9sZSBzZXF1ZW5jZSBzdWNjZXNzZnVsbHkgYm9vdGVkIHRoZSBhYXJjaDY0IGVmaSBpbWFnZS4K
CklzIHRoaXMgY29tbWFuZCByZWFsbHkgbmVlZGVkPwoKPiAgID0+IGVmaWRlYnVnIGJvb3QgYWRk
IC11IDAgbmV0IGh0dHA6Ly8xMC4wLjIuMjo4MDAwL2Rpc2suaW1nCj4gICA9PiBlZmlkZWJ1ZyBi
b290IG9yZGVyIDAKPiAgID0+IGJvb3RlZmkgYm9vdG1ncgo+IAo+IFUtQm9vdCBzaG91bGQgZG93
bmxvYWQgdGhlIGRpc2sgaW1hZ2Ugb3ZlciBIVFRQIGFuZCBib290IExpbnV4IHdpdGggCj4gVUVG
SS4KPiBMb29rIGZvciB0aGUgZm9sbG93aW5nIG1lc3NhZ2UgaW4gTGludXggYm9vdCBsb2csIHRv
IGNvbmZpcm0gdGhhdCBpdCAKPiBkaWQKPiBpbmRlZWQgbW91bnQgaXRzIHJvb3RmcyBmcm9tIHRo
ZSBkb3dubG9hZGVkIGltYWdlOgo+IAo+ICAgRVhUNC1mcyAocG1lbTBwMik6IG1vdW50ZWQgZmls
ZXN5c3RlbSAuLi4KPiAKPiBMaW5rOiAKPiBodHRwczovL3d3dy5saW5hcm8ub3JnL2Jsb2cvaW5z
dGFsbGluZy1mZWRvcmEtd2l0aC11ZWZpLWh0dHAtYm9vdC8gWzFdCj4gTGluazogCj4gaHR0cHM6
Ly9kb2NzLnUtYm9vdC1wcm9qZWN0Lm9yZy9lbi9sYXRlc3QvZGV2ZWxvcC91ZWZpL3VlZmkuaHRt
bCN1ZWZpLWh0dHAtYm9vdC11c2luZy10aGUtbGVnYWN5LXRjcC1zdGFjayAKPiBbMl0KPiBMaW5r
OiAKPiBodHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJlL2VkZ2UtaW90LWFyY2gtZ3VpZGUv
YmxvYi9tYWluL3NvdXJjZS9odHRwLWJvb3QvcG1lbV9ub2RlLm1kIAo+IFszXQo+IFNpZ25lZC1v
ZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogRGlj
ayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
