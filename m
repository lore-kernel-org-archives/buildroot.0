Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D65EC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5035606EF;
	Tue, 22 Sep 2026 10:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb82WQl17NIX; Tue, 22 Sep 2026 10:04:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8637560656
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790071451;
	b=BlA4kDsJ16auv38AAzljZJpKBlpLUEz+w8qq5Tg6IJwlw5XoNq5vD+ka81ywne0UA0yC
	 Nad/0xyK1NXsIHrtB82oFQ7+m7NW/CDrro4TVifekzpYRCcQWerxIOk1mt16wc7/NHNFf
	 LnepejS4bNbSX/B+Emk+VJ/Gi7qNQ6xHZXsi1UesS2U5tNIAnIDVsX1bK1Iwo+Mt6cLF0
	 b1IHm9Tv7q/emobUR+djfJW8m/XDbZjxmm31do8TR9TDxaixwi62tHCbSPfZQ+cOegmvm
	 ib/c+pdTU3NLotpTvnNbzsyKF8TgFGTA3lwsaLH2YiJOhZIKDcFUZ4ooEBhr66syB7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790071451;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:Mime-Version:Date:Message-Id:References:Cc:
	 In-Reply-To:To:X-Mailer:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=szh8Jmv+nLQrrltkzNEma/GmSzilsxa7+is0zCxdag8=;
	b=cTkkyD3hf4uUaPJO59uKWz/HLmJBkXrzyMkBgSgEJ+p5G9gK+Swmoxgbz5E0zLYXDBMp
	 FV6qdZ3uk55jGHcNicYnG0qRiBYlhFqwzRckf5MuxJRQul/b45AJRusJE0jHZDTjThR9S
	 OG9MoIMy6zf9OemD5e9dRoGvlDXo7AOtjBa4huN6Q1tLyA2mFsvSw3WLj3pGuQ+kH+AFE
	 MOYoD3RUymBluEstbZddocxXL4FKvRT01HTCbKIoL+JnGGPQmS0ycDaIeKtU3S5RauOOx
	 keDUOkp6zGu4NOdqaU33jTHQxR1OIdnJ9e9voqKJZ4pCzvr8KCeoVjJc3HTHex4Qnbw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790071451;
	bh=szh8Jmv+nLQrrltkzNEma/GmSzilsxa7+is0zCxdag8=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VeoFhN8+nfgvTg7siZM0sKApRCz8pAH0xdw8mj8rl/nHlFw81WxDnxX0/+wmM18SA
	 OEwaKd9KkOUlw2wBl/Po1W1PG6FrTsfp0mXTqZYsmSU55cfyDtrLbJnjXMYTPMQzOd
	 yqWX4WUvhj/3Al0wTwKN1H5i/4Ty+OPzDxPSXbpFfQjAYelWS44guEbxHgw9FNvuPC
	 DQ6TBjWLM+qKycHtCThZxQAaKVHStHQlMiMaano/xn2/K6d6JGYWQ2hBTrsKvgyhOw
	 PspvD5fO12G221zFG6UqDu5I02WjGQCN/flmdIEu+zXm1aPAGcNeYyqAYsOZ4J1WgP
	 PuVIgMWLGIeTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8637560656;
	Tue, 22 Sep 2026 10:04:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE0FCA20
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3AC440194
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1wH3qjX71ZD for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:04:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D6C3D400F6
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.147
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790071448;
 b=k7TyMvWg6yLiBNhZk2g/O6psVOVXvbVuEh0uZZNXvNZ7WxapMkmRgjqqcuDw8Vf3z2dw
 9S0vTTM+j/HFujHkoPMo28+e97cEuXcjaxx9EdijCUPDBJwrRG7m9U6RpaRH+QlkRaoho
 2G7vqw8Y9+2quE+B2LQUpBUrE4Ad3U+qJJa+sd7LeAXzSTKFoykJgyal7cCw22JrlY7Qu
 9zqmbRLgjkLzUz2YZUhuhj2rj5rjyd01icYv1IXspZwcI+jENizJvdlwrtNGS3sc2Vyrr
 58Kpi0IMYO1Fj04lDZ27BdyTe0yPonWT15l+qTkUnAxBXC2/epS9xbbsD9eMq8PIkVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790071448;
 h=Received-SPF:Received:DKIM-Signature:Content-Type:
 Content-Transfer-Encoding:From:Mime-Version:Subject:Date:Message-Id:
 References:Cc:In-Reply-To:To:X-Mailer:X-CMAE-Envelope;
 bh=Dwy99ivfBCWFz2w9hdkz+iBfAXnrup4Ts4CyYHv+dio=;
 b=S7ShSHCLpsBcHPMUjKUVP7DOz/3JuFhLeUOIW4AhyvB0rch7fQnCh49CzwlCWue/FsJf
 nb6pG/pvSeqWz3zKCcK8Xr2i48c5zXJ/wv9Iy68QrbL7gTErgF1dwdklwWhDNmdilGxo+
 +/7vq72mVSA2PrFJ24cscXpV0KvLAV4ZdLcHn/S9PgFH9OGPa83I6gh6jQcCRHFhmawcb
 qdS9Mx+s57QIhMNT5TbG/OIGCJUakCtotgcQnNqQW6o3h0PtE/3tePltofYH1eOnH/vdL
 qqN5U+SDx7NBVVImfykICiakyDcR+7U7oOJ/ZUH/TaH9EEb5DgrI+hb5Mn4H14JowIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=ivqSZ+o4; 
 arc=none smtp.remote-ip=62.149.158.147
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ivqSZ+o4
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6C3D400F6
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:04:06 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 8xM4xoJb73L3z8xM4xt11a; Tue, 22 Sep 2026 12:04:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790071444; bh=eb/7+LnZoarWEZGHmmWhR5ITrNJQs7dI7+/iA5ghfd0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ivqSZ+o47lwTs2+AAEkcNe86QNIPXOd/8DJHI87WoDMAVNKEpextyPzQxlsTQOUmX
 6l3oZE9aXI4Dpok/lhjObbLqyKLUt4VlnEtUdObW790XUyVliy3hy1awcQ1AMd5ptu
 vmhATAZOV1nFUD/SLk3xn/A5aJ3SkfbfuTAHumXnuGWErsYb1hLRAZAYV3MglCs3ur
 h2cVGvwU2MSRnjyalqUtpaVgUSiHB6Eze4ghUQb7osS0uDv34aCIBuHlxxm2HIPhwe
 ZKA2fYz5i3vKqE4vx6MzZ9LlRIQmJCncoc1+eTESCHCXqnfJBbd0/4xyzu0D7fqFQI
 GU86Y2KCogS5Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 22 Sep 2026 12:04:03 +0200
