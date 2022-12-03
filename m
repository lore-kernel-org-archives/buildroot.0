Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED6EC352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 13:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCC0415DA;
	Sat,  3 Dec 2022 13:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FCC0415DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3oq9fvl1RRX; Sat,  3 Dec 2022 13:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED018416C5;
	Sat,  3 Dec 2022 13:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED018416C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E70F91BF2AA
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 13:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C062D416C5
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 13:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C062D416C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ymojjeDC-Mr for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 13:30:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C05F7415DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C05F7415DA
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 13:30:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ba:9ce3:3496:4e04])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 779CCB00539;
 Sat,  3 Dec 2022 14:29:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 03 Dec 2022 14:29:56 +0100
Date: Sat, 3 Dec 2022 14:29:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: PGE <pge@ik.me>
Message-ID: <20221203132956.GC3302@scaer>
References: <20221122212002.139494-1-pge@ik.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122212002.139494-1-pge@ik.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670074199;
 bh=HHS6m5KYLz0GDn1Kz36nLG1Plsipwp722jj/LSIdHD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmN5OM0a//609otsMGAeuly4+DqnqSbpNHOoexjYEa3tT5iVwwdD7S6nC79LtFY9B
 OrdBfl50hYN65NLlTACPwIv/SFkb6DD0seR6biaPeNCutQUN0eVdIiMxG4mjx6dOhj
 h9RphmnlsOEL4R4IPYFPFB3/QdY3M4+CVQnd94/c2fvrWXnHGRHvkkQNJ7sfCYvPxt
 215Ah/9s2o5REeW3/bLO824uX6G7TPO/JVdUmRDZC7z9S7uD26R9VJHvpJyI7upuag
 IwMxQmmUgpdYYC94zrZKHHvJUP6ATg76hFrubVsSLSjA/qAfQ/FLWxFrh3c1VcEAYX
 qHRZXEtySKYWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VmN5OM0a
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: enable pkg specific go
 env also for download step
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

