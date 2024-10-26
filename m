Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C8DD10BF5
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 09:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C6A81F7C;
	Sat, 26 Oct 2024 09:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCHr-RwxavKe; Sat, 26 Oct 2024 09:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6088F81FB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6088F81FB9;
	Sat, 26 Oct 2024 09:59:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B0312318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8452640873
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7-4VfCxtKHJ for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 09:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2024040665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2024040665
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2024040665
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:59:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 94ECA2003B4;
 Sat, 26 Oct 2024 11:59:44 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49846])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Oct 2024 11:59:44 +0200
MIME-Version: 1.0
Date: Sat, 26 Oct 2024 11:59:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Raimundo Sagarzazu <rai.sagarzazu@outlook.com>
Cc: buildroot@buildroot.org
In-Reply-To: <DU0P251MB0801A93E7F9B025DA4AF40CEFA762@DU0P251MB0801.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB0801A93E7F9B025DA4AF40CEFA762@DU0P251MB0801.EURP251.PROD.OUTLOOK.COM>
User-Agent: Webmail Free/1.6.9
Message-ID: <d91c44ed7beb7026f445ff10fa5af5f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729936785;
 bh=GU4DZMbADeMleu3AyX+pJbhf1cQwL7k6QEPOvTqBH5Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n7/tJF18qWRyIM25cQGK/7wkqbJvyshsZRjgtg0tAJMZWsnvVwoXYU2HdiPLMZzfk
 yuVACCjs22m7ff3rrsgWXKRKU61rCUQQpvKExX+mcEttQNnwYixgXItNLqSqQazifR
 CRH3TFNYo4pxKl7rXXEP3ayogiqXZDRn/buYjE985/jAu8OW4whrDy41+kZr+MgPv1
 Vo7eUDpB2CqIF6PyvM5kuq3+G8jF7QH8Ls2uKSqLDc1GkAa5nDAAKjt3e+hDRN5PVo
 4JI3/BDAbHW/aREKzmc+bTRifncbr15twhBBHWwu2hUQCJAoSTPbugyWTqW9c7yw3n
 2ObxGaubLr3Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n7/tJF18
Subject: Re: [Buildroot] package/jailhouse: small typo error when installing
 helper scripts
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUmFpbXVuZG8sCgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKClRoZSBtYWlsIGFuZCBwYXRjaCB3
YXMgbm90IGNvcnJlY3RseSBmb3JtYXR0ZWQgYW5kIGNvdWxkIG5vdCBiZQphcHBsaWVkIGFzIGlz
LiBGb3J0dW5hdGVseSwgdGhlIHBhdGNoIHdhcyBzaW1wbGUgZW5vdWdoIHNvIEkgY291bGQKcmVm
b3JtYXQgaXQgbXlzZWxmLgoKU28gSSBhcHBsaWVkIGl0IHRvIG1hc3Rlci4KCkZvciB5b3VyIGZ1
dHVyZSBjb250cmlidXRpb25zLCBwbGVhc2UgaGF2ZSBhIGxvb2sgdG8gdGhlIEJ1aWxkcm9vdApt
YW51YWw6Cmh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1s
I3N1Ym1pdHRpbmctcGF0Y2hlcwoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgoKT24gMzAvMDkvMjAy
NCAxNTo0MiwgUmFpbXVuZG8gU2FnYXJ6YXp1IHdyb3RlOgo+IC0tLQo+IAo+ICBkaWZmIC1ydXAg
YS9wYWNrYWdlL2phaWxob3VzZS9qYWlsaG91c2UubWsKPiBiL3BhY2thZ2UvamFpbGhvdXNlL2ph
aWxob3VzZS5tawo+ICAtLS0gYS9wYWNrYWdlL2phaWxob3VzZS9qYWlsaG91c2UubWvigILigILi
gILigILigILigIIyMDI0LTA5LTI3Cj4gMTc6MDc6MTMuMzI1NjczMzc2ICswMjAwCj4gICsrKyBi
L3BhY2thZ2UvamFpbGhvdXNlL2phaWxob3VzZS5ta+KAguKAguKAguKAguKAguKAgjIwMjQtMDkt
MzAKPiAwOTowMzozNi45OTgzNTA3OTAgKzAyMDAKPiAgQEAgLTYzLDcgKzYzLDcgQEAgZGVmaW5l
IEpBSUxIT1VTRV9JTlNUQUxMX0hFTFBFUl9TQ1JJUFRTCj4gICDigILigILigILigILigIIkKEhP
U1RfRElSKS9iaW4vcHl0aG9uIHNldHVwLnB5IFwKPiAgIOKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAgmluc3RhbGwgLS1uby1jb21waWxlIFwKPiAKPiDigILigILigILigILigILigILi
gILigILigILigILigIIkKFBLR19QWVRIT05fU0VUVVBUT09MU19JTlNUQUxMX09QVFMpCj4gXAo+
ICAt4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLS1yb290PSQoVEFSR0VUX0RJUikp
Cj4gICvigILigILigILigILigILigILigILigILigILigILigIItLXJvb3Q9JChUQVJHRVRfRElS
KQo+ICAgZW5kZWYKPiAgIGVuZGlmCj4gCj4gLS0tCj4gCj4gICAgUmFpLgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
