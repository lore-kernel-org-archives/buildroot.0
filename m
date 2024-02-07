Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B3CC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 22:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0062441B95;
	Wed,  7 Feb 2024 22:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vw2RuqNr4IhJ; Wed,  7 Feb 2024 22:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9494032A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF9494032A;
	Wed,  7 Feb 2024 22:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0041BF82C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 22:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23CD24025A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 22:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 885fnVAOa0VI for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 22:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29CC2401BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CC2401BC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29CC2401BC
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 22:55:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DFC8678035B;
 Wed,  7 Feb 2024 23:55:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40968])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 Feb 2024 23:55:24 +0100
MIME-Version: 1.0
Date: Wed, 07 Feb 2024 23:55:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <0d0380e0-e56c-4b0a-bdfa-4a6253124b0b@smile.fr>
References: <20221216221934.465323-1-ju.o@free.fr>
 <0d0380e0-e56c-4b0a-bdfa-4a6253124b0b@smile.fr>
User-Agent: Webmail Free/1.6.5
Message-ID: <7111666ff232bb1c937f292eb04a01fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707346526;
 bh=uBpqcgbNGHnHkK7uuYs1imIMEGwLDUC1UyJdmmRb14w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J2Xjds0sQKo7lJo6Fi9Yiy8u4cLijSOHnaSnhOGDvmdcaFEczNxRSOEYzMKrBQfCL
 FgL/5PjfAXhbbIktfobBXGs6ZIPhZtzHpbMcWDJikpR18ozeIG/0O9ZA50BGeft00J
 Y0vCANL4q24fL1RaaoDOjYPEQEADKN8/letisD3NkYmnlfFliX3CNyyTQRV8FMANx6
 dbQRe0G8czLMessdLl21qkVjs3OLZPhUTYfTit8IjdusB4SmrDn8z8sD3uQeMceASf
 J8CwjmKA11IOvTG4+1sNJHk3Sqz91OQb8HSnk99gO3TuZGg2iPGmO4AxtxHkpbslDV
 harN7UsRtFcDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J2Xjds0s
Subject: Re: [Buildroot] [PATCH 1/1] package/swipl: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gMDcvMDIvMjAyNCAxMjo0OSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhl
bGxvIEp1bGllbiwKPiAKPiBMZSAxNi8xMi8yMDIyIMOgIDIzOjE5LCBKdWxpZW4gT2xpdmFpbiBh
IMOpY3JpdMKgOgo+PiBTV0ktUHJvbG9nIG9mZmVycyBhIGNvbXByZWhlbnNpdmUgZnJlZSBQcm9s
b2cgZW52aXJvbm1lbnQuIFNpbmNlIGl0cwo+PiBzdGFydCBpbiAxOTg3LCBTV0ktUHJvbG9nIGRl
dmVsb3BtZW50IGhhcyBiZWVuIGRyaXZlbiBieSB0aGUgbmVlZHMgb2YKPj4gcmVhbCB3b3JsZCBh
cHBsaWNhdGlvbnMuIFNXSS1Qcm9sb2cgaXMgd2lkZWx5IHVzZWQgaW4gcmVzZWFyY2ggYW5kCj4+
IGVkdWNhdGlvbiBhcyB3ZWxsIGFzIGNvbW1lcmNpYWwgYXBwbGljYXRpb25zLgo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KClsuLi5dCgo+PiArY2xh
c3MgVGVzdFNXSVBMKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4+ICsgICAgIyBOZWVkIHRvIHVz
ZSBhIGRpZmZlcmVudCB0b29sY2hhaW4gdGhhbiB0aGUgZGVmYXVsdCBkdWUgdG8KPj4gKyAgICAj
IHN3aXBsIHJlcXVpcmluZyBmZW52Lmggbm90IHByb3ZpZGVkIGJ5IHVjbGliYy4KPiAKPiBUaGlz
IG5vdCB0cnVlIGFueW1vcmUsIHRoZSBCdWlsZHJvb3QgdGVzdGluZyBpbmZyYXN0cnVjdHVyZSBz
d2l0Y2hlZCAKPiBmcm9tIHVDbGliYwo+IHRvIEdsaWJjIHNvbWV3aGVyZSBiZXR3ZWVuIDIwMjIg
YW5kIDIwMjQgOikKPiAKPiBIb3BlZnVsbHkgdGhlIHJ1bnRpbWUgdGVzdCBzdGlsbCBwYXNzIG9u
IHRoZSBjdXJyZW50IEJ1aWxkcm9vdCBtYXN0ZXI6Cj4gCj4gLi9zdXBwb3J0L3Rlc3RpbmcvcnVu
LXRlc3RzIC1rIC1kIGRsLyAtbyB0ZXN0c3VpdGUtbWFzdGVyCj4gdGVzdHMucGFja2FnZS50ZXN0
X3N3aXBsLlRlc3RTV0lQTAo+IDEyOjMzOjA4IFRlc3RTV0lQTCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgU3RhcnRpbmcKPiAxMjozMzowOSBUZXN0U1dJUEwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEJ1aWxkaW5nCj4gMTI6MzU6NDkgVGVzdFNXSVBMICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBCdWlsZGluZyBkb25lCj4gMTI6MzY6MDIgVGVzdFNXSVBMICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDbGVhbmluZyB1cAo+IC4KPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gUmFuIDEgdGVzdCBpbiAxNzMuNDUxcwo+IAo+IFRoZSBjb21wbGV4aXR5IG9mIHRoZSBh
cmNoaXRlY3R1cmUgZGVwZW5kZW5jeSBhbmQgdGhlIGJ1aWxkc3lzdGVtIG1ha2UgCj4gaXQKPiBk
aWZmaWN1bHQgdG8gcmV2aWV3IGluIGRldGFpbHMuCj4gCj4gV2l0aG91dCBnb2luZyBpbnRvIHRo
ZSBkZXRhaWxzLCBpdCBzZWVtcyBvayBmb3IgbWUuCj4gCj4gT2J2aW91c2x5LCB0aGUgREVWRUxP
UEVSUyBmaWxlIGNvbmZsaWN0IG5vd2FkYXlzIHNpbmNlIHNldmVyYWwgZW50cmllcyAKPiBoYXMg
YmVlbgo+IGFkZGVkIHNpbmNlIHRoZW4uCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuIEkgc2VudCBh
IHYyIHRvIHJlZnJlc2ggdGhpcyBvbGQgcGF0Y2guIFNlZToKaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIwNzIyNTEwMC4xMzIwODM3LTEt
anUub0BmcmVlLmZyLwoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCgpCZXN0IHJlZ2Fy
ZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
