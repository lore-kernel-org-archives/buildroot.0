Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08A6CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 20:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B04DB60BB9;
	Sat, 11 Oct 2025 20:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nWNIu022QAj; Sat, 11 Oct 2025 20:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC25B60BB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC25B60BB2;
	Sat, 11 Oct 2025 20:35:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E9CBC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4399740A5C
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUAcaSXZGuwJ for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 20:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D3D94056D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3D94056D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D3D94056D
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:35:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F27162003C3;
 Sat, 11 Oct 2025 22:35:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Oct 2025 22:35:07 +0200
MIME-Version: 1.0
Date: Sat, 11 Oct 2025 22:35:07 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Titouan Christophe
 <titouan.christophe@mind.be>, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20251010072918.1691501-1-vincent.stehle@arm.com>
References: <20251010072918.1691501-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3ab60abf2771e00062ee8baf20872b35@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760214911;
 bh=afLozdM78CMcyzQYBzb+lqBeCMtTBx2kwtLpZgA732E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fZcA0T76G4bjjSCNyWc6TNeRn1+hgiPUnZDPQw9y7Mce0bWJBkJM1TV5N7aGOZwDs
 aI2JqK3Q+eAIqlQzjwPhbksYFBzGPF6p/lnU5d57EA8nwp4iiOU1dVUWGWHFWqKzIf
 lKUVgaQplNJn6ARsfnRLdG7icXZh5XdOzKedJpg6RveJE/e+OCVbkn88wZWHN9nyvl
 WtIehWchDsZLTrOrAQsvgrtYezs/GIFyHQ8+0vpeGmHmDwsxj+mbWy87clOs+TD4dQ
 K2j0ICgbzxtEgE3nCEJmmUATWPIY8Wu47sxKYQqmPEGBRQLBaQlKU1+NL6Cp+GrWsN
 xgIsvEYJDZlaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fZcA0T76
Subject: Re: [Buildroot] [PATCH] support/testing: test_xen: add networking
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

