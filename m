Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC249CAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 20:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F54260087;
	Mon, 22 Sep 2025 20:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWHsnZ0NRgFs; Mon, 22 Sep 2025 20:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A652A600B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A652A600B6;
	Mon, 22 Sep 2025 20:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57AB7498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54DBC600B6
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05BXwtxRq9k9 for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 20:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A30D60067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A30D60067
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A30D60067
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:07:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 899BE780375;
 Mon, 22 Sep 2025 22:06:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 22:06:55 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 22:06:55 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <DCZE1NNPYVQP.VA152ACRNNYT@bootlin.com>
References: <20250921-fix_doc_dead_link-v1-1-4f39903e93c7@bootlin.com>
 <87wm5sosjs.fsf@tarshish> <DCZE1NNPYVQP.VA152ACRNNYT@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <84848ccb6383f38eff8fcdf17ac292ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758571619;
 bh=Ht+V2+Gh7uN7I3vJsiez15o3o9Fep0U9/xkxb3hkvhw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t9M5kA3eRwPIG1KHwFzal613nIheGWOO7PddPzdwHVTFbFUv1xQ+xfU710seejtjv
 DOG/r1O+yIrU0w0eIL3daOWuQzis5pZ3Ncf0yS1GXH8XFbDW9W3EBovUduuThu+1Ym
 7Rhifk9UtI2qLQo6hs16TQq+yhZtMhOF1mIOHX9Sv3H0kV0sBqRmvE6DStxYycaGgN
 8kqK/m4tts0PHyfVKVa8sYV4EClQ2BTF+56tf0FT/xX4J2N8vgRw8SlIDeuuJLZxMq
 r8Op4y9z0igd6vchBcLLhpGeExd359kYNU+Y67IRbFSkFbgKtWboUuEW7OvYuqZ7zz
 Y5tDgKgN/EkGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t9M5kA3e
Subject: Re: [Buildroot] [PATCH] docs/manual/getting: fix dead link
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9_via_b?= =?UTF-8?Q?uildroot?=
 <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGlzLCBCYXJ1Y2gsIEFsbCwKCk9uIDIyLzA5LzIwMjUgMTY6MTEsIEFsZXhpcyBMb3Ro
