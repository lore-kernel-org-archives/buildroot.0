Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1AAC369D5
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D6260BBC;
	Wed, 23 Apr 2025 20:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20fv-GqwRAZG; Wed, 23 Apr 2025 20:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4457607E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4457607E4;
	Wed, 23 Apr 2025 20:38:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72E9C19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 20:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 583264121E
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 20:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IVyS_1IdslP for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 20:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1968D411FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1968D411FE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1968D411FE
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 20:38:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D6C4439E8;
 Wed, 23 Apr 2025 20:38:24 +0000 (UTC)
Date: Wed, 23 Apr 2025 22:38:22 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20250423223822.6bc7ae4e@windsurf>
In-Reply-To: <20250423131933.834900-3-raphael.melotte@mind.be>
References: <20250423131933.834900-1-raphael.melotte@mind.be>
 <20250423131933.834900-3-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueetjeejveetheekvdfhheetjedvueeuueeiheeuvedvkeehuefhvddtteetuedvnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgur
 dgsvgdprhgtphhtthhopehmrghrtghushdrfhholhhkvghsshhonhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohdrtghomhhprghgnhhutggtihesghhmrghilhdrtghomhdprhgtphhtthhopehkihgvrhgrnhdrsghinhhghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnsegrphgvrhhtuhhrvgdruhhspdhrtghpthhtohepthhirghnhihurghnhhgrohefseduieefrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745440705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNze5wE8fDQzhIs1NzYJtD/nh93ABm1rtMzZvg/oT6I=;
 b=o5kzrxRIKSBgRSkaYHk0OEbRrXQD4MjmKAIotzRAeee8VBNF910fZl1cT0WeE0jBWEGmGa
 VfALBnVZuhWyhDqWBSS22XdFfYpLvK3DRAMZlCoGQIA3czgaIH6F6cdga7PpHs1boO9tjs
 gNo82LL62o4ICeIOQRJDwDd7eMYWK+mnRSI+nB3nsKM+Dpv9+oHPahwSx5p6hcmHDxtxUJ
 RXnRMqMlEh6Et/S13Jx7LY1Okyn+26EjGJWlz8GdQEr/Sf9ciryDA4egKdKlKKP6y4QuKT
 E3dfpZChpPv2Rbzz9v6DJFkKTEYtboUBvMMi2kNKoq+gwoKNEaG3Dxv0jeRKaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o5kzrxRI
Subject: Re: [Buildroot] [RFC PATCH 2/2] package: add *_VERSION_PREFIX to
 packages using prefix 'v'
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, TIAN Yuanhao <tianyuanhao3@163.com>,
 Romain Naour <romain.naour@gmail.com>, Chris Packham <judge.packham@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgorWWFubiwgQXJub3V0IGluIENjLgoKT24gV2VkLCAyMyBBcHIgMjAy
NSAxNToxOTozMCArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FhcmR2YXJr
LWRucy9hYXJkdmFyay1kbnMubWsgYi9wYWNrYWdlL2FhcmR2YXJrLWRucy9hYXJkdmFyay1kbnMu
bWsKPiBpbmRleCBhMmU3NGE3MmJmLi4wMmZkZmFjYjg0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
YWFyZHZhcmstZG5zL2FhcmR2YXJrLWRucy5tawo+ICsrKyBiL3BhY2thZ2UvYWFyZHZhcmstZG5z
L2FhcmR2YXJrLWRucy5tawo+IEBAIC02LDYgKzYsNyBAQAo+ICAKPiAgIyBXaGVuIHVwZGF0aW5n
IHRoZSB2ZXJzaW9uIGhlcmUsIGFsc28gdXBkYXRlIG5ldGF2YXJrIGluIGxvY2tzdGVwCj4gIEFB
UkRWQVJLX0ROU19WRVJTSU9OID0gdjEuMTQuMAo+ICtBQVJEVkFSS19ETlNfVkVSU0lPTl9QUkVG
SVggPSB2CgpUaGFua3MgZm9yIHRoaXMgcHJvcG9zZWQgY2hhbmdlLiBXZSBrbm93IHRoaXMgaGFz
IGJlZW4gYW4gaXNzdWUgZm9yCnF1aXRlIHNvbWUgdGltZSwgYnV0IEknbSBub3Qgc3VyZSB5b3Vy
IHByb3Bvc2VkIHNvbHV0aW9uIGlzIHRoZSBvbmUgd2UKd2FudCAoaWRlYWxseSwgb2YgY291cnNl
KS4KCkluZGVlZCwgdGhlcmUgaXMgYWxyZWFkeSBhIDxwa2c+X0RMX1ZFUlNJT04gdmFyaWFibGUg
ZGVmaW5lZCBieSB0aGUKcGFja2FnZSBpbmZyYXN0cnVjdHVyZSwgd2hpY2ggd2UgaWRlYWxseSB3
b3VsZCBsaWtlIHRvIGxldmVyYWdlLCBzbwp0aGF0IHdlIGNvdWxkIHdyaXRlOgoKPGZvbz5fVkVS
U0lPTiA9IDEuMTQuMAo8Zm9vPl9ETF9WRVJTSU9OID0gdiQoPGZvbz5fVkVSU0lPTikKCkFuZCBv
ZiBjb3Vyc2UsIHdoZW4gPGZvbz5fRExfVkVSU0lPTiBpcyB1bmRlZmluZWQsIHRoZSBpbmZyYSBh
c3N1bWVzCnRoYXQgaXRzIHZhbHVlIGlzIHRoZSBvbmUgb2YgPGZvbz5fVkVSU0lPTi4KCkkgdHJp
ZWQgaW1wbGVtZW50aW5nIHRoaXMgYSBsb25nIHRpbWUgYWdvOgoKICBodHRwczovL2dpdGxhYi5j
b20vdHBldGF6em9uaS9idWlsZHJvb3QvLS9jb21taXQvYTBiNzAwZmIwOGNhODRiMzczMjQ3ZjNh
NTI3NTVmZDRlODk5N2QyMgoKQW5kIEkgd3JvdGUgc29tZSB0ZXN0cyB0byB2ZXJpZnkgdGhlIGNv
cnJlY3QgYmVoYXZpb3I6CgogIGh0dHBzOi8vZ2l0bGFiLmNvbS90cGV0YXp6b25pL2J1aWxkcm9v
dC8tL2NvbW1pdC8zZTMyZmViNjQxMzVkNWU0MzQ3ZjJhMThlMTY0ODM5OGVmYzFhNmIxCgpidXQg
bm8gbWF0dGVyIHdoYXQgSSB0cmllZCwgSSBjb3VsZG4ndCBmaW5kIGEgc29sdXRpb24gdGhhdCB3
YXMgcGFzc2luZwphbGwgdGVzdHMuCgpJIHJlbWVtYmVyIHdlIGRpc2N1c3NlZCB3aXRoIHdpdGgg
WWFubiBhbmQvb3IgQXJub3V0IHF1aXRlIHNvbWUgdGltZQphZ28sIGFuZCBJIGJlbGlldmUgd2Ug
cmVhY2hlZCBzb21lIGNvbmNsdXNpb24gb24gaG93IGl0IHNob3VsZCBiZQppbXBsZW1lbnRlZCwg
YnV0IG9mIGNvdXJzZSBJIGZvcmdvdCB3aGF0IHRoaXMgY29uY2x1c2lvbiB3YXMuIE1heWJlCllh
bm4gYW5kL29yIEFybm91dCB3aWxsIGhhdmUgYSBiZXR0ZXIgbWVtb3J5IHRoYW4gSSBkbz8KCkJl
c3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