UEdFLCBBbGwsCgpXZSByZXF1aXJlIHRoYXQgc3VibWl0dGVycyB1c2UgdGhlaXIgcmVhbCBpZGVu
dGl0eTsgaW5pdGlhbHMgYXJlIG5vdAplbm91Z2guCgpPbiAyMDIyLTExLTIyIDIyOjIwICswMTAw
LCBQR0UgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gQ3VycmVudGx5IHBhY2thZ2Ugc2Vj
aWZpYyBnbyBlbnYgaXMgdXNlZCBvbmx5IGR1cmluZyBwYWNrYWdlIGJ1aWxkIHN0ZXAuCj4gCj4g
R28gdmVuZGVyaW5nIGlzIGRvbmUgZHVyaW5nIHRoZSBkb3dubG9hZCBzdGVwIGFuZCBpdCdzIHNv
bWV0aW1lcyByZXF1aXJlZAo+IHRvIHNwZWNpZnkgcGFja2FnZSBzZWNpZmljIGdvIGVudiBhbHNv
IGZvciB0aGlzIHN0ZXAuCj4gCj4gRm9yIGV4YW1wbGUsIHdoZW4gaW1wb3J0aW5nIGN1c3RvbSBn
byBtb2R1bGVzIHdobyBhcmUgaG9zdGVkIG9uIGEgcHJpdmF0ZQo+IGhvc3QsIGl04oCZcyByZXF1
aXJlZCB0byBzZXQgR09QUklWQVRFIHRvIGF2b2lkIHB1YmxpYyBzdW0gY2hlY2tpbmcuCgpJIGFt
IG5vdCBzdXJlIEkgZnVsbHkgdW5kZXJzdGFuZCB3aGF0ICJzZXQgR09QUklWQVRFIHRvIGF2b2lk
IHB1YmxpYyBzdW0KY2hlY2tpbmciIGlzIHN1cHBvc2VkIHRvIG1lYW4uCgpEb2VzIHRoYXQgbWVh
biB0aGF0IHNldHRpbmcgR09QUklWQVRFICh0byB3aGF0IHZhbHVlOiBib29sZWFuPyBsaXN0IG9m
Cm1vZHVsZXM/IHNvbWV0aGluZyBlbHNlPykgd291bGQgcHJldmVudCBnbyAodGhlIHByb2dyYW0p
IGZyb20gcGVyZm9ybWluZwpjaGVja3N1bSB2ZXJpZmljYXRpb24gb24gdGhlIG1vZHVsZXMgaXQg
ZG93bmxvYWRzPwoKQXMgYSBjb25zZXF1ZW5jZSwgd2hhdCBpbXBhY3QgZG9lcyB0aGF0IGhhdmUg
b24gdGhlIHJlcHJvZHVjaWJpbGl0eSBvZgp0aGUgdmVuZG9yZWQgYXJjaGl2ZT8gQW5kIHNvLCB3
aGF0IGFib3V0IHRoZSBoYXNoZXMgbWFhbmdlZCBieQpCdWlsZHJvb3Q/CgoKV2UgYWxzbyByZXF1
aXJlIHRoYXQgc3VibWlzc2lvbnMgaW5jbHVkZSBhIHNpZ24tb2ZmIHRhZywgbWF0Y2hpbmcgdGhl
CnJlYWwgaWRlbnRpdHkuCgpQbGVhc2Ugc2VlOwogICAgaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rv
d25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjc3VibWl0dGluZy1wYXRjaGVzCgo+IC0tLQo+ICBw
YWNrYWdlL3BrZy1nb2xhbmcubWsgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdvbGFu
Zy5tayBiL3BhY2thZ2UvcGtnLWdvbGFuZy5tawo+IGluZGV4IDBiM2RjM2QzMmYuLmNkYzY3YjMy
YzAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4gKysrIGIvcGFja2FnZS9w
a2ctZ29sYW5nLm1rCj4gQEAgLTg3LDcgKzg3LDggQEAgJCgyKV9QT1NUX1BBVENIX0hPT0tTICs9
ICQoMilfR0VOX0dPTU9ECj4gICQoMilfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gZ28KPiAgJCgy
KV9ETF9FTlYgKz0gXAo+ICAJJCQoSE9TVF9HT19DT01NT05fRU5WKSBcCj4gLQlHT1BST1hZPWRp
cmVjdAo+ICsJR09QUk9YWT1kaXJlY3QgXAo+ICsJJCQoJCgyKV9HT19FTlYpCgpDdXJyZW50bHks
IHdlIGhhdmUgdHdvIHBhY2thZ2VzIHRoYXQgc2V0IF9HT19FTlY6CgogIC0gZG9ja2VyLWNsaTog
SSBkb24ndCB0aGluayB0aGlzIHdvdWxkIGhhdmUgYW4gaW1wYWN0IG9tbiB0aGUgZG93bmxvYWQK
ICAgIHN0ZXAgYW5kIHRoZSB2ZW5kb3Jpbmc6CiAgICAgICAgRE9DS0VSX0NMSV9HT19FTlYgPSBD
R09fRU5CQUxFRD1ubwoKICAtIG1lbmRlci1hcnRpZmFjdHM6IHRoZXJlIHdlIGRvIGVjcGxpY2l0
bHkgcmVmZXIgdG8gYW4gaW5jb25zaXN0ZW5jeQogICAgYWJvdXQgdGhlIHZlbmRvcmluZzoKICAg
ICAgICBIT1NUX01FTkRFUl9BUlRJRkFDVF9HT19FTlYgPSBHT0ZMQUdTPSItbW9kPXZlbmRvciIK
CiAgICBzbyBJIHdvbmRlciBob3cgdGhhdCB3b3VsZCBwbGF5IHdoZW4gd2UgYWxzbyBwYXNzIHRo
aXMgZHVyaW5nIHRoZQogICAgdmVuZG9yaW5nIHN0ZXAuIEkgaG9wZSB0aGF0IGl0IHdvdWxkIGhh
dmUgbm8gZWZmZWN0LCBiZWNhdXNlCiAgICAndmVuZG9yJyBpcyBhY3R1YWxseSB0aGUgcGF0aCB3
aGVyZSB0aGUgdmVuZG9yaW5nIGhhcHBlbnMuCgpEaWQgeW91IGNoZWNrIGlmIHRoZXkgd2VyZSBp
bXBhY3RlZCBieSB0aGlzIGNoYW5nZT8KCkJhcnJpbmcgYW55IGlzc3VlIHdpdGggdGhlIGFib3Zl
IHF1ZXN0aW9ucywgSSB0aGluayB0aGlzIGlzIGEgZ29vZApjaGFuZ2UuIFBsZWFzZSByZXNwaW4g
d2l0aCB5b3VyIHJlYWwgaWRlbnRpdHksIGEgcHJvcGVyIHNpZ24tb2ZmIHRhZy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+ICAjIER1ZSB0byB2ZW5kb3JpbmcsIGl0IGlzIHByZXR0eSBsaWtl
bHkgdGhhdCBub3QgYWxsIGxpY2Vuc2VzIGFyZQo+ICAjIGxpc3RlZCBpbiA8cGtnPl9MSUNFTlNF
Lgo+IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