b3LDqSB2aWEgYnVpbGRyb290IHdyb3RlOgo+IEhpIEJhcnVjaCwKPiAKPiBPbiBTdW4gU2VwIDIx
LCAyMDI1IGF0IDM6MTUgUE0gQ0VTVCwgQmFydWNoIFNpYWNoIHdyb3RlOgo+PiBIaSBBbGV4aXMs
Cj4+IAo+PiBPbiBTdW4sIFNlcCAyMSAyMDI1LCBBbGV4aXMgTG90aG9yw6kgdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPiAKPiBbLi4uXQo+IAo+Pj4gIElmIHlvdSB3YW50IHRvIGZvbGxvdyBkZXZlbG9w
bWVudCwgeW91IGNhbiB1c2UgdGhlIGRhaWx5IHNuYXBzaG90cyAKPj4+IG9yCj4+PiAgbWFrZSBh
IGNsb25lIG9mIHRoZSBHaXQgcmVwb3NpdG9yeS4gUmVmZXIgdG8gdGhlCj4+PiAtaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRbRG93bmxvYWQgcGFnZV0gb2YgdGhlIEJ1aWxkcm9vdCAKPj4+
IHdlYnNpdGUKPj4+ICtodHRwOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZC5odG1sW0Rvd25sb2Fk
IHBhZ2VdIG9mIHRoZSBCdWlsZHJvb3QgCj4+PiB3ZWJzaXRlCj4+IAo+PiBNYXliZSBzd2l0Y2gg
dG8gaHR0cHMgd2hpbGUgYXQgaXQ/IFRoaXMgbGluayByZWRpcmVjdHMgdGhlcmUgYW55d2F5Lgo+
IAo+IFN1cmUuIEJ1dCBpbiB0aGlzIGNhc2UsIEkgZ3Vlc3MgaXQgZG9lcyBub3QgbWFrZSBzZW5z
ZSB0byBkbyBpdCBvbmx5IAo+IGZvcgo+IHRoaXMgbGluaywgYW5kIGl0IHNob3VsZCBiZSBkb25l
IGZvciBhbnkgbGluayBwb2ludGluZyB0byAKPiBidWlsZHJvb3Qub3JnOgo+IAo+ICQgZ3JlcCAt
cmkgImh0dHA6Ly8uKmJ1aWxkcm9vdC5vcmciIH4vc3JjL2J1aWxkcm9vdC9kb2NzL21hbnVhbAo+
IC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290L2RvY3MvbWFudWFsL2NvbnRyaWJ1dGUuYWRvYzpB
bGwgYnVpbGQgCj4gcmVzdWx0cyBhcmUgYXZhaWxhYmxlIGF0IGh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZ1tdLAo+IC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290L2RvY3MvbWFudWFsL2Nv
bnRyaWJ1dGUuYWRvYzpzdGF0aXN0aWNzIGFyZSAKPiBhdCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvc3RhdHMucGhwW10uIEV2ZXJ5IGRheSwKPiAvaG9tZS9hbGV4aXMvc3JjL2J1aWxk
cm9vdC9kb2NzL21hbnVhbC9jb250cmlidXRlLmFkb2M6ICAgIAo+IGh0dHA6Ly9naXQuYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QtdGVzdC90cmVlL3V0aWxzL2JyLXJlcHJvZHVjZS1idWlsZFtici1y
ZXByb2R1Y2UtYnVpbGRdCj4gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwv
Y29udHJpYnV0ZS5hZG9jOkZpeGVzOiAKPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy81MTAwMGE5ZDQ2NTZhZmU5ZTBlYTZmMDdiOWY4ZWQzNzRjMmU0MDY5Cj4gL2hvbWUv
YWxleGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwvcmVzb3VyY2VzLmFkb2M6aHR0cDovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3RbbWFpbGluZyAKPiBs
aXN0IGluZm8KPiAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdC9kb2NzL21hbnVhbC9yZXNvdXJj
ZXMuYWRvYzpodHRwOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290W01h
aWxtYW5dIAo+IG9yIGF0Cj4gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwv
Z2V0dGluZy5hZG9jOlJlbGVhc2UgdGFyYmFsbHMgCj4gYXJlIGF2YWlsYWJsZSBhdCBodHRwOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvW10uCj4gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3Qv
ZG9jcy9tYW51YWwvZ2V0dGluZy5hZG9jOmh0dHA6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2FkLmh0
bWxbRG93bmxvYWQgCj4gcGFnZV0gb2YgdGhlIEJ1aWxkcm9vdCB3ZWJzaXRlCj4gL2hvbWUvYWxl
eGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwvbWFudWFsLmFkb2M6aHR0cDovL2dpdC5idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC90cmVlL0NPUFlJTkc/aWQ9e3N5czpnaXQgCj4gcmV2LXBhcnNl
IEhFQUR9W0NPUFlJTkddCj4gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwv
YWRkaW5nLXBhY2thZ2VzLXRpcHMuYWRvYzpCdWlsZHJvb3QgCj4gcnVucyBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvW2F1dG9idWlsZGVyc10gd2hpY2gKPiAKPiBJZiBtYWludGFpbmVy
cyBhcmUgZmluZSB3aXRoIHRoYXQsIEkgY2FuIGFkZCBhIGRlZGljYXRlZCBjb21taXQgaW4gYSAK
PiB2Mi4KCkkgYXBwbGllZCB0aGlzIHBhdGNoIG9uIG1hc3RlciwgdG8gZml4IHRoaXMgYnJva2Vu
IGxpbmsuCgpCdXQgSSBhZ3JlZSB3ZSBjb3VsZCBtb3ZlIGFsbCBodHRwOi8vYnVpbGRyb290Lm9y
ZyBsaW5rcyB0byBodHRwcy4gQ291bGQKeW91IHNlbmQgYSBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhh
dCBwbGVhc2U/CgpGb3IgYW5vdGhlciBkb2N1bWVudGF0aW9uIHVybCBjbGVhbnVwLCBJJ20gYWxz
byBzdWdnZXN0aW5nIHRvIHVwZGF0ZSBhbGwKZ2l0LmJ1aWxkcm9vdC5vcmcgbGlua3MgdG8gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcKCj4gCj4gVGhhbmtzLAo+IAo+IEFsZXhpcwo+
IAo+IAo+IC0tCj4gQWxleGlzIExvdGhvcsOpLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCkJlc3QgcmVnYXJkcywK
Ckp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
