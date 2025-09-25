Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E99CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 22:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD72418F8;
	Thu, 25 Sep 2025 22:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZKY4-q0yPyq; Thu, 25 Sep 2025 22:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62126418FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62126418FC;
	Thu, 25 Sep 2025 22:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6955198
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 22:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 857EB40366
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 22:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBshIP1I87bx for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 22:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 705FD41218
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 705FD41218
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 705FD41218
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 22:35:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4E7CF78035E;
 Fri, 26 Sep 2025 00:35:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 00:35:07 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 00:35:07 +0200
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <ef9e822c-c964-4fac-a733-d6b3c3475a96@kaod.org>
References: <20250923135223.1062683-1-clg@kaod.org>
 <8d3ee63fa1e851699b49b789cfb5da9e@free.fr>
 <ef9e822c-c964-4fac-a733-d6b3c3475a96@kaod.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <1284dccbdab018e63be2f2da03229e35@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758839709;
 bh=dEadkQdzToRkdopFs0+OS25nrpwKHt2cmCcX7z5XQGc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JAKjv3Hs6qJ8yEdzAUYHZc9FXDxFLaBU/zUZt1oXG8PI+AZ1sHNvlxpIlm32xuONd
 lHQgeQfLLeeT0amMWfyoPLImg4BslGePomGXD5rIoihsUAxgNU+AxugeiQHFUkgEAq
 Y7Yqx+Cyzpb2Do9yLW2o8edAuY56f0aHxM3TGQ0s0ZgttfeJtCIfnD79Rk/Oj/LSJo
 OHLMRZ1QA2eoll0DtpFyGkQ7oQEnPmp/q0+dTe7yaUAQ6+iHYFfmq0if5sVH2DuHMy
 Qv3iO8dseW5iaVG2TWDb11BcYbP2P3i4FT9vgpAdT0OSTZqOYUubt9qUtD+/xw5wyy
 e45gt76QHCTnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JAKjv3Hs
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed_ast2500evb: check hashes,
 use bootlin toolchain
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

T24gMjUvMDkvMjAyNSAyMzoxOCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4gT24gOS8yNS8y
NSAyMTo0MiwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4+IEhpIEPDqWRyaWMsIEpvZWwsIEFsbCwK
Pj4gCj4+IE9uIDIzLzA5LzIwMjUgMTU6NTIsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOgo+Pj4g
VGhpcyBjb21taXQgYWRkcyBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkgYW5kCj4+
PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQVJNVjZfRUFCSUhGX0dMSUJDX1NUQUJM
RT15IGluIHRoZQo+Pj4gZGVmY29uZmlnLCBidW1wcyBrZXJuZWwgdG8gNi4xNi43LCBhbmQgYWRk
cyBjdXN0b20gaGFzaCBmaWxlcyBhbmQKPj4+IHJlbW92ZXMgdGhlIGV4Y2VwdGlvbiBlbnRyeSBp
biAuY2hlY2twYWNrYWdlaWdub3JlLgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExl
IEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+Pj4gLS0tCj4+IFsuLi5dCj4+PiBkaWZmIC0tZ2l0IGEv
Y29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25maWcgCj4+PiBiL2NvbmZpZ3MvYXNwZWVk
X2FzdDI1MDBldmJfZGVmY29uZmlnCj4+PiBpbmRleCA2NDY2NmNjM2Q3MDQuLmNhNmExZWYzZDM4
ZSAxMDA2NDQKPj4+IC0tLSBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnCj4+
PiArKysgYi9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwo+Pj4gQEAgLTEsMTIg
KzEsMTYgQEAKPj4+IMKgQlIyX2FybT15Cj4+PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFE
RVJTX0NVU1RPTV82XzE2PXkKPj4+ICtCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPj4+ICtCUjJf
VE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQo+Pj4gK0JSMl9UT09MQ0hBSU5fRVhURVJOQUxf
Qk9PVExJTl9BUk1WNl9FQUJJSEZfR0xJQkNfU1RBQkxFPXkKPj4gCj4+IFRoaXMgcGF0Y2ggaW50
cm9kdWNlcyBhIGNoZWNrIGZhaWx1cmUuIFNlZToKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTQ4MTIzODM0MQo+PiAKPj4gV0FSTjogZGVmY29u
ZmlnIC4vY29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25maWcgY2FuJ3QgYmUgdXNlZDoK
Pj4gIMKgwqDCoMKgwqAgTWlzc2luZzogCj4+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJ
Tl9BUk1WNl9FQUJJSEZfR0xJQkNfU1RBQkxFPXkKPj4gCj4+IFRoaXMgZGVmY29uZmlnIGRvZXMg
bm90IHNlbGVjdCBhbnkgQ1BVLCBzbyBpdCBkZWZhdWx0cyB0bzoKPj4gQlIyX2FybTkyNnQ9eQo+
PiAKPj4gQWNjb3JkaW5nIHRvIHRoZSBLZXJuZWwgZHRzOgo+PiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L3RyZWUvYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkL2FzcGVlZC1nNS5kdHNpP2g9djYuMTYuNyNuNDAKPj4gCj4+IENw
dSBzZWVtcyB0byBiZSAiYXJtMTE3Nmp6Zi1zIi4KPiAKPiBpdCBpcy4KPiAKPj4gCj4+IEluIHRo
YXQgY2FzZSwgdGhpcyBkZWZjb25maWcgc2hvdWxkIGFkZDoKPj4gQlIyX2FybTExNzZqemZfcz15
Cj4gCj4gb2sKPiAKPj4gQ291bGQgeW91IGNvbmZpcm0gaXQgaXMgdGhlIGNhc2UgYW5kIHNlbmQg
YSBwYXRjaCBmaXhpbmcgdGhlIGlzc3VlLAo+PiBwbGVhc2U/Cj4gCj4gV2lsbCBkby4gSG93IGNv
bWUgSSBkaWRuJ3Qgc2VlIGFueSBidWlsZCBmYWlsdXJlcyA/CgpUaGlzIGlzIGJlY2F1c2UgdGhl
IENJIGlzIHVzaW5nIHRoZSBjb21tYW5kczoKCiAgICAgbWFrZSBhc3BlZWRfYXN0MjUwMGV2Yl9k
ZWZjb25maWcKICAgICAuL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1kb3Rjb25maWcucHkgLmNvbmZp
ZyAKLi9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwogICAgIG1ha2UKCldpdGhv
dXQgdGhlIGNoZWNrLWRvdGNvbmZpZy5weSwgdGhlIGNvbmZpZyBtb3N0IGxpa2VseSBmYWxsYmFj
ayB0bwphbm90aGVyIGFybTkyNiBjb21wYXRpYmxlIHRvb2xjaGFpbiwgc3VjaCBhczoKQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY1X0VBQklfR0xJQkNfQkxFRURJTkdfRURHRT15
Cgo+IAo+IFRoYW5rcywKPiAKPiBDLgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
