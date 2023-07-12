Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF00EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BADB7418BB;
	Wed, 12 Jul 2023 19:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADB7418BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cWDqq-HJflT; Wed, 12 Jul 2023 19:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5E741BA1;
	Wed, 12 Jul 2023 19:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D5E741BA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDD311BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B70A061274
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70A061274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FndW-t2VnbG for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA80606AA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EA80606AA
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:58:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e245:939f:c022:28d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CCF2B13F895;
 Wed, 12 Jul 2023 21:58:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 12 Jul 2023 21:58:29 +0200
Date: Wed, 12 Jul 2023 21:58:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230712195829.GJ188780@scaer>
References: <20230610181914.541374-1-james.hilliard1@gmail.com>
 <87wn0atuu1.fsf@tarshish>
 <CADvTj4o15zSrqaWixSWjLJKEdJ7E3uaV2yoGwUXE_Q8pwaNFQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4o15zSrqaWixSWjLJKEdJ7E3uaV2yoGwUXE_Q8pwaNFQQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689191913;
 bh=fD3BSMIBbPviLwrDG7UQG7NY/LHolauAe5lagkKotc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovZ/hOdWYE03SSmhz5G5vg9mgdw0Y3eW97tT+LUBra/61BHcEMNhGkKoLhmaqYL2o
 gJbHFPD9HYycKxcTPkkRq/gIz1zHe6oPjiTlv1ebngW271wWAUDJOYkcvO4HpgVJBB
 i3DbArlsbZxEPT49X1VOb2z2nbj5wQ/HSI7roTxryabSuUliEODS2EtSGS8nGyfx0B
 ilOLl4bWUwpmMZRdpbssHc6o3Pceg64jm6uCqI2sNy31+VvoRjfkt41t8y+dDPLUo/
 BEqz4QuOSDPqUjEw4Cv+TV8Jdqy8XOecA49jz9oF6tPS1zvF074VEfyhd0C20AEg/a
 Q1uF+Hxjh3NSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ovZ/hOdW
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: use bundled headers
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

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDYtMTEgMDA6MDIgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTYXQsIEp1biAxMCwgMjAyMyBhdCAxMTo0NuKAr1BNIEJhcnVjaCBT
aWFjaCA8YmFydWNoQHRrb3MuY28uaWw+IHdyb3RlOgo+ID4gT24gU2F0LCBKdW4gMTAgMjAyMywg
SmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPiA+IERldGFpbHM6IGh0dHBzOi8vZ2l0aHViLmNvbS9z
dHJhY2Uvc3RyYWNlL2lzc3Vlcy8yNTMKCkl0IGlzIG11Y2ggYmV0dGVyIHRvICphbHNvKiBwcm92
aWRlIGEgbGl0dGxlIHN1bW1hcnkgYWJvdXQgdGhlIGFjdHVhbAppc3N1ZSBhbmQgdGhlIHN1Z2dl
c3RlZCBmaXgsIHNvIHRoYXQ6CgogMS4gd2UgZG9uJ3QgaGF2ZSB0byBnbyBjaGFzaW5nIHRoYXQg
aW5mb3JtYXRpb24gd2hlbiByZXZpZXdpbmcgdGhlCiAgICBwYXRjaDsKCiAyLiB3ZSBhY3R1YWxs
eSBrZWVwIHRoYXQgaW5mb3JtYXRpb24gaW4gb3VyIHRyZWUsIGluIGNhc2UgdGhlIHJlbW90ZQog
ICAgVVJMIGRpc2FwZWFycyAodGhlcmUgaGF2ZSBhbHJlYWR5IGJlZW4gY2FzZXMgd2hlcmUgdGhl
IHJlcG8KICAgIG1haW50YWluZXIganVzdCBkZWxldGVkIGV2ZXJ5dGhpbmcpCgo+ID4gR2l0aHVi
IGlzc3VlICMyNTMgeW91IGxpbmtlZCB0byBtZW50aW9ucyAtLWVuYWJsZS1idW5kbGVkIGFzIGEK
PiA+IHdvcmthcm91bmQuIFNob3VsZG4ndCB3ZSBiYWNrcG9ydCB1cHN0cmVhbSBjb21taXQgOGY2
OTEyMDZlNGFhNzYKPiA+IGluc3RlYWQ/Cj4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJhY2Uv
c3RyYWNlL2NvbW1pdC84ZjY5MTIwNmU0YWE3NjljYzk5ZTI2NGYxYzE1YWU2OTU2Nzg5ZjkxCj4g
PiBCdXQgdGhlbiBhZ2FpbiBtYXliZSB3ZSBkbyB3YW50IHRvIGhhcmRjb2RlIC0tZW5hYmxlLWJ1
bmRsZWQgZm9yCj4gPiBjb25zaXN0ZW5jeT8KPiBTZWVtcyBidW5kbGVkIG1heSBiZSBsZXNzIGxp
a2VseSB0byBicmVhayBpbiB0aGUgZnV0dXJlLgoKVGhpcyBpcyBub3QgdmVyeSBhZmZpcm1hdGl2
ZS4KCkluZGVlZCwgZnJvbSB3aGF0IEkgdW5lcnN0b29kLCB0aGVyZSB3YXMgYW4gYWN0dWFsIGJ1
ZyBpbiBzdHJhY2Uncwpjb25maWd1cmUgc2NyaXB0LCBhbmQgdGhleSBmaXhlZCBpdCB3aXRoIHRo
ZSBjb21taXQgQmFydWNoIHBvaW50ZWQgdG8uCgpTbyB0aGUgbmF0dXJhbCBleHBlY3RhdGlvbiBp
cyB0aGF0IHdlIGRvIGJhY2twb3J0IHRoZSBmaXgsIHJhdGhlciB0aGFuCnBhcGVyIG92ZXIgdGhl
IGlzc3VlLgoKSG93ZXZlciwgaW4gdGhhdCBjYXNlLCBJIGJlbGlldmUgdGhhdCBpbmRlZWQsIHVz
aW5nIHRoZSBidW5kbGVkIGhlYWRlcnMKaXMgdGhlIGJldHRlciBzb2x1dGlvbiwgYnV0IGZvciBh
IHRvdGFsbHkgZGlmZmVyZW50IHJlYXNvbi4gSW5kZWVkLApzdHJhY2UgbmVlZHMgdGhlIGhlYWRl
cnMgb2YgdGhlIHJ1bm5pbmcga2VybmVsLCBub3QgdGhvc2UgdGhhdCB3ZXJlIHVzZWQKdG8gYnVp
bGQgdGhlIHRvb2xjaGFpbi4gVGhlIHJ1bm5pbmcga2VybmVsIGlzIG9mdGVuIG1vcmUgcmVjZW50
IHRoYW4KdGhlIG9uZSB1c2VkIGluIHRoZSB0b29sY2hhaW4sIHNvIHdlIGRvIHdhbnQgdGhlIG1v
c3QgdXAtdG8tZGF0ZQpoZWFkZXJzLgoKU28sIHdlIHdhbnQgdG8gdXNlIHN0cmFjZSBidW5kbGVk
IGhlYWRlcnMgZm9yIHRoaXMgcmVhc29uOiB0byBoYXZlIHRoZQptb3N0IHVwLXRvLWRhdGUgaGVh
ZGVycy4KClNvLCBjb3VsZCB5b3UgcGxlYXNlIG1hc2ggdGhpcyB1cCB0aW50byBhIHByb3BlciBj
b21taXQgbG9nIGFuZCByZXNwaW4sCnBsZWFzZT8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBwYWNrYWdlL3N0cmFjZS9zdHJhY2UubWsgfCAy
ICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyYWNlL3N0cmFjZS5tayBiL3BhY2th
Z2Uvc3RyYWNlL3N0cmFjZS5tawo+ID4gPiBpbmRleCA2NTE0YmZlMzU0Li45ZjZiMzMzMzE4IDEw
MDY0NAo+ID4gPiAtLS0gYS9wYWNrYWdlL3N0cmFjZS9zdHJhY2UubWsKPiA+ID4gKysrIGIvcGFj
a2FnZS9zdHJhY2Uvc3RyYWNlLm1rCj4gPiA+IEBAIC0xMCw3ICsxMCw3IEBAIFNUUkFDRV9TSVRF
ID0gaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvcmVsZWFzZXMvZG93bmxvYWQvdiQo
U1RSQUNFX1ZFUlNJCj4gPiA+ICBTVFJBQ0VfTElDRU5TRSA9IExHUEwtMi4xKwo+ID4gPiAgU1RS
QUNFX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIExHUEwtMi4xLW9yLWxhdGVyCj4gPiA+ICBTVFJB
Q0VfQ1BFX0lEX1ZFTkRPUiA9IHN0cmFjZV9wcm9qZWN0Cj4gPiA+IC1TVFJBQ0VfQ09ORl9PUFRT
ID0gLS1lbmFibGUtbXBlcnM9bm8KPiA+ID4gK1NUUkFDRV9DT05GX09QVFMgPSAtLWVuYWJsZS1i
dW5kbGVkPXllcyAtLWVuYWJsZS1tcGVycz1ubwo+ID4gPgo+ID4gPiAgaWZlcSAoJChCUjJfUEFD
S0FHRV9MSUJVTldJTkQpLHkpCj4gPiA+ICBTVFJBQ0VfREVQRU5ERU5DSUVTICs9IGxpYnVud2lu
ZAo+ID4KPiA+Cj4gPiAtLQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB+LiAufiAgIFRrIE9wZW4gU3lzdGVtcwo+ID4gPX0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0t
LS0tLXs9Cj4gPiAgICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2
LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
