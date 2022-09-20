Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6688C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876EF40C63;
	Tue, 20 Sep 2022 19:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876EF40C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRG5EN63WlWP; Tue, 20 Sep 2022 19:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A27D940C8C;
	Tue, 20 Sep 2022 19:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A27D940C8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15E661BF616
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5B6982864
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B6982864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JaKUT29CDhSX for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:20:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F608284B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0F608284B
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 19:20:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b795:8a2b:1e98:bedc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 33ED15FFA9;
 Tue, 20 Sep 2022 21:20:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 21:20:16 +0200
Date: Tue, 20 Sep 2022 21:20:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220920192016.GQ1419013@scaer>
References: <20220920190308.3688668-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920190308.3688668-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663701619;
 bh=sqSvAOBoIdtnPcfrD8qIlA4l3k3TaMN9cowTbIDfdEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H76tNY6qTXiFcFJ+3M8DuKbm3sti9pqoG/p9cpmou8jgMg6MfKU0Zpsh9T3Al1r3H
 aAMFBXO5xbM46+3gSg6F4fTkIs5B3NRTN1COGQvL2YwOYz8eEyTypLG17apVlKC8Ds
 uqdnQJ+jxAGmWe1FuxBLoeTdp2hn/KLXDARkl0FJn/FrOf2wlHBsQumVNRm0qUMZ/8
 JHtItXFQKG7AT9K192Cntu1WnBb6PwWXHyX8dagjc7HKdsDaQH30YFLm3Cv1LMHPMe
 RYJqtceJxz6zhvwI8I+dd0vvKlL/1fAo63+uDb79hdEbey1Ze0rGObRZYKOpS+sh+s
 dSQ4pgTIbWwoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H76tNY6q
Subject: Re: [Buildroot] [PATCH] package/chrony: bump to version 4.3
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA5LTIwIDIxOjAzICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClNvbWVvbmUg
cmVjZW50bHkgc3VibWl0dGVkIGEgcGF0Y2ggdG8gZml4IG91ciBncHNkIGludGVncmF0aW9uIHdp
dGgKY2hyb255OgogICAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC84Nzg1XzE2NjM2Nzc5MDVfNjMyOUI1RDFfODc4NV8xNV8xX2I3Y2VkMTNjOWEy
NjUxZmJmMzZkNDAwOWEwM2MwNTkwNDU3YzgyYTMuMTY2MzY3NzUwNC5naXQueWFubi5tb3JpbkBv
cmFuZ2UuY29tLwoKUHJlc3VtYWJseSwgc2luY2UgeW91IHVwZGF0ZWQgY2hyb255LCB0aGF0J3Mg
YmVjYXVzZSB5b3UgdXNlIGl0LiBEbyB5b3UKa25vdyB3aGF0IGl0IHdvdWxkIHRha2UgdG8gc3dp
dGNoIG92ZXIgdG8gdXNpbmcgdGhlIGNocm9ueSB1cHN0cmVhbQpzeXN0ZW1kIHVuaXQsIHJhdGhl
ciB0aGFuIG91cnM/CgpDb3VsZCB5b3UgaGF2ZSBhIGxvb2ssIHBsZWFzZT8KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2Nocm9ueS9jaHJvbnkuaGFzaCB8IDQgKyst
LQo+ICBwYWNrYWdlL2Nocm9ueS9jaHJvbnkubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvY2hyb255L2Nocm9ueS5oYXNoIGIvcGFja2FnZS9jaHJvbnkvY2hyb255Lmhhc2gKPiBpbmRl
eCA3ZmE2N2JmMDQuLjljMGUxMTc1NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Nocm9ueS9jaHJv
bnkuaGFzaAo+ICsrKyBiL3BhY2thZ2UvY2hyb255L2Nocm9ueS5oYXNoCj4gQEAgLTEsNSArMSw1
IEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNraW5nIHBncCBzaWduYXR1cmUK
PiAtIyBodHRwczovL2Rvd25sb2FkLnR1eGZhbWlseS5vcmcvY2hyb255L2Nocm9ueS00LjItdGFy
LWd6LWFzYy50eHQKPiAtc2hhMjU2ICAyNzNmOWZkMTVjMzI4ZWQ2ZjNhNWY2YmE2YmFlYzM1YTQy
MWEzNGE3M2JiNzI1NjA1MzI5YjE3MTIwNDhkYjlhICBjaHJvbnktNC4yLnRhci5nego+ICsjIGh0
dHBzOi8vZG93bmxvYWQudHV4ZmFtaWx5Lm9yZy9jaHJvbnkvY2hyb255LTQuMy10YXItZ3otYXNj
LnR4dAo+ICtzaGEyNTYgIDlkMGRhODg5YTg2NWYwODlhNWEyMTYxMGZmYjY3MTNlM2M5NDM4Y2Uz
MDNhNjNiNDljMmZiNmVhZmY1Yjg4MDQgIGNocm9ueS00LjMudGFyLmd6Cj4gICMgTG9jYWxseSBj
YWxjdWxhdGVkCj4gIHNoYTI1NiAgYWIxNWZkNTI2YmQ4ZGQxOGE5ZTc3ZWJjMTM5NjU2YmY0ZDMz
ZTk3ZmM3MjM4Y2QxMWJmNjBlMmI5Yjg2NjZjNiAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2Nocm9ueS9jaHJvbnkubWsgYi9wYWNrYWdlL2Nocm9ueS9jaHJvbnkubWsKPiBpbmRleCAx
NWIyMDBhZWYuLjM3OWU5NWE3NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Nocm9ueS9jaHJvbnku
bWsKPiArKysgYi9wYWNrYWdlL2Nocm9ueS9jaHJvbnkubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAg
Iwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtQ0hST05ZX1ZFUlNJT04gPSA0LjIK
PiArQ0hST05ZX1ZFUlNJT04gPSA0LjMKPiAgQ0hST05ZX1NJVEUgPSBodHRwOi8vZG93bmxvYWQu
dHV4ZmFtaWx5Lm9yZy9jaHJvbnkKPiAgQ0hST05ZX0xJQ0VOU0UgPSBHUEwtMi4wCj4gIENIUk9O
WV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19f
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