SGkgVmluY2VudCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKT24gMTAvMTAvMjAyNSAwOToyOSwg
VmluY2VudCBTdGVobMOpIHdyb3RlOgo+IEVuaGFuY2UgdGhlIFhlbiBweXRob24gdGVzdHMgdG8g
ZXhlcmNpc2UgbmV0d29ya2luZzoKPiAKPiAtIEFkZCB0aGUgbmV0d29ya2luZyBzdXBwb3J0IHdl
IG5lZWQgdG8gdGhlIExpbnV4IGtlcm5lbCAKPiBjb25maWd1cmF0aW9ucy4KPiAtIEFkZCBhIHZp
cnR1YWwgbmV0d29yayBpbnRlcmZhY2UgdG8gdGhlIFhlbiBkb20xIGNvbmZpZ3VyYXRpb25zLgo+
IC0gVXBkYXRlIHRoZSB0ZXN0IGluIHRoZSBmb2xsb3dpbmcgd2F5Ogo+ICAgKiBTdGFydCB0aGUg
ZW11bGF0b3Igd2l0aCByZXN0cmljdGVkIG5ldHdvcmtpbmcuCj4gICAqIENyZWF0ZSBhIG5ldHdv
cmsgYnJpZGdlIGluIGRvbTAuCj4gICAqIENoZWNrIHRoYXQgbmV0d29ya2luZyBpcyBmdW5jdGlv
bmFsIGluIGJvdGggZG9tYWlucyBieSBwaW5nJ2luZyB0aGUKPiAgICAgZ2F0ZXdheS4KPiAgIChS
ZWZlciBhbHNvIHRvIHRoZSBkaWFncmFtIGluIHRoZSBweXRob24gc2NyaXB0LikKPiAtIFdoaWxl
IGF0IGl0LCBidW1wIExpbnV4IGtlcm5lbCB0byA2LjE3LjEgYW5kIFUtQm9vdCB0byAyMDI1LjA3
Lgo+ICAgV2UgYWxzbyBuZWVkIHRvIGFkanVzdCB0aGUgRFRCIGFkZHJlc3MgaW4gdGhlIEFybSAz
MmIgVS1Cb290IHNjcmlwdCAKPiB0bwo+ICAgYWNjb21tb2RhdGUgdGhlIG5ldyBVLUJvb3QgdmVy
c2lvbiwgd2hpY2ggZG9lcyBub3QgaGF2ZSBlbm91Z2ggZnJlZSAKPiBzcGFjZQo+ICAgYXJvdW5k
IHRoZSBjb250cm9sIERUQiBhbnltb3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KCkZvciBzb21lIHJlYXNvbiwgdGhlIFRlc3RY
ZW5Bcm12NyBydW50aW1lIHRlc3QgaXMgZmFpbGluZyBpbiB0aGUKcmVmZXJlbmNlIEJ1aWxkcm9v
dCBEb2NrZXIgaW1hZ2UuIEkgdGVzdGVkIHdpdGggdGhlIGNvbW1hbmQ6CgogICAgIHV0aWxzL2Rv
Y2tlci1ydW4gc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCiAgICAgICAgIC1rIC1kIGRsIC1v
IG91dHB1dF9mb2xkZXIgXAogICAgICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVuCgpUaGUgZmls
ZSBvdXRwdXRfZm9sZGVyL1Rlc3RYZW5Bcm12Ny1ydW4ubG9nIGVuZHMgd2l0aDoKCglbQlJURVNU
IyB1ZGhjcGMgLWkgZXRoMAoJdWRoY3BjOiBzdGFydGVkLCB2MS4zNy4wCgl1ZGhjcGM6IGJyb2Fk
Y2FzdGluZyBkaXNjb3ZlcgoJdWRoY3BjOiBicm9hZGNhc3RpbmcgZGlzY292ZXIKClN0cmFuZ2Vs
eSwgdGhlIFRlc3RYZW5BYXJjaDY0IGlzIHBhc3NpbmcgaW4gdGhlIEJ1aWxkIERvY2tlciBpbWFn
ZS4KCkkgaW5pdGlhbGx5IHRob3VnaHQgaXQgd2FzIGEgdGltaW5nIGlzc3VlLCBidXQgSSB0ZXN0
ZWQgc2V2ZXJhbCB0aW1lcwphbmQgSSBjb25zaXN0ZW50bHkgZ290IHRoZSBzYW1lIHJlc3VsdC4K
CkJvdGggdGVzdHMgYXJlIHBhc3Npbmcgb24gYSBGZWRvcmEgNDIgaG9zdCB3aXRoIHFlbXUgOS4y
LjQuCgpUaGUgQnVpbGRyb290IERvY2tlciBpbWFnZSBoYXMgYW4gIm9sZCIgcWVtdSA3LjIuMTUu
IFNlZSB0aGUgY29tbWFuZDoKCiAgICAgdXRpbHMvZG9ja2VyLXJ1biBxZW11LXN5c3RlbS1hcm0g
LS12ZXJzaW9uCgp3aGljaCBvdXRwdXQ6CgogICAgIFFFTVUgZW11bGF0b3IgdmVyc2lvbiA3LjIu
MTUgKERlYmlhbiAxOjcuMitkZnNnLTcrZGViMTJ1MTIpCgpJIHRlc3RlZCBieSBhZGRpbmcgaW4g
dGhlIHRlc3QgY29uZmlnOgoKICAgICBCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQogICAgIEJSMl9Q
QUNLQUdFX0hPU1RfUUVNVV9TWVNURU1fTU9ERT15CgppbiBvcmRlciB0byBjb21waWxlIGEgbW9y
ZSByZWNlbnQgcWVtdSAxMC4xLjAuIFRoaXMgc2VlbXMgdG8Kc29sdmUgb3Igd29ya2Fyb3VuZCB0
aGUgaXNzdWUuCgpGb3IgdGhlIG1vbWVudCwgSSBjYW5ub3QgdGVsbCBpZiBpdCdzIGEgbmV0d29y
ayBlbXVsYXRpb24gYnVnIGluCnRoZSBvbGQgcWVtdSAod2hpY2ggaW4gdGhhdCBjYXNlIHRoZSB0
ZXN0IG5lZWRzIHRvIGNvbXBpbGUgdGhlIG5ld2VyCnFlbXUpLCBvciBpZiBpdCdzIGEgdGltaW5n
IGlzc3VlIGluIHRoZSB0ZXN0IChpLmUuIHRoZSB0ZXN0Cm1pZ2h0IG5lZWQgdG8gd2FpdCBhIGJp
dCBzb21ld2hlcmUgdG8gbGV0IHRoZSBicmlkZ2Ugc2V0dGxlKS4KCkNvdWxkIHlvdSBoYXZlIGEg
bG9vayBwbGVhc2UgYW5kIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBhZGRyZXNzaW5nCnRoaXMgaXNz
dWUsIHBsZWFzZT8KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