Message-Id: <F90B6066-54B5-4CD7-8F7B-2AC0C2562524@benettiengineering.com>
References: <8733v1r4nq.fsf@tarshish>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <8733v1r4nq.fsf@tarshish>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailer: iPhone Mail (24A437)
X-CMAE-Envelope: MS4xfIS2vO/amGH+IhwIV5QY3+m4jhp7zQhu6rGvgOKr0cn7vyd1y13773IoiPaArydSJ8m8Lz5lgI6QF0UMN6Sm4RNOL5n4mknbxhqxMZZEJ9DHLDPtqf9e
 SFUjXftnhURfP2MyC5WjxVkrwbM4y4jiiQBGI84VX5P4X5nXuFNo/gSi74rA8DjTJEy/volYl9aEXElfrjEog2efuwgvC10CY15O6xpZ69/8bOX75kADYmS7
 YQ2QSmBmzNWu1ryXVF5vgnx9e9QKFeAt2TAwVD9FLF0=
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 3.3.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDIyIHNldCAyMDI2LCBhbGxlIG9yZSAxMTo1NSwgQmFydWNoIFNpYWNoIDxi
YXJ1Y2hAdGtvcy5jby5pbD4gaGEgc2NyaXR0bzoKPiAKPiDvu79IaSBHaXVsaW8sCj4gCj4+IE9u
IFR1ZSwgU2VwIDIyIDIwMjYsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBSZW1vdmUgcGF0Y2hl
cyB1cHN0cmVhbWVkIGluIHRoaXMgcmVsZWFzZS4KPj4gCj4+IFJlbGVhc2UgYW5ub3VuY2U6Cj4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW5mcy81NzE3YTgwMy04MDVjLTQwOWYtYTlj
Yy1kMGMzM2EzNjU1NzBAcmVkaGF0LmNvbS8KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPiAK
PiBbLi4uXQo+IAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1r
IGIvcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1rCj4+IGluZGV4IDZlMGZiMWEwNGMuLjM5
NTliOTBjYzIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tawo+
PiArKysgYi9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsKPj4gQEAgLTQsMTAgKzQsMTAg
QEAKPj4gIwo+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiAKPj4gLU5GU19VVElMU19WRVJT
SU9OID0gMi45LjIKPj4gK05GU19VVElMU19WRVJTSU9OID0gMy4xLjEKPj4gTkZTX1VUSUxTX1NP
VVJDRSA9IG5mcy11dGlscy0kKE5GU19VVElMU19WRVJTSU9OKS50YXIueHoKPj4gTkZTX1VUSUxT
X1NJVEUgPSBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC91dGlscy9uZnMtdXRpbHMv
JChORlNfVVRJTFNfVkVSU0lPTikKPj4gLU5GU19VVElMU19MSUNFTlNFID0gR1BMLTIuMCsKPj4g
K05GU19VVElMU19MSUNFTlNFID0gR1BMLTIuMCtxCj4gCj4gVGhpcyBkb2Vzbid0IGxvb2sgbGlr
ZSBhIHZhbGlkIGxpY2Vuc2UgaWRlbnRpZmllci4KCk9oLCB0aGF04oCZcyBhIHR5cG8uIFRoYW5r
cyBmb3IgcG9pbnRpbmcgQmFydWNoLgpJ4oCZbSBnb2luZyB0byBzZW5kIFYyLgoKQmVzdCByZWdh
cmRzCgo+IAo+IGJhcnVjaAo+IAo+PiBORlNfVVRJTFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcK
Pj4gTkZTX1VUSUxTX0RFUEVOREVOQ0lFUyA9IGhvc3QtbmZzLXV0aWxzIGhvc3QtcGtnY29uZiBs
aWJldmVudCBsaWJubCBsaWJ0aXJwYyBzcWxpdGUgdXRpbC1saW51eAo+PiBORlNfVVRJTFNfQ1BF
X0lEX1ZFTkRPUiA9IGxpbnV4LW5mcwo+IAo+IC0tCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj4gPX0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9v
by0tLS0tLS0tLS0tLXs9Cj4gICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2
OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
